Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA14CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiBetKFLGa+BxvBh2PFMFGAiewAUnjw3ZF5jsZYHM3M=; b=niXm9jGTwQ43nT
	T9heFE2aD9EbEU1Fx6tl9a7ttnMjr5dcWqo8ISxFgyH1qIlUU6PcINbpz6O+6XBiYh3kr/5pGxuib
	f1l6XGU3o2rj8R/kXmIEHTjC656f7iF03PGt60EqN6fHcpAZuOMEAEONtLy9UqUZZt1ybHEr5r8hM
	0PKbF7MhdcPKV6XlR/M8RCn+rlABnoGBzhyBniWyROL76EAPKCzdHzXQrWkgkCEP8zOZsRXisXyRC
	H0h2BMEuwtoa7nz2o1nMaEYQJtKJ9lj1+kT/tIu0YM3GEIO5GQNQVLkE99yl3lfOfv9/hAUke14St
	Pg0x4U/Y/Hw6F1xGxz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sEn-00000006R9H-3KWA;
	Thu, 09 Oct 2025 15:07:25 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sEk-00000006R8N-3Utx
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 15:07:24 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-42d8ad71a51so11968285ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760022442; x=1760627242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4TtvWI8QVregvyp81pND6vyRfk4rrVoq0aKRbxqMrBM=;
        b=o61j3CrSaW6J69Vkhu3yu72/TF3GfIiRIco/6EfK53TLnGXRLW78xWe7K1oqDAUfnh
         JiTIM6sUahwzWVk+D2ZYhi2WKwsbC9NIuegTKmpLOdmSNrqJnyT8cMLcfppPGRwoLawT
         mzLAckLCtK48NqpRgbgYKXaJ7/Ua+9vcXUKZnTHHgl208JnYTywtc5cad67GUtS6DSIu
         yqUr3TD41BwLmDFIBDJrxs/PmcgmkdP1KNvg+F3ZWtBUk5jeYEtuulZr/Ez+jKJoihu6
         b1IfvlUYuiRjZUX9VqQBwD677LYXA4kjE1OsyUYROizVIblCkgjZGa7WiQ92898JsFar
         lxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022442; x=1760627242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TtvWI8QVregvyp81pND6vyRfk4rrVoq0aKRbxqMrBM=;
        b=q+hXNT0YoUV0Uov+z0zrJXa8eRdPvdexWnMjoMoCqHFDwwGR3J/CK5tPVEzJXpYnU9
         ks/TzBS5azy0xaB5Ar8zp119IVu7IX1TTwdWdDKPVjonN33/Y0VcZRMYzogcuKn+TeAP
         3W+//fgx+1p34KytyGiOWRVVTZujnETgSi37uP9JDasMCHOrgSL4uBXwUopfUWs7CQUD
         zHDm2N2r6sJQVqk8UV941osenReuYNQLiprQCZWFjlydn0TNh0kSsvWbj3RPqvBmVlMC
         wdjXVIxPBRSFM7GjzigoHvg7wzcLDGUq7vD+AXm2njcBwqV9KeKskZix/YuscMMTL4S9
         +QFw==
X-Forwarded-Encrypted: i=1; AJvYcCVct2UsCjjq6THbb5Z63HixHUXZuD60+tMkYvPc54q1mCYlgbIsKBMLam+4Esphf6did3gOFtIRrqHGPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqaqgUIAbNd2jdMpg+iz7/LxuGmzqfXcbDk2gWujkMbOEpIdPn
	bgQCwYQxtOE2BF0i/1NvxRCT/c2YwObLl5n30JkizVCbv9YfaImSbVUSO+DLIk9xtEU=
X-Gm-Gg: ASbGncvQe+u6LjK0n/60STXoowI06/GzzieEM7XXDn4lEwy66ScaKsQY3LFf5MaJYl0
	nvAfDtniCyAVFpoKqreNgr/TQR3nw0g1CtOt/SfsZqc4TTmxwcT7MCMtPxriG1LJHpowpDn0+Ip
	9QuXNaonY5Kq669MF6vRN5Nr/NYhA2C6vOB4kErJbqqNmJ9T1WREGYj0Dv/1HSZgh+wgEu35VrB
	Zu3nnlMh4Qw3CwY1VNaP/TG4zPpR1FgjHl9DR9nhbz27h9AdVlLTLYclhzUCdSFVAtQ1bqOgw69
	hIn1oAQiNquCiqpc8sEMo5Gst3+8jFGkqi9cmPWKbmPvsEpamRI3MAGyglCmoiDEOAqwTjUwaq6
	KueNrHuUuTdLMX39+CJZBOZuRGJc3HZmoiUevUzzwYHQQEQoV
X-Google-Smtp-Source: AGHT+IHllfD8+TIqEh28xOeZZvpA0cjE7v5iNDJGfcPLPbe/1iGoEvwumHb8HwcomRoEM6c4BgyNCA==
X-Received: by 2002:a05:6e02:1805:b0:42f:86a5:5dc1 with SMTP id e9e14a558f8ab-42f873460c2mr76922045ab.3.1760022441706;
        Thu, 09 Oct 2025 08:07:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ebc8400sm8178342173.42.2025.10.09.08.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:07:21 -0700 (PDT)
Date: Thu, 9 Oct 2025 10:07:20 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-ID: <20251009-6d003304ad031f2599cdb9c6@orel>
References: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com>
 <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org>
 <20251008-a966ea0e3d8bb6dbd85f6c6a@orel>
 <d9720a12-5efc-1be6-b4a7-7a8888b959a0@kernel.org>
 <abf80762-79ab-49ae-98ef-9a632cbad151@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abf80762-79ab-49ae-98ef-9a632cbad151@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_080722_878240_4C780854 
X-CRM114-Status: GOOD (  21.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 09, 2025 at 03:27:18PM +0800, BillXiang wrote:
> On 10/9/2025 4:37 AM, Paul Walmsley wrote:
> > Hi Drew,
> > 
> > On Wed, 8 Oct 2025, Andrew Jones wrote:
> > 
> >> On Wed, Oct 08, 2025 at 12:17:01PM -0600, Paul Walmsley wrote:
> >> ...
> >>> I do have some broader questions: is this patch really needed?  Is it
> >>> fixing anything that's broken?  These SBI constants aren't defined by the
> >>> kernel; they come from RISC-V standards.
> 
> Hi All,
> 
> Thanks for the review, and sorry for the noise my earlier mistake caused.
> Just to clarify the intent of this patch: these SBI constants are
> defined by the RISC-V spec, but they are implemented by kernel.
> IMO, for a userspace developer working on linux it's better to include
> this constants from kernel instead of define them again.
> If you don't like the patch, feel free to ignore it, nothing breaks
> either way.
> Additionally, the goodness of UAPI was described in[1].
> 
> [1] https://lwn.net/Articles/507794/

No one is arguing with the benefits of separate UAPI headers, but these
constants are not Linux UAPI. These constants are SBI. If anything,
there should be a header generator developed that takes the SBI spec as
input and creates headers which can be included into any project that
needs them, such as SBI firmwares, Linux, Xen, KVM VMMs, etc.. That
generator could also create Rust constants directly and prepare the
information for any other languages as well.

Thanks,
drew

> 
> >>
> >> Hi Paul,
> >>
> >> You're right that we don't want this patch. I hadn't noticed that the same
> >> patch was posted more than once or I would have nacked it here too. I
> >> replied to the other posting[1] a couple weeks ago.
> >>
> >> [1] https://lore.kernel.org/all/20250924-7e9764acec6722b5ef29ce7d@orel/
> > 
> > Thanks for the heads up and for the early review.  Patchwork didn't pick
> > up the thread for whatever reason beyond the initial patch, and I didn't
> > bother to check the mail archive...
> > 
> > 
> > - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
