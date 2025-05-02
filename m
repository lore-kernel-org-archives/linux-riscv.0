Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E4CC3ABB6
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIyTGvBYVBmaFvf+AkVvBqYMY1J/Q/nJXj5P4rGXsiE=; b=WmsYWH+y30/5j7
	3gTgoEPeMuddHuAPJ+RGq8yBVwbliAx774WC2Tlo/A6pxLc22xoDWoRVgEPFjyFTF1E67SQG44qDG
	zA9uDguEFNUZXSQ4JzPE1aQzUPBpVqSfYoGj+V7FtNo2HHrXjBwLfdJ+U8KSQqHY8SgpZgrSlb3R5
	cCp8uZvLkj8ZT4FsZo1wYqT3/vHzeWHlGgmMIoqs7/UwbY6A1SpiBQpPbE5gJksbAXSEWB61yqufV
	QluyChjdW3FLl/h1rl27GzmtGNoia82K3WJXvYHm8T3/JhpC3DkNTmKDxxfypHLLeN7tQdWG6eFyl
	dYd47lATfFyX4n7eaUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqE-00000003EDr-1xmj;
	Fri, 02 May 2025 23:30:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzq8-00000003EAd-3MC1
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:30:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-227c7e57da2so24764625ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228644; x=1746833444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=0+DkYwCR6fuZSSbLsSw/A1bwYwV2Y2ACigpX9Hh0T6Beb2/xL8l1iMlw8Ts5/mMXjE
         7RAJ1XFnkAGvlP401ELdMzroACGcDdhU5xSyZjzmsKW3KNHtoN+8f5HhFD8gmkkC9hYq
         aunE4PAZDs7FgSaGlOT/NaQ+cxrN3MqkdFSts6LjZO+3H7TfvHdLmxbJy9ep2sbgKbiG
         Cd172vRR9vQL3Bc5u8diK02Z6v+qXRHfSftKNI1pDc1fr0INrvvKiHD4QhowLICyflx2
         hbaehZZ7UlElzGx+8MCQ5CcA+8PYWfA5VYgrZAbjaXzVP9K8QFtebcKlXxq0eAHaD50B
         hJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228644; x=1746833444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=i2jxQKnjTf7v3cRMo5x92igeXh3aW9Eg28BldzaeEEaJBnzp5ZVFL72abrorXbboVC
         KCAy1lwFHG95oG9q6G8jCUdBHyBb1g5PZkrl54p552AP4Xq+mjPu3I9+3/c5wTgsJl68
         gSkR8SGG64fTAsFYidS3PM5bQTixuqNp9Gb1SANmMd0rWN0CqDWu4QuVSCjlB3bazPIK
         JwUNIoUZWsdC53rwmke/yiVDr18FEExuPJTU8i34q6GPnSXu5FWvTJo44WikTXLazRh4
         1BgTGik2xbQ5ZRQC3uG1bBY2hwhemNVbh5UZAjKeNzLV0Y1g6UbhvRqJXDA588u9I3LZ
         YwMw==
X-Forwarded-Encrypted: i=1; AJvYcCUoTlIPpjW3aoQ3v0TU48aEwK4bS4LbV9kBhlBVSo5e3uIl1yO3ibPjph+xuG7u0w6CO/2X4XvDw1zryg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4cW4jliO1QYBCzFh+gMxXn/w2NKE4G1g6T3kyuRkbyLH0I2n3
	LSSEneAD77Pgqhrol2cV46OvZ9xqkJfy7ISgPOClhzTkIcBR58q0vhAqxFtmt3Q=
X-Gm-Gg: ASbGncvh8rio7wVYNvIXb6yy5D+FBdUro1pXSywOmaMwlQ2CmWZ0qSSavstqPrLGpli
	oTT+2HzJ9DzSUH7uZnDdMFwo/0VDc++maUfMP7O0iyrkvYW17oNl8bQMJx1qRzDzuW4RAvlCNSE
	qDs86Vd/kat6RosyxNB60AL01MVUTHFcJEoxlxI2IrrLtUuWE4fdLm/OanUde8bOLp7B32s1LzW
	cinSgwBjNqOi4/5Ra6PkSep899z5pAeXIAUSm9l2lzwH3K036j79fqegQ48j0wbOVYpDeI3rRA4
	mEJiejS9x9vnBeGd+ntrjlD2Gwu3C5Dst6XSD+vbMCQR6CmtvsxhZfNkO9SD0A==
X-Google-Smtp-Source: AGHT+IFdh3sLk6r+rFjqSN7jGE51d34L2PuxOmUSOaSxSjRwNX1uihuOq8DvaZzdvN042MVDHYvDfg==
X-Received: by 2002:a17:903:248:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-22e1031aabbmr69526825ad.12.1746228643932;
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:32 -0700
Subject: [PATCH v15 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-1-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_163044_841219_6058FFB6 
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
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
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
