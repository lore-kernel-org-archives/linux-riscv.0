Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732A4C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO3Dbq8tbp9VaGvC3KS7qgxMiRyMVBH/naVESivXDxI=; b=UVelyP8ArXttv5
	SpD+6aGRJGGpu4fqvzMtSwe/3GLt4BSXmkHLElzikH75aFt0RUtKvGwGDl4cvri96PwdKO3dFSiwi
	Ju5nn3dXpSI33IOAcb2m6+UNOULCy7xMtc6QoFkB/agaLhFjVtG2jo4s7KeKzZ1XbBHM0uHvKUvRI
	lVtymHvlcseo5j5DFHD6+7F7/PZXDiqK4cJBuh9C4ZaCurduE3pZvc6dyBZzotELjXd21fE1cu3zg
	KcP0y8CEdv/B4Pc1rkhuIo+0AYt0r9iovrsTByuf6MlNZ+mLhJ7LnWdanhX9pNeaw+OzB5revbmCX
	st5CCfnTbfZQa2PtG01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6u-00FEts-1o;
	Tue, 23 Jan 2024 06:18:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6s-00FEqU-1M
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:18:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d72f71f222so10752045ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705990687; x=1706595487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYo9wXWOZdh4xBQbuTEOxrcqZQMwofEU/9c/S0MDuwU=;
        b=cDMoyPUBoXDyLvXbqN/iYnz1LF1bV24bc8Y90Ueao8bwnEJR0JmhLE6z7b6InZ0mbT
         CPko+78MamWshwiCBHzRmuSCu0Dvc4F9k9qXHUwn5qdwZxqGRrq5OWNbolqi3fVcWmhs
         YsWdHoiB1MGlebGRxUP/zI84maKBzMLU1QX2lzxWtsxEjdprJ5JIf3xRM4Zgaw/mUoMn
         DZuk6pgYiiiAn3nAFX2Rf52AjL57mw2u/2MUHKGXgoFB0dcOw+f49ArLfe403hZfhh24
         zD70f/bWKHNK1HH1PDoPf4Ioxca79wcmFvQgkWdrzhcvtjZFkIU8u8vMxBXmNLKUnNrj
         ArSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990687; x=1706595487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYo9wXWOZdh4xBQbuTEOxrcqZQMwofEU/9c/S0MDuwU=;
        b=E5gCXUgROwyzCSklNm0I44vqoImUXLoOtvi2e3NLvZzgp8qDeBsfqPQL/vwRytAbd6
         bptfvzjL+hgRYNA47IXVa2/Y7TsZmtF3cUNwtEak6dSY4ghQdu+Ob7MLJAl36ZaP+qUu
         6Yuee3H1e9J9h/DsswkmfNwq54KN9svQxEN5N0PcKcH/O/UhbF46Kl78wDd/Xi+1tXJe
         VuxgStS/mXcL48AnPyrzZK8Dj17ev8AQB6Ucq75AzPnjEexdgjMorwzAqBwNw5nB0nPm
         Vd1T0oqNbEw7Lab0f4bwvnW37POEeu3rOy+NXCS7fubsOCHFiaoRdcMvof15LnVrst92
         fvqQ==
X-Gm-Message-State: AOJu0Yy5jwTgcMk25/H4B5o2FTohvq2s/EHcaGri/2Sba0LA88DaL4Yp
	lgcwJaIiGSYpLUHhE27xSUVOU2ZRsbEpJ6it/jZsE1gzAapZHeGwkW5Gyxufhvf00FaaUnZeIyc
	XsksznGYKSk0C7yfqIK4lNQMjzGxBTHo/aJpzecZeOAYRfzSZlh2GAfznozg3DMS6TU9KvG5vXQ
	KL2a4jNQCq/0BhACogmr6aGxxRf4lvT2xf22CgM8LIszJ5oPwUnHg=
X-Google-Smtp-Source: AGHT+IFlNaztc63RI2VKYB9Y8YhdR8gD5UHFIk3F8bWliL75YvC4TOWoaqQeAhmdUbkd+zXMJ9ZT6w==
X-Received: by 2002:a17:902:7897:b0:1d5:78db:4293 with SMTP id q23-20020a170902789700b001d578db4293mr3043550pll.29.1705990686972;
        Mon, 22 Jan 2024 22:18:06 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902b08700b001d733c88646sm4425376plr.216.2024.01.22.22.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:18:06 -0800 (PST)
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
	zong.li@sifve.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v7 3/3] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Tue, 23 Jan 2024 14:17:48 +0800
Message-ID: <20240123061748.8844-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123061748.8844-1-nylon.chen@sifive.com>
References: <20240123061748.8844-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_221810_462591_8E9C408B 
X-CRM114-Status: GOOD (  11.17  )
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

Co-developed-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Zong Li <zong.li@sifve.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index b07c8598bb21..7cf7a76cdb44 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
