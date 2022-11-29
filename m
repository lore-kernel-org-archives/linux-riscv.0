Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D3C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQFqjVaqAxcbu0kghOLIZI0zdQp6Vykohtyc/NJHkik=; b=2RFxTwkX43612K
	jr2cpspko3enV0RcuWzQpZL0L/o2E8Iasy1P52oJoNUE31ooGJYvZ4RiCg+g9NboM5D9L+euJHDJ6
	o1okED+/4jRuboZ8OFLSiCeTD97Gebr6vFXrWv5ZDxC707F5dlX3l5G+qGuBjU6cAlldoGwZphYNx
	QQmxkIfg0B6FH6dtn0X3Tmkbnjk6HlujIh6Hwh2wEuK/fkXt7/nl4gS+jukQK+vl9mcIefHYw7Vnz
	WET9RvaNR2Qc5BfZ8VKJSuS1Vj3M7sxmg3jWdTl5qW7+vVsR62Ck4JWgquQ2ZWp9ngfVrOyX6Ypfe
	Pf1COhUbBzwgriJxrjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hR-009Ijt-Ex; Tue, 29 Nov 2022 14:35:05 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hG-009IYG-I1
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:34:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id vv4so34283802ejc.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkYads0KyCAx7dq1DsAoYcFYNgj4q/cQ9WxNrjTX+/o=;
        b=Q/ou0J12CnQQa/L/nFgVJJ4C4VhO+TaeDjShA1G25EunnuU/JZeNbDdsVOvcvN0Hb4
         TM8xV+AEiDrTQdOP4nE1eCSF/OdoL3fMyxocWT4uqfMdXsQUIsjQmdP+HBHLZCaJ29LQ
         +TekwVAZYZYSOVSPgFrTe9l68jnq3pUWKtKNSAdhXuRwwG/QSBkWP7vZtIaeemQhOYar
         D+BmKezVNopXodt/qEhDHiME8zMjxE5JRqT76ImuHtgHKPMa8KauOvut+B039EPBEP0A
         6xwQ5zXAYC/Vk1rEy2S7uSeoWg0+IbE7Y+72oW0Qw2fMGPRy6Cjd27RzR5HP/tsok4Tf
         QTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkYads0KyCAx7dq1DsAoYcFYNgj4q/cQ9WxNrjTX+/o=;
        b=jaA79fbh5e83BDjVrmILMtNBJsCN2kO53LRmTue8+Bynzl7UyKsxRuk4Tl4LIlSGME
         C5CuTyLZeXGVIaOtzAVwJcF7QBUMfOtbl5rYWbloWszoh2AErid9OoMgwCDn/Vx6c16I
         DNPe+U1owP6kG4miOkFBR0a0Ucs8Wpb5Sq6++NecLFv78zgnQ8U58yi0SKGFL6uayqHy
         GIpE1SN9AVKCB1/jTTnZ1yQPBGXQKYT8hndkmKQCxBKia66xevoBvAKr3xB+CXu3CgQ2
         Y+qOS7oHYjsnTTWXKHqFek0AXSFjXHiIdwtbpqSTdHaTitSC+NwapIGcN+9WG9GLcs45
         Wxag==
X-Gm-Message-State: ANoB5plflVBtzVLaAqJNZXE3VhvwTq8xCv8IJ9L5r+sy0dowrdQV8gMd
	7/4+QKbdNXvbLrNZrvfW8SQs9oKWZuWq4Q==
X-Google-Smtp-Source: AA0mqf64qQmS6IkLgqU4DA2psg2hpGwjCT4Fr1ezpJs9yGKAeXMXVLYJjZM1OXsqvtFLu6/NWNW1kA==
X-Received: by 2002:a17:907:9a8d:b0:7bf:49d9:45a8 with SMTP id km13-20020a1709079a8d00b007bf49d945a8mr10011380ejc.130.1669732490489;
        Tue, 29 Nov 2022 06:34:50 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id a20-20020a17090680d400b00782539a02absm4795179ejx.194.2022.11.29.06.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:34:50 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 1/3] RISC-V: Improve use of isa2hwcap[]
Date: Tue, 29 Nov 2022 15:34:45 +0100
Message-Id: <20221129143447.49714-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129143447.49714-1-ajones@ventanamicro.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_063454_686437_0E63EF72 
X-CRM114-Status: GOOD (  11.38  )
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

Improve isa2hwcap[] by removing it from static storage, as
riscv_fill_hwcap() is only called once, and by reducing its size
from 256 bytes to 26. The latter improvement is possible because
isa2hwcap[] will never be indexed with capital letters and we can
precompute the offsets from 'a'.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..4677320d7e31 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -74,15 +74,15 @@ void __init riscv_fill_hwcap(void)
 	const char *isa;
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
-	static unsigned long isa2hwcap[256] = {0};
+	unsigned long isa2hwcap[26] = {0};
 	unsigned long hartid;
 
-	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
 
 	elf_hwcap = 0;
 
@@ -196,8 +196,10 @@ void __init riscv_fill_hwcap(void)
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
-				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-				set_bit(*ext - 'a', this_isa);
+				int nr = *ext - 'a';
+
+				this_hwcap |= isa2hwcap[nr];
+				set_bit(nr, this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
