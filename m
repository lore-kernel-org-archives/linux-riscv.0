Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0086BC46CA1
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQg1ahSSjll5Xr5rlqJEUaeCfdj4HWONTDkyuQFXqjs=; b=o04xzxSRyHe3m/
	6twk1fQBAmbO7WEJWcwCBVUWG7a4F139dCVCn/4c2OojIGJvSiRDwaZl/+/hrlgXmc0dup3mW9S09
	MPbyJkKNuMOQKQJqROwK2LsVxKyt16yN/wF3g4lb2gLw2i/SiJE521LzTwSXx5GHDZC1EhTlIr2pc
	vfO0c6YPlg30ncwVt+V6kA/BPbdeVTD/EAG7oCN12Umd5O18bbLTrUUAsSTFdlKMhtGDu6LHVHylO
	JIUfkcqNXPbTXnho+yiOg9SMN4qSAq151SdP3zrPayuAKhPebywmnvNcyIHKX+TMmkA96A1ajNcqH
	+lTXfUGmJpoUadQ7T7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwQ-00DDzf-0A;
	Tue, 17 Oct 2023 20:45:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwN-00DDx1-24
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27d1b48e20dso3590796a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575520; x=1698180320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=f+4PRAc6k18dG3Suy27DHfV/7hFiUdhJyGI0nojTyh6nUysjkKB89i5o15WcWvqDLE
         usbA3OKYLMQxsnGCmol9kFibBhFrI0nDCcsZq5+oNc5VhzGxefssnFJ6ZkHdNlF1NleZ
         0EKFLXk4kOTHZhpUfTmZmnFOZS5QpHHcGPE4E55A4TN7gI9DCYLJUzNo+CGjKJjLNM63
         NTe/+hrqDYIzvIWuc3wQhiJoHivu8t6/aIXDG7h2y1KlAqR7BJCmafu8g3slqaDQNBz4
         NECQ/exjkA+DY7KFToMQNp0hXji9QIJ0eSQlCnKR2aDcoj+RqRIrBEtSCNASp0y5E1Fp
         kgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575520; x=1698180320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=Hy9pwW642JliP6OM4DDqc6SUiJFk+SbliZ70W0Zc4PZQK+FS2Cv18J8UNsVymPSjld
         GUPZDLlS/HwqKoicIcRbgp8NbCOhLfnGqlVQs2A2IkdkoUkG3M2QD4nd5oFcGb8si7cE
         vUXCV2mG5AX3KpEu3/nmqe08FRB4YQEgEj7DFHyiXi4gdFZQ4ol+jPuuKDrnY5jZIigT
         KGs4HySmggJOEWL1xgZ1BNFfoNRKZUima05fZhJgZyAnjjtcxELbE1Rt6HAbUlG21Eqz
         /0YtDz5Ljay/+lQebENKt7eTx5S5CAxsvh6/vmSrbXegbguMozBHdgNcTe4F28GCaDtF
         NkpA==
X-Gm-Message-State: AOJu0YydAcSzVNQraKefQulX7jPxQoNMoA1MDy/uujul8h5r+2e7Blsd
	PuAgoLpezlu69cVoKtuwugqopQ==
X-Google-Smtp-Source: AGHT+IFp9pFfIQEXNfCKkC3vHINl59IS1m8/a0WaUgexa1L64KCFZa0B5E8Uxe+pqG+nf7JdZ+AKhg==
X-Received: by 2002:a17:90a:800c:b0:27d:5ef6:2862 with SMTP id b12-20020a17090a800c00b0027d5ef62862mr3354510pjn.13.1697575519879;
        Tue, 17 Oct 2023 13:45:19 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:19 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:47 -0700
Subject: [PATCH v2 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-1-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=752;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=N4XyeVof9hR52mLfjwIJ/Ek5oPrydhGBm0Gy7EtJsFw=;
 b=+Ob+gpIgFt2gGa83X788FD8dq4mXWEM1rO3tlCBf2HwM5l8WNPiB40d3qp2Xd4waLgjW94rAb
 nu/B5dApi0JB/KK0nc1z5V5Bw3NqrLUU4ThP/xnLvrDfw+Z49RjOadw
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134523_686381_9F573B62 
X-CRM114-Status: UNSURE (   8.66  )
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
