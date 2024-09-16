Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D69C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY2OgnxDG8kY3Zmzi8Wu4aUNGkSc4Uk+FXuv2NGvtvM=; b=Ob6C/OU1B83glyHVnlTWgqLnDn
	Yb7YF27BJToDQNyVUg04MlbkqiJHNgB91fA6UIyM3J564Jku4skb62L1hCIeswabO4pdGO//YeGFA
	zBM9XjJj5UjjOd1ORixvlqFwE1fckfnK3lLu86BjaumpPzu5CAm41ajX0AWcA4WenASBhAlyoUK1R
	xdVJxMzoV6MxIBNURYIsWknZB/QTaWmAxTn5llbJnXShyusfdVVmE3lybtY1aR1dyHOWN0YHabjxF
	GDi3bl8xkkImk4KFmuqvkCPske5SeKyOV2ILzP5nY5bE8TB6t+jthoBoPPdBe3xrUIznqTSjx5aZl
	doUoRUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq1g0-00000002xG1-1QEc;
	Mon, 16 Sep 2024 02:41:20 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq1fx-00000002xFf-0LP9
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 02:41:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-718816be6cbso2954396b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Sep 2024 19:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726454476; x=1727059276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ7bc5SqcE0TyYrB+t+d7+/GZbyQXftQ6Hsj5bON1WY=;
        b=M3JWVTinZM3YRlSB7CvHtcW6/4HQpuPBfSu0unLtymGvBUMZ3cSjlfyXxCDJMrnR3R
         xTVOs4nw2Ob9NVacB+XcdjGSo+j/spFiNGvJIvY4vbFZH3SK5HJKks/U1abnMSsDOv3C
         8Ck1CDezm12+zVhLJZhgRT4QxK6bUxzdXBohaBKGeZ/0QbfJQWRpBo4h7UygRsA3WCV/
         wfisVQXGyDfgf0zDguHaGOb8ICP7cSOQ70dH6MdcAjouudJ4N5LJx+8E1w5Gf8pb4kaD
         qOvpzAdMkf+BgYpdfl0260A22Znu9X6HDtAs7qMclFsZjoqSblMu4AZcJJplhnli1NQu
         8L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726454476; x=1727059276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ7bc5SqcE0TyYrB+t+d7+/GZbyQXftQ6Hsj5bON1WY=;
        b=wdxNvrxa0eq+47qlYJMOYMWO4e4dVXrG71K8aApxTJNU0LXfNcbQITpexnhXtmlWpD
         5Tp/qRHh83qpErqKN2ukQc5CcdKcjLUddQc+XXTh1J43MgOwl+61XzL/dTK4OoPTh94j
         ZSIP6hLTpiEmDL1WRV1rbMNLz9L90EyfdVC/d02GvX68aHLEMbdKb7RO/qhZBFzSNsC4
         bSZ/XXlX714WFs2rf7zPHn7rmeJXfk6kcNP9T+s3Seidom1R4u3SULaF24KiDNnLqm84
         hJle1LjUB9RhVUMLbdhK7zrMotS2g7/02v8JczU+Jomp6qfNAtZb5P00uNp61rpIsfnQ
         Bw3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXtXAGKWa6M/NJ1o07e3A0PhWx3ohRDEzYSqR1eWuf7B8xKnit0L8P0bK14Qz/lemkstmRbTlHzr5hLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+DY20gMw53a1Fl46pMxEoJMr3Sn1OocmU9N1fdKWyZdkNcP4l
	+jeYcwlqkIuYK4vkf2CT5W+9n4l0VRJoZ9VeDN8qTmyQ8glf4xA4
X-Google-Smtp-Source: AGHT+IFlk7vmvpL5BheL0pnnHEN8PLDD1dYdjxgsveHq8yhqGq93AzDWA66AEBEZ9+h2dzbefdCaiQ==
X-Received: by 2002:a05:6a00:2352:b0:714:3831:ec91 with SMTP id d2e1a72fcca58-71926213e47mr20154346b3a.25.1726454475421;
        Sun, 15 Sep 2024 19:41:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9ac05sm2848411b3a.155.2024.09.15.19.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:41:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D32814A358AE; Mon, 16 Sep 2024 09:41:09 +0700 (WIB)
Date: Mon, 16 Sep 2024 09:41:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 28/30] riscv: Documentation for landing pad / indirect
 branch tracking
Message-ID: <ZueaxRZgIf0crs4a@archie.me>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-29-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240912231650.3740732-29-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_194117_165233_9C3DD37A 
X-CRM114-Status: GOOD (  23.19  )
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
Content-Type: multipart/mixed; boundary="===============6694659447775132887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6694659447775132887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJXqtcSEhuPy+P+r"
Content-Disposition: inline


--IJXqtcSEhuPy+P+r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:16:47PM -0700, Deepak Gupta wrote:
> Adding documentation on landing pad aka indirect branch tracking on riscv
> and kernel interfaces exposed so that user tasks can enable it.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Documentation/arch/riscv/zicfilp.rst | 104 +++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/arch/riscv/zicfilp.rst

Don't forget to add toctree entry:

---- >8 ----
diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/=
index.rst
index eecf347ce84944..be7237b6968213 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -14,6 +14,7 @@ RISC-V architecture
     uabi
     vector
     cmodx
+    zicfilp

     features


> +Function pointers live in read-write memory and thus are susceptible to =
corruption
> +and allows an adversary to reach any program counter (PC) in address spa=
ce. On
> +RISC-V zicfilp extension enforces a restriction on such indirect control=
 transfers
> +
> +	- indirect control transfers must land on a landing pad instruction `lp=
ad`.
> +	  There are two exception to this rule
> +		- rs1 =3D x1 or rs1 =3D x5, i.e. a return from a function and returns =
are
> +		  protected using shadow stack (see zicfiss.rst)
> +
> +		- rs1 =3D x7. On RISC-V compiler usually does below to reach function
> +		  which is beyond the offset possible J-type instruction.
> +
> +			"auipc x7, <imm>"
> +			"jalr (x7)"
> +
> +		  Such form of indirect control transfer are still immutable and don't=
 rely
> +		  on memory and thus rs1=3Dx7 is exempted from tracking and considered=
 software
> +		  guarded jumps.

Sphinx reports new htmldocs warnings:

Documentation/arch/riscv/zicfilp.rst:30: ERROR: Unexpected indentation.
Documentation/arch/riscv/zicfilp.rst:96: ERROR: Unexpected indentation.=09

I have to fix up the lists:

---- >8 ----
diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/risc=
v/zicfilp.rst
index 23013ee711ac2c..c0fad1b5caa3d8 100644
--- a/Documentation/arch/riscv/zicfilp.rst
+++ b/Documentation/arch/riscv/zicfilp.rst
@@ -23,22 +23,24 @@ flow integrity (CFI) of the program.

 Function pointers live in read-write memory and thus are susceptible to co=
rruption
 and allows an adversary to reach any program counter (PC) in address space=
=2E On
-RISC-V zicfilp extension enforces a restriction on such indirect control t=
ransfers
+RISC-V zicfilp extension enforces a restriction on such indirect control
+transfers:

-	- indirect control transfers must land on a landing pad instruction `lpad=
`.
-	  There are two exception to this rule
-		- rs1 =3D x1 or rs1 =3D x5, i.e. a return from a function and returns are
-		  protected using shadow stack (see zicfiss.rst)
+- indirect control transfers must land on a landing pad instruction `lpad`.
+  There are two exception to this rule:

-		- rs1 =3D x7. On RISC-V compiler usually does below to reach function
-		  which is beyond the offset possible J-type instruction.
+  - rs1 =3D x1 or rs1 =3D x5, i.e. a return from a function and returns are
+    protected using shadow stack (see zicfiss.rst)

-			"auipc x7, <imm>"
-			"jalr (x7)"
+  - rs1 =3D x7. On RISC-V compiler usually does below to reach function
+    which is beyond the offset possible J-type instruction.

-		  Such form of indirect control transfer are still immutable and don't r=
ely
-		  on memory and thus rs1=3Dx7 is exempted from tracking and considered s=
oftware
-		  guarded jumps.
+      "auipc x7, <imm>"
+      "jalr (x7)"
+
+    Such form of indirect control transfer are still immutable and don't r=
ely
+    on memory and thus rs1=3Dx7 is exempted from tracking and considered s=
oftware
+    guarded jumps.

 `lpad` instruction is pseudo of `auipc rd, <imm_20bit>` with `rd=3Dx0`` an=
d is a HINT
 nop. `lpad` instruction must be aligned on 4 byte boundary and compares 20=
 bit
@@ -92,10 +94,11 @@ to lock current settings.
 --------------------------------------------------

 Pertaining to indirect branch tracking, CPU raises software check exceptio=
n in
-following conditions
-	- missing `lpad` after indirect call / jmp
-	- `lpad` not on 4 byte boundary
-	- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`
+following conditions:
+
+- missing `lpad` after indirect call / jmp
+- `lpad` not on 4 byte boundary
+- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`

 In all 3 cases, `*tval =3D 2` is captured and software check exception is =
raised
 (cause=3D18)


> +
> +`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` with `rd=3Dx0`` =
and is a HINT
> +nop. `lpad` instruction must be aligned on 4 byte boundary and compares =
20 bit
> +immediate withx7. If `imm_20bit` =3D=3D 0, CPU don't perform any compari=
sion with x7. If
> +`imm_20bit` !=3D 0, then `imm_20bit` must match x7 else CPU will raise
> +`software check exception` (cause=3D18)with `*tval =3D 2`.
> +

Also inline identifiers/keywords to be consistent with rest of riscv docs:

---- >8 ----
diff --git a/Documentation/arch/riscv/zicfilp.rst b/Documentation/arch/risc=
v/zicfilp.rst
index c0fad1b5caa3d8..b0a766098f2335 100644
--- a/Documentation/arch/riscv/zicfilp.rst
+++ b/Documentation/arch/riscv/zicfilp.rst
@@ -26,38 +26,38 @@ and allows an adversary to reach any program counter (P=
C) in address space. On
 RISC-V zicfilp extension enforces a restriction on such indirect control
 transfers:

-- indirect control transfers must land on a landing pad instruction `lpad`.
+- indirect control transfers must land on a landing pad instruction ``lpad=
``.
   There are two exception to this rule:

   - rs1 =3D x1 or rs1 =3D x5, i.e. a return from a function and returns are
     protected using shadow stack (see zicfiss.rst)

   - rs1 =3D x7. On RISC-V compiler usually does below to reach function
-    which is beyond the offset possible J-type instruction.
+    which is beyond the offset possible J-type instruction::

-      "auipc x7, <imm>"
-      "jalr (x7)"
+      auipc x7, <imm>
+      jalr (x7)

     Such form of indirect control transfer are still immutable and don't r=
ely
     on memory and thus rs1=3Dx7 is exempted from tracking and considered s=
oftware
     guarded jumps.

-`lpad` instruction is pseudo of `auipc rd, <imm_20bit>` with `rd=3Dx0`` an=
d is a HINT
-nop. `lpad` instruction must be aligned on 4 byte boundary and compares 20=
 bit
-immediate withx7. If `imm_20bit` =3D=3D 0, CPU don't perform any comparisi=
on with x7. If
-`imm_20bit` !=3D 0, then `imm_20bit` must match x7 else CPU will raise
-`software check exception` (cause=3D18)with `*tval =3D 2`.
+``lpad`` instruction is pseudo of ``auipc rd, <imm_20bit>`` with ``rd=3Dx0=
`` and
+is a HINT nop. ``lpad`` instruction must be aligned on 4 byte boundary and
+compares 20 bit immediate with x7. If ``imm_20bit`` =3D=3D 0, CPU don't pe=
rform any
+comparision with x7. If ``imm_20bit`` !=3D 0, then ``imm_20bit`` must matc=
h x7
+else CPU will raise software check exception (cause=3D18) with ``*tval =3D=
 2``.

 Compiler can generate a hash over function signatures and setup them (trun=
cated
-to 20bit) in x7 at callsites and function prologues can have `lpad` with s=
ame
+to 20bit) in x7 at callsites and function prologues can have ``lpad`` with=
 same
 function hash. This further reduces number of program counters a call site=
 can
 reach.

 2. ELF and psABI
 -----------------

-Toolchain sets up `GNU_PROPERTY_RISCV_FEATURE_1_FCFI` for property
-`GNU_PROPERTY_RISCV_FEATURE_1_AND` in notes section of the object file.
+Toolchain sets up ``GNU_PROPERTY_RISCV_FEATURE_1_FCFI`` for property
+``GNU_PROPERTY_RISCV_FEATURE_1_AND`` in notes section of the object file.

 3. Linux enabling
 ------------------
@@ -70,25 +70,26 @@ indirect branch tracking for the program.
 4. prctl() enabling
 --------------------

-`PR_SET_INDIR_BR_LP_STATUS` / `PR_GET_INDIR_BR_LP_STATUS` /
-`PR_LOCK_INDIR_BR_LP_STATUS` are three prctls added to manage indirect bra=
nch
+``PR_SET_INDIR_BR_LP_STATUS`` / ``PR_GET_INDIR_BR_LP_STATUS`` /
+``PR_LOCK_INDIR_BR_LP_STATUS`` are three prctls added to manage indirect b=
ranch
 tracking. prctls are arch agnostic and returns -EINVAL on other arches.

-`PR_SET_INDIR_BR_LP_STATUS`: If arg1 `PR_INDIR_BR_LP_ENABLE` and if CPU su=
pports
-`zicfilp` then kernel will enabled indirect branch tracking for the task.
-Dynamic loader can issue this `prctl` once it has determined that all the =
objects
-loaded in address space support indirect branch tracking. Additionally if =
there is
-a `dlopen` to an object which wasn't compiled with `zicfilp`, dynamic load=
er can
-issue this prctl with arg1 set to 0 (i.e. `PR_INDIR_BR_LP_ENABLE` being cl=
ear)
+``PR_SET_INDIR_BR_LP_STATUS``: If arg1 ``PR_INDIR_BR_LP_ENABLE`` and if CPU
+supports ``zicfilp`` then kernel will enabled indirect branch tracking for=
 the
+task. Dynamic loader can issue this ``prctl`` once it has determined that =
all
+the objects loaded in address space support indirect branch tracking.
+Additionally if there is a ``dlopen`` to an object which wasn't compiled w=
ith
+``zicfilp``, dynamic loader can issue this prctl with arg1 set to 0 (i.e.
+``PR_INDIR_BR_LP_ENABLE`` being clear)

-`PR_GET_INDIR_BR_LP_STATUS`: Returns current status of indirect branch tra=
cking.
-If enabled it'll return `PR_INDIR_BR_LP_ENABLE`
+``PR_GET_INDIR_BR_LP_STATUS``: Returns current status of indirect branch
+tracking. If enabled it'll return ``PR_INDIR_BR_LP_ENABLE``

-`PR_LOCK_INDIR_BR_LP_STATUS`: Locks current status of indirect branch trac=
king on
-the task. User space may want to run with strict security posture and woul=
dn't want
-loading of objects without `zicfilp` support in it and thus would want to =
disallow
-disabling of indirect branch tracking. In that case user space can use thi=
s prctl
-to lock current settings.
+``PR_LOCK_INDIR_BR_LP_STATUS``: Locks current status of indirect branch
+tracking on the task. User space may want to run with strict security post=
ure
+and wouldn't want loading of objects without ``zicfilp`` support in it and=
 thus
+would want to disallow disabling of indirect branch tracking. In that case=
 user
+space can use this prctl to lock current settings.

 5. violations related to indirect branch tracking
 --------------------------------------------------
@@ -96,12 +97,12 @@ to lock current settings.
 Pertaining to indirect branch tracking, CPU raises software check exceptio=
n in
 following conditions:

-- missing `lpad` after indirect call / jmp
-- `lpad` not on 4 byte boundary
-- `imm_20bit` embedded in `lpad` instruction doesn't match with `x7`
+- missing ``lpad`` after indirect call / jmp
+- ``lpad`` not on 4 byte boundary
+- ``imm_20bit`` embedded in ``lpad`` instruction doesn't match with x7

-In all 3 cases, `*tval =3D 2` is captured and software check exception is =
raised
+In all 3 cases, ``*tval =3D 2`` is captured and software check exception i=
s raised
 (cause=3D18)

-Linux kernel will treat this as `SIGSEV`` with code =3D `SEGV_CPERR` and f=
ollow
+Linux kernel will treat this as ``SIGSEV`` with code =3D ``SEGV_CPERR`` an=
d follow
 normal course of signal delivery.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IJXqtcSEhuPy+P+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZueawQAKCRD2uYlJVVFO
o72rAP0f2qcQlNSisvlhhZn9AoKwhyuBcmQUB3iNJOvDWNAp/gD7BxOWxP3cyxbX
Y3SfLQ1Amz7nw/R2vuD/vMlR498G6Ak=
=GJtS
-----END PGP SIGNATURE-----

--IJXqtcSEhuPy+P+r--


--===============6694659447775132887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6694659447775132887==--

