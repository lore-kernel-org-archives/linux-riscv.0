Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA0C369D9
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLtyYTjbG8ei6+eaJcMPSu+6PxEBw/2VSuusswnRPt0=; b=QdiUk8IwxuGd/T
	tKZJmdOYzhpqAC2mvo33/AejP+UdwSHtdSssA75AXtch1edQsff6v/calllQ52Ji5wwgL6uEDvl23
	S4Q6sHcvEYjAlnUPQIkwPgSAMNynIrjvBXwT+I4UdFIGqamaGBcWjIVxkgaHEO4VLCgfgqDnlOteR
	qpJjJ6Mj/Do/D4GNIKFDHc643cAkG83i+a5A4Wm2tsiTBJHirWxJ/4dg/EhxB35R+5R2Wv2iCRL1d
	uoBFTXVqC6JYXnA/Y/09O2VgjSOIr0+KE1N3HGwe2QLRvgh+nhBSyhnNyPXvhFTHCXDxD2DxUodOy
	bIbdWtzh4m21jZ6mxyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qv8-0000000D8wg-0bEw;
	Thu, 24 Apr 2025 07:22:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qsj-0000000D7ZA-2eWv
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-227c7e57da2so5395355ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479224; x=1746084024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgj2CDzD4Jo/CEM6nihs8vPoVImKLJIm8Gt1mS5KnTE=;
        b=qHcqAJrA4hNYl1vtWnGorZuVi4Eyaolh3vTHg7LfbQREimhhSUcC1XMhhN+6TZbiuZ
         i9cHWiZLROmko3gPlnQ6yAq3+enuMfwun4/yWGAcApv6MW8R2g3R1waXL+d7ssoRummI
         lMQ7yApHip0v4GHV+gcRn6KsBnJYftF2IoUL3dfLDMhjmusaRxk83YnvXh3y5cufKexx
         aNlC680pYXycZYqNbWhoQuY8bKtOp3uTKLTCKCKhReqGrojtaz/NLg8T/aZ1Cc7YtLk3
         NMM7kwTcBKlOzkRoSUX1slMjNx8UOI5Q0MEwjaf0IsWbl6GTP+q65uDaqP6xWWFt6i+h
         Jjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479224; x=1746084024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgj2CDzD4Jo/CEM6nihs8vPoVImKLJIm8Gt1mS5KnTE=;
        b=jGmSPI0TaOLchBMWx3gYBs6EG8WqBi56CaCT1l+urVQZKBFIshIA2MngvypNcFurL3
         vi9uCglw6kmZFbFy929pTL3qRb+9FAgqmTJ2s2Yi9IDZ3rL0/Zoyfti+Uy3PmHHJcX7k
         CPysYs6ZQ5pY/FLRRCVO6EjozdQLxE9/86qM8thvvFIDPDlIiEa7Yc6L2rbrTFsTkcdC
         ejBzpiN8OZRwMtGj1fej8ZFk6y1zzXPgyZcBM7iULdwEgHX8midt94y/S+K0m8pzq6Cp
         H3X9QeePB/4Q6pyfvx1t1TQelhHqbgZBDyLOZUuDMBus68d7tDAk2PjZEcHYjfncIvXB
         ypdw==
X-Forwarded-Encrypted: i=1; AJvYcCUI0ZlaN6krLE7vhwrpQbPdB9TTAQGucDsNWayoncm5urkf8MR69Sy7KboLc0fFFALfp3i+wHVJtqWfaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCfj4OP5d/TIGAwzWxH8k6Zbvs82o36xB/y8Yt2l68MS+8QNe
	ljVKSEymuOHJlsAiLQGt9PsrgGjDgBVIrdgd/bLQJEgKj0F36M7N7oEC3q+2wLk=
X-Gm-Gg: ASbGncuq96otMq+nj8JdHSzl9JHFAvbMvGvoNCLfbbH6cvmvinLnvFyaUFMfBoxBC7N
	ZTxxLnCQooWG/IM8SpLd0CROAs9iLnFv0KagDn6XTae1RZVxh5kk9bfwPHua2GTyU6Y7kO/n4QT
	+7TJFdeWLaeSMdcM9ofkgC//FYzFCWRxiRUeQ61mwPprPsQAa86vPi1KXSJLooQqnGCxcA5B5fQ
	r7OOB4PO6fZGOzY6EDWkJpEJbIMWzWtoMb6sm0wgHn06vdA2urtgPNWOUfDPoOYHxrP0I1MtixJ
	L5EKRbzCA/hGdY/pFAo7oryc+a73lraxJyAhZCw5HqEPqXalDjo=
X-Google-Smtp-Source: AGHT+IHy7+gUl6JYqkh6DnEiG93YQYFRurMg0kkH08H4hXEqOE1zGfqqlxcBK4Z6Ezoo9LY2AtzRZw==
X-Received: by 2002:a17:903:1b66:b0:216:6901:d588 with SMTP id d9443c01a7336-22db3bde914mr23693625ad.15.1745479224614;
        Thu, 24 Apr 2025 00:20:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:16 -0700
Subject: [PATCH v13 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-1-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002025_667669_EFF3D192 
X-CRM114-Status: UNSURE (   9.50  )
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

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
