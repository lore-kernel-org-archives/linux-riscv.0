Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C5D7497A
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DU/+4X/gJA8HKPmUGvU6ke3dHix8eL/Ec9Hxcp0HqZk=; b=xMPkM8fe3Ofmaj
	CeANHHTnDJgcD0ZHVKfbGOvyzWGfEMhYoAv00Qdn0yYUQGdR/GPn4YOd2oTpMBmv6dnROOrXlNMI8
	NL2NtqEGps//cdH7wusHRlJXiNTIcLi9QIRJwbYtr8IAmpdDbgDAWFLltyY+wDpRK1hhHUVlHuRYq
	OOaoYHVORzekqKz6HuWJPDZ0VK9G/r90+zRJW1iVBBsdXsTlzmidjRgNTbUteOCy3QOAxmTKgPkD8
	239czt30pWhq7cPgABEnpKlA83xLqzmEF4fuYJsCq2g53TJYCxGc/OO745Z9MqJNJwr9m7FEBjEaG
	0apyU1Yor9I55ydU1T3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RQ-0000000H0gg-1Q0R;
	Wed, 30 Oct 2024 06:44:28 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RL-0000000H0ev-2MkX
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 06:44:24 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so8164112e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270662; x=1730875462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8LuPiSu7wFtVCRkCbuWOFPZfKo40h92poaJRDjY0b8=;
        b=nZHuuetGkwmUTCdhfkTZR2b8V9V5YOT6HzeNHW38YkzVdOdyVyi/khMI5SToRkLe+m
         Enkw77uHCAuL7cR1hFhqjP0of6PTCpNITe9vzf97zrtmKooZM8BcfbqB6pnHXu0ZrZJ8
         2MzqQzbMvj0vEhOk/iM9keolcxZx1SfLi1N/vFOC80vMRuiBMf8PtFCItYpjomLxfWwD
         yQWdxF/R7BkYSWueSE2s1vZqoWwG+pCG6kK/rVOYm5xFngRHnY7VF782GPx3kAu5gNgI
         ouCCBKytwVW0MaUsX/UzbEh5qLtsl8x4Z6/tSO9++rkCu81leCHQTQq4pAGZS/8HdKOg
         kydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270662; x=1730875462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8LuPiSu7wFtVCRkCbuWOFPZfKo40h92poaJRDjY0b8=;
        b=VKfYK4woX33VcOvFXRNAWHEA5kdSPvmmC+eYFqVlIUuIoLDkJ5c1tjjEL+MWw/fJYw
         8jXadyvI3zMR/bg+FpnwzyLu05ZnQrVzQWfd/cYYmI1sSuuex5HXO0jG/SQZReXctyOE
         9XAYyPJ1UK1Qx0L6dd0plwfNY3P9RWReKs1feCLwr9/uct5JkSWWQBF+qpJq/B7e3FIs
         VlDS1MMyfMOt+n1yy3h3Ct5YzQPj47kPLFA4cBuV6WtD3HvFsm9EK7s+PoauSGc5kxh0
         IYxhgIarXaaW2oiETJvIAfDHsLr3DkIs9nkL8AqcIH2Ou5xcGvDJEYv3WhrxZIC1nOxj
         1YYw==
X-Forwarded-Encrypted: i=1; AJvYcCXvv+8Jkxf+T3/s45Ya5+mTV2AKtlhSWrSaeu0a261x/8HelznAOJS2lv1LsDzhMkId0d4Tr6cZEpFJIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2B1dpnq4h29/h7Hncxpk1t/xBMhCVTtzSvNLj/V+cz0bFn1ut
	HvXViTj6ehMBKmpVVz3Xjfs9xMLdG+e8ohAosJ+qJQayiQoFycYv
X-Google-Smtp-Source: AGHT+IGWhVQIhV4BdDIT9PkTI8qrQQX12NQPVSDcsmyAO931TnpfZkEuwVFFDyI12BadGeJMbiXo2g==
X-Received: by 2002:a05:6512:3caa:b0:539:e88f:23a3 with SMTP id 2adb3069b0e04-53b34ca488fmr6256607e87.60.1730270661384;
        Tue, 29 Oct 2024 23:44:21 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm11249655e9.41.2024.10.29.23.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:44:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 30 Oct 2024 07:44:09 +0100
Subject: [PATCH 1/2] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
MIME-Version: 1.0
Message-Id: <20241030-cpuidle-riscv-sbi-cleanup-v1-1-5e08a22c9409@gmail.com>
References: <20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com>
In-Reply-To: <20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com>
To: Anup Patel <anup@brainfault.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730270658; l=1134;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BckDlgNxXN37WM9rRTU+h45QD44ycxfdprrjTJEpleg=;
 b=ujl2h06lGh4YP2Y79CiPlMHPbox7pBxEij20AzVxtyPJO6YkpF6IXkkR1VQPlWKQticw+fNHm
 BmWt+LqTvfWA8Vjuu0X/60D+gHiHeI69Qr32rb1foKW4ivVqq8FVgUK
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234423_638448_E11524E9 
X-CRM114-Status: GOOD (  11.05  )
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

Add the missing calls to of_node_put(np) in all execution paths.

Cc: stable@vger.kernel.org
Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 14462c092039..2b3aec09b895 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -513,11 +513,14 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 		if (np &&
 		    of_property_present(np, "power-domains") &&
 		    of_property_present(np, "power-domain-names")) {
+			of_node_put(np);
 			continue;
 		} else {
 			sbi_cpuidle_use_osi = false;
+			of_node_put(np);
 			break;
 		}
+		of_node_put(np);
 	}
 
 	/* Populate generic power domains from DT nodes */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
