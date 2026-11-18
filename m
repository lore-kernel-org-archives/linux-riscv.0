Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3B606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p4EbmWgw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peJ59AfS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hq6/WCSA7QUhXCQaVrvjoLFFYK58kprwMgJ8hHJlZMQ=; b=p4EbmWgwbczWDkrTZhcVADx9wX
	HmjAD/D/Yx8pQySUor5gV/CcayxsxfBl1ujuKo5ImJTxJNrv/E/FuNG36g62RX7riUGsC3TlxPRva
	WKyQA7yHo099vU03/2qsdKtuew+PpJ0Q6XyzfXTF6LkFckNPpbM13ARAGUXFPwxYe4VB220849du4
	ACmXCYnIucg3fvNWgpdq/fWFb+13WcVYR8A5u9cnawweV2fVEucjm2OB9p0R6WXwCdCPnttoYJg1/
	78EyOWGfULyabslVyy8ejW7zDLDigZcX4ZGqpk1O/WXmiDh2J8P2rgNewiyql2f6ODOs9G+pwQm1z
	Zr1UTsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEn-00000008cKC-2f4U;
	Wed, 18 Nov 2026 10:50:01 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEl-00000008cIh-0bY3
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:50:00 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-38318d69173so199378eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998998; x=1795603798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=peJ59AfSYA0MXt4n1zDwRikv8FDEDofG2PVwFm38PILaNzN75TkWZuyDG+sTLGIUb4
         iACjvgRx3QTgIclNRlTlpyvWzHnlX+dSRpCtMOvNJK6axeOLjgEhyfh4Hmim+Fa1PoY7
         zm1WwRPCPVOZkHGY4fIgrktM6YygBYaS0RIt0HukzriIq2CaejzvQK/k+Bh8u6BHQlGX
         9oB0bbFBpnx2v3QryEFfUAIoDobGB+EqOXC1D9LG4UvI/Fgnqf1qASAcus8nTGNmUP/z
         Eb5JkKfb+Hc9QcdhwDc1ZT5bcrwSRJ7RW3rWlgJ6PKWnm5kAfSz/Gv5H3rq4q6TrEipv
         t45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998998; x=1795603798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=ASiGBJwNwdx/W6aNE+b7bpGpICuk8ckF2HK2Zo4AZ8z6/HyN3jhWMK1zV5bS/Rb4+k
         z0pWS1wlIzTC5hn7t042c73pHU2AA32ra+0XMiQ+ki4cD/2BNFJ63agj79jsXp1OM6pP
         wDLrsKaMu7Vh6nroSX8VdrSNrg7Pr32EOWJy39Mgh1XmYNQ9mzOpDb5ZE7U6WLY1AReH
         0K2tXZBXyFw+qHxvUfcWgxWs8JfQ4CjUdT82Wq0zcXRMFZjHE0UTMGS9d+NyThZ35V6Q
         9HPpPWHT1+pOg1cBVSYux0naSu071sONS9Xg1t4/yAK3zhwo7Q8bxRhji8DmdFscUv2H
         lzCA==
X-Forwarded-Encrypted: i=1; AL+hErFLuxvtdyWLvkohDU+TprTcw/nSeDHCdyybjgpE3/U5yIhiSrIzY6DY+qZ32u5ErI+kn13NkDk0XxwyBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/kvZJlZk+xKjXZJG4EF8lzCgaX0vPklT2mzMf+BVV0zQv/jZk5
	AY53jLvrqCywISlHTmueE0/sVpU/qdSz1r7sTcDdi/HhXoGUEXnZa18A
X-Gm-Gg: AZFdTZfLh2JczsoHw+2K7EO3/HZ50oRe31n8b1MxOK8Yb/LshWRawyTU/QIoO5uOkP7
	aEvVp8gd7+JvVquW8BudbvXI1MGgeO5zTg5h+HjesJtlxJsDMIuAkT5qd0/q8uIOClfsk6k/oP3
	ExmQgji7IMjU5oBAGnMZyc/mm1x+i8QoZfvImpOJkyBGte//PdMGuSOd5UCCIEVecXXNIyrcBjo
	AkyPIOex817EsqpNUuu1tBJup/NAQQfzrf/PKzxnOMqSCWq2XAi3pl4PjRPv/cX9rjvQNWwCQEN
	eHgTf7XgisJl+XFIoKHQHLY/hIla0Dj7YJnGHYoqkjXaJGr5KpPHSVWC7Fn3hrmXPBfOJ14h+yE
	H3ZIH3KGIYdsthzsI1wLg5R3uM/mXJw/JHCY/CgeMsuJsyFVju0jZ48SPrGtc5/kO7pkzjEgrME
	N0BdFRbkAsi+GDtGYlQMa513g+JAW2lLqrzrJQJtE+HLiRFXcgQsBUOBwqEY6/YZe98pRS4F75N
	jVTn6BlkLNNBaWJj5D07XTv0m3fJdDJcxgTL1dwg16yYgzcAAjazAwuZeLnLWpZDHIF5gMTyHTU
	HkJAPSvJkTZp9NRhiTUmsF4nhGuUbRd9
X-Received: by 2002:a05:7300:d088:b0:381:a911:1772 with SMTP id 5a478bee46e88-38281215ba2mr2333979eec.22.1794998998227;
        Wed, 18 Nov 2026 02:49:58 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:56 -0800 (PST)
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
Subject: [PATCH v2 2/3] riscv: sbi: Register SRST handlers with firmware priority
Date: Wed, 18 Nov 2026 16:19:14 +0530
Message-ID: <20261118104935.1716-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024959_196878_AF619EF9 
X-CRM114-Status: GOOD (  13.74  )
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

The SBI System Reset (SRST) extension currently registers its poweroff
handler using register_platform_power_off(), which assigns it a lower
priority than the default PMIC poweroff handlers.

On platforms where OpenSBI handles system poweroff, a PMIC handler may
run first and perform I2C-backed regmap operations in atomic context,
triggering invalid wait context and scheduling-while-atomic warnings.

Register both SBI SRST restart and poweroff handlers using
register_sys_off_handler() with SYS_OFF_PRIO_FIRMWARE. This gives firmware
handlers precedence over default-priority PMIC handlers and avoids
board-specific workarounds in individual PMIC drivers.

Defer handler registration to a device initcall because sbi_init() runs
during early architecture initialization, before dynamic memory
allocation required by register_sys_off_handler() is available.

Preserve warm and cold reboot selection, retain the existing legacy
poweroff fallback, and report handler registration failures.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Suggested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch:
   Link: https://lore.kernel.org/all/20261110061429.2036-2-linux.amoon@gmail.com/
---
 arch/riscv/kernel/sbi.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index af1ccea222f1..ab6e5bf25411 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -512,23 +512,50 @@ static void sbi_srst_reset(unsigned long type, unsigned long reason)
 		__func__, type, reason);
 }
 
-static int sbi_srst_reboot(struct notifier_block *this,
-			   unsigned long mode, void *cmd)
+static int sbi_srst_reboot(struct sys_off_data *data)
 {
-	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
+	sbi_srst_reset((reboot_mode == REBOOT_WARM ||
+			reboot_mode == REBOOT_SOFT) ?
 		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
 		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
 		       SBI_SRST_RESET_REASON_NONE);
+
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block sbi_srst_reboot_nb;
-
-static void sbi_srst_power_off(void)
+static int sbi_srst_power_off(struct sys_off_data *data)
 {
 	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
 		       SBI_SRST_RESET_REASON_NONE);
+
+	return NOTIFY_DONE;
+}
+
+static int __init sbi_srst_sys_off_init(void)
+{
+	struct sys_off_handler *handler;
+
+	if (sbi_spec_version < sbi_mk_version(0, 3) ||
+	    !sbi_probe_extension(SBI_EXT_SRST))
+		return 0;
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_reboot, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST restart handler: %ld\n",
+			PTR_ERR(handler));
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_power_off, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
+			PTR_ERR(handler));
+
+	return 0;
 }
+device_initcall(sbi_srst_sys_off_init);
 
 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
@@ -677,11 +704,7 @@ void __init sbi_init(void)
 		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
-			register_platform_power_off(sbi_srst_power_off);
 			srst_power_off = true;
-			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
-			sbi_srst_reboot_nb.priority = 192;
-			register_restart_handler(&sbi_srst_reboot_nb);
 		}
 		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
 		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
