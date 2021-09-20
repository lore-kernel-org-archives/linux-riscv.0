Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0979C6109D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0979C6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhb7RCU7tja/29QRhVBREFdj1F2UbU14O1FaSjZ4hDI=; b=nNEXjQzEBkqmHg
	hX5k+k5JXzajx3PHEbZSqqrFKHS4oMlTl1IIX38E2agM05vVDAo95u9XKfJd8On0HADLE0En/aw6j
	13peAidgtom9OGhioC+9RGa+GGdVB+RfuhxchgAlv0cPesjzYELC5QdqpVFYJtIole9K1bLicGhWj
	310uxdz9GWhxyaoMGBCxeWc2qoYLoVye56s7G3mvhrPPaIAusK2BfLFE2cJtq7FN0+MPi7iUgvkn1
	fGYAvaw9qaJttA1pCKknsVBRiIB6lcKMGLQFvIivgog2UMLm3F7cO61mdwXktB+jZS08T9ps0jcqr
	wvGXkmFJVXNVM4F180Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIwo-001iMx-MC; Mon, 20 Sep 2021 13:03:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIwl-001iLC-H8
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:03:01 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C3DE94027C
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632142975;
 bh=j2CmHETEfQosnB82At+fI6P+jueRuH10iqGIAMLDsaM=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=a/XsqKISwnWuOZddIhwBuGGvUE0Y1HzYT/qgunsgIVBpcBVWt/kefgBOtpsAbW3le
 1Ow+Vk7OFa11Dqh2uYJKf079nCFsHBFA5h6vK2VyyZdEHnlnLkztmtnvaUyeQE0kBk
 +SKXVPzaAWlLpmg4u8pMF2Z3mMWj2jrAICPAqz/MMSFxb7wOub3IptAIg4sx2DftZd
 VAVE2VqjpzW4JPF4aivCI2ub/Lr7nXL6GxbjCumj7YC4DLeP16Oz+bhuFX60qmeuM6
 LHPd85CGY5CNeNpx5CKGz7G5/RpzpRRmu9UNV1+9nxZeXkZBOxjZSccuE3GbqIY3lh
 NHmncnI+w1i6Q==
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so765299wrg.17
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2CmHETEfQosnB82At+fI6P+jueRuH10iqGIAMLDsaM=;
 b=HgifPNEchKo19XDWOw2QraZsc9Wgb3/83K5fczEZNu6Volrtxp2K41OGyao5wJFY60
 zab1n43DZMqDMKTtp7eo1LBA3kAfhIFm7IkY+5lU4X0tclZwE3SzpfpgxReGkFl/wBeW
 Jc4QlPnwtyDs43XbPD83fxNFg/khuJA08BS8wkh1Q0H9uLYc1ErLTz+rqd2xnQWsMfp2
 Fs0J0rGOn60SFT0Z0NzUBJRAp/7KPff59BQbz1tJU+grK8vBq5K5VespR/pJil6bvUvx
 mftTt7NvDJ9LgYYEvCysGv27bWH9TFaVcTY/Km+utfF/bDVFaYsKRnwJbUsrum4PLgSy
 /onA==
X-Gm-Message-State: AOAM532MHZlFC6fHOcNkqlzdLHW7RoV0Vxe7Bf8sy2IJQbRGerNOAarL
 IQXVOH2Q/OWIAWG7k0jm+hzmLcE0eH68uI1gzqiS+feYMdRxfZ3FZ97zuytWTZIMEkaT8ih5VaI
 C3IV5nrpRpnkDB8k5dMRpV8nUMGoYD3zw7entV7jLE4F0AA==
X-Received: by 2002:adf:e404:: with SMTP id g4mr28306941wrm.143.1632142975478; 
 Mon, 20 Sep 2021 06:02:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiTYrdDxqiub2KOyQQ42IZNZvciO4cl4vo+1KIELCKpL+m93BjlF0l1Kc9M07XcebqlLriAQ==
X-Received: by 2002:adf:e404:: with SMTP id g4mr28306924wrm.143.1632142975272; 
 Mon, 20 Sep 2021 06:02:55 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g22sm18015331wmp.39.2021.09.20.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:02:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 2/5] riscv: dts: sifive: fix Unleashed board
 compatible
Date: Mon, 20 Sep 2021 15:02:45 +0200
Message-Id: <20210920130248.145058-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_060259_746551_8A3FAEE3 
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

Add missing sifive,fu540 compatible to fix dtbs_check warnings:

  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
  ['sifive,hifive-unleashed-a00', 'sifive,fu540-c000'] is too short
  'sifive,hifive-unleashed-a00' is not one of ['sifive,hifive-unmatched-a00']
  'sifive,fu740-c000' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 633b31b6e25c..2b4af7b4cc2f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -11,7 +11,8 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "SiFive HiFive Unleashed A00";
-	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
+	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
+		     "sifive,fu540";
 
 	chosen {
 		stdout-path = "serial0";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
