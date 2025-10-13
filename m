Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23CCCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ+BGs/+4e2SC50tSpv4g+B/QWuETIFwV9HgWNB4lCg=; b=tCl7Kz7Kb/Qto3
	p7fstojHliPzhFozeNB0/bOWW+QQrUTbeNJJYofuQ2+GV+DivHNlOWDlokgNKPOznHE/Jwr1PoULM
	FeO1K8GTTvaGxIwO+nBicgUjt5ukuceUN/uEzzMCUwclQ6fuufBtjiP9JLPMxme/x3SHGDTdJdDQY
	YobkUKQpf2/BAqmtfxDUUUyIxziHQOvSkRcWAXBBEukkTJjL/rVBDuh0gJLxPAVKEcoQcukeZ4zGB
	r7/zuoPLAVLi1mE4q68H0LfXvSkhsvKGXaWKm+N3eLZ/o4kS9PZQ6RTvDEaP34teMapIQZVN65ByB
	jal9RWzJges0QO2E0avA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QXD-0000000Ebg9-1G3F;
	Mon, 13 Oct 2025 21:56:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QXB-0000000Ebaw-2xwe
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 21:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=; b=EmN2aeJOWZUPTIMuLhiz9vFhB5
	HYLVHaIilsLHIlEpvZsSgZ1w5UDJv4tVsTweo2FGXf37S7KccUmxOAqOUkfn2lxp8kgu9njyc3JjT
	y8FuL/82rcUl8Au1ubqXi21hGpRHowZnp8/VcgG3loksuiZORV3tnazWbrkK+gynVv9DshblPJf4i
	XrEWAAZ+BMRJJe6c5B52+Jelawk93+SnOwoJzYAba/ELp7t/xiOklogaDLywvMPk9Y+11kA9apM2T
	3MVEJR0Hv/78CHzl4xSCZnsGZrP/h0v65pF3WgrrXY856arQYdleMBFV9apuXXzI0Vuyf5r66ylts
	X48NjwQQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QX7-00000004f3G-0ESI
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso4215813a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392603; x=1760997403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=;
        b=UtTvi8mUkWk4GD3kd7PjDJeCDzj2r5B5PMytNH362hkQtor2KdrhOppV/qmXnsp6a+
         nwcbVf7sBXOjJ3KGwhn6NrVg6+Y6DSTyqKd4NznVtSuHKqI8vMZPtAZpSeLxozLAkzEL
         0ovlCyR486j/+wh6hTFvmdBSirphvEDa/eVPqhU2th4sxbQ1SCyl3LznXN1DkVbOGxCT
         WhUsMhSRuj6lD/d1URhUYBpOV2x8LuNLCq50HFYaPHbI3N8YY/yQbabW4RsC7GXAX54g
         mlyVVN5eMYrXXYkJPHniUwtVhO9/PsK52VoKrTi7Dt2K1FGyZs+4aaVtz7GCHHxSKqRM
         8oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392603; x=1760997403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlTCabZFxINt6Lm9QbVDHZ4MzlWsICTGzKM8x7gyE4c=;
        b=EmzCqa0sue7WnJYlCKo7efONz4DLVXTCp+hnw2Ws2iiQy7rKsOe2lwYZiaTeeiPCMr
         d7HrDPxGATO8zK7d/dzmtCX6rgOPVKEJbWSa1Hg/7adHjg+g4lKEY0nmIzZVj9cOTL45
         zTG0f53q7LEWqBxkV1QZ7Ee0zM7icrI1R614mqHKchyJo453t50oADzcCFtW6dBbQonJ
         MdblarsUaoR4O+rfb9L785hW7YYt2RIiQHtqN1+tTf7J7u7DvWwPUzmxy6hvl3/h6HsS
         +3fA5gNt7SdNQoHcwQ3NvPgJcQO2uUGp289KcoJPhDLl6Aop1OyICIzRLiEdV9Rvrwrl
         xwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZXBJyHXcsrlBMXftoUkrD+PUq4MFM/pQyHEQNnqeFaptdTxkVU8A943TqQ04dSFue7Q30O53RBnXaFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBT21MxdxP0EbQxu+Qk8Vf5rm+ZkbIFM42l7anR4ZxFzWVVjx6
	p2yT1yJcBQ0adxfF7o/5rjx7HXP+EbnkmKBSZ/GTlEDc6a+oH/FSZIprrWCNNphMQ+Y=
X-Gm-Gg: ASbGncuVlLEpN7dSg9Xw5Xr7WudrnTOccJvTdeY7m+0qbffRkn6eiDwS+/R2cg5j5gK
	VTdoqEEVwXTLRgsjbytFfaUBgOqb9Je/t7AmwVG+9DzDeOgKT6liWJ2Pc31dD9VMWqAZrr+EbFV
	256gBhlop3627c4wyBu8ltAWDFRbPT4YZbFjn4029moVc0PIFLnElb3NwTDV3GXIlCOlem/pBge
	eK4LbWInzHwl8LRcVTpG14taCVvgBdFBiJybjiszSzVU7fhGRI3N6hzXn6sD9qArv/H5MBclIMF
	UQ+dnSU2b+6afn4CwAxAUEB95SHf/dn37rpvxHGK0Bzwki1nwNhXsgT+/BkvHWmOWT4neH4IUeh
	gu9KP7LPO9U9wNINxRjv1hXMnRM/hsl23CVX/LfQpkH/HcYdJV5Y=
X-Google-Smtp-Source: AGHT+IE3NXVbgrP/RYPydbW9+drnd1N+r2sI087097hN50jn9gE4DDohow4FO1i/KcQ8Qec2oH8NZA==
X-Received: by 2002:a17:90b:3908:b0:335:21bf:3b99 with SMTP id 98e67ed59e1d1-33b5139a3c6mr28585062a91.32.1760392603453;
        Mon, 13 Oct 2025 14:56:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:12 -0700
Subject: [PATCH v20 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-20-b9de4be9912e@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225645_524883_BF8A565E 
X-CRM114-Status: UNSURE (   9.64  )
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
