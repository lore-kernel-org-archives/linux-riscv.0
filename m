Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E57C5321D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ae8oyTYcA7S9q6PXT5uKzVR/Vmyih9+VAweNRso9T1Y=; b=ztMWrdx0E16V3Q
	MgMB4MCChFZeHrjUO0hAVXwHYvnl2S4YYUc7HHu403lGVPguz1i+uDyBYpqyBsZ4j4Bngw/UDtwcE
	1fgRoiT0LEwWJKrxKygaFPf7yeeptjWSntfq5/lNapLz5BbY9V+1d9K0jfU3+Cm5SA6+ajdupU+lo
	RRBuiUCaBGk525ioF2Z3LmpkxhISUrLGCJow0ELv3Pzax2Cn/2nboDJUhH4nbvIikKiAeXLDxBHef
	Jwz9aAhGiDaSUuLc7Kh1f4FttkRewY+8k83i/dOPr2IAfTS3CWEVM43oezlbScmvjMcr3EXAVuwW0
	jeDn1mZqaxnRl47zBxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBUJ-0000000DlqI-3Cei;
	Thu, 22 Aug 2024 17:20:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBTW-0000000Dlbq-0J82;
	Thu, 22 Aug 2024 17:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0EA90CE1045;
	Thu, 22 Aug 2024 17:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D34C32782;
	Thu, 22 Aug 2024 17:19:44 +0000 (UTC)
Date: Thu, 22 Aug 2024 18:19:38 +0100
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
Subject: Re: [PATCH v11 19/39] arm64/mm: Handle GCS data aborts
Message-ID: <ZsdzKrTbrolW0lHn@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-19-41b81947ecb5@kernel.org>
 <ZsdjbsDrMWgBU9Hj@arm.com>
 <Zsdq4ymaW0vQffH_@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zsdq4ymaW0vQffH_@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_101954_323347_FE12CD0B 
X-CRM114-Status: GOOD (  19.58  )
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

On Thu, Aug 22, 2024 at 05:44:19PM +0100, Mark Brown wrote:
> On Thu, Aug 22, 2024 at 05:12:30PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 22, 2024 at 02:15:22AM +0100, Mark Brown wrote:
> 
> > > +static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 esr)
> 
> > > +	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
> > > +		/* Only GCS operations can write to a GCS page */
> > > +		return is_write_abort(esr);
> > > +	}
> 
> > I don't think that's right. The ESR on this path may not even indicate a
> > data abort and ESR.WnR bit check wouldn't make sense.
> 
> > I presume we want to avoid an infinite loop on a (writeable) GCS page
> > when the user does a normal STR but the CPU raises a permission fault. I
> > think this function needs to just return false if !esr_is_data_abort().
> 
> Yes, that should check for a data abort.  I think I'd formed the
> impression that is_write_abort() included that check somehow.  As you
> say it's to avoid spinning trying to resolve a permission fault for a
> write (non-GCS reads to a GCS page are valid), I do think we need the 
> is_write_abort() since non-GCS reads are valid so something like:
> 
> 	if (!esr_is_data_abort(esr))
> 		return false;
> 
> 	return is_write_abort(esr);

We do need the write abort check but not unconditionally, only if to a
GCS page (you can have other genuine write aborts).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
