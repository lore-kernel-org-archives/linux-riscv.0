Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8645ACCF9E7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn5pc0Z7pRllLUJDV+DiohpEIXuvCc3V6lsTnn5fGkc=; b=1iMWPTHW/llFpO
	1/9hJSgvZIBTAoup9HhtwD1FIH+w1UYmSyXopybtfCkABUYMWf23+5NVNXMn2qS3na1hV6+StMvck
	22UJGx7F/L+bkpwc8m9HSySSgKnTn1VA0JHECHQuxHk941TxXnxygmoa8ZrIWOkMWT4aRMemlW9tj
	QkbNXb/P96M3h+kHW8UqRi92ZlsFOwvN9ibtjmfPLdx7fzbjhsL9BseY8ob/DQX10t5Kr25Re7QPB
	NTRzUsEKyBCC9g34bXr0ad9tE43zonggY9xOwgwh+S6WKU3ABgzU/GosyMzrFg+crbpwmfC8GP8hg
	u42hG/NXBzJYlVWgQM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvK2-00000006Mp6-3Ppf;
	Thu, 23 Oct 2025 13:25:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvJz-00000006Mn4-2WeY
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:25:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-290ab379d48so7851685ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225939; x=1761830739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=b+Aa9fP7DciLfI4EdMUbP9zpJxVAYEBvUG0I23aGEHuuDhiUGs1FooJsimyNSYLcop
         lO+J/4qLgxxStP0KpUPEC5DacOsqJs0pOwlmOw0zE5kPJN19jzivdga6ORk80ImHtD57
         573FAqyOP2PuOyZmFDx9ytRg0XGdors2P/BcDuwntMnOPzQLJrzILSSRDzo2O4OYZvSd
         hUIhQT/YmN98+V3f7lQjvbkL40gY+jLnbri3BIeigYDHRx40PHAnyLjymv67EtQdcivn
         bJLaMeeEIncdxZn5x9wcySulNZow/Op2Tlg82F5Zoo2Wnn+H8RDmMoW+VUgtjz/QlMnl
         90NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225939; x=1761830739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=Eb+y0jBb0WPmBX5bqpJBCCJHB1GtnYZNOvstwjdral+bQxKzu3JeG705hWmPTrFvuL
         3Vb6TsRNmiCZSuE70EKvvL0Ys5PS8gMNosR9C8Pn1ataRZV9tfVBRxIq0Rfbo5o3T6O/
         k1hYtYcboiib0oOoCYS8Egz3TX3Fm6CPogNmmFKTTREQHcnVGd/sNkzJJdG+UrJk3sui
         lEUiprdTSfpHP+TXzyL9lE7rPTlfTEUhq8hRCjnBuF+2aLKsMVZNbdlphBJ7YeD35Y6s
         GwxGVKGPRYTNkdVAbR88DAJkw/uyz6+XZ5XoGKVMLpUePSygiWE4341npsIlg4skcTbR
         1ceA==
X-Forwarded-Encrypted: i=1; AJvYcCVnW6qCLp3iwM5HsyETrNIqO55o9XjfSAqLd7+lDxgwyrPF0aqZZuBvUZgGBD20dDeitp8yV6/KFfKQng==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjrd6CIO2oL85YorsuKZeZ0f7V86UuLSF4Hx5nZJm2Q8i+9nCh
	uzY6uw6Jo0SXE7MPacGtUymrU+TjD0DZBN4dp4ypV5waVb2GBl1AxAKRx2IoBSTH3hw=
X-Gm-Gg: ASbGncuULyNFQxJ7NxZFczT20RYzX75uDvtXnzexvqgxv9JzkU4/lXs0fk05kHnS4Uc
	0O/MpdT6ilmckTYJtgrZ2lY9SEmPZ7lGmyvY3yqwK3s8sd03W4Imo+WrKLg4TGHSgrSPMOyZgYi
	Xl29KG9Lc97v6zUMaBCH8qqHYdcJU/MDWUv8hu0CNrFgTrYYczj9+s1V4dHOEEtwHJ0nCqXImsA
	qn5N6j/b1aALb9A25jGF6bfSPJa5xtgnAn0UFjWqQGGJY7jZTuDw9/iSoTXnDOb9CFr+lFQjySd
	f4pZEFLRTi5nB/UjLlyeC4uopO2UEBP+R7onGW05/NgQ+bnoT85VW24YNOrJnRU6EVpQaBGH7/4
	l05x8jdcGBv0wFGZ85I6zn8Qa2C0vkQklMVHnznUNQbYzHotTxy1XwbufyMaoe/VMsbJ3CLknRt
	FIQUFDWoWcP3gdExiQOPeU
X-Google-Smtp-Source: AGHT+IHiowaMdQQMukarKWR4DwE59dag2M41jW8yOYSmyuKRWbrYlIpW80BNasPiFne9iuxrtQYkag==
X-Received: by 2002:a17:902:e889:b0:27e:f1d1:74e0 with SMTP id d9443c01a7336-290c9ca3304mr315130655ad.17.1761225938726;
        Thu, 23 Oct 2025 06:25:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:30 -0700
Subject: [PATCH v22 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-1-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251023_062539_653270_5FB80F33 
X-CRM114-Status: UNSURE (   9.55  )
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
index d16b33bacc32..2032d3f195f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -380,6 +380,13 @@ extern unsigned int kobjsize(const void *objp);
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
