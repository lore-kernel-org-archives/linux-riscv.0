Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89A7C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhXzA4CSCxXg83cymqK/NGrDyuy1bRhD9HwIOfP9zuY=; b=NdaoA4oyCGfGtc
	udal+2Df++VA3KENwQZthVe90CG7G3Wj3NIP5JB3iJrs6TQyjJJNwxOtLipAzxl55X0WoHdgFBvkv
	UvTJ9bki8jo71xfpY7zl9fYPrKl5jS6IuTpVWAWvw6KFlUwja0o1FaewBd4gb+5hbO3QW0XJftj+/
	JZpT6q6iLqDocgJ0rigpIVHyguT9npLpAgppaPe6IUAVVitKQnuv10B1Z/8gPq8H6ByUISc6z6vhM
	mlOfomRMQFpNrTzX/EZn6zbKcBbzoeGnguqbFXvYlrQKUeEgS8cwX4yBFIEws0kmLzUaf4JXVmb2j
	L172SR0AqcqwrbXYkoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f3-00000008iAz-3DGV;
	Thu, 24 Jul 2025 23:47:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Uu-00000008gzA-2uTh
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-236192f8770so11228325ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400232; x=1754005032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=mTwefUdPygwqOKS83BCE5kMPmbOcvGoSY1MNMFH6T9LmBlvmaleDXaihtD/DQhzDbH
         exncL1+5EUr4EuBDvmagRxSCcGqMNCC6VLxTEsliFzLAh75kXOULXBw9RXZ7Sn2bbH+W
         Epr36U5DwDA7u40D31ER7y6dPgJxDcXotthNty36GbDap+onUJWgdpWGxLwuRLxqkjff
         JjVpTTdOXJRHSZoFFjMX4LxvJ5nbL7A4jGz1UjyBPg1nUuoO8/IikIzPhU8P3aZpY9qk
         1sHRLn7zHastFegRHNpB1aHOJnn6Effs8wlacWKNj+SoVL4XLSjbCFozStoja9S4g/l0
         iDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400232; x=1754005032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=vuGuH/pz5muWoX7xDREomWKPD9zcITWg0c+W7BWnkrR+LqTbTPMm+LFbMrr+YKLbAj
         kCoyJPPi2xjpxquNGPZ0OiYRNvjKc/CQ9ZZCao4sfgMZWdQQbzJltSO/xe9/9PJ6wRxE
         Y54w0ayPyRaETNufF1ciX0cjvKBWZGDreynTn7Cyk647c6DGme48pO2oBqzdg2SF/2ry
         QNyd8gJQdpMk0HBY6zBEZFYOyw4rbIOlnOzSYmh1obmQ+K2NnLOf5dsHHbMBOpFd7hav
         zMfB/J50++FwuCF8aGIRXtK1JF3emySBimHHJujLSEj1mvGI9whKUYzZUjlZMEEvYJP+
         vYOg==
X-Gm-Message-State: AOJu0YxwTEj8u0mx5B+YQItGCSS42Yc8vthHOrEuJl/4R1uRD4H6uTiy
	2XhyWnkEgLfBx7/rpJv5+R7QVfvEFYpTDI198x81XaNa1JvHIBwRlA6VzOdovAHbIhw=
X-Gm-Gg: ASbGncvAs9h7mGbS/WhKSJKAbtEP1WZDVF0FooPfXE/5QHYu7bP4Hoz4X9n06UvMkfa
	f2x5tHDItD9JH8VWfWb2L9iIYFymqj1dTHA0ZkGDi/Qp/jFoBmiMhn9CjOcuL40cy5mHKG6Foi2
	6RF8LineDIBbgf74lPb42BqqONM2On+ASKbl4d0YXMYboscahg0HIDmGSnypRt0FTJK+VSfjmrr
	YdOUnwhcI9H8Ci/v1BgbmDmj7vjMLGlNn/zRNLijhVxyEIoYe1RMdVpVwxRa+HUyQSdUEglxQbr
	P+EqIXo0kp+JUVNt4Rc21aDHDkrGdWHvQHN1a4S+2fRjqh0LSh6u72+ha4OON69gAGd+tqFKfpd
	aern/FAVOovb6HiqaFaLYlol0mb7ZYeS1
X-Google-Smtp-Source: AGHT+IHlehaeba0g7zvJWooWl20RVESgD35SdGjk7uZPTtlJW4lACDouf6PruSCC8hJSgeGX0h9FOQ==
X-Received: by 2002:a17:903:28d:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23fa5d12ce3mr54400555ad.9.1753400231958;
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:56 -0700
Subject: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250724_163712_734114_E5E6590E 
X-CRM114-Status: UNSURE (   9.70  )
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

Handwritten `__memset` asm routine perform static jumps within
function and uses `a5` to do that. This would require a landing pad
instruction at the target. Since its static jump and no memory load is
involved, use `t2` instead which is exempt from requiring a landing pad.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/lib/memset.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index da23b8347e2d..c4a318d8eef3 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la t2, 3f
 #ifdef CONFIG_64BIT
 	srli a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add t2, t2, a4
+	jr t2
 3:
 	REG_S a1,        0(t0)
 	REG_S a1,    SZREG(t0)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
