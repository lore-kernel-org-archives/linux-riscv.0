Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C6C369D7
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xlYYNxyrbcxNSgAoZZpBXIFn394bhgsgfBqwsCMjKA=; b=o2DMhWHTtQxbqZ
	3mRmszZpWrJ9p50Etn79Jp9I/2o5ijU+U0diFSJ/T4QkICqMPfYq1mtUxQhd2J78AlpkQ6Z6njF+6
	cBIazkeeqVUvIZiIfZdVJOUKTxmCz8CMQ5HPfMEBDymiAlY4itHmwqheylpIW+nFuoEtEjBzlhJRw
	aHe56lmA5qx09Xa5DtO0N4sCsQ3kuIByCkj+YB8ifnvD/OwxOwUaOjhrYm5g8zt1D3xUP/XeHvKsd
	vxmfVMrVo8KhqTNqP57Pfh+rjcSikHg+VC/8aJO8ts2FE5Jv5gENO1YNdEC+zkwfXUpZ9riTAUVpI
	eEMStvwx0O6ohu0bTrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WtF-0000000A5X4-3UI8;
	Wed, 23 Apr 2025 09:59:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VrF-00000009pee-4Bi8
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:53:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3085f827538so7536589a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398409; x=1746003209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=JJo8N9snqki/85o5hqLnNDBDXJDD7rzGC6MxcdcswhBaLLgBHah5vguYPj8HIg6DaG
         rzjb1599LV4PaXv7qus/69N5tA5855vfA3I+/LjbX/VYxMWY8Ra+VPR3Qml3KdWVtTUK
         JIaetK/MrdmoxSdRhrU+D9FA2h0Kmz0crPvXostkBYyCdSHhlo5oI9zpbu8PjK4Crd+C
         aBuduc7pUF/6HxmJZU8d3+ch+87WauZvnfLjjo/fgmHjDVXyAfCNF50A41gdhoFO4Zsn
         oa2KqS3+ChSft5A3ww8Yyu6Rjst3Qd2050s5iqH4300AbrqXc1NlbDWnbgzMdhses9RC
         LFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398409; x=1746003209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cqj4QIom4PNiBzVEbYX0WUBXZ7DUraiDzK4MrzGYzY=;
        b=f8w8pQ/Z+2LOJ/jws83mS8vg3ThbGQuo6l2ZF7dv3Vz6VTG0aIbKPGPELiG2mYBLwT
         RHQsTUxnE89cIOYmbKimI6ZNuGosR1ovy3UAGvS4UENo0PVOBssjYJyi6iWmUuTIXpwR
         kL/mEqICCU2XJGG9AkONbQdV9JZrm7kLzUZpQ3cdqv9UMZnbJO6AQVprOA71m/50OOIC
         jrCrdzdtLuWxwXSO+OGGIwkMhDePbGQx80vemtza9c+THp8xbXQ5MskyFCdz9/z67FOt
         qWwWHoyTqlKo0SvAtMrrbvtS58DcxYMveUQSd+kc6USMjWhfRrXRcGhLR1yXGZMA0Y5W
         2ptw==
X-Gm-Message-State: AOJu0Yz/4dlkAZSpGamRlNX4cdTqvh9gHapKWzQVVyIEShm7ebyjJYZg
	qMmUXGgdlkEs0NJ/ugn1jXDkvNJRiM3ZAiBZe3k7Z/HnV81y9kbe6qKkbxz8Dro=
X-Gm-Gg: ASbGncu6EzbdedPrH7V9sElRL60tGl322EC3sIKxaqQm5zNVnxMOcE/k4l6PL3nvN0Y
	KItb5zDkzjCCxYp0EO9JiSjXlYVz5aPtAUyPLRZ0/M0FN/wb7+3j9ZQWU+NMGykolyHF2VTPXmG
	346cH5N1UAVPPcHvlwwQx5yrvCaPqyGKR4nV3zSWfE6E7ZPUu1+qs4A89uQV1rO3AYJva5roSKH
	QqB5J5x5ipH2tHMAU53+0bSadwyhUtS4UVWtLdiZE9STqyg3z6HEOiz5AdZuwjtJ5hMV5HnWVG+
	5uvF7CVmemz42zsulstmG+N2cjpW+4t5W2LpIawmSI9SUO0xI9WYu3K14NJ7nBD/Tyb+HXhY4vR
	/M336Sa3B6yon
X-Google-Smtp-Source: AGHT+IEAalrda38aOkj4B5+H1noGQ2OTP7JrL0DoyWnhW03mGn+cIvqfLp/tgOSUaOiNbvMPyvUE2Q==
X-Received: by 2002:a17:90b:380f:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-3087bb5336cmr28685643a91.10.1745398408957;
        Wed, 23 Apr 2025 01:53:28 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:28 -0700 (PDT)
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
Subject: [PATCH v13 3/5] pwm: sifive: Fix the error in the idempotent test within the pwm_apply_state_debug function
Date: Wed, 23 Apr 2025 17:04:44 +0800
Message-Id: <20250423090446.294846-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015330_032659_88CBB68C 
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
