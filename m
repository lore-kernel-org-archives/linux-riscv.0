Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E34AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD6tZTu7mHG4STAf9AXLdzM7otdiqd1tqQkiiy7t09o=; b=VGe9GFh7wpzs9O
	MGv8najCF5mmx13NXklL2De7G+pi+loxUCCWxsR46rIxL0RGRasI6figbnX4FIkXK2/e8HHB4HJkA
	i7b6InEh6Kqfmoz+V5WYhkY9CNl1HIfiB+a2bg/daNsbE6MfuO6KHWgWjbnxxk72zfJxFnkzqnmIZ
	EhID7KUDMaEqCWSQK5kBemX0dPgUmn8LvTyR+kb6vPFaxcWGgWEKIQhn2mU/e9y1zt1+7F5QfPlzm
	SirQfQh2H9X9cgLKoXpCWF4j7DdkpZM+WnxCE9/RjbwYHbyN1ulQVRWzoFH4J3hZN6fPfRMM1iweG
	Trq0LSoxEvounYFtu5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CF-0053xQ-3W; Wed, 16 Feb 2022 00:29:27 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CA-0053ug-BS
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:25 +0000
Received: by mail-qv1-xf35.google.com with SMTP id f19so721511qvb.6
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=ScmFXUnXQsBDQOeRRDk2JBohAqloSaHvUZJJVuDjOjk6MgJrr3XFo1W8C/+DWEOpLp
 CFoD3CAA31Kh5JHz4MeR1/WPbopm9O71On05gdvf3KfQDy903btjnNyyFU0gz0tOB6Z7
 xFAFLQyz++xdvte4qay9VSxxaGBH7vl23QevY/KA6IP7MpaF5wB2+AKBVZNamTdUlfaN
 CIXDvPYRFQEAQU/t6zoMKOHwXQ9qgE2F8qmzjS9ffST7S5fB+ORib58xIj4LD7VVwqZV
 dk3soLeJWZbsvYAySuo3vUIXxVkk1ku0rTyE6Dy0DE6rWVNDB7awyY9j91+vQH4fLf7R
 gj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=eEtOHQIeW2KNfSvM4kULVGaXbBS/Nont14QgOkErge3D7MsZMfbuEaOu8MtmV5nDpV
 Wz765M18FKD35LFF3NGqczLAyGkrsso3im109RvMdEkaHKH+HMcb9YVzZ/L8pME+GyTU
 k8xPZzchvmwEk9J6DAqpeJLto3GN+AXTFClOgJnzuW/VqqRb0btybSaTUBcng51JvT2S
 BFCiQmFQyIBU2h51S9kY9CJ22L6iPFZoDINRN0JVmLaz7UVAKruJdvob9v70Sx56di4S
 kRZBUgrdnpwdI47oH0bHYkUy0+JuuxnVsk1kEKDcKeJdmzKD1RPKtC99Vxxm4e+m8Mff
 zDfg==
X-Gm-Message-State: AOAM533W3UV97hKq0eyqDBrFZHTl0XMGu9c052AMr03fv8AKseVuWFW9
 yYFiZovjY6fNGictiqso/1EaAgKkpCp7vRCQ
X-Google-Smtp-Source: ABdhPJz0gbZP4BqfwiEDTMFUWQv3BXrxUsgsH+d0Rk7lM7XCFsOt8L1wSSB2ejz32cYkvipIBoymcA==
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id
 ib7-20020a0562141c8700b0042d20cbe484mr288883qvb.10.1644971361084; 
 Tue, 15 Feb 2022 16:29:21 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Anup Patel <anup@brainfault.org>, Heiko Stuebner <heiko@sntech.de>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/6] RISC-V: Correctly print supported extensions
Date: Tue, 15 Feb 2022 16:29:06 -0800
Message-Id: <20220216002911.1219593-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162922_417527_C50425B2 
X-CRM114-Status: GOOD (  13.57  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This commit replaces BITS_PER_LONG with number of alphabet letters.

Current ISA pretty-printing code expects extension 'a' (bit 0) through
'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
cause an issue in practice), it will be an annoying problem if we start to
use those in the future.

This commit disables printing high bits for now.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..dd3d57eb4eea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -13,6 +13,8 @@
 #include <asm/smp.h>
 #include <asm/switch_to.h>
 
+#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[BITS_PER_LONG + 1];
+	char print_str[NUM_ALPHA_EXTS + 1];
 	size_t i, j, isa_len;
 	static unsigned long isa2hwcap[256] = {0};
 
@@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
