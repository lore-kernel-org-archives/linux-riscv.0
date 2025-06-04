Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D36C61DB8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boX/a5YsJ183+FnULZs8DvpxwAz0hdjTMJO1S4Xp5SM=; b=BYi7AR1S7MYjLE
	nerX2yK3FSlkT3CyCFPQ8lA1a+tEvbvhH0r6+kGsZHQ3tcRtZETF6uRP6Az5x2esSbS4efakIEnLk
	ZzE2pmpXk/QLzSDtkHvagMW46TWlZ2wS0WTTLuVFA3ztkxBcunZf4lGOyUZeP4VCc5sLf9N1D5cOz
	/O5+HaKBWcRx5ihTH9/yRh+ySm7suFVXNS1oQ7GME7PSahDcagoF+iG1VdBPwhqsnmTURxZ5QQFVu
	euK6OVuhDnb/dKcBOb42cdCsnTtkHqhjd2VZ3+FNPA1oByqYubtDggMGU2r5JPxrquO6wZqhWAdOY
	fYfc3v6yLwKry0ofb3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrla-0000000Dtyp-00UL;
	Wed, 04 Jun 2025 17:19:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjs-0000000DtDv-3d6m
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=; b=TULjK+Ak84OVfCvWHN3v+eCWuN
	8MIwT+XWpTktHekvZ1hXlhakUnqZkTAPu03Bvzh3yk5xqRdsFVQzxVzRHtliuVH9YY1ZOd/ASCPFv
	QnVoDpWjoa6vN1N2EXtViDid9LKYcQvKYcULHvNdeX41Y3fKxR5yQ6dLiHKLtzSe2HHqUaPOi/7hj
	0yNtyncwLwuhQfGf7zGLoqap3c3AZu/3PZukdjF7jt0IyIwB0UEXbB7PpZztzlz/Z0IOXX8aF+SU6
	W8rsEhsiH+bm9AuHYKgHVCXhG3xjgic5Cwg6tJ9uBYYQklHCR5pQo358C5nVnJIHSFgfA2mYsaUWF
	i9wpOQSg==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjq-00000000vBT-1fUD
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:17:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so94558a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057435; x=1749662235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=1cQuYxi6xbQXpiHX/2gK51kdeTThIj/txBj/GV6S1324Gbykt6174XM6fNSutDzXCs
         pAOjdeUDVXf/RzNBwMQr/nIYLbPp3NvhSLf6jZX1KZxwicfXFT1O5p1BXrDZqvfOjLRB
         /oIlWp9IDhCPWLybEtOKRC6WewOoh/Pn6UH+BF0Nw5w1YioQ2dJytv3FEnF/cQqeVOcO
         FG9KX8F54HfUlllYnVVifuk12b60Pf8QWJ2Pojsv3P+SSQjzl25jRSjALzesires4QIX
         aC1D/L2ifTU/zNr1fLo5YsdeIi302kJ/P/SuQw4m4VCz4xLdhHZldLrrP5NbFtWU127t
         4dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057435; x=1749662235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=Zy1LswX0od4yh3fOD/TE5vj2lz0viUJeEW1x7axE14DKm7TXCDxRGEJidy1Mq6Hh/H
         qZnCoFOjJG9+8NLQmnDzkTaZGXNEOySEO1sh396HvKmpH+MRCzi5i0G+OuEoNSd5femT
         fEWQyKtBzib99SHQ79MC2scvMadiut1imKFKwy1vKNUrxxKtJxCmJyx5ZtCGh0y73aig
         /ewVxX5E1Hb1YekSvwp4ajyeEJBH+BL2SH9Iv84/8yfr3AS5d/wcDkJ8bu3/cv6SDaLd
         xPNCf2Y2+57llnW2Pv64c4kfa06aX5iYjEj2aqg4wkSH35V2IbQQl24dFL46k9x2JN51
         RcKA==
X-Forwarded-Encrypted: i=1; AJvYcCUwPzUzonSoK6M2ftbwf8/2ek2CbfNBX1H9gEInieJgDkIFTgeM3jzmBUlknXR1g087x2m9YHXFUkfU7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyp51SmVSCygOCIpsejy2uput7PfSgj7rS92nnp4S0nyY2v6V+
	B9uqrH4LrvHbLigrZqcYnfPsweB9pjfl0CHnXGxu7w6lii5foeofmkIWbFnjLs3uaZQ=
X-Gm-Gg: ASbGnctNPU4jIJijRbj8/pG4lXncE/MOGVJls9Vk8OfT9ivz3IJJ1GdXT2qjQwM2Xxo
	wuLEr7RE0rYXWV9+0xwKzw1IIALWpKlXgaWOLSW0Qmh8AujzHgykKIMPx6Wl3gPCQ70FK7locIx
	9j0vqxtuemveeSINNGhtaRuPV3gKz8rHw6+fbaBuEL6gjMinKloyshJqjfhCbqlwBSHFCCHt2bs
	9wViCc58XdYhIUJ5tihzRR9trPtVeZhLev8FdNUvaZ2Z0dOARWDvt2pY/xgtt7e7NcOqpvqUVRo
	GGfG9S6wQR8AjqRJrOe/4eYm2L8CuCEwkIhB2ViIoqsdmdC/0LqJ63UNKj6Bz3v93wRNF1O2
X-Google-Smtp-Source: AGHT+IFRkG/ueZmWo+NqSTRZ9V3ys7So/QoEVgn4dpe4KHFol1emcatYOtg6C5H9Gx/Ts8HBIn3E3A==
X-Received: by 2002:a17:90b:3d02:b0:312:e9d:4002 with SMTP id 98e67ed59e1d1-3130cdad8e7mr5727605a91.28.1749057435352;
        Wed, 04 Jun 2025 10:17:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:44 -0700
Subject: [PATCH v17 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-20-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250604_181718_492654_CF116B49 
X-CRM114-Status: GOOD (  10.09  )
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
index 3c2fce939673..9bc96881dc9b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..c86cba0e4506 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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
