Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14F7CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIoFOLjivXnaZrt0aadMXFUuof4oWHwwJw5U/Ie68Wk=; b=yu/mg3JDFpwR4h
	O6chJg7ATONji4KmybF0KTLDZ9GffSSGvwrncog82BWgW4Jpok7SddmupgOW4n07xq3kqyEqmzC28
	L0xvs9tBDc5jaWrxKbB9Q5NKjHdf4QDFkB0LYLtfmMjmAPtRbte2iXGFNJdQHKfBt6VO3KDdZlJUp
	rnXGcDTln1Q9vDSuXdlB1bkj3HDoFEoaBYi8qD30m5nC+MHJCGBa7B9UYfsK+qS/e+qelvj0SwUDh
	bCfHu5AT5wPERxP+TlbEv5wwz0iqet4ucmHuBaU+VSZ2KH+LfmL3WWOgnvfUw46uV02wp8HOQzdyq
	t9LBRCs0blNyxfSNCW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCE0-0000000FKXI-49Rj;
	Mon, 02 Sep 2024 18:56:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCCq-0000000FK9e-1Ofg;
	Mon, 02 Sep 2024 18:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 613D9A4106A;
	Mon,  2 Sep 2024 18:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB9EC4CEC2;
	Mon,  2 Sep 2024 18:55:09 +0000 (UTC)
Date: Mon, 2 Sep 2024 19:55:07 +0100
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
Subject: Re: [PATCH v12 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <ZtYKC8ytQBJpudOt@arm.com>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
 <20240829-arm64-gcs-v12-25-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-25-42fec947436a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_115516_459779_852A4E1C 
X-CRM114-Status: GOOD (  12.90  )
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

On Thu, Aug 29, 2024 at 12:27:41AM +0100, Mark Brown wrote:
> Add a context for the GCS state and include it in the signal context when
> running on a system that supports GCS. We reuse the same flags that the
> prctl() uses to specify which GCS features are enabled and also provide the
> current GCS pointer.
> 
> We do not support enabling GCS via signal return, there is a conflict
> between specifying GCSPR_EL0 and allocation of a new GCS and this is not
> an ancticipated use case.  We also enforce GCS configuration locking on
> signal return.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

It looks fine to me now.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
