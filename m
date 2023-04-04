Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186B2C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hqWUIKSvnEP9pNNQfyqc3fcKwHK1vmf+qYo31YWFqo=; b=fAw+m0tuVwHBdC
	HHlGoTsn5cwK2oCU17q0OFFZSjHGim9jkZ1I2zKLJkvNcbouo0RmQkbRBgR+ClGLVUkM+Uok6OhCE
	BTT9UDWLd8UTTDA/z1gwn1dIRMnhLUF6JkmGTzNELwVBNGQzCTpvzCRVMrBwEitHJhI+fOZotsCr4
	nVUPQRnrvxDSZBmMWNCmR4vKpO9oeTVA6AVscbvrsr17qYbwi3Feyajmd6x8ozmbG5frk0wVkU+zx
	pino4Qd0arqANPA9wAYRTr8AJejyqleqMM1Jys0YZmhVa7XBS7V4f7KgIgqiecss1DWtGUlJhr/Rt
	tJdQK2lIaLWO6v5y+myA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjZe-002DV1-00;
	Tue, 04 Apr 2023 16:31:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjZb-002DTZ-1k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:31:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id h17so33432729wrt.8
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680625911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWfv0RYKjPE6ILniOXyfBwX408cO5MlZVjVqu1n4tX0=;
        b=gm6N3McuZafztBRpXbRs/EtWofSB3kteTecmmRGTGY+mg3PO3rycfsnfCepxBdvE1X
         CA5oTDMx7cB9LPbH46uuSVfemJ9TixIn9B9UWz9Bs9tZnhZfBCZAe4wCRIs3KoL86jBU
         7WYugu8GFmQPMm0TPTK1qUCOXVprJyxPc4MkJyRJ42s+0YKCVrpFsh9TgAlpBG4NvO+t
         ALir0xzrye7Fv5xG4El0PCQDewrAqZ/zuZ1LU47SJFC3C/FGW1bjsuEBqFNeWjvYISm6
         hD8UXZk5iori2YiLYozpCToFjFPHX0wCAttrxtOYZ8i03vElaMGoeYb021+GOtGkkALx
         dBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWfv0RYKjPE6ILniOXyfBwX408cO5MlZVjVqu1n4tX0=;
        b=j6mqGjeJ8SkuHU8KXLcrGEcZCEXvpo3Qik+cdlEzVb/9jfApatWAdOccsSKO4quDIN
         E50u1DHFpawaYFSv1ed6h5RWVYUfr5vV0P+rJ/jvWRPmCD5IiZZYNB8CSrC67HPa68yW
         1Uikk4/MBxGEt1S07/rFvnvsrfCrAEGOUupWzpdfM+4uCEXmYlgMdzqEgdaAFoFLK9DG
         90V23xn+fi8U+uCzdHTWr6PBh8V5jFloWhrGIs17HysTrSb+iCjdFmCBmQZwDCFrT/KE
         rFHlSOxl/QNwRAvRHI1riVDmiYfM6v37vG2Ctf/tCSVlkod48ulJOk/m2Z8yFSHFWx97
         ZbYQ==
X-Gm-Message-State: AAQBX9f31ZHSe7Y+4GX1wxxrFXmLKxghpPs2JbDOCOp1/D+gYScj+bUU
	rYl+W2TCYoZagEAyTaJVk2SPug==
X-Google-Smtp-Source: AKy350aiLZ902xG3dAVk/EXrQHSxt8nzwRy0ZUODd4WkgfRlIS16RUPDwFhtYw3lILRXUt83CfLWMg==
X-Received: by 2002:a5d:4a4a:0:b0:2ce:aed5:7dc with SMTP id v10-20020a5d4a4a000000b002ceaed507dcmr2109083wrs.68.1680625911057;
        Tue, 04 Apr 2023 09:31:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d68c1000000b002c59f18674asm12741037wrw.22.2023.04.04.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:31:50 -0700 (PDT)
Date: Tue, 4 Apr 2023 18:31:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] RISC-V: KVM: Implement guest external interrupt
 line management
Message-ID: <buomdae5cjxjctzleywsjqejf2k3d3zuwqi7zyrjq4fc2xzng5@mdxdojrdkm4j>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-10-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404153452.2405681-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093155_600496_328D6100 
X-CRM114-Status: GOOD (  11.45  )
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

On Tue, Apr 04, 2023 at 09:04:52PM +0530, Anup Patel wrote:
> The RISC-V host will have one guest external interrupt line for each
> VS-level IMSICs associated with a HART. The guest external interrupt
> lines are per-HART resources and hypervisor can use HGEIE, HGEIP, and
> HIE CSRs to manage these guest external interrupt lines.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_aia.h |  10 ++
>  arch/riscv/kvm/aia.c             | 239 +++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c            |   3 +-
>  arch/riscv/kvm/vcpu.c            |   2 +
>  4 files changed, 253 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
