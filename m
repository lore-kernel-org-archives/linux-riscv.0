Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD13BE7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xlYYNxyrbcxNSgAoZZpBXIFn394bhgsgfBqwsCMjKA=; b=1x+u53VRUIovyW
	mpi+K6tFXoqVHels+XLEIsA4MxzpWg4f8oIC5Gd7PLHvTC0dKzWNwS/C8+MmIKx1wSSiWMirytcoF
	PgTZoGbVkTGZ/W4l0p/pnBFk/lELvkcSnF398I1ZKx55Df4jf0c/Geomknk3RXqbyRANvdZVGgezt
	92V3PxKwIrRkXTqfTHgkrSMmc6cJW07ZI8UW9Tqh5yW/sJz9HAXargNetp92pliXYwgcCtCJFipEa
	aEw81JmCTAXOtMU0FlDO09iB1Mm5xZNKH2vGBGb/lRqGso3NAlAZ6iR8WjjISCEZmbBwZnxmpb3xv
	Bp/lhHpIrgN9gGGvg2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1DE-0000000BaS6-09iF;
	Tue, 24 Dec 2024 09:28:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1DA-0000000BaPo-2F5U
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:28:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso36319435ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1735032500; x=1735637300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=WmXe0ZW+KIWbU9TWEbO7ui+XOTWOASeyyZutsOfF12nlU7gqdcKgpL1NSk+HAs+KY+
         uG4TdXWOy/uFZiJ+ovUQn/8gtOUtwuVOsH6ayPUE3mjDYohonYr8KrWBNeFsH9DRAdeA
         4kRr28a3gZR1xdkYvII4jnQFPllXz6RJfwbJBWfBvQcpnng/W73UyICUH/WxWdMvC+Zo
         SZrcTah09zcE2EK1/KGUNMTmczhyyZqiu7xpNam2hWrPl+TCvrSz1YkzpNQmRjk5iJ/R
         JWanqGTYMW85wlqgESsCIiuC90dFZK5YJJke+7Xk/xO3qw/B04c6xud3R/5KXlSxrRGc
         AxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032500; x=1735637300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=RIYwfOUzBJr7Ar5Oxs9irxusVOfEmIkL0zGW3DhpGOMErdUbupYJewpD01ZnURvYqf
         4TWyNYxHLffAZTTvPjA5rkeC0y+zy+iAAPi02sRT9f5DNQb/jROGbswTBHW/lCEv55VT
         LsNLKECIxjRRUaFWeHRIF7pDpFc1Xf4PSMyL4wg48TXxFFdAWW2fD5tKsXnRKcaw71Tm
         B8wPyWe5EfeYzqanKrK12dbg0HHfViQcS/x7iEYNO2qIPbzTPK0I76ovUMUCCduneYHK
         RabIWpiB0mR18h7az1//TxbuMR/nJ2HilbHu+PublsL8jP4oonJ42nnh0cRivmewIZfW
         kdyA==
X-Forwarded-Encrypted: i=1; AJvYcCXD2Qa3LJ5qa1eNG/J9OnvgCpj9TE+FIrqGnB/1YbjmkXRNxv/hmiypPKJQIOu8WARHrUi1y965N6bddQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz73dL9xkiRCq3KknXPV88ntyruKWs/cDy6/JeeYz7amgFlENM/
	TabQlT1VnUXBHCb9u+GL/LeJhaVk0RWOTMvUR4i/f851dtiKB8fpZ9QwlX8siNY=
X-Gm-Gg: ASbGncvWQiLnnJgoeWPJTisx7a+SQk6NHJ77PIvmqEmPcgmdeHZVHCp8YaK27e7kXah
	enG+fnKqtf9CN0I0kgO4JyOaL+j0Ia25kwiJMflk8wHVUfB3KL5JjQPP22VwjmobfP5UlFp9azm
	WY8ewjcpA/X4gE08t60wIAFLRNNsXm6jd3A2iDkKFtY135APl9LdMJ6iY2tqj6Lp8SRBPqm5340
	qGs4BjXHeSztaY21YrAXSAzGPQYJgj1qE4vjvZs0F05Dkileb8pVLmtNmc6e/JzyXJF4PO/uNKZ
	JuQ2wyUfWtVVdv63Bg==
X-Google-Smtp-Source: AGHT+IEa+eM9lY5Aysf3MKkJti9gL8QjP+GyONH2JGutRyVpSEtvumQ8tbWG/KyFFjxNZfvlfPun/g==
X-Received: by 2002:a05:6a21:6da9:b0:1db:e338:ab0a with SMTP id adf61e73a8af0-1e5e0447f5bmr29850414637.8.1735032499994;
        Tue, 24 Dec 2024 01:28:19 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72af8dcff60sm516341b3a.152.2024.12.24.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:28:19 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 3/3] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Tue, 24 Dec 2024 17:39:01 +0800
Message-Id: <20241224093902.1632627-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224093902.1632627-1-nylon.chen@sifive.com>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_012820_590963_060FBC77 
X-CRM114-Status: GOOD (  10.96  )
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
