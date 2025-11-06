Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75410CCFA0D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gBRYU2Q/0GiFnT6NUwYI7S52iTVpY/ZUjg8rpzPlQY=; b=UDjaSvZmhWYi/Jo3qmS9cRJ/nz
	2tvfNELj2th6MTf0YnbG3OR5CSs2wwqpV24GhQxy+gPJSHpYCJ96OtofK46VW/gN/Neh/i7sTVp89
	B31VlkbgVvSFbSAjpkuWjDd2Z23ROZfgXHGPkQP7KxVGyH/X5ox0E8Fcb1eFM0D8ZcHvHdyAQCjUC
	tZBkANCaRerIa4KcdWAGElIep+jF6IWLfNFIqnSmz1ZY5m4SplwmIc4uX5E7pIUj25lqyOEz548DU
	xdMR0qv0X1zK2wnHr2I1JSKQCSX77X7BvqB77Pv4ap+Lu2A88B7RRMmJQoyaeZVHnMQISXNN8GIXv
	HUEQIoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGp0M-0000000Ehyc-3pRG;
	Thu, 06 Nov 2025 01:41:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGp0J-0000000EhxR-3Tel
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 01:41:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7afddf8961cso75064b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 17:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762393295; x=1762998095; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/3UjQKHjbZCL5wy1WwIWDTYJrWZHVr72uF4GmKOjZk=;
        b=QGhJh8fYu0VsL0M8h/MgB7R2bACVYkFhMNjWoZ4rnV4wmkHkwelTnN4gpZVZprqzol
         dok/eTLTKum1jbrySwAxQNdBjX270hsX2C4Ux7lHrqza1Mr7KsqZCa2cDy4cl+eS4xRe
         aQYlVhJYjCmf3lxT846EBmdnE+5gblmxFlhPzowQfa5EqDYBlQNUmKjNP4LR5WP/o00F
         X7DTOyAjHi9K8EDmhgIWkcj9/NqEDpgEWs4NF+w3nnDY0xPNoL92tqC53Ga5BLS2Bp0u
         3I9+afUKKpa+jx2cS76hLePDi6Uoeryp7PVBdc2qcpjCT0oQwD9CfEE6RXiEhw4LeZgK
         sF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762393295; x=1762998095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/3UjQKHjbZCL5wy1WwIWDTYJrWZHVr72uF4GmKOjZk=;
        b=l04pBxA8ieQhuA5jm+1aE7JYGCD3UlnvxrshswxQM4Ot7LcaqKZJ/wqUw0oM7O6HVO
         J9asKVTlUhA6P8DxTJYokGqj6OroCKaGVs0hT8vKZttj8jKEUUcTdupQ+CCxNYjG6kPm
         fTPdb4tE1J79MwHb592p4vm/9/yqEoGrs1NoLekC/C0blV53oNsItUc3Z+k8F19iSPUN
         JI6X1SY78e2tD60QnvYjdi9EYfR7w6EiFv7o+Z6591j2fsJEosasUnck3rg71x/FSQ2W
         PyPQMUObUykvFyWrO8g6WBqKrPBHGeLCmS9BbZDLutie6vqeUxpY9bbf/NDmEdyDYlNM
         QuYw==
X-Forwarded-Encrypted: i=1; AJvYcCW0vsIZFs1yzLxmgLK66Ht6TtQg0U2pf08QmoinX1EicPBfosJvjHeTvG0B+l3WVHhTVRqLdAF3xUWkSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YztaE5WdCxwac2xACl0iEXVttq5M8f/pRJRCwMsX3SRGIQhSQfd
	IfnfV2wWT6qC560BPEZ7ZZuqOAQIgCZJDgLW+Wg5MEsjUvi3miy+xEw0ZpysCHeT/1w=
X-Gm-Gg: ASbGncsvg8oZ8NF+aZrGvpDSvYAzNMuyd7EIq+xs31Dc3CbW8+nQ1EErcjA5g2Qjsxr
	Awp6PUizdaGR7VxneabuQIRxxgA3876PRxfHDqb1M4jttD7g2Mc+wPIA6+Z40mve7PDc04TIEKW
	13XJxxWKTWZm0UVm2i48tOA4SN+f09kKu7dl6D3QBJaddALwA+ofTso9M82/NcCIkJyd4lsWJsJ
	sr34CVGYUBpDLtELlUmGiD3Wjx8j1ZuMkA50ewyO6c1yBK2C7cw0ErtjerwXRZ3zm3PHdghJ5Ej
	W+R8ExswOFNAfeThBWyVV4WzLXqYdmEJ3ZiG4VhT/8W3mgOlsnmIKAkfCxUBhDXd/bWW0P8wkDn
	ezfu6c1VohroGTbtFIAI1c5/L7hHdaghp943Ubee5W8OXS9j2RxTwdOLqgfKW9uW/1q0s3n1S9K
	pqes/X9KQlng==
X-Google-Smtp-Source: AGHT+IHb6Ti5gRD7k0lGBKumYHqpCWBANzpfFHQwxKBBfPve3TqFgn6597YsxofzbM/0CWKlQIfmXQ==
X-Received: by 2002:a05:6a20:9155:b0:340:4bb7:8d11 with SMTP id adf61e73a8af0-34f86113dbamr7105999637.48.1762393294562;
        Wed, 05 Nov 2025 17:41:34 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d05c970dsm574481a91.19.2025.11.05.17.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:41:34 -0800 (PST)
Date: Wed, 5 Nov 2025 17:41:32 -0800
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
	Zong Li <zong.li@sifive.com>, Jesse Huang <jesse.huang@sifive.com>,
	Michael Ellerman <mpe@tenstorrent.com>
Subject: Re: [PATCH v22 00/28] riscv control-flow integrity for usermode
Message-ID: <aQv8zMHs0WnKlNwj@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
 <aQuyiVdxyqWNooJ5@debug.ba.rivosinc.com>
 <aQu-o1-e6FK1dByM@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQu-o1-e6FK1dByM@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_174136_160702_CDDCA383 
X-CRM114-Status: GOOD (  22.42  )
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

On Wed, Nov 05, 2025 at 01:16:19PM -0800, Deepak Gupta wrote:
>On Wed, Nov 05, 2025 at 12:24:41PM -0800, Deepak Gupta wrote:
>>On Tue, Nov 04, 2025 at 05:34:11PM +1030, Joel Stanley wrote:
>>>Hello Deepak,
>>>
>>>On Fri, 24 Oct 2025 at 03:31, Deepak Gupta via B4 Relay
>>><devnull+debug.rivosinc.com@kernel.org> wrote:
>>>>
>>>>v22: fixing build error due to -march=3Dzicfiss being picked in gcc-13 =
and above
>>>>but not actually doing any codegen or recognizing instruction for zicfi=
ss.
>>>>Change in v22 makes dependence on `-fcf-protection=3Dfull` compiler fla=
g to
>>>>ensure that toolchain has support and then only CONFIG_RISCV_USER_CFI w=
ill be
>>>>visible in menuconfig.
>>>
>>>Following our discussion at the riscv summit I spent some time with
>>>this patch set with the goal of giving a test run on emulation. I only
>>>got as far as qemu, as I couldn't get the selftests passing there.
>>>
>>>I had trouble running the podman container so I built a toolchain
>>>using the riscv-gnu-toolchain branch (cfi-dev, d19f3009f6c2) you
>>>pointed to.
>>>
>>>The opensbi branch was a bit old and wouldn't build with GCC 15, so I
>>>tried to rebase and noticed the patches were already upstream. Have
>>>you tested using v1.7 (or newer) there? Is there something I missed,
>>>do we need more patches on upstream opensbi?
>>>
>>>I booted it in qemu 10.1.2 with the zicfi extensions both on and off.
>>>
>>>qemu-system-riscv64 -M virt,aia=3Daplic-imsic,aia-guests=3D5 \
>>>-cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue
>>>-smp 8 -nographic -bios fw_dynamic.elf
>>>-m 1024M -kernel arch/riscv/boot/Image \
>>>-initrd selftests/selftests.cpio \
>>>-append 'init=3Dmini-init command=3D"cfitests"'
>>>
>>>My results:
>>>
>>>no zicfi, no z*mop (crash, as expected):
>>>-------------------------------------------------
>>>
>>>Running command: cfitests
>>>system_opcode_insn: Invalid opcode for CSR read/write instruction[
>>>0.462709] cfitests[85]: unhandled signal 4 code 0x1 at
>>>0x0000000000011c44 in cfitests[1c44,10000+6d000]
>>>[    0.463141] CPU: 4 UID: 0 PID: 85 Comm: cfitests Not tainted
>>>6.18.0-rc3-tt-defconfig-jms-00090-g6e2297f1edbc #93 NONE
>>>[    0.463338] Hardware name: riscv-virtio,qemu (DT)
>>>[    0.463573] epc : 0000000000011c44 ra : 00000000000104e0 sp :
>>>00007fffebd0ddb0
>>>...
>>>[    0.465177] status: 0000000200004020 badaddr: 00000000ce104073
>>>cause: 0000000000000002
>>>[    0.465410] Code: 0893 05d0 4501 0073 0000 b7f5 4501 b7f9 0017 0000
>>>(4073) ce10
>>>
>>>no zicfi, z*mop (failed to start, as expected):
>>>-----------------------------------------------------------
>>>
>>>Running command: cfitests
>>>TAP version 13
>>># Starting risc-v CFI tests
>>>Bail out! Get landing pad status failed with -22
>>>
>>>zicfi, z*mop (failed to start, unexpected):
>>>-------------------------------------------------------
>>>Running command: cfitests
>>>TAP version 13
>>># Starting risc-v CFI tests
>>>Bail out! Get landing pad status failed with -22
>>>
>>>I went digging to see why the zicfi enabled kernel failed. The
>>>userspace binary was built with CFI:
>>>
>>>$ riscv64-unknown-linux-gnu-readelf -n selftests/cfitests
>>>
>>>Displaying notes found in: .note.gnu.property
>>>Owner                Data size     Description
>>>GNU                  0x00000010    NT_GNU_PROPERTY_TYPE_0
>>>    Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>>>
>>>I then tested your opensbi tree with some hacks to get it built with a
>>>newer compiler. This produced different results, which was unexpected:
>>>
>>>Running command: cfitests
>>>TAP version 13
>>># Starting risc-v CFI tests
>>>Bail out! Landing pad is not enabled, should be enabled via glibc
>>># Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>
>Ok so I think atleast I have narrowed down the issue. It seems like
>something is going on with how libc will initialize cfi in case of
>static compile.
>I enabled logging whenever prctl set/get are called and my rootfs
>binaries which are all dynamically linked are setting cfi prctls
>correctly. Except when I run statically compiled `cfitest`. It bails
>on "Shadow stack is not enabled" (unlike in your case where it bails
>saying landing pad is not enabled).

I think I have figured out why its happening on my end.
In case of, riscv-gnu-toolchain's "cfi-dev" branch's glibc submodule
is not setting rest of the parameters for prctl to `0` (for static compile)
https://github.com/sifive/riscv-glibc/blob/20b27db7d9aa8f25419b0cbaf62004e5=
3713315e/sysdeps/riscv/libc-start.h#L73

Kernel will reject the prctl for cfi set/get, if any of the not required
parameter is set to `0`.

Although latest glibc patches from Jesse on libc-alpha do that correctly
https://public-inbox.org/libc-alpha/20251027042634.2665717-8-jesse.huang@si=
five.com/T/#u

>
>Shortlog
>"""
>Welcome to Buildroot
>buildroot login: root
>[   51.361564] login[129]: arch_set_shadow_stack_status set successfully, =
shadow stack base 7fffbb977000size 800000
>[   51.362708] login[129]: arch_set_indir_br_lp_status set successfully
>[   51.363805] login[129]: arch_get_indir_br_lp_status called
>[   51.364296] login[129]: arch_get_shadow_stack_status called
>[   51.448918] bash[129]: arch_set_shadow_stack_status set successfully, s=
hadow stack base 7fff9b516000size 800000
>[   51.450030] bash[129]: arch_set_indir_br_lp_status set successfully
>[   51.450568] bash[129]: arch_get_indir_br_lp_status called
>[   51.451047] bash[129]: arch_get_shadow_stack_status called
>[   51.552710] id[130]: arch_set_shadow_stack_status set successfully, sha=
dow stack base 7fff7fa2a000size 800000
>[   51.553798] id[130]: arch_set_indir_br_lp_status set successfully
>[   51.554306] id[130]: arch_get_indir_br_lp_status called
>[   51.554757] id[130]: arch_get_shadow_stack_status called
># mount -t 9p -o trans=3Dvirtio,version=3D9p2000.L host0 /mnt
>[   65.484939] mount[131]: arch_set_shadow_stack_status set successfully, =
shadow stack base 7fffa71a0000size 800000
>[   65.487002] mount[131]: arch_set_indir_br_lp_status set successfully
>[   65.488482] mount[131]: arch_get_indir_br_lp_status called
>[   65.489346] mount[131]: arch_get_shadow_stack_status called
># /mnt/cfitests
>[   74.235075] cfitests[132]: arch_set_indir_br_lp_status set successfully
>[   74.249763] cfitests[132]: arch_get_indir_br_lp_status called
>[   74.250823] cfitests[132]: arch_get_shadow_stack_status called
>TAP version 13
># Starting risc-v tests
>[   74.374286] cfitests[132]: arch_get_indir_br_lp_status called
>[   74.375497] cfitests[132]: arch_get_shadow_stack_status called
>Bail out! Shadow stack is not enabled, should be enabled via glibc
># Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>#
>"""
>
>Full log (with cfi prctls get/set) of boot at pastebin below
>https://pastebin.com/JbX2Yv5W
>
>CCed: Jesse Huang who is leading glibc patches. Can help us figure out
>why statically compiled binaries are failing to set cfi prctls appropriate=
ly.
>
>Paul,
>
>Given that it's not an issue in kernel changes, we should still be going a=
head
>with it for 6.19
>
>>>
>>>The selftest binary and the little toy init that starts it are both
>>>statically linked and built against the toolchain's glibc, so I would
>>>expect this to work.
>>>
>>>$ riscv64-unknown-linux-gnu-readelf -n sifive-cfi-build/sysroot/usr/lib/=
libc.a
>>>
>>>File: sifive-cfi-build/sysroot/usr/lib/libc.a(init-first.o)
>>>
>>>Displaying notes found in: .note.gnu.property
>>>Owner                Data size        Description
>>>GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>>>    Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>>>
>>>The kernel seems to have detected that CFI is available and is built wit=
h it:
>>>
>>>$ grep CFI .config
>>>CONFIG_RISCV_USER_CFI=3Dy
>>>CONFIG_ARCH_SUPPORTS_CFI=3Dy
>>>
>>>I did notice the func-sig-dev gcc branch is a few commits ahead of
>>>what the sifive riscv-gnu-toolchain points to.
>>>
>>>I had to context switch to some other tasks at this point. I wanted to
>>>do some more digging to work out what was wrong, but I haven't found
>>>time, so here are my notes in the hope that they are useful. I'll let
>>>you know if I discover anything further.
>>
>>
>>I have it working on my end with latest upstream opensbi (no hacks, same
>>compiler)
>>
>>"""
>>$ git log
>>commit 38a6106b1099646f25657bba53cefb80886721a7 (HEAD -> master, origin/m=
aster, origin/HEAD)
>>Author: Beno=EEt Monin <benoit.monin@bootlin.com>
>>Date:   Mon Oct 27 14:12:17 2025 +0100
>>
>>   lib: utils/ipi: mswi: add MIPS P8700 compatible
>>....
>>"""
>>
>>I am surprised that change of compiler on opensbi changed errorcode for u=
serspace
>>in your setup. That's quite bizarre.
>>
>>Output from cfitests (with toolchain that's on docker. I didn't compile f=
rom
>>cfi-dev branch).
>>
>># /mnt/cfitests
>>TAP version 13
>># Starting risc-v tests
>># Landing pad and shadow stack are enabled for binary
>># cfi_ptrace_test, ptrace test succeeded
>># Executing RISC-V shadow stack self tests
>>1..5
>># Exercising shadow stack fork test
>># Parent pid 133 and child pid 135
>># dummy calls for sspush and sspopchk in context of parent
>># Spewing out shadow stack ptr: 7fffbf4a9fb8
>> This is to ensure shadow stack is indeed enabled and working
>># Waiting on child to finish
>># dummy calls for sspush and sspopchk in context of child
>># Spewing out shadow stack ptr: 7fffbf4a9fb8
>> This is to ensure shadow stack is indeed enabled and working
>>ok 1 shstk fork test
>># Exercising shadow stack map test
>>ok 2 map shadow stack syscall
>># Exercising shadow stack gup tests
>>ok 3 shadow stack gup tests
>># Exercising shadow stack signal test
>>ok 4 shadow stack signal tests
>># Exercising shadow stack protection test (WPT)
>>ok 5 memory protections of shadow stack memory
>># Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0
>>#
>>
>>Is there a place where I can grab your kselftest `cfitests` binary?
>>
>>Only difference I can see is that `cfitests` in my case is not statically
>>compiled
>>
>>"""
>>$ riscv64-unknown-linux-gnu-readelf -d /scratch/debug/sources/spectacles/=
cfitests | grep NEEDED
>>0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>>
>>"""
>>
>>>
>>>Cheers,
>>>
>>>Joel
>>>
>>>
>>>>How to test this series
>>>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>>Toolchain
>>>>---------
>>>>$ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
>>>>$ riscv-gnu-toolchain/configure --prefix=3D<path-to-where-to-build> --w=
ith-arch=3Drv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extr=
a-multilib-test=3D"rv64gc_zicfilp_zicfiss-lp64d:-static"
>>>>$ make -j$(nproc)
>>>>
>>>>Qemu
>>>>----
>>>>Get the lastest qemu
>>>>$ cd qemu
>>>>$ mkdir build
>>>>$ cd build
>>>>$ ../configure --target-list=3Driscv64-softmmu
>>>>$ make -j$(nproc)
>>>>
>>>>Opensbi
>>>>-------
>>>>$ git clone git@github.com:deepak0414/opensbi.git -b v6_cfi_spec_split_=
opensbi
>>>>$ make CROSS_COMPILE=3D<your riscv toolchain> -j$(nproc) PLATFORM=3Dgen=
eric
>>>>
>>>>Linux
>>>>-----
>>>>Running defconfig is fine. CFI is enabled by default if the toolchain
>>>>supports it.
>>>>
>>>>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/b=
uild/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
>>>>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/b=
uild/bin/riscv64-unknown-linux-gnu- -j$(nproc)
>>>>
>>>>Running
>>>>-------
>>>>
>>>>Modify your qemu command to have:
>>>>-bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.=
bin
>>>>-cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
