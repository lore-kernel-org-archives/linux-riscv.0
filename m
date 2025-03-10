Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F03C35FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74LSszYMAoAE1VDF1AyNhPd2u+JFsMbdW+6TQlA6WKw=; b=MU4aOqdhWCFlmp
	Tq+R5jnVmtFp/cfxPjARyKLpGvt30w/TM2fvS//jXouqp7NcXcShjOSq87M9ZkzGFTBhd096pBBJ2
	+gwLcLRVweKHK7uRYJFbz7FDH0+OBuhs15eQZ/hMMbmDbFd7mSAhPH2v4eApCWvvvQevB53orNcVu
	LfBkByBiDtGSZkPR1BhMNfDsZvZvH8SKMYFxEm0rFq7wilSvminazFwkV6NhlLmMEiRCneoE8DObk
	iQPd/zhbiw5+IVT3Lm7eV0wwhmUiG5valX5eXeESWlSY+cCbYA1WDx81SQqBSZyOWPVNNlbpqS0nW
	jycljEWGdkjtL7KWz6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfH8-00000003DhJ-1CBN;
	Mon, 10 Mar 2025 15:42:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVG-000000031nv-3WR8
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223959039f4so85816355ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618394; x=1742223194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=VqBQ/V65oklKFtsTGmv3g39kBPbW45FxSpy4akXDo1XjRLDQvTA36XtDTh/UQZeHv/
         pE9H/qAfzw/S2pxarLpizJ/eGP08PplD3QAvXwl4aPuMc6GJyTRckMa9g3sJ/CLf2kHH
         3ITqxiX0eg5cBmxzf0chiKvyrEY3jil6W8NZqE/gSES4YW7+T8KYRUPP7IMuNWj/TtYZ
         rX3BQlEbC5y48tjbrcQ/cRhwBjnqQHnVYgxHwEDfrLHOKeijbI4Y+WWu6Xyjiso+uzyI
         ec4gN0hjT+tWQ6xue3r6ywPbzAyp7LXFipKph5ThSU9DJb8GIpaEZiEmx99uVgK3t6WU
         bJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618394; x=1742223194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=AFRcUQTOfhsuISnWc9ap8hjJJvGic6y35eeXJ/JURyqYuAQpv8+8TAumaSmhH+lv+s
         aMpNczWUJm41CXAcgPGb6RA9PehFnleozwtzSA79Ej/6R6vH+arRMyOn7N4h8pS5ffvg
         Hiq+aZRfR1X5VCoZn2Vvl72N2+HhJvKnC4uEuVRMq9Su5guJMclPBhvHuNoXeSrTqmzb
         TMyKWiNB3Qp4nfC1hYis/gBg9QjRgBzjIkesCWUTSMSCbVDFiS4Bn4LmjtoL1uSmIzPc
         umXYaLHvhDas8N1Puj29Gfp0IBGGZBmC4DPCz79Q84QPcU/0+UeVjZdZkYx0bo+zKTtI
         baZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMfJ8AuPhcGenql5dsElGIcs1hU/HzSNImk+h2iqBulmI02Pu75/9p2s9X/CB1jqvOxrhmCykRoQ4anQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvd2CpzrCqhhLRPtT/Icn9ow5Iv/OVquxsSub9cwtFcY9bRfxP
	2uLVJsa3i9FCT08uY0/bBJS+6izcGU8AaVAAcV9xZ+8VcLw6py7XIYgXpguFbHQ=
X-Gm-Gg: ASbGnctyipkGQrEKk7V1NLkEBNg0iOOM6R3wSiYcz3TrITb1kEYvvtd4ZhwCHwW+V6i
	DTc6l/cFHjvN5gWJu/7dtz9EyI9zkpRgf816uQ+ilWHOoftFDmYuZqf/+inBMnnuP2wiR1Sibfr
	Bo6VbEpjHs9yiD2yOpJ/Z/ctP9iYUM3J31Gsj7kavMOY3OQo0ycKWNSwg87y2Xy12qMI+G1w+Ah
	QiQXsFVPIo9zfvqHwnNWsN8i0BOez8prOlVr+pzoiK49f/mRIZH317Mx+6lg46iWFrkjtsl8MQ6
	4vNlZakBdATgkaojlH0EY5CYxw7gxQ2acvUaD0Y5W43d09so6UTwVTs=
X-Google-Smtp-Source: AGHT+IG6aOZPbFLpYB6hUt/uNP0xUDOJ3SJhAN3Hb+FAwmeol3/+ZPXWsjDkyF4qiBV6yJ/cwzujRQ==
X-Received: by 2002:a17:902:ec89:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22428bd5852mr262786715ad.41.1741618394280;
        Mon, 10 Mar 2025 07:53:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:39 -0700
Subject: [PATCH v11 17/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-17-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_075314_874994_52760248 
X-CRM114-Status: GOOD (  11.31  )
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
