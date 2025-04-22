Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC99C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xlYYNxyrbcxNSgAoZZpBXIFn394bhgsgfBqwsCMjKA=; b=uNe6I9M9wHq9JS
	18XAScFOZEh4XndeV1+n+LMN5aSKAyiuIBPZFmjX0jl4k7HQWoIxTsiig0B55KKh/DGaTXUexX7rf
	AVWH0hIGDwRbE+KGnxl8VaybReH5T2uk9bWs25bW8+AXxKKhiFu8X2RZ7vNBMN0ukTn0f/2wOFOZO
	0pp0mMoj3ed5CavqTD1qhlgbFXkCUynBVirGUTjcxK+x/CTd3nqsvlzjgfJosxOBvM71OIIjzMYA0
	z6Knac/BBXmtLiey2imoHvi0iDBOdDypgmuQmcN5LHMATnDpuvC1gbVRVmw7v2nxlwR8pRm1j2by9
	Z42hUV3Y7VjvEP2Utktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AEI-00000006c9U-2uQP;
	Tue, 22 Apr 2025 09:47:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Co-00000006Oal-10lz
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:42:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7376e311086so6651640b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311333; x=1745916133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=gzsyvGmDIZ/QlkPGIA20WfpxqlZuUGDsiD4mb3zRy8l8ynm9aYw6UxNkUxuhhEfSz6
         fbCHI6fK5ez2G9miomHowryowrD1DYs1giS1Wki+uvXoNjhS4VdY1iEbXV0nr9hAeidI
         QMoC/KX/ElHsZRaeF0OzcQul2eBoL55OrCIke0h9PLdhAOwEwVd4MOgZchX52NAF7NJx
         ztr/9OEAqNF4++4EMzuyIx1ZJDE3lkTvIqfELse/IscHvDsznxsZDwanHiUUrJNk2jAc
         3a9iUxfG9/D1dxhdCvnzKMy0hNDo+mAbux4sFSdJ3ZcBT4eKv+0aXxKwicik5tJrKcW9
         +IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311333; x=1745916133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=dKSvOeSCJ7NqFcj1twsnAX930CvbvDn03mBk+gQeo5bS6y4pqxpPfld4D+Vm2D5JNz
         0rSowZGjM2lS9JGhJHeRNI9W+KewiT1diriZr/MbbwhqhQegPfkbq1JO8yWj2kY4Ku58
         n3bjpuUQM6hkqg8QuupN43wK9CAJ2bDi2UqVRmwomVx0rPEPE6Uqyn/uM4mvou5bDrHI
         11G3i3o5dPuEdPimQWbrYdv5GESLAltHiPmhON5ccfDuZ7VSPkPmB3QZfU3adGPVS06k
         Fcu0MXZ6j5pqQRFxbmlVzXJcXtN6ZaTfp/25AmwsAJG/C0FklVK57HX1CP5eDpZWEJgc
         u8oQ==
X-Gm-Message-State: AOJu0Yx/Yr4yQiUR/VTlfsGPnLHYZ/fh0l9aUMDscIyCqtSUCs9zEwz4
	6ioV+weWH9kWVfP1KVBDpVltt1T5BQfxjMm5XUQ9BCDoaepyrKw/rCpvqg91EfI=
X-Gm-Gg: ASbGncuQ4tr7CJc9bX47RTQLnA1Hw+fuacYG+TxFX+3ek3+B3rRIqAMXrEoy4KpyBz3
	79WfBKQnCbj3fO0Sb/OJcH1xH3yM9Mgcd5HePDCb6kv/NdWO3B1TzK9yJh1ceRmmR41ygJMUKIa
	1++o/W1JdMWw7awB4qDwhD7WMEUqUQSeZJXE+Igt2VKP94D5MCaiXI8GHlmerL1px5H+x09wE+r
	QMO4e9gv/WKa6PSraTMi5B0hFPJM2hmUrTFw+EGLES/m6BI/3JsPKH0VgEkbzioXptxu2rGoAbI
	ZiPXIVvpkI19mZpesxtfu/ALTsVCiMuEcGa+doSjVxiH/vNYIEKYn+Vs1tAuOBqTRkNnrwKC2P2
	ziA==
X-Google-Smtp-Source: AGHT+IGh7II8uR39w+HecQJFOJfohPA9oxXMODo1KcS7MJ5fXvWrxBC4PwiVN5H5gCjQglmL+IpLdQ==
X-Received: by 2002:a05:6a20:d48b:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-203cbc28a3emr23885458637.1.1745311333416;
        Tue, 22 Apr 2025 01:42:13 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:42:13 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v12 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Tue, 22 Apr 2025 16:53:10 +0800
Message-Id: <20250422085312.812877-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422085312.812877-1-nylon.chen@sifive.com>
References: <20250422085312.812877-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014214_398037_F03EF166 
X-CRM114-Status: GOOD (  11.54  )
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

Round the result to the nearest whole number. This ensures that real_period
is always a reasonable integer that is not lower than the actual value.

e.g.
$ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brightness
$ .apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0
1739630/4032985)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index bb9146267bc5..6259f8500f71 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->parent,
 		"New real_period = %u ns\n", ddata->real_period);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
