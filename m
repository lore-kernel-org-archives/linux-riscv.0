Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DECCD5829
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xN9uUVLwShqIYGjzkv23XgsWs0WNBhE8vQRyasd81lM=; b=YI1gwXCxEjqG8m
	662pFlu5QsHnS/21cB9wfz/g5OfTwMIlalymfO+yM5YaNXpUvpMU/S1HeIqi46I4PiahSQcTLHdjA
	UvVsdfrBLMy2sK6zb8vq/EwAwtwqnMvy7Z6BxVc6ULg/mKD1v7UXBM8oFIzp6VuIHUGVmwYB+eEL9
	sgMlTbGbbw9262LCTFZP4UU8wOwkuhazXZmguoROvkWM8QB+41oQ8yeZGQDJvvaM6bX92E/diDwoE
	gl66JyLGbjtRz2j90xOCYgU5EzsaWb+zhRT+vHIiEtxn8uFpHDBAIl1ZCxEHIUio6KV9Y+ayQvyQn
	NCCG30Dh49CL2WGG+eqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQMJ-0000000EdPI-1ITp;
	Wed, 07 Jan 2026 10:01:43 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQMG-0000000EdOL-3tNm
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 10:01:42 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso1050089241.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1767780097; x=1768384897; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1e7HzwoffI5S/6V5SheLWTLvf9f05N/KDUwstam8N0k=;
        b=G1276w88YA/COqFxr7IqGhLGN9sYoogjH9+0xFLdE7cq0kYLSFkH7zWuQZ9sZkxVBA
         3UWcvHRTYEvFms3fztE1+23s6h3dPU6yFZC4uryXj701BW7tb7Bz0QhtDuYr8pgOaWNE
         uvJEOE5ZIrkpdZ75gEz8YRXp4iMgJ+E5d7jkhwWJHgLwMd/rYvQqmEX/ukMK+BJOMzsG
         10bu2ytCXg92os8z69c5Ncws8RUMzvJS8grqwEwLoStSaASEOmp2CZ5+ZCI0+li63gn9
         ml5kdZwIY2sRqtewukj/fz5oYNU5gAxHWhAcGtEcSHtMU8L71c2IRCfWBnDNw6TscqYg
         MW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780097; x=1768384897;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1e7HzwoffI5S/6V5SheLWTLvf9f05N/KDUwstam8N0k=;
        b=CNGYWdVxxbFmHJXtIFMHs+vW2IWoXcfi3gaYsWa5SIzMzIsrkjhz/8QgQqfX7DlG6w
         HFg7KHoK2eyBg8FNQgBeidhNwNdx7c5KKSfASvcZfR1uMBKdmrbsdR06We9sud4RCED9
         37uMKfJqZy8SXiBh7UHNupwu4xzJuyoLhDZyrGgYX04PidKe7lYGTHeNdDnNcfPqShxb
         F06iEN4457m8WX/rPP9vITavXxa+DTl26SSdI2hkZBD7g93EPImUZutd39CJwhzx7ib2
         DZ5NmQPpywxxS6E5URWLttCDD6Jn1hms8iFkBDo3Yk4DpGPdVM7yECZaVSv7p2n8oNuC
         rEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVN5QGW4c4gDTXRoT2IoMfTbqF7M9lJ0vZm+nMzq8mdL5hRPfeYM13K6qLjSXRqMSXXONadi3oRNo5ow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr50G1NuYZaMCShn4y1VkiJBU4rNlWNcBV1a1TrIGI0w9SaW3T
	R03lIR/4YSWskSBwNMUUe8JWGBodepbZ/CkT3Hakn6o5UV82k0Yq+eY0+0IQWW/CnnrtnZIqsHO
	S5AR4xqMmsDWM3D9+rV6QKJE0/9UusRO9PEnN6QDEhQ==
X-Gm-Gg: AY/fxX5MIAFVxokv91tFKCCBWn70tkNtQYAZahR9QfvIaWVvRqnaDJ7jHBXS64LsTgN
	qeJ9I875IzUGZb/49R4wFhD+LawamYhFZRDLacvqNqptP8co7ygecBT40y7fOROS0zJ0tflQjso
	XSq2sX6abQAQAZfrPBslyQYn2LWyKe5IZObbU9/RrepCAhL62Rey5bbkTgvwNO4Dm9NcQ5dG5uI
	AJuYsHLHFEI8IfePSz7v1zFt6pVPXYPt7L5zh09rLHy8v+2cGLJj1cfTltxd6LSBykRdQIYyJj+
	0cp3ixU9
X-Google-Smtp-Source: AGHT+IFY9o6LoBGhJfHFhrwQmRjYbAjez+97Fc8MV2H/JqEGQGgiF+2CT3xNTtCeZryZYDcntgXs7hAyuiU8xea9t8Y=
X-Received: by 2002:a05:6102:534f:b0:5db:34b5:318c with SMTP id
 ada2fe7eead31-5ecb6955532mr709984137.45.1767780096723; Wed, 07 Jan 2026
 02:01:36 -0800 (PST)
MIME-Version: 1.0
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 7 Jan 2026 18:01:26 +0800
X-Gm-Features: AQt7F2okIYDpNGyBgdlwrVkXSKzrOvkkA7_TMkO--kZnCCpAAR9jkMnVcWZBt1o
Message-ID: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
Subject: Question about RISCV IOMMU irqbypass patch series
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zong Li <zong.li@sifive.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, joro@8bytes.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, alex.williamson@redhat.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_020140_969419_C77277F7 
X-CRM114-Status: UNSURE (   6.77  )
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

Hi Andrew,

Thanks for your brilliant job on the RISCV IOMMU irqbypass patch
series[1]. I have rebased it on v6.18 and successfully passed through
a nvme device to VM. But I still have some questions about it.

1. It seems "irqdomain->host_data->domain" can be NULL for blocking or
identity domain. So it's better to check whether it's NULL in
riscv_iommu_ir_irq_domain_alloc_irqs or
riscv_iommu_ir_irq_domain_free_irqs functions. Otherwise page fault
can happen.

2. It seems you are using the first stage iommu page table even for
gpa->spa, what if a VM needs an vIOMMU? Or did I miss something?

[1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/

Best regards,
Xu Lu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
