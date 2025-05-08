Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFCC3ABC5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQdYGVcGSod9syc7bzoGX7De7mNsrfrAhs4wIaLcVgI=; b=BBbEBAqw3OI8Jf
	BENSRG4RU3pCbJ5Pq9hzUvRbBURLOhUUieFejebRYkhd5ehACRGETDGAYmv1mXgZe8jlThqQBSCZ3
	DC4m03O4dsd9fcvxVMLtIqquxg1W+XdnFy8mpra8rMpkxe9/CVGPw+0el3HMighre3dVRhRAg6ED/
	Gn1qwMyTlXkyLRFqHnOWEyJPmNMuNO6mgQKG30E01I/bJp9RbMtfhpOo9r4aG/D889S6A6pAa4Jrl
	41wcrkOdstqQ0sQw+xQqeINPNBRLIqay7Z7z1XGiMhNmQyKuwcLs11/EI200Yg3uxA4QR29kLG8Iw
	+rwF6gdUzqYqQxN0SNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD25m-00000000tPj-1iNT;
	Thu, 08 May 2025 14:19:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1LC-00000000krt-0pzI
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:31:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cee550af2so420645e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711068; x=1747315868; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=iZaXVbFBcBEPIUYyke4nxd8KOE6FDcOZQhgwyWAyE/1HFYlDG+5La3sbiuv9Kbu74x
         /FLIpJLm+x6pYDUTw6wWYAaUdRlrCc+MWWa6fmP7OSoWl+EDdPRnGOff1p6D0bodUWdM
         S+aRFAtWn2paPUtZFHSdWg5IpDnxVEuD0JvuzkheKkGrwaRaQHuqB8GXQlDhpP5Cmr/f
         JLykpdig54lDiQOp8PeX3qS64hMKVPsELJhMy3BgwMaTk+zM108rMhDsa49v/MaWPV0p
         dJmdjQbLSX/DIXTqCnmxNW5OYOKm5twdSJinZWWk/DfHpm1j4pocAy8whxyqMa95Dnsu
         SO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711068; x=1747315868;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=CMuUA4B7Iq9RppMgBF3ITrsSjXVoJ1WtNSJwRw/Lm79tzydT8iK+p0k41PlUQ2mOWO
         9GlBoKdbddKiyV9RfPMxkIBWWQN1tfdlID1rk5aNclvlP4FC0e/fz5ob5XYIbx8ky2NQ
         QS9CtTEhhMw5N7FBNNNqDpl74wGTHRjhuv6Te8NPEzIoldqb3frItIcSYEFkSDEdLiR1
         VQTFNv2+0Y1H71g1iinqYeWyvr2cM62/PGvPz0SVDAUjwo7+dOwlEAei+tNpvxfTD+Zv
         wEi3daWp3AnoshKcRU6B12WhP4vcfXlDZJLpBQfa0utXDJRA2xKF8NyE6nAQ/vwgaVGx
         TPXw==
X-Forwarded-Encrypted: i=1; AJvYcCVlM0E01Bf9daef2MHcVLDdWDseda99l3Khs22P0cbOAbnQxt7aG4YjhFEBKFupDyyQnQ2uUPw8iMxYKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeW38HpqOu5Riby+NLFXklVmxDnz2xGYdEDW0FExtPxhkjwxbh
	0jWdxzXe9ltGfQ32S9z6wWYNoDDlTYwKwUmZWOjKjS/UIfl9IUSU01wPmYnC/0U=
X-Gm-Gg: ASbGnctV0Flsk6ROFunA5EJT9VshQG25GTbxpsUuyElozhpVkQMJ255+Soh/fF4E1Bt
	EHf9YTK6Ii5DUpH50HkMTEDlwITgEvKOJDT62OSm/ggBy8SpGgCtDlEQTRyDUf3Xssdzrhljskn
	npFymidpyuiqgA+bzMs39CMrI7+LuGxAQaM2ig1b18ajwa5b82O9tk87wlB6Nw5Wd0wzM2UKnVw
	KjbI94KHPHvLueN4vdIL7AZsqIEPcFqQmMfXJMxRip9YQCgTEDVIFsAs3+Y8ZrgRru8ek4Be+tT
	mbAl7s4cKUAXWt2ODMrA9wJLe1vvGLEFu1D+fUHx+9e9tjM9
X-Google-Smtp-Source: AGHT+IGijAnvSUvNKAgb7ZNKd5QJJ9UF+zXOT/jF3FQWpi7RwPSldc9C2Ir4SMyQ4xieyEHWiNZ1qw==
X-Received: by 2002:a05:600c:1d8c:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-441d44c4749mr23230845e9.3.1746711068529;
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f238sm37108665e9.11.2025.05.08.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:31:07 +0200
Message-Id: <D9QTEAUN0RNE.11G3ZW4IBGL5M@ventanamicro.com>
Subject: Re: [PATCH 1/5] RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_063110_239146_6E0E118E 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
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

2025-05-05T14:39:26-07:00, Atish Patra <atishp@rivosinc.com>:
> Currently, we enable the smstateen bit at vcpu configure time by
> only checking the presence of required ISA extensions.
>
> These bits are not required to be enabled if the guest never uses
> the corresponding architectural state. Enable the smstaeen bits
> at runtime lazily upon first access.

What is the advantage of enabling them lazily?

To make the trap useful, we would have to lazily perform initialization
of the AIA.  I think it would require notable changes to AIA, though...

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
