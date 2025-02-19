Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E572C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXDeCCjVrPdZdi3ToFvv+GkMXTzN0qtkRAU9hRVdao0=; b=Px0u0h6PynAkxt
	cVNS6QxiFod+apdMWt/IFXJX6/l+Z/DzNoBRd3+4BeNepxWDWG2xaGSqfVkiXeSfIa/Xdm8dHYCTL
	QabPGys5CFzBs+9S52vN2gp0OGnXCA7AU3lxUzyhDAQfSXQthYG2aajVVGqhqh4G0J6FLiyztoa03
	xFNcdp+5r9xXqwCUJ2vfc5ngav3Lq2Iv4Es9bU6yllVsq3uxPtV7S2qYeAff3bH1h+9JwqfoL6j07
	PIKqO4IX1Xm0MLiRansPCsDuyPfY4FRopBTQHXEnIMwkLJU1HSDn+mssNN+CUay7xUkFcVw9Y3eUZ
	qal4fIslZWKYaxp4dHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSm-0000000CTJ0-0O0b;
	Wed, 19 Feb 2025 11:42:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSk-0000000CTI3-1IBk
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 11:41:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2212a930001so83739665ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 03:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739965317; x=1740570117; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vklkpg4jT7Yqa+MBRKwFAsqmVQ4XSjs4oAO0nIa6Dj0=;
        b=choiBN9DrRain1MtyAHfrM7ESelwpqbr+dhd9wr+kOE4n9E9qp2Oa+upOjsn33Wr+6
         S7Mmo2TQwuXj82Rt9NswoOV+FkPyR1v8/1cwvxWf2blM2YFSBX4o849OaA+JD/JquALJ
         jym03Ab1wftIzNco+3J0EvagpQAC+nKZVQsXY4yRB4dWdGp8FivoEFJQBGxvdZXtPNEl
         fZtBAhn1CFa7sjpOimyKCBGdPVA0RZA3Ujp9WWcWWO7Xg5iY6s/h1mYRfd7QuCJPJahR
         WysmtnzzgV0W8Pb+u6edjWLaEEp3zcrf48HcTgsjMyBpVwrA2Lxtj1y71vLiySfSB+md
         Dmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965317; x=1740570117;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vklkpg4jT7Yqa+MBRKwFAsqmVQ4XSjs4oAO0nIa6Dj0=;
        b=eTvVoBSBZu4/IeIeQqk8c7FCwHxkYUMZXhAkWjtB++nk4gQ5lsC8hFZTWOkPcmRkt9
         iBHnszl0VCh0cZBaBWFouGk+Q0gMNqJUQpB9Vn3RfLjm0QUg+QmIsW2Pdz6LmRJAVNyc
         MVztwcSsGV8QzImqOFYbHKrkFBY6+kmcsq02mtiaL1K95aVYI7fWjFkwSImB+TNOFMQX
         qRcWWF3vqARnQJkxxaVw5LPfDFy7xXSaIKhFIZ9oU/KRcHNkP2evc7CrH6DdEYvfngYu
         RXdg6FZotZnNL8CaQK2M6sx0216qlI2wf33fnKJ9uZEl+mTCNYJeeNDWeHkqlMEsO1yv
         vYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9L8mCfNpQPQyFXFqNoyQx70WilCF6i8cv8JD7bQvzzzB37jBx1sjVzV8aAZgWgtudp3aacgNJ1n9FLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Diq76CRtWtB06tXwJaUxZw7Y6aHIzWPAS4YWda+/DBjKgcX8
	R7Pfq4Y9+pNhhHmLWDN++VgEjlPZFJVwMpmFqqaXhlqzFKNxfgPqUnmrdQUIvwc=
X-Gm-Gg: ASbGncsgwMnKIzTXthxXYa6fu20qW1Dipcu1lQnRkq68Jj63KObzymnjRnduXYC2fqi
	kyRvAXuiPdVzyGmf97jHSG6/cASIs8m7zbOAFy0DAxhnoo/tRlTqjrQrd/PSFb6FVPS2y719Oj3
	tAXIoZU/xFbADfWzYi+lUfUsFSKYL4yXiMwnqGtf9nX4f3SmSc7hNMa1UFo/u8khcc2Dlb98bIm
	YzzjaLmSgmwRByoPaaSuR13ylxMiVfDMS+yOPJ+RIyATCwzAkLLBP2vMz3LzOW9VT47w4lA6xYa
	LxmtHDaxeYVNaPbEn2hStbKajwkTercSWD0WzQ==
X-Google-Smtp-Source: AGHT+IFvUGCxrEtU2DX0SrdIbNORvhPcIZJPoieuSk/WRd8FcbtSdqlslOM+6SkiVjV1leDekkTRwA==
X-Received: by 2002:a17:903:2f8c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22104038460mr260923585ad.20.1739965317390;
        Wed, 19 Feb 2025 03:41:57 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d507sm103218545ad.145.2025.02.19.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:41:57 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/2] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
Date: Wed, 19 Feb 2025 19:41:35 +0800
Message-Id: <20250219114135.27764-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250219114135.27764-1-nick.hu@sifive.com>
References: <20250219114135.27764-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_034158_350767_3572DD3B 
X-CRM114-Status: GOOD (  10.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Stop the timer when the cpu is going to be offline otherwise the
timer interrupt may be pending while performing power-down.

Suggested-by: Anup Patel <anup@brainfault.org>
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/clocksource/timer-riscv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 48ce50c5f5e6..4d7cf338824a 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -126,7 +126,13 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 
 static int riscv_timer_dying_cpu(unsigned int cpu)
 {
+	/*
+	 * Stop the timer when the cpu is going to be offline otherwise
+	 * the timer interrupt may be pending while performing power-down.
+	 */
+	riscv_clock_event_stop();
 	disable_percpu_irq(riscv_clock_event_irq);
+
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
