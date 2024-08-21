Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7705BC52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxK7M1TYLKC+Cs7V2MscGbPN/jl0+A2Kh3/aS9nY5H8=; b=PB0F3Jf7bIBtqM
	s/4jRhuVxSj32MvnpXdqElMRee0d3QEhyebntSMj+eEiYf1xn/HIjKFKxDwt0wYJQDIWzL+qubP1O
	g5xmmyq6wUQrThNKnZR1W/Xh1lquNwm8Uk5mONec26xJHmNRBflB2ZTu5tXSJup5KzBhmj/fEGtOU
	CJoLgcUj+TMSAWXRikQTpByX8SY+eFddBgkdGeZvr4QsiYVnfptakOec/wVIkakhSJ4ZItOz/3yE5
	EKKEbAhEYYVbjfBVx9rQPycXQK/9WPHh8B0xj0KgQ7k9OOsrybUv4KouKMJNSSLOMzVI9CP9abN7b
	HiHw7w3r0DOtH5X6EyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgh3o-000000089Io-24wv;
	Wed, 21 Aug 2024 08:51:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgh31-0000000897i-1oNg;
	Wed, 21 Aug 2024 08:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE55960F57;
	Wed, 21 Aug 2024 08:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F403AC32782;
	Wed, 21 Aug 2024 08:50:24 +0000 (UTC)
Date: Wed, 21 Aug 2024 09:50:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 19/40] arm64/gcs: Context switch GCS state for EL0
Message-ID: <ZsWqTtCq1mNJH1vz@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
 <ZsMwhdmE_Ai9BbM9@arm.com>
 <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
 <3b316422-7f88-4f5d-a691-eb9209ec4ba9@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b316422-7f88-4f5d-a691-eb9209ec4ba9@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_015031_541170_9ACD04BA 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Aug 20, 2024 at 06:56:19PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2024 at 04:44:52PM +0100, Mark Brown wrote:
> > On Mon, Aug 19, 2024 at 12:46:13PM +0100, Catalin Marinas wrote:
> > > On Thu, Aug 01, 2024 at 01:06:46PM +0100, Mark Brown wrote:
> 
> > > > +	/*
> > > > +	 * Ensure that GCS changes are observable by/from other PEs in
> > > > +	 * case of migration.
> > > > +	 */
> > > > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > > > +		gcsb_dsync();
> 
> > > Could we do the sysreg writing under this 'if' block? If no app is using
> > > GCS (which would be the case for a while), it looks like unnecessary
> > > sysreg accesses.
> 
> > Yes, that should be fine I think.
> 
> I forgot when writing the above that we always allow reads from
> GCSPR_EL0 in order to avoid corner cases for unwinders in the case of
> asynchronous disable.  I'd expect that to be cheap to access though.

But then gcs_preserve_current_state() doesn't save the GCSPR_EL0 value
if the shadow stack was disabled. At the subsequent switch to this task,
we write some stale value.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
