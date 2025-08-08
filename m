Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC568C87FDA
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cL9NedoVyXhq8VpU47ymxdivRbPpoIAliBwR+yturPw=; b=z8PH0WBi+VjsUT
	1uJXd2W/SCBiGHpiwwuObRuTjO0+0P+U++BjuzXq2Tj7ZBN36HQRhlOkBut2X1NqgqEbVEcylsGBj
	oPw3z5xtst8b2tJ4C3DsvbGtLexpKVmnKfmPPrwy43Td6fzpd9wSHtpyXwDEBmApEfg4YDGA6hZw/
	PvEP+zECxdmYPkDzh0otIFQ+UNc/Ghrjg233qohclYDoFAyS87cAep4VqeNppyr4rrdUOWiTCY9d3
	gb+2TQ7UoWCZnpkKCxbNAw44YhCViQNBA89QZjGqwDW0A5L+EhIzSkIFYLlTfMJb18coT5JzZrVPf
	CUtX5e0Z/f4XQC6rRfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIjB-00000002Lv9-2mRX;
	Fri, 08 Aug 2025 08:45:29 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIUn-00000002KN6-1OVz
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 08:30:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55b797ad392so2207265e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754641835; x=1755246635; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xieBTMobclIdMCJXbvNoXqflE8aUGbCt52N/S4Zk4e8=;
        b=eGtRQH6yYZwk0IzTiHjYkG6T+vdFBsGZOqXT6i+NTokpzxt70GRMySLgestxKqj4Gv
         x2PKzWSrkWfbs1uhfEntsKeQSQIsw1kNeLBHmiZJzP748Bu32FprZHflNnwhCRhxFzbH
         ZakqzSRX2n0ikzdvcV8eJX3l6u5zckqwb6JHrKF7rnlywp4JtROMtm29ykkwtr4o26o5
         bvIb+NVm3wzzd482yLChpPsbEveoBHfy7bJVI69/yC2+EI7w/eqcvRNJMx/tylV26HMN
         lOuLZxBraAW07W4Dx8UN/rBuU3qtaAkxEDycu9uRQPX9dc9z3H0eXudDf6PtXPShmvY2
         rT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754641835; x=1755246635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xieBTMobclIdMCJXbvNoXqflE8aUGbCt52N/S4Zk4e8=;
        b=lFKrpfFpSpxgCDZ7xJRgzCp1Tz4YpcjfJPvRTdg6L8aB3fE+Uq/0siK+CK985OwFKk
         BVG2wKeIJmmFghfMXOpmPlOCWiMYiF0Pn4zKZZ/R5HuF2onqx/k0b3SuhM7/g1L08B1i
         AFHJIDtQk3wfK5306jJVg7YvnbJ2YCayQE0XAim0qvstRof/6W5SAUK2mSJgM5xU2cD9
         XqmuR/O59HKYv+Ljn0ZxeUImWEZFrff8L9SbrHMoQvZwbzp2iNxLJOM1k+foCbz32pKk
         dL3f6sYmGQ4cK7dt2BhjID1AjvbgKZNbPsVgWgAG/QvyqQxJ4Gx0iv9oj0GdQ51XzPqd
         v6sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwXcmG8Tu0Wm1b1RBdQEYOiGBv25SD9T3W+XUOWeA66TPzUPwLtoWouFqzXrfjQdgfRjYDLTEuBj7h8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMZkqR7/6mqKoE6m+CRkBSwPprvKVmcDb2pmMRUtBUJ4jku9yR
	9Of6XNrL5HNP5oYnPafcF275SnrB2MC+4pwcGDfurLjbLZz0EO6siYw8
X-Gm-Gg: ASbGnctczK/uVp3Win2Xqkxwu/Uh8aw0RBnfwBARWSjo3A3NZWwnT0g6/tH4KayvWaH
	uiMrgY1rOqKoJLQVeHLCw3BLMPjNKuvC9J0qMBtmsDTgg0pRAwhgRX0wJADD5obxDO0Yhzb0sah
	+ZZuRGJAWMfU3JHUUj0idORNZ1l8a2ZAXUNXrGnFQkhL3v+TWbz79Dou9qftrgHSJTQEfPtVab+
	QkiBzis79w8Oc5t4WjZmkIHxRBAsXNqyEwIfw8Q2wSQgDfycSSNWEdyWahQltN9fe6jbkLgbgvh
	AUd3Z5NyIUSyst2+Fa7u5xYqKwk9AKBR4tgy7kbaeo9IsK28kPMrjhMjp/oCNqKyFA7oDCdDAWX
	VDYpGundEOXMfivheRDDYZFeORGji6ykd
X-Google-Smtp-Source: AGHT+IEYXg7vtZbnJ2DYBddME/aAvQldI4kwG2TiNueAkrB9UxcNGaNQeqMSkd8yhFm80/f1+RGHQw==
X-Received: by 2002:ac2:4c47:0:b0:55b:87a8:6014 with SMTP id 2adb3069b0e04-55cc00ea733mr536665e87.25.1754641835099;
        Fri, 08 Aug 2025 01:30:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-332388d87f6sm31610381fa.44.2025.08.08.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:30:34 -0700 (PDT)
Date: Fri, 8 Aug 2025 16:29:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Nam Cao <namcao@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Respect mask state when setting
 affinity
Message-ID: <cxiav5ufadstautkkf2hlwkl2erspl36nvlmditinftxhxktcm@3yweuuj3q4kl>
References: <20250807111806.741706-1-inochiama@gmail.com>
 <87fre3mhkh.fsf@yellow.woof>
 <nowqjgxmomniw624avrizohwzzq7ebkznb64m25qim3zgxjacn@oizd7ngxjd6a>
 <prnjyu7ev5scocf4jh5jikox3niftje364lf3bjvizppxamdov@hbizpiazqual>
 <87qzxmpg85.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87qzxmpg85.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_013037_367139_4C9BF832 
X-CRM114-Status: GOOD (  15.42  )
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

On Fri, Aug 08, 2025 at 06:52:42AM +0200, Nam Cao wrote:
> Inochi Amaoto <inochiama@gmail.com> writes:
> 
> > On Fri, Aug 08, 2025 at 06:01:39AM +0800, Inochi Amaoto wrote:
> > After some dig in, I found it is not very necessary to add this,
> > When all enable bit is clear, the PRIORIT register of irq is
> > not functional, so only umask the irq does not make sense. Only
> > calling irq_enable does enable the irq.
> 
> Yeah, I contemplated doing this myself when I added the unmask to
> plic_irq_enable(), because it looks more natural that plic_irq_enable()
> and plic_irq_disable() are opposite. But I don't think it is necessary.
> 
> > I prefer to add a comment to describe this behavior, instead of
> > adding this change in a separate patch.
> 
> No preference from me.
> 

OK, I will just remove this mask function.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
