Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA3C71157
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jun 2025 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxeNfm/Lp6gH2xN3zVyA5vRWlbg4ehIjTX4rCtkiXO8=; b=rgtX6N9hMPeJpn
	M+IS/FtKXi7yxpfnnjqWrn70v9k3p6UT47Kz2pk3vY7MGLbjFCJ76U7HCmtMI6p9GYi5s+25K2Q+N
	5PZBjMJfqF9UHovV+7f2JeneNsW9XUxM2VQfLft6uEglPTn+tQoEvpfX59CCHRZXgZDPuXsiWCtDO
	6VkFeXc7+9qFvqjKhAxwmRYj5NyLg9a90tbOKmPcn/Y++AIgqKEr+aT6C/arLDUsvp70ZpHEF/XLb
	df4gk2pApaeTXZir2TxRqkY7YUtd7POHXibDnkTgHCMhZLZQVwNpPErXbmcPd7ZO+zm3EuTPzdn8K
	YEPNnK8Td2eweJQUaCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSzHf-0000000HW6R-0fQ7;
	Sat, 21 Jun 2025 14:33:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSzHd-0000000HW5z-0Lxt
	for linux-riscv@lists.infradead.org;
	Sat, 21 Jun 2025 14:33:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b31befde0a0so1684560a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750516408; x=1751121208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpcV6fctoPHKkMmJOO7gDCJf9UFeAem7Es9ZNVW1blc=;
        b=fOqm1AMPtq18+pjnE2qJMnv3NvmliRJ6Hx9NPDY3a33i2P4cRDqQNRpQnLUDQcXTIC
         ivGUBoFF/MXXj6pH9uAivzwI/S/q6u+P6RzAXPLA7Y9NTOmQe8WeqRSFqs/EdX4MY0cG
         4agK6voIq9NZoPSNhR0R98wxGXxWJeSmd0/pn7l1s/b/ix9k6imjo4L+y1Ti7OEVySb4
         y5/FYc/b8zMTEb/56ZFGV9Zl1ElN55pViHPVJ+233CJADef73DlfD1S1VOYDBlYwHmGK
         69qOth6uaFL44rv80pUbfiXZo3fWySZlmuCOjNL+/v1Ox3bDB45CebJB55GZnhmp2+X+
         6bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750516408; x=1751121208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpcV6fctoPHKkMmJOO7gDCJf9UFeAem7Es9ZNVW1blc=;
        b=FqsmRWZDqD1MACi4/tBJmZiRisuB2EmxkK8sOsA+zDkL/mA1nJ+ccUXJhx9j0XkwQt
         rngnri6cpNizh0Y7n/d+KGhrN1zh1IG2Koa8wBY/0mbNMNSVd2cMLfrI+lmNjZmJU8w8
         mGeG2qp4/DxudEFXyW8qJinjdEPBRZy5X5veAa5z1o5gJeLHPsyiMfAmtSdYsYXKP2ZE
         qnHEg25O/uWMv5qcv4VVo0gY+Uu46yqM1h8lipIIScWtkhFNkwExiidDD9Xbe7M5kyux
         RnlQMmPwpEGwXXdjnZc9pgy7FK8pw+LhOshwrPqr2+1CVWd//aQf2pcpyr/dDjjVeSoj
         ElhA==
X-Forwarded-Encrypted: i=1; AJvYcCWyvaamM8WLfaXtuFqG3XYbd7v3botDIRJjNS2FfNkPzmEDlACsC0WHjcaxeh7eew/XGsUWnUpcD4xQaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDsMLPttBwfQuTbMuxdrf17z3ua1wAQEgSnjief+aV+qrokv+X
	vKbMadm5Ckg++Od/shqTm5pvQKOvBx8p6qH94MyG+gr4KYvZVoONcfqJ
X-Gm-Gg: ASbGncuEiG14IuqSGCFtvKXl62idYIBSm8GoahOINFz0UIByBKam0GfaI+xmJ0cm7ed
	6LPsRDEZyH6UjquOJhjW3S3Ig67mlOfn+4vp0sTYKFoHVBf2XAxoQ3MhfMK43aOA7clkX6KDT/v
	ykvpLrMZCXczoNRzXtUsMHJnn82I6cCxIfb6xeS2awb/jOknZXkPNf1cLTgQyCRHpr9QMKd/sPD
	2pPAJCMLTVQqOKUaMvm5UmSAsU0T0BGPpxpsSVoaqQUZZHm8YGZssawusmLQC2uq1Gw6Scf2iar
	SnOA0lt/fJAeBma0l0AS8n7NYlW652Bp1JWfvYzjNpILx9WE5Dv+xqoTylby1aJVb2MjMrHG
X-Google-Smtp-Source: AGHT+IEa1dzclDb2tuusdyRFUEN+RVm3ocXALNNj4v2dS5L9ixXeDKVBkqE/mg1/e/SCGi0mCloBfg==
X-Received: by 2002:a17:90b:3505:b0:312:959:dc49 with SMTP id 98e67ed59e1d1-3159d642a58mr10688811a91.13.1750516408260;
        Sat, 21 Jun 2025 07:33:28 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df93ad9sm3999598a91.21.2025.06.21.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:33:27 -0700 (PDT)
Date: Sat, 21 Jun 2025 10:33:25 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, linux-mm@kvack.org
Subject: Re: [PATCH RFC 1/2] riscv: remove irqflags.h inclusion in
 asm/bitops.h
Message-ID: <aFbCtb2oWxPbq1SN@yury>
References: <20250618034328.21904-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618034328.21904-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_073329_125725_C40927C2 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Jun 18, 2025 at 11:43:27AM +0800, Yunhui Cui wrote:
> The arch/riscv/include/asm/bitops.h does not functionally require
> including /linux/irqflags.h. Additionally, adding
> arch/riscv/include/asm/percpu.h causes a circular inclusion:
> kernel/bounds.c
> ->include/linux/log2.h
> ->include/linux/bitops.h
> ->arch/riscv/include/asm/bitops.h
> ->include/linux/irqflags.h
> ->include/linux/find.h
> ->return val ? __ffs(val) : size;
> ->arch/riscv/include/asm/bitops.h
> 
> The compilation log is as follows:
> CC      kernel/bounds.s
> In file included from ./include/linux/bitmap.h:11,
>                from ./include/linux/cpumask.h:12,
>                from ./arch/riscv/include/asm/processor.h:55,
>                from ./arch/riscv/include/asm/thread_info.h:42,
>                from ./include/linux/thread_info.h:60,
>                from ./include/asm-generic/preempt.h:5,
>                from ./arch/riscv/include/generated/asm/preempt.h:1,
>                from ./include/linux/preempt.h:79,
>                from ./arch/riscv/include/asm/percpu.h:8,
>                from ./include/linux/irqflags.h:19,
>                from ./arch/riscv/include/asm/bitops.h:14,
>                from ./include/linux/bitops.h:68,
>                from ./include/linux/log2.h:12,
>                from kernel/bounds.c:13:
> ./include/linux/find.h: In function 'find_next_bit':
> ./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
>    66 |                 return val ? __ffs(val) : size;
>       |                              ^~~~~
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Is this patch a prerequisite for #2 or it fixes build on master for
you?

If fixes broken build, I'll take it and send an -rc pull request.
Otherwise, please work with RISC-V maintainers to move them together.

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
