Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DDEC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DYN4ocmb78vhqDCRP7TuzFrcmjusiw7LrjuJLPYJwE=; b=MzcZLhotuCy0o+
	3cIRUicin5FSdjCSIWvSW3b791D+W3jTLvcR48I1Nur04/uq9wpR9PQAVfKmdPNzFgJOdkW8P/LCX
	MR+Uq3fZKDRiuk7GDl/D4o2hndbYSQuj+jk4LMK2vAZr6z7gGUzk8KLsCypC08q1q103Z2P9pf2mE
	/4Co4A47Rii6UDIIAEUxh+GP/Xj/c4iUSJAvNyX5Z7fymbw3RHYJBltm789DOe8U4f3Ruh8z7/taF
	VlDlavcNB8xCOKQki6D/3R/ZFXqdVYLBCxTWIZYi0sj39dr+SbGhGVDwYfIR8fCpYtUf3ke/UJMu7
	dIWdGCpZXhxAgoc2ExJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CQ-00000003x1I-0Wkh;
	Thu, 22 Feb 2024 08:12:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CN-00000003x0B-3jHa
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 08:12:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d934c8f8f7so70940375ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 00:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708589574; x=1709194374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzNGUpNoXsKa0F+bV/ekx8aAYd7ltTcTmTe5buoxy74=;
        b=icfzpIMH7H8lQ2oUEMfWR30vlkhtrlgfdEZCrz4hqaiIhPU4WId3Zg7fIZMvZ/EuvJ
         WAp1svzOTItXt/h3S1uWtQ4ajlpUGm0SEHhGrTEvXHYemEbvqHyGvATgq1TZ2/DdQz5T
         mfZLZbmLWqFhO2t6mVUKS99k24jc9i2OfhkVAL9teqvd6tk7C4AZuVEFs+Wr96jk8Sm1
         oiz9uga0wHxycFWdfbrERQFJBeixgtgOLGIB2DXEJMSmFBicufKvC6pVRu4rPgKcyxHt
         AAUsWu0mDLHNMxjVv2ibTVpixZ6vjWU9Wvs/h6uk1C/RiMffe0wj+MRPjM1N+QnTuJwn
         ENTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589574; x=1709194374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzNGUpNoXsKa0F+bV/ekx8aAYd7ltTcTmTe5buoxy74=;
        b=DmT30a59IikyC2f/df7VO+c1Pp2faTWqx+25zwSKydvGh0s6uDyA4EuqRqjA+jj2K5
         nVazIjD55TTAAoWZj4GmgCaHakichzUwsASj9wAsGsJTnM7HY9dvo8B3FaXj4DWnotae
         64us6HOC98KFqtIkgUSqA3kXZENc9iEdzBFNGWq4N2GwjQUZ6MBpUsJWdAVlCLe63VbT
         EVMSCDUif/cZvIyiZWmfPEX+xkK3nMkc+rwasWnrVYOrqS+tFSv1O/WQdkqqb7nmBtni
         jcSDu35DycMsbcZLcmHETg4CeGHX0+2Ver0dy/hMY8Z6dwOtuFmBybAr/vxaQRgvxTGU
         iQ7Q==
X-Gm-Message-State: AOJu0YzBrA9uwb/H1RIBZ639CXRqmADRyqBdCDqQn6saPvw4Ig9rdwbu
	8yg7/9xgNITNkSRaYkbN+3K4rnrM0E0ByOTDz7IKZW4t9v5ZWSH4fQVf/uYM3/SOqIuddjhoxpM
	ZWGCr0qGgdjN2rC0s2Q/IdJN6Viaq6b8lnwfwd8m1HGNLMGN2gUpaaY0ssnBtPFvYu7SR8ZSMIa
	mx2PQV2nSES7eJ+NjKQ/HZi8o9nWbcfBsU34vICkdTnX9IOS0t+RM=
X-Google-Smtp-Source: AGHT+IEz666lsZSApoJrluiCUnkDERHUYNU92etsFfiWP0DNhuFqgQPyMZWzIbTM8mytE5tfogyXLA==
X-Received: by 2002:a17:903:22c6:b0:1db:d42f:fde9 with SMTP id y6-20020a17090322c600b001dbd42ffde9mr16038641plg.41.1708589574353;
        Thu, 22 Feb 2024 00:12:54 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170902fb4800b001db5ea825b2sm9412796plb.123.2024.02.22.00.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:12:53 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de
Cc: vincent.chen@sifive.com,
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Thu, 22 Feb 2024 16:12:31 +0800
Message-ID: <20240222081231.213406-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222081231.213406-1-nylon.chen@sifive.com>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_001255_951786_B2EFF1AA 
X-CRM114-Status: GOOD (  11.35  )
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

Round the result to the nearest whole number. This ensures that
real_period is always a reasonable integer that is not lower than the
actual value.

e.g.
$ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brightness
$ .apply is not idempotent (ena=1 pol=0 1739692/4032985) -> (ena=1 pol=0 1739630/4032985)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index a586cfe4191b..bebcbebacccd 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
 
 	/* As scale <= 15 the shift operation cannot overflow. */
 	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
-	ddata->real_period = div64_ul(num, rate);
+	ddata->real_period = DIV_ROUND_UP_ULL(num, rate);
 	dev_dbg(ddata->chip.dev,
 		"New real_period = %u ns\n", ddata->real_period);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
