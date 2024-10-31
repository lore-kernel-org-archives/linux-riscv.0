Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436B9D6B6A7
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XruraQjK8nfH14TuupKjcV8lKjyMUpSFVNJ08+xGgvc=; b=C4MSlwqsDSNtdR
	9Z/Jmg+TnXosTyqXe/hLUHyiL4oCCbZlO8Uy79Zng1pM29tpMiRtVgzKVBVZnPIfX1Q/9ip/oB0Nj
	LWwIGsvBI+WVLFofDO6O8b80EsOh7JY8B4O4dRDsrNBJmBjUw5YNBJ1WwjRwkK1o+mqPBoDtj3jc+
	0QVmdQwe5giKrVIwiU5ip0keN8tREE/NIUrJL/fg2p7+2QKfuGSJQTAc/yoduikOVvN68l1vJ8bbt
	aaQmBhMnHyQbBjlfdSrxppayssg2SPnYVO7J8aryTWNVyJ9mJOD+xegeotQXmODFyrRZyI2fh3Ypd
	wLzBMKaWrP8i+TA/grcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UCJ-00000003Vqh-1Pz2;
	Thu, 31 Oct 2024 12:22:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UB3-00000003ViG-0f1C
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 12:21:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43169902057so7010375e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377283; x=1730982083; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tifA01aEwpCB7k+rl2olkAmgjeZifjZgKwXOFawd/9Q=;
        b=UxeIlhioEhpvORkr42w3F8ojBAqdjhIE4OvAu52wDR9PHWiLsHVR3YTgEHuQSiBlG5
         gHK92li/YDrHEffZhfYAi/RAjdbzbNnny4HnZB0A15IeIe0TbeOKKShlKHBkD6w1wbNS
         KNQG6yWTnUyNF1nSUp7bmO35hwb8YFPeAQnK0xOSKww/Ik+JT1hcjNdd/mqxrZ4RqfjM
         WNGo5BAZK6h1ajhimoXp/Ay/9Gh81Bz3EuxcQSJS9XoHUHDqQvcbCC6/4xKf4Enw3FyV
         AcN8H/vJn+wbto9s0u3mGMY5RwH4gS4FQ92M03mNNVNDmXqPrWA+YFspsNZakny0D0NN
         B/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377283; x=1730982083;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tifA01aEwpCB7k+rl2olkAmgjeZifjZgKwXOFawd/9Q=;
        b=vWZY2Y2mBmMz4zQZDRlfugQVMP6pZWxxtukhMKVaJzasNLIRNBP0gZsN+qzDZvOR1X
         IllGXRDvpYu/xmAXWpQp2vqzX93itI+w8RmEEt8LMF1NBVQGoGmL7jtxCQi8rhptSc8D
         K+YvqGkp10mR+3BLWUtplyHlkBoGRyMm1xjNmRBuvMDTGRvqPq2AJHZr4OaK3K2bdEoY
         PVNCQxNm+Nn9fyhxmwM1ALOGIKgmBHBmcRpaCYnlv1FR9+pwBx36nK8bHkRWxOLILW4c
         tN949poyBS2XGJPxgQktBowJWP868fkTrKa1JYmuVSS8Xtd/4BZZpuJcUGNHfCYOA9wP
         gGdg==
X-Forwarded-Encrypted: i=1; AJvYcCVcjk51UljI/qOpglz46rEc52W/GefNAiqXLTvQL0Jqdm+abmF9jB9SN9asiP8cBUcfYvHaVa3C2d189w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK7OgSmVjj92Nb5R6CIXYm8FbRqDjfIPyl4GQzOGknEtGuGMsq
	3TJqQZwktLL+0BY68SsvsWE7nhm5zLgICD97BekY1e8wIZvyvF3H
X-Google-Smtp-Source: AGHT+IHBp1TxQM76X7gohSGb17rZI4WDJf50xd41RLJtG/+yD5bf+XGvKdhWF0CXlWSUO85e3Qvd4A==
X-Received: by 2002:a05:600c:19d3:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-431bb9d0aeamr60992515e9.22.1730377283328;
        Thu, 31 Oct 2024 05:21:23 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7e1bsm1975728f8f.1.2024.10.31.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:21:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 13:21:17 +0100
Subject: [PATCH v2] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
MIME-Version: 1.0
Message-Id: <20241031-cpuidle-riscv-sbi-cleanup-v2-1-aae62d383118@gmail.com>
X-B4-Tracking: v=1; b=H4sIADx2I2cC/32Nyw6CMBBFf4XM2jFtQWJd8R+GRRlGmIRXWmk0h
 H+3Etcuz0nuuRsE9sIBbtkGnqMEmacE5pQB9W7qGKVNDEaZQitjkZZV2oHRS6CIoRGkgd20Lsi
 2yamxJeuyhbRfPD/kdbTvdeJewnP27+Mq6q/9VXP1pxo1KrywujpjyBbKVt3oZDjTPEK97/sH7
 jkudcIAAAA=
To: Anup Patel <anup@brainfault.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730377282; l=1974;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=z7qRdrc/aNJJoVPFpdm9WaJa+syCyVzHfCsRPb9pirs=;
 b=CB9ImtE+5I0MlaIX2MMtoX1tMIgGy+QmeqoCgGwhOl6uPJ//3TZYqNIhCtenKmP9r5lbBf99l
 Wiw5cWse1/6ApwFEAY3rtmazsgzl3CVlgSV3VpPNZdA+lgRrQprlUkw
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_052125_242923_1CBB7D4C 
X-CRM114-Status: GOOD (  12.81  )
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

The 'np' device_node is initialized via of_cpu_device_node_get(), which
requires explicit calls to of_node_put() when it is no longer required
to avoid leaking the resource.

Instead of adding the missing calls to of_node_put() in all execution
paths, use the cleanup attribute for 'np' by means of the __free()
macro, which automatically calls of_node_put() when the variable goes
out of scope. Given that 'np' is only used within the
for_each_possible_cpu(), reduce its scope to release the nood after
every iteration of the loop.

Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Squash patches for mainline solution without intermediate steps.
- Link to v1: https://lore.kernel.org/r/20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 14462c092039..3a78d6b7598b 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -504,12 +504,13 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	int cpu, ret;
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
-	struct device_node *np, *pds_node;
+	struct device_node *pds_node;
 
 	/* Detect OSI support based on CPU DT nodes */
 	sbi_cpuidle_use_osi = true;
 	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
+		struct device_node *np __free(device_node) =
+			of_cpu_device_node_get(cpu);
 		if (np &&
 		    of_property_present(np, "power-domains") &&
 		    of_property_present(np, "power-domain-names")) {

---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20241029-cpuidle-riscv-sbi-cleanup-e9b3cb96e16d

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
