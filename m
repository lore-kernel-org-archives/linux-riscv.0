Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A429C3ABCA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHpCRSlYkExaAu6OF9fmVvvrdsYG0h9dy78dAQa2QoM=; b=GjWktDffZgSofu
	H7cGSi5lclTfT0IPNJ7CotCjqMIWQgIqTrPYOLzDp15Mk26IWRm5rb2Pjhp6hvdEcHGVZyp1w9t0B
	iGeDZX1ms3BQUmeuyhgizX+d2lEAtebNEXhv1JqMzyjLhnMur9Yb+8Ga9uGgggUPjG7zpEAP+EBrS
	JbLj/8jjO6Wy590/AeNUWZ0gCcRUEdrRbBC9vnexmxqtQY14iInx32Mu4cPwp5VQ3nR5xgfLWzPcX
	LU5X3iYnugRQzdP7mLpCb7a5NXSXNLjIpEkgGiRmpeH6F6rDFrzsXBJTCtaJWOmy/wWkSKfrFHDU6
	N+LbBZVvDnWT0Oa8QgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL67-00000003ISp-0PWq;
	Fri, 09 May 2025 10:36:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEw-000000038e9-3MhW
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:42:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74068f95d9fso1934675b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783718; x=1747388518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db3r56u6WbxunAQsqmv+qz1Bx6fNV6R3VtqVTo1N8lM=;
        b=R2PsBDAcj1q8Libgrr69sH0dgKq2GGo/Uj2Y4xgj9R93rMY3e/ihKQFIWQtcQcsQuH
         MCSz+DuD7zpASYec4tsgXX4a+zORsO1ucDs0ev+bMSDjf0jQq8uyACs5MyQgJI+nmKSw
         R9KGW6ALTyWkOxjh1RVz0lnc2vNT+wMjJ6mvoa/O+C5WNxNzpshanIF/xmPLP5QsnYIj
         lTcFeiehqWqyuXRidz9U6AI/kjjrlc4IDfksJKvMabBl/z7ylGEv9WAVZkaJAD3ey/t0
         +IO0uWyNLaoWFinQU77KydWtCbEHaMOSMxkM44LvN5J2YUtgP9IAUAtu3iPp2L3jAulC
         V5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783718; x=1747388518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db3r56u6WbxunAQsqmv+qz1Bx6fNV6R3VtqVTo1N8lM=;
        b=Kba8oXeC/whEUemZ8eocPLEcJ6bV16rzDoPsu4lI90tw46qz3cN7szCKC0AZND59W8
         vkplvIFIEeceTRb8I2EqnvyzdE2IaKYiZ6IiHS7LjNXuRCB0WYnEwdLNDjVd09+yoO1I
         XPOKIFtaX8W+dvIDnHqY9CmhoXLPeFDss6S6MaIftAdrLP8fmR2FiZPQyWYMdgiKbDKr
         MGxao4DPpc4UDyVHYqMUYP97OgndtBp+/I5KMlr8qTXoyUOjjoIaBgNMUIVuB2b/bcA5
         iF3n59KFK0/ufZn/5aZE3L18I6T5V3ggd91kranCs081LIwSERG/Sy4iQ1Q1bTU/ZAKI
         mJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUK7EOILPzNcJ8Azb+WpOIs1hO5ANeLkH7mNpQrUmiE+5KJJY2oS+dxwHbPu57gaEZXUHqdCtA1KuRckw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw38cEHH91lej4xfDGl8DFu8aQx5crrYHNtyIt0QP2e8EajzxMX
	onpn7ZHX5WYB0N02ARImdNvBnzCJ9FGwujoTTEMIHgBF7QvA6z+RkvVwT8j7/vw=
X-Gm-Gg: ASbGncu0461oXI6l+Z178p3L3l5eRW/jzdhwHzp7w7TtNtcd2x4UcxJ/umW3lS373OK
	kYgTbyBrp2DUpMoklpGm9Iaxc3hxnbeWFJkSCVwr5x4bXTqz58J4v2D8BlG70wwR6l/ha7XV54u
	y93F7J7brI5rK/YiRGEnWv4BjTo3ddX6gs/uKh5EHDCK6VUaakcMHsN73kKn+v8B0dZVZ7mncAD
	4Pcd2RBNCasoeGF34T2WfNhzRxroNs9ejxpGjYjj0tDXPZ6kjxhkNVUEiIM8UONAh8tdv7eiWiN
	3xojDzrMoyhG2huSESaRSD9VxHgeh+g9BFFCEVF+PRzpZR6GwTxKBoz/S9enKZMPu8DC8aVF+yx
	T8Q==
X-Google-Smtp-Source: AGHT+IH5OUjlU44wPTcS9YvNdweW8Hmi+ylHBcWO0ZjkJN+zsQnLZEzF4So5FHTc3N4rkAEKt0P6Pg==
X-Received: by 2002:a17:902:e744:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22fc91a9093mr48509735ad.53.1746783717970;
        Fri, 09 May 2025 02:41:57 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:57 -0700 (PDT)
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
Subject: [PATCH v14 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Fri,  9 May 2025 17:52:34 +0800
Message-Id: <20250509095234.643890-6-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024158_837914_533D9F3C 
X-CRM114-Status: GOOD (  12.00  )
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

The reference manual says "pwms >= pwmcmpX -> HIGH", but in Figure 29 pwmcmpXcenter
is forced to 0 via an XOR, so hardware actually outputs HIGH when pwms < pwmcmpX.
Thus pwmcmp holds the off-period count, and the driver must invert it
to expose a normal active-high interface.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 70cf644cde4a..4a07315b0744 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -4,11 +4,28 @@
  * For SiFive's PWM IP block documentation please refer Chapter 14 of
  * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
  *
+ * PWM output inversion: According to the SiFive Reference manual
+ * the output of each comparator is high whenever the value of pwms is
+ * greater than or equal to the corresponding pwmcmpX[Reference Manual].
+ *
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard-tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active-high** PWM interface.
+ *
+ *
  * Limitations:
  * - When changing both duty cycle and period, we cannot prevent in
  *   software that the output might produce a period with mixed
  *   settings (new period length and old duty cycle).
- * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware cannot generate a 0% duty cycle.
  * - The hardware generates only inverted output.
  */
 #include <linux/clk.h>
@@ -113,6 +130,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val, inactive;
 
 	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/*
+	 * PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive.
+	 */
 	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
