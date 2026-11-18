Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36594606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0OpkwO6x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INpx4SUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LIbaXe+vaQnWuu5gZPVojdTzdSBTgn9AsV6RXZIelCs=; b=0OpkwO6xzv82FHKHRxXa9MQS/B
	Xh/Ft8eNONuxOCF6sazuwvkX5/uDEbpScaZN0pa8IEzlWggx2XVfzdHQblhthISCHogyw3gNbycIm
	HDg+WigNKFTy28bfINq1k9nAeY8zroh8QT09+ux6WIg67GNBHL4HvyUvI9fD4o6YguhXpjHEs2nbh
	JjUiQyvw+8omyWEEkkISm40je1IQ1owbnvKraWWMj1JSVoVhBcPHNK12YTEJUPN0rBKIHWsheq+kE
	FXYXPnLXAGXNaVgLxFyGc6co9l3b+jLxMG43yDVaHIifFW2Vnh/noDD40i/66iqsqxi46sPUWMFQH
	e8dNvk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEc-00000008cG5-1ZLU;
	Wed, 18 Nov 2026 10:49:50 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEZ-00000008cFO-2btI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:49:49 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1386013eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998987; x=1795603787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=INpx4SUcmHl+DrbzmhFNUnjigk5nX5KSeldiuEogv7Z8+iL7Me3ZoV32Qzr0fI5CWA
         OEy1JWWZdSZTTCl/B1REIv5WzEUtVejztt4tEIrwQvSmju1Kgj0h2LTWB5gJA5dWUF5R
         bSjk+J9A/1+j120R3TuwdEHOVa/fNatiqpXBGL8YCQzDxMq/LpEzOreeVJuV7IfIad9F
         tDyz2hEn0II7d0hnMdtdX9IKHnazkDcxgPnOSkhGfafWAoZnmt9Lr7RNaT7Lr3c8+FJc
         to3l8ZfOMPj7fK5T93wm/585arTD6lxGOvWK5NsYKTpksbdhD/PJh+hOWk0CqJpH8kk9
         lLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998987; x=1795603787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=i365pStuXgRjy539/eCFXc4rflSSmwuG4dos0EeMBW4lYAYZ4JoMSZIPuQxr3Vbgfz
         f2ByZzVyR/OpUIKCQwKEAaJi++4lNiMiCTzGweqTBAk1zIADlkza2ED5LkH3lw8OfH94
         Y/0tPdW2H57TvILWXe+za6H1oD8ab8WSjwh34zhYbTUze2XYdlUbb+w5ZYk3DfoErCkz
         ksoPQ825/k5lQKvQyoAyMyw28CKw/qyHg7AwGjaeQW/P8xoZL3W9O2AiRyTBKBxYVo18
         86gPvpr+ipCTHMryyZ4ikS1QK1fyiZjaE+TDgVBDLXvCMYUcvPUOmDcNhYokiv8cGeni
         3uuw==
X-Forwarded-Encrypted: i=1; AL+hErG41NtTupI7d3rvhS+e70cOcPkY15wlr8lUkc2WSlbUO7nbqZZ02OoqMvMr5mc8I8DaAkqmXJcFYZlHSQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+8N2c8CWr/FvV6K3G3E1Fiqif/0gGrozCMbfiZPxAxQxGmhe8z
	452ltED2U3CzwGJh0mFxQAqNoeMIpzNGlw7NkUuEQDyew4yiOqD4p1a9
X-Gm-Gg: AZFdTZeax43hHfxw1vGx2z8AAC4NEHJOu4/EbyMeIw/mvhSETIdQrHU8ZGwi3vjCYbN
	I2+CVAgDTaces9rG1iETKJgxJc0gWaTYROc4q9ThlNC1mTQuH7logkYr/2oY4ufpFJQf3x7vvqG
	vrhzxfliLD22kC7ksQc5yUlyqK8oeZM0Oe99dtmPwY7hg5LXacpFQh3mW5XzgpIc5CEGUMdBW/x
	S/7boNKZANkEBE3d5BhBSfFjY40O7kMh76/IOPK9UjcIKn4iXqG7CEO+1dRRNpWERZt+Gt1U6GH
	YY4cuU0owAZBbEmkxrEoItWtmWdn8UgA+ulIOVr6GK+3FzpFrA0QKGR12aZy9Z0LD2+Wn/KL9ji
	fFj9SxZibOBUD+BSR/TsNhS0Nv9AhcLco43sb3JA6fsbkRsR1cvjhq2g8gQFEAN0QnCvXTlyvxN
	u6XmjsZ74wEln+dqIIclopWBbiVabG4wFbvt+lw7oL0nYSXUOfkZ7x9SpRebg+/zKnBCfHO0o0u
	YIfr4ud/VXVDs/ZY14MpOMeq4mpsMQjqKrFoVrBvn1FnSKa/y9z3+xWN8M2kXwB51N3gJNGLfn/
	WUuCvxfCiJHfU729AXPV2NOgxZ/9gHxc
X-Received: by 2002:a05:7301:fc13:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-38280377e84mr2164257eec.16.1794998986480;
        Wed, 18 Nov 2026 02:49:46 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 1/3] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Wed, 18 Nov 2026 16:19:13 +0530
Message-ID: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024947_667329_159B8123 
X-CRM114-Status: GOOD (  12.14  )
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

Fixes: 5dd75dac1b35 ("i2c: spacemit: introduce pio for k1")
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20261110061429.2036-1-linux.amoon@gmail.com/
	collected all te reviewed-by
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

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
