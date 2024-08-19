Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVh4jkk/0tUrw783VxcdK8KAsyqGqhgLdFQB9HKpSGY=; b=3B3j/R5uoJuS7v
	J66YNRi1hmlGpF9u/iGZLbCDO/CJfgvjLJFff6606AF5SBa4BaNw4355sBV79zrTDn2r6uiIAdCIN
	a3ez0WYH8/PdIlvlDl4J46qFDPmiO/YZ45P1SrQbjUTC5KX29ExZ9NCYVqkuZNECpZQ8lc16Gf9ht
	3UtiaVrPM1JlfO9gAZ9GjeaZCBHvwQXgXczt6K0uBlcSbi7VfSPXOlqf4FSzIQFzDWh778FtBBlW4
	QTCyq+0zez9YIm0j2RxV+3XpPmA+B16LiHbdV/8/yGItzC3wl3Z06royyoR/FRY7s6NOmkuB3tiRD
	OZp6KME5Z665IimNVHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfwve-00000000ep2-2FJU;
	Mon, 19 Aug 2024 07:35:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfwvb-00000000eo2-32kr
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 07:35:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7a94478a4eso873682966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724052945; x=1724657745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=ov9lB1lJ0kq+ucP/feMgtCA8h94amdyh6jpeinTO3VJtbnKcDPqjrRqHS9PGvjOWoA
         Dc9TqW6P47LI7ewQkyyKfUJgysQF5Pi+anGujyvVbYWMoBfkQTub7GO9rhMLhu3+GilE
         6QC7dULtqMcbCEktODg1lJuRV2Cq8UJmW9p4RBWnvGeveIx61++5Op/jjPrr2CD+aQp6
         Y5GjEZTsr4KnHwDASgWuy6E5mRazBB7PuZKiSEPagrBrAVvJWqrtjZBauzcSfXPw2rrm
         2FCAulElqPawKq8fNrSfIvReM4pZVGFI3kWfHebrWhI/dQQ7Z+Mrnu6CtRar8Ow1sjXR
         VVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052945; x=1724657745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=kuSMqTW2eWleDaiZmz0TRskRVbfAe/bTAfr5cqEqC9FFlCE3HCnrD9mrCQqSeAYWjr
         fUrjRXTZcVSRyQQLYHv7CX3NeCSrTkumYv4wJIrxGpL275ZcEiaMKwSXj5E8nHMmj3XC
         8GEKWDNRNTtwhAdMO5jcugAAf/ztRMZc41Zw5kOFblKWdIBjhaz1CoRX7kSUlvhdN3lu
         nSF7urSmr5IFKYswH465oPXy8zxoLRUSR7jORgqK+Qur8JrrvJ+Ik4q274gNkP5g0/NM
         q/zFacV4lx2UOfNjRzSgO1+LMSJ5IImtg7EIJqGOXTSuiRW1IjUlubg9VKn/OzqfJPTb
         QEBg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZLlTKTrOXtLPJn4JHQDNl4BLC9+kGMx68FeMxY4sr3zCJzXCpIemhY90BDDKZ562K1rFRvvNNV919ubewXC8yRLhmb2dFE+xmbMTVXei
X-Gm-Message-State: AOJu0YyIJcqfX7PCTI3KCBoOy71a1+H4iQECteNjAQUxkqOvxfrfdRjP
	QXhfZ6p6Y/kfCFB6gEvn+v4tEXECiL0jAZKmXCLjZmcofoBH19Ydh8r8GTC/zSQ=
X-Google-Smtp-Source: AGHT+IFGNW4Rp1MF9pErnW5tAeVHGUBzNbSFgBGlimGRBnHwWDOlPps9HXt2/6wAXUpzwZnZvX8mQw==
X-Received: by 2002:a17:907:6d2a:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a8394f7e0b9mr963569066b.22.1724052944878;
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6c07sm603195566b.43.2024.08.19.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Date: Mon, 19 Aug 2024 09:35:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240819-3fd4ff3cfa1d216a1241f5a0@orel>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
 <20240818161816.GA173148-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818161816.GA173148-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_003547_795621_C6D98699 
X-CRM114-Status: GOOD (  12.24  )
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

On Sun, Aug 18, 2024 at 10:18:16AM GMT, Rob Herring wrote:
> On Sat, Aug 17, 2024 at 09:41:08AM +0200, Andrew Jones wrote:
...
> > +	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> > +		d = irq_find_matching_host(it.node, token);
> > +		if (d)
> > +			return d;
> > +		of_node_put(it.node);
> 
> Pretty sure the iterator does this for you. I can fixup when applying.

Doh, I managed to mess up my usage of OF APIs twice. Thanks for applying
the fixup.

> 
> I plan to tag for stable too.

Good idea.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
