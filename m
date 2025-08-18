Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF7CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dsrji4ZYVNQATMLp3StExsuU1rqDDw+mdmOqpHTgPgo=; b=km7ru2rgC+/FOm
	ADq/+gYHhTkS9nizlrVpXLaJTPvCAje6pfbA/XHOGKduhM7lKpCj+5A8ZuDQ13zAeBHRvFSNdN22j
	yAaw+GPAOvMLEpk7yfOfjZtKOv86/kVFz0u33S5CH2fGYaElhs53eVvAOqoMpVjQcNjbv/ur3owgk
	Cf5QN9ME9brvLLgD1mXhFiB3Y9FBNcto9TRWy8P0otNWUhUa1Dk5pMQtvecodKsX7A8q8EXdxScP4
	EBEO9azZZZehy8wuTz/2DZdRjeCha+Gx1Aao0f1W9tC/kjINjncbUIg1A/pAB+zP8iVtvISHPGHDV
	6DK8b/L8yjNNvQloZJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07P-00000007arz-47V1;
	Mon, 18 Aug 2025 13:41:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unx73-000000079kf-01af
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 10:29:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45a1b0ccd63so7094265e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755512951; x=1756117751; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhbysUcbAKjEA8/11kFRzX2E12IzlBavWPgZPsKEmYQ=;
        b=oHpFNnQV8qVDXcT6fOiX9Zi29fXpWoaNvUtomJIq9U8oh9qrGghpuph2SgacGrrIrL
         lngUrNBNV11Go9f1C2d2DAj9C4ZaW45e9VOLJFiiuOQhfkd4xebiENj+6Mo9NuC68GNB
         TNA0ryOUHZYkRb1xpOAp3lApaNRQBaK3bQdMbyigQcGtjkqPxcg5gd85Vim/X2W54aC1
         FSzqR9ZDxz9l7sQEZp5JzeSTqXR9d7cAm1N5PB+yqv2kiL3Hq44P4/btBChucDytymbm
         2BSSB8cYCzZibXBBKF1u0BY9duD4nrk3oCRgZep2TBj+ukTktlCPGnDt0Uu1mDfbjmuu
         cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755512951; x=1756117751;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhbysUcbAKjEA8/11kFRzX2E12IzlBavWPgZPsKEmYQ=;
        b=ehcxCRhx+/2XLGrkvxMrs96Qwq4Fe+i3z8u2N9wYzPwe6AKe4MvrrYrSw8+buXQKTi
         NzVfmJ5gHnMkv9ufF+H2a5UJ5SFWjQtGav5/i4HQVMiru0huGDl98lnW2h8C/zTZfOS+
         6viVaeokjQSS/DaH6jLh1SrzmxZ/BYLf2edB4MdQnEtbrt8pGytR2QVVDx0juxAwmjhv
         0wcsVGwopRXkh55dwPr0ViKT5RSRI60A+WSKZVt/i7maUPKfGWe67b67/6/osQ9JVwwN
         Vc6wZbQi+VvUhpTfl62QtZ2/lhPOcQLLGCCZUEcfUZxJEKDpf7zxygB2F4aK+LWj21SG
         gUrA==
X-Forwarded-Encrypted: i=1; AJvYcCVheTHBUbpBNX/YD8khJENDqgcweADsPIOm4gpSD1s4vdg14Y4j15YYHosRropu12mxspkMbBLA+zGQkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8OjOgzg0RStD74wMcpbRZcMQv1/GkqfjKJwSxI4DTaa2a2pZM
	zH1BWl+7EvTmgqhCHPCQplsmJ+Pre//jofZcbnVUmxXu1b5iA0TmGALxPjHvB/K243DWEjQm3y1
	ok45a
X-Gm-Gg: ASbGncuGYW3HT9jzCkvrNfMivjZhsiQ+NuHoiwQ+RACN3uti42VFvg5maOqa4+7EAl0
	JEomvVDlLe1yWUS6ko7fOxhoyEtmRSBsscRvQBbof+btxPNbESwb41fUn+rw/yzVdKBNfS+Bpbt
	15Q0PfhHlaDg/ArAd79qUwKtamxtrkgzuuB4D61He6IIojqP+LsnfwmdZSrA4pIWLkIqfe2X50u
	alkUXtEEbqb0qjFGVmLMMvVWgZXgqF3gZpq96Uw3ISjAYKKEPwiwW+FtYRB/iCDFXYgSx4qGTdW
	4VH6oMc98iYJ0/hA+PoF7aUTmLMbVLovrftbw34sVYtN3yEc+WSIAV+Tudi4kOvbsWX57YwNRZ4
	jQlkVOTc1XqEyziaFnNEK49HeH0sZqQ==
X-Google-Smtp-Source: AGHT+IFey14ol9S6TtNaCL77HGtEmBhLvnjzcHSJ5a+JMC7yNb3b8k4bUmeKUn0yZJ7mbxDU1Gpejg==
X-Received: by 2002:a05:600c:46cf:b0:459:ddd6:1cbf with SMTP id 5b1f17b1804b1-45a21781fb3mr36116495e9.0.1755512950889;
        Mon, 18 Aug 2025 03:29:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:faeb:f88c:9e29:5aa1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a2232de40sm125126805e9.26.2025.08.18.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:29:10 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 18 Aug 2025 12:29:10 +0200
Message-Id: <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew
 Jones" <ajones@ventanamicro.com>, "Anup Patel" <anup@brainfault.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Shuah Khan" <shuah@kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Anup Patel" <apatel@ventanamicro.com>, "Atish Patra"
 <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
In-Reply-To: <20250814155548.457172-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_032913_109441_2AD537A4 
X-CRM114-Status: UNSURE (   8.24  )
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

2025-08-14T21:25:42+05:30, Anup Patel <apatel@ventanamicro.com>:
> This series adds ONE_REG interface for SBI FWFT extension implemented
> by KVM RISC-V.

I think it would be better to ONE_REG the CSRs (medeleg/menvcfg), or at
least expose their CSR fields (each sensible medeleg bit, PMM, ...)
through kvm_riscv_config, than to couple this with SBI/FWFT.

The controlled behavior is defined by the ISA, and userspace might want
to configure the S-mode execution environment even when SBI/FWFT is not
present, which is not possible with the current design.

Is there a benefit in expressing the ISA model through SBI/FWFT?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
