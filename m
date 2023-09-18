Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E5FC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js1ocNOOrlWyjaXgzSovxOgZAIYad/jeB8zAYyjoQMs=; b=zS6fefny1YF1g/
	4vN4iF7EBTAff497pQ58Mx7sGUEjddJXnV+mnyUvotTD9NMSMXQa6bYYjWShnj2+pfhSgAangGxxe
	ugc6SDXHp1Q94dS+UGv5gu0C1ACNxDcg5DbtTezv2kBvRnbmbniMDVKJbZxigtS6PZ3OdfdF2m3S1
	TxyWftiEiogXMmm9Xx2DW7dWzld4/bewN0UzAqC9uqolpHBWdLA6SCZu65YemmS0HTRLuGy4WW4lP
	BCxWRCYl09y5llY4kiZjTBfyLUX5heX3//1ul5bUSl0meXFMg9+Y5WtwKh/RFPQYSswMt1adCOWGT
	WMot3/zwZONVuuYx66aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGib-00Fobg-37;
	Mon, 18 Sep 2023 16:03:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGiZ-00Foam-2p
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Sep 2023 16:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1AtaBW2SsBllDiJ99v10Ny7HNDE5iUEtI8mOBYM/rVQ=; b=f77iBHzdqyehH7sJtctf1vI/6m
	gqwAZvRsVeuOM5uhJnpEayztcpEiaLUw+Uvpzs8NBWCwSWIY1mmttx3H6bm2bq1k/oNE4wbM6opO9
	gkMzdKFq+VEvwyypA9msvDVNwepDjdbd3suwVzN34lbOWhlk3XOWDPD0eU0LhPocq8O5AXHlUf9kx
	Sq3NsmfoSGOJ0JToGUV2pPCSmkDHyCTEDfOGhZwBwAaUlKWn521OD97+Q/v1Q8wPvDzckhXZPX2g6
	42GhWH01VZoOSPiIVP63knvTv18Yvc3XghYdqcUFnpo84HxgMPyGPWZ4iWsGk/rp52dZEL6Cx0ZhX
	PJ5TieJQ==;
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qiGiV-00BvNB-Dp
	for linux-riscv@lists.infradead.org; Mon, 18 Sep 2023 16:03:22 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-64cca551ae2so28298526d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695052995; x=1695657795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AtaBW2SsBllDiJ99v10Ny7HNDE5iUEtI8mOBYM/rVQ=;
        b=NOZRAs235QWD7dpchpVtAzSIk5B0p2JtuLvYdmod4j71WuQqrDpEcvvcOxTZzVxPs7
         bYPI0N3RYWrG88rmXeeAeq+BWOrZSWsJInuIohSVpsElk0jdn4/IJYpFbrG/qPqTu/sb
         Zbxin8zyEkmCQsBMSr0vOKaZInA2Op0bweWjHNw6wUoUi9ty+3b/2sYckQpPZ9mP1EkI
         2Bo5Vm+rQs/HgFeIhK/SzEiTkbZPm75/0HgSo2LiWNY6YA+ZQmvoJTHxSPGBJ5kqozCN
         YYyHyglqCjCJZU57SkX7+8DNZHzrTpEGdpZ/X1mya8QHQ5qvqxTbYECpbJhtj2V659/8
         K0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052995; x=1695657795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AtaBW2SsBllDiJ99v10Ny7HNDE5iUEtI8mOBYM/rVQ=;
        b=kN3wZB0zYtqOF4TioxHKN/mNCTs3o6V19XZDDc7Ohz9KAhpSMquIQ+/5ruLiXZpRnl
         Ootx6qU273Rtt/uWTfpvS2ChmF0lPyJHtX70rT/uguyHIwfpwBCwRh5dDJPjQrJfTjll
         UzD3SpzfUCzoG8myXuV5j0IO/n1XjJyQodfH7/GNKyV6DENFQwaaTgp5z2szy3WcH3J3
         b16pERhjuK9csZOvcCFwKp8sKTL20n6OJ0N42eykJrE6iDfD7geHxVIVxXtQvA07RGlv
         xz/MJ+sBdICDGe309fVnVcm5A5qn16Up7kQuiNQDESi/8cOGngVaw46aj30+27F53XcO
         wVuA==
X-Gm-Message-State: AOJu0YyznjFw+jDjk4TemOAOp9p8SkUykT+eIieXU3qqcdLoJ4HXETFd
	HoJywGs1nrWBUVrHz9ZR7hY80A==
X-Google-Smtp-Source: AGHT+IH/YnREI891cZLYoBidRStzCIsQeTayS2VX/iNCJzxAWIRbDBhzALGmOqWbEj1DKL9seHAlIw==
X-Received: by 2002:a0c:eacf:0:b0:655:78f5:bef7 with SMTP id y15-20020a0ceacf000000b0065578f5bef7mr9471806qvp.21.1695052995341;
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id u20-20020a0cdd14000000b006581e82a628sm989437qvk.134.2023.09.18.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:03:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiGiA-0005k6-DG;
	Mon, 18 Sep 2023 13:02:58 -0300
Date: Mon, 18 Sep 2023 13:02:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Anish Ghulati <aghulati@google.com>,
	Venkatesh Srinivas <venkateshs@chromium.org>,
	Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20230918160258.GL13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca>
 <ZQhxpesyXeG+qbS6@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQhxpesyXeG+qbS6@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_170319_528437_478B9CEF 
X-CRM114-Status: GOOD (  19.78  )
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

On Mon, Sep 18, 2023 at 08:49:57AM -0700, Sean Christopherson wrote:
> On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> > On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > > KVM and VFIO do symbol lookups increases the overall complexity and places
> > > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  drivers/vfio/vfio.h      |  2 ++
> > >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> > >  include/linux/vfio.h     |  4 ++-
> > >  virt/kvm/vfio.c          |  9 +++--
> > >  4 files changed, 47 insertions(+), 42 deletions(-)
> > 
> > I don't mind this, but Christoph had disliked my prior attempt to do
> > this with function pointers..
> > 
> > The get can be inlined, IIRC, what about putting a pointer to the put
> > inside the kvm struct?
> 
> That wouldn't allow us to achieve our goal, which is to hide the details of
> "struct kvm" from VFIO (and the rest of the kernel).

> What's the objection to handing VFIO a function pointer?

Hmm, looks like it was this thread:

 https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com

Your rational looks a little better to me.

> > The the normal kvm get/put don't have to exported symbols at all?
> 
> The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
> but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
> KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).

My thought would be to keep it as an inline, there should be some way
to do that without breaking your desire to hide the bulk of the kvm
struct content. Like put the refcount as the first element in the
struct and just don't ifdef it away?.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
