Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFFEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6uwj57gW+SV03JYoGVDCjACI+AP0kwhqHYUqBWzqnU=; b=WtKrSbpetmSMHi
	qaUpSvJC8RZXtwGs2SmBzQztgZV95ZIY+DAvcQBk9miU3d7NeV1zqQzrJSuWTzzPqhLq4m2Dm4w2n
	vHZWrYWHUUIQi3wiWvogzvizQxd7N8YmGSUxlXFQTMqg/JNGyhgafyB6tdZtGNxnhyfKUwaxjKSGO
	+0SC7StSuT+E8sL/smjNrFxjtokJw4Tp7LteAwY7K78WCCxexDnYW6J0FPMSGxJWIZ3K4SRmxDItD
	6AI/+V5vfM+v7108HFvttrt6y8f3FSIYukyCfFyC+DjV83HzDzYJ9ramUOBFJV798iyq4bmZ4clN5
	q2NJb7wIC+C6997Psx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7P8-007bmU-2m;
	Wed, 19 Jul 2023 13:39:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7P4-007bk4-1O;
	Wed, 19 Jul 2023 13:39:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A793616F1;
	Wed, 19 Jul 2023 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507F6C433C8;
	Wed, 19 Jul 2023 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689773980;
	bh=KIb7q+NtNE+KBfEiNJ0Q3nOHxWMm45lA4WVZ9SwBWF8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=gaqxW45kGtoKFnDNNv629brjH/mey+u1zrY+JTYF+Xct1aygG1J4Cf6N5TAdbyf95
	 2UQ3DpMsJY9gZ/ErtakGGWIqjwaqOwsKcm2y3YVSYVrxM+2RWzCuF6bzEjT83PpAcr
	 AGyWDI+pJBXz2XJ1m2wYil5ZnC85al8khQ/W4g+oUVReQT1yoreruC76NRb0RMublg
	 +no2nvv+RqXbaCJv3KQVstHdVnFLcEEYeY1VCIjZ704OwGCykRUyhgj3tGnEgItJBD
	 Kzs/75HMkiwCdVcTz9jVBoTVjf+xmRrTVbvZXW9OTzSwRub4koHl/Aq6fKSbtpIb+H
	 H1gh8r1VAddMg==
Mime-Version: 1.0
Date: Wed, 19 Jul 2023 16:39:23 +0300
Message-Id: <CU66VMG4IKSD.33KF2CEZJ2I1@suppilovahvero>
Cc: <kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.linux.dev>, <linux-mips@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Chao Peng" <chao.p.peng@linux.intel.com>,
 "Fuad Tabba" <tabba@google.com>, "Yu Zhang" <yu.c.zhang@linux.intel.com>,
 "Vishal Annapurve" <vannapurve@google.com>, "Ackerley Tng"
 <ackerleytng@google.com>, "Maciej Szmigiero" <mail@maciej.szmigiero.name>,
 "Vlastimil Babka" <vbabka@suse.cz>, "David Hildenbrand" <david@redhat.com>,
 "Quentin Perret" <qperret@google.com>, "Michael Roth"
 <michael.roth@amd.com>, "Wang" <wei.w.wang@intel.com>, "Liam Merwick"
 <liam.merwick@oracle.com>, "Isaku Yamahata" <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sean Christopherson" <seanjc@google.com>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Marc Zyngier" <maz@kernel.org>, "Oliver Upton"
 <oliver.upton@linux.dev>, "Huacai Chen" <chenhuacai@kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Anup Patel" <anup@brainfault.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Paul Moore" <paul@paul-moore.com>, "James
 Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
X-Mailer: aerc 0.14.0
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_063942_514273_D28A2DA4 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
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

On Wed Jul 19, 2023 at 2:44 AM EEST, Sean Christopherson wrote:
>  	/* Huge pages aren't expected to be modified without first being zapped. */
> -	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
> +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);

Not familiar with this code. Just checking whether whether instead
pr_{warn,err}() combined with return false would be a more graceful
option?

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
