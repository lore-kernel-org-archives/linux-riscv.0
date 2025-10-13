Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12858CCD18C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyWWzY0tITpmvgRWcQeNRLcudL9kEBC5yVyFc0gs07c=; b=sjahPxaEDIdCaO
	J4jj0pqR2HTF28svXc0Pn/2kXY27t7PAg1ceVXv+tjBTy9hr8Pvp0MIIugDDFez3veIJ60/aQDH3U
	HWLCGp8m/TKMVlhzuUcl2R6JwH05rfbaoOT+vnd49w2f+FavKrnC/I1UsaGvMInZmdLvgtLvRg3ae
	z0bVqNG7sK0fUEBYednhDeCVNGgkJ60LJ8pGfdhKaOVlRxrBU3G2yT4aKVpP1JV3klrBTjRM+0fvG
	eZrnBnDwrOqM0xODLDtqNbJQtZ5BqSw7ME+B6tCSbiURns0M2m/fIPcOZDibqOch/UBsvUQSA9RgZ
	pjl40uvu/eNv6p+WVtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QX8-0000000EbW5-350C;
	Mon, 13 Oct 2025 21:56:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QX6-0000000EbQY-331D
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 21:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=; b=Tozxkt2kU6luE2kFZNzRhHg0Dh
	i5J9T+CQpxDlpNRgwQZuuETKAhGzplG2bIRCXvCl8UL5gKDUc+/P2fZRIMAFOmotLVWR/v0SszADP
	RGKuZTcRgURvTYTIYG5xPEdDrNIfOwOdooYNsPBBcdskar0aT/5GOx0eU77uZN781kLo1joHSNO/A
	7oO7HMHbfR/KOr2k/jn6jBYU1PQMOyNqP6iuTQcFnvtJY+F2llJjoCfzVEdckTH0o+Bwgpqw6a8I+
	5YGQKR/8SmyIqKhk6Lwx3W++iA7ovNcx/wHuiXkJDaG0tsrXUl7kJlgL6QECgoqngfiY3L3wNPmpZ
	COIJ5cAw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QX3-00000004f1t-0F2r
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so5321741a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392599; x=1760997399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=ULE/vWf+v0UWbMSmfE9nXnqCaAAIUhn3grvvxp3oXiz9D8J0ILWjSeyrzxMHWU3lMI
         gUPK05Bh8FjpytXdE1Yc8JeEA7Pg4c6YuP6JQeNalOJ9iEU7vXBG7+f1K2c6DxDTaow2
         YtlI3Cbhj24mJJjuKf/ciJtbSUs41jcaekIqLn5K98IfUlOFELs/o/vqSfpkRNfN7RU5
         LbiRZ1FIfBQSK5S7PwBS67MN9a6wnmLfhQF7mneqFyVnXVMsKezyltiGr5Te4lN0KvO1
         zeUJReXEdc1jnHkx6zPUs7f2J6Ep0j7s1+iEWnhNx6xPH0uQwkMfhG0XfbS4w6kFaoYQ
         CXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392599; x=1760997399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=jUfMvApByIZbH/Cr0rVGQ3Jc5YgFoU7a/JT9NTeycAsUxH+hXKdqabT/eaaIz5G9vp
         oUtknFf1v57AvX1OzDh+X6zrxIj/8TulLzvmZvGXN8DnBl58+s2NmkGO7npuKYegm1ym
         gGkfGT/MTLMFLfMFpst5V/wZkS4Paa6hquixblQ5q29gcRW7K/NVxxRX9uNTpnum4BXY
         IpxdUGzn3u6BkrJEsAs/nLJUOueGeMWgXxVepVRP9ikpmvem1e9geZuj0UgAr6oxcY19
         0ZhPZZLYSc4wBKRh/25Q4kq1VyaKBXGwJhxP5Jhf3W+MB1xjEq4KFkU5/D6LnrCW29Js
         wI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlio59C+pppf2ICkkx94GhNSW18qzZFOHub3pPhg++poQFwqqH+wkOq7H3cySAH2Va7FU0oYU7/G7Y8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJnGcunZQhDqHGjWbsgNXFTkPsjxoc2c9iKJxoKcUMSj3ENodK
	lAKUbdTQjcU3YkvYvGrEU+hQ9LaTK3JRryb819fTge+gP/SipOjTnbOgp8tEpfqw9D4=
X-Gm-Gg: ASbGnctSpVP/ck+RjInZ0qQ/HjdTGKonNvVCRVi/BVCdDZHwiciv8C0zMO8HZsuMjme
	QwFOTH7sOZPch5rcipeFnYLD/TwsJUNEk9v4/BFcCvCHsve0J1n3vHKlqiaEX0xaqLQkPY60R/t
	4fZBWx6LcjsfPcT6sFs9UlbtVvRo4gu5nXOmUXnhr+XDzovvlcWyCMur4zu/e6Q8nBYL7McEsCu
	YF8lx0JMQ0gjlLVNtQ20iduUKHudTCpvgvU6POyjVXnEsuPiA3H43H3yZl7GAoPMS+osuC+TH7Q
	hlshpO3/yfH89VeOtE9xKWKFYwGYCUHpV5faalpXjpw7UtPannrNfq73TrrrXChh0PNMesSlVUn
	T+37xeRkwheOQI0adOhmxDhZIhXVc8ecOZswtsU83b4Z6Qz9nx40=
X-Google-Smtp-Source: AGHT+IErpeCxY0vA8s7bj04XUohmgz5bxQxVpPcpqkeTx6y9x7HsqMPhnwXuNc3lGWZJbSGptpTQ1g==
X-Received: by 2002:a17:90b:1b41:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-33b513d08e3mr27952859a91.28.1760392598996;
        Mon, 13 Oct 2025 14:56:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:10 -0700
Subject: [PATCH v20 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-18-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225641_664773_8AF982F1 
X-CRM114-Status: GOOD (  10.84  )
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
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
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
