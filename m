Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F214EC3F6B0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWPtDXNxa1pA2qi72Em4ZYdGTBdUdn1kCMrtxrWqUkA=; b=e5a8tiV+A98KU1
	moURTo2ShiP56WRbwMD3oMW5wpxw68Hrw31vO7tpqpfjbgpy9/i7obb72/i0210odQXyDHridgVvF
	OUKOtEZiIf8QzNHc3TCR34jdk3TkaOrAq3C374Cju9SEHPKkwVg1EJnE5Sl2mN00JCFGfLyY/hBIf
	ieZ/oXyAHZTbTCCmBA0phbl1dJ7qQMyyeg1buW+wzEvNjXUCkpFXxhe8Q4d9xvrgKW0c6SOkGonL0
	NJ9F8mwnfhrwQFLg4TQ1nrBLXFbWiBDFPBkarEHAuAdYcbKR7fIpQ85oY+7dRYaWTUVHZLaKR+qDD
	XFVxEmpYATl0w7WqDUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFu-009mzN-Er; Sun, 21 Aug 2022 11:36:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFk-009mny-Is
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j26so4286986wms.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2hp0XgWencqFe8kXeBG8b3/XdH3S4lc4e5c8N+bw8RQ=;
        b=LAUaEh2tAFhDJlCpu8MUfNuM9zMtSGqKo7XN911tRo/xHZRFSssv95uBSiWYBXRNvp
         7UlrwRnOdY0JZcF2H4jZdEU94MUwWA/ozhhj1ZMuEKiKFqthJPnpE4k3HwjOguILHVB7
         d53U+CGg5Q7M4H04caRUuup7XTmPnhFCyOm/hWyHEyUf2/qJeM+8MH/mEPJBDVXky01V
         0BTGH+zJ3dWWXixtmU3ecjvrZJmJJxA5T0UJsfGk3o7lT6SAQZhCJdPsna2QhaozU6fC
         b2WWAWI58CNPdJH9MfcZW1ZfCpmYx0ybFfF3XGsEfu7E+JgPdnqeALGmlhdXaGB53p7o
         /tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2hp0XgWencqFe8kXeBG8b3/XdH3S4lc4e5c8N+bw8RQ=;
        b=ecT7iP8oxL+UjZGKnZUBVCTnxfqJCyRyycCWIEdOQuiONg8A8hsrMAmr3+MdlDJxww
         SXO20idUR5nk+9al22WT75ZGjbhE+DnvVyiZqULu8rf0dOwxe2S2ptz2Yd/yNCSVzg5w
         hNusGRcE9Y3apZ6pRa218jA1tVa9EsL9O6cIKSN37eCYsp2fQ4+JqVU2q10n9nPfEn6I
         jVSs7toEdZa0Z0T5d24gQQAwfJVaoKzuaZ+cKdgC0iHApoETQAXk5AMOUErNzp9vDLU8
         9NWoewCCKXNVEQgUd4hLRBVZ5Nmvq7xdEpn6i5rOerQmGwX9vLsWftlFvnIP3CN26VrA
         tLhw==
X-Gm-Message-State: ACgBeo1zHfqTyQQ3hZbU90fC7KZgirutqGrvAoHyfvTKqgaBNQk0QR0i
	Ua8xXjUwQiIFJfmCUCWhG/3xSw==
X-Google-Smtp-Source: AA6agR4OY+ZRYMqpTNiJlmmD03DUaN+6WGm/km0jEjdnK9nEEF9nc9erLrZ3IW+Npyz9CAeI8E6ZBg==
X-Received: by 2002:a05:600c:4f90:b0:3a6:2bda:dc19 with SMTP id n16-20020a05600c4f9000b003a62bdadc19mr8143133wmq.17.1661081786790;
        Sun, 21 Aug 2022 04:36:26 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:26 -0700 (PDT)
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
Subject: [PATCH 6/6] x86: use the asm-generic version of cpuinfo_op
Date: Sun, 21 Aug 2022 12:35:13 +0100
Message-Id: <20220821113512.2056409-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043628_971131_09EC5814 
X-CRM114-Status: GOOD (  11.59  )
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

There's little point in duplicating the declaration of cpuinfo_op now
that there's a shared version of it, so drop it & include the generic
header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 356308c73951..175b0e750675 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -27,6 +27,7 @@ struct vm86;
 #include <asm/unwind_hints.h>
 #include <asm/vmxfeatures.h>
 #include <asm/vdso/processor.h>
+#include <asm-generic/processor.h>
 
 #include <linux/personality.h>
 #include <linux/cache.h>
@@ -188,7 +189,6 @@ DECLARE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
 #define cpu_data(cpu)		boot_cpu_data
 #endif
 
-extern const struct seq_operations cpuinfo_op;
 
 #define cache_line_size()	(boot_cpu_data.x86_cache_alignment)
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
