Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF70C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQP0uXLCiTFMpMeZtViZYHBta2WbIGA9HK2NtIovYaU=; b=CqZdj/Y65etSSB81/aweNtFSdr
	FlAUnodtcctqMZUGakvhhOv7KsU2wUxZMrENNyrwPqKOAIq8KBpeRyj/omyAZTbDCCphKF+8KL19E
	4j5S+ua9Spk6y1PNjDrE3fGVWY4slfRyOy90j8JFoiqPslX06hQIBxGb9w2XJ0NMOJ7ybTw7kiNzx
	qVEvViN3KHyDaXohzcGVFp6glKsskSA1QBFqH6aWJs5Da8GeRY+lw1wcUPHfTNt327xvME+mXymuB
	jbfbKLX4WoPuxOuiFSbGFuC8wHeYUT5HA1ZGxuqHNd/ROXY6pee37tRPYe6tHDZn1PZvARuapbzQM
	rA/V1uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINS0-00000003GSX-2Xhp;
	Fri, 23 May 2025 08:08:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILAr-000000032yp-09Da
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:42:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e033a3a07so86776105ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978948; x=1748583748; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PeXlR6fyrmkHtIBcqOOOkDBJgHZzvF+dTABh5DbyJWU=;
        b=AFBhAvmG2tglyzDmpHl/zRvDnMSg0WmqaK7TTjmzqro3sawvs/gK7eFPx8ZN5ltY/S
         O1gYjBBU+HvfyNNsc7XxVNVCkCxMfiD0y38W20ccMT0gTUCkQpWed2UxDRhe1VzIgpm8
         VV1pfRjRiFp0b8TNNoHGKGXNoOSW5PtvAUXzu3bMdRn3nS+Nbk4mc6aZXF4QZKB8OXox
         ihGxCtbrE2RnC4IOhLXaMmnitYVQELoiBIqucbKiihhzZtjHz9ZjB21LlSmbcJDjSc2W
         qS/7BbY0+fGw0y9sLwvR4nQYERHCCVKrhxpH7R3xEU8ccgvPFHmfqN1Oqjs17kdpnPRu
         UWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978948; x=1748583748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeXlR6fyrmkHtIBcqOOOkDBJgHZzvF+dTABh5DbyJWU=;
        b=ulVu3mlrQSn99hOiKO/qYe6qxA+Q/bSF/Bi6+BV25KOgftIXjQxe1qWpZN2xRRvGFe
         eHK0iDBhhfc5QHWmGHyh7ssn17r7Fk95vmG1h5r70IyLszvZVb+vDdA+bpTCpmQE7NTR
         1RxbzfGzxk5GCF0dD/yTEwKs5JlAzndKyEgxdH/V7gdPRVJHo/E0Qvy2bauS6PDQmQZ1
         s9sJK5CBCObSjG+2ZRiowi9Y0c42/yk5pwOJRJXyYUbM34MUD43B3Civs4nZO5MHdw+/
         4dJjrTM2+td39Kajo5uBaFXPbg0mPagmT/GxzR1vL3Nh2pEeuPQNE9O//xAYRzUhkB3q
         pYNg==
X-Forwarded-Encrypted: i=1; AJvYcCXP6fgwEQ4An2pyDcfG6Z0Rr5qhkI2A688PjsiAnBuKtxba8v007PCCR1bBWK/KarCevnhakF897a98wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAUaALxkA7RoellNKlejdR1tQjvmBsO/X8TtOcWbe8VU9iKLis
	lXrDkCD8iTxtZOjm6eSMASrengosUoz/V3y9uuiZ/27cdYAXk4pO8tR3xuCGvPWRSVY=
X-Gm-Gg: ASbGnctPx3e/E35DgFL10+yjWUQE3Rd1qQGENfX8/n8KgVJp8D5gM/cik3qQfzAhwxf
	83gAwyv/L92rY8Es+I4U7SArS2KgzfoV1g+EyaeRTqJFEy355r2S5Eqvoi/leoN5BtANBYkE2iJ
	tTLcYt2FWo7Gme0XLVzJ+AFuwqZyY4EQJ+kAFxvhswjYyUlhiodjgfqvV1M3XyFH+XpXWf1b3zz
	LHVq+i1/6YTQqT7elb/j+3GS7UUY4r7zdKovWvvfySAWDbvBZ4Q4KtBaaAaIzb1+8///5JtYzti
	hUvzmzVdJ+paWcC2SvxriAVTNQXU/cXSXw+3Po7xcZfWKHnmncafkw7DHT19qA==
X-Google-Smtp-Source: AGHT+IGxcfKTCsiLmQRetPvmpC8gr+QZ1joNLj/c7syc1uVWDhku1OKydg/AXIRqLtvSi4z4WzZIWg==
X-Received: by 2002:a17:902:c951:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-231d3536065mr372194685ad.0.1747978947701;
        Thu, 22 May 2025 22:42:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac94a0sm117355075ad.2.2025.05.22.22.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:42:27 -0700 (PDT)
Date: Thu, 22 May 2025 22:42:22 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v16 00/27] riscv control-flow integrity for usermode
Message-ID: <aDAKvogbPValQGR-@debug.ba.rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_224229_094770_28F1518E 
X-CRM114-Status: GOOD (  31.60  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Alex,

Sorry for this last minute another revision. There was a bug (see changelog)
that charlie reported. Although that could have been sent as a later fixup.

Primary reason to send another revision is to flip default of
`CONFIG_RISCV_USER_CFI` to `N` from `Y`.After having discussion with Atish =
and
Charlie, we came to a conclusion that `CONFIG_RISCV_USER_CFI` should be by
default set to `N`. Reason being there are no RVA23 hardware today, although
toolchain already have `-march=3Dzicfilp_zicfiss` options being support. Th=
is
would lead to cfi config being selected and generated vDSO would also have
shadow stack instructions in them. On a RVA23 compatible hardware (or any c=
pu
implementing zimop and zcmop) this shouldn't be a problem. But that's not t=
he
case today, most hardware dont have these extension implemented. And thus it
would start leading to illegal instruction exception.

So either you can take this revision (it has your reported fix for
"riscv: enable kernel access to shadow stack memory via FWFT sbi call" where
kernel build was failing when !SBI and !RV64) or you can change default of
CONFIG_RISCV_USER_CFI to no (in patch "riscv: create a config for shadow st=
ack
and landing pad instr support"). Let me know.


On Thu, May 22, 2025 at 10:31:03PM -0700, Deepak Gupta wrote:
>Basics and overview
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Software with larger attack surfaces (e.g. network facing apps like databa=
ses,
>browsers or apps relying on browser runtimes) suffer from memory corruption
>issues which can be utilized by attackers to bend control flow of the prog=
ram
>to eventually gain control (by making their payload executable). Attackers=
 are
>able to perform such attacks by leveraging call-sites which rely on indire=
ct
>calls or return sites which rely on obtaining return address from stack me=
mory.
>
>To mitigate such attacks, risc-v extension zicfilp enforces that all indir=
ect
>calls must land on a landing pad instruction `lpad` else cpu will raise so=
ftware
>check exception (a new cpu exception cause code on riscv).
>Similarly for return flow, risc-v extension zicfiss extends architecture w=
ith
>
>- `sspush` instruction to push return address on a shadow stack
>- `sspopchk` instruction to pop return address from shadow stack
>  and compare with input operand (i.e. return address on stack)
>- `sspopchk` to raise software check exception if comparision above
>  was a mismatch
>- Protection mechanism using which shadow stack is not writeable via
>  regular store instructions
>
>More information an details can be found at extensions github repo [1].
>
>Equivalent to landing pad (zicfilp) on x86 is `ENDBRANCH` instruction in I=
ntel
>CET [3] and branch target identification (BTI) [4] on arm.
>Similarly x86's Intel CET has shadow stack [5] and arm64 has guarded contr=
ol
>stack (GCS) [6] which are very similar to risc-v's zicfiss shadow stack.
>
>x86 and arm64 support for user mode shadow stack is already in mainline.
>
>Kernel awareness for user control flow integrity
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>This series picks up Samuel Holland's envcfg changes [2] as well. So if th=
ose are
>being applied independently, they should be removed from this series.
>
>Enabling:
>
>In order to maintain compatibility and not break anything in user mode, ke=
rnel
>doesn't enable control flow integrity cpu extensions on binary by default.
>Instead exposes a prctl interface to enable, disable and lock the shadow s=
tack
>or landing pad feature for a task. This allows userspace (loader) to enume=
rate
>if all objects in its address space are compiled with shadow stack and lan=
ding
>pad support and accordingly enable the feature. Additionally if a subseque=
nt
>`dlopen` happens on a library, user mode can take a decision again to disa=
ble
>the feature (if incoming library is not compiled with support) OR terminat=
e the
>task (if user mode policy is strict to have all objects in address space t=
o be
>compiled with control flow integirty cpu feature). prctl to enable shadow =
stack
>results in allocating shadow stack from virtual memory and activating for =
user
>address space. x86 and arm64 are also following same direction due to simi=
lar
>reason(s).
>
>clone/fork:
>
>On clone and fork, cfi state for task is inherited by child. Shadow stack =
is
>part of virtual memory and is a writeable memory from kernel perspective
>(writeable via a restricted set of instructions aka shadow stack instructi=
ons)
>Thus kernel changes ensure that this memory is converted into read-only wh=
en
>fork/clone happens and COWed when fault is taken due to sspush, sspopchk or
>ssamoswap. In case `CLONE_VM` is specified and shadow stack is to be enabl=
ed,
>kernel will automatically allocate a shadow stack for that clone call.
>
>map_shadow_stack:
>
>x86 introduced `map_shadow_stack` system call to allow user space to expli=
citly
>map shadow stack memory in its address space. It is useful to allocate sha=
dow
>for different contexts managed by a single thread (green threads or contex=
ts)
>risc-v implements this system call as well.
>
>signal management:
>
>If shadow stack is enabled for a task, kernel performs an asynchronous con=
trol
>flow diversion to deliver the signal and eventually expects userspace to i=
ssue
>sigreturn so that original execution can be resumed. Even though resume co=
ntext
>is prepared by kernel, it is in user space memory and is subject to memory
>corruption and corruption bugs can be utilized by attacker in this race wi=
ndow
>to perform arbitrary sigreturn and eventually bypass cfi mechanism.
>Another issue is how to ensure that cfi related state on sigcontext area i=
s not
>trampled by legacy apps or apps compiled with old kernel headers.
>
>In order to mitigate control-flow hijacting, kernel prepares a token and p=
lace
>it on shadow stack before signal delivery and places address of token in
>sigcontext structure. During sigreturn, kernel obtains address of token fr=
om
>sigcontext struture, reads token from shadow stack and validates it and on=
ly
>then allow sigreturn to succeed. Compatiblity issue is solved by adopting
>dynamic sigcontext management introduced for vector extension. This series
>re-factor the code little bit to allow future sigcontext management easy (=
as
>proposed by Andy Chiu from SiFive)
>
>config and compilation:
>
>Introduce a new risc-v config option `CONFIG_RISCV_USER_CFI`. Selecting th=
is
>config option picks the kernel support for user control flow integrity. Th=
is
>optin is presented only if toolchain has shadow stack and landing pad supp=
ort.
>And is on purpose guarded by toolchain support. Reason being that eventual=
ly
>vDSO also needs to be compiled in with shadow stack and landing pad suppor=
t.
>vDSO compile patches are not included as of now because landing pad labeli=
ng
>scheme is yet to settle for usermode runtime.
>
>To get more information on kernel interactions with respect to
>zicfilp and zicfiss, patch series adds documentation for
>`zicfilp` and `zicfiss` in following:
>Documentation/arch/riscv/zicfiss.rst
>Documentation/arch/riscv/zicfilp.rst
>
>How to test this series
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Toolchain
>---------
>$ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
>$ riscv-gnu-toolchain/configure --prefix=3D<path-to-where-to-build> --with=
-arch=3Drv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extra-m=
ultilib-test=3D"rv64gc_zicfilp_zicfiss-lp64d:-static"
>$ make -j$(nproc)
>
>Qemu
>----
>Get the lastest qemu
>$ cd qemu
>$ mkdir build
>$ cd build
>$ ../configure --target-list=3Driscv64-softmmu
>$ make -j$(nproc)
>
>Opensbi
>-------
>$ git clone git@github.com:deepak0414/opensbi.git -b v6_cfi_spec_split_ope=
nsbi
>$ make CROSS_COMPILE=3D<your riscv toolchain> -j$(nproc) PLATFORM=3Dgeneric
>
>Linux
>-----
>Running defconfig is fine. CFI is enabled by default if the toolchain
>supports it.
>
>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/buil=
d/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/buil=
d/bin/riscv64-unknown-linux-gnu- -j$(nproc)
>
>In case you're building your own rootfs using toolchain, please make sure =
you
>pick following patch to ensure that vDSO compiled with lpad and shadow sta=
ck.
>
>"arch/riscv: compile vdso with landing pad"
>
>Branch where above patch can be picked
>https://github.com/deepak0414/linux-riscv-cfi/tree/vdso_user_cfi_v6.12-rc1
>
>Running
>-------
>
>Modify your qemu command to have:
>-bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.bin
>-cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue
>
>vDSO related Opens (in the flux)
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>I am listing these opens for laying out plan and what to expect in future
>patch sets. And of course for the sake of discussion.
>
>Shadow stack and landing pad enabling in vDSO
>----------------------------------------------
>vDSO must have shadow stack and landing pad support compiled in for task
>to have shadow stack and landing pad support. This patch series doesn't
>enable that (yet). Enabling shadow stack support in vDSO should be
>straight forward (intend to do that in next versions of patch set). Enabli=
ng
>landing pad support in vDSO requires some collaboration with toolchain fol=
ks
>to follow a single label scheme for all object binaries. This is necessary=
 to
>ensure that all indirect call-sites are setting correct label and target l=
anding
>pads are decorated with same label scheme.
>
>How many vDSOs
>---------------
>Shadow stack instructions are carved out of zimop (may be operations) and =
if CPU
>doesn't implement zimop, they're illegal instructions. Kernel could be run=
ning on
>a CPU which may or may not implement zimop. And thus kernel will have to c=
arry 2
>different vDSOs and expose the appropriate one depending on whether CPU im=
plements
>zimop or not.
>
>References
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[1] - https://github.com/riscv/riscv-cfi
>[2] - https://lore.kernel.org/all/20240814081126.956287-1-samuel.holland@s=
ifive.com/
>[3] - https://lwn.net/Articles/889475/
>[4] - https://developer.arm.com/documentation/109576/0100/Branch-Target-Id=
entification
>[5] - https://www.intel.com/content/dam/develop/external/us/en/documents/c=
atc17-introduction-intel-cet-844137.pdf
>[6] - https://lwn.net/Articles/940403/
>
>To: Thomas Gleixner <tglx@linutronix.de>
>To: Ingo Molnar <mingo@redhat.com>
>To: Borislav Petkov <bp@alien8.de>
>To: Dave Hansen <dave.hansen@linux.intel.com>
>To: x86@kernel.org
>To: H. Peter Anvin <hpa@zytor.com>
>To: Andrew Morton <akpm@linux-foundation.org>
>To: Liam R. Howlett <Liam.Howlett@oracle.com>
>To: Vlastimil Babka <vbabka@suse.cz>
>To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>To: Paul Walmsley <paul.walmsley@sifive.com>
>To: Palmer Dabbelt <palmer@dabbelt.com>
>To: Albert Ou <aou@eecs.berkeley.edu>
>To: Conor Dooley <conor@kernel.org>
>To: Rob Herring <robh@kernel.org>
>To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>To: Arnd Bergmann <arnd@arndb.de>
>To: Christian Brauner <brauner@kernel.org>
>To: Peter Zijlstra <peterz@infradead.org>
>To: Oleg Nesterov <oleg@redhat.com>
>To: Eric Biederman <ebiederm@xmission.com>
>To: Kees Cook <kees@kernel.org>
>To: Jonathan Corbet <corbet@lwn.net>
>To: Shuah Khan <shuah@kernel.org>
>To: Jann Horn <jannh@google.com>
>To: Conor Dooley <conor+dt@kernel.org>
>To: Miguel Ojeda <ojeda@kernel.org>
>To: Alex Gaynor <alex.gaynor@gmail.com>
>To: Boqun Feng <boqun.feng@gmail.com>
>To: Gary Guo <gary@garyguo.net>
>To: Bj=F6rn Roy Baron <bjorn3_gh@protonmail.com>
>To: Benno Lossin <benno.lossin@proton.me>
>To: Andreas Hindborg <a.hindborg@kernel.org>
>To: Alice Ryhl <aliceryhl@google.com>
>To: Trevor Gross <tmgross@umich.edu>
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-fsdevel@vger.kernel.org
>Cc: linux-mm@kvack.org
>Cc: linux-riscv@lists.infradead.org
>Cc: devicetree@vger.kernel.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kselftest@vger.kernel.org
>Cc: alistair.francis@wdc.com
>Cc: richard.henderson@linaro.org
>Cc: jim.shu@sifive.com
>Cc: andybnac@gmail.com
>Cc: kito.cheng@sifive.com
>Cc: charlie@rivosinc.com
>Cc: atishp@rivosinc.com
>Cc: evan@rivosinc.com
>Cc: cleger@rivosinc.com
>Cc: alexghiti@rivosinc.com
>Cc: samitolvanen@google.com
>Cc: broonie@kernel.org
>Cc: rick.p.edgecombe@intel.com
>Cc: rust-for-linux@vger.kernel.org
>
>changelog
>---------
>v16:
>- If FWFT is not implemented or returns error for shadow stack activation,=
 then
>  no_usercfi is set to disable shadow stack. Although this should be picke=
d up
>  by extension validation and activation. Fixed this bug for zicfilp and z=
icfiss
>  both. Thanks to Charlie Jenkins for reporting this.
>- If toolchain doesn't support cfi, cfi kselftest shouldn't build. Suggest=
ed by
>  Charlie Jenkins.
>- Default for CONFIG_RISCV_USER_CFI is set to no. Charlie/Atish suggested =
to
>  keep it off till we have more hardware availibility with RVA23 profile a=
nd
>  zimop/zcmop implemented. Else this will start breaking people's workflow
>- Includes the fix if "!RV64 and !SBI" then definitions for FWFT in
>  asm-offsets.c error.
>
>v15:
>- Toolchain has been updated to include `-fcf-protection` flag. This
>  exists for x86 as well. Updated kernel patches to compile vDSO and
>  selftest to compile with `fcf-protection=3Dfull` flag.
>- selecting CONFIG_RISCV_USERCFI selects CONFIG_RISCV_SBI.
>- Patch to enable shadow stack for kernel wasn't hidden behind
>  CONFIG_RISCV_USERCFI and CONFIG_RISCV_SBI. fixed that.
>
>v14:
>- rebased on top of palmer/sbi-v3. Thus dropped clement's FWFT patches
>  Updated RISCV_ISA_EXT_XXXX in hwcap and hwprobe constants.
>- Took Radim's suggestions on bitfields.
>- Placed cfi_state at the end of thread_info block so that current situati=
on
>  is not disturbed with respect to member fields of thread_info in single
>  cacheline.
>
>v13:
>- cpu_supports_shadow_stack/cpu_supports_indirect_br_lp_instr uses
>  riscv_has_extension_unlikely()
>- uses nops(count) to create nop slide
>- RISCV_ACQUIRE_BARRIER is not needed in `amo_user_shstk`. Removed it
>- changed ternaries to simply use implicit casting to convert to bool.
>- kernel command line allows to disable zicfilp and zicfiss independently.
>  updated kernel-parameters.txt.
>- ptrace user abi for cfi uses bitmasks instead of bitfields. Added ptrace
>  kselftest.
>- cosmetic and grammatical changes to documentation.
>
>v12:
>- It seems like I had accidently squashed arch agnostic indirect branch
>  tracking prctl and riscv implementation of those prctls. Split them agai=
n.
>- set_shstk_status/set_indir_lp_status perform CSR writes only when CPU
>  support is available. As suggested by Zong Li.
>- Some minor clean up in kselftests as suggested by Zong Li.
>
>v11:
>- patch "arch/riscv: compile vdso with landing pad" was unconditionally
>  selecting `_zicfilp` for vDSO compile. fixed that. Changed `lpad 1` to
>  to `lpad 0`.
>v10:
>- dropped "mm: helper `is_shadow_stack_vma` to check shadow stack vma". Th=
is patch
>  is not that interesting to this patch series for risc-v. There are insta=
nces in
>  arch directories where VM_SHADOW_STACK flag is anyways used. Dropping th=
is patch
>  to expedite merging in riscv tree.
>- Took suggestions from `Clement` on "riscv: zicfiss / zicfilp enumeration=
" to
>  validate presence of cfi based on config.
>- Added a patch for vDSO to have `lpad 0`. I had omitted this earlier to m=
ake sure
>  we add single vdso object with cfi enabled. But a vdso object with schem=
e of
>  zero labeled landing pad is least common denominator and should work wit=
h all
>  objects of zero labeled as well as function-signature labeled objects.
>
>v9:
>- rebased on master (39a803b754d5 fix braino in "9p: fix ->rename_sem excl=
usion")
>- dropped "mm: Introduce ARCH_HAS_USER_SHADOW_STACK" (master has it from a=
rm64/gcs)
>- dropped "prctl: arch-agnostic prctl for shadow stack" (master has it fro=
m arm64/gcs)
>
>v8:
>- rebased on palmer/for-next
>- dropped samuel holland's `envcfg` context switch patches.
>  they are in parlmer/for-next
>
>v7:
>- Removed "riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv"
>  Instead using `deactivate_mm` flow to clean up.
>  see here for more context
>  https://lore.kernel.org/all/20230908203655.543765-1-rick.p.edgecombe@int=
el.com/#t
>- Changed the header include in `kselftest`. Hopefully this fixes compile
>  issue faced by Zong Li at SiFive.
>- Cleaned up an orphaned change to `mm/mmap.c` in below patch
>  "riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE"
>- Lock interfaces for shadow stack and indirect branch tracking expect arg=
 =3D=3D 0
>  Any future evolution of this interface should accordingly define how arg=
 should
>  be setup.
>- `mm/map.c` has an instance of using `VM_SHADOW_STACK`. Fixed it to use h=
elper
>  `is_shadow_stack_vma`.
>- Link to v6: https://lore.kernel.org/r/20241008-v5_user_cfi_series-v6-0-6=
0d9fe073f37@rivosinc.com
>
>v6:
>- Picked up Samuel Holland's changes as is with `envcfg` placed in
>  `thread` instead of `thread_info`
>- fixed unaligned newline escapes in kselftest
>- cleaned up messages in kselftest and included test output in commit mess=
age
>- fixed a bug in clone path reported by Zong Li
>- fixed a build issue if CONFIG_RISCV_ISA_V is not selected
>  (this was introduced due to re-factoring signal context
>  management code)
>
>v5:
>- rebased on v6.12-rc1
>- Fixed schema related issues in device tree file
>- Fixed some of the documentation related issues in zicfilp/ss.rst
>  (style issues and added index)
>- added `SHADOW_STACK_SET_MARKER` so that implementation can define base
>  of shadow stack.
>- Fixed warnings on definitions added in usercfi.h when
>  CONFIG_RISCV_USER_CFI is not selected.
>- Adopted context header based signal handling as proposed by Andy Chiu
>- Added support for enabling kernel mode access to shadow stack using
>  FWFT
>  (https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-firm=
ware-features.adoc)
>- Link to v5: https://lore.kernel.org/r/20241001-v5_user_cfi_series-v1-0-3=
ba65b6e550f@rivosinc.com
>  (Note: I had an issue in my workflow due to which version number wasn't
>  picked up correctly while sending out patches)
>
>v4:
>- rebased on 6.11-rc6
>- envcfg: Converged with Samuel Holland's patches for envcfg management on=
 per-
>thread basis.
>- vma_is_shadow_stack is renamed to is_vma_shadow_stack
>- picked up Mark Brown's `ARCH_HAS_USER_SHADOW_STACK` patch
>- signal context: using extended context management to maintain compatibil=
ity.
>- fixed `-Wmissing-prototypes` compiler warnings for prctl functions
>- Documentation fixes and amending typos.
>- Link to v4: https://lore.kernel.org/all/20240912231650.3740732-1-debug@r=
ivosinc.com/
>
>v3:
>- envcfg
>  logic to pick up base envcfg had a bug where `ENVCFG_CBZE` could have be=
en
>  picked on per task basis, even though CPU didn't implement it. Fixed in
>   this series.
>
>- dt-bindings
>  As suggested, split into separate commit. fixed the messaging that spec =
is
>  in public review
>
>- arch_is_shadow_stack change
>  arch_is_shadow_stack changed to vma_is_shadow_stack
>
>- hwprobe
>  zicfiss / zicfilp if present will get enumerated in hwprobe
>
>- selftests
>  As suggested, added object and binary filenames to .gitignore
>  Selftest binary anyways need to be compiled with cfi enabled compiler wh=
ich
>  will make sure that landing pad and shadow stack are enabled. Thus remov=
ed
>  separate enable/disable tests. Cleaned up tests a bit.
>
>- Link to v3: https://lore.kernel.org/lkml/20240403234054.2020347-1-debug@=
rivosinc.com/
>
>v2:
>- Using config `CONFIG_RISCV_USER_CFI`, kernel support for riscv control f=
low
>  integrity for user mode programs can be compiled in the kernel.
>
>- Enabling of control flow integrity for user programs is left to user run=
time
>
>- This patch series introduces arch agnostic `prctls` to enable shadow sta=
ck
>  and indirect branch tracking. And implements them on riscv.
>
>---
>Changes in v16:
>- Link to v15: https://lore.kernel.org/r/20250502-v5_user_cfi_series-v15-0=
-914966471885@rivosinc.com
>
>Changes in v15:
>- changelog posted just below cover letter
>- Link to v14: https://lore.kernel.org/r/20250429-v5_user_cfi_series-v14-0=
-5239410d012a@rivosinc.com
>
>Changes in v14:
>
>- changelog posted just below cover letter
>- Link to v13: https://lore.kernel.org/r/20250424-v5_user_cfi_series-v13-0=
-971437de586a@rivosinc.com
>
>Changes in v13:
>- changelog posted just below cover letter
>- Link to v12: https://lore.kernel.org/r/20250314-v5_user_cfi_series-v12-0=
-e51202b53138@rivosinc.com
>
>Changes in v12:
>- changelog posted just below cover letter
>- Link to v11: https://lore.kernel.org/r/20250310-v5_user_cfi_series-v11-0=
-86b36cbfb910@rivosinc.com
>
>Changes in v11:
>- changelog posted just below cover letter
>- Link to v10: https://lore.kernel.org/r/20250210-v5_user_cfi_series-v10-0=
-163dcfa31c60@rivosinc.com
>
>---
>Andy Chiu (1):
>      riscv: signal: abstract header saving for setup_sigcontext
>
>Deepak Gupta (25):
>      mm: VM_SHADOW_STACK definition for riscv
>      dt-bindings: riscv: zicfilp and zicfiss in dt-bindings (extensions.y=
aml)
>      riscv: zicfiss / zicfilp enumeration
>      riscv: zicfiss / zicfilp extension csr and bit definitions
>      riscv: usercfi state for task and save/restore of CSR_SSP on trap en=
try/exit
>      riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
>      riscv mm: manufacture shadow stack pte
>      riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
>      riscv mmu: write protect and shadow stack
>      riscv/mm: Implement map_shadow_stack() syscall
>      riscv/shstk: If needed allocate a new shadow stack on clone
>      riscv: Implements arch agnostic shadow stack prctls
>      prctl: arch-agnostic prctl for indirect branch tracking
>      riscv: Implements arch agnostic indirect branch tracking prctls
>      riscv/traps: Introduce software check exception
>      riscv/signal: save and restore of shadow stack for signal
>      riscv/kernel: update __show_regs to print shadow stack register
>      riscv/ptrace: riscv cfi status and state via ptrace and in core files
>      riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
>      riscv: kernel command line option to opt out of user cfi
>      riscv: enable kernel access to shadow stack memory via FWFT sbi call
>      riscv: create a config for shadow stack and landing pad instr support
>      riscv: Documentation for landing pad / indirect branch tracking
>      riscv: Documentation for shadow stack on riscv
>      kselftest/riscv: kselftest for user mode cfi
>
>Jim Shu (1):
>      arch/riscv: compile vdso with landing pad
>
> Documentation/admin-guide/kernel-parameters.txt    |   8 +
> Documentation/arch/riscv/index.rst                 |   2 +
> Documentation/arch/riscv/zicfilp.rst               | 115 +++++
> Documentation/arch/riscv/zicfiss.rst               | 179 +++++++
> .../devicetree/bindings/riscv/extensions.yaml      |  14 +
> arch/riscv/Kconfig                                 |  21 +
> arch/riscv/Makefile                                |   5 +-
> arch/riscv/include/asm/asm-prototypes.h            |   1 +
> arch/riscv/include/asm/assembler.h                 |  44 ++
> arch/riscv/include/asm/cpufeature.h                |  12 +
> arch/riscv/include/asm/csr.h                       |  16 +
> arch/riscv/include/asm/entry-common.h              |   2 +
> arch/riscv/include/asm/hwcap.h                     |   2 +
> arch/riscv/include/asm/mman.h                      |  25 +
> arch/riscv/include/asm/mmu_context.h               |   7 +
> arch/riscv/include/asm/pgtable.h                   |  30 +-
> arch/riscv/include/asm/processor.h                 |   2 +
> arch/riscv/include/asm/thread_info.h               |   3 +
> arch/riscv/include/asm/usercfi.h                   |  95 ++++
> arch/riscv/include/asm/vector.h                    |   3 +
> arch/riscv/include/uapi/asm/hwprobe.h              |   2 +
> arch/riscv/include/uapi/asm/ptrace.h               |  34 ++
> arch/riscv/include/uapi/asm/sigcontext.h           |   1 +
> arch/riscv/kernel/Makefile                         |   1 +
> arch/riscv/kernel/asm-offsets.c                    |  10 +
> arch/riscv/kernel/cpufeature.c                     |  27 +
> arch/riscv/kernel/entry.S                          |  33 +-
> arch/riscv/kernel/head.S                           |  27 +
> arch/riscv/kernel/process.c                        |  26 +-
> arch/riscv/kernel/ptrace.c                         |  95 ++++
> arch/riscv/kernel/signal.c                         | 148 +++++-
> arch/riscv/kernel/sys_hwprobe.c                    |   2 +
> arch/riscv/kernel/sys_riscv.c                      |  10 +
> arch/riscv/kernel/traps.c                          |  43 ++
> arch/riscv/kernel/usercfi.c                        | 545 ++++++++++++++++=
+++++
> arch/riscv/kernel/vdso/Makefile                    |   6 +
> arch/riscv/kernel/vdso/flush_icache.S              |   4 +
> arch/riscv/kernel/vdso/getcpu.S                    |   4 +
> arch/riscv/kernel/vdso/rt_sigreturn.S              |   4 +
> arch/riscv/kernel/vdso/sys_hwprobe.S               |   4 +
> arch/riscv/mm/init.c                               |   2 +-
> arch/riscv/mm/pgtable.c                            |  17 +
> include/linux/cpu.h                                |   4 +
> include/linux/mm.h                                 |   7 +
> include/uapi/linux/elf.h                           |   2 +
> include/uapi/linux/prctl.h                         |  27 +
> kernel/sys.c                                       |  30 ++
> tools/testing/selftests/riscv/Makefile             |   2 +-
> tools/testing/selftests/riscv/cfi/.gitignore       |   3 +
> tools/testing/selftests/riscv/cfi/Makefile         |  16 +
> tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  82 ++++
> tools/testing/selftests/riscv/cfi/riscv_cfi_test.c | 173 +++++++
> tools/testing/selftests/riscv/cfi/shadowstack.c    | 385 +++++++++++++++
> tools/testing/selftests/riscv/cfi/shadowstack.h    |  27 +
> 54 files changed, 2360 insertions(+), 29 deletions(-)
>---
>base-commit: 4181f8ad7a1061efed0219951d608d4988302af7
>change-id: 20240930-v5_user_cfi_series-3dc332f8f5b2
>--
>- debug
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
