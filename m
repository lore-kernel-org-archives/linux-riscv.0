Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C215ACD379F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYvvyxdR3E57xmOuM2yRLInfVXGMMW4ishU0/erkFg0=; b=X7zzXfZCqrv9Ep
	IM9GACq1r5CBRhrBU7bsRv5z9W3APlBQtk+VaiUOjbpNYuJVFAUwcu6c9mgL0Q08oRNwptPdvYLOq
	/UEzIVh1VsX9ktl7An6o8yP4SAmR31Jjo1SzaKsUY4Wi46kvbWgeL4DL9IbG46uwPwP29OR53jfWN
	zTH+SHdMeQBn4TY7nPal2G4CXHQOUP9guTcF1kT3R3i2wj0Nw3lS27rlgLmmeBtseh9wbSbctztlt
	+QbHKGVJ8ZfYuuPtTe9iQVG7jPkZgXIqVYpHpsqJ9iRR6ztjlC02767fmv9eX7lDmPRaXKSh5Ske/
	+0/VTkqeEUqB26jehrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWYy-00000001A07-3pz8;
	Tue, 03 Sep 2024 16:39:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWY1-000000019ig-3CC6;
	Tue, 03 Sep 2024 16:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3094DA4374F;
	Tue,  3 Sep 2024 16:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697ECC4CEC4;
	Tue,  3 Sep 2024 16:38:22 +0000 (UTC)
Date: Tue, 3 Sep 2024 17:38:20 +0100
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
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 26/39] arm64/ptrace: Expose GCS via ptrace and core
 files
Message-ID: <Ztc7fIneIhCEmesI@arm.com>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
 <20240829-arm64-gcs-v12-26-42fec947436a@kernel.org>
 <ZtYKYMWjApRxFO_-@arm.com>
 <3f190f54-477e-48dd-8a57-8d61ea20413b@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f190f54-477e-48dd-8a57-8d61ea20413b@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_093829_885098_DDD53D94 
X-CRM114-Status: GOOD (  13.13  )
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

On Mon, Sep 02, 2024 at 07:58:28PM +0100, Mark Brown wrote:
> On Mon, Sep 02, 2024 at 07:56:32PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 29, 2024 at 12:27:42AM +0100, Mark Brown wrote:
> 
> > > +static int gcs_get(struct task_struct *target,
> > > +		   const struct user_regset *regset,
> > > +		   struct membuf to)
> 
> > > +	if (target == current)
> > > +		gcs_preserve_current_state();
> 
> > What's the use-case where target == current and do we need something
> > similar for gcs_set()?
> 
> IIRC core file generation so no.

Ah, true. Makes sense.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
