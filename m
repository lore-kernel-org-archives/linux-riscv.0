Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A5C369D7
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xlYYNxyrbcxNSgAoZZpBXIFn394bhgsgfBqwsCMjKA=; b=UuBXTsdBk3jwX0
	q0egr9mo+kH4HnW7kwjrv5MVYLXGsXLEb5xZ54xabA/tTlI4sx+VSoICyOMeHeK5DAjMWoncmTsDM
	Q8mDVoHCUvh7s5nCtNEOFqcbDICYT15Rwy7UtL4thxAz4T8BVPNTm+s5BT8hG16QpIpITyRL5qhrc
	xv4JxDM06cnQSXkHx93Z3J6I2a6wS9xFRptwMAX3N86Dw3pBYRWoUndhRQVBlQHgIMsybp0Me7CN5
	5oXoAHTJa9sQly6N2IJCOeHj0RoeBYYx6/U/6o+ccwsY0df9mtXFbJigY6BHDf4Vu0ibMs/K06ziD
	AYh9/zh2swml8FKv2J0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nir-000000041EX-1dmV;
	Mon, 21 Apr 2025 09:45:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nhA-000000040rV-31EG
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 09:44:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-225477548e1so36372215ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745228648; x=1745833448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=iBPgoCQgLR0vJC0QdoV0N9hGhkaOLBzJy2olBVPuT62/8RUhYt6TrDHsim5PoIMNol
         Cd09Gg8XVSJE1tEeaS6X2XusvrrqxuGNKQY5h2IJpm67ZWX6miLUaC+9axuh4yCkdnWe
         RR9LnPPJBCgimHN6wQlt+E0uL+fbMUNAz6NzDc7B2cezwbgYV/C0hyvdok0EK0EdBlPT
         GcuQNqCi9JYbRCvdDCJQbrTG+En3LXUmUoveorSQYmSEQp3VFvSV7qKP6xXE7iseahhI
         Y4ZDZSUyzg0wErUKmjQFAH15Iu4BXLcb0/JI5CjQnhbKPj2h9vqH/crUs+D8XoSQrOIh
         agkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228648; x=1745833448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=F6NIvOjFLDqPBS8asbhGNA0sDRbLcPpAPxdpNKWpKDhiSp2seTuojc5STMVEsxm93/
         yXTec2nMqpygUF+5Di1mHv9RS5dx7FD281GsrIZXvSxbOn+cnHKqsvEHlrES7+CPPvht
         /GUBR09zPezqdQXedtE1lEPE40DKQkegXeKwd5Em57OWK0qLfYZPwN38HotEzaS2W4DY
         85uiY28XAO73YEt3ROjHqOIC8EVjlCE/4c/IMGdTpjTfqzLnFF2py63NMo2tRgIo4Wl6
         xDUPU0VhSTMwSt6tRXpLAMhfXGSkubOtLhoKKHEfASdFtJGuS2XyNWHun2SnTZ3NNNA8
         iS+g==
X-Gm-Message-State: AOJu0YxgBttmh3dcbCQJO94S3zWVvaUyYG92JEbcJre8cGwEV8R7Xehx
	pBHuNReP2sHnuBpzy52LHzYG5a2IZswqz44KvywDgcBPx5FyfFZxMHULpMTV0nM=
X-Gm-Gg: ASbGncvGurFCGh4LJotVMuK2bhXSRyUC+Z614iNxALzDDhRArv5ycjV63EnryNb4Mff
	rH3N1B4/PRqfgvfpfpAGTMxId0ujqJshSzA4+kM37XYYclm/Mn6Z+MthpsYVP26ALIodt5+enWv
	T1396m5SHddZz6pYVMRnIU6v1lc0IdxaYNX/Q+Q6zjW0XKp1CvdrIq+8O5JYf64cqshsTQga4EI
	O2KyAVwtfBe23CsS1oV7CcW2+9WngE3OhPngWddUDfUGuZ/1QGrz0Egmytafn38d48xHy+DmFqR
	xk18K85ABT9aHYl/hJg1xnwlUBzItpXRrUiQ+eYeGP237Fa4ZfoPnr0dC3xg1pRlS2eSd1kEisx
	+yA==
X-Google-Smtp-Source: AGHT+IH9vCtDb7HvKpxpcy9CbAe2VrwR7fXTtTGN3OzMwQYcW6ogAY3TNTBrPavfoyTFcga48z7v2A==
X-Received: by 2002:a17:902:e88f:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22c53581248mr166754085ad.17.1745228647812;
        Mon, 21 Apr 2025 02:44:07 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf32sm6371965b3a.142.2025.04.21.02.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:07 -0700 (PDT)
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
Subject: [PATCH v11 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Mon, 21 Apr 2025 17:55:19 +0800
Message-Id: <20250421095521.1500427-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421095521.1500427-1-nylon.chen@sifive.com>
References: <20250421095521.1500427-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_024408_757668_26FCBA45 
X-CRM114-Status: GOOD (  11.48  )
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
