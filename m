Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B08CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfVjRQrklSGp488MOoBt8d9XGpgv1ZfOA+2mVCho7uE=; b=YbirM7waMno0sL
	leVPnbsTDsZ1ge0t//wB7S04A/rpiUlb0yg6digr0JmKTGhUcWtcREL2Mq/jEBB1Drm9vR1HIapd0
	ay31/3Kzqpp2/F4X+TtfG0vVakd1woqYowx88A/0acbpFxLSmdxBO0p04gnoP/lPvwsnJwlzX5DKT
	QjdJ0jPGLICi7ShoZvnbjvJfO16Uobg4kiH5GnntDAAFIvO2SMY5bxuKG+4FPAPDkWNfvN153cxDz
	Me5mcsUMf5DkWmXi/ZP8l6vXcF4BMVcaj6fGyJEUfFvy10GJuHezULbbhrM+DaTSB9jT6ml6z9vX4
	lfmdI1yb5a9Yl+M/rJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlQ-00000000IbF-0zaR;
	Tue, 19 May 2026 06:17:12 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlN-00000000Ia1-2Cen
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:17:10 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1341353b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171429; x=1779776229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=gKzkCFs+vYgQWb9u9gpaKAKHnKWdtclAjGl38iJ182cfcZwnVM3crh3EmTp9kEaFwG
         79NnKrRSZ6dR7v59FL7m3dwKyEAazyWy0n54NbRAjbufASRB1vlP913SrGSSzEFUXFa9
         lDXOZB9l18/QuBMTZUPWD90V0X5s4hPo49E8mM8SAELnH5gXzTHFl1ZNG2EM6GuJvreo
         OyyhLxN19xXUK4lLZ8IQQZumaZvgzqVnnp7f8s0qsKo9ewfxqG4BLi9yvjxdWY4+j5XG
         AreusymFTu1HMMnYzLW0dg3Zsbs//g04I9r7DDgWi2Z7qAVV8xc6Ih9t1evr95+VZaMl
         rvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171429; x=1779776229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=qQMIFvlxuiA/fq/dMObLf4U8VnenICseqXitX1StoQfglVEUW1fv1Yx5JLRXxG5v6Q
         HUHVzO/mp/4ooml6dXHxrX7KgSD1j/95n1mLRFkC7Wf6xnEToWUY8QRZHBBunemCc4pt
         0Es9R9cP/P+tgwtNF1c+pf+TvPNARR8oMkfJsa7N6uvvSbh+v6BCGn4F2oQAScgDqNY5
         sDY4TkAoX/UCyrvYbt8gM/O3qCQLZFDMQ+CxOqwB1/TT5gLqvat+i1zBf7kyHd91CS11
         nvnvPA1440WlqGmaQt6i4ZN5SH6UEH++KV6Ml7LICUYosjpLIVP7lub038h//XAt0B7t
         FVIg==
X-Forwarded-Encrypted: i=1; AFNElJ+HND7TdFHR3teSSxMaWDe3H7l7ZwnL7burNcck4ASI84XPq1HiQGUBul3wgNJ6fe4uPEJHFCxIFZdoEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4BDiuYjYI0CyucEDVy5AlP5wmnuCllOjjUrWwf/KU28mLfRLH
	ABDlkIGLPjOj7Ilr222FiF9bqbLQBc979Oz6007xf/aZHzh9YSrbFO2s
X-Gm-Gg: Acq92OH2Qx+AichCtvB6zmvPGSXER84VjtjiywF+o2rO3WgXRSMHJZ/sRd6RpHwwvLt
	I+PXt9ahrnOgseyDt+F07fux16qgz04+8JJMisCgzqjFheIlWE6hzVfgFvLefAW7+C3sOTM/9WG
	ju4X4LaY2pfFnh3sAvpsJ5PO8Ysyo5aRyMRYusuTMG2JabfAwp6Wn77zLGgnq8I14Ura+OWQTI/
	hFpguwUmcsaX8xsB18WvIKutJ7kHYo03ishy3Qay07BCCDhuvX4Fbq431WxRSQ4+SxTajz7XQdQ
	lXdW3l64pQagwuQYuAZn3/WavBbsdkg/ljB3K2UYK8g5e2uwgVtXliq9+9bG3IZFiX6HxwBJXCl
	8WYkcNkcDvGQcDtGSkIxIEUZfv99GDkmKZFYX0C07tg5CLa3OtTDrejEgotf7tVjD1afvGa1wyl
	V7ipckDd9UzG1oJnAhCmGNVI/KH5JXinE6S8BMIsWE
X-Received: by 2002:a05:6a00:6991:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-83f18ec2936mr13806616b3a.27.1779171428741;
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:55 +0800
Subject: [PATCH 1/3] spi: dt-bindings: fsl-qspi: support SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=0zC6ZGIXjHpNBB1sjVLcQWNAen7uiFJc2m3aj6/r9EA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABUc2W1VixzhH7hLpeaG6o8XOTrKg9U9NOHm
 OXvYAI/y7iJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVAAKCRDN9pw2gLgN
 2KphEACkcxli9ExmjJegRfI1bpvaXx+M8VAeND8lil9wDppDx6p+6FMOJZ9viYEPB0O0AkvkSyX
 Jig2zs5o8ncO/ccDhStDnS58EhQv+XRj3Tq/Zw08yH6BliD0E7JHdq8gXdDYR5N4wLYttZASKps
 OjqlJujIacLz3vS8ifWe0PZ3MBJ6R++kW7Kmz2D0GsxNGLaDFCCARbTIMK3it2fLrSAN2VlRBGP
 +aKHtkaQGVojtTEhYbidPNCg6TPmxLwe7l0G4u2aDBHvDg6TFKrMTKqeVZDNhVlh4oZT2qe096J
 qRVdbTuHvIoyHKvI5MxvDjz/Fppzyz5a7QwW+CUc71fZG/AWSafSiVbTpDzgacMuyGB8m7gw307
 Bb6I6eWd6aUW4GY+qIveZXZdKjTeOB1NbXVtoOTI89caH+fqU0P/3mgaIxPVJ85tW1fHU/AoU81
 k2yHqhTLzmPnriSXaRgzsO+vpXB+2/QuozX49/1tPQFXnFOADETQq4S5Quq0Cb61ukIW1KTsEKc
 SgRAWcM3YoKlfxFR1MpgarWEVJ4shSulpU0iD9bpyUVDivRvhONeJqXFamqTs0nnIY1l8lhLSnz
 bIbHQxlv3Po94qYM8c7E5M9JQwiuCOSiD1VdMtDm/i4PD2ODh16w+RfCpyENNiS4aJgBX+MbkEc
 J73oCNQLhERTs5w==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231709_570220_7BEE358A 
X-CRM114-Status: GOOD (  10.29  )
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

Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.

K3 has its own SoC integration, so board DTs should describe it
with a K3-specific compatible instead of reusing the K1 string.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 1d10cfbad86c..025f10ed242c 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -20,6 +20,7 @@ properties:
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
           - spacemit,k1-qspi
+          - spacemit,k3-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
@@ -72,7 +73,9 @@ allOf:
         compatible:
           not:
             contains:
-              const: spacemit,k1-qspi
+              enum:
+                - spacemit,k1-qspi
+                - spacemit,k3-qspi
     then:
       properties:
         resets: false

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
