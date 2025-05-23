Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC10C54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeW8+TUrWHCGaMghs8QC67QFneRsl9EsUU2hKqKM5K8=; b=oj9ZFlro/FCpdE
	rO3Y1NxhEmjjCDJDxOgRBd1YMngAQ/5Ii59UCys5H5YbQ6GDduBnTbcQb/LwL1+Nw9LWMQbJYtGao
	lGzK0vfI6FC90M0mDtr0jKdUNyxTHUWXi+LMAuzBGfBN0xbyg3ROPQ2gam6OHbqv2mvLk3LJKeUwx
	NlAiIAD/8nkFHxTe98Ty+NsjhBWtnSqKR7Xij5qvF8n4FSrzb39G3iHWXvLUAqO839gYDUGLA63GF
	3suKNe21rsJlEMi6MG+n9K++AmnZIHWFmJQMlxX2HM2CzBcLSgZx6iVroBWEsWyZpW+O8OqiBx/LF
	t4WVMZoRvji8/x+U/wkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM30-000000037UV-26g2;
	Fri, 23 May 2025 06:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0z-000000030PI-0B2r
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=; b=U6HVxxCNFwE9GjJJsrgIjSqrIG
	91dPspFSQ/2BwH+YMTfrxz2BjFn4TFroKHirrcs3GqMS9YU6zsVCGmF1tuUjgBhjleMm/YYLWKQke
	q4g1lahRsCHUYmXnQOCQFrvIB5fTNqgpx/NA8+sg7bD5I1eS0VVato9q9sXUHAtWo3e9DCWkbe5T6
	ctM2tjZXWIglIQF2FbL5nWTKjXFh5pkRAvk6yh0QiaaFv4cwT8IwSfRq52Spwd4fRUnrZrIiJSz9x
	Jpy70M3tdpFU6/1Qr0F8VWYkSIf8EpgUmfPoGsjabHRbVzwVZwUmsvkqB1/zZ6KH3CWu2enqdH9RS
	ndFkaYWQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0v-000000018mg-47BS
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso8015419b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978332; x=1748583132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=wjThJ8qU2/5HgV4f51xYXu+MLzRJqN3vNh3+TJCxga4AjYCH0owBxIAdW6ZbVuTajR
         rneVMxAhCwhAXpU3U25FH/MEDAWlp+dnmd/UQOOdtD6/UMr+gVnuED2W16nyBDFFBJKR
         Tt2mev0QxQLubsqEymG+OQOkwtArugRTTNohu5HtNCqdDIUDZkdKNNe9LhrXPYYDOzIE
         n6VlWucBkilAw1cBIVbe8oclttfPzOEvbxS16PqQIg1Wq/0lYduK8pG836LtajaPYUIx
         JuX4BNJhk/2y4jllVEutzI++DPqWD+67pE+mvCeew+ydvPk1+bT1iQ472Xr3LuCogWdj
         kg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978332; x=1748583132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=KID6F4kwWABhcXEpGtrvWcfXmxDUjixyMVH1V1jnaZ87lcYzo3MWJioSW9hN8z6pi/
         8KFXLh1MJ6G3WM2mH9ggjxFDPGm9y6b0fodGknVuWdI4c6OkRqX+oAm9rmXOcxTgk+/w
         NULMQecq3gZWSELqxluLFiwZoUakLkX3v2mG0LOpoFGWiq1nE2VCfwb9NA8jkbsZMsqZ
         s1gvNbGExQyRGhZqE6R5AYWpFvF0zfrnSy5FT34LQX2XMvL0H6HSyHbszXaqfhik8Ydg
         HezHScnfHUZfXpfeO24tF39/f7GqRZBkWzQmUO7QktGxLdjyS3b2Hgu5ONmlTu/KWVxu
         pWog==
X-Forwarded-Encrypted: i=1; AJvYcCXeeyZDCWYLYe7ROZR0iAzBdVmnVL+e9WrXjdV0Z9/kNroniRab+EwMGUhHCWcOPRH+SgcGnWK6jI3gBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWAZ7I2WqgpLY+vRGHBiAlK7EC3ro7pxGrIwNuJsXueQ9djlyG
	snji/HnTy0DMgWnYkFJCZVFSI+1BL0amEjXb35rkbPq1gSERqPDbXI933T1KuwisMTQ=
X-Gm-Gg: ASbGnctXkkRpxOVfnme0cjMLCpBFa23wze1kw48N2Y3/okwuNsVW6R3VXhVn4vpsICo
	c6NPabfxlSG/Ms73HGY7Cy6LP8JpR6J6k2lzYOTwIIohS4+zN4hnmWU1uFE2ykATdXyw8dAcLg/
	ir4vbHJbxCJQsvUKEg1Aesf9zMZFQwzw5YZkKsINSmHcQYq7ABQu9WpWVH+jcxMHjXd2RBqOTMV
	aVezN6pBTkGPtwSFEsolNYD0blKAyhrmTy3d+3FeFDAwg8RDqJpcEohYUyTPCkZFfm1s//jjC6F
	+er8Znm+PKlgxtcTC/t5qcrt5z6zZOWd24RLuMXDqALDPj5bEQAK50WlTR65Qw==
X-Google-Smtp-Source: AGHT+IFN55/S0MavLUpf3quM1MMMkDLsdFfjkZf4p3h1dkJqctJAGjee587t4XJRgbN3gdxjRXpqKw==
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:8e33:c417 with SMTP id adf61e73a8af0-2170cb051b7mr42162455637.2.1747978332230;
        Thu, 22 May 2025 22:32:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:21 -0700
Subject: [PATCH v16 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-18-64f61a35eee7@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063214_181572_1FDDA735 
X-CRM114-Status: GOOD (  11.03  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
