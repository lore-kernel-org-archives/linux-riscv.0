Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1773BC282CD
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCS+BATOT9XLJ9hJA3n2KhWheaQVKa4MytzcFY+kD8c=; b=k1adeyfj4yB56L
	xcnE9e1QyVotwt1ZraxZUgglAMRuwEDiWagqrdDgM0HSdTcg0BotzOd2oDrj93WRwbefyX561bM7C
	7I9TKRPrydOIMAm3jK7dtozq5qiQT0tD7i7Q+jU8xfqNr9gOYoAasKrRpGaKw7rLYFSk6WOIH161H
	a3OZ+3JkzBcW5mp25irc1imyiiVh80eIkruCHLzYRLwRbleLufQCEPHDnVoTxS1bft+wZKdAKwSZ7
	NTi+izBDF9u9zQL9/IxlOZqXHWuGj/Sv/noMMiCB+JzAgb8vR0ipYsEDAGeiECr1dchMOzCIyLUC2
	D90ClWoms31Xd5/NKvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1torQL-0000000Gjfv-2LW8;
	Sun, 02 Mar 2025 22:04:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1torQK-0000000Gjen-2Ksn
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 22:04:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18DC0611C4;
	Sun,  2 Mar 2025 22:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5901C4CED6;
	Sun,  2 Mar 2025 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740953075;
	bh=sNHgqXDivFwdiZ8TXbNDsXGkLUf6pi1RZL5XR7U6cCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tN3Mxiiw13zsYQWWDIEtsEf/0L6ocsJEAmNj1Ny1VIFIzCRYoy4eEuXfZ4sukVgnS
	 cHg0RxwS06qLApzE6y6ebLvaQsa2tZeX84fsq3o5RY+x4QS2q8+R7QRvI6hh4cNnGs
	 L3JJLL2loPpv/3k8ZE6X10TWEB5joAyshocfFPU89lWa/Vv2Qk3FNbvpkMLZ2hoqMg
	 vvF2NyhWKPpD2PS16k1b9U4qdicuBDveuthuDYSCwnSMTmhMYeUBS16OlE/YxI1OPr
	 rCU+0x1sjLrc0Pq+KpH1odkZ1or1f7CQ2W+QOBwoj7oRJzdmwevG1d3bnc+M1V4G6z
	 HIpn0NU+UD5xA==
Date: Sun, 2 Mar 2025 14:04:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/4] RISC-V CRC optimizations
Message-ID: <20250302220426.GC2079@quark.localdomain>
References: <20250216225530.306980-1-ebiggers@kernel.org>
 <20250224180614.GA11336@google.com>
 <87ikorl0r5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ikorl0r5.fsf@all.your.base.are.belong.to.us>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 02, 2025 at 07:56:46PM +0100, Bj=F6rn T=F6pel wrote:
> Eric!
> =

> Eric Biggers <ebiggers@kernel.org> writes:
> =

> > On Sun, Feb 16, 2025 at 02:55:26PM -0800, Eric Biggers wrote:
> >> This patchset is a replacement for
> >> "[PATCH v4] riscv: Optimize crct10dif with Zbc extension"
> >> (https://lore.kernel.org/r/20250211071101.181652-1-zhihang.shao.iscas@=
gmail.com/).
> >> It adopts the approach that I'm taking for x86 where code is shared
> >> among CRC variants.  It replaces the existing Zbc optimized CRC32
> >> functions, then adds Zbc optimized CRC-T10DIF and CRC64 functions.
> >> =

> >> This new code should be significantly faster than the current Zbc
> >> optimized CRC32 code and the previously proposed CRC-T10DIF code.  It
> >> uses "folding" instead of just Barrett reduction, and it also implemen=
ts
> >> Barrett reduction more efficiently.
> >> =

> >> This applies to crc-next at
> >> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log=
/?h=3Dcrc-next.
> >> It depends on other patches that are queued there for 6.15, so I plan =
to
> >> take it through there if there are no objections.
> >> =

> >> Tested with crc_kunit in QEMU (set CONFIG_CRC_KUNIT_TEST=3Dy and
> >> CONFIG_CRC_BENCHMARK=3Dy), both 32-bit and 64-bit.  I don't have real =
Zbc
> >> capable hardware to benchmark this on, but the new code should work ve=
ry
> >> well; similar optimizations work very well on other architectures.
> >
> > Any feedback on this series from the RISC-V side?
> =

> I have not reviewed your series, but I did a testrun the Milk-V Jupiter
> which sports a Spacemit K1 that has Zbc.
> =

> I based the run on commit 1973160c90d7 ("Merge tag
> 'gpio-fixes-for-v6.14-rc5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux"), plus your
> crc-next branch (commit a0bd462f3a13 ("x86/crc: add ANNOTATE_NOENDBR to
> suppress objtool warnings")) merged:
> =

>   | --- base1.txt	2025-03-02 18:31:16.169438876 +0000
>   | +++ eric.txt	2025-03-02 18:35:58.683017223 +0000
>   | @@ -11,7 +11,7 @@
>   |      # crc16_benchmark: len=3D127: 153 MB/s
>   |      # crc16_benchmark: len=3D128: 153 MB/s
>   |      # crc16_benchmark: len=3D200: 153 MB/s
>   | -    # crc16_benchmark: len=3D256: 153 MB/s
>   | +    # crc16_benchmark: len=3D256: 154 MB/s
>   |      # crc16_benchmark: len=3D511: 154 MB/s
>   |      # crc16_benchmark: len=3D512: 154 MB/s
>   |      # crc16_benchmark: len=3D1024: 155 MB/s
>   | @@ -20,94 +20,94 @@
>   |      # crc16_benchmark: len=3D16384: 155 MB/s
>   |      ok 2 crc16_benchmark
>   |      ok 3 crc_t10dif_test
>   | -    # crc_t10dif_benchmark: len=3D1: 48 MB/s
>   | -    # crc_t10dif_benchmark: len=3D16: 125 MB/s
>   | -    # crc_t10dif_benchmark: len=3D64: 136 MB/s
>   | -    # crc_t10dif_benchmark: len=3D127: 138 MB/s
>   | -    # crc_t10dif_benchmark: len=3D128: 138 MB/s
>   | -    # crc_t10dif_benchmark: len=3D200: 138 MB/s
>   | -    # crc_t10dif_benchmark: len=3D256: 138 MB/s
>   | -    # crc_t10dif_benchmark: len=3D511: 139 MB/s
>   | -    # crc_t10dif_benchmark: len=3D512: 139 MB/s
>   | -    # crc_t10dif_benchmark: len=3D1024: 139 MB/s
>   | -    # crc_t10dif_benchmark: len=3D3173: 140 MB/s
>   | -    # crc_t10dif_benchmark: len=3D4096: 140 MB/s
>   | -    # crc_t10dif_benchmark: len=3D16384: 140 MB/s
>   | +    # crc_t10dif_benchmark: len=3D1: 28 MB/s
>   | +    # crc_t10dif_benchmark: len=3D16: 236 MB/s
>   | +    # crc_t10dif_benchmark: len=3D64: 450 MB/s
>   | +    # crc_t10dif_benchmark: len=3D127: 480 MB/s
>   | +    # crc_t10dif_benchmark: len=3D128: 540 MB/s
>   | +    # crc_t10dif_benchmark: len=3D200: 559 MB/s
>   | +    # crc_t10dif_benchmark: len=3D256: 600 MB/s
>   | +    # crc_t10dif_benchmark: len=3D511: 613 MB/s
>   | +    # crc_t10dif_benchmark: len=3D512: 635 MB/s
>   | +    # crc_t10dif_benchmark: len=3D1024: 654 MB/s
>   | +    # crc_t10dif_benchmark: len=3D3173: 665 MB/s
>   | +    # crc_t10dif_benchmark: len=3D4096: 669 MB/s
>   | +    # crc_t10dif_benchmark: len=3D16384: 673 MB/s
>   |      ok 4 crc_t10dif_benchmark
>   |      ok 5 crc32_le_test
>   |      # crc32_le_benchmark: len=3D1: 31 MB/s
>   | -    # crc32_le_benchmark: len=3D16: 456 MB/s
>   | -    # crc32_le_benchmark: len=3D64: 682 MB/s
>   | -    # crc32_le_benchmark: len=3D127: 620 MB/s
>   | -    # crc32_le_benchmark: len=3D128: 744 MB/s
>   | -    # crc32_le_benchmark: len=3D200: 768 MB/s
>   | -    # crc32_le_benchmark: len=3D256: 777 MB/s
>   | -    # crc32_le_benchmark: len=3D511: 758 MB/s
>   | -    # crc32_le_benchmark: len=3D512: 798 MB/s
>   | -    # crc32_le_benchmark: len=3D1024: 807 MB/s
>   | -    # crc32_le_benchmark: len=3D3173: 807 MB/s
>   | -    # crc32_le_benchmark: len=3D4096: 814 MB/s
>   | -    # crc32_le_benchmark: len=3D16384: 816 MB/s
>   | +    # crc32_le_benchmark: len=3D16: 439 MB/s
>   | +    # crc32_le_benchmark: len=3D64: 1209 MB/s
>   | +    # crc32_le_benchmark: len=3D127: 1067 MB/s
>   | +    # crc32_le_benchmark: len=3D128: 1616 MB/s
>   | +    # crc32_le_benchmark: len=3D200: 1739 MB/s
>   | +    # crc32_le_benchmark: len=3D256: 1951 MB/s
>   | +    # crc32_le_benchmark: len=3D511: 1855 MB/s
>   | +    # crc32_le_benchmark: len=3D512: 2174 MB/s
>   | +    # crc32_le_benchmark: len=3D1024: 2301 MB/s
>   | +    # crc32_le_benchmark: len=3D3173: 2347 MB/s
>   | +    # crc32_le_benchmark: len=3D4096: 2407 MB/s
>   | +    # crc32_le_benchmark: len=3D16384: 2440 MB/s
>   |      ok 6 crc32_le_benchmark
>   |      ok 7 crc32_be_test
>   | -    # crc32_be_benchmark: len=3D1: 27 MB/s
>   | -    # crc32_be_benchmark: len=3D16: 258 MB/s
>   | -    # crc32_be_benchmark: len=3D64: 388 MB/s
>   | -    # crc32_be_benchmark: len=3D127: 402 MB/s
>   | -    # crc32_be_benchmark: len=3D128: 424 MB/s
>   | -    # crc32_be_benchmark: len=3D200: 438 MB/s
>   | -    # crc32_be_benchmark: len=3D256: 444 MB/s
>   | -    # crc32_be_benchmark: len=3D511: 449 MB/s
>   | -    # crc32_be_benchmark: len=3D512: 455 MB/s
>   | -    # crc32_be_benchmark: len=3D1024: 461 MB/s
>   | -    # crc32_be_benchmark: len=3D3173: 463 MB/s
>   | -    # crc32_be_benchmark: len=3D4096: 465 MB/s
>   | -    # crc32_be_benchmark: len=3D16384: 466 MB/s
>   | +    # crc32_be_benchmark: len=3D1: 25 MB/s
>   | +    # crc32_be_benchmark: len=3D16: 251 MB/s
>   | +    # crc32_be_benchmark: len=3D64: 458 MB/s
>   | +    # crc32_be_benchmark: len=3D127: 496 MB/s
>   | +    # crc32_be_benchmark: len=3D128: 547 MB/s
>   | +    # crc32_be_benchmark: len=3D200: 569 MB/s
>   | +    # crc32_be_benchmark: len=3D256: 605 MB/s
>   | +    # crc32_be_benchmark: len=3D511: 621 MB/s
>   | +    # crc32_be_benchmark: len=3D512: 637 MB/s
>   | +    # crc32_be_benchmark: len=3D1024: 657 MB/s
>   | +    # crc32_be_benchmark: len=3D3173: 668 MB/s
>   | +    # crc32_be_benchmark: len=3D4096: 671 MB/s
>   | +    # crc32_be_benchmark: len=3D16384: 674 MB/s
>   |      ok 8 crc32_be_benchmark
>   |      ok 9 crc32c_test
>   |      # crc32c_benchmark: len=3D1: 31 MB/s
>   | -    # crc32c_benchmark: len=3D16: 457 MB/s
>   | -    # crc32c_benchmark: len=3D64: 682 MB/s
>   | -    # crc32c_benchmark: len=3D127: 620 MB/s
>   | -    # crc32c_benchmark: len=3D128: 744 MB/s
>   | -    # crc32c_benchmark: len=3D200: 769 MB/s
>   | -    # crc32c_benchmark: len=3D256: 779 MB/s
>   | -    # crc32c_benchmark: len=3D511: 758 MB/s
>   | -    # crc32c_benchmark: len=3D512: 797 MB/s
>   | -    # crc32c_benchmark: len=3D1024: 807 MB/s
>   | -    # crc32c_benchmark: len=3D3173: 806 MB/s
>   | -    # crc32c_benchmark: len=3D4096: 813 MB/s
>   | -    # crc32c_benchmark: len=3D16384: 816 MB/s
>   | +    # crc32c_benchmark: len=3D16: 446 MB/s
>   | +    # crc32c_benchmark: len=3D64: 1188 MB/s
>   | +    # crc32c_benchmark: len=3D127: 1066 MB/s
>   | +    # crc32c_benchmark: len=3D128: 1600 MB/s
>   | +    # crc32c_benchmark: len=3D200: 1727 MB/s
>   | +    # crc32c_benchmark: len=3D256: 1941 MB/s
>   | +    # crc32c_benchmark: len=3D511: 1854 MB/s
>   | +    # crc32c_benchmark: len=3D512: 2164 MB/s
>   | +    # crc32c_benchmark: len=3D1024: 2300 MB/s
>   | +    # crc32c_benchmark: len=3D3173: 2345 MB/s
>   | +    # crc32c_benchmark: len=3D4096: 2402 MB/s
>   | +    # crc32c_benchmark: len=3D16384: 2437 MB/s
>   |      ok 10 crc32c_benchmark
>   |      ok 11 crc64_be_test
>   | -    # crc64_be_benchmark: len=3D1: 64 MB/s
>   | -    # crc64_be_benchmark: len=3D16: 144 MB/s
>   | -    # crc64_be_benchmark: len=3D64: 154 MB/s
>   | -    # crc64_be_benchmark: len=3D127: 156 MB/s
>   | -    # crc64_be_benchmark: len=3D128: 156 MB/s
>   | -    # crc64_be_benchmark: len=3D200: 156 MB/s
>   | -    # crc64_be_benchmark: len=3D256: 156 MB/s
>   | -    # crc64_be_benchmark: len=3D511: 157 MB/s
>   | -    # crc64_be_benchmark: len=3D512: 157 MB/s
>   | -    # crc64_be_benchmark: len=3D1024: 157 MB/s
>   | -    # crc64_be_benchmark: len=3D3173: 158 MB/s
>   | -    # crc64_be_benchmark: len=3D4096: 158 MB/s
>   | -    # crc64_be_benchmark: len=3D16384: 158 MB/s
>   | +    # crc64_be_benchmark: len=3D1: 29 MB/s
>   | +    # crc64_be_benchmark: len=3D16: 264 MB/s
>   | +    # crc64_be_benchmark: len=3D64: 476 MB/s
>   | +    # crc64_be_benchmark: len=3D127: 499 MB/s
>   | +    # crc64_be_benchmark: len=3D128: 558 MB/s
>   | +    # crc64_be_benchmark: len=3D200: 576 MB/s
>   | +    # crc64_be_benchmark: len=3D256: 611 MB/s
>   | +    # crc64_be_benchmark: len=3D511: 621 MB/s
>   | +    # crc64_be_benchmark: len=3D512: 638 MB/s
>   | +    # crc64_be_benchmark: len=3D1024: 659 MB/s
>   | +    # crc64_be_benchmark: len=3D3173: 667 MB/s
>   | +    # crc64_be_benchmark: len=3D4096: 671 MB/s
>   | +    # crc64_be_benchmark: len=3D16384: 674 MB/s
>   |      ok 12 crc64_be_benchmark
>   |      ok 13 crc64_nvme_test
>   | -    # crc64_nvme_benchmark: len=3D1: 64 MB/s
>   | -    # crc64_nvme_benchmark: len=3D16: 144 MB/s
>   | -    # crc64_nvme_benchmark: len=3D64: 154 MB/s
>   | -    # crc64_nvme_benchmark: len=3D127: 156 MB/s
>   | -    # crc64_nvme_benchmark: len=3D128: 156 MB/s
>   | -    # crc64_nvme_benchmark: len=3D200: 156 MB/s
>   | -    # crc64_nvme_benchmark: len=3D256: 156 MB/s
>   | -    # crc64_nvme_benchmark: len=3D511: 157 MB/s
>   | -    # crc64_nvme_benchmark: len=3D512: 157 MB/s
>   | -    # crc64_nvme_benchmark: len=3D1024: 157 MB/s
>   | -    # crc64_nvme_benchmark: len=3D3173: 158 MB/s
>   | -    # crc64_nvme_benchmark: len=3D4096: 158 MB/s
>   | -    # crc64_nvme_benchmark: len=3D16384: 158 MB/s
>   | +    # crc64_nvme_benchmark: len=3D1: 36 MB/s
>   | +    # crc64_nvme_benchmark: len=3D16: 479 MB/s
>   | +    # crc64_nvme_benchmark: len=3D64: 1340 MB/s
>   | +    # crc64_nvme_benchmark: len=3D127: 1179 MB/s
>   | +    # crc64_nvme_benchmark: len=3D128: 1766 MB/s
>   | +    # crc64_nvme_benchmark: len=3D200: 1965 MB/s
>   | +    # crc64_nvme_benchmark: len=3D256: 2201 MB/s
>   | +    # crc64_nvme_benchmark: len=3D511: 2087 MB/s
>   | +    # crc64_nvme_benchmark: len=3D512: 2464 MB/s
>   | +    # crc64_nvme_benchmark: len=3D1024: 2331 MB/s
>   | +    # crc64_nvme_benchmark: len=3D3173: 2673 MB/s
>   | +    # crc64_nvme_benchmark: len=3D4096: 2745 MB/s
>   | +    # crc64_nvme_benchmark: len=3D16384: 2782 MB/s
>   |      ok 14 crc64_nvme_benchmark
>   |  # crc: pass:14 fail:0 skip:0 total:14
>   |  # Totals: pass:14 fail:0 skip:0 total:14
> =

> That's a significant speed up for this popular SoC, and it would be
> great to get this series in for the next merge window! Thank you!
> =

> Tested-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Thanks for testing this patchset!  So to summarize, on long messages the re=
sults
were roughly:

    lsb-first CRCs (crc32_le, crc32c, crc64_nvme):
        Generic table-based code:             158 MB/s
        Old Zbc-optimized code (crc32* only): 816 MB/s
        New Zbc-optimized code:               2440 MB/s

    mst-first CRCs (crc_t10dif, crc32_be, crc64_be):
        Generic table-based code:             158 MB/s
        Old Zbc-optimized code (crc32* only): 466 MB/s
        New Zbc-optimized code:               674 MB/s

So, quite positive results.  Though, the fact the msb-first CRCs are (still=
) so
much slower than lsb-first ones indicates that be64_to_cpu() is super slow =
on
RISC-V.  That seems to be caused by the rev8 instruction from Zbb not being
used.  I wonder if there are any plans to make the endianness swap macros u=
se
rev8, or if I'm going to have to roll my own endianness swap in the CRC cod=
e.
(I assume it would be fine for the CRC code to depend on both Zbb and Zbc.)

Anyway, I've applied this series to the crc tree
(https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log=
/?h=3Dcrc-next).

Palmer, I'd appreciate your ack though!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
