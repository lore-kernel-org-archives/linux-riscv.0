Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E042C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2KHb66nQZA48R5ZqbfWxA0BIfolQB5282vi2vBpa+Q=; b=rvotsbIELyPQBB
	vT5BfserNJG3KZsVZeM5JIxJQ7vi2ZGHWcbZWsHFJo0s6kH+uLWmVWkcv+KEwMWrFdrqBEwQbjW0a
	wm8WgFzBrSjACA43wWUmqn85eOMWPDlZ/ztEsxLdEwYJMknTNte+uO2IhASkJDzT5XC3qqyqvALtC
	1BSQxP85pvfhkeBj4ipzxMkRr0ztDWmPtLFS8smnMl4UL039s5MhrTbza1KVvNGye6x3fOZwOltL1
	65c0MGndPvyc0SvNoNr4lMgjb1YHcw9SdSy4zTWHMSPxaQLQ5atqHDdXEu+SAbRmu6FzFa8IpAIdp
	GIRgi/lomz8qwxxVUk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrpYN-002znB-8u; Mon, 29 Nov 2021 22:55:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrpXz-002zdl-HM
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 22:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638226492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBs8K8t7lGxGRJRgDQFXR8lGz6ECPAkAgLHVeZTQziQ=;
 b=ECgDp+mEoLo0m9pyXBF9PTypSDRkxkGm2YJ0zpEpsBZTo7AT/ehC5q6qyN4ekIMGDYh5sg
 tKv4VGGDma1A1zBlLfJB2Q5b1T2huVnA5Ys9f6wg9VvpD/aA833Zjb1Jy8uCb5ElVEWh9U
 rdVy7/BHkwdZCvovliKlOstoUy7JgIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-_y8EtH9fON-4WtdCdy8PgA-1; Mon, 29 Nov 2021 17:54:48 -0500
X-MC-Unique: _y8EtH9fON-4WtdCdy8PgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98501B18BD1;
 Mon, 29 Nov 2021 22:54:38 +0000 (UTC)
Received: from starship (unknown [10.40.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D923D78C2E;
 Mon, 29 Nov 2021 22:53:38 +0000 (UTC)
Message-ID: <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
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
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>, Wei Huang
 <wei.huang2@amd.com>
Date: Tue, 30 Nov 2021 00:53:37 +0200
In-Reply-To: <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_145455_688062_8C7FF6E3 
X-CRM114-Status: GOOD (  27.46  )
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

On Mon, 2021-11-29 at 20:18 +0100, Paolo Bonzini wrote:
> On 11/29/21 19:55, Sean Christopherson wrote:
> > > Still it does seem to be a race that happens when IS_RUNNING=true but
> > > vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
> > > trigger because it moves IS_RUNNING=false later.
> > 
> > Oh!  Any chance the bug only repros with preemption enabled?  That would explain
> > why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.
> 
> Me too.
> 
> > svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
> > passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
> > avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.
> 
> That would make a lot of sense.  avic_vcpu_load() can handle 
> svm->avic_is_running = false, but avic_set_running still needs its body 
> wrapped by preempt_disable/preempt_enable.
> 
> Fedora's kernel is CONFIG_PREEMPT_VOLUNTARY, but I know Maxim uses his 
> own build so it would not surprise me if he used CONFIG_PREEMPT=y.
> 
> Paolo
> 

I will write ll the details tomorrow but I strongly suspect the CPU errata 
https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
#1235
 
Basically what I see that
 
1. vCPU2 disables is_running in avic physical id cache
2. vCPU2 checks that IRR is empty and it is
3. vCPU2 does schedule();
 
and it keeps on sleeping forever. If I kick it via signal 
(like just doing 'info registers' qemu hmp command
or just stop/cont on the same hmp interface, the
vCPU wakes up and notices that IRR suddenly is not empty,
and the VM comes back to life (and then hangs after a while again
with the same problem....).
 
As far as I see in the traces, the bit in IRR came from
another VCPU who didn't respect the ir_running bit and didn't get 
AVIC_INCOMPLETE_IPI VMexit.
I can't 100% prove it yet, but everything in the trace shows this.
 
About the rest of the environment, currently I reproduce this in
a VM which has no pci passed through devices at all, just AVIC.
(I wasn't able to reproduce it before just because I forgot to
enable AVIC in this configuration).
 
So I also agree that Sean's patch is not to blame here,
it just made the window between setting is_running and getting to sleep
shorter and made it less likely that other vCPUs will pick up the is_running change.
(I suspect that they pick it up on next vmrun, and otherwise the value is somehow
cached wrongfully in them).
 
A very performance killing workaround of kicking all vCPUs when one of them enters vcpu_block
does seem to work for me but it skews all the timing off so I can't prove it.
 
That is all, I will write more detailed info, including some traces I have.
 
I do use windows 10 with so called LatencyMon in it, which shows overall how
much latency hardware interrupts have, which used to be useful for me to
ensure that my VMs are suitable for RT like latency (even before I joined RedHat,
I tuned my VMs as much as I could to make my Rift CV1 VR headset work well which 
needs RT like latencies.
 
These days VR works fine in my VMs anyway, but I still kept this tool to keep an eye on it).
 
I really need to write a kvm unit test to stress test IPIs, especially this case,
I will do this very soon.
 
 
Wei Huang, any info on this would be very helpful. 
 
Maybe putting the avic physical table in UC memory would help? 
Maybe ringing doorbells of all other vcpus will help them notice the change?

Best regards,
	Maxim Levitsky


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
