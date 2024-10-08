Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D64ACF042F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNXga4wIff13xPr+cfJQgp87WUF4kRgo84xBMMES5kE=; b=uE0d5sAbjfrA1i
	9jH98iLOveGJCL4wwDbutG9qtkOJmMzUWRAV5ChhLGhkvwkSUt5RymVBjEjh1RagesxVHWJvxmtvV
	J7/jk3gS3rZNzw7TnDSbZrC9zw3M2q2wZUXihFTbRinXHUGE7+MDkv+PD+a1qrpw7J7RJEjVLWuZG
	UwFSgEwdCiJ5D6WzCfus56tkBJt1ICbc2xU+hlplmQprgNlTMO1uOt0xOBb1RStsaDrit6RVbSovf
	8RiJk6YeRrPbzklxSQMHJCBwnfVjhozkyFwah4gJFxmbaTvGOsf6W8FoP8ltKnwXlqV2Du6mY1yVa
	vzABSkwqgC6cJnSmNYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtk-00000007SHs-22JC;
	Tue, 08 Oct 2024 23:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrD-00000007JHq-3ikR
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=; b=eArhQ7AnUh5rZnp/lIGWpX666c
	aPVoZdjgwalc5DUFQz4yZ6rnOcDw/SlkV32kZlCngcN4sh8JGfEu9+V4qug+HE7grWX+oP+yKtj/Y
	eYCSt4duzIvtFBhX+wyPf2Xo2eZdlmHezbvR9phrpjABwV4v/T25PDKftNd7/OMMmMBPNiB7BVKrL
	/yCvVK2iINak9sNayU0yr191Tz6azMyOEBFQLUJN7KFN49QjpjIqNCEfKsAvGe2bEtYYVLt5rsQlp
	XsdwPerwyT/ga61Tm2ZGu07Y9WLz92SRhpuS6+Sodex8sMkWs7rjbO2O+hncUlJOSlzCpUMPO1RA3
	QIMeZiZA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIr9-00000004hhn-4BWS
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e15fe56c9so881340b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427140; x=1729031940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=hpGjvbMoP6TirWmYwyVjWTEJfkUX0tToeruklPYXfL0MtH7EryFaK59lknSSfmc9vy
         YjbSuTNBTN0EDzC4ucfjU6SyXa5M1JwNKD+4uktFJZQaoiEk1axscUOnHfGCzfJwArOM
         0Ef8/XwAeAFD2Fu05tjIp7M/+ktxgZtDkZudA/zuAdf4FZke659v9ddTWPylGuUY/cj5
         Cti6Ave7Cj1YOEfUyfTqQqaevQf1MeGZGpkXxsWTyNEU3iFy9AW5DDzjS9tItFFbCP2U
         9+eZvmKFeC2Y3sPBTX3Gxq3SbPbbQAhqZqfpFJmIgZI4N0fVbDiWmLy2Kigw9sqpWwx0
         /79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427140; x=1729031940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=SQI5lz7OPWOovYsZgoUpLGkJoHCp035itkHYBQsidtzKsdgjszA1GfEpc+1+v7ApNw
         5NQrYv3aCA5YXz643XWfqHyyARUZSARJxvEkpmRqY67MjDk4FvW3kxLw6N3jjyuIQU/J
         dBj/s0rbfwPomf6U9qxt9or1ufDztJZrRE4XzS3+YNOmhYCv9njl9m1gSphlO40G1Yng
         zu95Gz7OpH0/pmhxM1c0pDt5AGBNXY6cvb1W8JYSXam8zmBrPRwBLdVUpiqsiGkt+IzE
         YZpPhQeKRjLHcownxpTE0uoaI6NQ9sUFE+1jzD0G6ghjduRwKkPKc+zltAyYJhxz5pUe
         iF1A==
X-Forwarded-Encrypted: i=1; AJvYcCW/Sim0ir2pylXQo69daI8EjIb8+S+8Iz65OsQedZRinC7gUSNAw9MFu8YMQK1kJpiRkQvBkXu1GTxtuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyi6wYGhhMkJEaaVMxVcDUcoNF1asZpLk89t9qYPyvEwXX6lOl
	pxmko0TAqBklhva+tLHInxvy1yOLlYv6lMDZ/bicgj4otJ/OhV6KB57nNFENpo8=
X-Google-Smtp-Source: AGHT+IHmwPn5jM9quB16FyWf+V+eEat1fojl2g1P7nEi3JtER4PWJx1A+GiQhOrwkldgMrai14wFrA==
X-Received: by 2002:a05:6a00:1495:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-71e1db7734amr622915b3a.12.1728427140255;
        Tue, 08 Oct 2024 15:39:00 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:59 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:08 -0700
Subject: [PATCH v6 26/33] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-26-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241008_233904_192948_0BEF1586 
X-CRM114-Status: GOOD (  10.36  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..d5c5dec9ae6c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..98f72ad7124f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
