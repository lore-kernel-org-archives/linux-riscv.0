Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD5C3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 03:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc8XicOnzboXIMG6s2iS6mgzKJa5KL5zv1Gda2f66Ok=; b=SoHSPheCDt3ZhjtLhpY171kYzj
	EUee0s/rR9IQ0Pdd4FjXpg1PHXIykxlpm1EZhAFfR+wZfgw3gPspGgNXhHsImnEIFlz781mOgTAEB
	jLtWRnWnmnwq0wByoNi9vfB3wiMo+Bh7cT6ktta+ornzm7IMM3Z6fORgjXqG05eRJoYkEymmZjliT
	UcKCZL0bHe3NuqeYpuSgeVHA+dqFeEb5oBLX5YTluqdvGgb5cONnocmznwjiZ9Hugr15av8hTEgru
	idMTcX6hJAmzrpHjavxZ+/k2EDJClh9QJfwxyuVQBI6R4zLDXLm5pu5AHCUhdQTl8WhPTBWyOoPqo
	+mvVBBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2IK-00000002zSj-1Txw;
	Mon, 16 Sep 2024 03:20:56 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2IG-00000002zRH-0au0
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 03:20:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so2599312a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Sep 2024 20:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726456851; x=1727061651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln43YramaFeXVEywvFE+ekQsGy0RBkrTNESqwuctvu0=;
        b=AAtca5BK1zjx5mW50gb49A7Sfb6EqsYllPyK54CyeUGAKjnvARMkKRwIyz7yfxVt8J
         33ludW9w521U44DLdipT9bAXPG2zEbwdzuO4uKPb27i9Fsu8hy+lJa2S54BakkWmfHxf
         bnZlvSOuOvHg9Lw/gvqoRLKTJzUkMnbpQTBERVg2QWGdLeRDgjVzAN/zQlHdlS4QQTOy
         TY9J/N4471Jpc5sQSSpCck1oXpH/CUM5reIc3djMsoUrkZVSWit1r7p/VYSP18QW6OJf
         QGpXPkZhHsHtoRV4EKs0kzSSCHkyQci3DzGdqJkxqw8a9h+DJZ4uu/nEUHNzVL4K6f1a
         AqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726456851; x=1727061651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln43YramaFeXVEywvFE+ekQsGy0RBkrTNESqwuctvu0=;
        b=A7+IkraAqJhi7zIHuo0zUGumkAAk49YeXDX31kIWBbkEHx1eDs2Imc1ZP+mRmxtWuL
         P7rQxXxoKNeVjwxlx5yQL4qN2Ee57NQ61X+m4eYVDmmAvJFMANVZNL+4x87o+OSOgc69
         DWsTQ7xKvvliWQsBHfgpCSrsw0Vi4QSqh0xh34QKWWJU27zabbbofhekwFSGNK0e5iU6
         /y8ePdRRVctzyukTFIeYpDI1JoIc/NTm9T+9YMhb+xMxrniq487nPxo38igeQZ/Z15Ww
         zBl61NAWc+Xb6UdnEtcCAcdsyvnqVr3pwfPwa0VaZa/Q8nbs4kYNHZjPDLmTFp32Qq3J
         15MA==
X-Forwarded-Encrypted: i=1; AJvYcCVQUcOBp80ekTX+Js8rywub+7qNQRj/lWB4L/podP55T901nGLphvspJCboYzNYpNKdVez2/l0ahr5q0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4WMkGmNOFmcI80+nnQpQGX7lFoFXc1vgjtE51xYhsrZ1y1Nm
	gvu2QtsSjBEi2bXA9zl78evoXVyt1QH8ZoWxVt/d+0Et12UdzKHc
X-Google-Smtp-Source: AGHT+IFA89uF5dUq73MmeIgJ/Ku23WBy9As54dvHWaFbWcJKhaq1OuaHwUPbzvXCjHE2C1SrWA+1bw==
X-Received: by 2002:a17:903:1d0:b0:207:60f4:a393 with SMTP id d9443c01a7336-2076e3939f5mr173378345ad.27.1726456850754;
        Sun, 15 Sep 2024 20:20:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19c0sm28405525ad.146.2024.09.15.20.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 20:20:50 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 279664A358AE; Mon, 16 Sep 2024 10:20:46 +0700 (WIB)
Date: Mon, 16 Sep 2024 10:20:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 29/30] riscv: Documentation for shadow stack on riscv
Message-ID: <ZuekDuJS66-YGg5L@archie.me>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-30-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240912231650.3740732-30-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_202052_247666_1F40899B 
X-CRM114-Status: GOOD (  23.27  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, osalvador@suse.de, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: multipart/mixed; boundary="===============6415376039001973895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6415376039001973895==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfhcWBhyYL8bTXY7"
Content-Disposition: inline


--cfhcWBhyYL8bTXY7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:16:48PM -0700, Deepak Gupta wrote:
> Adding documentation on shadow stack for user mode on riscv and kernel
> interfaces exposed so that user tasks can enable it.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Documentation/arch/riscv/zicfiss.rst | 169 +++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/arch/riscv/zicfiss.rst

Add the toctree entry:

---- >8 ----
diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/=
index.rst
index be7237b6968213..e240eb0ceb70c4 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -15,6 +15,7 @@ RISC-V architecture
     vector
     cmodx
     zicfilp
+    zicfiss

     features

> +Following structure has been added to sigcontext for RISC-V. `rsvd` fiel=
d has been kept
> +in case we need some extra information in future for landing pads / indi=
rect branch
> +tracking. It has been kept today in order to allow backward compatibilit=
y in future.
> +
> +struct __sc_riscv_cfi_state {
> +	unsigned long ss_ptr;
> +	unsigned long rsvd;
> +};

Sphinx reports indentation warning again:

Documentation/arch/riscv/zicfiss.rst:163: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.

I have to wrap __sc_riscv_cfi_state struct definition as a literal code blo=
ck:

---- >8 ----
diff --git a/Documentation/arch/riscv/zicfiss.rst b/Documentation/arch/risc=
v/zicfiss.rst
index f133b6af9c1525..96d85ed352b146 100644
--- a/Documentation/arch/riscv/zicfiss.rst
+++ b/Documentation/arch/riscv/zicfiss.rst
@@ -155,12 +155,12 @@ make sure that there is a `shadow stack token` in add=
ition to invoking `sigretur
 -----------------------
 Following structure has been added to sigcontext for RISC-V. `rsvd` field =
has been kept
 in case we need some extra information in future for landing pads / indire=
ct branch
-tracking. It has been kept today in order to allow backward compatibility =
in future.
+tracking. It has been kept today in order to allow backward compatibility =
in future::

-struct __sc_riscv_cfi_state {
+  struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;
 	unsigned long rsvd;
-};
+  };

 As part of signal delivery, shadow stack token is saved on current shadow =
stack itself and
 updated pointer is saved away in `ss_ptr` field in `__sc_riscv_cfi_state` =
under `sigcontext`

> +
> +As part of signal delivery, shadow stack token is saved on current shado=
w stack itself and
> +updated pointer is saved away in `ss_ptr` field in `__sc_riscv_cfi_state=
` under `sigcontext`
> +Existing shadow stack allocation is used for signal delivery. During `si=
greturn`, kernel will
> +obtain `ss_ptr` from `sigcontext` and verify the saved token on shadow s=
tack itself and switch
> +shadow stack.

Also inline the code identifiers (keywords):

---- >8 ----
diff --git a/Documentation/arch/riscv/zicfiss.rst b/Documentation/arch/risc=
v/zicfiss.rst
index 96d85ed352b146..9f721fbcaa6f6a 100644
--- a/Documentation/arch/riscv/zicfiss.rst
+++ b/Documentation/arch/riscv/zicfiss.rst
@@ -23,30 +23,30 @@ of the program.

 Return addresses live on stack and thus in read-write memory and thus are
 susceptible to corruption and allows an adversary to reach any program cou=
nter
-(PC) in address space. On RISC-V `zicfiss` extension provides an alternate=
 stack
-`shadow stack` on which return addresses can be safely placed in prolog of=
 the
-function and retrieved in epilog. `zicfiss` extension makes following chan=
ges
+(PC) in address space. On RISC-V ``zicfiss`` extension provides an alterna=
te stack
+(`shadow stack`) on which return addresses can be safely placed in prolog =
of the
+function and retrieved in epilog. ``zicfiss`` extension makes following ch=
anges:

 	- PTE encodings for shadow stack virtual memory
 	  An earlier reserved encoding in first stage translation i.e.
 	  PTE.R=3D0, PTE.W=3D1, PTE.X=3D0  becomes PTE encoding for shadow stack =
pages.

-	- `sspush x1/x5` instruction pushes (stores) `x1/x5` to shadow stack.
+	- ``sspush x1/x5`` instruction pushes (stores) `x1/x5`` to shadow stack.

-	- `sspopchk x1/x5` instruction pops (loads) from shadow stack and compares
-	  with `x1/x5` and if un-equal, CPU raises `software check exception` with
-	  `*tval =3D 3`
+	- ``sspopchk x1/x5`` instruction pops (loads) from shadow stack and compa=
res
+	  with ``x1/x5`` and if not equal, CPU raises software check exception
+          with ``*tval =3D 3``

-Compiler toolchain makes sure that function prologs have `sspush x1/x5` to=
 save return
-address on shadow stack in addition to regular stack. Similarly function e=
pilogs have
-`ld x5, offset(x2)`; `sspopchk x5` to ensure that popped value from regula=
r stack
-matches with popped value from shadow stack.
+Compiler toolchain makes sure that function prologs have ``sspush x1/x5`` =
to
+save return address on shadow stack in addition to regular stack. Similarly
+function epilogs have ``ld x5, offset(x2); sspopchk x5`` to ensure that po=
pped
+value from regular stack matches with popped value from shadow stack.

 2. Shadow stack protections and linux memory manager
 -----------------------------------------------------

 As mentioned earlier, shadow stack get new page table encodings and thus h=
ave some
-special properties assigned to them and instructions that operate on them =
as below
+special properties assigned to them and instructions that operate on them =
as below:

 	- Regular stores to shadow stack memory raises access store faults.
 	  This way shadow stack memory is protected from stray inadvertant
@@ -60,11 +60,11 @@ special properties assigned to them and instructions th=
at operate on them as bel
 	  shadow stack store.

 	- Shadow stack load / shadow stack store on read-only memory raises
-	  AMO/store page fault. Thus both `sspush x1/x5` and `sspopchk x1/x5`
+	  AMO/store page fault. Thus both ``sspush x1/x5`` and ``sspopchk x1/x5``
 	  will raise AMO/store page fault. This simplies COW handling in kernel
 	  During fork, kernel can convert shadow stack pages into read-only
 	  memory (as it does for regular read-write memory) and as soon as
-	  subsequent `sspush` or `sspopchk` in userspace is encountered, then
+	  subsequent ``sspush`` or ``sspopchk`` in userspace is encountered, then
 	  kernel can perform COW.

 	- Shadow stack load / shadow stack store on read-write, read-write-
@@ -75,8 +75,8 @@ special properties assigned to them and instructions that=
 operate on them as bel
 3. ELF and psABI
 -----------------

-Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_BCFI` for property
-`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
+Toolchain sets up ``GNU_PROPERTY_RISCV_FEATURE_1_BCFI`` for property
+``GNU_PROPERTY_RISCV_FEATURE_1_AND`` in notes section of the object file.

 4. Linux enabling
 ------------------
@@ -89,25 +89,25 @@ shadow stack for the program.
 5. prctl() enabling
 --------------------

-`PR_SET_SHADOW_STACK_STATUS` / `PR_GET_SHADOW_STACK_STATUS` /
-`PR_LOCK_SHADOW_STACK_STATUS` are three prctls added to manage shadow stack
+``PR_SET_SHADOW_STACK_STATUS`` / ``PR_GET_SHADOW_STACK_STATUS`` /
+``PR_LOCK_SHADOW_STACK_STATUS`` are three prctls added to manage shadow st=
ack
 enabling for tasks. prctls are arch agnostic and returns -EINVAL on other =
arches.

-`PR_SET_SHADOW_STACK_STATUS`: If arg1 `PR_SHADOW_STACK_ENABLE` and if CPU =
supports
-`zicfiss` then kernel will enable shadow stack for the task. Dynamic loade=
r can
-issue this `prctl` once it has determined that all the objects loaded in a=
ddress
-space have support for shadow stack. Additionally if there is a `dlopen` t=
o an
-object which wasn't compiled with `zicfiss`, dynamic loader can issue this=
 prctl
-with arg1 set to 0 (i.e. `PR_SHADOW_STACK_ENABLE` being clear)
+``PR_SET_SHADOW_STACK_STATUS``: If arg1 ``PR_SHADOW_STACK_ENABLE`` and if =
CPU supports
+``zicfiss`` then kernel will enable shadow stack for the task. Dynamic loa=
der can
+issue this ``prctl`` once it has determined that all the objects loaded in=
 address
+space have support for shadow stack. Additionally if there is a ``dlopen``=
 to an
+object which wasn't compiled with ``zicfiss``, dynamic loader can issue th=
is prctl
+with arg1 set to 0 (i.e. ``PR_SHADOW_STACK_ENABLE`` being clear)

-`PR_GET_SHADOW_STACK_STATUS`: Returns current status of indirect branch tr=
acking.
-If enabled it'll return `PR_SHADOW_STACK_ENABLE`
+``PR_GET_SHADOW_STACK_STATUS``: Returns current status of indirect branch =
tracking.
+If enabled it'll return ``PR_SHADOW_STACK_ENABLE``

-`PR_LOCK_SHADOW_STACK_STATUS`: Locks current status of shadow stack enabli=
ng on the
-task. User space may want to run with strict security posture and wouldn't=
 want
-loading of objects without `zicfiss` support in it and thus would want to =
disallow
-disabling of shadow stack on current task. In that case user space can use=
 this prctl
-to lock current settings.
+``PR_LOCK_SHADOW_STACK_STATUS``: Locks current status of shadow stack enab=
ling
+on the task. User space may want to run with strict security posture and
+wouldn't want loading of objects without ``zicfiss`` support in it and thus
+would want to disallow disabling of shadow stack on current task. In that =
case
+user space can use this prctl to lock current settings.

 5. violations related to returns with shadow stack enabled
 -----------------------------------------------------------
@@ -115,22 +115,22 @@ to lock current settings.
 Pertaining to shadow stack, CPU raises software check exception in followi=
ng
 condition

-	- On execution of `sspopchk x1/x5`, x1/x5 didn't match top of shadow stac=
k.
-	  If mismatch happens then cpu does `*tval =3D 3` and raise software check
-	  exception
+	- On execution of ``sspopchk x1/x5``, x1/x5 didn't match top of shadow
+          stack. If mismatch happens then cpu does ``*tval =3D 3`` and rai=
se
+          software check exception.

-Linux kernel will treat this as `SIGSEV`` with code =3D `SEGV_CPERR` and f=
ollow
+Linux kernel will treat this as ``SIGSEV`` with ``SEGV_CPERR`` code and fo=
llow
 normal course of signal delivery.

 6. Shadow stack tokens
 -----------------------
-Regular stores on shadow stacks are not allowed and thus can't be tampered=
 with via
-arbitrary stray writes due to bugs. Method of pivoting / switching to shad=
ow stack
-is simply writing to csr `CSR_SSP` changes active shadow stack. This can b=
e problematic
-because usually value to be written to `CSR_SSP` will be loaded somewhere =
in writeable
-memory and thus allows an adversary to corruption bug in software to pivot=
 to an any
-address in shadow stack range. Shadow stack tokens can help mitigate this =
problem by
-making sure that:
+Regular stores on shadow stacks are not allowed and thus can't be tampered=
 with
+via arbitrary stray writes due to bugs. Method of pivoting / switching to
+shadow stack is simply writing to csr ``CSR_SSP`` changes active shadow st=
ack.
+This can be problematic because usually value to be written to ``CSR_SSP``=
 will
+be loaded somewhere in writeable memory and thus allows an adversary to
+corruption bug in software to pivot to an any address in shadow stack rang=
e.
+Shadow stack tokens can help mitigate this problem by making sure that:

  - When software is switching away from a shadow stack, shadow stack point=
er should be
    saved on shadow stack itself and call it `shadow stack token`
@@ -139,31 +139,34 @@ making sure that:
    from shadow stack pointer and verify that `shadow stack token` itself i=
s pointer to
    shadow stack itself.

- - Once the token verification is done, software can perform the write to =
`CSR_SSP` to
-   switch shadow stack.
+ - Once the token verification is done, software can perform the write to
+   ``CSR_SSP`` to switch shadow stack.

-Here software can be user mode task runtime itself which is managing vario=
us contexts
-as part of single thread. Software can be kernel as well when kernel has t=
o deliver a
-signal to user task and must save shadow stack pointer. Kernel can perform=
 similar
-procedure by saving a token on user shadow stack itself. This way whenever=
 sigreturn
-happens, kernel can read the token and verify the token and then switch to=
 shadow stack.
-Using this mechanism, kernel helps user task so that any corruption issue =
in user task
-is not exploited by adversary by arbitrarily using `sigreturn`. Adversary =
will have to
-make sure that there is a `shadow stack token` in addition to invoking `si=
greturn`
+Here software can be user mode task runtime itself which is managing vario=
us
+contexts as part of single thread. Software can be kernel as well when ker=
nel
+has to deliver a signal to user task and must save shadow stack pointer. K=
ernel
+can perform similar procedure by saving a token on user shadow stack itsel=
f.
+This way whenever sigreturn happens, kernel can read the token and verify =
the
+token and then switch to shadow stack. Using this mechanism, kernel helps =
user
+task so that any corruption issue in user task is not exploited by adversa=
ry by
+arbitrarily using ``sigreturn``. Adversary will have to make sure that the=
re is
+a `shadow stack token` in addition to invoking ``sigreturn``

 7. Signal shadow stack
 -----------------------
-Following structure has been added to sigcontext for RISC-V. `rsvd` field =
has been kept
-in case we need some extra information in future for landing pads / indire=
ct branch
-tracking. It has been kept today in order to allow backward compatibility =
in future::
+Following structure has been added to sigcontext for RISC-V. ``rsvd`` fiel=
d has
+been kept in case we need some extra information in future for landing pad=
s /
+indirect branch tracking. It has been kept today in order to allow backward
+compatibility in future::

   struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;
 	unsigned long rsvd;
   };

-As part of signal delivery, shadow stack token is saved on current shadow =
stack itself and
-updated pointer is saved away in `ss_ptr` field in `__sc_riscv_cfi_state` =
under `sigcontext`
-Existing shadow stack allocation is used for signal delivery. During `sigr=
eturn`, kernel will
-obtain `ss_ptr` from `sigcontext` and verify the saved token on shadow sta=
ck itself and switch
-shadow stack.
+As part of signal delivery, shadow stack token is saved on current shadow =
stack
+itself and updated pointer is saved away in ``ss_ptr`` field in
+``__sc_riscv_cfi_state`` under ``sigcontext`` Existing shadow stack alloca=
tion
+is used for signal delivery. During ``sigreturn``, kernel will obtain
+``ss_ptr`` from ``sigcontext`` and verify the saved token on shadow stack
+itself and switch shadow stack.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cfhcWBhyYL8bTXY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZuekCAAKCRD2uYlJVVFO
o++5AP9Xu2vqD0dx3z2ctEtTVxfDn/hZ0MG1BdgPDbMcuONwlQD/a5DYWvzVdYIn
M3JiT/WxCGHof1VpWC4uaWz4jKV08gE=
=Xiks
-----END PGP SIGNATURE-----

--cfhcWBhyYL8bTXY7--


--===============6415376039001973895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6415376039001973895==--

