Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2761C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 04:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TfcmiXS8kwTgb21TVxVA/kzixW78EyLJL06iolDsr4=; b=xFXXe4TccptWvl
	vF33jwRbAxdQ0174XnXNY54BGTrXDJ0ATcs98VWsX2W+DBy3pzOrydGKc3euJeE/DwQYJInO8ZSxu
	tECcH0YZh6NF4N2dNOk95VoGTu66s9xoIfIK8rUvUpPQBWe6p55s790p3haQMuFEZq6pXf0IFnqjI
	7L5sjHM9lLCwazupykYC3+VRDFhWKRoec+7b5lv6NPt+NP9Z8374IeW33NJuKGN2+H06SyRrN8ZVF
	XjOg7BuztHZ9z4iqPZAW5HXwTjpbh/p+Y0RD3rD+JRPDV0m+60ieYH6xGl0eA1mhCbM1+mrSj+GFG
	dfrhvtxdA/IKTk6jsbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh25b-007KGZ-9F; Wed, 20 Apr 2022 04:37:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh25X-007KE1-QC
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 04:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650429428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQOHNPZTUOaysYmSTDrA55i6Fl6EOOvTznA+1gLQJg4=;
 b=JhScV5gWHuJ2evt88+JqWSKvF568IJpo3p40qDNT1xMKgdsxB82pPY1qKZ24bY5rUVe6ht
 RX+BtD9m5peKGwuQInOwjM2H9BaRiJ7o//dp3LqL0mw7o++SQO7kBMz2zu5TREjtyR6vPl
 M7v7Pcn0NXTf8Z4MBYZ7EI6W3zzB/fw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-QZo87eu1MGGvqboxyXWg5g-1; Wed, 20 Apr 2022 00:37:05 -0400
X-MC-Unique: QZo87eu1MGGvqboxyXWg5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109D3800B28;
 Wed, 20 Apr 2022 04:37:04 +0000 (UTC)
Received: from starship (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB67214583EE;
 Wed, 20 Apr 2022 04:36:58 +0000 (UTC)
Message-ID: <ad0023fd2ea0297e7bfb8a6a9535b2b8b8f56093.camel@redhat.com>
Subject: Re: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Atish Patra
 <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim
 Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 20 Apr 2022 07:36:57 +0300
In-Reply-To: <Yl7ZMJ/takmHh7tY@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
 <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
 <Yl7ZMJ/takmHh7tY@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_213712_280990_39B6B7F7 
X-CRM114-Status: GOOD (  26.07  )
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

On Tue, 2022-04-19 at 15:45 +0000, Sean Christopherson wrote:
> On Tue, Apr 19, 2022, Maxim Levitsky wrote:
> > On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> > > Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> > > in vcpu->src_idx, along with rudimentary detection of illegal usage,
> > > e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> > > SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> > > unnoticed for quite some time and only cause problems when the nested
> > > lock happens to get a different index.
> > > 
> > > Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> > > likely yell so loudly that it will bring the kernel to its knees.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> 
> ...
> 
> > Looks good to me overall.
> > 
> > Note that there are still places that acquire the lock and store the idx into
> > a local variable, for example kvm_xen_vcpu_set_attr and such.
> > I didn't check yet if these should be converted as well.
> 
> Using a local variable is ok, even desirable.  Nested/multiple readers is not an
> issue, the bug fixed by patch 1 is purely that kvm_vcpu.srcu_idx gets corrupted.

Makes sense. I still recal *that* bug in AVIC inhibition where that srcu lock was
a major PITA, but now I remember that it was not due to nesting of the lock,
but rather fact that we attempted to call syncronize_srcu or something like that
with it held.


> 
> In an ideal world, KVM would _only_ track the SRCU index in local variables, but
> that would require plumbing the local variable down into vcpu_enter_guest() and
> kvm_vcpu_block() so that SRCU can be unlocked prior to entering the guest or
> scheduling out the vCPU.
> 
It all makes sense now - thanks.

Best regards,
	Maxim Levistky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
