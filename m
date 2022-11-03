Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFCDC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6r2g0hglC+o1V08NgS6D6weZqsg/g+Z981yKPPVR28=; b=roSGITwwo4efcm
	0do8F/MNNFYhnFkanoSrdcnMTFVH93vS9mAMcvjZKnk2W8rwpRBB3wcHxXqbSkwVmT2iY7jF0o2PP
	s2OQaEZiV2xpOTAlsMWPfP+z1RXEcyhGOui59THVqpzaGpeVKVdvECrhp0vG8ziRmeraakCEQ5DQt
	F0wOQ8RaTi0yi1z4MPMdDcl6BsrPQcQtCLO+SbCxycPgwNZyi97aVhMFArlvFkzXmNPwUHuMYV1sa
	8TU1ltCxBYShhEsGTjgF0wDZ9ZpcXelghDiIwloXjhCUQRNn1YPXCSl/Bg83XzjQPWHzoTE+wyrET
	CLaP2HIOhE7INHDNZ5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZdy-00HOS8-Me; Thu, 03 Nov 2022 12:48:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZdp-00HOOk-5u
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 12:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667479689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Lh+aq0KrT7YT7zq9EYFKfpsO05/wse1gFPTUN4LGR8=;
	b=eKkwDi0tCXUU9QQ/PQIUW4IMURnfh9vlvg80WCjYUGut/ZBe7Fbydk86evtQoScZgPnK80
	5TrhjY0llkObh568owG1UPHjU+911RE383sM9s8H5hNCEC1/DIS3qrS4SHzbmjtV5c334j
	2J1GGJIlvSdCIeQ4zp1eDJ+JN4sj/+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-rDTZzCaNMfqkeMoeZ1x5EQ-1; Thu, 03 Nov 2022 08:46:33 -0400
X-MC-Unique: rDTZzCaNMfqkeMoeZ1x5EQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 145AE823F77;
	Thu,  3 Nov 2022 12:46:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6A2492B06;
	Thu,  3 Nov 2022 12:46:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Sean
 Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra
 <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Isaku Yamahata
 <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>, Thomas
 Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 04/44] KVM: Teardown VFIO ops earlier in kvm_exit()
In-Reply-To: <20221102231911.3107438-5-seanjc@google.com>
Organization: Red Hat GmbH
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-5-seanjc@google.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 03 Nov 2022 13:46:28 +0100
Message-ID: <87edukxl23.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_054824_161881_61646851 
X-CRM114-Status: GOOD (  16.50  )
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

On Wed, Nov 02 2022, Sean Christopherson <seanjc@google.com> wrote:

> Move the call to kvm_vfio_ops_exit() further up kvm_exit() to try and
> bring some amount of symmetry to the setup order in kvm_init(), and more
> importantly so that the arch hooks are invoked dead last by kvm_exit().
> This will allow arch code to move away from the arch hooks without any
> change in ordering between arch code and common code in kvm_exit().
>
> That kvm_vfio_ops_exit() is called last appears to be 100% arbitrary.  It
> was bolted on after the fact by commit 571ee1b68598 ("kvm: vfio: fix
> unregister kvm_device_ops of vfio").  The nullified kvm_device_ops_table
> is also local to kvm_main.c and is used only when there are active VMs,
> so unless arch code is doing something truly bizarre, nullifying the
> table earlier in kvm_exit() is little more than a nop.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks safe to me.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
