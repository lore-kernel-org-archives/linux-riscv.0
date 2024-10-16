Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22A2D2A52F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P3EFsfM1E8h4DFfyDn9mhP1D3pdWGe/uEdARUt5r5vQ=; b=nkkkkaLnpeQCTk
	n8SXaGrsgxMv1ApbQVNI75W24i9sAx8gdGybr8z8wXG85So7zG39wHyflty21Kr+7FlI8YAwxE7fe
	QfsguS9zIel63k5XtdUw5UhyBOh65cESPv7oLf30rQUCeEv9gCJN181HUVJ0RmxMAIlltixJ18Jvm
	j9vQ9yY2ktdHmz0wh1f562NsdVscBexgiQ42STcICvBWTuPfh2mnr4EkTITxow2MTC+D1Fne8AqDt
	/U7KOYI+2ZQw7AeeCifqUfisE/9twOPayb1sQ6MG5P5MmChgcMzrlroZMLuVtYiFxg0uXg6BO6eR6
	TM8dGHcvnSeZ4tUWJQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16VS-0000000CLaY-3BTB;
	Wed, 16 Oct 2024 16:04:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16OR-0000000CKZf-2O2O
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 15:57:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4311c285bc9so51126865e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729094217; x=1729699017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSV2gT6gYSM6is+LiuMw8VyGopCJDfUv1Rz7V5M5H8Q=;
        b=NU9yLIEUhm/kRiG2dh1VJMXIK048HgZAAOr7IiMZrb2X3RlyS3eYkSfWNyGjcyfLqp
         vac8uv583rRHb9hsLlF8PUFjkM5ALOponHJquJ2lCsWUHiZ1tDlFJ6l4MR2S+q2G3dbk
         A3xmj4IuSj6vvq0FSF6pNZ/s/l7s5WSnJj9ayMqnkRmADSckMU0TbchLeEUvRZ6+TzZs
         qxZep/9j8nbAvBshHED1bE3bDP9xnooPUbjMjZbwtg5KYFxfGaFQnHNKilJJNiBe/hP5
         Qf7//Z7rXuge/t2lPUgthZIlBxd+JcMVG+49Ggmm4JdVA0jjU9a43pIUk/H3YEySIFhp
         F4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094217; x=1729699017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSV2gT6gYSM6is+LiuMw8VyGopCJDfUv1Rz7V5M5H8Q=;
        b=C1SI65nAKe137QpEMvo3pJbn8jGxZwTps6klGVm7UxO4BMXp2naXEL4o4t7BS3k6mq
         qd9Ld+q2KbIUCSn9vqH/JarplU/9vpkf0BZPVcpyaHG0piCEyUEzCBcAViJc0r2bKJog
         nXLn6S4S7gR7Kqj5M4UHNqewpxKGLBbrdMSP0L6/5TLOnEIrwLeqavAR4cYbFG3oIfDg
         E2Ec2AegPE0rA1puJe56QdTPJwhJ5omHk78cMf1qRGcIWSG5ccFclSpprVq6RJxae4g7
         pj+Ign0xdbh0EknDX4xdNAMmc3fiNHEcNHIVQ6G+vkap6R0oqhPrLb4vLWnMbp9itaKL
         UueA==
X-Forwarded-Encrypted: i=1; AJvYcCWZRemBxNcRwvVuVB9gcxweIXgVb+AgiamINvh87uM2dz9oGzby9L0tfHusg2dRQe8khFWY0funebWSIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5xYtR+K1SPdS/sCCJ6gwY66tafVGwzRIeuiLUaYAuV3qD/GFY
	q/iet4xBu/cxvh8AtsXIoz9gtADo6VLZMBYubR3xqf4Unf9EYxNn
X-Google-Smtp-Source: AGHT+IHOR2UNT7/i2C2WfH9ZYqyeeZvzUE5Gft4JCEzBjsMC2BFhtrQ3WsW8dmMbkRpoEtmcH7dsMg==
X-Received: by 2002:a5d:48c4:0:b0:37c:d2f3:b3af with SMTP id ffacd0b85a97d-37d551847e0mr14768048f8f.5.1729094217047;
        Wed, 16 Oct 2024 08:56:57 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8567sm4661078f8f.76.2024.10.16.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:56:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: th1520: Fix potential null pointer dereference on func
Date: Wed, 16 Oct 2024 16:56:55 +0100
Message-Id: <20241016155655.334518-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_085659_938939_05B769F4 
X-CRM114-Status: GOOD (  10.68  )
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

The initialization of muxtype deferences pointer func before func
is sanity checked with a null pointer check, hence we have a null
pointer deference issue. Fix this by only deferencing func with
the assignment to muxtype after func has been null pointer checked.

Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7474d8da32f9..e641bad6728c 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -803,11 +803,12 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
-	enum th1520_muxtype muxtype = (uintptr_t)func->data;
+	enum th1520_muxtype muxtype;
 
 	if (!func)
 		return -EINVAL;
 
+	muxtype = (uintptr_t)func->data;
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
 				 muxtype);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
