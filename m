Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCDD2A520
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDFOHlkp/k9K/aCv69mxPODiHmBusWyuMSZGtTuDnXU=; b=4mtE20sG60XcTG
	UF3ONNytodag/WkRzwnu1CUtTa3O+4JZ+vQfaOijQH91JEWfM513JvHKZc3bjd2QTv6x0zI/8a/7N
	7lSXCYvs3n3F3PtwfksZBXTofNDf7cnpsG9ufK0fDG2aGJCACME/bZrU5p1IZ4cKstIJE5vWAH0lw
	lb687RsAUI1qSi72NmLOr3jfMODrarfQKh5N0sfateoRsmYVUVqal/GEpBXR47+xLXCqKwDtO4oKx
	aUBySQEzxYmasr+R5V5z1+x2im9357EBsb3GlWuEzZdTlb2dCowhhnPCsXm2cDkMd2aENmYazbzl6
	G2h3UdhaWN1C+gEfdeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZE-00000008Yw3-2EOJ;
	Thu, 04 Dec 2025 20:04:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZ9-00000008Ynp-36H9
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-bea8b4ba79bso1089082a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878679; x=1765483479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=LlhTqIt9PLBvKh7lLO4ayNl75zLOwJN/UbEAxZCpHoyxJ45POAf9X5XUo/o/i9YcIV
         cWEfr5YrbCGl9VTM80YmMch2yKsSB4+5jLkXNK747x9aFz0J9xwYChVel+DqCF0Kgf1h
         H/w4sKvROGkwPYOgL4XJmuNdkrCBZfZsJlDv9z0CDdwLvwSsZ6opPyZT58XsnBLaNF8t
         E9189bTnkwX8VRFIZPbGW2IeaN2rYBKty3yjD17IKGtlpIQGjq69gvX6JiMuv6+9FQGG
         n3dCZAsAZBvZDKtmWs4ZSRaDo81+uv7mvPsJQ58MJc1Dk1D2v1EBgqjWWip15yM8ih71
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878679; x=1765483479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=n3cDdgZZt3qahwH4rHgVhVmeztU/wN/tmY21GcqPACxMJMU0O0eJwPC+j+k2Eew9yW
         G6XrJHoyQ3Kut35gEjQySLayiC0SWc4Q/IVWdmKbe/EIO6Ju/SDTlhxE9QvF7JVMMU1T
         CpbjaQvgcUK2Bqb2/mV3COUnksBMivy0wiirhK8AObjHgfWbAZ3QcxF+8dtjTQGu0KN5
         plmMpyfVXJa5l5T/RfgwPn+PmWihsm5/8ilVs60DAjo+xQHgMuL98BiSuweyOXb1GSnw
         Upb7hC1mG5utnDyeP1ZnC5AixQcwCfT+TKGc1do6ZzPn6m2K/opaRe/q0OwQaFzMUKbA
         nwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO81w5j3tMwkbnFeJFxMYc90pbPjcOpZCsdOjlDk4Bib/wLOqM7GdAn3eoRbhvdu+BuNTS4SVkl1ogIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgD+V7pBhJLOH7TqJc3qj+TXJYlxSlrsYVfF6TK0eAxQrbqpoc
	J+LcvYj5AstVEqWymGz/s3nmo8yO2VrabNP+kJFBGFxD50JYbL5kE8wDLOa+NW3ExtE=
X-Gm-Gg: ASbGncso3iWsdVnqodDqsVB399EFy0wZbs9kTyR66P1zHPHWufHSoeM5kl5WYLxOPES
	w9LxXa+2Z97du9caEB2pd5My583nWyjdI/gQIaM36dJF7u/wQwIVC66Gig9mv9i3MgR0tO1McNP
	BOH9Lmd1VHfcoQixX+vr53b4skVsLSrRkCV39nZN4omy+9glb0XtHyzU6XLOlySql5+RCDPebuZ
	vwtvbz7Xz3tsSimOj8Mr/XTiI3PLW7EEJvo+9bbooAuL8BDyEC3XdX2aN7+WqL/8HcXH0UnhsS+
	U1zYv7mtlkOGiFDWGfHzfQjiAcR9cw0YhZ7AzW5IbvFcOAr8hMfGC8aMpnrWvmARZrqIRauMUhP
	syuGY7X3aAMT7zquGQZthQJrdZ8hz8y6R3TyuCIEqtYoZB5xd5kFYDDBxVnUCbo6rA5hPN/00Q4
	aUx3trelWojS65WuEm9PXe
X-Google-Smtp-Source: AGHT+IH8WfNOBR0WYTIAjC7h4KWRD4arxZjj56t6ot/oIQda4VPJ+vPnGe9pfxDTosFlvlQPrVkwhQ==
X-Received: by 2002:a05:7300:2d06:b0:2a4:4e38:9a39 with SMTP id 5a478bee46e88-2ab92e786eemr5009491eec.34.1764878678491;
        Thu, 04 Dec 2025 12:04:38 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:37 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:09 -0800
Subject: [PATCH v24 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-20-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=1494;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
 b=2TL36FQBTxYHJECnsPKiEOH953BZcSJpF1TPScxWirFZpsiwieknY9HPgz7ctQuE/tNNnQFHX
 qay7b5jPJ7wCN1QiFJshFM+JS1yjoWqf4sTvAxW/wwYUz2revUqCcLB
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120439_871171_88FDA3B4 
X-CRM114-Status: UNSURE (   9.79  )
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
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5d30a4fae37a..0efc9c7d1199 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 59)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 60)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 000f4451a9d8..d13d9d0d1669 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -114,6 +114,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
