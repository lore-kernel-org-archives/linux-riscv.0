Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAA606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRIBeQpD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KUFkkNu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NKVZO8WhFZS8r8paPZgPQwuZkw+5vmz5ULtVQ1fRNUo=; b=SRIBeQpDRi/43wIRGMrf29Quil
	reTMWqiGMXLv4uErbdfAt+EjnEQmdqysu6PTl35/TUw+6ChzHR87vFAW4W6UWCeFK9mTkY4455gKL
	pdZLbOME4sB+Qw5M6KJ3EwQYDySXLuAtTAma+Qze5C4fO++8iZLitXwRAFROnqXx9vfjk6Mu0YWmt
	9YvX5AX+f1X/Zk67DDew3iKQ/m6Dxrycvxij/ZakBbzXwFjRgnyhSy66nEh1FlSTjaDKHYlHmFLYs
	rmzvcop9ZvpILo0ddlVzHI4RVTlL1zeeB6MkUCsJuON65TPYq/i7DlBf+jMU++zDvR2o8LgRybvlO
	m7/vSwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf84-00000002cR9-1mUN;
	Tue, 10 Nov 2026 06:14:48 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf81-00000002cQ8-2YQu
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:14:47 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so317028eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291284; x=1794896084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=0KUFkkNufpKdYl/YxRXYq/GTfJcPu9XOTVO+5XR76dFy//f1m/I22Z5xPlaCYeVWGL
         t4VHZl1PWLikLBP+xvvX+x4UAtk8pEIHK8ZmsASuyq9eazRjFbGLu8Xm37dugY7q4BJL
         HtTX52HQyxO5mEyfP4MDZhl7rfSpVVa8gb1Ny46WEJxsb7RrJ85FA9oqsVr0ANaNWCll
         /7NdOM175bRR3iQn2rvGN+bkaqUqerNo++NB1AHqYvR0G1YWo31Fne2NQimepNPYgiYp
         qnlLUaMsxHY0HTyGBAm5/jkOB9nxBhA/5f3SCf3yxlgeBneVsX1ugUWDqiCalL7WkWIw
         QR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291284; x=1794896084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=oC+YhsiUXc0h4lbSFIo6Z/S3cGpDprnEdCuk5GnZ1eP4M0gRYdbn5FRXeGD9tL3dXE
         CYvNxtQMwiPPoFFTSSqIH0qsG1Zp6HV6aTI7T3mxbLGb4c0heN9oJhzk+fnR68Nvsqdt
         Ra5aerl9uy745TdvIauUdl4ZnTaKSMTHqRM1oqzFOHMAN1MyQ+JO4jtjO/lMJsf5ZilK
         tuHKdPsx+r5f7OCt9S2reFthSVDu6Oa9Cs5rpDGywF/pS4NpV1q8r/41tiMRblrcVNza
         FDEyaIDqtZ3wvMnSIPt9Y1x+QdiyG29RkFbIr+nsLaGYTO/eGZg58tVk9nsmarvRCGvI
         3JzA==
X-Forwarded-Encrypted: i=1; AL+hErFVl8EqiCAjnUy6kr7JQXP4FQVBmTPSTjFiFvv46sLUTYBeEkRGMmcGMKz+hNJa2qUBxz818ABF0bpWDw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8+avbTPwVdd/CgwJTI3rsBLPCwh1BZYMm017jm8sU7OxZPBSUy
	baqmUIMD4FwaVP4cG1fDSYkYgpeSVHG9Kx6ob4lvztOR5SDSd4F1i2Et
X-Gm-Gg: AYBFou3HteBZ3RNKxAkwJrYx4Nc3/0tKikEVjpOFnazWfaWe0rcz7scUE4QmqWes8v2
	uwUfx0xBEQIbZFm8C+N70V2MGD/qbK+ZlYTPFT3iuY7pg0/QUfB6U9feXE1tOECsRcjoXRZQhDy
	tZeIA5JvWZubvZHm+Ka4IufwQ+eQVWJf218Qz2JT1Lri0FuDG9bDxyT/BZUvD//UXNztk7LjKn7
	xPVYrPR0+viUR+kpeQP2ItDEOzwFqT1r32/vW0xmKHx/r5qMR63/8kphjbyeHNmeXCBo0BpZ+7V
	rvCWUH5Kiq5RGOGRn+BeU9D4sFEzbRHgiLFQx7//zmRjD9QjUqxtw+6Tx746BHZQjjFjGxoE7px
	GNc9Ce9PpKdtBR+siNUW/xa7Eqj9f61UMRLmJS/2CmMqeE2wMq4tdANOXKkz9ZfShUJHhELk8HV
	l+hVGPgx/TJEKeqkAZmxTcgTCKOKQ6Dl3SzKuU9JuEr3AFpMmXDXh5mEhQEHpx87dLKfoiTEyLM
	sWZJ0cQSDOeRLSxpwjiU97xvrMD8TIUCsbwIyF4zSXLMHn//6njs/c3vPux67mTkVsoNrHsQmVW
	PiaBTlzV+5RmktaYMirXizaykq9kbktH
X-Received: by 2002:a05:7301:488b:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3751c53546emr2305164eec.4.1794291284219;
        Mon, 09 Nov 2026 22:14:44 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Tue, 10 Nov 2026 11:44:26 +0530
Message-ID: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_221445_652692_8CCF0E9F 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
to wait after triggering a bus reset request. However, this function can
be invoked during atomic I2C transfers (such as power-off or restart
handlers running in atomic notifier chains), where sleeping is illegal.

Replace the sleep operation with the driver's internal helper,
spacemit_i2c_delay(), which conditionally uses udelay() when running in
an atomic context, avoiding "scheduling while atomic" bugs.

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ff32876e24d3..f4b21d7efaaf 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
 		       i2c->base + SPACEMIT_IRCR);
 		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
-		usleep_range(20, 30);
+		spacemit_i2c_delay(i2c, 20);
 	}
 
 	/* check sda again here */

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
