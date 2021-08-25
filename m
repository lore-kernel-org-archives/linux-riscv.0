Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CE9C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA33B610A6
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA33B610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W24fUbXgkewQ6rrxhF++Gf18XuusvZVxIDTQPhr/ui8=; b=Z2T22PgKe/QfZv
	1mEaogI5RHIwA+Hpv1LTZbpoRfFgRYblJJ1TPF2gyEvWagDOI0+qlpZlijY5m7YtjcocURXtCM5yo
	RynJUE+m6hSwNj5sqwjDVoJy27DSUVUZmK+vcnBQyXjkvK3srGrzxTReoVgNkUso4VpjM+me8s0gJ
	7wE3r9OOv1ehAlg7Z3Ly0ebIJnw+a04Do2ffviTglllDeerndarJFrPDREAsR/C40EkmP+3f8sNtS
	WzWz8TUhIV4uWvAInbsTPkXGXgM0nifBNxuU9K5PwFdODgYYLggOy52vpJ8hteI5ydWd6Hj/OiGMU
	vxxqO8EluP1W8bVXekJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsdV-0071bB-MQ; Wed, 25 Aug 2021 13:08:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIsdG-0071Vu-5S
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:07:58 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D80734079D
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896862;
 bh=KyQicLYMcvTUsuouhObsDgwfTY/CvChfVjl2/JZq64I=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=R115xsZyxH/Q76lTbQTEzk8Vm7dyFFRhxmffMtnTk2BfHW0LRVic1GzCiaUfXO9MG
 TBh14iO8Ydy2Soc9itQgVJDyhJGyJpvJYFYMHz5+vzdn5/oysHjPi4VcgwSB/9EfRY
 yVUJn5+1U9Nh4jl7fLV7pbGxkr9s2vTUHcDCcZ4VADQAwosc81Un0Jrhdh3Y94jo0z
 uMHL5Z7ArGB2E4OmwygWyM8nmV/BQFM/S80XD2P6gLHlPtfYpimi/SRPniV800MpUC
 4pCIb90XRiQxpLnz2EYEoquj1hK976AXaAr5UuwLPAaPSL3CkObmrWoe2CyOzOxYL6
 eiRu3blQBXZZg==
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso6609134wri.18
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyQicLYMcvTUsuouhObsDgwfTY/CvChfVjl2/JZq64I=;
 b=Nq2kpvyCq2P/lnayu5M4Ua3LfYjU2S5j5zPUfDWd4znUtHmrl7AqzS35Cb/WNHej1Z
 mkRQLq3CiMugHWyN91iVtmtENOiZxMHd/EQLkCLaKKMRUJj04flqut3SaWeH4qJIkw6X
 N/MQu1lxAyscJMfc0kBYHHylXHK/XgsM7CTAO1U+i/qxTMibCkpIAZXGC1WMvJkgT0AI
 HdeSYYAACn8nbTbvrFrX9yuhW/9vqOYdLSdjTKSKwBo2QetnBEAkoWNbAD/BawoQcJw7
 fsLOZfKctzib0m4aSzGXQkf39eae4w0fJQLE4XT6j0TuBerAiIZYK0+8gGWsNhQLA/EW
 KQGQ==
X-Gm-Message-State: AOAM53266ljnbRFbacpyuG11lgbn+stJDlgIgZJt7N3+OWZxeiW8f0MC
 /g7OldOdDeTZODjpr8MaefEdldCqfPLkZyfljt7+M9jBsunApbnLUp2ipq1e20SdOiU7xbYN+Ld
 c+a+JxVVVueNz7HsgsGvFELfsbNM0BMRnTYGz/bji8qXZGw==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr4414935wrq.213.1629896862478; 
 Wed, 25 Aug 2021 06:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymGaQjcUdOwV3zt6DSSauTaARbluC+y5buqBuM/DilS0IyIs1Ghq/n8Uq9R2+mq2+IXRyyaw==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr4414912wrq.213.1629896862368; 
 Wed, 25 Aug 2021 06:07:42 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.122])
 by smtp.gmail.com with ESMTPSA id z8sm20944201wrt.77.2021.08.25.06.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:07:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] riscv: dts: sifive: add missing compatible for plic
Date: Wed, 25 Aug 2021 15:07:05 +0200
Message-Id: <20210825130705.203824-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
References: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060754_379228_5F1BF31A 
X-CRM114-Status: GOOD (  12.74  )
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

Add proper compatible for Platform-Level Interrupt Controller to silence
dtbs_check warnings:

  interrupt-controller@c000000: compatible: ['sifive,plic-1.0.0'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 7db861053483..0655b5c4201d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -141,7 +141,7 @@ soc {
 		ranges;
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <53>;
 			interrupt-controller;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
