Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F85EC25B46
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQg1ahSSjll5Xr5rlqJEUaeCfdj4HWONTDkyuQFXqjs=; b=U33K5E7osY3zAJ
	nMRapic2bc0CANPN7fw5s1qe/pP91Dans8sn5ra7KkBBcA+D3lRFmE117bCVfG2Yd7vj1bF68okLN
	GIxPnZO11OB2j9c2S5fGge9r+05FOE/DJnEOnt0vMBCql44PYRfRXF6Pv9cMCWuZXZ1o+Qzod1QGo
	GxJA4dF4LutoWnL9/qqbFecNjoEPxXxMMjGzHp4/R26e47eECy/ULSUhcp/5m+v7tMi3biHRhDLtG
	H/hlFJvGm9m51zd3AAOyMs69QJKRpxgpviUpdOgFTXSncxR1Ek7U7A/EvrKUgKjuVIghpmdmj6jVW
	QuUDKfE9x02vAGuXftVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28n-008HSU-1O;
	Mon, 23 Oct 2023 21:07:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28k-008HRQ-1y
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso3089887b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095228; x=1698700028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=DDMXoSmT258ke4JTvDMa0kLmCYm9f8npXYcp7cTRMm3209NQIPgkqw3eA4bXm7oPtx
         CYz5MQSkFfIiQansWnP0B+nk6LR5w6SYsZai0B932H91UWi2f/1AIgaDueBiL/0tb76O
         sjNBRQ4jPWpEI9y4DCZ5JRWRr7zjK3N6qEQz7lwaI/qnO6RF3HjcwWJkOoxVY0MZPe8G
         exmCGI30MZWR0vt2CJ+X5punZCg05SUUQSIyEg1WjRsDlwYz57hBDgD0GOFbuh3VHQQx
         uKVaD+/4C3ohmruMF15mYMeOZj5YQT315ycQ69BRvqRqq9NaC/e9Qnp9AKNBEFLW0Adq
         3Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095228; x=1698700028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=bJztIFpRbX8Z4t3JREvr3pIfd6Q6BOePvnsrtzj07SGisCKgg7EBMwJbY6/QPT23b0
         IPbyhnGpfB1WzULoLV8oipNgZ8wR1tAy/yE/eRYV+0qm3DByrN2vzSEfKvn2F5MJ7Mcg
         7lth0WS3IG7aE3mMvBmdACgLoiCg4ZWGSL5omYTTKvRbfTJTHonYPRhGd66nACC4Y/nZ
         sEXdp+X+IKXdy6yEWWFFEtwDKoMZZ75x2MMWGsJMJetXQuCqFqhWqKBYOb578iL1Nyn+
         WRPtfW0NiE7Ips/n0dAdwPmWyLjlUnAapp9K17Z9E/hb3N1j07cmnzkfOpXi0ZECKovl
         bjeg==
X-Gm-Message-State: AOJu0Yy9zumoSjsQ57Rg3rpduJye4qxFQWrp+dsknZDaH37QTiWrTJHd
	VTI2SJIsOjlaL/BwEa76S7LxLA==
X-Google-Smtp-Source: AGHT+IHg2DJovAjqpJT0F2jI+QTk8wrRUPX+s+/oRc6HVoE46LtmMtUe6Ux/OkxysbrGwtvFIKXQNA==
X-Received: by 2002:a05:6a00:2d8a:b0:6b3:6bc6:68d1 with SMTP id fb10-20020a056a002d8a00b006b36bc668d1mr8143052pfb.11.1698095228217;
        Mon, 23 Oct 2023 14:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:07 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:02 -0700
Subject: [PATCH v3 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-1-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
In-Reply-To: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=752;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=N4XyeVof9hR52mLfjwIJ/Ek5oPrydhGBm0Gy7EtJsFw=;
 b=XlUrixYReEkCaKM92PMn6rpZ7EjDKaegEVrHET11pyZ3p0c0MiitT0fAg0daqcrqIaa30x6bC
 sTTU5RTzPioADAd93OlwzXiMMqK5rS1emB3BmrleXQS2zxyqd/EnGdi
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140710_648088_D81F41B7 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible value for the T-Head TH1520 dwcmshc controller.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index a43eb837f8da..42804d955293 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3568-dwcmshc
       - rockchip,rk3588-dwcmshc
       - snps,dwcmshc-sdhci
+      - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
