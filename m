Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EBD3C928
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZrQ3UnH/sta2KWRhwU7k/Og6C1KkGQ/7ZNx2vTidoA=; b=cfpMCeIKdIFu7c
	h8+vHqX3o5kNY0q/laU5eAOJxFWsUuHcaT+ssBNVqmfiAnVTxAoJZpEdEkV1aJzGfaOpqGdhWEgdf
	9RP4LOz7ZTp+ImyDsbQdXMiTnE+tHsXO5WZZ+VhzqMBNGl8R6dynRddnMrYcpkBnQlURyrFSlZq3z
	k/ks9XIHBJccmgzOxjvywO1PrUboK66TH8NH/BY4EWC1FPfLlRBddAFHdFY0bBXM57qk+beejIHxE
	TYYjG4gFR1x84ApkwO6tcqSpNgLF08A0mRjGSrMKUztu8ByXD0Pf0l4WpO8ubwMRrzpbNQ7mX0k2D
	9JCyXcEnP3kDhbE6npoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpY-0000000FcBR-1yd7;
	Wed, 10 Dec 2025 16:14:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpU-0000000Fc8q-2luI
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-bea8b4ba79bso1121a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383256; x=1765988056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKiNpIsCdDMxcSIwzFbaMqkolMp6UzV21VB4NyQJyx8=;
        b=ZAoiDG6arvteK65HZBZxxCKCACCkejDw7i5LsYt41G0UD/KlZklt+Djg5pMTu4jUIs
         w8xdZIq63Z1RzVd1FDy0aBWCbPfwrriNj+NRmlZ0gfmQJZacPUUH0wH1I1lYunJ+9zHX
         6V4NPubDKbPNolEQWrDY3O1iKsO9XI3SkBADAJNS4PGvbMwstdj8495Q09V661nCetCI
         u/FyLWoHsCEktGebP1BZljq45HWCpx6KhZK/wlwWJctyuVIUHM+vHj/qGWNix64XCZqX
         c+7KihL5k8VBuY/dZ0Fk78W7ercylJYUMVpwQfMjH3lWBHEgYJXeFBfliL18RIUOAjyR
         oKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383256; x=1765988056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKiNpIsCdDMxcSIwzFbaMqkolMp6UzV21VB4NyQJyx8=;
        b=TfIGoFQYy1m/QzAjrBX9tCR5qk6QwbJzfzzDn/N6+qXleMVbFIQG0j1+gKgu9EDB6E
         /9qISV91uhMV2nlDT4P0mpcBnoF29GJXoS/uVVfRBJRkztjx7WMkm56MeXMVfJYxAxZV
         y4uBv3BU+8DneeUoppM7VLIqDNVDsOc2yZREhpt+xOa8/RTrcEkY9KdD6hIkICvJ5QHX
         HwELCmRcT47nrQwkLSbfG0JTu6cz3FlF6aGAVAr9cJKJkOIf90jFu5ViNnmV8JPTZxpL
         tK3IT5lTaTudkEhxYoydizW6HXpDnis8sv/NBDUFG4/PeH2CTO0zMGFPmd4mrlpSDcyh
         HZSQ==
X-Gm-Message-State: AOJu0YzP17AIAdONgPK7hOXahz1aviCaJAQMWW0dVQ/VeThRxdp3lArO
	Jamp9vw3xNWbYxYnjl6685sRu/KzUO2Zcj5t+D3lXGr4rzOK/nBD3d8tG7M8j+AzX8E=
X-Gm-Gg: AY/fxX7BeTHquvH1MA+7JWEoNJpFcHz+C1YjovK8LV+i7/iD9pu73asp0ehi3J0vfuM
	pnUEotoZEfeMBNtSObZdyyjhKsp8r+x34Wlad/qBea3Gp57Izv3mcnpZCEwUT6cUc90OhOxKcCs
	ZmlAIAbWREXrDOFEQuOLJMLTaidsir4hOzpovTrx7OaAnFTQIC2wClQ0oor+co64RPXk9PeSdfx
	lkGBXPFbnOL50PmJOx85EDN3IQuHeh+Ti2Bm6qI5uwczr5LfQnGkDLAviPnbjeGh9xHxjxwqpdr
	+qL2/b7wsWHxjB5OsC8U6MKn8oEdJmo0B3uW76YEVmJc1kIDSXtywu5QJ5DV7YSQFU4fapxjxYw
	50aNBrrIFbwmjqfAE7inDgqgp/RxFrjYtYDayghTUrRBU4LiIg8xCM2ed7Q29nfGs5G3hljpDsi
	5KcVtKjG41u57LzQNJUfpCii2nbFzEWPuNBL31Yht6oPPgv4veqASF9htrRkcWMKppT1N0yln3V
	BWsVm0iR9Ia
X-Google-Smtp-Source: AGHT+IEwjf1hCs+QhT0kgaUbI4n2YkaG1vePiJZxAknjVUE/BY4PVlP9gWJxosnKSFD6G/wTRLwENQ==
X-Received: by 2002:a05:7300:642a:b0:2a4:3593:968c with SMTP id 5a478bee46e88-2ac05430bc7mr2827842eec.9.1765383255575;
        Wed, 10 Dec 2025 08:14:15 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:47 -0800
Subject: [PATCH RFC 10/10] riscv: csum: Remove inline assembly
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-10-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=5947;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=XhAElkNP1R/DcELUvrMdV1p/6w1v1sH1Jk8z4m0bNMI=;
 b=pxIq6ajzNKubSjM7RdllJJijS2wCrpEZXpA1x4QQMEnDZVGZuxtBr8aQtNDmwYiPizWboWhVH
 IjYN7tCROtVD/oQO+TCuKuAd3k5RFZBGcW5djCTgtBiowOuufXAUanA
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081416_710081_2F82C031 
X-CRM114-Status: GOOD (  10.21  )
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

When the kernel is set to have zbb enabled by default, the compiler
generates better code than is possible with the inline assembly.
Removing the inline assembly will greatly simplify the checksumming code
and improve the performance when zbb is enabled. However, performance
will be decreased on kernels where only runtime discovery is enabled.
Moving towards this performance model of optimizing for compiled-in
extensions will help to keep the kernel code from spinning out of
control with the vast amount of extensions that are available to riscv.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/checksum.h | 32 -------------
 arch/riscv/lib/csum.c             | 94 ---------------------------------------
 2 files changed, 126 deletions(-)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index e747af23eea2..ecc4779209b9 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -45,38 +45,6 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 			csum += csum < ((const unsigned int *)iph)[pos];
 	} while (++pos < ihl);
 
-	/*
-	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
-	 * worth checking if supported without Alternatives.
-	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(ZBB)) {
-		unsigned long fold_temp;
-
-		if (IS_ENABLED(CONFIG_32BIT)) {
-			asm(".option push				\n\
-			.option arch,+zbb				\n\
-				not	%[fold_temp], %[csum]		\n\
-				rori	%[csum], %[csum], 16		\n\
-				sub	%[csum], %[fold_temp], %[csum]	\n\
-			.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
-		} else {
-			asm(".option push				\n\
-			.option arch,+zbb				\n\
-				rori	%[fold_temp], %[csum], 32	\n\
-				add	%[csum], %[fold_temp], %[csum]	\n\
-				srli	%[csum], %[csum], 32		\n\
-				not	%[fold_temp], %[csum]		\n\
-				roriw	%[csum], %[csum], 16		\n\
-				subw	%[csum], %[fold_temp], %[csum]	\n\
-			.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
-		}
-		return (__force __sum16)(csum >> 16);
-	}
-
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 4db35dd698eb..93c073f2b883 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -40,24 +40,6 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	uproto = (__force unsigned int)htonl(proto);
 	sum += uproto;
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(ZBB)) {
-		unsigned long fold_temp;
-
-		asm(".option push					\n\
-		.option arch,+zbb					\n\
-			rori	%[fold_temp], %[sum], 32		\n\
-			add	%[sum], %[fold_temp], %[sum]		\n\
-			srli	%[sum], %[sum], 32			\n\
-			not	%[fold_temp], %[sum]			\n\
-			roriw	%[sum], %[sum], 16			\n\
-			subw	%[sum], %[fold_temp], %[sum]		\n\
-		.option pop"
-		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
-		return (__force __sum16)(sum >> 16);
-	}
-
 	sum += ror64(sum, 32);
 	sum >>= 32;
 	return csum_fold((__force __wsum)sum);
@@ -142,51 +124,6 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(ZBB)) {
-		unsigned long fold_temp;
-
-#ifdef CONFIG_32BIT
-		asm_goto_output(".option push			\n\
-		.option arch,+zbb				\n\
-			rori	%[fold_temp], %[csum], 16	\n\
-			andi	%[offset], %[offset], 1		\n\
-			add	%[csum], %[fold_temp], %[csum]	\n\
-			beq	%[offset], zero, %l[end]	\n\
-			rev8	%[csum], %[csum]		\n\
-		.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			: [offset] "r" (offset)
-			:
-			: end);
-
-		return (unsigned short)csum;
-#else /* !CONFIG_32BIT */
-		asm_goto_output(".option push			\n\
-		.option arch,+zbb				\n\
-			rori	%[fold_temp], %[csum], 32	\n\
-			add	%[csum], %[fold_temp], %[csum]	\n\
-			srli	%[csum], %[csum], 32		\n\
-			roriw	%[fold_temp], %[csum], 16	\n\
-			addw	%[csum], %[fold_temp], %[csum]	\n\
-			andi	%[offset], %[offset], 1		\n\
-			beq	%[offset], zero, %l[end]	\n\
-			rev8	%[csum], %[csum]		\n\
-		.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			: [offset] "r" (offset)
-			:
-			: end);
-
-		return (csum << 16) >> 48;
-#endif /* !CONFIG_32BIT */
-end:
-		return csum >> 16;
-	}
-
-#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;
@@ -215,37 +152,6 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(ZBB)) {
-		unsigned long fold_temp;
-
-#ifdef CONFIG_32BIT
-		asm (".option push				\n\
-		.option arch,+zbb				\n\
-			rori	%[fold_temp], %[csum], 16	\n\
-			add	%[csum], %[fold_temp], %[csum]	\n\
-		.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			:
-			: );
-
-#else /* !CONFIG_32BIT */
-		asm (".option push				\n\
-		.option arch,+zbb				\n\
-			rori	%[fold_temp], %[csum], 32	\n\
-			add	%[csum], %[fold_temp], %[csum]	\n\
-			srli	%[csum], %[csum], 32		\n\
-			roriw	%[fold_temp], %[csum], 16	\n\
-			addw	%[csum], %[fold_temp], %[csum]	\n\
-		.option pop"
-			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			:
-			: );
-#endif /* !CONFIG_32BIT */
-		return csum >> 16;
-	}
-
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
