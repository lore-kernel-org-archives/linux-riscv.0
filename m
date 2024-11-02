Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC28E677FC
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu1b6UvcPr+IvvKL5N/zALTYSvy9ziDPd/hUxBGIi4E=; b=wXJzSQ56HH5Wyl
	pKIY6kaneuHSad90c4DlRAoI/QTVv9ltAwDjqHHI3+Jee/bpezsLkL8HO7Vrh1swfbLr93CvLrlay
	LiW22LWN70Jn5opBBg2d1wwkRT5S8OznT0a8hlORT1BDKv0xA32NM0/00JE01iKvvnjyHE5pdGMg9
	DyEtNstOy3fyQGDY0qWIJh0iNqkW9QG/vyawy2EMduhXIIHPbHBvO3j3k5GEPGH3Kuh3/PCQdKUmC
	Zj35le9d3VC0rKfLMK393HuHFnkjBnbM2GrkZ4I0LKqu+wxflC7+PPOCLT2KEcsxlMPmtu9n6EYJx
	vmq7EPahLDznyF/wcUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CmY-00000009ewb-473y;
	Sat, 02 Nov 2024 11:59:06 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cf3-00000009cvA-4BmC
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 11:51:26 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cdbe608b3so29420535ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 04:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548279; x=1731153079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SumbS2GlLN6Ge4KobuqZ4Ta6vn1tA8zUMD7vy4+oyGA=;
        b=Obi5Q6mYdF7UFx8BHSlyFrhHK/U7R2h1z/TljLTu10SIKYOsiyDZf/Snj0R0EM6wFN
         tACFgmX/mjYNFl2wAQ5UAtLtsguq/SdN/nnD1Ok45HBYEhkNry6FMfB9JTH0MKO7ICiS
         82HHtKqG9f0iHEs2QfnFRWrj7ZHP0Kvwz9nxstS2IGcc2Nvw6WWhy5LPhxOVofRcmYPv
         XqQQg/qDEoDfKiVRl4FlOYLudVR79NLGCQLZBddOhvMo50+1uje/zU8VxKK/HEsGZogz
         RBdy2ek9dP0/K67c8KV3baS0vKGsLrL5cg9deOKC76ibS/tr0kZj1Zaw9f/zEeF7T77s
         0oHw==
X-Forwarded-Encrypted: i=1; AJvYcCVIkostpIaMGhcP7Sc/5BrSl2PfcPb0F8FkI/s0R1wiokEaLo5WdjTVwz4CNbYoY/bfFO03ZYgg4KHlOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuFwz0jaXDWaWdM/kEu4G4lNx8L0nc9MjqhN8drQSKR8I6TVfk
	Sti/1RyCDpDjD7h3z66GUL2Md6Z35Epc3RyQv89t6KOSqJak4AF7
X-Google-Smtp-Source: AGHT+IH6jVuGSDDb5B4lDu4bF7D71MjlMGLUoBzzLb13+ySFPYr3w6Q7+xKM1bHXJ8Sh4Ihl+rI/UQ==
X-Received: by 2002:a17:902:e741:b0:20c:cf39:fe2d with SMTP id d9443c01a7336-210f74f48e4mr184327185ad.5.1730548279202;
        Sat, 02 Nov 2024 04:51:19 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2723sm32849345ad.178.2024.11.02.04.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:51:18 -0700 (PDT)
Date: Sat, 2 Nov 2024 20:51:17 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <20241102115117.GD2260768@rocinante>
References: <20240814-setback-rumbling-c6393c8f1a91@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814-setback-rumbling-c6393c8f1a91@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045122_208056_429C90DA 
X-CRM114-Status: UNSURE (   9.51  )
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

Hello,

> The current driver and binding for PolarFire SoC's PCI controller assume
> that the root port instance in use is instance 1. The second reg
> property constitutes the region encompassing both "control" and "bridge"
> registers for both instances. In the driver, a fixed offset is applied to
> find the base addresses for instance 1's "control" and "bridge"
> registers. The BeagleV Fire uses root port instance 2, so something must
> be done so that software can differentiate. This series splits the
> second reg property in two, with dedicated "control" and "bridge"
> entries so that either instance can be used.

Applied to controller/microchip, thank you!

[01/02] PCI: dt-bindings: PCI: microchip,pcie-host: Fix reg properties
        https://git.kernel.org/pci/pci/c/ae5ebdb405dd
[02/02] PCI: microchip: Rework reg region handing to support using either instance 1 or 2
        https://git.kernel.org/pci/pci/c/e071e6bd9940

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
