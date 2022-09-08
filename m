Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B624C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYtNtUnDE7UxBhmwzBDNPx6WlTWDcGiN/zk0BAqczO0=; b=kaKScnbkbklj6E
	mAKPkIldTi7S5ySK31Y8tsELwIpQra1lr8u8Yj49E25co3rCryJOlFvPrVQB0MdNqzkPMGGknAfTu
	7SlamvxFp6llb9qhk3QaWnAWeLHyujiqt0w3NQAL+v7lAXhK0MaXYrjNcdiE6BBSxcvz1teylU0w9
	zbCfMKmn8KQU2iD2Elh5kfLi74cUqrtaK4NPCTL0hUbbTdrfBHEJTg6aSqmRt8IvfZ/3Laj9lwZCV
	BvSknXL5Rk7eAgG6UQSAM1zaYtKniY2Nue6UM2Srn2B/32rLZpBG5DPOuZQTOkZoGFFhFY2vRClSI
	nouBz8en/O33uXbox7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLDb-006G5C-Cy; Thu, 08 Sep 2022 17:21:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLDX-006G2l-Ld
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 17:21:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o4so18452038pjp.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QSC9/JxlDSGT+O5ILF8zg3hfD0efmyK/EUQhHIx6ex8=;
        b=M87gAZebZeVAjcE7FVwEzkqUy/zpY/uInRWMijM4pO5g5fVULP2EfdvE/WV7ycypOB
         33U2wTgQKMtJMPLryKtwrd1L82Z6Wi+1yotqDSrgO3b+XMUhG8OCj8rs5dH2HIRfG4YT
         Zy0f0r74yVTQty6B3ZHNLwdRPQ92lZKns/xJkg+OssL84kvFPJ6Ix5DNWn0p6XMo/xfZ
         8sxTZYzbE/hL4S/L6KyicZbEuTE/yUZTNDk+SIeAQtxaeZcdKNko6R61BjI03ALzFXC8
         84ebs59gXx2lbc0LxcdrNOwg7ROUpNmkzrbmCJ2LkRmCrYR1VdFAa1a7uJXRwvvwW+JP
         Yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QSC9/JxlDSGT+O5ILF8zg3hfD0efmyK/EUQhHIx6ex8=;
        b=43hqgMn99RYoYuUBnsbZUoOEUyj10f0HyfHHxGRTRVouozIIoCSz08wYn/0+nOjFWd
         VX7XN0u+M4rBJZM1nJB/ftplEBLJiibwaIQfbnDIuO71NtlTqlxzeoPakZSkv1LgNEro
         G7AaqeTlHwNCo9ICUaMX6sgYwCoJYHLhcNjLz7hu8cFBlg4p9Xv4U1Vcx5gx091AMTbM
         PhCqm7BCIZ3Ch9FjkAvHsaP3Eh7ghAWVyF9iijTqQc7i2MQ5nWADxBuQ6+Vhxz3YT8v8
         rM8cHPHch02f1vPoirTo6UbQgm6SNkZ3pkN0VK2wIaKZPSrc6Votzv+5aPmV9SY4riDq
         z32A==
X-Gm-Message-State: ACgBeo3u7Z3V5KT7CDymPXqlN35wqVF5MvkI/LsBp8rms5tzEii5LK+T
	+HjLBrO82nFJzC0c50JmH/nKj0oEaaxMkzJ/Ycc=
X-Google-Smtp-Source: AA6agR7Xeg3nQg1T99ip9VlFHLMdwIdx0y5yxJPkxPD84LN3YTfYEjH8DXhT4YDTtaFu1/rLSk2ygeggw/b1deT4pPk=
X-Received: by 2002:a17:90b:3e84:b0:1fe:3c34:8c5a with SMTP id
 rj4-20020a17090b3e8400b001fe3c348c5amr5263514pjb.77.1662657689081; Thu, 08
 Sep 2022 10:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
In-Reply-To: <20220908170133.1159747-1-abrestic@rivosinc.com>
From: SS JieJi <c141028@gmail.com>
Date: Fri, 9 Sep 2022 01:21:18 +0800
Message-ID: <CANaf2scedFxwDwBYNwk-9Y_p4O7Sc62FFjZPptdZeAs4H4JGiQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Allow PROT_WRITE-only mmap()
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Celeste Liu <coelacanthus@outlook.com>, 
	dram <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_102131_749577_D6387E6F 
X-CRM114-Status: UNSURE (   9.80  )
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

> is unnecessary since RISC-V defines its protection_map such that PROT_WRITE
> maps to the same PTE permissions as PROT_WRITE|PROT_READ, and it is
> inconsistent with other architectures that don't support write-only PTEs,
> creating a potential software portability issue.

I don't believe that the check is unnecessary. The missing check is
discovered in realworld scenario, while we are fixing libaio's test
failure on RISC-V [1]. A minimum reproducible example is uploaded to
https://fars.ee/1sPb, showing *inconsistent* read results on -r- pages
before/after a write attempt performed by the kernel.

[1]: https://pagure.io/libaio/blob/1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448/f/harness/cases/5.t

> -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> -               return -EINVAL;
> -

Just to mention, this revert patch is removing the check of exec
without read (--x), too.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
