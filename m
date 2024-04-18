Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1BCC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DH/AWrtRGM9efjAAMegqFRytRGg51/sF4wySdNZMhc=; b=xMpdgDtni6Dldm
	QP3Z2tdjDc55fNfJGeAB4RFvIE1/uSXGiO6TlafA/6I3rXf7UW+3h3hoKXI65Jwzv60mR+rakhEVv
	cAiT1ZdU2A1q4XmmuCYGRC4tMo/343liRDanChEw/TemR6czAtXnzvzab0NDXg78k6oJIvWyt1b0u
	35KgJo+dpXRblndC4/v443tQw4VNH38ANirDAr2yR24RDn4DzWNDLXeiu3zx7Lk7kcmyAResFuTLN
	uh/ua0mRMWa+segdzTHIWRnyfWTqFOlWtTG7sn1MRHjYtjtiZYUBm1hEQ+UjuXrXvtsyQaBR3oks0
	vAcOOEHN2FEGzyEG8d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVjk-00000003E2L-2JHh;
	Thu, 18 Apr 2024 17:39:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVjh-00000003E1a-3Qtl
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 17:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC6BF618A3;
	Thu, 18 Apr 2024 17:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDC8C113CC;
	Thu, 18 Apr 2024 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713461988;
	bh=GXEJnDgXD0al0NQ8T331oUdZEbAPsYSGlJB78NRUgOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgH+9nnkJcgiy6ZLsqkR5+4VKV6w0M1TWbLGnvBrFqtBBluQOhKLe++VtghO6iQli
	 gUoimbTqs3XnOnuKzldy/3pkdXn0OWmoUPOaCnek0JeirbnL4BrxKH9EAEXL47nmkH
	 0GLaBfRhfi6ris3bXKmuZUDFbtYPovoHuImdu+R6QOks8aEfzpSEna8rhYD37KMDil
	 yvERbictIkGfKdXKxb5lVgjGWvb1TDXNf55GcQe1MEFJq/euzmz2FeDbaPdBse2Mwq
	 R3kuWUaRuEhBhNxGL2Ph+njoeNuLQSCZo+HiflYCamYSx/XQ5Mp6Lvq+b6Z0oJ/Jua
	 tGpvf4w9LtxfA==
Date: Thu, 18 Apr 2024 10:39:46 -0700
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
Message-ID: <20240418173946.GB1081@sol.localdomain>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418173203.GA1081@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_103950_097615_697E1608 
X-CRM114-Status: GOOD (  33.64  )
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

On Thu, Apr 18, 2024 at 10:32:03AM -0700, Eric Biggers wrote:
> On Thu, Apr 18, 2024 at 05:53:55PM +0100, Conor Dooley wrote:
> > > If it would be useful to do so, we should be able to enable some of the code
> > > with a smaller VLEN and/or EEW once it has been tested in those configurations.
> > > Some of it should work, but some of it won't be able to work.  (For example, the
> > > SHA512 instructions require EEW==64.)
> > > 
> > > Also note that currently all the RISC-V vector crypto code only supports riscv64
> > > (XLEN=64).  Similarly, that could be relaxed in the future if people really need
> > > the vector crypto acceleration on 32-bit CPUs...  But similarly, the code would
> > > need to be revised and tested in that configuration.
> > > 
> > > > Eric/Jerry (although read the previous paragraph too):
> > > > I noticed that the sha256 glue code calls crypto_simd_usable(), and in
> > > > turn may_use_simd() before kernel_vector_begin(). The chacha20 glue code
> > > > does not call either, which seems to violate the edict in
> > > > kernel_vector_begin()'s kerneldoc:
> > > > "Must not be called unless may_use_simd() returns true."
> > > 
> > > skcipher algorithms can only be invoked in process and softirq context.  This
> > > differs from shash algorithms which can be invoked in any context.
> > > 
> > > My understanding is that, like arm64, RISC-V always allows non-nested
> > > kernel-mode vector to be used in process and softirq context -- and in fact,
> > > this was intentionally done in order to support use cases like this.  So that's
> > > why the RISC-V skcipher algorithms don't check for may_use_simd() before calling
> > > kernel_vector_begin().
> > 
> > I see, thanks for explaining that. I think you should probably check
> > somewhere if has_vector() returns true in that driver though before
> > using vector instructions. Only checking vlen seems to me like relying on
> > an implementation detail and if we set vlen for the T-Head/0.7.1 vector
> > it'd be fooled. That said, I don't think that any of the 0.7.1 vector
> > systems actually support Zvkb, but I hope you get my drift.
> 
> All the algorithms check for at least one of the vector crypto extensions being
> supported, for example Zvkb.  'if (riscv_isa_extension_available(NULL, ZVKB))'
> should return whether the ratified version of Zvkb is supported, and likewise
> for the other vector crypto extensions.  The ratified version of the vector
> crypto extensions depends on the ratified version of the vector extension.  So
> there should be no issue.  If there is, the RISC-V core architecture code needs
> to be fixed to not declare that extensions are supported when they are actually
> incompatible non-standard versions of those extensions.  Incompatible
> non-standard extensions should be represented as separate extensions.
> 

It probably makes sense to check has_vector() to exclude Zve* for now, though.

I am just concerned about how you're suggesting that non-standard extensions
might be pretending to be standard ones and individual users of kernel-mode
vector would need to work around that.  I think that neither has_vector() nor
'if (riscv_isa_extension_available(NULL, ZVKB))' should return true if the CPU's
vector extension is non-standard.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
