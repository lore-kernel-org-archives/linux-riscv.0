Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3BEC11F67
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 01:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9D56140C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 01:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9D56140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NDQMt8LGhY1jU6HnUJ6lzzJOBuVpa5HDRG/At2+10U=; b=QZHD/3tZhGNp5/
	Ac/N1F6pnj2FpRUvWsEX0nYqxSGBvqpJWvM0ilY+PQ/QVD2h+y49SwYuRIegAW5VeUbducodYy3lF
	ebSpSyhSwat6hyO0TDdLq2XEaBM//TulrhV1UYIhSQr8x1VK0iI0qXLulJeC3pJ4y1HGndd378dRG
	CuvtpAOXTkLcI4goV37X6+qRGzRVfe1iaXmjSAnnhCIQ3mwCfnHwrGXBk9y/btO1AjJYoPBYv6Xij
	P1EXEGq1F+pGA0C2d7wq+N0/TQO5VHLwdRODL4INPBTp5A9McoBb+jk8e7CNgMiQFUOJLGOI9oygQ
	wu0phdqXoUjYyeLiWWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz8Cs-001mDA-G0; Fri, 02 Jul 2021 01:43:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz8Cp-001mCT-Ea
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 01:43:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id hc16so13581669ejc.12
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 18:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YN8QMqY6nuPqSy+BeTIOgqLLYEAihS/aZ1GgCgQxQkQ=;
 b=Ru7hvdSR1G/gzTTJsUgdGfRUYeROFjnSSrjGQ0bXTIzciq0URxGBaKsl4Kj9zsTOo+
 KOzYtn6PcccY8ITw0lj7OlM0O8r9eCaImkoCuHI8jUv1TxMF8Xm38R1z7QaAns8X7o+1
 eBHC5R/alXUPU2W1fQ0Ij92NKhfaDjjgO58N/+XO/WmN8/1As7iKGmGgzP/Dv2OJYpXa
 O3hCAX+h4126C531rr8Eoie9uJU9dTFUwVv6JZ1yuhSN7cxj6rZxOQ6gqCR4LgnJ/C8K
 OROd3TAAsvKw+89nuklqG1vp+VBgzARcXwbunvTfktngShG4WWMK1RufoUFzwpqiCFAh
 9PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YN8QMqY6nuPqSy+BeTIOgqLLYEAihS/aZ1GgCgQxQkQ=;
 b=FA0I3rwfowyx6/b9loLtoEmJbMPd2U8jJ2H89On/HBnI6RezDocsHjIZfBXRPo2Vnr
 0m0V2zObYdOI85xW/DWp0UKhkjTfzKr8eB8Qtmt7fU515wEi9ZNv5CUfkO4SyYQ47ytH
 Z+Gz6kwunkugNNPUAgzqc31QJz3OWjilQ1OLGHgCmoZ1jsx0oI3yqO+JUR1Xp+vr65tP
 2C/GwG0v1JMHwSrWVWM2MHYALyRym/dY0s81xP8hG5FMj5P+Ixb4bk/SclaUjzjSFXln
 zwbkuu9eMqbjbE1ke9+HTHhPmTKq5mvCC2l2lVRSqHtdlQclY3x0XOQM2nFXMsYfBJ97
 v+cg==
X-Gm-Message-State: AOAM530uF6jB2ngf39BupszdtVv4d6/oOqca7+hVCQ6JPIsDKfSeeAWQ
 zT+C9oeKGxkqjiBE7LpTBqc=
X-Google-Smtp-Source: ABdhPJw7Kk9hHdtZlK2Lm1G2lI85s6S0MYbgSAlnkV/0nDEg/EWFCLtBj2xtpyuDj+9QSEofjSMVTg==
X-Received: by 2002:a17:907:980c:: with SMTP id
 ji12mr2891038ejc.122.1625190178084; 
 Thu, 01 Jul 2021 18:42:58 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id j19sm629580edw.43.2021.07.01.18.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 18:42:57 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, Atish Patra <atish.patra@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases node
Date: Fri,  2 Jul 2021 09:43:19 +0800
Message-Id: <20210702014319.1265766-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702014319.1265766-1-bmeng.cn@gmail.com>
References: <20210702014319.1265766-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_184259_532240_B1F328AA 
X-CRM114-Status: GOOD (  11.01  )
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

From: Bin Meng <bin.meng@windriver.com>

U-Boot expects this alias to be in place in order to fix up the mac
address of the ethernet node.

Note on the Icicle Kit board, currently only emac1 is enabled so it
becomes the 'ethernet0'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index a9c558366d61..16cc6573107b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -9,6 +9,10 @@ / {
 	model = "Microchip MPFS Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
+	aliases {
+		ethernet0 = &emac1;
+	};
+
 	chosen {
 	};
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
