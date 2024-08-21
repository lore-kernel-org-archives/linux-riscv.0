Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4311C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvQE1uCs+eu7fp3rbK/sV5yH9eLbqp7okiGQMSDvYOo=; b=LhG+BGPa3f+FWm
	3UJmvcvtQfRWbuzeZvitP5LFNqBrkIVVCvNIu5Gv6cAY8weMOW3jRdPViXKvYuh3rrkMXA6s4zZTr
	KkgYRbwph8n9SttDJ2x7jnN73rdLuykoPbqT9eBOfSJCLd0lihK3ki+IL5Bsv0VIAdGLOUUqbWvJf
	u6+7LqlZpmcERF5J73BbSix4B1W9woXk4+Zr2uig3CT4traAnyCOm8761FHN+j5cB6GFXF/NZk+Qc
	jAC6ECfiz2KweIGNryU1Ua9psfWIqCxjU1qLOpySpKJfVqIFpWA26Z6g+wbFip0HKz42z5Dq1bByg
	FH954VaSIh0xp0TiKORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpvA-0000000A2vi-44UZ;
	Wed, 21 Aug 2024 18:19:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpuQ-0000000A2n8-3jjx;
	Wed, 21 Aug 2024 18:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5472360C39;
	Wed, 21 Aug 2024 18:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C128C32781;
	Wed, 21 Aug 2024 18:18:08 +0000 (UTC)
Date: Wed, 21 Aug 2024 19:18:06 +0100
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
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <ZsYvXqYEMYvIar28@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZsYj0YYMuX1YRBZT@arm.com>
 <d5473c27-167f-46c3-9368-487ed4b657cf@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5473c27-167f-46c3-9368-487ed4b657cf@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_111814_990478_A1CD55A2 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Aug 21, 2024 at 07:03:13PM +0100, Mark Brown wrote:
> On Wed, Aug 21, 2024 at 06:28:49PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 01, 2024 at 01:06:50PM +0100, Mark Brown wrote:
> > > +	/*
> > > +	 * Push a cap and the GCS entry for the trampoline onto the GCS.
> > > +	 */
> > > +	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
> > > +	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
> > > +	if (ret != 0)
> > > +		return ret;
> 
> > Doesn't the second put_user_gcs() override the previous ret?
> 
> No, we only set ret on error - if the first one faults it'll set ret
> then the second one will either leave it unchanged or write the same
> error code depending on if it fails.  This idiom is used quite a lot in
> the signal code.

You are right, I missed that it's called 'err' in put_user_gcs(),
thought it's overridden.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
