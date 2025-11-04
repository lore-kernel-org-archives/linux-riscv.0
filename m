Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B8CCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 21:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bh409TdeORIJvlsW88LCH8oew+nLoZOe9z36AomzUhA=; b=3SSn1An0KBeZtH0M0OPDUnLziA
	ynZN1XBG0QsXN1OV/vEFqkDFL48CY/j/DxOmpYGoaknnHI1VVcOdxXx/XBQ4BrSPADxv2M0AGPcv5
	p/Oo41F321slrlEV05JkRlXIFy812CBm9USPBbD6Dv4R4pOit5ewIlT4gFETcB1SKDi2VkCMOZzJb
	YeRBufU3REzkboCO8AcGqZqoizhOzHDbIpGnGd/Unk/ngpHv4oE+49InJUcKSFGScPyXQsAE0Canm
	aea7QPoKghDcBr7BmQRqxlLCm/bUzMfOFVS86ZI0vt42Bs1Bozcf+YnqypzV83d6N/C2lvrkchTdt
	DZRrpdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGOPR-0000000CaZJ-12fc;
	Tue, 04 Nov 2025 21:17:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGOPM-0000000CaYS-3eeN
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 21:17:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2955623e6faso36412065ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 13:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762291060; x=1762895860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGjWT2vMzqtOZS9xN5d6Q0YRIr9cvpctAWp7WzNW7AA=;
        b=dFtpBRFSTaIuP+6334VqODAa8YopCiSWXUXkvjjlAPAVUZU/ZWvCrWqw3QKb4iMeq3
         Dn40Rq/v1KflgZHU0xgGw67SHXukohlyU0X+yxXRv1g5aAGWdHtFLo81rLXF6PaWqRVN
         lY11PywFnR6unZRFCAIcnhf/+tLbnU2S4UMTeRSwPjU7kkLFQurqKcjsRqnSnGsDIsmq
         uQXiUCG+AYLV8supV5VnsPtfJacivhUgs8MhHrYaGW2/j1shOQzRiKdOSw8IFtBt/6Zc
         g4l48PjkmAaWjGj97O/HlchQ8KB1hXJaDr2N/r3wEBG5i5anHXeWicztsm0U4zPBE8xT
         OzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762291060; x=1762895860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGjWT2vMzqtOZS9xN5d6Q0YRIr9cvpctAWp7WzNW7AA=;
        b=FAf/eamWh3CpMKdDi87EFvUma6e5ITPJxiQBaVH9DUH3EPQISSYszP6SncY81LoKAl
         hS1Ne2cVZQFXftEVXlNLA7hQK2lOlmqIq08z+s2psNNw7h+7DPyNF84Pc4hIZnzTYj3F
         BSgmlpab0g5/Q14ns8ymk+3Fndle389Cl7IZRlL0T6fMxEfoz/WZEfKF2symMFCTPfKW
         tm0sgHPXmU9Q1l/vwfdm/AgGOfmO5RAFaEQCS+qwmZypHI2b/6dDzFjMJhk3v06AZirH
         1Xa+3SZVoLCooaMW1XfOAz8MeW1QTDhvKYhSCYK5J3vTBRfJ7tJJ3XzZk9U9lW1EHJtg
         MFNw==
X-Forwarded-Encrypted: i=1; AJvYcCXG3wHcUvyCqATA3obWrIf53k+ot/AteWuo4Czyd/kMr3IwjmyeMk3y+gV4WsyIp2QxoJJwqo+6p2EGSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySX8XShCfdEdcdRf1rS7NSZePij+N5HRIq/Wrwm+kVGcO7Ir93
	daD2JOV4Ncc0ZeSIfYDJtwfY2drhypl8PwqnqAH7GWJppAtiTt4ZX5gIowGNKXZuiEI=
X-Gm-Gg: ASbGncvNaCkqTBtEAxrnVOQ6CqLQ/uxO7DHVV1wrdBjDX1zmjy4hiCH3scXq3+5eCNG
	uGMVeqjhTKu2Zfdbt5W8DV/uJkuzhWQfmkKdc6YE+br8SHsli0+ECsJYHd5yNOpHl+lZvsfmzw/
	82UgDlxGTwmU9OEA1GGIUCjf+YwK0RsiqWA+WdsNyLhYQ9IPmvkAH+cSbu5RJb2G8fnrsQOqbz7
	Lp5CUXHELK6ivfrS+I/lOJq22yCYM5RJG+uJfJ4DhlPDSiuDHYyG0HyN5V6o781uQRNOJM/PIg2
	UwEyfJi+oMX5oIv3Yr6mfAwZWx55bDBv09s6VenweXcw2Xy+oPaAV0Q2pkaqX6bqJ62PhasgTFu
	60u/eqrFyMIiWxowaT8FtILF6E3MXY/kVgHasi7OS68CSxOFj7tj/M6SF8SH43z5qYu1kxIfAaW
	kr2edmT/lPSg7Hhn8KEqVJ
X-Google-Smtp-Source: AGHT+IH3Rnr9KTQSewiyDJxZYVWcxdCwkU03H2gP4ZOo4Vy5LVvo5/dzAHr56LlVqfHqMMIhppMFyg==
X-Received: by 2002:a17:902:ce01:b0:295:2c8e:8e44 with SMTP id d9443c01a7336-2962ae94470mr13204245ad.59.1762291059617;
        Tue, 04 Nov 2025 13:17:39 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998eb6sm37348165ad.29.2025.11.04.13.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 13:17:39 -0800 (PST)
Date: Tue, 4 Nov 2025 13:17:36 -0800
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
Message-ID: <aQptcHayBOY1sw1J@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XeQf9UJuu39bGcm2mySWrKYvUadOgFRmpas+AS9fXA2WA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_131741_050425_73A36DC7 
X-CRM114-Status: GOOD (  24.47  )
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

Hi Joel,

Thanks a lot for testing it out.

Comments inline.

On Tue, Nov 04, 2025 at 05:34:11PM +1030, Joel Stanley wrote:
>Hello Deepak,
>
>On Fri, 24 Oct 2025 at 03:31, Deepak Gupta via B4 Relay
><devnull+debug.rivosinc.com@kernel.org> wrote:
>>
>> v22: fixing build error due to -march=zicfiss being picked in gcc-13 and above
>> but not actually doing any codegen or recognizing instruction for zicfiss.
>> Change in v22 makes dependence on `-fcf-protection=full` compiler flag to
>> ensure that toolchain has support and then only CONFIG_RISCV_USER_CFI will be
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
>qemu-system-riscv64 -M virt,aia=aplic-imsic,aia-guests=5 \
>  -cpu rv64,zicfilp=true,zicfiss=true,zimop=true,zcmop=true
>  -smp 8 -nographic -bios fw_dynamic.elf
>  -m 1024M -kernel arch/riscv/boot/Image \
>  -initrd selftests/selftests.cpio \
>  -append 'init=mini-init command="cfitests"'
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

Opensbi doesn't need to be built with new compiler. All it needs do are
reflect MPELP bit back to S-mode (if its taking a trap and then reflecting
back to S-mode) and ofcourse have SSE support. Both of these are upstream
in opensbi.

I'll test with upstream opensbi, test and report back.

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
>$ riscv64-unknown-linux-gnu-readelf -n sifive-cfi-build/sysroot/usr/lib/libc.a
>
>File: sifive-cfi-build/sysroot/usr/lib/libc.a(init-first.o)
>
>Displaying notes found in: .note.gnu.property
>  Owner                Data size        Description
>  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>      Properties: RISC-V AND feature: CFI_LP_UNLABELED, CFI_SS
>
>The kernel seems to have detected that CFI is available and is built with it:
>
>$ grep CFI .config
>CONFIG_RISCV_USER_CFI=y
>CONFIG_ARCH_SUPPORTS_CFI=y
>
>I did notice the func-sig-dev gcc branch is a few commits ahead of
>what the sifive riscv-gnu-toolchain points to.

Most likely PRCTL_* is not updated in cfi-dev branch? I'll take a look.

>
>I had to context switch to some other tasks at this point. I wanted to
>do some more digging to work out what was wrong, but I haven't found
>time, so here are my notes in the hope that they are useful. I'll let
>you know if I discover anything further.

Thanks once again.
>
>Cheers,
>
>Joel
>
>
>> How to test this series
>> =======================
>>
>> Toolchain
>> ---------
>> $ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
>> $ riscv-gnu-toolchain/configure --prefix=<path-to-where-to-build> --with-arch=rv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extra-multilib-test="rv64gc_zicfilp_zicfiss-lp64d:-static"
>> $ make -j$(nproc)
>>
>> Qemu
>> ----
>> Get the lastest qemu
>> $ cd qemu
>> $ mkdir build
>> $ cd build
>> $ ../configure --target-list=riscv64-softmmu
>> $ make -j$(nproc)
>>
>> Opensbi
>> -------
>> $ git clone git@github.com:deepak0414/opensbi.git -b v6_cfi_spec_split_opensbi
>> $ make CROSS_COMPILE=<your riscv toolchain> -j$(nproc) PLATFORM=generic
>>
>> Linux
>> -----
>> Running defconfig is fine. CFI is enabled by default if the toolchain
>> supports it.
>>
>> $ make ARCH=riscv CROSS_COMPILE=<path-to-cfi-riscv-gnu-toolchain>/build/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
>> $ make ARCH=riscv CROSS_COMPILE=<path-to-cfi-riscv-gnu-toolchain>/build/bin/riscv64-unknown-linux-gnu- -j$(nproc)
>>
>> Running
>> -------
>>
>> Modify your qemu command to have:
>> -bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.bin
>> -cpu rv64,zicfilp=true,zicfiss=true,zimop=true,zcmop=true

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
