Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1D8C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:20:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5224360EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 22:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5224360EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpBzXfQKbw3XptQ3G/1RsNxUmsMnHQo+ZDg5dap2gPk=; b=bjbqVyrLOUFMdB
	Q8iuxRaoh9477bpt0JUOB9mCISfiM3Kef8/uRJWWEc50g/n3XXC6SGQUL1nWfbDNMkxQu24umilPw
	xY5Ato6ZoU6xhtKswrbVGE0fISzehzyr7DvJkWL6RyojXVu2ybMmB6ydolaIGXiw/M6R9gKSYS1Ti
	0YvxzCsjDvvdfRaACfjcyNyXqAzuKQsTyNbq2FKQd5Zwohrv2o1SxIzFx8G4JQ06OqAw/T4EtHe27
	/9o4U2SFBnic7j3t2KKbRG4TOqd1uP3DBsarilz75kFf3wyAWhMye7dfQ21MjTGqOgtphR4un9dQ1
	wUzy3EbDjrI6tmJMZfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhJBG-00EnZ2-Aj; Sun, 31 Oct 2021 22:19:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhJBD-00EnXM-6s
 for linux-riscv@lists.infradead.org; Sun, 31 Oct 2021 22:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635718794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lPPZrT4HkW0yreYUc+o8IFGdpWCwnC6KSSIpRHe7JA=;
 b=VMxJ+KILKFIH7TfCHQPHcVBUq6wUjyUCBbxx47xhKkpwzpaGqTwQwyBu8I6NphZ6FDFw64
 PHNkhBdqiadxYuyN8e3b4IOoqBJoJXoNHhjFPHwY9sGnRjBhqTSa5F8sI/RbBpYfpGmr88
 hqtgGvXHFsh5NatSKRXcSivykcxIH9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-B-0MMCdFPt2mLeVjPh4hvA-1; Sun, 31 Oct 2021 18:19:50 -0400
X-MC-Unique: B-0MMCdFPt2mLeVjPh4hvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADDEB80668E;
 Sun, 31 Oct 2021 22:19:46 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F213B19C59;
 Sun, 31 Oct 2021 22:19:32 +0000 (UTC)
Message-ID: <1f2fb5f18b0f0bcee71c9d506769dd1357273444.camel@redhat.com>
Subject: Re: [PATCH v2 40/43] KVM: VMX: Wake vCPU when delivering posted IRQ
 even if vCPU == this vCPU
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paul Mackerras
 <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org,  kvm-ppc@vger.kernel.org,
 kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Date: Mon, 01 Nov 2021 00:19:31 +0200
In-Reply-To: <YXlwmrrRVIoaU2kG@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-41-seanjc@google.com>
 <a2a4e076-edb8-2cb5-5cb2-6825a1a4559a@redhat.com>
 <YXlwmrrRVIoaU2kG@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_151955_365948_AD59810E 
X-CRM114-Status: GOOD (  12.89  )
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

On Wed, 2021-10-27 at 15:30 +0000, Sean Christopherson wrote:
> On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> > On 09/10/21 04:12, Sean Christopherson wrote:
> > > Lastly, this aligns the non-nested and nested usage of triggering posted
> > > interrupts, and will allow for additional cleanups.
> > 
> > It also aligns with SVM a little bit more (especially given patch 35),
> > doesn't it?
> 
> Yes, aligning VMX and SVM APICv behavior as much as possible is definitely a goal
> of this series, though I suspect I failed to state that anywhere.
> 

Looks reasonable to me.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
