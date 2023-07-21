Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC492EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V96xnWxz8O843EscjNUIe/xWyWs7XxMz7NyOWAJoSqM=; b=MUNnbffWxPdlbX
	IizJYm2SEdwOJ1smyVQzxjK34C7VNiFQtzf+tPpgmSTW3bcATr6SxlN0BgBjOZVV9h++NsEZFFqfC
	/TREmit57tR0nZUeR1Sb1orBZ0umD6CDtIaaQqb0xfU8e8o/FHyciuRzUYJ7v3UXRWn5o7MORlkTs
	oxHtpREdaL9nUecg14etuv5OZDIU6ejgvgxMkicslLOFhYMBAfj0c9jAELneZLoehEj5YOGJ7f8y9
	Vw9/qLsm1fvNwA75TxI4F9Ep/3OvVePB3GxgOl4NOiELCg/mCrcBdaeefZeN5N4bZRaCoVEXUI9on
	amm8oFujCA+8tWPuau0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlvD-00DRjL-2j;
	Fri, 21 Jul 2023 08:55:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlvB-00DRi8-21
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 08:55:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso14166415e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689929732; x=1690534532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRw5l6OzeOccXF7/FIWrZEEtruEOLbzdIqkShTVDRUQ=;
        b=caysJFMK0qx/EQEnUdjRTem5UykvhO+xxRjXgZzOIWYYRqAL8tPYzKgmptQLEoGisn
         UjD3KQ11FrVWE5VXSVsvPWPMJtGudCne3l7vbQz5GA5Ee6zaQSLpD1EAfPk/t6IIhzge
         p4UmQMFGBBwLboOSgdR40ySip6/ozt3Au8dAuQIeKyGBoc4+0U1WYgc0ss2p8qENtiK/
         tYhrSnE0KUg17zYFKts0cHZTZk9Z/ugzGTZ+ew8X7YO4pcV1Qo6ERRCjdLULO6gs79Z6
         jb1FVB8ctKohmA5Go00RdAbM0wUYQvwI4W5cftTbmw1H3+HdYxYEhiOYyNB+Cw21G2ao
         7xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689929732; x=1690534532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRw5l6OzeOccXF7/FIWrZEEtruEOLbzdIqkShTVDRUQ=;
        b=HjvUifNgWc/a10v0SqNtJPexOB0wHV6seC3nUKqR3DwfA+zE2lv1E5GYyS7ltgMJPV
         HoT4qgnuhGohEXzJpenNRRGXcIHuhCL6DAD66SSwURakqkS75C7LPBhS++f7YJYyMX3V
         bXKXpA30zc7B1/9HP8wmSRoXPj+9W9guaeCpmbjrgzGpFMqSKRuxCxANXKafsnD7kKIC
         nJIucUgbSQAxdttdHcncHPwN1NEFe6VOKL0nBg9Ii2tw2nchgfWWxQIIbpKRa9RXsj/N
         5xgNYwhCL+LWS+HYKsEqUk4uPBy7BxLudFv8srZiR3W/mOZgJPeFA9cGbPPTiyDBETZx
         qhZw==
X-Gm-Message-State: ABy/qLbckksQ0UDJHRTbKNrwMhueI65Wuocyexg8q44jeZYN29/rKzRo
	iNcwqfGgW1B20IQ5fwnGXOItdw==
X-Google-Smtp-Source: APBJJlEcFc+Y3hUVdY+EWCGdvGeVAdJL5kQjcR1OeJnOnZszgsAy/7U/e+AjJtWZbAOCHQsbCKKJhw==
X-Received: by 2002:a05:600c:2187:b0:3fb:d68d:4c6f with SMTP id e7-20020a05600c218700b003fbd68d4c6fmr946413wme.14.1689929732008;
        Fri, 21 Jul 2023 01:55:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c17-20020a7bc851000000b003fc00212c1esm2922579wml.28.2023.07.21.01.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:55:31 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:55:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] RISCV: KVM: Add senvcfg context save/restore
Message-ID: <20230721-e1837bf67c22da7377d892b4@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-5-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-5-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015533_663871_F6D8B92E 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Jul 21, 2023 at 01:24:37PM +0530, Mayuresh Chitale wrote:
> Add senvcfg context save/restore for guest VCPUs and also add it to the
> ONE_REG interface to allow its access from user space.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 1 +
>  arch/riscv/include/asm/kvm_host.h | 2 ++
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  4 files changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
