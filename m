Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9007CCCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZeUbcbX9Ct1CRDVd2LPrbxI0Ph41DSdyxTtnABrUYU=; b=h41pI46u4gIVsO
	k2/AcV+6gRmX+uwRviTdwt6oCnA3He79EjjlK1B/qkVWOjBp2epDzbgG0Xygl/08HJ2kvmRNs7tTj
	w9flRxYk8m3ucPV+YT37yJA6vfTgU4LjWYxxnO5d26zJtxta6ptIXhyTJCSBw5JUuf2FWILnZotet
	8SNmY+3/BcbhWKhwj9E+qLTRIvkvGxl8QzTxhWU/L8R0HWxVbsQQDw9XXLPJDUqPbsbS+887Yu4mR
	Y9qt5qZaWsOOgxT6TQ60SZargvKexqMt68ysqNm7bN2EXJBwRGFdvSb0pw7c3uq3YJQY7ssjDvFx2
	5AUop+omVRjPo9ew2Bvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97T-000000021Rc-1RGL;
	Wed, 29 Oct 2025 16:33:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97P-000000021Oe-2eEn
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:33:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b6d70df0851so15524966b.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755630; x=1762360430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=L1NHXzEbIyLE6ugFSjvgBcEOiE+jad0M4kdkp9pfSg8+vUc3KpiD17LrVBZrS54p1t
         WZ+W8fNo65xFj5dL/4XLDvNA31Up4y9zsiR1teUU/fqxete1k4x+TilAMvjKUNePedro
         TRACFfJ0TeduVzkYyBuTYYWgsI4YL3Dv8cYSiRIOKAMGTUePY45p+D+tmooI4EcYP2LU
         031SCwf+E8fTD9V6TuMCldFBf8bwqTZvwoWjIWy2Yviilg3dyqHOJBXfhoCTesKVe+ax
         aHHFnXnhxd7fpFvwj2CM3a/KSvwRHltH7vqzjbGsEhv3Yhc6LtIbAKPg02Q/zZ/65jKD
         TsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755630; x=1762360430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=uP+cxZccVwf+YNwYHDY2tsWVXkOeygW3RVY7jdX4OTGKSSpSZoBJxWGD6HkxoKzPAD
         fM23hXFyvZYbogm4UmGmy5x0oaLVUfoZtOZuHeU3D6aU5X/8y6tvbHQ/lu7RUfvH01S6
         6v3FnY0jssMIC7ywa7lmu2omXTWazNMIJmRetrKXQOzOW4NU1Yzye1cefqCqAMTp+HeD
         ZPWl1EzFFEf7uPF0BnVTi9fRPIFcAOhpSHnOzoKr0NJvbwr6Q+rkZcdRzOpwegwsveTz
         oNH/hqVtA/Ua+amCCnigWqxV1K7NmliKgDYs7ASkctmOE4ilVuRvXrAcUKUeEt4doah4
         ucVA==
X-Forwarded-Encrypted: i=1; AJvYcCVhjQie6WuhfaQPu+f1W+3uaXxYsmudZI1T/1REckLv8ZlUBC9CRPGGeq/9G1BBsP5yLn6BAcj9ECMxBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdfJL2M4k5Yg+m+Yuf36Hwc1GUfYcOCPdkKQgGZdLQxDZZUksr
	kz2v+Awb5fq3Qre+Q8dFZZLsz5lkXnXA4H6SwBKvN7UdDNwAqvZueEdg
X-Gm-Gg: ASbGncteMUA60VJxv4HXciPNmeJaKIndjSJw72X721XJRIqXoio5I9hmxKHh4WtaVRd
	uomtdB+yuZmmB/GEk/cWfSzV22Cwgi01eSOOiXS3TWtwsMmwI7X3sE+wKFKGl4uuMDLHFbTeTXJ
	50Vbu5yP3UdW3KCmFSVXd/3UfXOHzM534OGLQO+phlgtTyYy/MHmA4yjgHcN4hObkwf9A/y/b67
	XOdzQgr+jSstCq15YrYQd9dOTQSm1p6MAgDHNNOxkmruoA4I1fKauPhANTVFVhrguNN+iO1tWV6
	0fsXvM8DjeFS6rM9jvCzGTDTDxnasQ3w2L1uRXL/aG6S+sDsF/FFhtSH0n1C3af1NoeGhBPFtog
	UGx2HSj9IfU81oZMJ5f+UCMMdVBrE+3GE3WSn75lah4Blu1w6HD773zGt7AlMxmC0bZGk3KUiTq
	2W8MaEj3yGdiePgkLoIP40ph30fo+RkM6Q4ux95qEnzUtgODq7bpK79IB9Wz1ytHFN9ZE+
X-Google-Smtp-Source: AGHT+IFQlpirQWvqETIaDsilJH4sjQW05iHSTqO+BVFy04krtNR3muOIO8OYFK3MmzGZwCCaLhUORw==
X-Received: by 2002:a17:907:1c8c:b0:b3e:580a:1842 with SMTP id a640c23a62f3a-b703d557003mr393915166b.48.1761755629552;
        Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6dad195456sm939661066b.72.2025.10.29.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] bus: mvebu-mbus: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:32 +0100
Message-ID: <20251029163336.2785270-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_093351_715218_54087837 
X-CRM114-Status: GOOD (  13.74  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/bus/mvebu-mbus.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..d33c8e42e91c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -1008,7 +1009,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1043,7 @@ static int mvebu_mbus_suspend(void *data)
 
 static void mvebu_mbus_resume(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1074,10 +1075,6 @@ static const struct syscore_ops mvebu_mbus_syscore_ops = {
 	.resume = mvebu_mbus_resume,
 };
 
-static struct syscore mvebu_mbus_syscore = {
-	.ops = &mvebu_mbus_syscore_ops,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1122,7 +1119,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore(&mvebu_mbus_syscore);
+	mbus->syscore.ops = &mvebu_mbus_syscore_ops;
+	mbus->syscore.data = mbus;
+	register_syscore(&mbus->syscore);
 
 	return 0;
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
