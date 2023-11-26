Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC314C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0wwVkFLMz93kz6aVV46IvrZiwrkYbhbR86F0NuMaYY=; b=rB/GuE5+PDtTq3
	9tXuQ8EnMCrwJ4Q0tkVuGyK9wfxhvVEJ09LGF7sn3LUf6tLuyclXNFhncPeK+JZx6ZtwBNGPQgN+E
	8k5lynB5ixMSv4elhkV6Vk3ZWCYR2q8h+S8lWOcxaAJBTBg6ZahH807GIrlMNy5jszEMJoJDmTjcj
	7Vv10GaOV56sWNetlNnhYrH/dBTSrqi4zdt8Y7tFpaQk/H4oEihhSTNLqmtkb7j0VYNpTVg7ZZG2k
	xvuWrF4nGElowKOjuPmVr/HCX0kJ+trWnbLF6rrjUKLZUoSzkipdc81SC+w1qU3baeICHIZheRYKU
	dc507xqLzUozgNPcYXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OY5-00GhG3-1r;
	Sun, 26 Nov 2023 23:28:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OY1-00GhCN-14
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:23 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 23A2B40C59
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041300;
	bh=O3TPicaObXUf+CQ2/13bF4S5EM9ZMGJpI/eXjOZpsCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=SYYbIvRrVgnWK3g90+eefHIOgMfnR3aNIaytQX/w2YrobI/mvNHVrTwYM+9/UNFyV
	 xPtwk9HHwF4eK7XeYbmi1CaYLOg93jyUe2pd9nxZP5w7MQ7S9NfrqLVnqCB9+eAjRJ
	 63Gh3pKopy/HCGthMcuc5qdqnenS2LJM7UB2aEOZruoDCpGwtZ/OoNi8uoW0c4YLWt
	 qyfPf4GYWWJZ1BWnh/ZIKPKGzz6dCgq8SUFudh89BWOdMrqdSeiHx8v44jLrQRtu28
	 4MdcYcUk+iGRCyLyJL0ZMKJVoS79FA0LpKNJdyjgd95OcZUZXcDxXm5joalPoNJ8cc
	 7Wa6IdZjkQtmg==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cfbce9218bso15850125ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041298; x=1701646098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3TPicaObXUf+CQ2/13bF4S5EM9ZMGJpI/eXjOZpsCQ=;
        b=khAIlqKmTbIl/zQzUo47HXh6xyjjg3Zr9/aNG/hgPPaL0tWNCUZkkzQGHp7vo5vMHl
         Ba4q9LrYv5U5yEp2dO141Hwc6jV2Q5wZpYXZvPhi5Rn1OhQajGZ0jUBuLeQnujWLPyKy
         rtHyNsHA49B63ZT1mfDlWtYUqyHPCkoajLxfJuO/3ybkqqdPDUfq/aQxA5oxI+Ju5aMy
         ig6Jt/5V621ufCoogqpGNv6TWdoxdkWNxq6D12cixveXo6HNEpdGQu1Z4qI0pE0m5a+b
         5i0XJvhIgB/VBF4Z6FfYXBvHGbrA6xBi9snfXGoxxxKRcniBWgbwIWV0dKQZuIeROgKY
         nFSg==
X-Gm-Message-State: AOJu0Yxm1jv5Qb3ibSdo10pyehDxZybok0sMi2/nzh2t8EJBj9B7HPjd
	UHmQCtDKMLnPgb4+2y7QaPQEaEOdmChrRtkFkxv4MIC1HoH2PaSR45f2yCKHxOLS+WxBcYMznV8
	iVX2KRScWVrhV0Rsdx5CJal4Y2ROcAF/qf0srxWVmPJkrJlGG0W4Y5Q==
X-Received: by 2002:a17:902:be08:b0:1cf:747e:89c6 with SMTP id r8-20020a170902be0800b001cf747e89c6mr8786546pls.26.1701041298542;
        Sun, 26 Nov 2023 15:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFuQM7m8wCn6b39aPT5b9YXgOSCYAQDDWmZ8ylvHuaFNyspEtnWGrMk3kxYgR8lkzRlvz2bg==
X-Received: by 2002:a17:902:be08:b0:1cf:747e:89c6 with SMTP id r8-20020a170902be0800b001cf747e89c6mr8786540pls.26.1701041298276;
        Sun, 26 Nov 2023 15:28:18 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:17 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/8] riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
Date: Mon, 27 Nov 2023 00:27:41 +0100
Message-Id: <20231126232746.264302-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152821_517504_DEFD2439 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Emil Renner Berthing <kernel@esmil.dk>

The StarFive JH7100 SoC has non-coherent device DMAs, so mark the
soc bus as such.

Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index a40a8544b860..7c1009428c1f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -144,6 +144,7 @@ soc {
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		dma-noncoherent;
 		ranges;
 
 		clint: clint@2000000 {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
