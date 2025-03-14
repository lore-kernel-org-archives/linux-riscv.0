Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6FC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74LSszYMAoAE1VDF1AyNhPd2u+JFsMbdW+6TQlA6WKw=; b=RRh/9jkSnw5UWu
	gTxAmaGaSm9IeXjRJkzl0HdEbzlT7Hnmek7U59sU9WJCRUNEwRiC9XE/L2oJmqQ4qk5DGqhz92e71
	T8kR63ilIGuh9I3uN9GtovOmH8hU/ERmrZueVgo9vmpyqHQoCYBUAxNRcO0vMZKZX6reDfyxPqb0N
	3mP4vp41wWfNfDEu9BdyeQp7kYax/FkZCCK3XQB1m83Nm8jc2lfrBAEEDT+VvjoQ7+0L4waT9BJBa
	uTFJ8Hnm2/O8b1xy0s9G+QwBcdYrozgmcKJAnrrJNioPHDF4GwnKdRpEqP0l9DldZGW9rM2fb2lTS
	qPTNQt1AgivL97gHyqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCsF-0000000FNKd-1kJv;
	Fri, 14 Mar 2025 21:47:23 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCsD-0000000FNJZ-1kzz
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:47:22 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso37719586d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988840; x=1742593640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=QQVM3S+AWx7iJPkj2IhmBWsSIwZAOOzeN1SvTnXJjnquD8vXEbQkKxQOJRV+XveIje
         huXo5uuUorZ8fhRrD6sjsJumHIK7eYwTcUcaC3ugFnLjRnLZTqN+cFZNWZQ3v2OCqjQP
         IqUlGwNgmqOakV+1vMJrh17FVQwEQycOnkmqesGdWekb+zyFuWFRCp6l6OdkhSFO2CBD
         kw2GqoQuTHfbqTiCmvg8U3MZW0ZeagKF3CKfZvRODQWNDdkfP/lOudy8Au87oJdif11X
         XFLBaSOEdyTT35ziq1/AY6Ma4nf18RAjqiyxbCvqJ4URETZjMvGROOaVJN3oC3CSX03G
         4L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988840; x=1742593640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=qxmt/rs6XUZE3u3fiInZ+cjob4f4wvfouXdWyxhO7kElez2rHTOfpcwuji+4ioSPyH
         AcZ/AvnCLV2BbjWQfyvCs1Zsk5Njd7WI0dVMCDRrFTTHKbxoBZkoWCx4yeKKEYTSm34Z
         YWSZHHvQFIPassuzEJePFWb8/aL6PZdCRa1fdCCVHFa4f2Xkcksj+ZrteI932dt8I5Lk
         Gv88vdxU1SOw8sO6AbgYBn5YfEjVVPUHbYAS2f4SJzgR+FmT/NjURW2+NoMJ7rvFS8ms
         1+mm/cjCZ09lC2qpMh8B8zvuoWnMof8RaY0rTNZNfqWLIMh2VVFkLY/2Jr7XuOBAcTwi
         KILg==
X-Forwarded-Encrypted: i=1; AJvYcCWLQGgIkreEAB+nVhRulIDQGytW2OZ+3KpYVolr3h58bldaVEKBMys/ii8bhuJHtve+De0U0uQIYdrp2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwVIc2z/dh3n2EhWH29ZmDunfAlT2sfXgHljHiT1b62VYjzAoe
	5dA1HHqixqHsH665j/qQiVvjQEfr1TedGra6bIxz9oXMTWRGKTrXzi+TICk3ks73qPt/MgVijKK
	d
X-Gm-Gg: ASbGncsRNtDNrBtjQeqQkrnO9qD0gLkE5wgi7W4CksihR0iLiTJswsVDJ/NgM+yGtYi
	ro3aIssR3y+Kt+mEZj7SEc7uzyTvKPvxpMjGJhMw9q+ncVNL3XExL9B8DQGmJd23brS7DPAISjd
	ChrrHwu+UyIrJken/bdFl0ycbDrVvDV9M/+YiiyjRAPr0pxolIYvWP5dxyaeETqAZUO5Wkc/QH8
	bcC6vDc36fEZc4QYWiCJxiRZ46VMMN4PVmevBueKwKfVsVCq9m7P2Ee76BNjG8YxakW6B3/2OCD
	H5y4yvtrisu8i2214bGETGBNp5aZhJzxR3dG4zDTBsGJZxqkGIc3NXg=
X-Google-Smtp-Source: AGHT+IFf7KDxEVU9NtNTwXHHWwqDPalXGdl70DI+8CNTgQz9PWl/u1/S9R+7SGLAPbVztXvT9lTY2A==
X-Received: by 2002:a17:903:18f:b0:21f:768:cced with SMTP id d9443c01a7336-225e0a1644emr36247295ad.8.1741988414327;
        Fri, 14 Mar 2025 14:40:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:14 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:37 -0700
Subject: [PATCH v12 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-18-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_144721_449907_696EF821 
X-CRM114-Status: GOOD (  10.64  )
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
