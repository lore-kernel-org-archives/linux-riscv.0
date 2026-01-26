Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF7D1951A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 21:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQanyhbd10CivyFfxAei+ngvefEOxcHrY6JIXAtDh2Y=; b=Y7HPjb/KOkkXmKZ+QnfezlZlbG
	a+9PYnbshOd6Ij7yK0XdPN9+WXq/ur7isEC8Cmd4UlqEwVED/8tJWnQWOf+wgD7nXV6TgMVxi69hv
	57vbiL+kiBbF5E+uX2Kih1MNttgctJGqqfDQ/tsLhhCDH5cLyjvfNLtzSDM8iPsLHONUeEYq+IDv+
	ywyPFiJlWVGEoM1IQWTOi90VMKwZZqLcdphYnV7FRTw5ujpeNkSRgw29aUPIGYdOj62LqTpizcRW4
	2xhMVtLvs5YLQJPfb+Z3NbPn8/LpQEyyfQlVizJv3jxF7l6zZPRIZF14z2UiH/9hkbE0RrQWQBV8O
	/fT2oNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUZP-0000000DI0H-3TOY;
	Mon, 26 Jan 2026 21:56:27 +0000
Received: from mail-dl1-x1244.google.com ([2607:f8b0:4864:20::1244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUZN-0000000DHzu-27fZ
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 21:56:26 +0000
Received: by mail-dl1-x1244.google.com with SMTP id a92af1059eb24-12332910300so918598c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 13:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1769464584; x=1770069384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lrUOAhghPwzKg1J5j2JXzrncTINsAcnCOvL8lgOY0s=;
        b=Bv7vTQipGx9OPNbN5HHX94WPsNAkSeB60y6BhrZNETRgJP67owLuPNfTlw3cdGQAJ+
         n61nnY0w9JMM9E5dzacnsTFaCuYZ0rcuXDUkco5y/xR1EZmB/E52nz8LhiZoVjN2UIM8
         V7NlaFrXn9saoFlMW0eDDyCH0V3Gw3OeJYjv02u0cYPqSxCeTVEHMkAhjh6AP4Fpgk6K
         ssGx6mktnqC0ZQKy23uVH+S9lA354vTkZpOvptpMctl3VNDup98HFX1jOnsfhPzGZEUQ
         y7CNwOy7dNXwr8eo+CEhOo/eBHycxrwc120m8kPsI0inWOo7Fmnr2EOvDn95d+fsPRH9
         Is8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769464584; x=1770069384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lrUOAhghPwzKg1J5j2JXzrncTINsAcnCOvL8lgOY0s=;
        b=QDuXJ3Qu2NOHaKzr1czyhqeS4wU6i1rkfGCBc78EO7Ivom04jY2oAHKt+GNKZSK1u/
         azqIFMX39MgQxj86PI7dx1rLFlCi1Os5PPCpab2SmA7u0h60l41K8u7+froPTc0Srskb
         omKsc1wgZGdGYnVNZtZWODNd4a6ucZGLOHRiLr5V2JqU6gh/eaGwrFL+M9JYG8HtPtoW
         oYn2IhCFXG6DmjK3LPQi8yJhfeLMvoUh+cosNsUL7J3QTemDyNbaiPJsDhPTbhSwNdky
         rh6O3qFnFD05dz5ly11eMtJ2orh7VcwkBBlRL673n2ymaZzp3AzQge+79GAtxBorxs2/
         /IjA==
X-Forwarded-Encrypted: i=1; AJvYcCXt2Xmg+W+4L+sgLclFciN6zQeGmhM5ZQv2Fw3NpluJ9fVy48ot1KJgzr+FMvFePCzaZKt2iDXjPP58tw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9vydqjzu7pASGkboXys5QE/R++ursP+pZoxH8ukRqzGvZC79Q
	7VoqrONo7yzPf3zR3pbEkgyjAGOJUBhvHFa8tPvoePtR3B3gGUImafJzA86FAdyjhu8=
X-Gm-Gg: AZuq6aIt59hbP1526XlSBNgpSwY9my8G60pDpjYBbdnRjtZoIpzKDc0/iXLOa8Viwa1
	wSvgBLhPXUuosIg6IHXinjddbCmPRDBBLmNkibtQ9jMnh4S4nZNkWVN+Smun35Y0SAYQAbW+p5m
	28n6Q6iuuJdK4WrzX/j0F3tBTbkw/V23I7af2w/FEXt7Nd6X+UmS8cdHPOIO8qVKa75JejfIyti
	7nZ8XCn0rYLjJ8HXynyqIUNuFVoTBZCbw8fHcF2KpwTzsfAk2nFKrK8oOiZYA7azBCxO2yPb4u5
	X1jh3ge4SfqOy+XWnVH+uFlmxSqwN6LG0AyCEliC2dW9DDQnEPP+F9Z6SNhDpkTujZjB5OdzAye
	y2B3iukPy31ZQbsDE33RKBZy7t1gkwdubHHIquTWkuC2FCXv9BjSRLXfNbUtIHD3bvWHsLSNsY3
	1mOlqvrRXQmggDZBw7iEfq
X-Received: by 2002:a05:7022:2510:b0:11d:fd26:234e with SMTP id a92af1059eb24-1248ec01e46mr2897894c88.16.1769464584287;
        Mon, 26 Jan 2026 13:56:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cd61sm22036468c88.3.2026.01.26.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:56:23 -0800 (PST)
Date: Mon, 26 Jan 2026 13:56:21 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v26 01/28] mm: VM_SHADOW_STACK definition for riscv
Message-ID: <aXfjBd7eCE3ypUnf@debug.ba.rivosinc.com>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <20251211-v5_user_cfi_series-v26-1-f0f419e81ac0@rivosinc.com>
 <68e1702e-f803-2db2-0e16-53ecef4d9eb6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68e1702e-f803-2db2-0e16-53ecef4d9eb6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_135625_553650_B3CA929D 
X-CRM114-Status: GOOD (  17.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul,

Comment inlne.

On Wed, Jan 14, 2026 at 07:57:19PM -0700, Paul Walmsley wrote:
>On Thu, 11 Dec 2025, Deepak Gupta via B4 Relay wrote:
>
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> VM_HIGH_ARCH_5 is used for riscv
>>
>> Reviewed-by: Zong Li <zong.li@sifive.com>
>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
>> Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>
>Here's what I'm planning to queue, after updating it after Lorenzo's mm
>changes.  Please let me know if you want to change anything.

Yes looks good to me. Thanks a lot.

>
>
>- Paul
>
>From: Deepak Gupta <debug@rivosinc.com>
>Date: Wed, 19 Nov 2025 09:55:05 -0700
>
>mm: add VM_SHADOW_STACK definition for riscv
>
>VM_HIGH_ARCH_5 is used for riscv.
>
>Reviewed-by: Zong Li <zong.li@sifive.com>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>Acked-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de> # QEMU, custom CVA6
>Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>Link: https://patch.msgid.link/20251112-v5_user_cfi_series-v23-1-b55691eacf4f@rivosinc.com
>[pjw@kernel.org: clarify subject; update to apply]
>Signed-off-by: Paul Walmsley <pjw@kernel.org>
>---
> include/linux/mm.h | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 15076261d0c2..de912272c5f9 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -359,7 +359,7 @@ enum {
> 	DECLARE_VMA_BIT_ALIAS(PKEY_BIT2, HIGH_ARCH_2),
> 	DECLARE_VMA_BIT_ALIAS(PKEY_BIT3, HIGH_ARCH_3),
> 	DECLARE_VMA_BIT_ALIAS(PKEY_BIT4, HIGH_ARCH_4),
>-#if defined(CONFIG_X86_USER_SHADOW_STACK)
>+#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_RISCV_USER_CFI)
> 	/*
> 	 * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
> 	 * support core mm.
>@@ -460,7 +460,8 @@ enum {
> #define VM_PKEY_BIT4  VM_NONE
> #endif /* CONFIG_ARCH_PKEY_BITS > 4 */
> #endif /* CONFIG_ARCH_HAS_PKEYS */
>-#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS)
>+#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS) || \
>+	defined(CONFIG_RISCV_USER_CFI)
> #define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
> #else
> #define VM_SHADOW_STACK	VM_NONE
>-- 
>2.51.0
>
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
