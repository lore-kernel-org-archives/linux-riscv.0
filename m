Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD13C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lnZBNdPyAxJLWLEJ6dWCIq+j4n7GPc67Ko9rWyBsBo=; b=SbiIqbxFVDWTcq
	7Gysrf5ocSXAD6f6ssyZiElG+HqhO0idEMvnWcGiHhQ6tnPsaax7AFw4Ut59DvMNLuXQEDBgDtyAc
	KY8c8snRRasGCBcvEF9WJQB0WrrXqKzrg4CaO6QpCNv+OXiKqrXLxELdnPWgkIGmM5wdd36684Tsz
	CfuaaLSwzeWhE+vrvLyetYXFMpiT1OPL/mgjlFeF24cKmqfRRbYagwNByRscEei01kO4LJ73HwsV2
	scJNe3hM9rPe0SgGf87u6dh/DpVh9sCGhoJAUoS2WIJ0JuE65I1aSkWVbRwiYXlf1fGV+f6T71mjD
	uM/pQ/f+ddSrkmOSMYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFfX-00000007RND-3G5Q;
	Wed, 14 Aug 2024 15:12:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFdV-00000007R04-3QH4;
	Wed, 14 Aug 2024 15:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ec16xa0MAAkJFgb/iR7aA4JVlDAS1oUwx4Z6SJfVoOo=; b=DNjmdX1J40QS/H2a28r2Y5nYEy
	afbnopm6C0SEC2VH/JVVo7IXxnXN6enW7/m6Js5GFzpuHkFeyKcZmbnlLnow5iVQ6xyPD3NtTt+j8
	8OJvSlj0sx3RXP6HcJ3DrE7I4Maoimlm/UhQGp2WuEpyUIZw/Mmp2IfcAJAgW0QYjIDzgtG9jBwa2
	K37KaQXoU2IPTULXoOacKi9cJc8P+zYkTLjfUPU8zu61keNH5d0X50LK+X5sYvHdvaxmk7PhzHn5G
	6XChIOy5HUY8R2gsEuzD+GjRB/MQbL0d51zl+cb26PBVIlKad+uuaCCE/XbSs39dlVgWU0RUWT7vk
	lsiuogHA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFdS-000000085gW-10Nm;
	Wed, 14 Aug 2024 15:10:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2CD2DA7;
	Wed, 14 Aug 2024 08:10:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126053F58B;
	Wed, 14 Aug 2024 08:09:53 -0700 (PDT)
Date: Wed, 14 Aug 2024 16:09:51 +0100
From: Dave Martin <Dave.Martin@arm.com>
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
Subject: Re: [PATCH v10 24/40] arm64/signal: Expose GCS state in signal frames
Message-ID: <ZrzIv3FWNgJizDc2@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_161002_645209_FA30CEDA 
X-CRM114-Status: GOOD (  24.79  )
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

On Thu, Aug 01, 2024 at 01:06:51PM +0100, Mark Brown wrote:
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
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/uapi/asm/sigcontext.h |   9 +++
>  arch/arm64/kernel/signal.c               | 106 +++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)

[...]

> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c

[...]

> @@ -999,6 +1092,13 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
>  			return err;
>  	}
>  
> +	if (add_all || task_gcs_el0_enabled(current)) {
> +		err = sigframe_alloc(user, &user->gcs_offset,
> +				     sizeof(struct gcs_context));
> +		if (err)
> +			return err;
> +	}
> +

Who turns on GCS?  I have a concern that if libc is new enough to be
built for GCS then the libc startup code will to turn it on, even if
the binary stack running on top of libc is old.

Whether a given library should break old binaries is a bit of a grey
area, but I think that libraries that deliberately export stable ABIs
probably shouldn't.


With that in mind, does any GCS state need to be saved at all?

Is there any scenario where it is legitimate for the signal handler to
change the shadow stack mode or to return with an altered GCSPR_EL0?

Is the guarded stack considered necessary (or at least beneficial) for
backtracing, or is the regular stack sufficient?

(I'm assuming that unwind tables / debug info should allow the shadow
stack to be unwound anyway; rather this question is about whether
software can straightforwardly find out the interrupted GCSPR_EL0
without this information... and whether it needs to.)


>  	if (system_supports_sve() || system_supports_sme()) {
>  		unsigned int vq = 0;
>  
> @@ -1099,6 +1199,12 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
>  		__put_user_error(current->thread.fault_code, &esr_ctx->esr, err);
>  	}
>  
> +	if (system_supports_gcs() && err == 0 && user->gcs_offset) {
> +		struct gcs_context __user *gcs_ctx =
> +			apply_user_offset(user, user->gcs_offset);
> +		err |= preserve_gcs_context(gcs_ctx);
> +	}
> +

[...]

Cheers
---Dave

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
