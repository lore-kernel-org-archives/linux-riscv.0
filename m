Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C303C87FDB
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLIh9CKviuBoJrTppI42yPS0qCYZsxF8DpT4gPKnTEU=; b=awPXr8VFDeyECt
	76FMLooQ5bn6rCGm/meDQYWsSkFuW8uu2zQ4UvCcd/nem4FzynzJQNunh66ukm3KHHQEyRN0VD2oz
	RgCDXRPerZ+s2E5hq2bYmIb/qvIIQNVOSQF9tBvQ5/Ydsyc5zKGOG2W4PEgY+PVcbCLWlbIBHpBVW
	7b/udGYNt9GzNwoBwEDGPPzAemdSeWw6eN2fpQzp9hFH4Jgbz03dGE+2xTAwCj/VNI6f7hAgSUTyR
	ezDCqof3OJt8Rk/PMDywNjnq/fdtZivLxKmmfSELbYtpdWyobSN2Yi+1OJwBk/gk6KhNJsL6gHX40
	vbNBbc8spEqTU9OzQWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZd-00000004boN-3yap;
	Thu, 31 Jul 2025 23:20:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYT-00000004b05-3aa2
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-313910f392dso217131a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003961; x=1754608761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=aWUaxDk2lJ6J8POIT2Lsk/q9dS4Ea7iOwtiAsP3MLnZlNasLqYxM1Ivtm8gMKfnthR
         8dY/1FrNAb+lSGj1tYUMM9K0QZAemQlZYwfbkCBy5QuMypqw1AyIlbgytMxeOu8doOuE
         pi7gQrCOGqcStPHNp80ZTUTXxNZ6azryE4f54zgWER4sXJO8ch42hLmZTJ5fnt6+TZHu
         6rtwoi5xcInHhQ92xKu/Ff1esZMaQD1WBynU7OP/R1BTviwdFRv+TYvChh5nAidEaSXv
         oewyQirHPorEwWlzriLvOCg45SA9wj/bhNiLgdVgJ0oPwuc6qlWYHrgnDWbRMrv3rZML
         Zxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003961; x=1754608761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=aO/0dO2LZSSJ0p/kA87EHKOsNwVUkEGlg0JJiEHnfAKafRsW73NOO8X9Gpuj5C5S53
         ETQOfz16A4mZeoqYW+UBhCy10jw+FuX+g1/PlgyfUpDj59ZG5zzAseK09/Bz7plTk1nV
         uvAsIVzl2Sni2tN56WzSVrbgYmayfhdhAKe2t0KOjM63R6/ZgScKxFxJfFzCGocfCH7f
         l+YugyzMgzVqTOEdFL/lX/6u18uZSY/bYIq95j9/5UqA5zsHAj5D41eaYr6Eoxmw823+
         byVOtuTa0gtVq0LI99RhuXPzsJeox8rXlOP8bNIfCp+VugNO5BbkQTAZJ2cvzwJwBAGG
         c0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVz5GkdxhDraCM7oJgU0FF8err7fS/gvSnb3gZ75DxxN0YFGa2YGwQPdO8GJo/cKMTyvPMNVBINVSSS4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNHJmaOwpfQPNa6p1XH66IQrH+bA6OJl0sKqYiuR6FgdYFfjFE
	/FSnf+b1dj372LXnvYdjDFs8J6dbUWVjdD6jq4vF6QsR7dX8wyW0zoJw5eVyXMTYzHg=
X-Gm-Gg: ASbGnctHuG8eak4NAm6s9kgUbNAah0L5NfcU5zgl3F0P6x0yn9RDs4MCCDfVTvAbhzX
	0V3DbF7Um1F9Jy1FDgNKRTMtJuwkzU6P9LHSkahd5PXGhgU42IDkIUDxcpk6wIwz5L1jaZAaS3k
	PyX3/GMVBmnwBaZ4KL+tcj3qc8sqrnNaaVoaLOVL1NjDbJCljHj1J50riaicRZ/qZwWlqhPvNab
	2GkpWaqdJS1cl7EdQ07jkEEgtcmY85d1k7JzeZ6wbmiEEKw0Z04iExFkxVx3Jfrxed5ZpUgw+Rf
	kX7TzhjZDAZcfZhQO5G74V/CcR3pQu4wEJhg+zP5bC8FvKfnZWwlMYm6VfnhLUhFUDTsGj69alG
	51OFOMzcNHXAtptboqhcXlFH8GiiVrGQo
X-Google-Smtp-Source: AGHT+IEH44+OPKURq8+T8AnOKShWurctpSh+ROm/XJMSmxz+G/vZXXdz2Ne+7bhpwqTninNTw5WBuQ==
X-Received: by 2002:a17:90b:55c8:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31f5de58622mr12166749a91.30.1754003961009;
        Thu, 31 Jul 2025 16:19:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:11 -0700
Subject: [PATCH v19 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-1-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_161921_922448_AD5E5832 
X-CRM114-Status: GOOD (  10.12  )
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

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..eb48924105c4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,6 +353,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
