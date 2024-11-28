Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1562D690ED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfTWT4ik8XD4bNiPuwD6pQiAb8Xu47Lvc8mfoOP/mIg=; b=Pwt1iNdFadNDD+
	JX65UJEFpD0e8LsR994yiUbAQemaHWIQj1mYpNArP+esnE5pX6u9HfWokKRYqhFLBUYGnCKsNz582
	/mc2IV8GnYHqKPJhTL7yqz/t/qSf/3U+tk+J1PdmHzvmdBPen497yL2rX52UtGU43Wjy++6H57xXD
	E+SHVxv1r1sf2Ku1K/uTb+Sh7F3zkMmkLY8QMpjaBDvsZjZToiQiiTV7PJx+Q5Ba4QcnvyapMNusR
	FjqQZ5s18fOoKr82KGPjKMHdMcL64uW7EKoNvGQLLJYC7GznnpYkKx07vnAl+KMBMx7YMoCWM6ygQ
	7A0RudllFzv9OyagPEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaxK-0000000F9rb-0bqg;
	Thu, 28 Nov 2024 09:37:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZwk-0000000F0qg-2OK2
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:32:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43494a20379so4813805e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732782741; x=1733387541; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkmUTsVLQMvFKC/acbiNHMDNlfrO4VJGSOdTD+kFhvk=;
        b=Z19eL4/6nT7g9B3JbTVMcdYQwZ/fTc/yaTheToF8pR9pqPylIVQAdla8kKnPaa5i1P
         1Svp0sep6N3prywhc8G7ILrIGY6Pjod5jP2cFcpwtVfx2f4I55IGPcvzBU795jzs1Bt3
         NitiYHir4dUifN+PXy7U60FcQc845UTDhIchD/2a82Sarqs7i7QsnBOEfeGa4xhxrUl3
         /VfXKumtom+2s8uuyEpAMSQw2VnlzbjD6V0A2pfqJrt1EaM2q5IGfR62VK/ewr2VMwQ0
         JMduA5dy5jzajLtBRh7rRuU6S5Vu8SZ/ahny6LEF8JjWXTXnr41gM2wcyaVhRYrClmpW
         fKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782741; x=1733387541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkmUTsVLQMvFKC/acbiNHMDNlfrO4VJGSOdTD+kFhvk=;
        b=FUcvJCe7W7PGJZZVFwHBkaRlHwHegb78lAIJGvnYksJ/utMpLTgMy4wmQRMuayDsVk
         0MwHLobUCqkQCgC1hkSZWosQkWWFCqohinV2LmaSFElU7h4rQ78DOI+a0bjw1mSh5F8t
         3FAXZuwmKDJuvzWitq7rgONv4hIo+nLC6g03/5/Km76XvMWrq1xB79611dl8hR2wG8JV
         hmvmE6xOvs2seBMZbK9Sf27DODK8yt7t667Hb0efpbKPem0F1q1Fq7vHgeCJ8osGEN9g
         jt29xPLNIwQTXKI8vZvFQwmifACGEVDdrBRPEjLLjI1tBP4XUVWwWbNihYbpz/IWcAmI
         P2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX++yoBjvyDEIcUC/Fngeld1mjwudf01GJ7qPaUF1rDqjEM2FwSAJLDukWJnaXv6ygQM/3YjSfGkUscmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDaYJjIDVCdhnysAdSFIeD09hpp0k/qHwWizscnWAO2hfoWHhB
	L1siFPQbtiH6f3IP0dy7l2SloFc3z6eAWhR5KhM+ap38H7OOyTwa5lz6iETtaps=
X-Gm-Gg: ASbGncvifGfznEc3v9+e8Jqu8dnoUKD67lRinySi8nwGaG82bzf5qVcMyoxxkT80rVy
	nlmyzaadmFbFq7GMmHob938vzz5gVQJK8IpTT7uMzmyE05vEVa0B6teCzhNoAtT2c5O2EjSp7L8
	Rv7lICIZKf/KiY+A91E0dJdpDEYZYierQq+XPU0Nt7pcl4qX2/uqoH2o94F4CfOLu0zg+hLvSgk
	oKR+9CWIf7Y6X/96qumWbfY6SpqVJXS6eXAZF55KHuKxrjyhSqYZY3YFYkBAt80Sqm4jBcOmeWn
	NRxoy69UXZGsP7uIpgAIReJ67Vg97m90QjI=
X-Google-Smtp-Source: AGHT+IEwQd4MULG9+vfOa2qsE3UwH6o+SBFQmY81KWSmVFdtfK+f0e5Zt6kIK2SbhEhkH97nvavxlg==
X-Received: by 2002:a05:600c:46c9:b0:434:a4a6:51ee with SMTP id 5b1f17b1804b1-434a9dd0060mr63116095e9.16.1732782740536;
        Thu, 28 Nov 2024 00:32:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3729esm1033907f8f.44.2024.11.28.00.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:32:20 -0800 (PST)
Date: Thu, 28 Nov 2024 09:32:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: laokz <zhangkai@iscas.ac.cn>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2] riscv: module: use a plain variable for list_head
 instead of a pointer
Message-ID: <20241128-0e953467c518d79d12dbf202@orel>
References: <20241127142519.3038691-1-cleger@rivosinc.com>
 <980b98978ab4ee912b37cb101ad43bce20b56dcb.camel@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <980b98978ab4ee912b37cb101ad43bce20b56dcb.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_003222_610506_6FAA48AC 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 28, 2024 at 09:01:52AM +0800, laokz wrote:
> On Wed, 2024-11-27 at 15:25 +0100, Cl=E9ment L=E9ger wrote:
> > rel_head's list_head member, rel_entry, doesn't need to be allocated,
> > its storage can just be part of the allocated rel_head. Remove the
> =

> Oh my poor English. OK, it's more better than just add the lost kfree.
>

It wasn't the English I was correcting. That was fine, but just saying
the object could be "a plain variable" wasn't giving any justification
for the change and, to me, even implied that rel_entry was locally
scoped. So, when I first skimmed the patch and saw that it was getting
appended to a list, I almost stated the patch was wrong. It was clear
after looking closer, but it could have been clear the first time
through if the commit message had better guided me.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
