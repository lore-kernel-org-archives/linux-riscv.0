Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ADC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCJ2QFIQ+znqmzhJoJSOXYvbvIh8z7L7VK/xaFmhDGA=; b=pNaW12g5iL5gQT
	ZBYdETP/c5DfGozNCV7tN2xsOpsfVsFq+CpMjBmiYoeexJBKzKRZRLH7ib0LNk5KK4vEKu72stgbm
	lgQjhqB2sfNSxoIY68WmNEgyEyff3irB1aXJhoAKVmqzq2PcbBEzlaOE2GSQiJZzBcyDU0G5JV6Dn
	qjqtV+/fDZV6ULRpsuMvgJMuajy1xMblQUfoBKBsfsjTFNCaqiHtfSSjeYY/hogTSg6TfGWCfJhMU
	xCmxrQvEC+DQF8bq2dV2Tln+3IJo6tWJXsxTqaAXXCj7N/HLMtSfZSjo11P7nMzMSSRMJt+rBbd3g
	oGF9D526nF3ktAIggWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVcI-00000003CnO-2a99;
	Thu, 18 Apr 2024 17:32:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVcF-00000003Cm1-2Scc
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 17:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DC70618A3;
	Thu, 18 Apr 2024 17:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FF2C113CC;
	Thu, 18 Apr 2024 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713461526;
	bh=ackjtFhEwPS1DWwxwOO1J3VcSzyK+7bkMK70V249e+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgMkaLsZL6MDFoi5pOJZ9Uqc06yo9NSEFh/o7HjCO5s0W2kKW8/U8XwpEcOUYkfLR
	 RuShVXQimLY85SYSdAYAGrsNvGnXS93Uc1J1h/iz1t1C0rXIsyT4PVPW+7qXgaB/3t
	 Juw3kluI6GsEYo+wBLEAUHqdVfx4jtG9iLK5WLn2sAQJfO8LkAyTesefKFebGggfpT
	 ZcwNGzTFBXyDliQUc3GCmxAlTaeGDadJB6/zE1C49B9xuJ4O2vgHuFfiiC9aiRqCSS
	 AuIwkH53dn5sKGtUxzs8vuwWfGgpcuBk1DUz6E+3eX29bWLAiD2Y+mab6KB+Zjvrpj
	 lHERzYdAahI+w==
Date: Thu, 18 Apr 2024 10:32:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240418173203.GA1081@sol.localdomain>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418-ultimatum-yam-11de4b063b83@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_103207_808887_85E0BE61 
X-CRM114-Status: GOOD (  27.68  )
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

On Thu, Apr 18, 2024 at 05:53:55PM +0100, Conor Dooley wrote:
> > If it would be useful to do so, we should be able to enable some of the code
> > with a smaller VLEN and/or EEW once it has been tested in those configurations.
> > Some of it should work, but some of it won't be able to work.  (For example, the
> > SHA512 instructions require EEW==64.)
> > 
> > Also note that currently all the RISC-V vector crypto code only supports riscv64
> > (XLEN=64).  Similarly, that could be relaxed in the future if people really need
> > the vector crypto acceleration on 32-bit CPUs...  But similarly, the code would
> > need to be revised and tested in that configuration.
> > 
> > > Eric/Jerry (although read the previous paragraph too):
> > > I noticed that the sha256 glue code calls crypto_simd_usable(), and in
> > > turn may_use_simd() before kernel_vector_begin(). The chacha20 glue code
> > > does not call either, which seems to violate the edict in
> > > kernel_vector_begin()'s kerneldoc:
> > > "Must not be called unless may_use_simd() returns true."
> > 
> > skcipher algorithms can only be invoked in process and softirq context.  This
> > differs from shash algorithms which can be invoked in any context.
> > 
> > My understanding is that, like arm64, RISC-V always allows non-nested
> > kernel-mode vector to be used in process and softirq context -- and in fact,
> > this was intentionally done in order to support use cases like this.  So that's
> > why the RISC-V skcipher algorithms don't check for may_use_simd() before calling
> > kernel_vector_begin().
> 
> I see, thanks for explaining that. I think you should probably check
> somewhere if has_vector() returns true in that driver though before
> using vector instructions. Only checking vlen seems to me like relying on
> an implementation detail and if we set vlen for the T-Head/0.7.1 vector
> it'd be fooled. That said, I don't think that any of the 0.7.1 vector
> systems actually support Zvkb, but I hope you get my drift.

All the algorithms check for at least one of the vector crypto extensions being
supported, for example Zvkb.  'if (riscv_isa_extension_available(NULL, ZVKB))'
should return whether the ratified version of Zvkb is supported, and likewise
for the other vector crypto extensions.  The ratified version of the vector
crypto extensions depends on the ratified version of the vector extension.  So
there should be no issue.  If there is, the RISC-V core architecture code needs
to be fixed to not declare that extensions are supported when they are actually
incompatible non-standard versions of those extensions.  Incompatible
non-standard extensions should be represented as separate extensions.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
