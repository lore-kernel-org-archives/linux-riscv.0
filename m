Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C067ACCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Yky/GaIMZAUC3i/QQJaHdrIl+mUJhDDQrPsuRPd3kw=; b=hM8WLuTZqWSiGg3Zk8gP/KpdIq
	+9Nae4PH3yYYeNgqfDwQzG7mSb9Ix5YNtuD7KDM5bw+DnqeWb3XEOvB9d8LXCe9I02uPBwERlpaer
	r1YPxkS8hUjFIpFyhddwjBgx49H56DqV0+yIn/7ypFxQzhA7j0eQgk1kivsfh8o2UXtZmLfNEXrXn
	PY5yF+v2uPoekRnVLwmw4fF6xeUZdRvxzIoKGPKdA8NXAtXeQJli7G4pe+ZraHPYX0QXunIiFkmih
	cEP/OaSrRnGmfDyW/sJwrMR2w45TUzBxS8D9Z4j2v64qVBjwez+1rwA2xHkduddnhfFNu/hf+d66t
	Z0dzWGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGk3n-0000000EN2l-1znt;
	Wed, 05 Nov 2025 20:24:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGk3i-0000000EN1y-2zPc
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 20:24:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7aca3e4f575so265416b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 12:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762374286; x=1762979086; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTJsvc/xBov8KIoRaCRLX6nRBzvfxpOxCd2qNAg1A34=;
        b=D/xc4IFel+kn78cJ5RS6L3inZmQSe152eHGVSXQsU/IGNDNwVIY3ctIgvo+/CNU3FL
         Fpv1sOxEOwgGkJSM1GaLXfBJuSWZ9Vg7OPfwmjtAjfvZLj9WRGrJ+jj0a/QAl/LNaKc0
         PspnMXF0UyPkl4W0NO7q6sB4tgdpjem640wvY1CTe9xbJhNPcNqJyy2WOLLrlmbrFOa0
         BSITbFhwODu5T+KjEBek6UPosn3XMyo/V6jKqUpppF8NJcxVA0r4jL1NqH+PHcivIXem
         FUxdQnqwoBqGqnll2Ondvuf5qviaRpFey8WN2JY1cJTikw4V4mVdcxHvrggHg7g5nl2B
         l2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762374286; x=1762979086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTJsvc/xBov8KIoRaCRLX6nRBzvfxpOxCd2qNAg1A34=;
        b=IascjutabrrmxhBXs3vyOqDkCRY/fyE8ty4sxXqnjQdgrIVoHOT3wkG9D2SdCkBMdx
         SCtgr/Y/MQh8om30FZ9GuvAzmqm8w/XMT8OQl2iJbaSO6l3G/exx6xwQkwagIXec+Kb2
         2R2Yj9fsU0TleObeYtQboslVNQiBZFlc/hIab2uEiTFaqe26b8EJgNAG9g3xeW04nolx
         oJhtZN9VhslDX519ULuHEBXvc8eXcHFBZXEKg9DnX5OcSiO9Y27S3vtIKB3EKB71MZqm
         HVtXJ0fa82OgLxD+vsAZFM5cLSmFUAps/WcWTPHmyeCsu+GbOq1x3J6jnVuwKJxU23sf
         C8CA==
X-Forwarded-Encrypted: i=1; AJvYcCWwIulQFkC/ocq61K5IhwXrVBEdp7KuNpF0YsJwIitiAKPq7E79ffvi+iHZPkb/DkzH0INtnfQlcCalXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNAwm3jt7TSuY5L0Uhv9USHcz1C9Yi2VYY1kyWrIL9qQcK5pa
	WLBZDhQWLCZQSYMJUtL5MrSylGfQSbOFpOKeyOlWbQ1a1NLG62ulWIJie0ARxVL6YHE=
X-Gm-Gg: ASbGnctTIjNJu/aeJwrmWmmRBq9bzoah//we+IH6yerBVD2AXhWql1rN6dAA7rX2zjz
	6TpfFK/FtMdSwpqKFVv86EI1DUN/ZUVDKkuy6som3s1MHnOFdajtl0ga29I9+YI2w8IMQSQ3FcQ
	Mlzevf5wZm78wYpIyBxgd++klTwOtv3ldW47st+KqqvWrZ1CEbCOjZGIsl2Cr7y0geCBu3UGKny
	rFkkGOHFEHYTC+Yv8SLnWKGlG6YUMdqVE0LeXrPWrcb+HpF5PMUEV+aH918B2wKpy/bwX4nAFrP
	84if6Wxh8z3I7QHVSMPXWYxsMg+Fil9a/veqKjDq/KX7sWymcvBPCrVBrxchYZd3aiE9jja817B
	HtiNeI4OLVvZptMzkt8ANxfqE/nhBQzOoPP3lzBFj/GUiS6gJ/oZpgrdCbh1LY8cy/w36jZ4esN
	BQbp2P2s6X0pHVfn5qnDgE
X-Google-Smtp-Source: AGHT+IGcIhIZzFLFERqqOIWA4blh7/2tLrno9LJ0vWHdSq4baD/dSuxfcH7DJ7IzJv9TkLpbDdbxqg==
X-Received: by 2002:a05:6a20:7d9c:b0:34e:63bd:81b9 with SMTP id adf61e73a8af0-34f841102e6mr5836279637.24.1762374283997;
        Wed, 05 Nov 2025 12:24:43 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd52afesm294640b3a.18.2025.11.05.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:24:43 -0800 (PST)
Date: Wed, 5 Nov 2025 12:24:41 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, jim.shu@sifive.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	Zong Li <zong.li@sifive.com>,
	Michael Ellerman <mpe@tenstorrent.com>
Subject: Re: [PATCH v22 00/28] riscv control-flow integrity for usermode
Message-ID: <aQuyiVdxyqWNooJ5@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_122447_552518_F21B9507 
X-CRM114-Status: GOOD (  23.37  )
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

On Tue, Nov 04, 2025 at 05:34:11PM +1030, Joel Stanley wrote:
>Hello Deepak,
>
>On Fri, 24 Oct 2025 at 03:31, Deepak Gupta via B4 Relay
><devnull+debug.rivosinc.com@kernel.org> wrote:
>>
>> v22: fixing build error due to -march=3Dzicfiss being picked in gcc-13 a=
nd above
>> but not actually doing any codegen or recognizing instruction for zicfis=
s.
>> Change in v22 makes dependence on `-fcf-protection=3Dfull` compiler flag=
 to
>> ensure that toolchain has support and then only CONFIG_RISCV_USER_CFI wi=
ll be
>> visible in menuconfig.
>
>Following our discussion at the riscv summit I spent some time with
>this patch set with the goal of giving a test run on emulation. I only
>got as far as qemu, as I couldn't get the selftests passing there.
>
>I had trouble running the podman container so I built a toolchain
>using the riscv-gnu-toolchain branch (cfi-dev, d19f3009f6c2) you
>pointed to.
>
>The opensbi branch was a bit old and wouldn't build with GCC 15, so I
>tried to rebase and noticed the patches were already upstream. Have
>you tested using v1.7 (or newer) there? Is there something I missed,
>do we need more patches on upstream opensbi?
>
>I booted it in qemu 10.1.2 with the zicfi extensions both on and off.
>
>qemu-system-riscv64 -M virt,aia=3Daplic-imsic,aia-guests=3D5 \
>  -cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue
>  -smp 8 -nographic -bios fw_dynamic.elf
>  -m 1024M -kernel arch/riscv/boot/Image \
>  -initrd selftests/selftests.cpio \
>  -append 'init=3Dmini-init command=3D"cfitests"'
>
>My results:
>
>no zicfi, no z*mop (crash, as expected):
>-------------------------------------------------
>
>Running command: cfitests
>system_opcode_insn: Invalid opcode for CSR read/write instruction[
>0.462709] cfitests[85]: unhandled signal 4 code 0x1 at
>0x0000000000011c44 in cfitests[1c44,10000+6d000]
>[    0.463141] CPU: 4 UID: 0 PID: 85 Comm: cfitests Not tainted
>6.18.0-rc3-tt-defconfig-jms-00090-g6e2297f1edbc #93 NONE
>[    0.463338] Hardware name: riscv-virtio,qemu (DT)
>[    0.463573] epc : 0000000000011c44 ra : 00000000000104e0 sp :
>00007fffebd0ddb0
>...
>[    0.465177] status: 0000000200004020 badaddr: 00000000ce104073
>cause: 0000000000000002
>[    0.465410] Code: 0893 05d0 4501 0073 0000 b7f5 4501 b7f9 0017 0000
>(4073) ce10
>
>no zicfi, z*mop (failed to start, as expected):
>-----------------------------------------------------------
>
>Running command: cfitests
>TAP version 13
># Starting risc-v CFI tests
>Bail out! Get landing pad status failed with -22
>
>zicfi, z*mop (failed to start, unexpected):
>-------------------------------------------------------
>Running command: cfitests
>TAP version 13
># Starting risc-v CFI tests
>Bail out! Get landing pad status failed with -22
>
>I went digging to see why the zicfi enabled kernel failed. The
>userspace binary was built with CFI:
>
>$ riscv64-unknown-linux-gnu-readelf -n selftests/cfitests
>
>Displaying notes found in: .note.gnu.property
>  Owner                Data size     Description
>  GNU                  0x00000010    NT_GNU_PROPERTY_TYPE_0
>      Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>
>I then tested your opensbi tree with some hacks to get it built with a
>newer compiler. This produced different results, which was unexpected:
>
>Running command: cfitests
>TAP version 13
># Starting risc-v CFI tests
>Bail out! Landing pad is not enabled, should be enabled via glibc
># Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>
>The selftest binary and the little toy init that starts it are both
>statically linked and built against the toolchain's glibc, so I would
>expect this to work.
>
>$ riscv64-unknown-linux-gnu-readelf -n sifive-cfi-build/sysroot/usr/lib/li=
bc.a
>
>File: sifive-cfi-build/sysroot/usr/lib/libc.a(init-first.o)
>
>Displaying notes found in: .note.gnu.property
>  Owner                Data size        Description
>  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>      Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>
>The kernel seems to have detected that CFI is available and is built with =
it:
>
>$ grep CFI .config
>CONFIG_RISCV_USER_CFI=3Dy
>CONFIG_ARCH_SUPPORTS_CFI=3Dy
>
>I did notice the func-sig-dev gcc branch is a few commits ahead of
>what the sifive riscv-gnu-toolchain points to.
>
>I had to context switch to some other tasks at this point. I wanted to
>do some more digging to work out what was wrong, but I haven't found
>time, so here are my notes in the hope that they are useful. I'll let
>you know if I discover anything further.


I have it working on my end with latest upstream opensbi (no hacks, same
compiler)

"""
$ git log
commit 38a6106b1099646f25657bba53cefb80886721a7 (HEAD -> master, origin/mas=
ter, origin/HEAD)
Author: Beno=EEt Monin <benoit.monin@bootlin.com>
Date:   Mon Oct 27 14:12:17 2025 +0100

     lib: utils/ipi: mswi: add MIPS P8700 compatible
....
"""

I am surprised that change of compiler on opensbi changed errorcode for use=
rspace
in your setup. That's quite bizarre.

Output from cfitests (with toolchain that's on docker. I didn't compile from
cfi-dev branch).

# /mnt/cfitests
TAP version 13
# Starting risc-v tests
# Landing pad and shadow stack are enabled for binary
# cfi_ptrace_test, ptrace test succeeded
# Executing RISC-V shadow stack self tests
1..5
# Exercising shadow stack fork test
# Parent pid 133 and child pid 135
# dummy calls for sspush and sspopchk in context of parent
# Spewing out shadow stack ptr: 7fffbf4a9fb8
   This is to ensure shadow stack is indeed enabled and working
# Waiting on child to finish
# dummy calls for sspush and sspopchk in context of child
# Spewing out shadow stack ptr: 7fffbf4a9fb8
   This is to ensure shadow stack is indeed enabled and working
ok 1 shstk fork test
# Exercising shadow stack map test
ok 2 map shadow stack syscall
# Exercising shadow stack gup tests
ok 3 shadow stack gup tests
# Exercising shadow stack signal test
ok 4 shadow stack signal tests
# Exercising shadow stack protection test (WPT)
ok 5 memory protections of shadow stack memory
# Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0
#

Is there a place where I can grab your kselftest `cfitests` binary?

Only difference I can see is that `cfitests` in my case is not statically
compiled

"""
$ riscv64-unknown-linux-gnu-readelf -d /scratch/debug/sources/spectacles/cf=
itests | grep NEEDED
  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

"""

>
>Cheers,
>
>Joel
>
>
>> How to test this series
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Toolchain
>> ---------
>> $ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
>> $ riscv-gnu-toolchain/configure --prefix=3D<path-to-where-to-build> --wi=
th-arch=3Drv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extra=
-multilib-test=3D"rv64gc_zicfilp_zicfiss-lp64d:-static"
>> $ make -j$(nproc)
>>
>> Qemu
>> ----
>> Get the lastest qemu
>> $ cd qemu
>> $ mkdir build
>> $ cd build
>> $ ../configure --target-list=3Driscv64-softmmu
>> $ make -j$(nproc)
>>
>> Opensbi
>> -------
>> $ git clone git@github.com:deepak0414/opensbi.git -b v6_cfi_spec_split_o=
pensbi
>> $ make CROSS_COMPILE=3D<your riscv toolchain> -j$(nproc) PLATFORM=3Dgene=
ric
>>
>> Linux
>> -----
>> Running defconfig is fine. CFI is enabled by default if the toolchain
>> supports it.
>>
>> $ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/bu=
ild/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
>> $ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/bu=
ild/bin/riscv64-unknown-linux-gnu- -j$(nproc)
>>
>> Running
>> -------
>>
>> Modify your qemu command to have:
>> -bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.b=
in
>> -cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
