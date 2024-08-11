Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C63C52D7B
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vv91zSYZ+WIRGVDoONEXsB8xQ/PdFW4Y9Jo5Qc20+ZE=; b=KaBdYeSp8snSV8
	WoC5n/4dzZArtDH6eb3s4rFGY+3/Ucxuf5Fu6fSXcMhqletZToot8bzbkKw8mdG2HiFP6R9dT2+Lv
	NUGrQEf8aw/5kiwHdoUw0AgJD/Nu1v+GoGw8e0yt0ixr8vllIU8rn+3Ud3q4LBZKMaAM2k6XEd1Wp
	ZjrQT4Nk5vYjCq9X3OloxGw1tp9vXozjGFxVO2yxoR3640ufTkKNA7M7GX7uNu5SD4JiQnidHpYQw
	dhhRvCUVeh+bHYxkqIpoK4SrT9b+DV7Hwd6PBuzVS6SSghT1OCuZ7J17erTnAwV87arADQ0XpKgRy
	4n5RMpcgRRJGg+blQEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdBYk-0000000FpPa-3aQS;
	Sun, 11 Aug 2024 16:36:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdBXt-0000000FpER-1HGE
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 16:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16D32CE0B0A;
	Sun, 11 Aug 2024 16:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30118C4AF0D;
	Sun, 11 Aug 2024 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723394148;
	bh=JWC3mgdz2ktAtm0H6Q0A+PYoh4dsi333CkWUpefiwTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkVZGXG2B04KEwhASYe0vn0UbubvJskcdiZ48Fj381Pat/uHAGPW+1QGjUAXyGKai
	 9HdQ9PTWMNPaFKVmWhvRu5mWX0xT/qyz2f3hrWTdEiRcbsq9ETalzizQdCx7wiKmN3
	 7Tx3PCNS4p4pOvtlnF3Sp6ONa5s6t4wR4pfiTHNdXOn3hWjdxE90BArYS60SOJte7M
	 rTZI010lgwijCgyLuBu2w5tNZGjO5PUBlsW/a10DvWiRH7sCNzjF5kDVjOr5dFOcSq
	 DVbL3MTse1AwAUPExKhC8/As3AJ7PIsygcZ1Y7t1WJszPayTZYRDnTIdawBKhSvJow
	 goti7KOisr8Gw==
Date: Sun, 11 Aug 2024 19:33:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	kernel@collabora.com, stable@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] selftests: memfd_secret: don't build memfd_secret test
 on unsupported arches
Message-ID: <Zrjn2qIcGxPBuSP9@kernel.org>
References: <20240809075642.403247-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809075642.403247-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_093553_733976_4F67CE72 
X-CRM114-Status: GOOD (  16.75  )
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

On Fri, Aug 09, 2024 at 12:56:42PM +0500, Muhammad Usama Anjum wrote:
> [1] mentions that memfd_secret is only supported on arm64, riscv, x86
> and x86_64 for now. It doesn't support other architectures. I found the
> build error on arm and decided to send the fix as it was creating noise
> on KernelCI. Hence I'm adding condition that memfd_secret should only be
> compiled on supported architectures.
> 
> Also check in run_vmtests script if memfd_secret binary is present
> before executing it.
> 
> [1] https://lore.kernel.org/all/20210518072034.31572-7-rppt@kernel.org/
> Cc: stable@vger.kernel.org
> Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/Makefile       | 2 ++
>  tools/testing/selftests/mm/run_vmtests.sh | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 1a83b70e84535..4ea188be0588a 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -53,7 +53,9 @@ TEST_GEN_FILES += madv_populate
>  TEST_GEN_FILES += map_fixed_noreplace
>  TEST_GEN_FILES += map_hugetlb
>  TEST_GEN_FILES += map_populate
> +ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64))
>  TEST_GEN_FILES += memfd_secret
> +endif
>  TEST_GEN_FILES += migration
>  TEST_GEN_FILES += mkdirty
>  TEST_GEN_FILES += mlock-random-test
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 03ac4f2e1cce6..36045edb10dea 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -374,8 +374,11 @@ CATEGORY="hmm" run_test bash ./test_hmm.sh smoke
>  # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
>  CATEGORY="madv_populate" run_test ./madv_populate
>  
> +if [ -x ./memfd_secret ]
> +then
>  (echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
>  CATEGORY="memfd_secret" run_test ./memfd_secret
> +fi
>  
>  # KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
>  CATEGORY="ksm" run_test ./ksm_tests -H -s 100
> -- 
> 2.39.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
