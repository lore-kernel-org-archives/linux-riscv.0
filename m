Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B49CC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3QRbqtbHMcppG7Pzj458tkybUyPM5GrFfC4c0ECDFk=; b=GorkK00BDe9maY
	Hbtwdx+yTXIqMXX5mNWaFvDMB86Z0qq2+8HLy1vyUsMj6OfZqMRbFFNHPfeh0OdB6lNFhNcLVvBhW
	l6rTzBuQOeloFRnDAzfKhgveO/LdXV1ZgXomTAXoHV+gZdvBhkLtv80RTLHe0wxLeRwIpVkAi/B2l
	tsMICvqH1dcfLUcrPcNUQ+Q6h9dlys73tGY7iDoZTD+zNrI+1wEOlX7KtwM5DfjjR1ZCEyqA3jj8d
	OG88PxIzJ5MJDe8CoSKz02Ou3J35iNcoITmIsoJAK4fupZYCZQpe7b7lYRBIz7rHV1lhU8zjU0YW2
	i3AxF38CpYdf5L2ewjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pRc-00Efl9-2t; Wed, 07 Dec 2022 08:06:20 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pRZ-00Efao-C9
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 08:06:18 +0000
Received: by mail-pg1-x532.google.com with SMTP id f3so15613872pgc.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XdquHQi7NeKqSxeiFjUW2fxeM63S3wYNudDJTs5ka/I=;
        b=YnPCekdO7ZQMvJqfjISrBXD80eTFgn3TeTnSB9m7M6/qkkywTQOiSOYVaI3LvG4rjR
         SQ7nP30BxTBvoGvsRkE96FqHrc6c+vOCy0hdIlqpsLK4XTiheIKvr8idt+8cA/wcRr+I
         A6LIcSPv/RjOSIzZdbdqP0lXy5HziiVzaFVTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdquHQi7NeKqSxeiFjUW2fxeM63S3wYNudDJTs5ka/I=;
        b=PVTLWpqUFvvE7sb9YJNFsbZFv3MYG+t7XUA1sJcJY+5KwKJt/8BjESW1d3kVAPQV9o
         YxpYcYSYvtfIBU8KUS20Ifka4fcDwFo6c1ewgV0hBEqz2D47OxHFD/7tNgVLaXXE2y/+
         0vL94/tP9GCbyhZzCKrWgR2H56mHzrjhjA+EEpyi9JhDLAzpGjm1TyEz/FKVD09opBky
         aILWMEOgvqlzCDPN87Gx3OylHmIYS5KRPu1kCLZFa/v+6g/lvNXLkD3eLbcerLCYK5ZF
         vhnCdx5obh0AYDR4BftDJdd9J21LxSUqkpTgM3GCvydMBNRItOc+A0mpkqnnDtHLnCeD
         +f8Q==
X-Gm-Message-State: ANoB5pmGQrl5iE4FM9rBZOO1E6gnNuRlY2JXQTr3NKFcF/orWAJ0O9lO
	ePMCTF3aoFICErqEsJomM1/BtETGl2HhZhcG3vRT
X-Google-Smtp-Source: AA0mqf5Lro0H1geKEW2uRGz1U6KauRanORdt4Xposn2GDms+sPYKmCK12zz5gK2GHbeiYIDgRl5JzfsE9dMxd38ouvw=
X-Received: by 2002:a62:3841:0:b0:577:22cb:1f16 with SMTP id
 f62-20020a623841000000b0057722cb1f16mr9614270pfa.24.1670400375616; Wed, 07
 Dec 2022 00:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <Y4oxNbQwOldICdnw@google.com>
In-Reply-To: <Y4oxNbQwOldICdnw@google.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 00:06:04 -0800
Message-ID: <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
To: Sean Christopherson <seanjc@google.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_000617_472497_B41F2F4B 
X-CRM114-Status: GOOD (  12.16  )
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

On Fri, Dec 2, 2022 at 9:09 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Jul 18, 2022, Atish Patra wrote:
> > RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> > the virtualization enviornment as well. KVM implementation
> > relies on SBI PMU extension for most of the part while traps
> > & emulates the CSRs read for counter access.
>
> For the benefit of non-RISCV people, the changelog (and documentation?) should
> explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().

As per my understanding, kvm_register_perf_callbacks is only useful
during event sampling for guests. Please let me know if I missed
something.
This series doesn't support sampling and guest counter overflow
interrupt yet.  That's why kvm_register_perf_callbacks support is
missing.
I will add kvm_register_perf_callbacks in the next revision along with
interrupt support.

> Presumably there's something in the "RISC-V SBI PMU & Sscofpmf ISA extension" spec
> that allows hardware to differentiate between events that are for guest vs. host?

Not directly. The Sscofpmf extension does have privilege mode specific
filtering bits[1] i.e. VSINH and VUINH which will indicate if the
events are specific to guest.
But that is only true if the hypervisor has enabled those bits. As I
said above, RISC-V do need to tap into kvm_register_perf_callbacks as
well.

[1] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
