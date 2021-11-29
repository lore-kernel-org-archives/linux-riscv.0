Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9841C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 22:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLMgkr2bNspmUva2AIapu13bV6B1p4w+IiD9nzSO6so=; b=TB+YI5Cvzf3RoS
	QSS/dujzwwVAvOkbrxb5lQ1jM2E6BMB4bvjuoXGt9f2y+yPyFVDUVphVcp/t8q7V75/ynXNZ4IKNC
	jQN773Unruongivw6ub7oZk0g/yY7YBOpw7b/jEZwGyVXg66C0LXdFWhEUm0ceJp59dRs0Q1RqXG1
	rbmuyv4hDu4cyyTJjcCkWTA6x56hf9MVuIuMpvmd548xrsD0aH2G0VmcZAnMFZdNo97epTX78+x2U
	Rca0+hlybKuHumLMzfZ7kWpiu8LZOdw6ZUzaNfcXRDIs9wu8mdYK8xoyEUsr7xuCk61njK8pC9zlf
	ltwEtZ0H92oBIDqSw7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrpZ3-00303S-1X; Mon, 29 Nov 2021 22:56:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrpYj-002zvN-SP
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 22:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638226539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91gZzrlhgmWTQlrjqIVKNYdue6kA0WgX9BjgXgHlzEM=;
 b=Ky/9AmthoXvdn79NQKi2zC+UMgPFhBTpMobUzPpGPu67JdN69v5wfYHWbkYf1pa51Y4iuG
 n0Qq1LgEK357ZNdaU1Z3M6rzkdQVt8nL+O35MOVQu69QC/LcKk+HiyqNAdReUP9CqCxIn4
 +egf4JldBYy8HMeTHC9a6XwO6sCoxok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-axjhAptPNz-_8ATyvN31yg-1; Mon, 29 Nov 2021 17:55:36 -0500
X-MC-Unique: axjhAptPNz-_8ATyvN31yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EB4C190B2A1;
 Mon, 29 Nov 2021 22:55:32 +0000 (UTC)
Received: from starship (unknown [10.40.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EDF745D60;
 Mon, 29 Nov 2021 22:55:18 +0000 (UTC)
Message-ID: <c04c9854be8fc9493739f17c2cbd26dd240a8465.camel@redhat.com>
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>
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
Date: Tue, 30 Nov 2021 00:55:17 +0200
In-Reply-To: <ba8341d6-7ee7-1af1-1385-0a9226bbf952@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <ba8341d6-7ee7-1af1-1385-0a9226bbf952@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_145542_086586_C91A8732 
X-CRM114-Status: GOOD (  17.09  )
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

On Mon, 2021-11-29 at 18:55 +0100, Paolo Bonzini wrote:
> On 11/29/21 18:25, Sean Christopherson wrote:
> > > If I apply though only the patch series up to this patch, my fedora VM seems
> > > to work fine, but my windows VM still locks up hard when I run 'LatencyTop'
> > > in it, which doesn't happen without this patch.
> > 
> > Buy "run 'LatencyTop' in it", do you mean running something in the Windows guest?
> > The only search results I can find for LatencyTop are Linux specific.
> 
> I think it's LatencyMon, https://www.resplendence.com/latencymon.
> 
> Paolo
> 
Yes.

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
