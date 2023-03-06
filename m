Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38A5C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEyWqJXdIo9kFM5UnwXZtxM6WWtgyX3tOXQe/O9etP4=; b=4hLVLAvJVhbZqX
	Y6Ng7TuDK/HMZRq0ian95KOYCxvzNug/vLA+YfoCygFkaujAxDd+bVgBa+mXXJNmQf6u5POQr6lbM
	6HT1/BA5XdjrwCImHyYFQzlGgN1bgQtVKPUPkCaKIqt4AKweO3crjH2vWG1JZxmJ5olB1SaQ5joEo
	sVriQMpVlHLQrqkm8MS6Vc7XMMe6t09UovqVUejsqhlbhcTRsyepVaBKjrWcF6shjpcLUB02+1Al/
	j7QKtuqZDXd0wohF1drbD7ThEZVLnNVlYexOZM/TQANr+jXBTSvVsxAtwbTJiVGk9ERTsuAS6IbYe
	ZjlxOixwS9eGU/7Xotxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7v0-00CH7Q-O5; Mon, 06 Mar 2023 10:18:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7uy-00CH5n-Ho
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:18:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id h14so8216127wru.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8jUAHwbVMbK8RWIko2xHqtBuL1KyylMgTUrOJjOCCU=;
        b=ObAuaO9co25nDQl/gLe8rOAnmY1SJ/MNRhZIQLKvd0dmJCtejEEAp9VjO5ueZmwq77
         2sunlhagXc3ZRybQbORIgvtgjh2qkEyP6dv7mjew9nO81QWyUrOD18KnIi89JuAWKlVQ
         wBph9u5vcEXAFYKLw2R1CaYoc/es0FtEj3ptmhTiLJcfltfN7VENgL7XAlyBeI8VmhHZ
         HyeE5iyj056diT+pPhE/AqYPqTCqF7h1UEuIvxZm0jb1cWuzCuAJzCmptfafE+KvmsgO
         fqTB6T4p5bWSknr0H9aeAMEfr7ytra6qOWt2uq2+LIupXu7k3sa8nDlKt7kxGOLDaV+v
         Dpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8jUAHwbVMbK8RWIko2xHqtBuL1KyylMgTUrOJjOCCU=;
        b=5Cb7AGYokxscCaum0qoRcTfjnSbQD5Cekqyb6WAbUDx/+98gXTQzDu4fQz6zihFh82
         xk4K58lwJRa+/p7769dCd3b9qXaq3RnqO4y/k523T2P+vnZOsf5hWtbE15xH8cAduD/9
         fAy1tjw86QH6yikswmLVfH/oJMJWppb1csj6Sk4VguJlJo1mcTLwncZ39ogmed+uAV13
         mArh8WxmSaZu8DkLtfO5MB7wB5qPsuUBfWN32dwFPAQ9KqDDn9r9uM47B0ojwJNT0D2i
         VLCpn5yIGS8UnxyRaKNs4x3PVzthXc4pXe8xVeFGySv+Nq+bciRwu/uHMW1WEzfrsUbR
         8A2w==
X-Gm-Message-State: AO0yUKVrEQAc3vKkdOqAfz+jZb9X16QhokDMXqNBE/iNwy+h6dKzDDQL
	mMSRwwr+BHSra12abItz+aMh9g==
X-Google-Smtp-Source: AK7set9RUPCtaJosOxXOi0L6kxrJUTStoYiyoZUrRAF7YvJryt8T6e/nsOsDS8LQFTUxgDPEl19z8A==
X-Received: by 2002:a5d:46c8:0:b0:2c7:df1:a09d with SMTP id g8-20020a5d46c8000000b002c70df1a09dmr6140936wrs.4.1678097884571;
        Mon, 06 Mar 2023 02:18:04 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a7-20020a5d4d47000000b002c5706f7c6dsm9442743wru.94.2023.03.06.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:18:04 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 12/26] riscv: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:54 +0100
Message-Id: <20230306100508.1171812-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021808_596053_CB4D6057 
X-CRM114-Status: GOOD (  15.05  )
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/setup.h      | 7 +++++++
 arch/riscv/include/uapi/asm/setup.h | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/setup.h

diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
new file mode 100644
index 000000000000..f165a14344e2
--- /dev/null
+++ b/arch/riscv/include/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_SETUP_H
+#define _ASM_RISCV_SETUP_H
+
+#define COMMAND_LINE_SIZE       1024
+
+#endif /* _ASM_RISCV_SETUP_H */
diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
index 66b13a522880..17fcecd4a2f8 100644
--- a/arch/riscv/include/uapi/asm/setup.h
+++ b/arch/riscv/include/uapi/asm/setup.h
@@ -3,6 +3,4 @@
 #ifndef _UAPI_ASM_RISCV_SETUP_H
 #define _UAPI_ASM_RISCV_SETUP_H
 
-#define COMMAND_LINE_SIZE	1024
-
 #endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
