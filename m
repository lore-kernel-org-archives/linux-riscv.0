Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7175ACD4F4A
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+i161x4K6Fi15MshWj0ovFnrNA/mymFDK1poHmGDozE=; b=S4q
	yl0NlELrhXvftyeE9NM2YnlKak0LgjQvpkl7sHmGm9DPhXZi/1YYNfkCmuku6bYr8GjygfoCsH3hx
	e0FXbMEuQDi0Lh9BIOlvv0oguFC0bVsdjVmO8xL6aL52qmBVIyDCQ+WDW7Uxa9WvrDyQh/pgxGz9n
	Ava/EBdDAyH9LgTrcgklMLltbgrs+4eW0MVqJqsgQFgQkcNybq/MrDhuSwRewxOidYDfvGbS8+t1k
	7Bj/VkcUuLMhRaZRPNWgBqLepFG8kmK2bgp4PQsCYc4Xg4wMrBQXQex9rCKiKCLfg5t66BjS2eGPc
	9pattLiwF73EcWw160eyYu0jk0B0WuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOecS-0000000D2pz-0N3u;
	Sun, 17 May 2026 16:45:36 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOecP-0000000D2pW-0yoy
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 16:45:34 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8c64d635955so16473516d6.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 09:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779036331; cv=none;
        d=google.com; s=arc-20240605;
        b=GIZytb6GKhrXrPNAZUotXaie6tUUlctaXHH1modFLH8MVnpJ6XLVBlr/pYRXjnMq9H
         Caa6GSSeKQY2dADfs+Eg2O3+YDIlRuCeIMHCz2DZNzPp87g1c/rEUHmAkW8odLh+H4g3
         Fx8qGksm2UaJvRmZFhlsJP7KklK9Hh7lcBgXvYF02sEWwPGHyApYNLJgXce/3K0nzgSx
         7JDuMxMgk7QCWlhcOBEQ07MfHEO258nNpIr+y0+tdoBnUBeb6aEKx99OSmU18RBe0Onw
         sUJGUOg0M0VFeRZMxJBrSwGtFAJFFul2IYNfhYd3R21NZHMgAZuUnJSFvH9dzc5m+BDP
         LefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xymyF3u7oNf+yC7j2TPencgmrSv/UEKl3kOUyYCuH1k=;
        fh=74Mq1Xx4STYqpqU1Ef/51O6BfKYnRl9S7UnEub4nl/w=;
        b=OmzpVaMIQIjOfbnQ+CU2nvrTR3wtiDR9xs3OlUxYz9hbievWLHdoRKJHkT9RcZvGoJ
         lOUMbNboeBqBM2FsLobzbDf7upVrwvXCfGwR2kJCz5XyAlN6v1WtptBDfCUoCKrfnwca
         AoNdzG6aYRzx1u1CK0PseQ6/OjBsfWRT9EKRW4MjojgZvuoT5USiFJIkG9oqNyrd3WOd
         qmoBk6sjLva7bYaqidOWbX/fD6XC+BZ/rdSw7BTIEtPSHcRbUpNgNMkhWAnFapRw7sFg
         p7uBLBZKrd6StIxJpUPknCAdhwHPOS1LwbQwm9fZyMdPB77UIcKXyfb9/d3sZ0u/fTi7
         o38Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779036331; x=1779641131; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xymyF3u7oNf+yC7j2TPencgmrSv/UEKl3kOUyYCuH1k=;
        b=RcnHe3pwMxUO9QZrFWTPZLFG2q69VeRA/G8AkKHfqsuDl9qM2lTWl1WZyP9kddJH9g
         kYOe7yZKwE/O93Q2jSiq6ST2OhcQXkxqmcvCnHsLbLLCBK0DMrMPbm0mZhLBBSPGMxmW
         0EvkGS9sStJTkgPkp1PtiEQmh6vPOQSvmna08s3znLaihKxuvYqf42quzjAfU7Y9UpCX
         Wn6tjf7H1hwIQnp/w7WiI9s8Egfflm4JEYyx0Lky8HjFU47JkJdgSEumMWZJ+TOsFPyC
         IcMQKbjVWQmMqhxKihlGVro7pHflSdO2QxhbkPyi1hHwlexy7Bh5HtQJI0KEkpZ15xq+
         9Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779036331; x=1779641131;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xymyF3u7oNf+yC7j2TPencgmrSv/UEKl3kOUyYCuH1k=;
        b=e+wwfkaNNw6uR2rQV4m0sp77ez6r/tamiQUUKksGP1x1aSeg/020KEQQOXB5UgECBV
         zYXQvqWAviDgJ4uKBwr18ViGjKEoNhuv01yLdMnOFpZFFtq867ti3p+9Y/Tecpgb07ny
         Agqs5M28KBRcMztudgP/bMbR200N1EvtiDDn0R18U21orGoI44BSsE+pisZRuI+F8qJA
         H/B7CzyzaBBXhSkI2szUJ/1vmw+re6Ps8jGnJZy05L53JxDEw9yuUaYSsZItb4kuqw42
         twyx7aYdZLPSOMd4PrlkdmQiXlQ6ckGrzwv3hmcPUg3P84secLS5H9YjLP6ahZBIQl8K
         DcrA==
X-Gm-Message-State: AOJu0Yz9sU+QTaHE9XvUzdPm1Om43BQdgOkENchBR39jvlTmEXfRwIIF
	9Zm5IB2E2tcFJfAiY4e6GzRZjnXEd5ILGTVQBOHGlCsPy5+nBD2mfR2WXa/KNUq52R8UXxSkWCV
	kbc7gK23Gj3c6yTMLpaSvB/9Popapsx3/ZK6a
X-Gm-Gg: Acq92OE0VFh1Bs/aXTlLM2CKeF7uEtcrNilBoDL+pmlMdGFDGn3jMEyfKHrgcQ8l632
	dl2q0XNBzqc4K4yX67nwSFQnoAzOGSQqWYsDl1QjVJ85Tp1tjOsA7JDOF1Cpyj+bgKYFLP5Hxxp
	tiwA5CwBP9sFC/NuwdzRl2Zh1kyvlMTyraWTh3P74Ny9qz7FVbKZp26bHm3zwDfJtuTLoOWHv6p
	zgPMDXhdxd2oS1ebAuHgK5JvurICxGGOziKjLs8cegma9vJzPIwWYIAoTIElBQBebzkwh4n1xoC
	wMDZkrcl
X-Received: by 2002:a05:6214:5084:b0:8ac:ae66:8eb9 with SMTP id
 6a1803df08f44-8ca0fc20169mr185885816d6.46.1779036331218; Sun, 17 May 2026
 09:45:31 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JDRgNGC0LXQvCDQnNCw0LrRlNGU0LI=?= <artemmakieiev@gmail.com>
Date: Sun, 17 May 2026 19:45:15 +0300
X-Gm-Features: AVHnY4JWp1FCR1W5swXwsKUyWeqsx1RWlrnZAmUbmZeI2UZdzMs2mZRpkUzOwHM
Message-ID: <CAB4LXH9MY8-2r4PH+ki_KtdmUXmjyWPe2rN5SnRoP1TU9s=knQ@mail.gmail.com>
Subject: Kernel Panic: Oops - store (or AMO) access fault in __memset during
 gcc/gentoo-sources compilation on riscv64 (JH7110 / Star64)
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_094533_308627_2E9800D5 
X-CRM114-Status: UNSURE (   7.47  )
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

Hi all. Want to say that it's my first report, so if you have
complaints about style writing, I will be happy to read how to improve
myself. Also I don't really good at English. Sorry beforehand.

I am experiencing a consistent Kernel Panic when compiling
sys-devel/gcc-16.1.0 AND sys-kernel/gentoo-sources-7.0.8 on a StarFive
JH7110 (Pine64 Star64) board running Gentoo Linux.

The crash occurs during compilation (or file operations like rm or
cp), but forces the entire system into a kernel panic. It reproduces
both with Zram enabled and disabled, and -j1..-j4 flags.

Hardware: Pine64 Star64 (SoC JH7110, 8GB RAM)
Kernel version: 6.19.12-gentoo and 7.0.8-gentoo (that I have
crosscompiled with LLVM=1)
Spl, opensbi, u-boot: some prebuiled LTS version
FS Type: f2fs (on /var/tmp/portage)

U-Boot correctly detects 8GB of RAM:
DRAM bank   = 0x0000000000000000
-> start    = 0x0000000040000000
-> size     = 0x0000000200000000
memory[0]    [0x40000000-0x23fffffff]

And linux the same way:
cat /proc/meminfo
MemTotal:        8137624 kB
MemFree:         7989436 kB
MemAvailable:    7962080 kB
Buffers:            1280 kB
Cached:            28288 kB
SwapCached:            0 kB
Active:            18304 kB
Inactive:          20516 kB
Active(anon):        128 kB
Inactive(anon):    10568 kB
Active(file):      18176 kB
Inactive(file):     9948 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                80 kB
Writeback:             0 kB
AnonPages:          9272 kB
Mapped:             7456 kB
Shmem:              1444 kB
KReclaimable:      12188 kB
Slab:              36596 kB
SReclaimable:      12188 kB
SUnreclaim:        24408 kB
KernelStack:        2016 kB
PageTables:         1944 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     4068812 kB
Committed_AS:      42280 kB
VmallocTotal:   67108864 kB
VmallocUsed:       15612 kB
VmallocChunk:          0 kB
Percpu:              784 kB
Balloon:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB

However, under heavy compilation load (or I don't know. I compiled a
few little programs and they compiled and merged fine).

Kernel Panic Log whilst gcc compiling:

make[3]: Entering directory
'/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/gcc'
/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/./prev-gcc/xg++
-B/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/./prev-gcc/
-B/usr/riscv64-unknown-linux-musl/bin/ -nostdinc++
-B/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/src/.libs
-B/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/libsupc++/.libs
 -isystem /var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/include/riscv64-unknown-linux-musl
 -isystem /var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/include
 -isystem /var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/libstdc++-v3/libsupc++
-L/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/src/.libs
-L/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/prev-riscv64-unknown-linux-musl/libstdc++-v3/libsupc++/.libs
 -fPIE -c -DDEF_GENTOO_SCP -DDEF_GENTOO_ZNOW     -mabi=lp64
-march=rv64gc -pipe -O2 -fno-checking -gtoggle -DIN_GCC
-fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall
-Wno-error=narrowing -Wwrite-strings -Wcast-qual
-Wmissing-format-attribute -Wconditionally-supported
-Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings  -DHAVE_CONFIG_H -fPIE -I. -I.
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/.
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../include
 -I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../libcpp/include
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../libcody
 -I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../libdecnumber
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../libdecnumber/dpd
-I../libdecnumber
-I/var/tmp/portage/sys-devel/gcc-16.1.0/work/gcc-16.1.0/gcc/../libbacktrace
 -D_GENTOO_TIME64_FORCE=0 -o insn-opinit.o -MT insn-opinit.o -MMD -MP
-MF ./.deps/insn-opinit.TPo insn-opinit.cc
make[3]: Leaving directory
'/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/gcc'
make[3]: Entering directory
'/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/gcc'
rm -rf libbackend.a
make[3]: Leaving directory
'/var/tmp/portage/sys-devel/gcc-16.1.0/work/build/gcc'
[ 2652.226027] Oops - store (or AMO) access fault [#1]
[ 2119.492018] Modules linked in: 8021q nls_iso8859_1 cdns3
cdns_usb_common roles dwmac_starfive pcie_starfive cdns3_starfive
stmmac_platform clk_starfive_jh7110_isp clk_starfive_jh7110_vout
stmmac phy_jh7110_dphy_rx pcs_xpcs snd_soc_simple_card jh7110_trng
clk_starfive_jh7110_aon spi_pl022 spi_cadence_quadspi
snd_soc_simple_card_utils phy_jh7110_pcie phy_jh7110_usb
snd_soc_spdif_tx sfctemp jh7110_pwmdac clk_starfive_jh7110_stg
[ 2119.492086] CPU: 1 UID: 250 PID: 3573 Comm: cc1plus Not tainted
6.19.12-gentoo-inori-risc-v #4 NONE
[ 2119.492095] Hardware name: Pine64 Star64 (DT)
[ 2119.492098] epc : __memset+0x60/0xfc
[ 2119.492112]  ra : handle_mm_fault+0x7a0/0x100c
[ 2119.492124] epc : ffffffff80bd1584 ra : ffffffff802123cc sp :
ffffffc603ddbd40
[ 2119.492128]  gp : ffffffff8183c798 tp : ffffffd6c7a6b000 t0 :
ffffffd600000000
[ 2119.492131]  t1 : 0000000000000001 t2 : ffffffffffffffff s0 :
ffffffc603ddbe70
[ 2119.492135]  s1 : ffffffc500000000 a0 : ffffffd600000000 a1 :
0000000000000000
[ 2119.492139]  a2 : 0000000000001000 a3 : ffffffd600001000 a4 :
0000000000000000
[ 2119.492142]  a5 : 0000000000000000 a6 : ffffffffffffffff a7 :
00000000001fffff
[ 2119.492146]  s2 : ffffffff81390b88 s3 : 0000000000001255 s4 :
0000003f23ab4000
[ 2119.492150]  s5 : ffffffd6c7a59380 s6 : ffffffff81390d24 s7 :
ffffffff81390d20
[ 2119.492154]  s8 : 0000000000000800 s9 : ffffffc603ddbde8 s10:
ffffffd6c7a59380
[ 2119.492157]  s11: 0000000000000000 t3 : 0000000000000001 t4 :
0000000000000001
[ 2119.492160]  t5 : 0000000000000004 t6 : dead000000000040
[ 2119.492163] status: 0000000200000120 badaddr: ffffffd600000000
cause: 0000000000000007
[ 2119.492168] [<ffffffff80bd1584>] __memset+0x60/0xfc
[ 2119.492175] [<ffffffff8001eb8a>] handle_page_fault+0x1a2/0x4a0
[ 2119.492186] [<ffffffff80bd23ba>] do_page_fault+0x1e/0x3c
[ 2119.492191] [<ffffffff80bddcf8>] handle_exception+0x148/0x156
[ 2119.492207] Code: 1007 82b3 40e2 0797 0000 8793 00e7 8305 97ba 8782
(b023) 00b2
[ 2119.492213] ---[ end trace 0000000000000000 ]---
[ 2119.492219] Kernel panic - not syncing: Fatal exception in interrupt
[ 2119.492222] SMP: stopping secondary CPUs
[ 2119.685321] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---

Kernel Panic log whilst gentoo-sources compiling:

 * Excluding Patch #5010_enable-additional-cpu-optimizations-for-gcc.pat [ ok ]
 * Excluding Patch
#5010_enable-additional-cpu-optimizations-for-gcc-4.9 [ ok ]...
 * Excluding Patch #5011_enable-cpu-optimizations-for-gcc8.patch ...     [ ok ]
 * Excluding Patch #5012_enable-cpu-optimizations-for-gcc91.patch ...    [ ok ]
 * Excluding Patch #5013_enable-cpu-optimizations-for-gcc10.patch ...    [ ok ]
 * Excluding Patch #5010_enable-additional-cpu-optimizations-for-gcc.pat [ ok ]
 * Excluding Patch
#5010_enable-additional-cpu-optimizations-for-gcc-4.9 [ ok ]...
 * Excluding Patch #5011_enable-cpu-optimizations-for-gcc8.patch ...     [ ok ]
 * Excluding Patch #5012_enable-cpu-optimizations-for-gcc91.patch ...    [ ok ]
 * Excluding Patch #5013_enable-cpu-optimizations-for-gcc10.patch ...    [ ok ]
 * Applying 1000_linux-7.0.1.patch (-p1) ...                             [ ok ]
 * Applying 1001_linux-7.0.2.patch (-p1) ...                             [ ok ]
 * Applying 1002_linux-7.0.3.patch (-p1) ...                             [ ok ]
 * Applying 1003_linux-7.0.4.patch (-p1) ...                             [ ok ]
 * Applying 1004_linux-7.0.5.patch (-p1) ...                             [ ok ]
 * Applying 1005_linux-7.0.6.patch (-p1) ...                             [ ok ]
 * Applying 1510_fs-enable-link-security-restrictions-by-default.patch ( [ ok ].
 * Applying 1700_sparc-address-warray-bound-warnings.patch (-p1) ...     [ ok ]
 * Applying 1730_parisc-Disable-prctl.patch (-p1) ...                    [ ok ]
 * Applying 2000_BT-Check-key-sizes-only-if-Secure-Simple-Pairing-enabled.patch
(-p1) ...
                                                     [ ok ]
 * Applying 2901_permit-menuconfig-sorting.patch (-p1) ...               [ ok ]
 * Applying 2902_Replace-CONST-CAST-with-const-cast.patch (-p1) ...      [ ok ]
 * Applying 2990_libbpf-v2-workaround-Wmaybe-uninitialized-false-pos.pat
[ ok ]) ...
 * Applying 2991_libbpf_add_WERROR_option.patch (-p1) ...                [ ok ]
 * Applying 3000_Support-printing-firmware-info.patch (-p1) ...          [ ok ]
 * Applying 4567_distro-Gentoo-Kconfig.patch (-p1) ...                   [ ok ]
>>> Source unpacked in /var/tmp/portage/sys-kernel/gentoo-sources-7.0.6/work
>>> Preparing source in /var/tmp/portage/sys-kernel/gentoo-sources-7.0.6/work/linux-7.0.6-gentoo ...
>>> Source prepared.
>>> Configuring source in /var/tmp/portage/sys-kernel/gentoo-sources-7.0.6/work/linux-7.0.6-gentoo ...
>>> Source configured.
>>> Compiling source in /var/tmp/portage/sys-kernel/gentoo-sources-7.0.6/work/linux-7.0.6-gentoo ...
>>> Source compiled.
>>> Test phase [not enabled]: sys-kernel/gentoo-sources-7.0.6

>>> Install sys-kernel/gentoo-sources-7.0.6 into /var/tmp/portage/sys-kernel/gentoo-sources-7.0.6/image
 * >>> Copying sources ...
[15196.973454] Oops - store (or AMO) access fault [#1]
[15196.973466] Modules linked in: 8021q nls_iso8859_1 cdns3
cdns_usb_common roles pcie_starfive dwmac_starfive cdns3_starfive
phy_jh7110_dphy_rx stmmac_platform stmmac clk_starfive_jh7110_aon
clk_starfive_jh7110_isp clk_starfive_jh7110_vout pcs_xpcs jh7110_trng
clk_starfive_jh7110_stg sfctemp snd_soc_simple_card spi_pl022
phy_jh7110_pcie spi_cadence_quadspi phy_jh7110_usb
snd_soc_simple_card_utils jh7110_pwmdac snd_soc_spdif_tx
[15196.973528] CPU: 3 UID: 0 PID: 2024 Comm: cp Not tainted
7.0.8-gentoo-inori-risc-v #1 PREEMPT
[15196.973535] Hardware name: Pine64 Star64 (DT)
[15196.973539] epc : __memcpy+0x60/0xf8
[15196.973551]  ra : copy_folio_from_iter_atomic+0x2fa/0x8a0
[15196.973560] epc : ffffffff80be569c ra : ffffffff80580e06 sp :
ffffffc602d7b8b0
[15196.973564]  gp : ffffffff81840c60 tp : ffffffd6c52d5940 t0 :
425f5648207c2045
[15196.973568]  t1 : 52465f4e4f545455 t2 : 0a2c2944475f4d4f s0 :
ffffffc602d7b9e0
[15196.973572]  s1 : 0000000000000000 a0 : ffffffd600000000 a1 :
ffffffd766f15000
[15196.973576]  a2 : 0000000000001000 a3 : ffffffd766f16000 a4 :
307830202c464634
[15196.973579]  a5 : 4c554e202c353046 a6 : 54435f5648202c4c a7 :
4c42414e455f4c52
[15196.973583]  s2 : 0000000000001000 s3 : 0000000000000000 s4 :
ffffffff81393440
[15196.973586]  s5 : ffffffc602d7bb78 s6 : 0000000000000000 s7 :
0000000000001000
[15196.973590]  s8 : ffffffff81393b96 s9 : 0000800000000000 s10:
ffffffd6c52d613f
[15196.973593]  s11: ffffffff81393b92 t3 : 4943505f444e5309 t4 :
30284b524955515f
[15196.973597]  t5 : 30202c4436353178 t6 : ffffffd600000000 ssp :
0000000000000000
[15196.973601] status: 0000000200000120 badaddr: ffffffd600000000
cause: 0000000000000007
[15196.973605] [<ffffffff80be569c>] __memcpy+0x60/0xf8
[15196.973612] [<ffffffff801da1d8>] generic_perform_write+0xf8/0x1d0
[15196.973621] [<ffffffff80455814>] f2fs_file_write_iter+0x23c/0x998
[15196.973629] [<ffffffff802bf42e>] iter_file_splice_write+0x22a/0x39c
[15196.973640] [<ffffffff802bfcfc>] direct_splice_actor+0x78/0x170
[15196.973647] [<ffffffff802bfae8>] splice_direct_to_actor+0xf4/0x1f4
[15196.973655] [<ffffffff802bfc4e>] do_splice_direct+0x66/0x9c
[15196.973662] [<ffffffff8027f69a>] vfs_copy_file_range+0x3d2/0x508
[15196.973672] [<ffffffff8027f8d8>] __riscv_sys_copy_file_range+0x108/0x18c
[15196.973678] [<ffffffff800181b2>] syscall_handler+0x3a/0x48
[15196.973687] [<ffffffff80be66b8>] do_trap_ecall_u+0x108/0x220
[15196.973694] [<ffffffff80bf2176>] handle_exception+0x16a/0x178
[15196.973708] Code: b303 0285 b383 0305 be03 0385 be83 0405 bf03 0485
(b023) 00ef
[15196.973714] ---[ end trace 0000000000000000 ]---
[15196.973719] Kernel panic - not syncing: Fatal exception in interrupt
[15196.973722] SMP: stopping secondary CPUs
[15197.217961] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---

Any hints, pointers, or patches to try? If someone thinks that gentoo
can patche kernel badly, I can try the vanilla kernel (But I don't
think they patch risc-v actually).
Under "compiling" I mean whole process: from compiling to merging. I
tried to recompile gcc and gentoo-sources a few times. The issue
occurs every time at the same place. I don't sure at 100%, but gcc
couldn't compile a few exact .cc files and, in the end, I got 2 broken
.o files(0KB in size). Gentoo-sources stucks at the same "* >>>
Copying sources ...".

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
