Return-Path: <SRS0=W4pZ=WF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CD7C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2019 07:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA93206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2019 07:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ML5r4SLy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA93206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmzHsHt+NCPCrIcGeaRhLzQGAy4etCj8JdtIYDZ98zE=; b=ML5r4SLyGN20h+
	fMVMu8w+1f4hWSWbSKUxsTNWdkLXpRWG61d/2hU4S6iTBYMStupjZjVIMOAenxQPV1vWLzR0A2TTz
	OJUZZvFUVcMTob8w2V26pEPAhtj+Y0g5AgqHJcNoU88n9ddNthg/XdQ/vK2LlppDzTjn3ni9cpopb
	oEc1hxa9p6B75U346+mtktg0jyt8n/SAi4nPK3NimS/b3/RylMUYO6JmWP0VvlfAAn4/15jCZNznR
	fFiktO0/QqVt/X0xECg22siZf+PrgxnUoxwbHT/5op7iTbJsmOWfzuSWoxDT2Q78YJeLCqwuKolm0
	0ZxBnyLp3WBZ1DLS7a6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvzTh-0000ZF-Re; Fri, 09 Aug 2019 07:38:22 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvzSn-0007n2-1I
 for linux-riscv@lists.infradead.org; Fri, 09 Aug 2019 07:37:27 +0000
Received: by mail-wm1-f66.google.com with SMTP id p77so5603648wme.0
 for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2019 00:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uupbz8YTA+5+vl0Fvj16ZEysWFtXXYG59jnDaWr/XA8=;
 b=eE9PNZnfWHaCwrqTqt4HCtPnmYPEbAl1tfuF+zHt8n4SRGPd0ugt91H9MFgKtXqcvq
 4ZvHHJaNRnGERntL2aZLBrZu1XbuX0GCaSIkDA36QHx7GHz8h3nsCTVA9clSzXmY/p/t
 CKobfYcOI/QjUeZXnUQgqSD6PMTfZiU5phchQjWXGPgTMpu+y/HVQNsRnpOmyx4EjuVC
 qdfCN3KO3GPbav3ggeybV5KgpwGbMb64RwGHV37cfIvoSRlaegeXGAk5g1fJj8ZRhDbd
 oP5RnRmIOUJmv/06GASIn6qWxdxdLfhVp17CDIiYub6EMtjnLbJ4tUQD5gNjK47OCLH8
 Ijhw==
X-Gm-Message-State: APjAAAWwpxPCoOgPTe4SXsj/D13UyWWoOVm+q+NuohAo26P+YZ6ElOwJ
 x7plMP4JWL3n5iyAsrYwOkH6vg==
X-Google-Smtp-Source: APXvYqxpCCW54J3fN4T1bkdCwN0FL2+ouWimhzANbhGNXOTpOA9eMsxirOHRMFEtnyEluH/UmRwhLQ==
X-Received: by 2002:a1c:99c6:: with SMTP id b189mr9246872wme.57.1565336242632; 
 Fri, 09 Aug 2019 00:37:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b42d:b492:69df:ed61?
 ([2001:b07:6468:f312:b42d:b492:69df:ed61])
 by smtp.gmail.com with ESMTPSA id 4sm227355416wro.78.2019.08.09.00.37.21
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 00:37:22 -0700 (PDT)
Subject: Re: [PATCH v4 00/20] KVM RISC-V Support
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20190807122726.81544-1-anup.patel@wdc.com>
 <4a991aa3-154a-40b2-a37d-9ee4a4c7a2ca@redhat.com>
 <alpine.DEB.2.21.9999.1908071606560.13971@viisi.sifive.com>
 <df0638d9-e2f4-30f5-5400-9078bf9d1f99@redhat.com>
 <alpine.DEB.2.21.9999.1908081824500.21111@viisi.sifive.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2ea0c656-bd7e-ae79-1f8e-6b60374ccc6e@redhat.com>
Date: Fri, 9 Aug 2019 09:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1908081824500.21111@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_003725_100879_BA7195F0 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/08/19 03:35, Paul Walmsley wrote:
> On Thu, 8 Aug 2019, Paolo Bonzini wrote:
> 
>> However, for Linux releases after 5.4 I would rather get pull requests 
>> for arch/riscv/kvm from Anup and Atish without involving the RISC-V 
>> tree.  Of course, they or I will ask for your ack, or for a topic 
>> branch, on the occasion that something touches files outside their 
>> maintainership area.  This is how things are already being handled for 
>> ARM, POWER and s390 and it allows me to handle conflicts in common KVM 
>> files before they reach Linus; these are more common than conflicts in 
>> arch files. If you have further questions on git and maintenance 
>> workflows, just ask!
> 
> In principle, that's fine with me, as long as the arch/riscv maintainers 
> and mailing lists are kept in the loop.  We already do something similar 
> to this for the RISC-V BPF JIT.  However, I'd like this to be explicitly 
> documented in the MAINTAINERS file, as it is for BPF.  It looks like it 
> isn't for ARM, POWER, or S390, either looking at MAINTAINERS or 
> spot-checking scripts/get_maintainer.pl:
> 
> $ scripts/get_maintainer.pl -f arch/s390/kvm/interrupt.c 
> Christian Borntraeger <borntraeger@de.ibm.com> (supporter:KERNEL VIRTUAL MACHINE for s390 (KVM/s390))
> Janosch Frank <frankja@linux.ibm.com> (supporter:KERNEL VIRTUAL MACHINE for s390 (KVM/s390))
> David Hildenbrand <david@redhat.com> (reviewer:KERNEL VIRTUAL MACHINE for s390 (KVM/s390))
> Cornelia Huck <cohuck@redhat.com> (reviewer:KERNEL VIRTUAL MACHINE for s390 (KVM/s390))
> Heiko Carstens <heiko.carstens@de.ibm.com> (supporter:S390)
> Vasily Gorbik <gor@linux.ibm.com> (supporter:S390)
> linux-s390@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE for s390 (KVM/s390))
> linux-kernel@vger.kernel.org (open list)
> $
> 
> Would you be willing to send a MAINTAINERS patch to formalize this 
> practice?

Ah, I see, in the MAINTAINERS entry

KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
M:	Anup Patel <anup.patel@wdc.com>
R:	Atish Patra <atish.patra@wdc.com>
L:	linux-riscv@lists.infradead.org
T:	git git://github.com/avpatel/linux.git
S:	Maintained
F:	arch/riscv/include/uapi/asm/kvm*
F:	arch/riscv/include/asm/kvm*
F:	arch/riscv/kvm/

the L here should be kvm@vger.kernel.org.  arch/riscv/kvm/ files would
still match RISC-V ARCHITECTURE and therefore
linux-riscv@lists.infradead.org would be CCed.

Unlike other subsystems, for KVM I ask the submaintainers to include the
patches in their pull requests, which is why you saw no kvm@vger entry
for KVM/s390.  However, it's probably a good idea to add it and do the
same for RISC-V.

Is that what you meant?

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
