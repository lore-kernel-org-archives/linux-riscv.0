Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF9ECAAD4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvYNUgRbpXvPg0k3uo2E8Os0M7lkkFe3A4T9fFpfclU=; b=xLkzQ0Y7Se6SdT
	tY3pvgpqHyN/3C45XVD37vF0FttBAy81N9AS5nAa0GF+Ay8V+5NCvZSAGCRB/5VEBUn+jfvKAvV/O
	Cl5nfWGac9TO2CKKvEz2la3mP5xwszi1Ry+yLywqbYQTeXuGovK2tyyK1Ei6BbT7FpWR/MF9AGQwn
	G9y78QBlu5smwg9JotHSW4glCoUng/aRy7JEXnurwyjjA95Ul8Pwx+FKPJMN2CA6P5+y8Xscryik/
	MPLY/piM/CtJDAPzLq2bbdxu0NTbN6U6rLMIS2or9pgXL5fPemlJcf1BsjguMvXyca3DBPTSxdZkz
	l/5EiK3MxjahrTWELdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNdK-006JdO-Rn; Wed, 31 Aug 2022 13:19:54 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNdH-006Jbp-GI
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 13:19:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 193so4104592ybc.10
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pMO9zhn0WdqqUu5krLuleog7z0gfNsoSQcTsswsRaWY=;
        b=y2BdC954J4C9GUD9ZJ8M1Aa426/7D/dvGh2td7B++IlX+5HEqHRD/L0miXM6UMhPeK
         p+4+BIIaUZ1xAr8+el7OueG/+qtTHU1sF0GwLfe1aGhx8rjcBJ6bwrREw2IFTfpfAm1q
         iSFeosHBEnqbIvFQeDdL81oldEu729ibvRIvGZ7xpx8WtO143GQClG4VXuzcUuuu7fpS
         hmfNOHysxq772HCPhgimScZWdTUxIkuKmCzbWeq51iusgcbuKT1tWRQPefsCDcKzQExO
         Nmj1NTEATHAfrvw+eviL/nBZjI54+FELhxNCa/e0Zswpi6xvUZdcQzOeXI4whlePaDzr
         pMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pMO9zhn0WdqqUu5krLuleog7z0gfNsoSQcTsswsRaWY=;
        b=EH0rqvBtgN+j4dIVcO1kLyznZ3o2EBNaQGjsu7hMr/bzHIxTyDkJ+wJ+/7+ddt7vX+
         GRh7meJ4kSdUaxqkm8QqqsKGgiQwS0/PJ/h+Xj5FAw1whr4YyG0C1mZL4BvVWYN2dRgr
         7xsRhPgSlT9uoSRw1Bxqxnm4k5yPVrjn8qJT0V7k2Hu1DLPTWx8urkQCkuFwZtLO7L+m
         v+yaPetknvmZXGBCNTFzYzt7dFbE4Dq0mlbsW1/tiCoIo+kzEeGlW+A2R7JepdBsuitt
         Idf/c6EJ3KVRhskTEJ/DAmGD/+eJki1Yfit10rOtrJLUQmr6AqUuPJ4es4SOdtKuQjLi
         I/OQ==
X-Gm-Message-State: ACgBeo0S5H0RxsoA4msM3EgP6kL/Pxr70YSzeN3aynPhxa/3NTIlb8vA
	D3pF5vU3IxxHQIFhQELUZcywAQ3IOLWsA9xRtvnGvg==
X-Google-Smtp-Source: AA6agR7wh9mcoL6FNlyP3aE62brlyApS07wo5gBlXPuUSYJL6d1ebY9XP02w3lB3wMLu2ft0DTlPNWVJUK6UXxTwiTg=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr15292251ybu.383.1661951989549; Wed, 31
 Aug 2022 06:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com> <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
 <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
In-Reply-To: <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Aug 2022 15:19:38 +0200
Message-ID: <CACRpkdZqvEvqjzTN3oQqrV_CNK+D2+c4FjLiC1_ZoKQ-rMMe5A@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To: Lewis.Hanly@microchip.com
Cc: linux-riscv@lists.infradead.org, Conor.Dooley@microchip.com, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	maz@kernel.org, Daire.McNamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_061951_561450_F7FE112A 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, Aug 30, 2022 at 6:51 AM <Lewis.Hanly@microchip.com> wrote:

> We had looked at the bpgpio_init, our controller is not fully memory
> mapped to support the bgpio_init() and get all routines for free.
> While we have in/out and intr (interrupt state) 32-bit registers, we
> would not get as much free as other generic memory mapped controllers.

You're not really saying what the problem is?

Is it that some registers are not one-bit-indexed from 0 per GPIO?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
