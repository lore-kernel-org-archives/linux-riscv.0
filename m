Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F3C7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAsvqMhJtmp5y/gL8a7hZrgEU7aUsZ8eLV7hDMrSK0Y=; b=46nESIVjk0uMnh
	SWaJHufKXQOuZ9xwkxLkMLpl8WU06bzp083lNtGpYMWOd+3i1ZaJ5bqNfW8E7zNJx92p+4/TmzdKA
	MPyiYgRC685tLgtDn2ugY5IAKLZigvtB5VOiTbUQgQaQv/5kGLdEoSUUDeKXvTMtjDeZBnXprvaxF
	fk04Y4lUXjiKKAIwAV9VMb2QbZrCILfuvjVaxreNS3cKbcxUj3jfFiydFoa1ziEOKsPNuOV4Q4Nzu
	2BQsduncOpYAcB/p5/im2YdsH/rrbGwzuwspizdXJIDZiLjHMYcqQrONTN3PlOzuoehLSRPdn9hUn
	Qx2joac0VOQf4QIyiNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64t-00000006DPd-26yg;
	Tue, 24 Jun 2025 16:00:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hN-00000005vLa-30St
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so3047315f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775552; x=1751380352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Su6uvjagrhQm2+A4aWPWKHya+70faQtybJRQwFqh2Vo=;
        b=Wg8oZXl8cHXSPeJIumvVtvSEU9GGfSA0THkhCspOHtI+zida+n7SF20BzwZwSElmTr
         3BtlKX3F5T8UsKooDrSE92ca7OyfA22/YX8wZR226OzagxWyT5q1jy/x3/XqlR6joun6
         Xc5eDKOR6egJmt7/uNXGIi0YFjmZ3JHt42RhSyZwNfDSc9ZkeliKRGJw3q1+dYv1/523
         rDkaD0rW/I+R6TYDyVQyx54R/BQWGN1FXrthXmteh6zmmPz8+7nvdh8GL+Yf2Xgk6z1O
         2u+hPvRnR+bAy+v/jVsuPy6EzhtjqCiiSKhraOk/7pNZwMlk3yOJosL7fx+WrugrpdED
         QdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775552; x=1751380352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su6uvjagrhQm2+A4aWPWKHya+70faQtybJRQwFqh2Vo=;
        b=ZTpwAI/Dp+If6KTCiiwGN+g+AsIGe59jwizVa0ZL34rfzmnBp0jkNgy/Nu4lvQIqGa
         ZJScnUbUGkJxOGI0esfG1AGYC6ZoNLOEF9I94kvwU+YLU62unX1yZyMvjITu4Ui0KCF4
         h9Da9Pu5PSrqyDpZwBdgNXW5syruWUuGAbTk+nh6ELMvc93s4SLaPwTY29PnqLRqUHXl
         dmgmm9Sm3qiZp7SVCV+txRqkbMuHS+O5K3Ph4hudqLyRKH76vu0QY1zcDdWc41o4lXAQ
         osQelOx45fV0BHeIdRoUDE5H8+aymnePthPh2ZUFu0skwtfTTeK0Ta0OeUbCqBC0ExEP
         j/yg==
X-Gm-Message-State: AOJu0YzWqNQiEma3R6Qbz+1OsPmyt/jBjhWe3X0o5MOTFsORN0YIzLMN
	KQtPo1zMfLOxVIz/40kiilvTceiF29oqBbz3isPtJ7uA4mXx4uC0K+l6Nw7p3k5OMgg=
X-Gm-Gg: ASbGncsdEAPr49/VIFmBu2K33sgULAs0ZLt1xgdTqNUrqN1wHIjTbQvDVLWrzjamyIw
	tFwL3egLZsMrtvNaAhWEm43qrIQSTGfzxDOLnjTVqowAwE9jf6RwCcKs4SYZYGeUHyfvVz2MTRb
	hhD5JAuXloskVbIPBEfNZsRRdK6Y6JVuCgymVPeRNtV09+X8dDeed64eA/OL2+HYhiUwze+nrbb
	aSPJw6Wbwp/U8+pxyqh19xImmaOPbbaYEWmZZnjtDW4T2qbTjMb9p/8gQRG7L3gQWMgAgXSuLbV
	PzDi6SrFZcKbUgKbv7wnRYb+p878S3zTRR+93X11Fp30Jf+2r7+UxqUMXFaUtaYVjTQ=
X-Google-Smtp-Source: AGHT+IEqXp+4046/1a48emVv6WT4DJQxmL7NALHH1PRyVleJz/05O5wIr5faYMuecDyE7ZJ2se4mJw==
X-Received: by 2002:a05:6000:3c5:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a6d11910bdmr15012296f8f.4.1750775552199;
        Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:21 +0200
Subject: [PATCH 4/5] pwrseq: qcom-wcn: use new defines for match() return
 values
MIME-Version: 1.0
Message-Id: <20250624-pwrseq-match-defines-v1-4-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=77i3qsK8qByImTRYb4pkjjreQflQxYOmzaELISuv1AU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6J4keJ9TSryqRVLq4WC3+bSEZseJ5nqpe8
 M3As9C59KGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 cixRD/4tJVxOEb4GTPQqaMf4hfMmoPFTISVrXRdKDvzvP/b5etdhaf1p8cC1M6B7lM1EY+PHv2Z
 w+2pYEK2H9Y5Pcb5Xp+Y6+R+6co52Bs6cYt9hAFx5gcMMlT+pqgsZL7dv0C+F4R5O/xiD5BNI5K
 VSMrGU4/X44cV2vWMy+UKrwX1/LclxmXne6FGAzQYbtnTVc9Ih7zskmYRzGA9p1VQSHqSv0cQcf
 onW996VTqs1Dgho0f/60A1yk+nHFLhDeZfehyrCGPmfq/zNhnw4OZ64tk1VA+Qm3CnB9cetvSUl
 Q4rtCRYwa8r+vB/COWEVm0ZVTJByInGp/I4OZCrFQ/YsElf79EKxoX15+IyheuLCu3Fqp7VCrY9
 ZBv+HWVDSvZa3EPeGpViCOfTdTkA44HYmiA9DxKgz9QQYCQVP5Yn0opW7+sobI5rMZf0TAx6+I1
 qUEC1GHiB96dMQ/+IEe/OzpA+dsHAWuhEEEoj4Fko/A08lrzyKTorkdHuBYREl+51kgqxhIgc6d
 MAdo+EyC8tkiO7A+C9FBe/Pn3xKpyFry0XNnKLaMUdwRfeS//da9BTQq/k+r6C3JPYMFfYDO/nO
 jjcflV7gpIhEVx4KdYG2+jiIlCzR89FKZxe3XAifglZpWmGJfZ0g+cLdM7k0Pv82mDdJ9zU5JeY
 FYLiN6A8e1oUI/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073233_759552_90DB5F6C 
X-CRM114-Status: GOOD (  10.80  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the magic numbers with proper defines we now have in the header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index e8f5030f2639a69254ad5efe0a313d2f3d10fa1d..f14801b4c28e53c5905fd2345b773c2aa96af44c 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -341,12 +341,12 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	 * device.
 	 */
 	if (!of_property_present(dev_node, "vddaon-supply"))
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	struct device_node *reg_node __free(device_node) =
 			of_parse_phandle(dev_node, "vddaon-supply", 0);
 	if (!reg_node)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	/*
 	 * `reg_node` is the PMU AON regulator, its parent is the `regulators`
@@ -355,9 +355,9 @@ static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
 	 */
 	if (!reg_node->parent || !reg_node->parent->parent ||
 	    reg_node->parent->parent != ctx->of_node)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 }
 
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
