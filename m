Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D5C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuNnn2Edt64zxLl3a9dOVVny7HRGeEGtTuaTmk7M3gY=; b=w0hOgIaTgxrgb/
	CdZV3oOABAJqY/NXThCNkGg3TuooULhJ/8H60R4JydnoTL4Nkk+lcBNi3e0VoLDrUXTemGqr+GFSZ
	GFttdR3CknZ0YSStE9m9j9mS9MX0ffxAICFV2Rck1VCLVbXNNzJ8JQ4O4iQ3jjGGtMC0onDAxMg2W
	3JjwuFO4Pk6qnMpZapmfoqk20/V1sDdGIx0LvN34Ub+dk+W0iWtoslsoS52suPQZxNQ/+E4YCHzpD
	tkJFDdD+08Yxm8/Xf/zHEQH7ya1R6VHCUNPAdjuRKvaVkKTcppZibWtfhYa7/MwrkkUHo+uNhYN0j
	VDpKLHEJWw0NPAzZvD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDrz-0000000FSuF-2JOf;
	Fri, 14 Mar 2025 22:51:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClb-0000000FLIf-0zUg
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vuh2Ubzjjn4sOmi3QJw6bgfZV88K7WLhUaWOfvtqDdM=; b=GdAcY4jjiBeW071SMQ1YXJ4KRq
	ZmlzfYWrCWciel5YS3kFDGQ4o628bzPoD/6K6SGtJYIpO1we+rWE9jeRTe8M8nSaD1lMIdVwlnG7Z
	xBLNEkwBFAWprS5QLQscwtElItq5jTY82MD+OU4ZB/9QWersyW8dDKTkuDwoNcznLm27ulTB3jp0X
	YbavM6e+l5BmZuMW98e5diaQVWixAKUoHhIVQHccuBMeN44PGUofdjDUk48sYeLU3bNOOoruOif6l
	ZS1l++XmkcQWx923zNsl+b76zG9g3j3ttEuMwX2+bsFZHc12vjR5aLwpz6ZxCrCOiN8KEIxxXmyPI
	OPbF/BbA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClT-00000002xCS-2Kl5
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22359001f1aso66247905ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988420; x=1742593220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vuh2Ubzjjn4sOmi3QJw6bgfZV88K7WLhUaWOfvtqDdM=;
        b=ZTRlBUfWMJR+J1zEA1KKKMInKwxkHC0UItXjrhWDK9j/2wNOZQQZwNk500KOdONy/g
         43aDx0GRY+h1n1/zm+xPbSBZU7LXdlVQ9NqssqJZ9rqRzVfnaZnC54hCXALWdQ892nta
         z6stFb+tI/fkFGqdOJ1SNiCj5521GXiJ5mpvTgebhbOl292CeNMx1EPgTR+GX53oKdHC
         pwqNgxiWkj4LBQQ9RWTSwz+c3axXEKmfMtciFdakLe1UUtiX3vYifrzEzpdFD7fNnG30
         azWq+Mvp2GkQFe5TDAv9hnQGrUcOwfl10PFPQhQMHvZ2qSMO+kiD3tk7njtlsdWSuwrB
         BGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988420; x=1742593220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vuh2Ubzjjn4sOmi3QJw6bgfZV88K7WLhUaWOfvtqDdM=;
        b=ukm+GMhkXit6mvh1vZ21nIe/gZtWMk7vul+nlOluZ1jN13OocGOPyj6lR/d67QSGn+
         Mbxa5NEJ3rmg+G1IWqOoY4P+77VrCCb/PaG42pjTbr15y8O/ws3BjyS97TUdlKhyDd1X
         Jzo2u4/7HCWOTPvG+4c5saeYBsTL0Q+2xr41Rg/2gb5HZufGjLtMzFwz2Ujaa/CdaNnu
         Q+gbcw0HOCYkh6lNQfclKCwF1xcc1E0CHgkcXsZHsz8zhqntX9bR1HlGGHO+hM6YP5dt
         aWOveZ78It1b5vgcoThXQuoU9PYiS8Ng3Zs7qCYNX06B8DHUOLxkXP8Ihy85wm0R6EnM
         Sd+A==
X-Forwarded-Encrypted: i=1; AJvYcCVnhCYatbVWO1KT2O82OIeDzBwQTs39ApKuNSy7kUfWv3yEZ+8kmBSU2yHK0OV4plggNdJeREQrps5taw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySjfu/O6rWarxRCi7SB9xrgSDpD2qPywFYiyvZsvW9aTbkiX16
	XPZ57zbrNEDFwvgwO50P2CsFkgQBDO5+hSxGtRlRDJ7ozApJ0aMMY528AugOKe8=
X-Gm-Gg: ASbGnctOauXJ52fhKd/wVbbeJzIH22HsmLpn0M+KnCR/WfPC2RxrB9S47PuBcfoQHso
	3vPk7JU4eoil53NCne7EOIw+GtyV0yfLsNLUiuZU5ZFIdkb/8ib4ufWCRnNMAKUv/2DsIyKjAVE
	cZ+KCtZnGTnmAhPTck/kVxnyA4ZHINsY3GvupX5MYck7ADWjOEP1qaY9oUd+ZOMCXGC0V433nV8
	8OjvN6UtcO/2+VHdLJpw5Glftek8NJhwgU8aPgG6Wqojm9A3x8zysyOzMhHtsuMH19rM+bvm9Un
	+XnFipxzH06YbOocC75GoHghwjKXX0kHrHxcvKFFMTK/0z7TXLGAeYg=
X-Google-Smtp-Source: AGHT+IFEy8ShegH7q+9OBJ6uPIx07DqrMw8WFpOVCCYLkkSk1e6aSP/3QYX2LQ2zeOkBSAdDiCkRtw==
X-Received: by 2002:a17:902:d50e:b0:215:94eb:adb6 with SMTP id d9443c01a7336-225e0aee9bbmr48850065ad.40.1741988419768;
        Fri, 14 Mar 2025 14:40:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:39 -0700
Subject: [PATCH v12 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-20-e51202b53138@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214024_819900_CFCD1BAB 
X-CRM114-Status: UNSURE (   9.10  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
