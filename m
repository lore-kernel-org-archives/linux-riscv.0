Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F0C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOOHAc+Z4LDNv8ZmEVvNlUNeuKQX9hDyiVVlMZGno0Y=; b=kijr3tcm0BPsQu
	L28L8wFXbE/96GHZmdkyxfF/7OLJsL/6IMN1Zo8Cs6Uj+ohhdXH5kE8ubG9e9zX1zLDemrrtFh7Vk
	Wnm9YJdYh5WIQJ/z2z9ZGOQ/a+q0g0diL4flLT7eRtW33bYnYmGBiV8jmp62xaw4NKW2aWAdxHq87
	nDB3Q3Spbvr49VWEZlusjVM8U1tYFCrE6mMkZjDABcA2ZS0G2I7jYlmGOXcaJqcOf/MlYJ5fvAzHp
	yiDjN33dzPGgbjXZbnrQMgsD9NJpmcTnH5e1Pqdiwj/pIJ+PQk+/0ts6NJ2Vq/gWOa3ID4Kv7YgEW
	pouuKik2zd77KCrfUbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFi-009mn8-Kf; Sun, 21 Aug 2022 11:36:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFc-009mfe-H0
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id bq11so3482317wrb.12
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UGvwPzXngv88+qXXF2O4AJ0Z86Zyohdzp8L49ZwcrUI=;
        b=RFEWL69QfCRQQBK2lSa24K7nmexDHde5oOE9gK1KPgEWu/3N9BF1FKy/yant22fc7r
         SovDED+cd6fyc8s48RsE9t5Hb3/EgfWZ8sE3O0GnkOdMg4SdBVoDYmAToK0UlC8wMjST
         Dy83emsgcvHF06ICzpd5w01aqlAlScw3qmuXagdS4mHF7olMtod+7IqWIhUdkXJ+916y
         U1Es8YS/+TK13ci36gErubIgfOBWFCDMDaoX4eO6VW8NZFXjHEZ/W3FjivuixLu0wK4X
         zDWTdTcgDyHjq82/Wl3ihmDAM4A9lKTGfM1UAU6X5jcP18LNvlgBNWHiNIjIB1igLJZQ
         vXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UGvwPzXngv88+qXXF2O4AJ0Z86Zyohdzp8L49ZwcrUI=;
        b=T1Z6l+K8g8DrPA3ND/3oq2Pfb0ftwn1boKsGPhp9Qw8J7pWKbScYXUlXtrea0K/Yoh
         LML/UxPX5XNb0uhzK2G2FS9XsjZQNBnr7+RSfnNqRaQfivMGiPCGbz25gfaCK2+iK4tn
         133yD9+cpP/Mg7WBNAYL+oSVbeH4UpxrtaWKkwhQioN4r1GZdmOHaKMA7c6dBQp0tI6D
         GkP9L8dhHWX3KOhi7Dwn49OgFb08I29zKoQL6K7QVGG7YLSOTxq10ozyIuiJ2aMYMeYA
         XN2yJa/5pExBOX1iTwQbRGax8S0wmPwkxsTdvfTphbe9/8gJAeaLdIoKVArC0k/rbYms
         pN/Q==
X-Gm-Message-State: ACgBeo0WapY8Oy8Tu7dIb2HoQAo44JKo+7Gh9osd1JFovaM4PQH1k+Yh
	Va4H1DRQdxFO1b/hN/BGlo/bGw==
X-Google-Smtp-Source: AA6agR6HxOhtorb8TKIhxX8S9RXjgPAg541CyxctPo1Ydg0AdY48FkmATY5ytrYfPqqcMNSVf1d3pg==
X-Received: by 2002:a5d:6841:0:b0:225:3558:972d with SMTP id o1-20020a5d6841000000b002253558972dmr6441695wrw.461.1661081778602;
        Sun, 21 Aug 2022 04:36:18 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/6] asm-generic: add a cpuinfo_ops definition in shared code
Date: Sun, 21 Aug 2022 12:35:08 +0100
Message-Id: <20220821113512.2056409-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043620_614923_CA2EA3C3 
X-CRM114-Status: GOOD (  13.95  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On RISC-V sparse complains that:
arch/riscv/kernel/cpu.c:204:29: warning: symbol 'cpuinfo_op' was not declared. Should it be static?

Sure, it could be dumped into asm/processor.h like other archs have
done, but putting it in an asm-generic header seems to be a saner
strategy.

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/processor.h | 1 +
 include/asm-generic/processor.h    | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 include/asm-generic/processor.h

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 19eedd4af4cd..dd2c9a382192 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -9,6 +9,7 @@
 #include <linux/const.h>
 
 #include <vdso/processor.h>
+#include <asm-generic/processor.h>
 
 #include <asm/ptrace.h>
 
diff --git a/include/asm-generic/processor.h b/include/asm-generic/processor.h
new file mode 100644
index 000000000000..2ec9af562e9b
--- /dev/null
+++ b/include/asm-generic/processor.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_PROCESSOR_H
+#define __ASM_PROCESSOR_H
+
+extern const struct seq_operations cpuinfo_op;
+
+#endif /* __ASM_PROCESSOR_H */
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
