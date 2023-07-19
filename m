Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A02EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nc07iEKGxeQkc2e73pSnJlGMv02yDnrnvZBg90v2AxQ=; b=yKc/QCvUANQolo
	RXhimgvad6rtZJdlnhLIVRzd/fHeNmPtUFL2OBkDlDW6JVAO2qLegNG4oBXggFpPmzRoT8+iVha9C
	Hl5qz/zu5hageTdRkgLTnLiHt+0u7DsZRoa2vGE9hpc333n+bAxacDpFizMVyhG2gXsakgSytyrxG
	GyGkNow3VFw+oBlaWJ8Z0iKFzekLJdwv9JUpI7IhHlWmsGgNpD6YMOFFYiNuzM/g5tq41jo2Q+qdB
	dLRULy3NnRaiuMMgVBCj7LNhpn0C2mIReQs9ujeVInROUgRskaTUmSwu5mpoXRKzvn0E8QRITNqs8
	ohT7bgzHUM/YV0r1obxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7nT-007fJt-0p;
	Wed, 19 Jul 2023 14:04:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7nP-007fIm-1Y;
	Wed, 19 Jul 2023 14:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6220161703;
	Wed, 19 Jul 2023 14:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A33C433C7;
	Wed, 19 Jul 2023 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689775488;
	bh=DsojJ8c08YhYOhIvhoV59R7SwUBwaWbGSlmHEcsKZIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtDEmqkabHBem9yJ7UzUmARHyvi7MfK3yPcEyBtqqc7iZpVi7XQ8rE/0nEed/u3fv
	 4jebzSAa69JN1WtB38UjvB8xD06fuG2SQQtcGs8jKC6rGw448mbgLhZMths0nC0WNk
	 vSk76ltaFEH6wgCafpCjBas90/imoqlU4CuITdsDb72bjCO7WlVe71Cfrb+pCSO8yZ
	 NDQtZKHAvd1GCWZqcLWxVgwspGle7NGLv6vFH2Okt1VtqRbTTatFLMZSjaQb2z/hQL
	 a29Uwycd9cZsDnrGsxpeQF6Z4gXKMbCbFgBumx/gikMzJL8w9GfYE5x+oKv/FxQgS8
	 26Rb5GPG8hhOw==
Date: Wed, 19 Jul 2023 17:04:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH 04/35] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <20230719140419.GK1901145@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-4-bf567f93bba6@kernel.org>
 <20230719114437.GJ1901145@kernel.org>
 <01dd7853-953d-4715-8cf0-c2f500065b55@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01dd7853-953d-4715-8cf0-c2f500065b55@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_070451_602953_285F35D7 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, Jul 19, 2023 at 02:25:38PM +0100, Mark Brown wrote:
> On Wed, Jul 19, 2023 at 02:44:37PM +0300, Mike Rapoport wrote:
> > On Sun, Jul 16, 2023 at 10:51:00PM +0100, Mark Brown wrote:
> 
> > > +7.  ptrace extensions
> > > +---------------------
> > > +
> > > +* A new regset NT_ARM_GCS is defined for use with PTRACE_GETREGSET and
> > > +  PTRACE_SETREGSET.
> > > +
> > > +* Due to the complexity surrounding allocation and deallocation of stakcs and
> > > +  lack of practical application changes to the GCS configuration via ptrace
> > > +  are not supported.
> 
> > On x86 CRIU needed to be able to temporarily unlock shadow stack features
> > to recreate the shadow stack of the thread being restored. I presume CRIU
> > will need something like that on arm64 as well.
> 
> It would be good to understand why and what exactly is needed here.
> I'm guessing the main thing would be stores? 

Yes, CRIU has to modify the shadow stack.

CRIU uses sigreturn directly, so we had to update the shadow stack before
calling sigreturn.
On x86 ptrace(POKEDATA) and update of the shadow stack pointer were enough,
but it looks like ptrace(POKEDATA) won't work on arm64.

Another place that requires shadow stack modifications is the restore of
the shadow stack from the checkpoint. On x86 we had to enable WRSS and that
required to temporarily unlock the features.

> It's relatively easy to add features later, I think I'll just add support
> for everything except enable just now.

Fair enough :)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
