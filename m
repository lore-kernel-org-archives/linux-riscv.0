Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08891CCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ+BGs/+4e2SC50tSpv4g+B/QWuETIFwV9HgWNB4lCg=; b=n/URZffh+SfJms
	xCuo/aHw2rjk1om6zUypZ/juiyahB3PfuFkln6Bgkuk5Ss+Dob8qPvjJkaKIA8KFjwqgSHUX4YxaD
	ZeL0vDSmT/kakyyiIt3LdwDShyIW72V8FRk312TpAP/+e1Tr0GEip7U45KQMOs2UNISwiD3c5KCmk
	15zmFaMtvzfON4MmAZ14E1orPtj+TxOsb0fgPGlAaWYyYaTanjN+YBDHYPOAf7o1rTxPlh09RpQW0
	3KXFZRbhtqZh5+yzLbQqXWwQvn7059DR/Cu4cT9m4c3erM4DIwxRlhJOOIjABs6BYRsjCPH3/3WSU
	qfjh2Tv3AneTJGCBCZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961F-00000002XqJ-09rj;
	Wed, 15 Oct 2025 18:14:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961D-00000002XmM-0t49
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=; b=n61Kx2rRzqlVbDZN7kPooWOdRz
	tgenmctnpDpSd1M9FQz9A8fw+ODpBgichpGSW7lBESdRY2enaG7YaZYjoet89M0BWcTdnKv7La7sv
	CrrwvNhcFGV91ySbvcjVFvcXks2XWQnaSEmmMOfNOur6Jg362g0pgl7ftQxTN5G1yiocewYL0PzZR
	KyPgevaELEjdA60mz/izdIKL7ZINNt6juOG9Lh9jp7P6akzGrDCteR6bWs+DCeslQ5sqqyUFtaTv7
	rSYv0anvjJ5WTFKd0hcSmE+N8ZLUJOsNQHBdwPUZ48XAI5YGtrakZbTwaQrta+NkTPlTS/F+V/FsD
	tv19u2XA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9618-00000003jDi-3pg5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-26c209802c0so69189075ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552069; x=1761156869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=;
        b=MfCf1ScQVUyzd0QcL1OIzFU15rfJZmLNnUTX2LQMotZ/xSFL31fBtQbpLCccWSA8y3
         2+L3TLJ+CetSllGBKf7z0Ji780gvnAxPNLSnd24sTKOvgsrB1mkhQIuiAnqNYfTtrEW+
         4NoeF/CUGDBLZ2wyTSQ5ykLoxzU+qyVZ/I/wFMGpnt9PSIQVj+El+mX9rZHQdEYOvXcL
         BXOQ/fUWTnACQ/KncVpM6IbDSJ2YQp4iB6F7WHIzl8hrouxBJLWea6gjYgn4bV1LLRvn
         py/TtXK8CHstHgiFUODT2qxjY5tOsx1NGGioHZwfSY1Ixl0Yk8vRzbDAuTa4Axymtocp
         wQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552069; x=1761156869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=;
        b=be8639IAZt0ADH+Sh83q/HJM0tcalyYI7V7U8wWOfN94cdI02bpGT/PffBH2hObzT9
         2kZ2NW+Twwc79R8PbZOtlccgwTFe3uw7RN32/3BamHGWtDYVsPDnrHJunwMZ+D7JIEMa
         M/Zf93M4c7cRgOqkVeAu2nmy8gtHdXOa/2A8k8sBzw8T3c4zaLILn1K4J/LAQQVIppPM
         KGCtNboUF3I0s+u1mk0/cMyiwyY5FRFLe/Q4eoMit6VRHa76N/HTvbxxqUarKAoVGGVk
         4lP49OF6UfbQ6yiUZ6sWaKgHPsKy5+UUN8lLBFLcvo4SEngesvLzOsyCL5ZO/ASjFP6U
         45MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZdh+qb1kB5tg24nb7ue+eoAxxpMWGzc9q3pPkUoyDlbOUjKYGLGgyb+4PnAnMOKOCLLvWhoZVMefpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6aZphCKc09qr4pPS3KKW+A6YAT8XqEqd54eurzvvrVBY9ak4E
	pViJbEAT2XeiEsTIWBQsi0GfE3P4GTXKU+Y2tud8b7wF3t8GYO2pI91RD2qHTaCanoI=
X-Gm-Gg: ASbGncvLVBtxomtiSSlXZevUokVPNbLNq2+Y8CF3Vs8/m2Ta832DsPAVdRClJPpc3Pc
	wpJnttCWXNNm11XFLiTmsSc786RufseMiqQtR6A0zl1dstKoJh+yO6yeAxXigeXFgCAhqnwjpuS
	cJRBJohjrvz1tDj8wZ9OxL6t1Voi9/XRaE6FnpzJGmvfWSK7LuvOwJBIDqIxzqW5wloVk1UTISP
	J4e90tfkKlSFInHPcgCBHhBRf+O3Qy2LNId86q4WY/OA8O3YdiZRi1grTIfHRGF8fYjzi9WcajL
	OQ2Z8xExK+TOA1awHCiFN15rLN8soMAf9VTRU4x0VhPCHwq25iuwEzXrAfyzluXIDMz7RhdTpPM
	bMAyqeieHwKoZxikCZ/FgO/BDtY403pfZqzWM+Rw8WpLHrkNflnY=
X-Google-Smtp-Source: AGHT+IHEXT5xfzaQ9E7GA47DV8y7VdpAtjfIT1LAxVPzv4De3A/Ut9fEGvcfd0ReXWhAXtZ/RL7Blw==
X-Received: by 2002:a17:903:2acb:b0:268:1034:ac8b with SMTP id d9443c01a7336-2902739ad00mr410312175ad.26.1760552069224;
        Wed, 15 Oct 2025 11:14:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:52 -0700
Subject: [PATCH v21 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-20-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_191432_235966_8ECB7AEF 
X-CRM114-Status: GOOD (  10.82  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
