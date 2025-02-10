Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA6C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74LSszYMAoAE1VDF1AyNhPd2u+JFsMbdW+6TQlA6WKw=; b=Rio/rwCXPsJJ6b
	c/kNaAfKq2EWLRfFCyEWA7i6pt1zivTJ3WMR/8SaKbyZgTVc1KVaRIxRPBdKrl/w8zcQhcx0gq97q
	ey60BGXLtgPgx9IeBNwFFimVVb8ftdf8lnqlK+YMR4GDNu56RQufsvw7EeOYLaYsDkL8wHhCN0plY
	6BYaiT33itykqpzg9LpuYgeh1MmGPPhRAKxF+sScyWf9PLTijGXMfaA49OdDI6Ihvtk3Uq4Mybdhx
	8Uw/4VLA3RW64bDy4HXlbkF9+Ce7t0Bw2Ng6NFQcskxrt/8mAnUcyDgE8dhwK8I0+HTUwCOvgjqqx
	6ZfeXk/IqwbspqNRbqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNO-00000001KTb-40AO;
	Mon, 10 Feb 2025 20:27:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNN-00000001KRg-41la
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=; b=DKBEPpLac77E4UwgKgC8MwyCsQ
	r+9K4ELAHsHkqXc5IYn9ChrrrhKDOnneqYtugh2WJ+mhOZu6PXi67zf+L5pbWrq6IN7cUGmsgBm0T
	UshIKWutkIQj01OHZpOjuzAqHfT0hDex0X+vAD5Piz4EANPLSiXXOQnXnBu0TIgtXPEC6Aqhz4oaQ
	t26lIc5vE5uwCm2nuFjjplIV+gIqRAVyQ4BukdWumtqJwydGJ8fN7kxzBF2o7RQu5CiGwEX3h2fts
	GhkHilg4QIaX2iCSlaf6NLQu7PXtDB1lCYAJEhlqV0hxUswqnHF9rBGo38WrIyDoNDNPZgACXH1cB
	jWFcR+Ww==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNK-00000000Djn-4Acp
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f4af4f9ddso54447995ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219244; x=1739824044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=Xy2jRUHrglHotL7PU4h5M5BiACY52IisHZTXH1C47X2oTJHTH5svvABT8FaS//hptv
         z/QFCsUMY6BXCzCbnfH0fbnaQSaBaVebm3Gbj5vXg+l2Jv6RIyJ+PPFRIdcKjIvNDmtW
         1ibSToXh8Huw0e1JS/pGpZZhjLfUEMuVWUDnH5uu/aQ/YJ7NfKZHF3P/FoonXQlFffZ+
         6A7+8TLOKwtmznCQGgHf2kWuftAf/lQhOWl+QqLRzfzJNLz7aUHnt9YrqB7OQpf5ZUj2
         hshKbyXNd9P+lxdpoTnBqNe3AGhhOOXIsFO9LTuLeTdQXRZBOWrarmU8QhK7da6cBULN
         E7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219244; x=1739824044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=c2ayXlww9tvEOLvXSKQQMX/dt32YytQ3/r9Avgrl6yLegqe1e9sZ1IkcGYuxotN9UQ
         MFD3A8nAstP0mKQFC65pq6PljutdZCxeuVrHxOprk1/AYECuk1NMokp+dj9+0LOXmjck
         P26KQ5mPm0p5X2s9dNl9XNTi9kYlrTC8Ev7+niHxi/Ybux/y5cdYe73Eq+v9rNpnRf27
         014iJuFnJ8nDkHWoXuyfEoXiTU1GWvf7rtv1TC78x6lCwsWnqRq0dL1x/vx+TiDIa8Vw
         DzfHeSy8HRBelVdPkJkkYXcF1RGCSvX18m1t5nujrgvMsKgKhdqMeNP5oN6oo+Q+IdRK
         FWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAlE5gI6xA1g7SCUtgQ6fnco/6xF8lYJ4Q5NV0Py2N1+NfrmkWtMO1OovZB8Y0S7dC8ZIzdcYPkRT2Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH2dJTw0kBy5cGQa1AwcKND5qkJCyvN7JYMTp5aDuhWF7XTCji
	zqLmxBwez9M0jPE8gKMYZi79K2W4XwcNZDQ8Q41umrEIIExBMcAzvCYTMxeiZQY=
X-Gm-Gg: ASbGncsuhevooFoKu8hZD23YcOUOAvr9vNm21kghh95la45c+nWqBLd4INWUstRMHik
	BCYAcNp97z/SBzQP+YP/OHxRAgpjvAmma9oIioP/17p4o7CJ8GHpE+6nUjeXpoU+1jMy7TAmu3t
	oxh1D0bo0oT+9UZaT+Getj3ZFUcx0RMUJL3zwPbWtkHskv6X2f70Ixm17uyZBahW88a1Qx5wHi5
	w4Glq6iJfKvigrhC0Kx54Zj4WWgyRICiEY5Trjt9WS6KcLJf6+CsZJYVBCDdYJ7B4PkfjW1aBP4
	j25/wGAcVYDUMHHc12W1ksAwSg==
X-Google-Smtp-Source: AGHT+IEWx6Qroyd+owNLnhKMgXzpvCrfsJ5gLeMKvyo/Cha3hnXDj8amjvFC6tZrBWudZswu2pIc0A==
X-Received: by 2002:a17:90b:2317:b0:2ee:94d1:7a9d with SMTP id 98e67ed59e1d1-2fa243eb4e7mr19748747a91.32.1739219244559;
        Mon, 10 Feb 2025 12:27:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:24 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:50 -0800
Subject: [PATCH v10 17/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-17-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_202727_164920_1DE50D0D 
X-CRM114-Status: GOOD (  11.06  )
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
