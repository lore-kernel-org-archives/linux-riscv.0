Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6353C3ABCB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xlYYNxyrbcxNSgAoZZpBXIFn394bhgsgfBqwsCMjKA=; b=It/4h2MZuZn+Qk
	+ELWeODMJRcTujpGyNqu7VZNeKBbVTrvJBPqI00LoiUOq4tKWbvo9cmmJ47mipeHTTwTTr7PxirQv
	lQIIYnm/D6aX+4WoIBL8Gko+sGRTPLhgUgtWjpkRKO2OzjeJbWN6TT8fgzjdW4T8O01HABo8Gy9KI
	Rb34OatianCyWYkhHUXJZd3+qw/ZFV6C7BjyIa1gji3SAdO5lQSaePyL4DV3OCUYrD94gESt36rCk
	MZYhsre9lDEyvfqV0IAzI6Q9BsOGy/cNITX6uCSZ3F6myUz/7e2AYC1hs4Cxif79tDI0Q8rt3RseR
	Rb3OomlsFZIQBUb7m9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL65-00000003IRO-3IlA;
	Fri, 09 May 2025 10:36:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEm-000000038by-0X2y
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:41:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22fb6eda241so15468975ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783707; x=1747388507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=HbOS2xJjgdmiX8Y/mOGo+WhvY6PlUEFZGpbp82g+mKm1t+o25ej2hu0JTkQPFI9rtr
         jhUl+3eDWA26ZBKqyNqjc6p218lmeJCwKMFJgMvkRHeGGH+jXCoksx0hPDFiXpQ2juFn
         muw692fdrEQ2ppFtwiKQ6+Fwb3AYJkTM4bs4QY1jw4TvR+HY2j+bH8XCRuyADHSeM55s
         9ETpgt1kVtcHhArftiKLeefn+/d4JL3HpObDAuz7SPfiCjlqbCNVJs0a7shfm61k8+gV
         YUJtB7KrunpilxEoz3E8IzZjL7W8mDlfl1i2KaZ9ONup2SLNvgFHYahKhUtNebVaSLQR
         W/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783707; x=1747388507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=Tk4Qbagdfx2GZXxMLMHI3NjdE+WeVXPNEPTW6rPMazor2UbfHIGoI4JXDJX1wnGVcN
         +99pHFqf6Dsh2l7acsxdlj4Te/GaiUbNKxUBhskJOOgXLxJYQOEkQtWdP3v5TuLLqoME
         jynrvgWpcd2Yxp+TMTS2oOzfzUxE/camgmSs73bXyL+x29ZiQ9pfNgBy2ijiNmCK0H+A
         bS7sOF7+knZizPMn5FoPb9zO4lL6CZqTVNXUKGDlZ16454ggdfjjG3Io4MeCMhna+Z7A
         G/DV/a4D5ZU1EHrGYcJ1StHG8DFqBRB3LvM0f+Ntiw9PzxtPatWZIRX8yqnM+V+nqaRR
         0U9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrXnpdb+3Kk1+Y74SMw2RMdMggCffnY4Fr8DD0LjEvOZUCSJe4LWXQl1f9TiIAsY3jokWGIdUDVlkrOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH45mixGJZDzgdhftMTaX0/l2CMReiGqjdLgl3uOMgcW+KZXUB
	SDtnBg/UPof3q9LAYxTYg2NSc3s1/XH0+kIXXboCXpfvCsa3FnHxC/Ir1Em3sGY=
X-Gm-Gg: ASbGncuWv6n16WcOdKsi9RBFIS9XpI+IaavV7qeDxEg7XgOytTTvyNk/IZR2K9ASApm
	D5jKV7duNt9IpgCMuL5FzXGjr4lneit3EFm3TOauTewr7mlJElGzChgrYShXpZ6SauXQ6KEY/Qi
	6Ng1L0HIPyYIKHAXe602kEeRG5gsPLzQR5oGtxpQ1wC5qGRsJEWcBZOChncLm3d3tqSCcCxHLOU
	QhtmNQbcDcLdAV6XH7HthsVaNZ4AFzbM3qTGwhB3TFD7DX2yTQKJDo98dQjj31EmSjViQRzHtTM
	fXMMOXa7IACr6lk5JoJJ4iJNy3Uh1GTiT79Csj3vNiT1M2mTPsaVfpiAvGC7NGuQk/mCEMCgQDL
	m/w==
X-Google-Smtp-Source: AGHT+IFkTuXt01agQ1105zn1T3rz6uGwTacZ4V6TXQQSitMoy+sXg1uhaf6FBpjek3MEYU8Zsgr4Hw==
X-Received: by 2002:a17:903:1a2c:b0:22e:50f6:b95b with SMTP id d9443c01a7336-22fc8b3d8a7mr40565465ad.11.1746783707291;
        Fri, 09 May 2025 02:41:47 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:47 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v14 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Fri,  9 May 2025 17:52:32 +0800
Message-Id: <20250509095234.643890-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024148_161016_D53A7159 
X-CRM114-Status: GOOD (  11.23  )
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
