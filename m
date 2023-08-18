Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B098DEE4982
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4omnRqeuHzvOYmYljBGUqr9khAac2pj4Jhnx7EftSc=; b=vjJNyrzyZU22Ux
	A7udbu3WN4O5ZQoMBbvatMf8bHZ3VQ0IZxeHtDiLJ9/JZgsrSf5SQarw9124oUTK7zn2G44NpfiNl
	3wX2Eymdxty7GNWGlCh0Ytq8VP9tnJ6QcixHQDX23uylmm0a1+QbER1UsXBqN6YFf71+FtcDszIX7
	CjwlOBG4seRyUghHGU8RuiTJk+XBCHwvzweSSfE424qQurzuJ5SH4/NndzaGWf9lvgVYXlzeN/QPs
	qHSjpCKW/dRVl8XURxPRB8yWvAuvZdN/MiOi1GFyvlPgm9/mj89WtvbqFLH4LbKXwjQSgeTmybyFa
	K8EH6PFturMGndP8Hckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3IU-009nH1-1V;
	Fri, 18 Aug 2023 17:30:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3IR-009nG3-10;
	Fri, 18 Aug 2023 17:30:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF22D63FF9;
	Fri, 18 Aug 2023 17:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61717C433C7;
	Fri, 18 Aug 2023 17:29:56 +0000 (UTC)
Date: Fri, 18 Aug 2023 18:29:54 +0100
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
Message-ID: <ZN+qki9EaZ6f9XNi@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_103003_417890_8700A880 
X-CRM114-Status: GOOD (  27.11  )
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

On Wed, Aug 09, 2023 at 04:34:38PM +0100, Mark Brown wrote:
> On Wed, Aug 09, 2023 at 03:24:14PM +0100, Catalin Marinas wrote:
> > On Mon, Aug 07, 2023 at 11:00:08PM +0100, Mark Brown wrote:
> > > +* When set PR_SHADOW_STACK_ENABLE flag allocates a Guarded Control Stack for
> > 
> > The 'for' at the end of the line above is not needed.
> > 
> > > +  and enables GCS for the thread, enabling the functionality controlled by
> 
> I find it a little clearer that it's a per thread stack here but sure.

If it reads better for you, feel free to keep it as is.

> > > +3.  Allocation of Guarded Control Stacks
> > > +----------------------------------------
> 
> > > +* When GCS is enabled for a thread a new Guarded Control Stack will be
> > > +  allocated for it of size RLIMIT_STACK / 2 or 2 gigabytes, whichever is
> > > +  smaller.
> 
> > Is this number based on the fact that a function call would only push
> > the LR to GCS while standard function prologue pushes at least two
> > registers?
> 
> It's actually based on bitrot that I'd initially chosen a smaller value
> since it's likely that functions will push at least something as you
> suggest, the patches now just use RLIMIT_STACK.  I'll fix.

A related question - it may have been discussed intensively on the x86
thread (I may read it sometime) - why not have the libc map the shadow
stack and pass the pointer/size to clone3()? It saves us from having to
guess what the right size we'd need. struct clone_args is extensible.

(I plan to get back next week to this series, I'll need to read a bit
more on the spec)

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
