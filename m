Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F42EE49AF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeR91aMo7TRffxeLAer3lvJK/b4X2Ziiuuncr/EdTM4=; b=Dul+thbSPqdm+7
	ufwcVM6Zw5Efji4yXOB/JUgS6v00qIS+h1NIwDhJOtqYzCb6TdNX2Ry7b/U7vaiCZWCpj/JycwHN8
	qRmk9yipadbVfGm3DlIRBxWhsjE2rqAK3TVvHqCR0O8/g/3MHzvHusbvmX1l7JFOiXrVDR2RwOIz/
	tprbpGy2/n6X1iW0GBucwXyTWpOEzcTNwGWLoiWVOPZRH4zuyLBF1iYxuB85uRCvm7siNnvN5smL5
	q6cHOwbyCI7VEkI40adJ2kJ96OzK7AkXv91Ivc655XOIO1tX2czSuFeyuJpeQsxvERurI0dTx3pc5
	kbYd3iy1g56RxdQDn/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUa6-00GXBQ-38;
	Tue, 22 Aug 2023 16:50:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUa3-00GX8O-06;
	Tue, 22 Aug 2023 16:50:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 488DF65A73;
	Tue, 22 Aug 2023 16:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21995C433C8;
	Tue, 22 Aug 2023 16:49:55 +0000 (UTC)
Date: Tue, 22 Aug 2023 17:49:51 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZOTnL1SDJWZjHPUW@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_095011_118737_A1958EC8 
X-CRM114-Status: GOOD (  23.64  )
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

On Fri, Aug 18, 2023 at 08:38:02PM +0100, Mark Brown wrote:
> On Fri, Aug 18, 2023 at 06:29:54PM +0100, Catalin Marinas wrote:
> > A related question - it may have been discussed intensively on the x86
> > thread (I may read it sometime) - why not have the libc map the shadow
> 
> Your assumption that this is a single thread feels optimistic there.

Yeah and I unfortunately ignored all of them.

> > stack and pass the pointer/size to clone3()? It saves us from having to
> > guess what the right size we'd need. struct clone_args is extensible.
> 
> I can't recall or locate the specific reasoning there right now, perhaps
> Rick or someone else can?  I'd guess there would be compat concerns for
> things that don't go via libc which would complicate the story with
> identifying and marking things as GCS/SS safe, it's going to be more
> robust to just supply a GCS if the process is using it.  That said
> having a default doesn't preclude us using the extensibility to allow
> userspace directly to control the GCS size, I would certainly be in
> favour of adding support for that.

It would be good if someone provided a summary of the x86 decision (I'll
get to those thread but most likely in September). I think we concluded
that we can't deploy GCS entirely transparently, so we need a libc
change (apart from the ELF annotations). Since libc is opting in to GCS,
we could also update the pthread_create() etc. to allocate the shadow
together with the standard stack.

Anyway, that's my preference but maybe there were good reasons not to do
this.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
