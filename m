Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF03C0219E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74LSszYMAoAE1VDF1AyNhPd2u+JFsMbdW+6TQlA6WKw=; b=QclzMcfJITSgIW
	Z6ehjaFBhLZ89NsHddOfhj6tWcKkBgisr8vkuXkKs9jkSgR8llsNqQa0T07HZ55G2/HziOHZ7nAg1
	JeRhgyc1iPYvvM9stRqKuud+pmw+QUvBdoIUnvEU2Lp2LtPbkUthBbYCFrJ7jJ1r/iCBE3Xq/9KYh
	b289iSsCy+2kj4RpX4DpmneSSyEAhhhtcuRnRG/vwZktQfwyH2DkLoLxMyShpZw/0faUabPc1vqGv
	jcVB+xXZAIojeETBP7g8mqZ4e7TseiGsFEK8q5YaF3Xr79Ja8ojDqq7pf7urZAmnUWHN1/+IokS+q
	NIehBeAvQGjrcvVa1gOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC3-000000028ZM-2GBS;
	Wed, 05 Feb 2025 02:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7i-000000021j7-1H9B
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=; b=I7CFsZeJ/DPPmwXWHeFn3+9ie6
	4NFUHAJlo/VLX4RvTyRkt01QNkfwWiBoO3UceIB7lqX+Z3GPmw3gMS0owmgdFLnzmC2vwPJsY6p7/
	LI9DjP3IGDtN4ucB0o1JOk0EI15RqOPK3fg5MvppkRvDkEicxYC4Tgc7LIkcL9LHVWb5pKdnck0ov
	rVAVcV7vVYIYBy9qDh9AIISUK7XfKrtJaiIC9T2rkIvg5x4iUlC/XcZr2cFC32JIZGlYrTNkhQVOX
	7y6B+WFlEytINVy052XvjTJogvB8MTUkbH3cobLx/1q8axxYzCnIXyCuUCoOxpQoSZk8LmqZaHqgS
	kfE6UIUw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7Z-0000000GTtS-2xP2
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f0c4275a1so16428755ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718546; x=1739323346; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=Bm1CJUBp1Kpdapse109HIemvwzsOYl/fyCAOPeo22jsVqrsDCvmstu7rG5PTTaZfYK
         7+wgAz3FDrzUzQlTdGxUx5m5W/2blA25jTH1KYKc2eoMe2dfs2Tj95YNXk9T2W0OUUal
         q6IS338bVD1cik5k2fkMyBw1eJYasLwfoGM55rNMgpqz1u428fFBObbNi9SCfuW4czhG
         x1ie4oe1Z1quLu4fBVR7qjiGCpwWzw/1NjmEjryFjHjNxDIMdsw5+kK8V9RUJcvI4jZ8
         hDxd9EGiz/ytdo5WQDBHSqLJ6T8/eAXPFJ38IS07NjJ/KDlYVw4wZj8hG57J/7kIqfEN
         /WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718546; x=1739323346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=e1WVJMKN2HeVjyRyINe3Qp2Ml1JIZzymBGAQPtrArQawyLQSjwb5rFNR6RCoLHqegS
         NlUbGyTxE8+oID4ISDsY3yHvTsOfs9UQn19YW4TI2bkK2fpNjEMEminIYED/yoRn4h64
         wDQPxRe1o77MJr+taVjgm4Ng/7dZrhmRExS2eqlr15F3tXG76VwR/yhkzmAQZOl+4w32
         8ttkK4l52zIpzlAT6BSvbaExX1llQ9moMNdLivSvOy52ApwwWXGVXMRGkl7KwiRKF+/5
         3InlKTLBH3a5Yegha4dxCELJ9EM54q0vvqNV7XJN46eloD/7A8UkHnBoTPl16/xUcVOv
         V32w==
X-Forwarded-Encrypted: i=1; AJvYcCVS5HwEw5qs2MgHCK7fFQ00DI9L+rxngKa/3fyn6Cj+d12lVkgfkIGeqRkOqvOFUvTXFKWM11K41eCsxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcVM1tMDQvaRU5enfeZqKmOJtzwoM/vtJ0YRCyJLOc1HP1OXgZ
	MLaKfNYWmjYvIYjEFKQFsyvxtY4GnrrifVE92pCxXtgbGdhRnFP6svKMFqW6vsRwjPSi8eekRsX
	2
X-Gm-Gg: ASbGnctFPpvxuQ5GZ6H/5hFSt+eLnsizhh0Wr7Xnd+UVnyOuon3E3gk/ub2ZMI49H8C
	tMK21/e1radQWct8by66Or6PNABPdsoJFmo8pPt0Cs/vvJB62sklWt42FQxRXVhPAzdDU36cOtq
	AAHhAaVQCwB8jZf6lvUMVBNx17MaNhGIWaltmWqeKttLTHgSlPtFa6XodW77DLFrQGgrmhODhut
	EBl4X/C7PhoGfhev6u1oNC45KRMI0nApAG1zyfJw9qn/Jdivh00t+5vIpKt9tYBZP3gDTqOYPAH
	VUBRXdSv1jMXAyk4efTehRJb8w==
X-Google-Smtp-Source: AGHT+IGWWoW/7lRLh8J45NtMl4EugfElwrrMWaqnc/KSZ7FxaiKV7MT8r9isBGhbF0Mg00kAPNlQiw==
X-Received: by 2002:a05:6a20:ce45:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1ede8844f5emr1528777637.19.1738718546388;
        Tue, 04 Feb 2025 17:22:26 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:26 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:04 -0800
Subject: [PATCH v9 17/26] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-17-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012233_903094_9C94E785 
X-CRM114-Status: GOOD (  11.11  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
