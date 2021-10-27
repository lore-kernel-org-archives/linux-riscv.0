Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754B6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:36:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7B260720
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B7B260720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgxt7jRBSzfE2MuOu8fESd+oWoWLz+84WUqcVDXmcN4=; b=tidioBwyUaPYXW
	ml46ABIN7Dsv7N7jctnWo/BnvI2QOymt6CmrLXv6EhxWfINfXfY8jYwl4DNW4icMhTmlCONv0f85d
	RCLZtMUDaMijLajX0fF98KtEffGvZ5nsp36tXdguAa+Wtzb7wfWQCbqwrn98fz8YRAdVGsbxTz+r1
	EIAPYRMXPdP103juPjkRD47Kue6gAkDyLWw+s2GjKx1dntt8VSMMQIXTAKQRov8+We3M199Uia7+N
	b+jCaf/l98KnVXH1/GIl0TxCNp8uiQ++L5n9cjZyGWy28yS3/RFdAaLT1+UDXRDXzliGB8ptMuiOb
	cB7oAWjCHMSqeBFDOctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfk2u-0058YA-1n; Wed, 27 Oct 2021 14:36:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfk2r-0058XD-DL
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635345408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gXXVZ1M1SPzD/8mviUXXiKMlrNVIcsqsHOKxhlwRek=;
 b=G1PA1ucuiB4g1VrcrH6nFW0KnMDWQ55BP1PKevICK+aLU4sOkU4f563k3jaurGpXP2OG4L
 6K61BlzVfhaiz+y+IkuTt9dVckhXsmNWNuntz7ftup5bsyHbkQW7M6U8C/3F/bGtSut2P6
 3SxM7xGGcUz4pfEc7kKVGTjbWmk5UxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-UU3N_ykSOO6SiL7u12Utfg-1; Wed, 27 Oct 2021 10:36:46 -0400
X-MC-Unique: UU3N_ykSOO6SiL7u12Utfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1095C112C391;
 Wed, 27 Oct 2021 14:35:56 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83585794A9;
 Wed, 27 Oct 2021 14:35:46 +0000 (UTC)
Message-ID: <3a0c3397302d59ea313e079435a18bf1b9a43474.camel@redhat.com>
Subject: Re: [PATCH v2 16/43] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>,  Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, Anup
 Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng
 Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,  Joerg
 Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,  linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Date: Wed, 27 Oct 2021 17:35:45 +0300
In-Reply-To: <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-17-seanjc@google.com>
 <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_073649_569628_D7C70A2A 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, 2021-10-25 at 16:26 +0200, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > Calculate the halt-polling "stop" time using "cur" instead of redoing
> > ktime_get().  In the happy case where hardware correctly predicts
> > do_halt_poll, "cur" is only a few cycles old.  And if the branch is
> > mispredicted, arguably that extra latency should count toward the
> > halt-polling time.
> > 
> > In all likelihood, the numbers involved are in the noise and either
> > approach is perfectly ok.
> 
> Using "start" makes the change even more obvious, so:
> 
>      Calculate the halt-polling "stop" time using "start" instead of redoing
>      ktime_get().  In practice, the numbers involved are in the noise (e.g.,
>      in the happy case where hardware correctly predicts do_halt_poll and
>      there are no interrupts, "start" is probably only a few cycles old)
>      and either approach is perfectly ok.  But it's more precise to count
>      any extra latency toward the halt-polling time.
> 
> Paolo
> 
Agreed.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
