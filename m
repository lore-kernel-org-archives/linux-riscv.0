Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A312610A5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A312610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3sOhpDhlJkF+Hro24BIrffljMVzECL5IqwVhOm8iYo=; b=VLPCNWtRcKji5m
	7Wr3+j9e15XLH1b220xmPo3LZK2C7A9yfMlYwv1kKXoQ9Za+jIDc3PVPquLA/SdLCAXsymCOtQGTF
	BoZLQvDT8Wg/YsWdSJiETOPvmb5VEitX/UP5ZTb4JjcpdhYTfOljgCzSjvOmuD5SZoxQ2W4DNNb/i
	uw3ybc1Zh99t+bVbvdNTHxdz5vt5zk/9AozKtAqihceZA7a/YIplLYMq/1SW0JYfYcjDrNU30oQsV
	JCaT7CLBm/zIm3N6VbUWJburK1WUQgmsFBXDOkQKIlBeJ0lQ2SQpvcPBuXNruGE/du5BubiTs931q
	yC87TwPm9NpczdRnpyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlKz7-0097HR-Ch; Fri, 12 Nov 2021 01:04:05 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlKz3-0097FT-Vq
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 01:04:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id n26so2434011pff.3
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 17:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OqiUBkPNwVtm2ZpjSEzoYhMNAp4tNbVTba3KEv6WN8w=;
 b=pc7ejE9G9f2/DNPzPS7XIXvJtmGfBaF2LxIzkZwFvEfuQOri3Y1155wjk7xjt2PNCJ
 kE24TIPjCcGgUSYiX3UWCA1DBdTKkT1C74bahVgNb9tmSS/hJEwGE9hxKY7yJMJ5/gnk
 kd+TrPPKr0MuJqBAypaAOFEn7+cRqbZm+iMfctLBeivKDevpGMITf+s6vQitBcPNGTgw
 /amQnFMW1BnWMyjEaECoc/twxm/ddAt9qLXsEQJ21ZE/S+ANAhdIOkrMWTDwWGDr9sqH
 T2DNYEPOqsm0H4/svC1i15A5EDGrV+fHlrcxZdbN2PUtjvWHGe4Hnq190TEFtTm6CJzc
 ynvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqiUBkPNwVtm2ZpjSEzoYhMNAp4tNbVTba3KEv6WN8w=;
 b=Z6Yuc1Ni25PwgR9IRr95gtBxbKLJOSPBXmJ2LT6mWOlF7Sb23YU+vD8OHP+sPT/fWG
 x91bv4DUwmUuwGHJZ4k4Y8tLeDF70VT8bYmPH8t24ag4uETeVIeQXSWYBDnIRNdleL3G
 9zR5EylxKN/ZKC8iV2eoN4Dz5IOlO0evc/cgZYcGzWMnPS3H6imiBQA5CeW5TkArxoNa
 N9o2ps2qNRERnVznvwqDrPgIRYJWrlJPWal3J5RdtmZgGoUuNHfAegqMWZ1aIyLegALO
 TFCzxLZIr40fpeuZG+m5wtxHvTU62SeCCavIxna5iRrc1YHUd9Fv+xKDafYSVFh00YI7
 1JYg==
X-Gm-Message-State: AOAM531UefF1oINPm2TQKdaRYoHKkaqIGGUovKaxqUyD6rYvZLiRpKg8
 eP6GOH5ZMC+2nSiFvsUbClKgiA==
X-Google-Smtp-Source: ABdhPJxMgoJUa9ek+o+tvzW6z5WeFQCDZekoSsl946lRj2FCOsMM6fcE3+3c50Ng/MtZ8Re7BsLCDg==
X-Received: by 2002:a63:1441:: with SMTP id 1mr7559189pgu.66.1636679035969;
 Thu, 11 Nov 2021 17:03:55 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t13sm4096818pfl.214.2021.11.11.17.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 17:03:55 -0800 (PST)
Date: Fri, 12 Nov 2021 01:03:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 23/30] KVM: Resolve memslot ID via a hash table
 instead of via a static array
Message-ID: <YY29d7Vb6aiv93mu@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-24-seanjc@google.com>
 <f0b364ed-bf9e-5de9-0449-6d7ba3682405@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0b364ed-bf9e-5de9-0449-6d7ba3682405@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_170402_065969_ACB05EF7 
X-CRM114-Status: GOOD (  25.24  )
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

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > 
> > Memslot ID to the corresponding memslot mappings are currently kept as
> > indices in static id_to_index array.
> > The size of this array depends on the maximum allowed memslot count
> > (regardless of the number of memslots actually in use).
> > 
> > This has become especially problematic recently, when memslot count cap was
> > removed, so the maximum count is now full 32k memslots - the maximum
> > allowed by the current KVM API.
> > 
> > Keeping these IDs in a hash table (instead of an array) avoids this
> > problem.
> > 
> > Resolving a memslot ID to the actual memslot (instead of its index) will
> > also enable transitioning away from an array-based implementation of the
> > whole memslots structure in a later commit.
> > 
> > Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > Co-developed-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   include/linux/kvm_host.h | 16 +++----
> >   virt/kvm/kvm_main.c      | 96 +++++++++++++++++++++++++++++++---------
> >   2 files changed, 84 insertions(+), 28 deletions(-)
> > 
> (..)
> > @@ -1259,17 +1257,49 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
> >   	return 0;
> >   }
> > +static void kvm_replace_memslot(struct kvm_memslots *slots,
> > +				struct kvm_memory_slot *old,
> > +				struct kvm_memory_slot *new)
> > +{
> > +	/*
> > +	 * Remove the old memslot from the hash list, copying the node data
> > +	 * would corrupt the list.
> > +	 */
> > +	if (old) {
> > +		hash_del(&old->id_node);
> > +
> > +		if (!new)
> > +			return;
> > +	}
> > +
> > +	/* Copy the source *data*, not the pointer, to the destination. */
> > +	if (old)
> > +		*new = *old;
> 
> This way of writing it (that, is re-checking whether "old" is not-NULL)
> suggests that it could have been set to NULL inside the previous block
> (since the last check), which isn't true.

Yeah, I think I was trying to minimize the logic delta in future patches, but
looking back at the diffs, that didn't pan out.  I've no objection to folding
the two together.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
