Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0313EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG8rmVe5rT0v/Gjsjc3P6OhRpVx2gtUnGDUUeio8CMw=; b=oXgL+mGc0TeowL
	4UwOCpw2oclDCUlpEvOjJwlK/0GFzF4QhkBHVMwKi7hl/uSR1bRKtrjfa25qn7aPrBT3HpSCqe0WO
	+ERLDZHr8uQFKLaGNLAP3G5EZztx1IaSbSxA55FwTSxXaiq2JdI1o5gRUyGxrIzVE9S4Sc9OxySgE
	IMHlZOy/w9UNucJlZXrIMX96hOQcmL5lxadd1k2XW+jFCm7uZA1gLRRNIQOq5ZHnI54i33NDVlXXS
	nOwcEmK7GIeWC1fjyuKIYrL0gOm9ln4Hu7zCt9loW47cUedjedYGhBPooc0zilzDHmZ/icP5gVzca
	u7NyH+yKnNa3l9TJB8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9PXN-00Bc6E-2x;
	Wed, 14 Jun 2023 12:23:45 +0000
Received: from out-2.mta0.migadu.com ([2001:41d0:1004:224b::2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9PXK-00Bc3O-0b
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 12:23:44 +0000
Date: Wed, 14 Jun 2023 12:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686745418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wQb4z5JVMfEidGknQD3xscf32z72ie53CeaTZ4MqnRo=;
	b=VDJHBwbnWvVpVV2I5wdZ1dSmkV4OW6DcXGB7WkRvbQbH6ER5gTv95Aul+DGOp3MA8pjOAX
	0zLmfb5AUIxalCYMg97MGheRtghN8tPVWj5eSM3htLfyZm7zxBgdLPibhTnINAzEYZORpr
	wAQ4FhHqgISs2x21TFI+MTTB8WH2WY8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Wei Wang <wei.w.wang@intel.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND v2] KVM: move KVM_CAP_DEVICE_CTRL to the generic
 check
Message-ID: <ZImxRC3QlLbPhwsC@linux.dev>
References: <20230315101606.10636-1-wei.w.wang@intel.com>
 <ZIjcoOaexz5YAyWT@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZIjcoOaexz5YAyWT@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_052342_364831_F38AC966 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, Jun 13, 2023 at 02:16:16PM -0700, Sean Christopherson wrote:
> +<everyone else>
> 
> Please use scripts/get_maintainer.pl to generate the To/Cc lists.  This may be
> trivial, but it still needs eyeballs from the relevant maintainers.

+1000. I'd buy someone a beer if they made a bot that just ran
get_maintainer on patches that hit the list :)

> On Wed, Mar 15, 2023, Wei Wang wrote:
> > KVM_CAP_DEVICE_CTRL allows userspace to check if the kvm_device
> > framework (e.g. KVM_CREATE_DEVICE) is supported by KVM. Move
> > KVM_CAP_DEVICE_CTRL to the generic check for the two reasons:
> > 1) it already supports arch agnostic usages (i.e. KVM_DEV_TYPE_VFIO).
> > For example, userspace VFIO implementation may needs to create
> > KVM_DEV_TYPE_VFIO on x86, riscv, or arm etc. It is simpler to have it
> > checked at the generic code than at each arch's code.
> > 2) KVM_CREATE_DEVICE has been added to the generic code.
> > 
> > Link: https://lore.kernel.org/all/20221215115207.14784-1-wei.w.wang@intel.com
> > Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/arm.c       | 1 -
> >  arch/powerpc/kvm/powerpc.c | 1 -
> >  arch/riscv/kvm/vm.c        | 1 -
> >  arch/s390/kvm/kvm-s390.c   | 1 -
> >  virt/kvm/kvm_main.c        | 1 +
> >  5 files changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 3bd732eaf087..96329e675771 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -202,7 +202,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  		r = vgic_present;
> >  		break;
> >  	case KVM_CAP_IOEVENTFD:
> > -	case KVM_CAP_DEVICE_CTRL:
> >  	case KVM_CAP_USER_MEMORY:
> >  	case KVM_CAP_SYNC_MMU:
> >  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:

for arm64:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
