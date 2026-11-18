Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A0606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MNY8m3iW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FEuWXSGr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D5JTi+q+npivCJ3y+3HNiemjtvXWORrkRnzrVjGWHhc=; b=MNY8m3iWCFhDWOiZYmgv84BI15
	nse9D9uEZDWcyE4vwavj+RrX9ejYvUXl3tIdVDv3UmyZm1lxcwoXSpgxACc9AN4ikouP8/ZYyJRWH
	YEZ3+f6wvKE1AfGCqdtnsHZb9hJ8vdOFwzHAdHVhPXAGz1zzsagKznsPUU+VKFjd2uODXEffd+P1J
	ULbIyrKN5bPwyCMhR84W6fjZZRVGV9/qhyq00nupM/QbYyQ/bitCcrbeSenzsZRCNmIc2Z+HmVTIN
	lvVm4A8TyT8ueaHrUAsVknwsW04r7qYoAsKXpToQz1aPafQV0WEfd5U8ArUHVOVBqw191x5hpN65E
	1pb0LqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToX4-0000000ARdj-2058;
	Wed, 18 Nov 2026 22:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToX2-0000000ARdc-3mYK
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FD2F457A1;
	Wed, 18 Nov 2026 22:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3A91F000C5;
	Wed, 18 Nov 2026 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042416;
	bh=ju41tYcaiYxL4W2/W44iKRoLMlO2PoKIBMEkIkLyQg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FEuWXSGrYrUQFlhOYDJ8RmqRs+UHxDca+SRQUjzDXuUFDIzfXsVMXV5QW5Nf2O6O2
	 yMfr+HxTUXuul8S/4nyXH3r2G+T3BUw17R2mKzbzKHGY+Uc9R9TDwQqHP1I07BZL1h
	 cg0702Dz8taE9mZDR3DpfRWO/zeJGCiWx+2rBpqpU54s60T8l+okiYjuAzmVobBvVi
	 dd6+0FS6i6GTPI2AAfPqebmA+dM3JxbnmqF0/BCeTJTRMszRnLVvcPbZzh9sXG+JFZ
	 o1ZEN2SyYFSeAyu5X1TmOKKyuatEEOc8sOmu7NRmXiEDhgDi/YfEZFhXIDZOJ8MUDW
	 4tZhNsWv93cTQ==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3BFF5198004A;
	Wed, 18 Nov 2026 17:53:33 -0500 (EST)
Received: from ams-frontend-01 ([10.64.2.36])
  by ams-compute-01.internal (MEProxy); Wed, 18 Nov 2026 17:53:33 -0500
X-ME-Sender: <xms:bCz-ar165EtE8yP63F8I3TVUVbswPq0W28EX1eVCuvCspJSmMTa8Qw>
    <xme:bCz-atn1iwnmNoA5-0PrLDlvzW0ZTnKbz2GZQ3leKx2RlYhlnLVsT7tkReavmDM1A
    jprlM6e1waLYmBAPuXwhj1EENgq8pYksOaNPSQSin3YqtELmQ-f-YmW>
X-ME-Received: <xmr:bCz-akZKlmfegl2fqaxxh7n91phHwSKnWnj7jZR-kBiy9bXblJLgRgdUKFoWzQiz7xw>
X-ME-Proxy-Cause: dmFkZTGXIZczXO+q6nTDnnEDvnvxIDawn337UpYr9JBMhqxburbViiiOHKHwmc9THwyxsv
    mMtxYDhBKJUPw87BPTOS83rVPircW+IuGhNLyHPm29xrQfEd8oB5Y/vOrzLTevOMUpFKll
    x6IxlXfz5ayiB//GnmAE5vpQukAANDlGGhka8oOoolkp1fJj2KhhfFVrBEpsdxH4aHEJU1
    OJwIRH+T2juR5qFAkq6C4SQPuquCsk4qcYhWWw49en0FDrCDxplQwmW8234rugaEPwbMb9
    Vh6m6IDv4fxLik+a76NDGhtqmbm/EIy4mvvwoZjhveJtqosG6m/JLmF964oiBMF+FwXVQg
    7kxdPhylGkBNQU8VJT7JaepaX3P5UE0pQN6K46BLGwgxuheOetCjapOLVOAncSLUzv8KwQ
    Eppk1HzLr1HHlN5tseRUNdGBCagPDaIk+9n+oReBnHgypHForZWKDBYOA4YfSvdoEhPVWz
    jFm2+Il+Uidjg9JeFAfnEtYnL0na1GYilpa68Gj/GbWoXpur4L8d1jlk0+gTg443Oit12n
    RWtxb8mhnwkKPgWIvnmWHZbrpWTBEZ2aXGtbCO/fLnWrqIPSsnDPIsmOE5h+WH3W+vxpxO
    I2+wN0UFnaVordnO+YBO8eXixrynfqAIY8xDRpW4eP1pg9upxWW8NNvjnsjg
X-ME-Proxy: <xmx:bSz-ajogOxzQPsY1lIwvMLSM7QUOTTFOCc8ci-d4zb8D6EfXwkwQ9A>
    <xmx:bSz-aijI6Seva34_ycm_CItwANcssdiPxnlPJP4hvPVScJgtHVXd2g>
    <xmx:bSz-atw5apVr4qKkV6OArzTae8CUat8BRMflg8Yo1hrVh84gBP2JZA>
    <xmx:bSz-ao8aqTnFeyYzoJ7OXE1PVHjQLP9bAjSVEQk5S-E8WJSDn8Dd1Q>
    <xmx:bSz-aiAi-ZQEQAiZn3Ftu0If-6-NiFKB4AF0UJIc3cqgdSA2nnxOdUnt>
Feedback-ID: i78584a88:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:53:29 -0500 (EST)
Message-ID: <a7021c7d-4171-4961-b8b5-dea622fb9e9f@kernel.org>
Date: Wed, 18 Nov 2026 23:53:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] rust: math: add div64_u64() and
 div64_u64_round_up()
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org,
 ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, chenhan0017.work@gmail.com, daniel.almeida@collabora.com,
 gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
References: <20261118224826.2491684-1-tomo@flapping.org>
 <20261118224826.2491684-2-tomo@flapping.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20261118224826.2491684-2-tomo@flapping.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 11:48 PM, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> On 32-bit architectures, dividing a u64 by a u64 with the `/` operator
> makes the compiler emit a call to a compiler runtime function, such as
> __aeabi_uldivmod() on arm. The kernel does not provide these functions,
> so the build fails when Rust code that is also built for 32-bit
> architectures uses `/` on u64.
> 
> C code uses the helpers in include/linux/math64.h instead. Add a math
> module with Rust versions of two of them:
> 
> - div64_u64(), the same as div64_u64() in C.
> - div64_u64_round_up(), the same as DIV64_U64_ROUND_UP() in C.
> 
> On 64-bit architectures, both use `/`. On 32-bit architectures,
> div64_u64() calls the C function. Both panic if the divisor is zero,
> as `/` does.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
