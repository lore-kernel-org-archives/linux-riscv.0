Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D59CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK6vdVhL6/w77hhawevSg46L/RCI6GOA8O3HhmL/faI=; b=im0emjYth25jD5tdnk1VDI6rNB
	JzZIIFnYLfVPPLNQiWE3KW/0Tt0R5hfd7vdos5YY2YbbPtqb5NjotTD9AQ6zAmVVynvGZ2PjqP6tw
	VUGti+YlcELn3z1h86NrLPel2nX2aKEDD2SHJcnlF/3eaVZ7xpt4hOJCSX+IcMvPgK2XDTyqjI+cG
	0zQ5daM0G8oUNKsR1kNBtiBZRiEHLYQmpA0863+roDPnqQqeVPRIDKCVixVeT3Q3BmT8rv7TCrTx4
	5Id+n7z0LCS9G92w19Fl8s2xFO6Q24VtZnHWoGPAwdruYSJ6peOiciEiHSI0NhXUzBvt5eHgO5Ikl
	/RvkEXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkrj-0000000ETm4-05bN;
	Wed, 05 Nov 2025 21:16:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkre-0000000ETlV-3OAH
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 21:16:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29470bc80ceso3331675ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762377382; x=1762982182; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D1ax2+b/BmZMbWQLmn1abjqqCYtcXZuyWWUp9gYac88=;
        b=EssCA3a2QrZhCBBcT2XKWLBRwy6XzW4dissXyl+TI/5uts7mLY6HQkPOjUt4UgRE0S
         utg+fZBGMlGenI+KWs7tti54bD5VW2iEsxrXjm6B/0A+8eXLx92fUTDEzn4eKfSuVeEY
         wQj34qQ/6dmccXApU9N4M20zJNs0geUQ+L0llR+f1O/jzySWc+OHm74hK3uGgNN/w/TR
         9ewSJL2lriiuXzZ/7wzuotpXo+oZOXP/5TTDmNsWkwev0Huc9SRNC+7/dhto7FxyOUYf
         P/Mv6ScNb2/TtJUuTDdYNWc2XF7eJmCLnF/lwg5FNqV5Fz3R+oVbq0sw5x0l2XMz0WwV
         pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377382; x=1762982182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1ax2+b/BmZMbWQLmn1abjqqCYtcXZuyWWUp9gYac88=;
        b=B9gIa0RS2OTs4YVEJkCHqpUlQ435tnxFZEeZSSRI5h7qif0niMUisbAFDOCZPnfeZt
         JodwezaNIuzOmzmEv8B5qvOCPcMXp4ItDlvnIaRbEwsVXlDG1az8bfadlRe7666ngDtf
         r9++OPLj8LKUHpJ0LUIjfeqsyxKANs+8m9tMg6NYzWMt2gL8P95g9qfe1+QpVj3YyruO
         3KkLn0M4xhg1ZngKKtzvni/WkXJrTeVRvZrCsvq4LdZgr7KBxnFpK3Kr33fXMnHffDAQ
         wl8EJgvgosMjIKq3o0bD5Hmw9JI3bI4tpNnDZduMSgSFVjeueuY68wuquH0PYD3iXlD1
         gzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE15D6WRNoccSPxNEjcGysUlrGGVHFC4nqgro47kdKz7S+kuI+6htalPetnk/V8S+Qe0bt1QGkYlftsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUIN1rp3Bqzw0eISjL9bTIm+dVrmwLXW9QdLY4PChXNbV1Hl5z
	xOhHuX9v5JNUQiesNwR29WNWHePcDN/8ehiP6TMs3nYWIE8iDCkTOVsQYoanGy/ekHc=
X-Gm-Gg: ASbGncskWbgjdRuF4+19gVg/HuUBQVz5tS5BfzDcSXPDz8hbLwb017CYD4fwiYHnW/b
	67w/E4qhorkbGrXwBSUiKrJOGq0H3vk8vPCf4RpCAjD5qUlv0eyG4QgjoTC9BSegF2gqySne+NR
	F22zyfj9U0BL2qOhjQVLQV9OQ1mlcxQdhYEUVDinocfJzyRysxxuz6vTBND8zLwlrMi6RMelJcm
	dAGvo3feI0Kg85o2ki5nrrDcwtWIZEQK1e89+HTexldbp3gbNH9XdKI0ufna0Ql+SYfLYix8hJT
	YV2sbCe9kaaO8AUoKplxL/YXM+sKFt1kwkeehCv2nyySId4cNSqbP4tAu1CSrYdvUcbA+MX85/m
	nhIPJJEQ6l658K2Sxknba8TXkvKHBQxye1JJQ9nglOMYGttj4Qt+XM0gz6+MxdKdk2hLvyDIzRu
	4QWAoh8/oT7Q==
X-Google-Smtp-Source: AGHT+IGIZBQp5DjsGz3HmRAWZhPw8v6GqkWpZnGJFSt/AXCLpNaQaJyXUplBHQF5DvKtwaSJAHwvDg==
X-Received: by 2002:a17:903:2304:b0:295:557e:7468 with SMTP id d9443c01a7336-2965173831dmr10789365ad.28.1762377381822;
        Wed, 05 Nov 2025 13:16:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682casm4836705ad.22.2025.11.05.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:16:21 -0800 (PST)
Date: Wed, 5 Nov 2025 13:16:19 -0800
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
Message-ID: <aQu-o1-e6FK1dByM@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
 <aQuyiVdxyqWNooJ5@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQuyiVdxyqWNooJ5@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131622_865145_25FBE1FB 
X-CRM114-Status: GOOD (  24.17  )
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

On Wed, Nov 05, 2025 at 12:24:41PM -0800, Deepak Gupta wrote:
>On Tue, Nov 04, 2025 at 05:34:11PM +1030, Joel Stanley wrote:
>>Hello Deepak,
>>
>>On Fri, 24 Oct 2025 at 03:31, Deepak Gupta via B4 Relay
>><devnull+debug.rivosinc.com@kernel.org> wrote:
>>>
>>>v22: fixing build error due to -march=3Dzicfiss being picked in gcc-13 a=
nd above
>>>but not actually doing any codegen or recognizing instruction for zicfis=
s.
>>>Change in v22 makes dependence on `-fcf-protection=3Dfull` compiler flag=
 to
>>>ensure that toolchain has support and then only CONFIG_RISCV_USER_CFI wi=
ll be
>>>visible in menuconfig.
>>
>>Following our discussion at the riscv summit I spent some time with
>>this patch set with the goal of giving a test run on emulation. I only
>>got as far as qemu, as I couldn't get the selftests passing there.
>>
>>I had trouble running the podman container so I built a toolchain
>>using the riscv-gnu-toolchain branch (cfi-dev, d19f3009f6c2) you
>>pointed to.
>>
>>The opensbi branch was a bit old and wouldn't build with GCC 15, so I
>>tried to rebase and noticed the patches were already upstream. Have
>>you tested using v1.7 (or newer) there? Is there something I missed,
>>do we need more patches on upstream opensbi?
>>
>>I booted it in qemu 10.1.2 with the zicfi extensions both on and off.
>>
>>qemu-system-riscv64 -M virt,aia=3Daplic-imsic,aia-guests=3D5 \
>> -cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue
>> -smp 8 -nographic -bios fw_dynamic.elf
>> -m 1024M -kernel arch/riscv/boot/Image \
>> -initrd selftests/selftests.cpio \
>> -append 'init=3Dmini-init command=3D"cfitests"'
>>
>>My results:
>>
>>no zicfi, no z*mop (crash, as expected):
>>-------------------------------------------------
>>
>>Running command: cfitests
>>system_opcode_insn: Invalid opcode for CSR read/write instruction[
>>0.462709] cfitests[85]: unhandled signal 4 code 0x1 at
>>0x0000000000011c44 in cfitests[1c44,10000+6d000]
>>[    0.463141] CPU: 4 UID: 0 PID: 85 Comm: cfitests Not tainted
>>6.18.0-rc3-tt-defconfig-jms-00090-g6e2297f1edbc #93 NONE
>>[    0.463338] Hardware name: riscv-virtio,qemu (DT)
>>[    0.463573] epc : 0000000000011c44 ra : 00000000000104e0 sp :
>>00007fffebd0ddb0
>>...
>>[    0.465177] status: 0000000200004020 badaddr: 00000000ce104073
>>cause: 0000000000000002
>>[    0.465410] Code: 0893 05d0 4501 0073 0000 b7f5 4501 b7f9 0017 0000
>>(4073) ce10
>>
>>no zicfi, z*mop (failed to start, as expected):
>>-----------------------------------------------------------
>>
>>Running command: cfitests
>>TAP version 13
>># Starting risc-v CFI tests
>>Bail out! Get landing pad status failed with -22
>>
>>zicfi, z*mop (failed to start, unexpected):
>>-------------------------------------------------------
>>Running command: cfitests
>>TAP version 13
>># Starting risc-v CFI tests
>>Bail out! Get landing pad status failed with -22
>>
>>I went digging to see why the zicfi enabled kernel failed. The
>>userspace binary was built with CFI:
>>
>>$ riscv64-unknown-linux-gnu-readelf -n selftests/cfitests
>>
>>Displaying notes found in: .note.gnu.property
>> Owner                Data size     Description
>> GNU                  0x00000010    NT_GNU_PROPERTY_TYPE_0
>>     Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>>
>>I then tested your opensbi tree with some hacks to get it built with a
>>newer compiler. This produced different results, which was unexpected:
>>
>>Running command: cfitests
>>TAP version 13
>># Starting risc-v CFI tests
>>Bail out! Landing pad is not enabled, should be enabled via glibc
>># Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

Ok so I think atleast I have narrowed down the issue. It seems like
something is going on with how libc will initialize cfi in case of
static compile.
I enabled logging whenever prctl set/get are called and my rootfs
binaries which are all dynamically linked are setting cfi prctls
correctly. Except when I run statically compiled `cfitest`. It bails
on "Shadow stack is not enabled" (unlike in your case where it bails
saying landing pad is not enabled).

Shortlog
"""
Welcome to Buildroot
buildroot login: root
[   51.361564] login[129]: arch_set_shadow_stack_status set successfully, s=
hadow stack base 7fffbb977000size 800000
[   51.362708] login[129]: arch_set_indir_br_lp_status set successfully
[   51.363805] login[129]: arch_get_indir_br_lp_status called
[   51.364296] login[129]: arch_get_shadow_stack_status called
[   51.448918] bash[129]: arch_set_shadow_stack_status set successfully, sh=
adow stack base 7fff9b516000size 800000
[   51.450030] bash[129]: arch_set_indir_br_lp_status set successfully
[   51.450568] bash[129]: arch_get_indir_br_lp_status called
[   51.451047] bash[129]: arch_get_shadow_stack_status called
[   51.552710] id[130]: arch_set_shadow_stack_status set successfully, shad=
ow stack base 7fff7fa2a000size 800000
[   51.553798] id[130]: arch_set_indir_br_lp_status set successfully
[   51.554306] id[130]: arch_get_indir_br_lp_status called
[   51.554757] id[130]: arch_get_shadow_stack_status called
# mount -t 9p -o trans=3Dvirtio,version=3D9p2000.L host0 /mnt
[   65.484939] mount[131]: arch_set_shadow_stack_status set successfully, s=
hadow stack base 7fffa71a0000size 800000
[   65.487002] mount[131]: arch_set_indir_br_lp_status set successfully
[   65.488482] mount[131]: arch_get_indir_br_lp_status called
[   65.489346] mount[131]: arch_get_shadow_stack_status called
# /mnt/cfitests
[   74.235075] cfitests[132]: arch_set_indir_br_lp_status set successfully
[   74.249763] cfitests[132]: arch_get_indir_br_lp_status called
[   74.250823] cfitests[132]: arch_get_shadow_stack_status called
TAP version 13
# Starting risc-v tests
[   74.374286] cfitests[132]: arch_get_indir_br_lp_status called
[   74.375497] cfitests[132]: arch_get_shadow_stack_status called
Bail out! Shadow stack is not enabled, should be enabled via glibc
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
#
"""

Full log (with cfi prctls get/set) of boot at pastebin below
https://pastebin.com/JbX2Yv5W

CCed: Jesse Huang who is leading glibc patches. Can help us figure out
why statically compiled binaries are failing to set cfi prctls appropriatel=
y.

Paul,

Given that it's not an issue in kernel changes, we should still be going ah=
ead
with it for 6.19

>>
>>The selftest binary and the little toy init that starts it are both
>>statically linked and built against the toolchain's glibc, so I would
>>expect this to work.
>>
>>$ riscv64-unknown-linux-gnu-readelf -n sifive-cfi-build/sysroot/usr/lib/l=
ibc.a
>>
>>File: sifive-cfi-build/sysroot/usr/lib/libc.a(init-first.o)
>>
>>Displaying notes found in: .note.gnu.property
>> Owner                Data size        Description
>> GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>>     Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>>
>>The kernel seems to have detected that CFI is available and is built with=
 it:
>>
>>$ grep CFI .config
>>CONFIG_RISCV_USER_CFI=3Dy
>>CONFIG_ARCH_SUPPORTS_CFI=3Dy
>>
>>I did notice the func-sig-dev gcc branch is a few commits ahead of
>>what the sifive riscv-gnu-toolchain points to.
>>
>>I had to context switch to some other tasks at this point. I wanted to
>>do some more digging to work out what was wrong, but I haven't found
>>time, so here are my notes in the hope that they are useful. I'll let
>>you know if I discover anything further.
>
>
>I have it working on my end with latest upstream opensbi (no hacks, same
>compiler)
>
>"""
>$ git log
>commit 38a6106b1099646f25657bba53cefb80886721a7 (HEAD -> master, origin/ma=
ster, origin/HEAD)
>Author: Beno=EEt Monin <benoit.monin@bootlin.com>
>Date:   Mon Oct 27 14:12:17 2025 +0100
>
>    lib: utils/ipi: mswi: add MIPS P8700 compatible
>....
>"""
>
>I am surprised that change of compiler on opensbi changed errorcode for us=
erspace
>in your setup. That's quite bizarre.
>
>Output from cfitests (with toolchain that's on docker. I didn't compile fr=
om
>cfi-dev branch).
>
># /mnt/cfitests
>TAP version 13
># Starting risc-v tests
># Landing pad and shadow stack are enabled for binary
># cfi_ptrace_test, ptrace test succeeded
># Executing RISC-V shadow stack self tests
>1..5
># Exercising shadow stack fork test
># Parent pid 133 and child pid 135
># dummy calls for sspush and sspopchk in context of parent
># Spewing out shadow stack ptr: 7fffbf4a9fb8
>  This is to ensure shadow stack is indeed enabled and working
># Waiting on child to finish
># dummy calls for sspush and sspopchk in context of child
># Spewing out shadow stack ptr: 7fffbf4a9fb8
>  This is to ensure shadow stack is indeed enabled and working
>ok 1 shstk fork test
># Exercising shadow stack map test
>ok 2 map shadow stack syscall
># Exercising shadow stack gup tests
>ok 3 shadow stack gup tests
># Exercising shadow stack signal test
>ok 4 shadow stack signal tests
># Exercising shadow stack protection test (WPT)
>ok 5 memory protections of shadow stack memory
># Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0
>#
>
>Is there a place where I can grab your kselftest `cfitests` binary?
>
>Only difference I can see is that `cfitests` in my case is not statically
>compiled
>
>"""
>$ riscv64-unknown-linux-gnu-readelf -d /scratch/debug/sources/spectacles/c=
fitests | grep NEEDED
> 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>
>"""
>
>>
>>Cheers,
>>
>>Joel
>>
>>
>>>How to test this series
>>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>>Toolchain
>>>---------
>>>$ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
>>>$ riscv-gnu-toolchain/configure --prefix=3D<path-to-where-to-build> --wi=
th-arch=3Drv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extra=
-multilib-test=3D"rv64gc_zicfilp_zicfiss-lp64d:-static"
>>>$ make -j$(nproc)
>>>
>>>Qemu
>>>----
>>>Get the lastest qemu
>>>$ cd qemu
>>>$ mkdir build
>>>$ cd build
>>>$ ../configure --target-list=3Driscv64-softmmu
>>>$ make -j$(nproc)
>>>
>>>Opensbi
>>>-------
>>>$ git clone git@github.com:deepak0414/opensbi.git -b v6_cfi_spec_split_o=
pensbi
>>>$ make CROSS_COMPILE=3D<your riscv toolchain> -j$(nproc) PLATFORM=3Dgene=
ric
>>>
>>>Linux
>>>-----
>>>Running defconfig is fine. CFI is enabled by default if the toolchain
>>>supports it.
>>>
>>>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/bu=
ild/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
>>>$ make ARCH=3Driscv CROSS_COMPILE=3D<path-to-cfi-riscv-gnu-toolchain>/bu=
ild/bin/riscv64-unknown-linux-gnu- -j$(nproc)
>>>
>>>Running
>>>-------
>>>
>>>Modify your qemu command to have:
>>>-bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.b=
in
>>>-cpu rv64,zicfilp=3Dtrue,zicfiss=3Dtrue,zimop=3Dtrue,zcmop=3Dtrue

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
