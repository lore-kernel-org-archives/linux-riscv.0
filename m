Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC211C531DF
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/9RHxiHgv4gZFiXyx+0vvO+I1pUxqkrGJb6qQsniCg=; b=oHLEjzzhF8u0+z
	/IPUFPTBPWd7En8Eg9NodKzL0s4tyPqZ2YSbivFlnkBMdJ8bN37j8ImpSSytuFKWke/g0MVNO4jVP
	hAXrlDPfA2gUsuKshidOlvvYHFShpzy+ogpfsNTlCw4UAmGVFh/P5sDiOBRFDqQHWkDTzWzBLrM2a
	XE2c3lmWVG53tQzy4enyiaiqRol7EnYwNBIVjIelaVekKk+ZS6xQnZjCr1BCH4JE+TGg4Y4LI5HWa
	dEw087cFOWZElpe8BI70N11O0k4nWw5tFjjSNGS4xDc23Y4+WvXppeTUIliNr+3OcOCKB5bY+Z4dT
	R7obDQh8U/qCt1/jHqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAVB-0000000DYcP-0VIw;
	Thu, 22 Aug 2024 16:17:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shATB-0000000DXo5-3euu;
	Thu, 22 Aug 2024 16:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B8BD61221;
	Thu, 22 Aug 2024 16:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F58C32782;
	Thu, 22 Aug 2024 16:15:23 +0000 (UTC)
Date: Thu, 22 Aug 2024 17:15:20 +0100
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
Subject: Re: [PATCH v11 20/39] arm64/gcs: Context switch GCS state for EL0
Message-ID: <ZsdkGJb93LjLUyzo@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-20-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-20-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_091529_985656_50FC2113 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Aug 22, 2024 at 02:15:23AM +0100, Mark Brown wrote:
> There are two registers controlling the GCS state of EL0, GCSPR_EL0 which
> is the current GCS pointer and GCSCRE0_EL1 which has enable bits for the
> specific GCS functionality enabled for EL0. Manage these on context switch
> and process lifetime events, GCS is reset on exec().  Also ensure that
> any changes to the GCS memory are visible to other PEs and that changes
> from other PEs are visible on this one by issuing a GCSB DSYNC when
> moving to or from a thread with GCS.
> 
> Since the current GCS configuration of a thread will be visible to
> userspace we store the configuration in the format used with userspace
> and provide a helper which configures the system register as needed.
> 
> On systems that support GCS we always allow access to GCSPR_EL0, this
> facilitates reporting of GCS faults if userspace implements disabling of
> GCS on error - the GCS can still be discovered and examined even if GCS
> has been disabled.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

We could do with a bit more code comments around GCSB DSYNC but
otherwise it looks fine now.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
