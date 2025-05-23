Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64372C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC3vhOXnZcaGuPIuOOodQnOAY9DkBzqO03LZJV94UvE=; b=TK8DldhRVtOuiT
	1jajXV2ft4CYfXE1BX3/L/AQz2/K3zHGBrgieESY0eCwSrE7i1/tQM5byHQXz+HmVSex6EHMdhoQv
	1sKcCFxz0fSMN0GE3JQ4iXFBjo3JofYRtcrLMUeUAbj2J0K4iUbev8XG4L49/JGo5ipwZV2QKqhMb
	mxtRWwxVsR4yl5xwL1MW+NLPo7dUBl/fzSv9OWh4en7dOnmDXVux0HveshkkEDcoqvryvWJp959Pj
	nEO6ZX61iIAQMeW3s8NwAX/M8oXeqGcq75c9kHYQHcm5CtTsfOjE1jnnkUAKxF+7fqGBLKKoHXxZm
	UTTkt8LBd7KVVsvgsdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2u-000000037QO-18Aj;
	Fri, 23 May 2025 06:38:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL01-00000002zrK-116n
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6762368b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978276; x=1748583076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=HC1ZbAr4GjWeC0y6IBFR11ANm/7MF0xZBYhi/ZGSP6+1zxHpVP6+KRIiEWboCZhYuj
         ETGowxTse7DvER58Xp31IFK6EkmeSxF9FmooeJ+530atosbjVYXgF7Z7z6oefgjgrPyG
         oMsVO2Z1ET65w8JTM2Tg0HHoqN/0ysnxYDrfTNuxjiQMvwNZgmuM4I2b+hNyYEB404KF
         pR1McBvwth47YnE3CUGGGj05OSxIdHWT0PU/DZhk8pAM2HMsBwoisHXcJ6mbWTF+mOAu
         xIbhiMAKuoFvh4SxoPN3ZgoKj6QpodJYw8GpIi6j91l9KmYH0q3x2mQfEsqeIlsDbAVw
         v+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978276; x=1748583076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=DPwGN63qK925iN8LzWz17eFk9c2yNg8v7RPwogWa7NIVY6wrKd90BowgYRcrpk9XUB
         3godHxEnWSZo3NVJv13ATTfttePfLBJBfcHD6fMIrRnsF6ZkbDq9bGPJ1sspiLj4+IBt
         w1W1qotS+UTX3+0ZL6Dy0ay/3WcaryEN+NvJd0dvA5UZGOkoEDmSpIgHlwensX0U7zqb
         7KDeSbVoWdvZ2Xb2Mun2tmCjX7WP7O7PpTyTEvirP+RpfHtkBrNrr001VaKxTua8CD7V
         TnKu6SfR4pigi2yCzy1222VxulSbjJMr/B7iU8MzLPhb1yxsAWFBjBOqAzHdtqI5NbJx
         GOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYBBTAxtgoCYPi0RBOa0ZxKSUZLzmY2FAbepDmTmCuQ63Sf1gUHI/19tVFRogwqHY32HCLnSiPdnrRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7/3tkmY+VN9BeHeun4VI2PGMpFtckNBK/YZj7Jm7jWbbJRzkD
	Ylh3aWx7xRy6BDoAQg6csFie8qDqceRJnr09NdJCdK0Ew0ovrTKoSsLNfo1kzvFOYf0=
X-Gm-Gg: ASbGncvmA24i/OcXWm3V4AzF0IikdLQpMH0CsXEInvZ4sFmAi9fxpEJLgGCxEyAT1ig
	zYiRHzjrLTqmRMxVzC9mR+xbZNOo6D+XMBcoLZ+F3JhfY7V2YWekLfhFljwIW9L3coSavlTa+7p
	7+xvQH9FR6xX2hGykFLo9WK+C3yPTJ5XaR19Rj2iWb2OL0VamJuXb9UAXBJb8Q9bXXvQH/3+UaL
	WN3Agd+7TH3Gmnm6QENH37PyjxobPybSQtolvJHOMITjWRxBQF1ZjcQLOPYj4jrjnnoykLQhWOz
	040xvX95N/ecWDHNjT592+Sjw2KOFlRPe8njHcSPmcliY1EK1Cam3VIpTryxRA==
X-Google-Smtp-Source: AGHT+IHuvJwexFOpqMWZgmqCHklA7GJFd11ULqc5C7xPX4e1BtVUWPbvc7kB7Fax2t5Kt7WHcMzvcQ==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr36423560b3a.23.1747978276169;
        Thu, 22 May 2025 22:31:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:04 -0700
Subject: [PATCH v16 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-1-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_223117_287608_9F012A29 
X-CRM114-Status: UNSURE (   9.99  )
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

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
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
