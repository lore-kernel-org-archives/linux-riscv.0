Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BE0CCF2DE
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0v2enHOLKEl2OYOS4Cijf8P37IEAiIXncGHIoZH+WI=; b=iTsyik86zLADFk
	81h9L5pbEPWQRXJ9GdGQChg5gs2wCAbzqWmIhDmKWKXjdj8jleo46aU5Yj3efmXNMft+3WweYzWHA
	HLwWKlAFoadOEpDwOytAksPtzw7t+XMCUTlNDEBqWaR6rpQFNSL4tkqTfP/YUjNA/yMZ5XQQh709c
	eu0pIi+C9hHeoWAUECuWLloLLzwswTHVWMWurqZTey3MTkus0GF+bx79VpxuCM4Ud6R5Qg4zGsf3t
	z1M8i6lny56TxHZN4/wG4dmRRDjnRUxbvlFUnqhkkk4nyWX5VaaZL3KJgULBiWZtACvGjQflLhpaE
	QdueVJ5Uo1wNgQJrRJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBS-00000007isk-0tWS;
	Mon, 19 Oct 2026 14:17:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBP-00000007irn-3fnc
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 14:17:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9f6a16aedso4949715ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419467; x=1793024267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=f3JoR8xTKFgo0wyZLIgE4wAFwg1NVgL6bU3OyGPMgXONt3qEO+B9dWT8KkX+PXhrJd
         75pxfKWDLCvx15atWSxD850RKNJg+okW33rOKkxD7jPXpLC8Xoppjrgepk1iHZGK+KHM
         xOQxANJGiwLkGkXkSIIvUGSBhk9c3ytEUWgxQn3zjI6DwFiLt6H4YoAmpG4IeJs3lkGG
         vskystSa9K3h1CqMOC17M52b5hbVT6iWX1BfWcDg1sNkD4lqrlopRHMhp/oDqnJWEKBU
         EUdXvwt/460S2A70y/XitYpbpiMuqq688ENslfkZ32iM0PcUHcUT79hzkouaPue4q96x
         fzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419467; x=1793024267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=VOAmNNWgicGsV0ZqPsj7/5GbgeWKCk4eJb3StWAVP0QYyj/PMfUXzmFqIBgLJiQ2Fk
         fSjEdEpuyNLD2DtQe+0UF0aoAl0OCmNSngXEwOfZ6QZ4w14aHCCqbTvgc0o8Sd+pBq7X
         ieajHGk0gx2z8lu7Th99yCwhCD0AsIhvPNl62mDMUrgPEkpakKrt/lbin4m02am5chNI
         HlqYJXPYtccjUL7CPgM2lMOCJBXj13laFudmWUCPMS6hPz2sWrHcGy9bBS2NElj5HZFM
         Um9EoIQMgHTPHZmO2wk5GAzK+R0zoCJbyoiP/uieh0vGIZb2AgAYA7aYDFFQFUHBVwWV
         F/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzEsJVy+YfOqGc1pXs5xwOATEO+Ywcni/i79o57uOHP7nKpRUfjEwn3plKqUEjBDN7EQX7afYmjShv00Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJur0HSkci27tzyDhhmjSvuCokHN5ssArrA/IamhUUDTvTSiv5C
	n7rgMkXTEFhhnUKwzBu282rRhZJLe9GZx92dIbgBZxRu+Q7oT4LA5cs9
X-Gm-Gg: AYBFou3yIVBE1YQzCFwSSZCT32vAMDu432oIdPdH8LBonYb1Z7EJrugPsGKPkErI2RL
	i4W/zPEyudqsDqOYNAr0hAoqU0ANHCFHGVbnlUKIaZx7iCungsaOq6/LpPkoHT9VuQPd5fS5Wxo
	SG0ove+I8MVKtNooMvRBilc06oHfispVYgy1nW1MTiVQ3q6gmIDmnAEWSzjHryOTkXQ1CvJ3PEZ
	Pqil6syF35uIjlLc4Fpo1jXKAInzhz0glCK5XqhBr3vqV1Ry8rVeYWC1rJ9KGEHFelY5zwR5hfM
	MzReJjvrqA3eBge6NjibQqGIv/wz+HBqf+nDy3Iq+PUoOwFHM4QYQbDD0XGaFHNQ/t54EP1hRiL
	c30wSYJkEeuJvFNNd1DZ7r7RucYRv+7NGSq3IWCTpdjvaqmlh0QE5mIfg8TOgNL8MhSbLAOEV/p
	lyKx383rPaq2+qmCSEANiLnJFudlO06j4fvcrNcgqwhLdyGCSuZFvRfxNgqt4DPepR8FMLBTNqe
	OgHTIxe0ANk5XR+YWeLsSo0uPwOxyAX86bfoGa2lwNS/zixaTY0XfVQToE5EqUk56O6z0AVf+1H
	HS+fbmrr/kQ4ek8IdoKl6kZICtopPJ0aJieux0LhSL59f/CWqfuXSQ==
X-Received: by 2002:a17:902:e943:b0:2e9:79db:449c with SMTP id d9443c01a7336-2e9a6f55653mr62822605ad.47.1792419466462;
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501f933sm1697925ad.50.2026.10.19.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:38 +0800
Message-ID: <20261019141740.2077086-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071747_916291_B32E0290 
X-CRM114-Status: GOOD (  11.27  )
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

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
