Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE30E77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YDmSS2hkndtYbslSPMe3rVcNJpc3lf/JBJazxS+Pi/4=; b=vQjXrhF5MCK+IY
	fKuSubrP6kp8zX7PfAwAvemoYiWW67ewBlB6SUc/m+IiwSwS7xnYTEC9Ldq0P/Az4ZouLDywO/GtF
	5+vSiyjIzyFG5bMxvtzEGpuuzlXiUY8tiheDYNlwSIVBI3D81/WfdWsPXm4jbio8PMuLnoh8st9Yq
	A0N4yMsamAu1YOvnOan91zFmEJo0q1IMIyPHdzCjc7Fqp8Yuhdkk1ry5tlobBeI/yeLzwvT0T4rWj
	x8mOvdB3qfs+HNd4QkDLLrt2za6TvyP7XkCKDjGK7AeD3hNSQyRkesbFbXLV1oGOg3QWeDZ2N8GEW
	hzX360EqYQs/Pwlk/kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCcO-00000004zyE-3Wah;
	Mon, 30 Dec 2024 10:03:24 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCcM-00000004zxl-3Bg7
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 10:03:24 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-21649a7bcdcso113661085ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 02:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735553002; x=1736157802; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGcdgmSPp8Rl4ve8WcljtcuxciOP3V5C9soW1Jk7mGg=;
        b=TsHh2x6+AA0l2WiQOh+7cKu7F70jDLyzbebQabX/csUbPOqIZh1wvQFk1ar4vA054r
         WWDWxzZSaIUUNweujcg4SrAg8MclR04cwhLrmQjge86mKHAWuO3GJ2HlAhC/M2gAYE3t
         J3+XsJvIpUVp4c2QXcrtbOBTDKcMAkgBTjN+XDv1w2yVAh4I4Umm+gyVv4YcQM8GrLrX
         7Xb0jzTRlrtdoi9vM6s8ldVfLrGsCOu2aAJq1omNkgojRHG/VLHTk9zZSwlmtzblnPSn
         +d8dXHtPZvdtgKflpHIh4W6B2NeceHenaIpzqjmEYs7SLnWtkbRtsFIXNQOO0r0c7IAW
         6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735553002; x=1736157802;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGcdgmSPp8Rl4ve8WcljtcuxciOP3V5C9soW1Jk7mGg=;
        b=FteCEksDrM9HAav3iPSXYdkdRahElvZSOUVa7DPfdNzjxaH6a0Ok5L04SBbTHi2w+T
         JBtxiNyVBY5Em/FbaCBh7PSID0y33y7tzeTJob4Zbpju56J2CvBbetzHf0D5f9Utf5z2
         fi5zf2ujBSPkDbqMQvdkENfu4ZiFeyBnrO1hweqjccG8NFzg+rn8rBJwuXFFuXkh7/0K
         wU+OKpsK2Y+61gdEhQ7XyczBviNZnN79dFfOHc85j10NrwqmU5ArMIN0bz+eVlCBx4GP
         uQpo9GOex7euD8hXLZALOnOJ2j1qEp6rnFH+cbx+ukbZRDr7kCOM/q0P4GfCgk5yAD49
         6WzA==
X-Gm-Message-State: AOJu0YyD27K5KHED8OjH0l93qn2R6ieG2H6YU7CgGcL3srfygLzmSbwj
	aPnt4LU8QD7WQXhFp/dqBfX88xQxq2JJImHSfiJJiUnps0uePgep
X-Gm-Gg: ASbGncuAH2eOLZd9/18llk1qH37IL+rj20miYfFbp/ZPDpgvXeWgNIfe9Vn4gg7xwrx
	mx6NCjwLcW2G2l02/iSXNIJsuGfh0q7JcH+ZMMn18JU1wxQA5q7KGOMJRhCEQbf85iO8/K4uIKJ
	qVAt2QvNFsNdgdbuSTKg8qoh2Cip5l8HZWgXQffPdWNN+PXXORXJQ2iW7sCbsyJoa3N3uzvTZnO
	QoAMgBEVimbX3wo5dWWnOM2Tu2aOhkYewtbJoPVeasM/RkzKZy4HtoiVYX4c916
X-Google-Smtp-Source: AGHT+IFxQtXcUqnaBXMvwVGaoOUYs6B2QF/v0AdY3gjC3294y6oxY0eiuEfhGeiAYtPx65Wz+vhr5w==
X-Received: by 2002:a05:6a21:900e:b0:1db:df34:a1d6 with SMTP id adf61e73a8af0-1e5e082e79bmr49152095637.42.1735553002000;
        Mon, 30 Dec 2024 02:03:22 -0800 (PST)
Received: from [127.0.1.1] ([106.114.236.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f71sm17328587a12.9.2024.12.30.02.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:03:21 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH 0/2] Add support for the P1 PMIC from SpacemiT
Date: Mon, 30 Dec 2024 18:02:04 +0800
Message-Id: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1vcmcC/02OSW7DMAwAv2LoXAIitbjSV4ocZIpuhcJJKrlGg
 SB/jxwf0uOQnAFvqkkt0lQcbqrKVlq5nDvg26D4K50/BUrurEiTRdIWvhGuCNliyiMHl0dS/fZ
 aZS5/z87H6eAqP789tx7DVy0Oz5Y2uLcKMSyprVJhlnEeJ51ZgombVf9fOCTtye+SRphSKwx5B
 UzJoIhMnClubrf6ToAvy1LWOLxLoMCTs17EEofkMZOdk3jttZMgBgMZZ9Xpfn8AjwnWkw4BAAA
 =
X-Change-ID: 20241204-k1-p1-d41ad7c95d72
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735552935; l=2380;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=fI0SD4pW+QS8nc8Wtiy3t42Rgh3UaOlu+jqWvydrJwo=;
 b=UhyyEJ1EwogsuDv3Id3hoR0cg5sPnSEbuP1If4fUFCbeiWOIYm4Z75BcR27meOATZWSShv1eF
 n+OVvy3Nz+iDt1B5yAEGTjegJw0Qa63i/rcbiQD3w4k6okaB4ke6skz
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_020322_823578_5A0D77DF 
X-CRM114-Status: UNSURE (   7.29  )
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

P1 is a multi-channel power management IC from SpacemiT.[1]

It has 6 constant-on-time (COT) buck converters, 12 low-dropout
regulators (LDOs), as well as pinctrl, RTC, and pwrkey functions.

The datasheet of P1 can be found here. [2]

This series is based on K1 initial series [3] and I2C of K1 series [4].

Link:
https://developer.spacemit.com/documentation?token=JtOgwFZzGiExmHkoLFDcE1aSnHe&type=pdf [1]
https://developer.spacemit.com/documentation?token=WsLAwb7OqiMbcMkRZw4cVJWWnlg [2]
https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [3]
https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com [4]

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
Troy Mitchell (2):
      dt-bindings: mfd: add support for P1 from SpacemiT
      mfd: add new driver for P1 PMIC from SpacemiT

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 153 +++++++
 drivers/mfd/Kconfig                                |  14 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/spacemit-pmic.c                        | 159 +++++++
 include/linux/mfd/spacemit/spacemit-p1.h           | 491 +++++++++++++++++++++
 include/linux/mfd/spacemit/spacemit-pmic.h         |  39 ++
 6 files changed, 857 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241204-k1-p1-d41ad7c95d72
prerequisite-change-id: 20241031-k1-i2c-master-fe7f7b0dce93:v4
prerequisite-patch-id: 9526a79ce73cba25daaf9d748aa0073b5f0ab283
prerequisite-patch-id: d75871ad3cdf179f429be441cb9e69874fb83d1e
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <TroyMitchell988@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
