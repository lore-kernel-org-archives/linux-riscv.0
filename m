Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3758ECFC5E9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNSPAJb0VUHuKRpFFtAuudCU5SIxo341vS4Gsbn4638=; b=2iyAiVXh2h5xMF
	qSRFt65A5TrJ1UOS8kKoXe7qfk/aJXe0E2Hmq2rHIhirUk0pr+NxY6abOSF5G1fzPguh89ge69NKS
	nk7Fl/PTCh4u4gFMN81539ZB4K3zvAg6H2NiAueF/ZeOBElab0I7oHh0KVnof8MH1dxOUpJ0F6m0/
	GXcqwjXkIXq7ynjrJ0nlWQDH8UboWMlKBSI0aqZox2UrMpm6hjIwfaWuK9z+AgT1XxcHS/T4bEkmC
	irsiOCoS23UWzLpnacc8jFV3jB2rhSa0Dn73Ws2i6gsvaS069NQFzFkN8Szl5vI+EsMeHtKy2NrHL
	3UdqQZrVIB6sobGSX/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywot-0000000DfHd-0hRK;
	Thu, 10 Oct 2024 17:19:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sywmi-0000000DeS8-3swr;
	Thu, 10 Oct 2024 17:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uUXwx+8x5Cz+4d0Je9KlGs+DHXYYd+Mrap2dE87CUQM=; b=Bc0wh0lHMv2CEd6iurAN/Dqwot
	CoanXaVbzBbjKXsx5TkPHS6qjBst/j5nlDdhmzCYpNWpLu8lLfPIIv3v84ItLnvMitUCYVGPyxiVz
	I5VPW18WASGnoB1kITABUals6nGtQn1m4OAnHNL3LMWYfTMbEyCX7zF1vXphLUHQRJB2+0skkp/o2
	v2lKHF5omCUHxivmcpRlR3rJxI9oVEzOqpe4ts+XjSCR9zhzG4MbFw/bB1rbVSjGpHdRAxs8Hcg6t
	imbCTrWyWUIvGR2IVhbHfoH4067tPV2GYXAWjiZRMHEZlkaalbaiLFBXwF/OFtRI5EbyMexAhKtpk
	RT0LHS1w==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sywmf-00000005SsF-2Djm;
	Thu, 10 Oct 2024 17:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7183A44C0F;
	Thu, 10 Oct 2024 17:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCEAC4CEC5;
	Thu, 10 Oct 2024 17:16:54 +0000 (UTC)
Date: Thu, 10 Oct 2024 18:16:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 11/40] arm64/gcs: Provide basic EL2 setup to allow
 GCS usage at EL0 and EL1
Message-ID: <ZwgMBAhR5-5R5EYC@arm.com>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-11-222b78d87eee@kernel.org>
 <20241009204903.GA3353168@thelio-3990X>
 <86msjc56mi.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86msjc56mi.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_181705_821458_6ACCFAAA 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Oct 10, 2024 at 04:18:13PM +0100, Marc Zyngier wrote:
> From 20c98d2647c11db1e40768f92c5998ff5d764a3a Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Thu, 10 Oct 2024 16:13:26 +0100
> Subject: [PATCH] KVM: arm64: Shave a few bytes from the EL2 idmap code
> 
> Our idmap is becoming too big, to the point where it doesn't fit in
> a 4kB page anymore.
> 
> There are some low-hanging fruits though, such as the el2_init_state
> horror that is expanded 3 times in the kernel. Let's at least limit
> ourselves to two copies, which makes the kernel link again.
> 
> At some point, we'll have to have a better way of doing this.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20241009204903.GA3353168@thelio-3990X

Thanks Marc for the quick fix. It looks fine to me, it will keep the
linker quiet for a while. I pushed it to arm64 for-kernelci for the time
being, see if anything falls apart. I'll apply it properly once it gets
a bit more testing.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
