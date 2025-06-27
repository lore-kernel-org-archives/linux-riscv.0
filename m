Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C6C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg7713pLPYnJiPK7sQmDs/D1CFzNqsIEn19NlENKvWY=; b=Bkv/UVkVh1txjZ
	DGOSQS7qOQBxbFDZumwfE/p7Rpnyq4FoGODRd22ClWEBijUzSnMVrKebLFD/DpftWCva9v//5/IxZ
	otIw00ELoloiPxqSV4BP7VkLQmojgTAw2E9MEkgbCnl0JMAYHutKIOOurdKH8oGJUrIMdnAmjWF+t
	zKc8h29uDrQwkFOeVuP4fOhSLndWFo1+XoV0RDFU6qNJqILdjB+ri9anLvHKlLEIaC3ef8YVwUOQp
	cv6z82D1prv27tlcJ1N9hO8wV18r08pJ1MryO7KgcoEcImP7VGixMZpPxb5OocdCSjYwNrCu8m2Wj
	lGRi3KlQV9pxsu9gNFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIYD-0000000G11i-0Ew3;
	Fri, 27 Jun 2025 23:32:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIYB-0000000G11N-05sL
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 23:32:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23633a6ac50so32785695ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751067126; x=1751671926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=T7p0mJevw6kclAZ4kaqwlkRvu0fSNV+JrjMV0MpocEmuPdMChON2S57hR/LHTkFx9H
         JzpVKS/X22t7FHmap6Hkyx0DFf1/ZhsdunHUGnLcg8HZfNVgYoVsiub18aX/boLQTMoR
         yie+pF4W94bLmm1NCl33VQTQQYiSylybPIdo76qMUdRHLLwTBz56462GT934E5TXJmUP
         fue8IyyvF2j4QnnrYXFiaIpXKE3ddfUJGefQDTBZxdZAPZIepohEZK02RgmiP/vV9+Mk
         65uN5vKRoObRmAHdDTZJOT4LzWxR6ibNkCfewHC+nb4DSWsY6RziZ3F3gqDMZxAxVREj
         T8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067126; x=1751671926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=Fs/CAMXj1VT5IAlq8TNA7djcITfoyDKj0VlREzQ3vKyLkj8L3eZwOlHCfoAgX8u8kS
         pZXAwP4aWHRMYqWxahgHAprAuncN7CVl2qsq/BBMBVeE81aA6a5Vylrj/sEVRr7ykpOe
         vOg+SSFJHEH9kI1HQtxAksQaZ3QxU4Bi+2eg/LxRpUtL0CwXBmNopGuAPyxO1iJ5W3BO
         O9EQlASAgTRQSRvaoQ4+MO1YxhB0UGWx+DQzmH9SpTk4pwg8CJDe8rOzy7jC7EJ+Ntjo
         ym2Z3iyIbYzfb7lGKQXmgJQEYkq3A7KpOS6fTgjGWEiiwfmVev2WR+FXyyrSekD05wWu
         rm2g==
X-Forwarded-Encrypted: i=1; AJvYcCVWdH+CdrhcO5TN1Vo7DHj4SvLLMYRg5uDi62Z8KqwaQX68c5RICc4SKHKPmgevKPAsZG9pg+pEyveqYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvsk6XP+SgvFZtdVZCBBDUANGoy8QDUeQp5o8rYpOxCHsavyd
	MQEzlliID2qfXRlpl8gmp4+3sSrE5tZT2ojufzuEqER1ymn9bES0pPlz
X-Gm-Gg: ASbGncubTEd1PpBnoSbWf3nyqmCyYNH6F0fwzgI0Nnb1P2LEw59af9b0JmZou/Jy827
	m7n+N5Q4+tN/23J7a44hgVKMAwqahU1y0zygzEblTU4MjjIdNkykVEC0Cgcrck7zWxf9TBhUd9M
	7Kgb2IYi+ea9+aCrfFIiwM/vZXj/iwlhF3nLZa28kz/Z9gjomnhnrNqbJ+jMWFU8WX0qUHPs3nW
	+WoRl7XKenNinrwQRR++opACrgGdEXBkZRlpmabFrWm1QxNG14b7dAOiNKJEq0wOCVLmmpRmw1m
	jKqfLyA2KraPNE4BcS4+6+Psn5qN5Ev0Qf4bB6UCLTzX7SzEmAVHWFgQS42q3A==
X-Google-Smtp-Source: AGHT+IHg7vP7/d9S3v6EOl8gQObtoAsfGkXEWElQTHDuv46nJXJg9sI7JyZdzQjwWXqvHw/s8C35xg==
X-Received: by 2002:a17:903:b8f:b0:235:88b:2d06 with SMTP id d9443c01a7336-23ac3bffd96mr67891485ad.6.1751067125934;
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f539e6ccsm7564660a91.17.2025.06.27.16.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Sat, 28 Jun 2025 07:31:50 +0800
Message-ID: <175106708298.79260.10445943203117657356.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_163207_067082_408729CA 
X-CRM114-Status: UNSURE (   7.63  )
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

On Tue, 17 Jun 2025 15:01:38 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/fcb3f47c81afe43b336bf8033234417445789807
[4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/880f18ee6772d4add69519cb7de2fcf9f4769cd6

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
