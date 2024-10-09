Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90B2CEE330
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLGstsVhfYbW8ANODNfGODVOD0XfMo+t5sNj1xgK4yI=; b=VpT7wHpOP7BrcL
	F8Vqabu0F7mzr60ju2VW9ugbPAtoA5+RVjCnpKMZ8axY7gu9KVruIdOhd+t/OzRoWzpnnrvta2my5
	pmiD/bFt+l8sWIG+SooPghPnzBgpob+bRQqlTFbO8Qy/DZnXY5pwownaMwIzIr3U3Ot57Ssa3rm2T
	jaS7qsyu5BArYMkiUNy8h8F9OicowIH7ufbj4IqrMgKj1dEZ0kU40eYOgNLb0bJyZDXM1Se+Qm1gh
	lvhsh3coDstsLfksOegdM/o4EE0q7QLk1aRtkZXlBhlCDZMzu+QIP99VMDyynLnLLivEPjdbJ+C8v
	DRmhm1Jn6yiifI408wgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaX6-0000000ABQE-3T4W;
	Wed, 09 Oct 2024 17:31:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZpw-0000000A3Kq-06Ks
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 16:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09AD95C5B10;
	Wed,  9 Oct 2024 16:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568BAC4CECF;
	Wed,  9 Oct 2024 16:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728492414;
	bh=OmUs304wMc8OK5lHEiBWvh96Qrjet1ngSTlBlstJqAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF5Mti5m4olXLIOVYHM8rSy1xq5UqaFJPLryvEwEvnBQouEZRNjhtRp5b3D1mV+hD
	 EmRdFaGTXK09hR3XM1UeEPopJlTvjvOiX3Ffg9hzg/TZFwUy1Vd0s1YNgkjqc7yRt2
	 xnHtgSgFHKp3LmRMQ2xaZdzNZGgfnjfD96055vhPBT4IM+9cQu+ERhGNO0UBhcVx8F
	 ye0Q+1txEcNEOhA7KR5FOKonT9gE8DmTJjnnfWzqbQ5RRBy8vuuDzO1tFSthAV90ud
	 PAbn8/ERxvU49bKoXta+9B9x+tRI3k8xkjnzD/r/IMBF787TKZ6Xc5abuBRxhBFLgi
	 i1kiey/20DKMA==
Date: Wed, 9 Oct 2024 06:46:53 -1000
From: Tejun Heo <tj@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: David Vernet <void@manifault.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v3] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwazfdmNiPmCnWUK@slm.duckdns.org>
References: <20241008153519.1270862-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008153519.1270862-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_094656_128733_976AF500 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, Oct 08, 2024 at 05:35:18PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> The sched_ext selftests is missing proper cross-compilation support, a
> proper target entry, and out-of-tree build support.
> =

> When building the kselftest suite, e.g.:
> =

>   make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu-  \
>     TARGETS=3Dsched_ext SKIP_TARGETS=3D"" O=3D/output/foo \
>     -C tools/testing/selftests install
> =

> or:
> =

>   make ARCH=3Darm64 LLVM=3D1 TARGETS=3Dsched_ext SKIP_TARGETS=3D"" \
>     O=3D/output/foo -C tools/testing/selftests install
> =

> The expectation is that the sched_ext is included, cross-built, the
> correct toolchain is picked up, and placed into /output/foo.
> =

> In contrast to the BPF selftests, the sched_ext suite does not use
> bpftool at test run-time, so it is sufficient to build bpftool for the
> build host only.
> =

> Add ARCH, CROSS_COMPILE, OUTPUT, and TARGETS support to the sched_ext
> selftest. Also, remove some variables that were unused by the
> Makefile.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Applied to sched_ext/for-6.12-fixes.

Thanks.

-- =

tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
