Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108E7C6FD1E
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sex9nAcNSgYgGXNM7JiDgHv3X2kVXB7l8oSManHDJG4=; b=K+IPlBB+mJnE8J
	PWBo6eDGORjza00z2PHTPtGJaFG055l9EITE7+70qsY0FLiNd6jYBv+agZPGkmfETbyOmQ/2qhuiN
	CrdTNNtbYFZMko8lRb5cIrczDbc3cSoTJmmoI3mkOapB+lRvr11YSOpumi3GQ0Uu/N9RZ4p4LrlYr
	YalOGFZSs53XY0Ef0xornVdF6vj7cjgOcYo1gXAAFcGV+5K0yfqL/+RGcM3l6NhPM9PdQm5U2BfCA
	sIG532dEh4Rv1/3cXau+56p+ZfjW3UGXjuDvOoKyztyDAscGu9H+/7CdD86VdQ3NkmLKmPRI3WuBz
	/nnq1r3zR0zITwK5G2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7o4-00CFHc-9y; Mon, 06 Mar 2023 10:11:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7ny-00CFFQ-EC
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:10:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bw19so8155316wrb.13
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weWfeZkDaALdlCN7T+PClJcshI29q8M+O1TZXldUmNQ=;
        b=f8AO3Plti5z+WQY9/XMgHo9coDoPSePct2arJdhJ/EIFxMcdcjn3AlsVdepMgBZPW+
         mWl7NyE3URpqAd0tkZFAqVFMzUTtpnBAV3zqYfSk6Ry3/DfyXz+43T7rgOoofTpVN2RX
         U3G2GrWw5XJgacQNy2x41kSTkqjB29r+yj6dOz5aPgQqIxYJRL5yf/Bs/saxp7U+A3wA
         IsC+RVcCMh74kmQv0hVGBHlWoFAdJbJOJxckQLPLFbirjBuzoRk0MD6WD9eOq5Dxxqrj
         npIxA5uRpz5H+mYlOS1F15SvnwiLC5qQiEQuK3YGV7s0Z8IPnDZPErJBGWxDfcMBdery
         lzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weWfeZkDaALdlCN7T+PClJcshI29q8M+O1TZXldUmNQ=;
        b=4TjPMgl24G5yFHzBG/i9XGA2svxPJNc+I63iiVzCWVKCAort6tJrpTECDqUebSBWl5
         KjLCJiRC2+sTISHGLYqJw9jDcCeIcXREpwcWUXVEvcpfW8tIxtGU4bWexg/0EnJgOcjS
         MJ9SMf438AlwNh/ml9zT1kiGZk6V5Pnb890GtsR6M6/5aF/p0gVdLT+j9eKI0kswxBu4
         zMF0z3RYwDWf3//GFAxW9g4EH5IVEcnYTMDfWawBcQFueTLQt8EtA/bwyWStPm/QrCCX
         MjXbzOTfFPJm8zW6BTpzkMNqNb5jvUZZbiOwaWvpFobaToXWzoDwEL4/HCakZsok+TfL
         5ZBg==
X-Gm-Message-State: AO0yUKWklgUodCWw3aX3pMJZz5QKPNIVQ7SulTl444cEqturERUFxHU6
	LO+qnPDugU9ELpZo1YRTkPWjZg==
X-Google-Smtp-Source: AK7set+wuauRaErxkLN6soFrHdhxDo377VFWASa6puBBFq9YcYRsyKwZIZbzNS1yvcClJNbCh5XgTA==
X-Received: by 2002:adf:dfc3:0:b0:2c5:5886:850d with SMTP id q3-20020adfdfc3000000b002c55886850dmr5929350wrn.5.1678097452867;
        Mon, 06 Mar 2023 02:10:52 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4407000000b002c5503a8d21sm9563973wrq.70.2023.03.06.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:10:52 -0800 (PST)
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 05/26] m68k: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:47 +0100
Message-Id: <20230306100508.1171812-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021056_055785_B25BA859 
X-CRM114-Status: GOOD (  12.38  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/setup.h      | 3 +--
 arch/m68k/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
index 2c99477aaf89..9a256cc3931d 100644
--- a/arch/m68k/include/asm/setup.h
+++ b/arch/m68k/include/asm/setup.h
@@ -23,9 +23,8 @@
 #define _M68K_SETUP_H
 
 #include <uapi/asm/bootinfo.h>
-#include <uapi/asm/setup.h>
-
 
+#define COMMAND_LINE_SIZE 256
 #define CL_SIZE COMMAND_LINE_SIZE
 
 #ifndef __ASSEMBLY__
diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
index 25fe26d5597c..005593acc7d8 100644
--- a/arch/m68k/include/uapi/asm/setup.h
+++ b/arch/m68k/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _UAPI_M68K_SETUP_H
 #define _UAPI_M68K_SETUP_H
 
-#define COMMAND_LINE_SIZE 256
-
 #endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
