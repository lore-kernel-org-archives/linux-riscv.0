Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05FFC87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8Vcyrz2XjWvUxlgRvygqlS/KFcJOljS8EvQKont2u8=; b=mdPF9T9y+y9qY/
	4wT7dfA67P4zxF5hWKp/K6zcX6zZfRAtFo7qjOAKfmV0YxO9l1SGJTpl4T7ef+q4LNUSCrJ10Ggv+
	voFylOCHi5BQoWu1CdK5j19ova1DFkzJQMaHvPH347OKVxPjuihDkQoX4dYq1W/X2zwMDlnqdUgXs
	7wHPaATIS6K54hwiEW5cPrwE+1kaWVufQhhPaWD4Ngqcq4pnq5U48TN0JfWYzmsUtP1THvdL7U32v
	1P8084uCYTcUPyVUPBwTWqCl455Ddf6MT77pxaTHd6lYiRPEuYBglnnT7rh6VZq24v11e4ALvRl1t
	6izXwa0B01B+UjCPqiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f5-00000008iCA-0luF;
	Thu, 24 Jul 2025 23:47:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V2-00000008h1X-1kEZ
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Jul 2025 23:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=; b=meqOQmDpY17fJeAsxHmAzYtBxz
	9+kxhsl6NUPm3rt4d9hTNaOGfr2zPGUSwwqKFaX+rNPH4NGLM23ELdf0RpmJg3VS7XVvoKAvjeTfE
	clf8ynfaGN2cZbFEHiweVn0PYcpjNuXLrihaCvt+p2P6rV75qBqHtqcChBY7Kxu9iSe6/e7QjGTX6
	jbv+mSC888Il/24/Te9VzVEvxUlkRKiY5k/4zaPcBsEwkneQBmaMIl5mrsn6OVUVBySKMszSIRkj0
	UV3dE/WRZpambY0ORPQPcI6Tr3XIczukje3IKdsIpTeoLK7+RtAa+1Rhpkdx1zAq0B+1DTW+amfBl
	SDw/FWoA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Uz-0000000Binx-0ffM
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23649faf69fso12757885ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400234; x=1754005034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=oxiRIqqGBt+kEepL9jgY4Psqc9J1V875F0wvHW9ADX+RuGxiffakv94SAANXrst7IT
         o0UAr7BagM4ZD5NUCTcGQg8QGfQDexH7N77ZZmBpaJiu61O5QnFg8iFV0xuHNOiWio1l
         Skjdy0VB1C02eoDZ/OL2+QF+vaOO/RjYlAK1OwuAvxrxAvXqcYAe1LaDQCEg2xtztpy+
         gdD9lXO9DBaNHIKp9YgxXb0JpYOwo87s7RzxwOUJNC/5iJdXWrwfU0iOlGr0afwFKIyR
         UBNbWoxIX5A0ccA8fXy5YRJWqhyE9nrcHSozm+2q2bEdsFNjkgLwxPrSdBlewJbL7ACg
         nprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400234; x=1754005034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=CekXth5rtMAH7gTO53EdqsbGUdVk83bUlUwtnnRWKyG56C1+6pLHWGzq5VafAlU/Us
         SA970TeZqfGjYPzLafVo5dNYm/+TOaySEV8+/ZXf4NHfyvINlaB2HMY5NEDotl3VEZ7h
         +G5NoMuYR2T4ta+m/oMCc0m0beidahgBmuJsnkRt+lhVXjjL0yNivSJ+uM7Qt4giIZt7
         0fIApYCtVqpzsYQyxi3s8dSwjS6KS2L2Gx58a4avgvbOuxBCYiHH3MVLxUvY10+C0OX4
         c3ctFMXgVILfYptyn61z3PJ+uCyplnkI6oZjywZQDg6//PCKAAjcPg9zUEkh8ocjxovA
         MYSw==
X-Gm-Message-State: AOJu0YzCWg1uNrZKXNkti6ez5W4OdND0AvMdt5W878FJe0VK/t5meWpr
	JJ6K9YMhTHN7hOV/UhOeYZLSRr50NyE4Igv4GKyhG/8rqGZlak85ur9PZLCjl/Licik=
X-Gm-Gg: ASbGnctQzxmieIE8OsV4wPcWv01CK9UqgqY7UHyA5V7g2lDd9/eOi2XyTYfRy4BssII
	FcapCcSgR8BiJpwuHxNEexLfLh6kO70kXcxzjKm6ORZPvGJaXywYJylXFlg0Mi2rwY8NTNM2cCq
	VoAJBFNRQSXlOLqAR7/rqowkSuCI4j1RnHvYBm5I73VPaLP42uxaI3gY14eUCLsdHmhQQCAgxcO
	/KQNq1RXjUpIY5j9Ai1Jpt5FEMu4j3TCccQQ6fmglw2sSbRT1Mrsrk/fiuDZDCZyQdXqnQfdv0I
	UTc9sbHGQiS+l+SihuZXs9kxzWvyFm/tG/N1BLVAzU4EYp8rN27yW2A9RpRTPGILk8iJ9xBzmxy
	iJyG5zqPdIcUNieoR1kCaBGpVunTmHgxskFahPiRw0qc=
X-Google-Smtp-Source: AGHT+IEC6umj6Lj/bljHcGk8ktP/FZKxktXm+XIJAAVaqHXn4oZH20sfm15h9uxx49Sr7WC6JzXzDg==
X-Received: by 2002:a17:903:3c2b:b0:234:adce:3ece with SMTP id d9443c01a7336-23f9813ab07mr115991405ad.11.1753400234285;
        Thu, 24 Jul 2025 16:37:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:57 -0700
Subject: [PATCH 04/11] riscv: exception handlers can be software guarded
 transfers
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-4-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_003717_528189_C0121023 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Exception handlers are static and loaded from readonly memory. Control
transfers can be software guarded and not requiring lpad on target.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 598e17e800ae..3f0890b9c0b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -224,12 +224,12 @@ SYM_CODE_START(handle_exception)
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
 	bgeu t0, t2, 3f
-	REG_L t1, 0(t0)
-2:	jalr t1
+	REG_L t2, 0(t0)
+2:	jalr t2
 	j ret_from_exception
 3:
 
-	la t1, do_trap_unknown
+	la t2, do_trap_unknown
 	j 2b
 SYM_CODE_END(handle_exception)
 ASM_NOKPROBE(handle_exception)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
