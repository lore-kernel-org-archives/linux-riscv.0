Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC1D462A1
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULNsgQzheYhekAfG3BSlfcVS0YB33d4rzhDEzuiNWFM=; b=AUsRGmvY3kMkBH
	BLOhM7hIW3j8iDHxQo9WORYBNrXzV67cXbrDq8AMJ0ZUZVWJX5zmfa4MMf7OEBP7ajRI5uF40GWUs
	ySD9TTHNrYNMLccN1WQTDRsPpY8eFsv3GlEoC5g+PAXQKRQMCt0fV3lSnhDvpDl7y4z1aMYaGpOQO
	COubRRpMpT/DiMq7euLTTJHG+OlL42HakuKmbeOjcqnYylQC32pJ4Vq7MPQkiregRyQinqbeOZgFR
	EeLRMCaRzSDYug0aVRCtLnb8oZSW+IfIOsyOPmLZMzhfRTj6lvi414D4NTyVSTyD6EsdL+UHJmi7k
	/g5ZiowcVH8ngHZbb8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDi2-00000006yks-0ZNL;
	Wed, 13 Nov 2024 13:47:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDhz-00000006ykJ-3kPN
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 13:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A33F45C56D5;
	Wed, 13 Nov 2024 13:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A8CC4CEC3;
	Wed, 13 Nov 2024 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731505618;
	bh=qY0HuqpyPZAHE0WeMVBKQut7yRVncP4l4AFCQ0b3BHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soREo1iBWYxjGzj+tNELJAQUzEMlXcTurkyYuJ/JMdDScOYK4b1Dw0UHEOmN2qWq4
	 Zyo2S55TSdGwOCiEggLtmsIEZ9taR+vmB+33H0KbtV1Vccs0OK1O0CLMbLksxZhcu+
	 7k06StoKQYurJLak4bF2T5i5GOhT8FXKvpUiaTOTUakFxCT7jVs56oPZJ2F8gPCHwg
	 HMTpMlMRrOZByHWAaeTcf4E58jYa67vCdmn1U3kqodx5YViEdn42QCJKu8enTwcA26
	 Zd0RtzrTH0WscqnvYT8SLlJhc3NV0UqB488aY7ZE4GTfww43vnCY4BDcXhmQBo84EM
	 4TKiFdRD3I0MA==
Date: Wed, 13 Nov 2024 08:46:55 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] lib/crct10diftest.c add selftests for crct10dif
Message-ID: <20241113134655.GA794@quark.localdomain>
References: <20241113104036.254491-1-zhihang.shao.iscas@gmail.com>
 <20241113104036.254491-2-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113104036.254491-2-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_054659_998555_035FF4B5 
X-CRM114-Status: GOOD (  16.95  )
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

On Wed, Nov 13, 2024 at 10:40:35AM +0000, Zhihang Shao wrote:
> Add selftests for kernel's implementation of CRC-T10DIF algorithm.
> The test data includes 100 randomly generated test-cases.
> The selftest file is similar to what is done in lib/crc32test.c, and is
> used to verify the correctness and measure performance improvement of
> the CRC-T10DIF algorithm with zbc extension optimization.
> 
> Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> ---
>  lib/Kconfig         |   9 +
>  lib/Makefile        |   1 +
>  lib/crct10diftest.c | 687 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 697 insertions(+)
>  create mode 100644 lib/crct10diftest.c

crc_t10dif_update() goes through the crypto API, so for now you should be able
to just use the crypto self-tests instead, i.e. boot a kernel with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.

I am planning to fix the crct10dif library to be optimized directly (without
going through the crypto API), like what I am doing for crc32.  At that point a
crct10dif library test will be needed, and I'll add one then.

There are also several issues with the existing crc32 test which you're copying,
and which I'd like to address when adding a new test.  For example, the test
does not cover short lengths, and it runs the tests with IRQs disabled which
makes optimized code not used on many architectures.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
