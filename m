Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B7C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DojRC3VsFp+hGN3Ae6r/6vjIpfaaHQBAhdZE9a2z0Qo=; b=xIl7vEqaF0LOpJ
	64Bdy/4lC0RvG9K5paOYwi2EnuN90PY+whb7M4AtTJ38sqVoEC5Mb1nXq+LJrAifUxpR9x6dntGDi
	Qyq2qbwN6R4440Mb+tiBbW0ocph/Ql8YwOmG5/vSpYZAXFybSrSOwx73rFyWgw0o007QoILocQ6qJ
	u3f7j+kbCaaROEkSNjrJP2P/jSnsN2JykBHvpeg1QF9l2KkipDYX88GMr7Fj8d6cienAWvlSdOweB
	jgNLXj9m6jI2BetNftS9MgmiWW0+zYuDK+KUcqFzODMWRL3JLPmIh4ptFwaQkST0f7xYpsRzNX68Y
	kTtWKWqhQph8yKpLTeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWhw-0000000HR0S-0eeG;
	Fri, 23 Aug 2024 16:00:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWh8-0000000HQlv-0drr;
	Fri, 23 Aug 2024 15:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAA8FA426D0;
	Fri, 23 Aug 2024 15:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7C1C32786;
	Fri, 23 Aug 2024 15:59:14 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:59:11 +0100
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
Subject: Re: [PATCH v11 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <Zsixz6Y9xWxqaQaV@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
 <ZshYTyNbveD7WMyJ@arm.com>
 <ZshjmuYcejbhaSBg@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZshjmuYcejbhaSBg@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085922_636727_646F28E9 
X-CRM114-Status: GOOD (  36.44  )
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

On Fri, Aug 23, 2024 at 11:25:30AM +0100, Mark Brown wrote:
> On Fri, Aug 23, 2024 at 10:37:19AM +0100, Catalin Marinas wrote:
> > On Thu, Aug 22, 2024 at 02:15:28AM +0100, Mark Brown wrote:
> 
> > > +	gcs_preserve_current_state();
> > > +	gcspr = current->thread.gcspr_el0 - 8;
> 
> > > +	__put_user_error(gcspr, &ctx->gcspr, err);
> 
> > Do we actually need to store the gcspr value after the cap token has
> > been pushed or just the value of the interrupted context? If we at some
> > point get a sigaltshadowstack() syscall, the saved GCS wouldn't point to
> > the new stack but rather the original one. Unwinders should be able to
> > get the actual GCSPR_EL0 register, no need for the sigcontext to point
> > to the new shadow stack.
> 
> We could store either the cap token or the interrupted GCSPR_EL0 (the
> address below the cap token).  It felt more joined up to go with the cap
> token since notionally signal return is consuming the cap token but
> either way would work, we could just add an offset when looking at the
> pointer.

In a hypothetical sigaltshadowstack() scenario, would the cap go on the
new signal shadow stack or on the old one? I assume on the new one but
in sigcontext we'd save the original GCSPR_EL0. In such hypothetical
case, the original GCSPR_EL0 would not need 8 subtracted.

I need to think some more about this. The gcs_restore_signal() function
makes sense, it starts with the current GCSPR_EL0 on the signal stack
and consumes the token, adds 8 to the shadow stack pointer. The
restore_gcs_context() one is confusing as it happens before consuming
the cap token and assumes that the GCSPR_EL0 value actually points to
the signal stack. If we ever implement an alternative shadow stack, the
original GCSPR_EL0 of the interrupted context would be lost. I know it's
not planned for now but the principles should be the same. The
sigframe.uc should store the interrupted state.

To me the order for sigreturn should be first to consume the cap token,
validate it etc. and then restore GCSPR_EL0 to whatever was saved in the
sigframe.uc prior to the signal being delivered.

> > Also in gcs_signal_entry() in the previous patch, we seem to subtract 16
> > rather than 8.
> 
> We need to not only place a cap but also a GCS frame for the sigreturn
> trampoline, the sigreturn trampoline isn't part of the interrupted
> context so isn't included in the signal frame but it needs to have a
> record on the GCS so that the signal handler doesn't just generate a GCS
> fault if it tries to return to the trampoline.  This means that the
> GCSPR_EL0 that is set for the signal handler needs to move two entries,
> one for the cap token and one for the trampoline.

Yes, this makes sense.

> > What I find confusing is that both restore_gcs_context() and
> > gcs_restore_signal() seem to touch current->thread.gcspr_el0 and the
> > sysreg. Which one takes priority? I should probably check the branch out
> > to see the end result.
> 
> restore_gcs_context() is loading values from the signal frame in memory
> (which will only happen if a GCS context is present) then
> gcs_restore_signal() consumes the token at the top of the stack.  The
> split is because userspace can skip the restore_X_context() functions
> for the optional signal frame elements by removing them from the context
> but we want to ensure that we always consume a token.

I agree we should always consume a token but this should be done from
the actual hardware GCSPR_EL0 value on the sigreturn call rather than
the one restored from sigframe.uc. The restoring should be the last
step.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
