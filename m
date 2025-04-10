Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E521C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5nIgl0sOOMHUp3dBbolM2JThZgHSMdb/g18RgGqwXA=; b=adbGsJmPtUAc/oxQ+8eMr0CbgJ
	Ldg0p+pEFZIDvONz7GaBzuF+KaeaBNcYRznOdJZYTRU+h0uxbcpfqus41Rk1xD/7r2eE1Oay0mqtr
	kYm/fgftNZscMNw4fFUZCQV59PWcpctirpWN0DTYWWlKelxSiLroOTX+DQ60YYAxzbOLZwLfPsj+g
	D4NtoytXIofLczcmDiA5Nk5kXC9ySm8oZU4p+qrf26DhEJb3YlRlUKgGsk3Z9usfJKHc/sBUtUKi8
	37fJ+lB+PvCHc01tPclt5HAA82AVhVZC0C5XF5Ff2XARdr83Vqj4aPk1AsdqH38Xvin0+eEgCjFn8
	43bfiUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kOY-00000009Gy4-0w9M;
	Thu, 10 Apr 2025 05:24:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kOV-00000009GxB-0Ykn
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 05:24:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso321190a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 22:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744262646; x=1744867446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZYMzQXIXSU/bXW26sRzTu+9m/v0haq3s3VFwVwrb1s=;
        b=ZWVNsBOjibAMjyMZxF6GkkI8qtBoTKyLeycF0UZAbwvc6Z71VbsG2mlLslmLXFvce6
         jZ6f9iKqyyNu1Mf/dlTODx2AAZny/NhSqq2MAgT3Xpm03/KNafXAjGYoTRuqr3W/YxAM
         df9eNfKkIoffNbrnA+X1IwN7CAnNgSIqJefg7Rj7pGuRWnIp8RLeHVKLV6GTYLcUVuje
         qHOgt5kKy0URds5X4fwcuMvxr7zoODngxjLaY7wTEJ283Vyjeu9Fs3xexRkIo8g/p0Gn
         wA9UeQM693AWgoZLq1zpNUDfw316mpvFoW5xExQCf8bscUKqKEc8nRfOM9porz61WXdq
         g8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744262646; x=1744867446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZYMzQXIXSU/bXW26sRzTu+9m/v0haq3s3VFwVwrb1s=;
        b=u28l9YXKLy/5GwKfxQGlnoHqFDbTWoFzGdP0cBvqVjqNdgAXole7pDUMw2bPusOd8Q
         +WvxLUa3zW3jxIvokf+bn+WpdkLxj8kjP1QMVZsdNsUTRF1r7XbdFaE+ryYiFNSory5U
         CE03Aja9zu7sX2D459pZDxvSExJ5kV+nUYIYh6qNQEtXpOXaz+Fjqw5i2CDko6hd1jPb
         X9+ODOCovXsxbCLB2dof9+Y6tjOzcsgAkwZd3y0B0D7vo5BmXnlfvE0/+r/n1VLQM5Y/
         zd3KwZ2NOFrbHuijXPSAEF9PTKiVKivWZNqKLgbEchRi+CdgtU7yLTN6OyqSU6CKI41N
         Jwqg==
X-Forwarded-Encrypted: i=1; AJvYcCXdv4t923T5hhkgvElGNrerkywyYUnPOQu5aIOKXO5yP51PITowclg3m93PVMD4YgGbpGubAipL8VqtmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv4Mg8jn/VsSiV05lwl3A809RlWF4yxKFsw+oBW/Xq9ft+rE+S
	De9q0v3636lSXX9wdR+PK8nfTLbrBADCJ+ySwXCqwe0xkPRdQS+FRBLAJnn7jpU=
X-Gm-Gg: ASbGncvgT6u7wvdUB19A3AD0cPdRJDBYJuGsGwuFTeevvpE6oCI2Zft0TtWQ6zv+Jh8
	Xt/dCo17RpUAeu8AuEBDJsd0gsAVtmyw4aHlMLs/j4wltPNXw5nAbDLiYR8Z7utxiEIjA3Vv0D/
	OI3qkKI31vSuqYii8SpTerRotqF2kqFWYSxKQU3ykBWBxmcMbtUPhyhhkm1/kmeImGbTIduUwg+
	vjU2nfGMMSVIhRL9h8wY7yGpCTlu+U+qgeYH6/rc3LyFZ4pv884+vTM7m5hkovwVwO122gaf3jM
	aqcrnfV3I1FAHmA3mZ20Do935CtQqbO3u/G8lHQ+53/1c2ESmU8=
X-Google-Smtp-Source: AGHT+IEFGYLi01GN6t1Qu8phsbyE3bnOEDBZkOiu+MAV/bjppeYPX1aHEWOs4wEGQPAvVv3qM4pyaQ==
X-Received: by 2002:a17:90a:d64b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30718b75cebmr2953474a91.14.1744262646173;
        Wed, 09 Apr 2025 22:24:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm21649615ad.217.2025.04.09.22.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:24:05 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:24:02 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v12 27/28] riscv: Documentation for shadow stack on riscv
Message-ID: <Z_dV8v54vfD9zHLV@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-27-e51202b53138@rivosinc.com>
 <2a24cc43-4150-4a56-ba09-0d136dde893f@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a24cc43-4150-4a56-ba09-0d136dde893f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_222407_562917_0E4E473B 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 08, 2025 at 10:48:08AM +0200, Alexandre Ghiti wrote:
>
>On 14/03/2025 22:39, Deepak Gupta wrote:
>>Adding documentation on shadow stack for user mode on riscv and kernel
>>interfaces exposed so that user tasks can enable it.
>>
>>Reviewed-by: Zong Li <zong.li@sifive.com>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  Documentation/arch/riscv/index.rst   |   1 +
>>  Documentation/arch/riscv/zicfiss.rst | 176 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 177 insertions(+)
>>
>>diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
>>index be7237b69682..e240eb0ceb70 100644
>>--- a/Documentation/arch/riscv/index.rst
>>+++ b/Documentation/arch/riscv/index.rst
>>@@ -15,6 +15,7 @@ RISC-V architecture
>>      vector
>>      cmodx
>>      zicfilp
>>+    zicfiss
>>      features
>>diff --git a/Documentation/arch/riscv/zicfiss.rst b/Documentation/arch/riscv/zicfiss.rst
>>new file mode 100644
>>index 000000000000..5ba389f15b3f
>>--- /dev/null
>>+++ b/Documentation/arch/riscv/zicfiss.rst
>>@@ -0,0 +1,176 @@
>>+.. SPDX-License-Identifier: GPL-2.0
>>+
>>+:Author: Deepak Gupta <debug@rivosinc.com>
>>+:Date:   12 January 2024
>>+
>>+=========================================================
>>+Shadow stack to protect function returns on RISC-V Linux
>>+=========================================================

<... snipped ..>

>>+
>>+5. violations related to returns with shadow stack enabled
>>+-----------------------------------------------------------
>>+
>>+Pertaining to shadow stack, CPU raises software check exception in following
>>+condition:
>>+
>>+- On execution of ``sspopchk x1/x5``, ``x1/x5`` didn't match top of shadow
>>+  stack. If mismatch happens then cpu does ``*tval = 3`` and raise software
>>+  check exception.
>>+
>>+Linux kernel will treat this as :c:macro:`SIGSEV`` with code =
>>+:c:macro:`SEGV_CPERR` and follow normal course of signal delivery.
>>+
>>+6. Shadow stack tokens
>>+-----------------------
>>+Regular stores on shadow stacks are not allowed and thus can't be tampered
>>+with via arbitrary stray writes due to bugs. Method of pivoting / switching to
>>+shadow stack is simply writing to csr ``CSR_SSP`` changes active shadow stack.
>
>
>I don't understand the end of this sentence.

I'll rephrase it to make it readable and understandable.

>
>
>>+This can be problematic because usually value to be written to ``CSR_SSP`` will
>>+be loaded somewhere in writeable memory and thus allows an adversary to
>>+corruption bug in software to pivot to an any address in shadow stack range.
>
>
>Remove "an"
>
>
>>+Shadow stack tokens can help mitigate this problem by making sure that:
>>+
>>+- When software is switching away from a shadow stack, shadow stack pointer
>>+  should be saved on shadow stack itself and call it ``shadow stack token``
>>+
>>+- When software is switching to a shadow stack, it should read the
>>+  ``shadow stack token`` from shadow stack pointer and verify that
>>+  ``shadow stack token`` itself is pointer to shadow stack itself.
>>+
>>+- Once the token verification is done, software can perform the write to
>>+  ``CSR_SSP`` to switch shadow stack.
>>+
>>+Here software can be user mode task runtime itself which is managing various
>>+contexts as part of single thread. Software can be kernel as well when kernel
>>+has to deliver a signal to user task and must save shadow stack pointer. Kernel
>>+can perform similar procedure by saving a token on user shadow stack itself.
>>+This way whenever :c:macro:`sigreturn` happens, kernel can read the token and
>>+verify the token and then switch to shadow stack. Using this mechanism, kernel
>>+helps user task so that any corruption issue in user task is not exploited by
>>+adversary by arbitrarily using :c:macro:`sigreturn`. Adversary will have to
>>+make sure that there is a ``shadow stack token`` in addition to invoking
>>+:c:macro:`sigreturn`
>>+
>>+7. Signal shadow stack
>>+-----------------------
>>+Following structure has been added to sigcontext for RISC-V::
>>+
>>+    struct __sc_riscv_cfi_state {
>>+        unsigned long ss_ptr;
>>+    };
>>+
>>+As part of signal delivery, shadow stack token is saved on current shadow stack
>>+itself and updated pointer is saved away in :c:macro:`ss_ptr` field in
>>+:c:macro:`__sc_riscv_cfi_state` under :c:macro:`sigcontext`. Existing shadow
>>+stack allocation is used for signal delivery. During :c:macro:`sigreturn`,
>>+kernel will obtain :c:macro:`ss_ptr` from :c:macro:`sigcontext` and verify the
>>+saved token on shadow stack itself and switch shadow stack.
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
