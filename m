Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C388C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+Nli5lSiWM5/KxQ4NvD4WwU61lFzX25eza0Xx71ZlE=; b=JvBaiR/Ikg4kZ/
	U9vXTy0unrTAjkO3MMi9zpxUKxOAmxivE0aS3FUOYVSVFzx2v9TtQywzzUBRNr2yz10wRprwNRbq+
	/792WK/hPF4P9Z9SGXxyP5IQshyi6izgN56ivN+CXWjbJAeW4frWATk0KVZvyqYBLA3mPMEaKS/8w
	AobYKisJCldKEQRmmMPCGzEhdcLFkBoavwUV9DUSFCG2Djiih/nLqc6nL51fmTbr1ZQEEhDDdEF5K
	ggtMQxLYxK3xMRWf/PE2iGOr/2nkWWRrQuSxul6i0z9C420D4YhNZ0xJkgtSw5Nz6Ms1k8Zlkb4FD
	xHMGioLq4f+nSH683l6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riV2W-00000008DJ8-2n4V;
	Fri, 08 Mar 2024 07:53:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riV2T-00000008DGP-1is0
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 07:53:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4131ad76f05so1024475e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709884387; x=1710489187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMX300WmqP7OPP0k2s8oRpai64z6fg6Nih1X4pJ5ZrY=;
        b=OH4fYE2CYWDAzxH5m47P59YvEa9/dAdkFv3OpPkoCgUZCnREZs8S2jiA5p44qivx6v
         ghvRtBiO7WMRm3SnfbGupYkQkP7iUyy7CE1M+//9il6AMjltqTvG8H77iwaNHE0pu0gs
         qthZRhb7rNAIxOZd3oDs2WYy2OkyegAPiXDjFNSxGDqwjoRQBv1VNARXMBRWOCfP3rIF
         laC1sGxSh2GZYC+TagWeNxa93Coq9tj/MWtwWZQRs8Ry887ZQBWaI5Gyf7CpUQ4mWg9Y
         +WxluCNbIRPNFSREqjhI+cSaKfwZxzJ6bmLIxmuw19rDCU8Hmmv/7BEFKz2jFzojvsww
         jh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709884387; x=1710489187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMX300WmqP7OPP0k2s8oRpai64z6fg6Nih1X4pJ5ZrY=;
        b=BU5wlOb5sHR3HefqalvYWK9co/n9z9Ui31RO91wqh6+nzOUTE8Vh4aKDcLQkVehCPj
         5jEIo7Ad/vrf5HmQNRPD5s7eWrAKWZ6rhfDXHTgNp84FY5T7E8S/oBhA+jSS3IFZUj5S
         /+zf+YEpMd3gGjQROt7zeFk9vbHQcJr+voDnbBz571DxOJppR19LK2RSOyTNepcVmKw2
         Tbm3JDny1KN76Ge4P65logGLuMPZQsOEaBxyQ3usbTMdCFY5Qy/S6s+QIyqx9QFc/U9u
         jXhGiOp/f1Sop30d9A8VTiLlts822Bpr6jwcBtkwjaEGdRP0jhPlR1FGWXJZll7Tb9aZ
         ur3w==
X-Forwarded-Encrypted: i=1; AJvYcCW2qtgm8iMPZJ4/rka3gVTXq6HWc2xRe3+XNNWOaVz42JSFsxWkJWb2UyRuEXiuQotcTZeIlggwf0lZEbcM0b3vKLi5xbKq4ZX7z1O9B6T1
X-Gm-Message-State: AOJu0YzNFmYFwmHQw4V8sFv9eBr/zd1CZlnP6Gu6FMhaJozjl9avpbXH
	wE9WcEqL1HcE6ErbOgjvJ2RncUcZWin3Ebrh9HGSG3LVjLWMAN9rDcUdPRyVAkQ=
X-Google-Smtp-Source: AGHT+IFRvPfPH7sazFwQQwkcYiePuHoemGv4c5hK5Fr4v1LmmXzLFkOofwB/Xfp3tyRgkLrI76lnvQ==
X-Received: by 2002:a05:600c:468a:b0:412:b0d3:62f4 with SMTP id p10-20020a05600c468a00b00412b0d362f4mr15571185wmo.26.1709884386947;
        Thu, 07 Mar 2024 23:53:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c474b00b004130fef5134sm4546585wmo.11.2024.03.07.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 23:53:06 -0800 (PST)
Date: Fri, 8 Mar 2024 08:53:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
Message-ID: <20240308-5d406beb72ee7f30f894c45d@orel>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_235309_462330_D5D45DB7 
X-CRM114-Status: GOOD (  13.36  )
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

On Thu, Mar 07, 2024 at 09:43:04AM -0800, Sean Christopherson wrote:
...
> But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
> deal, but it's rather undesirable because there's no indication that its
> implementation is arch-specific, and trying to use it in code built for s390 or
> x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
> code common where possible, but going halfway and leaving a trap for other
> architectures makes for a poor experience for developers.
>

I've got a few other riscv kvm selftests cleanup patches locally queued.
I'll add another one which moves the prototype to include/riscv/processor.h
and include/aarch64/processor.h. Making guest_get_vcpuid() common (for
which I think I'm to blame) was premature and, as you point out, it should
have at least been named arch_guest_get_vcpuid(). I could do the rename
instead, but since I'm not sure if it'll ever get adopted outside riscv
and aarch64, I'll just move for now.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
