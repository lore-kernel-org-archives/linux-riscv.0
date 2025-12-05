Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7287BD339B4
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDFOHlkp/k9K/aCv69mxPODiHmBusWyuMSZGtTuDnXU=; b=GHgOHLkn/L0dt7
	mwDfP6b/Q4Jis4gIHlfAkM8dry9ETwZ2BV+uTJMu5qB1SbItnhtdsNgfMA++PlwbicWXg1QxflmV4
	EJXIzTipUWlEFzinajLNwBCiy2Xamn0XiyK0sDc90uxwhODmPzzzwDiMhm8YQ3oYsrqkFUCHj+l+G
	FRaNNx7oJcQ/IFcBu/JBjsEsiLGL5ReLJNIT0pspLYaKkrHghw3lFNLWQCkjAXDebYLrMmaLsQqaO
	hNB00MVInN8mCQZmRyju2h5EXJHBvtIzsED0fd/mFMvpxBNVVjRnNyXpC/HNJ8X2BF7jNRnENY0Mk
	vJWe8WTbK4lzYozA7FTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagQ-00000009plU-0M2A;
	Fri, 05 Dec 2025 18:37:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagL-00000009per-3kLB
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:31 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso1724960a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959849; x=1765564649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=DP1qjgZzl8J7QBM8+/RwC1yJ2CMIiSoneWurPsB+DxXtHVajUdKnarPSoJea+2hEKj
         8O4dj7UixMC5euTmwHrl0D1jrSYryUyXjs+W7d7sWTuvRFEpPFPeMEKzl/1OD0MxYOeY
         FPVvfCTx6hCKYAex5BYUko3KEHJZFx7r1cHd4Ih9ZlTzbMGjBCJdyISY8BO33Atpzw8o
         Pqir0F4IDMVH+Y1WZOn079cevYeiQRwv41J0b4GHHRDGWW+bLWDXZFQ18mGxAvhfm/5t
         gX+r/OZwLU85VwhaG3iwfa6KuDsK/M4ptiR18iaoIXkwQANh/ZzlOLpDKnxnPO3Urrfh
         BW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959849; x=1765564649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=gXdX7dJFAjkA4IiDDAgUOtPGyhdyu+CpznFZ6J4OFa/0oxy76MGk2KfrsECUPPkdQt
         9pM9BEDsYGC71HMIK5j+AXqdVUH9mT56orwCUDKZmtUdqVna0ZimTSjNP0KHROont/10
         6X22DmITq7Wmg26YLFa3QSibDSWXyoVDHuUaARa5HqPQ5+BMw+zjEZWxeGVj3a8N0qrY
         T4iOVpPS7h5VK+ltWowH3WcEU3r2U9XWXfvC6S9ri/TIOZHGtOK1Ry0mijpubdQgeGwh
         QPBqPsn3yfT/0G+uTPW8shZyq4nlvFzwoB9hY1jGG6BVh+fE1R0EULf6Bv1qqipe+Vyb
         MnCg==
X-Forwarded-Encrypted: i=1; AJvYcCXkb3GmetOQCtuMI5HAUojAMqf4dPhIacPFstUtLl2CT/XnkJhu44OG9R41/laVvGxmNOv3jasCdRk5cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YygfqnzgvgykSvSH2GUCjAlTXrmQ8UTi+M9w7EarFcH8eB48jHD
	mETou35EXApjYjhNWDqctXtNJIWHrKMrl/gGOlWPXk5AWooHCBFlqRhDc3DJXIMJx14=
X-Gm-Gg: ASbGncu9noqc49hxDvvyZBFIp4Pu9veKjJQgT8c/nr68hMEm5vsLU2l9QXouRiVZMab
	JrgSqq8NovN3HfO4GzMXDKCQps4BtZsNrPH+CzX+BBnqHvQHNqi3/Ha96bZxOzHXMV5AvTY3de+
	5FtgXXDl2KaKOGATaYjBKvUmX3uWulja4EMRkZg+w/n7xN1lyVeeZWUMuwkICB8f6npcJy0Gd9y
	6r/LyIBX+pOBIXwyqMoGuySVXwSyIX1pzKxSA457Ru8OBZGmnasAT2abuTaKtb8B0PryVtFxlkk
	cbxnaF+VaIydRnvwC3oLVHH/LJjXO2Yfm2WMgcS0v/G9BgcgeQkWWDZWkYwmL73XN/srOp3cWmt
	OzYqxrgnlbjnhVQln1BJDi/AH0NZ8TVpaIMxOmWgKponqlfn/1cFPSA1MlN2PFpLtVPv0WzuEWG
	VcOZ5oXVsjDEi90ls48b/E
X-Google-Smtp-Source: AGHT+IE2xGqf6PsGRkrxaqECp1R5gZSEA6uoyMXhatYShxnn+tFhMQT5orx1xHyQl0N4uRXeo3OQqg==
X-Received: by 2002:a05:7301:f07:b0:2a4:3592:c60c with SMTP id 5a478bee46e88-2abc71e17e9mr78847eec.29.1764959848864;
        Fri, 05 Dec 2025 10:37:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:28 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:06 -0800
Subject: [PATCH v25 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-20-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1494;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
 b=h5kVDkaUUUs99aJk0qS23WgDcswkl3+9vDfiJ5qfqx4Kce4+ENPu1q1DoLCHOQG7/oTl1GxgM
 WtrUtrWksYgCk00mzDTDyGq09yoemSOOYeLn27NuQe2huLJS2GIT4Gi
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103730_005249_E725A070 
X-CRM114-Status: UNSURE (   9.34  )
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
