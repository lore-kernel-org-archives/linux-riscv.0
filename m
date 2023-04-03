Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9ACC761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvleOkrBgt8rD9B5icZZftDN0RPKwYDjH5M+89/84vs=; b=IgYcZtwYbIOJFB
	1/5UYY0mNTehTwrZcqK5MP/EXSscTSr6BOM2ZtQsPRMG8vcQV5PPglsQ0Kp/zDizPRVYFaK0jAOru
	h34zC5zCygcKS7yPyk8le+5WrW8MYzVQ8BefxBBrBsQ+lqkKS77LTeqr2H9Je5dPKfj0Dury8LC0f
	5jQoZTbD6Boc4p3Qwk4095YKA2N7xJ1zVOeWayh1c5PlpfDyCCnmOH82IUIf7SZ0xwKoYBAabUTKD
	QNocDNUGD2xZund5GAYxqNAHzy5nNAn8WvnTq79vd7KAh/mPjRwm2p1SJ9M7AmafikFbR5uFCQqH/
	TnioG9DellfjnK6SWZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJHn-00FGpQ-1K;
	Mon, 03 Apr 2023 12:27:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJHk-00FGob-1n
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:27:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so17976738wms.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680524863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxqO2IX/lOxdyOopfgbP40oTI1EeUwuWoB1FSfdYqqY=;
        b=LwR9i9ZCwIynxLtQb6FQaFGe+/+1Np1vHT66lBjNQ4A3obHiN3EfpVZ3oil192Ng0M
         W8WqxBNP6kb/4Xui4QYKaEaVAyHV1egHkOsb/HhY42jGt7TV7D+EwlO4VxH/7p5e7ugF
         wOghWg/YTPx5nrZSzCp92+ljn7EVVqgg/NmqGiiMR4FSevXoKTemvsnj6yhYB5Fpptpu
         7Q5eB/4hSeMoeyyv09YaJQEFZcXq+9wwRlfjvLtoC9vVHsIWseaV+X6pdrduPTUvy/RW
         BD75a13P16aa4bOlSNPTbEUYL/86i1Uw2mJ8JZQcTJgg469ub9r4Y/Zmtax/yxjh6azL
         ZQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxqO2IX/lOxdyOopfgbP40oTI1EeUwuWoB1FSfdYqqY=;
        b=ZwVGhRukmNkJaQ4nyZ+ypatUNTGFEZ7PpdZtNyCX4GeopoICPGsANbBSeniIJaje8q
         ut7gGqU67U4BZTlpbStxW2Kt0Npzq9uplEDSLB/XWnyoYGlRt83ZyjmcjgPlj3uYPn+0
         ztB7b/77xKDO4tCZqZ24TUpTas07PhziOhn7Srz6b7KE28Jd7/R6Tw3kV4aSzqWRmlKu
         gwG+NeLT3topR8rF9kInKxclXPHyA7OeTwG3ZclaZyoOO/00/BX+VafDn3duoh/wNy+K
         pjf6P/d6HKgfk2wiC5yZiqfdAYZuBL16vQZU3Rxc2vynXXABCIomuv0b7HEY+gHMP4m0
         3eCg==
X-Gm-Message-State: AO0yUKWFuzu91IDSuwQe3Amaf3rJy/UQlbPRXgyzSOVCfDE1o7UANouY
	eikBdVwvOMExLER9wAfVAs0EdQ==
X-Google-Smtp-Source: AK7set//ZEBXvjQpHtj+FZ1Pzr5549u8qSf3J/8O/2XhOoJ4yBLZqx6rSXkc5Ji7/GLfD4blCbGeiA==
X-Received: by 2002:a1c:f619:0:b0:3ed:514d:e07f with SMTP id w25-20020a1cf619000000b003ed514de07fmr27877312wmc.3.1680524863019;
        Mon, 03 Apr 2023 05:27:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b003f0321c22basm17875591wms.12.2023.04.03.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:27:42 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:27:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <qrx4xyreynfc3yg67cwknwxof3omuknmz55bzyjzrgs3d3iffk@a4qt4pewh5pk>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403093310.2271142-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_052744_599131_46E27F25 
X-CRM114-Status: UNSURE (   8.96  )
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

On Mon, Apr 03, 2023 at 03:03:08PM +0530, Anup Patel wrote:
> We implement ONE_REG interface for AIA CSRs as a separate subtype
> under the CSR ONE_REG interface.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
>  arch/riscv/kvm/vcpu.c             | 8 ++++++++
>  2 files changed, 16 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
