Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A23C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 22:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41D061106
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 22:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C41D061106
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IB9+bOvNBBGq0+7l22IP3T5pHzCYqlk1qpEQmQ0zFHM=; b=MJcQquQmohgVL6
	7mQNldyKKMT9HzttJ2bXGO7chzi+8+VjK6XWEIWvH/Ih/ZK1VUTxBDQSMa19z1Ys+5CHmPOmEQvMI
	QUkhMIOxyhTzPus2m/Cn7E2N50tN7bYonBTfdGNdMKEWEomH1mgDSGdqqtsZStqnIVKHnVWf714MM
	bATjl+wW8Uo9BbPl6EqR4VKgoiMKHoGbpgvIDfzxKDScsjpWcfwm3lDRp8yt/3QNyWT+V0H22+NHe
	cZBdOq0PqIO21wgnK48BlhmkYKdDViM5yeNibYYaIGQn/wJEj2INK0AUCIDlpOe9jmcnemipadMob
	Ue0zp6bZ8Jg8M6B4MOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1milQn-00A51M-VP; Thu, 04 Nov 2021 22:42:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1milQl-00A507-1e
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 22:42:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id q126so2752723pgq.13
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2cM+pc7RJOlLXf/kESM57DsH9Y+7ss4v2ISlVrw0au4=;
 b=ooE6FbC1dphlseVcXYf6E54FhDQXALDT9cp9rkFbPJ4y3391PeZbY42Xq5zYAiM2X0
 NdOPtJ6lkjBowxQXuPPYzsk/ImWUzRx84xa98kqJsQVBicjU2eDc5DVULiWpqnCKqxed
 Ey2Ctp6iCrEN8zCtRphZ24isIw03JAvk0SfSWM0DA/73Pbf0h/QRbrwYHZfhgAzS25J9
 xoJiSowrT7yhbflDyi/bGTCX/rlcA7okzQ8gpsTNHWowkIpirAi9P+owp8DITCHO+0RI
 qztHqyk6DNOgAHnulQogAsMkvqtleYWLZNf20k/P+g9/YJ3n7yTI2IPueMQnaW5/KaTr
 oILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2cM+pc7RJOlLXf/kESM57DsH9Y+7ss4v2ISlVrw0au4=;
 b=GCzlZh3y/+SxE2+u3xyrPAe8w5UFyhoWZ8LlJTJUxjWUjAHqBORbz8h8TfI4O24pvX
 2Rz1oXW1cxszcsGvuEIAOnvdu4dCCE1W1PGTPoTCkRXHiIOyCBKf2UutKtvPF6Mchr1C
 Eyad8FzqXA/iSiLXGiLO6vJf7m2/nasxpv9SKYOUT0ZrbIFca4CDxtikzKcouyAGcv51
 7wDeCyfapodB47hS0mogSsb7RJEram5qQSkevncLzfE5TYqo9zWLgRs5W5ym/Yf3Ob1f
 dpdConNHRED0X4onoBtKW9GmUWg3mirmWjwreYr+5jk4PQL5iqJR05Uszw6oLvWx9vQ1
 BAYw==
X-Gm-Message-State: AOAM532HC6O96R7KxHhOJ8EkGNd3WauWQjdFTz6q+BXdANhDuXUTJSfl
 u/OBwgNjpDoLoWOzUWBZ96InnQ==
X-Google-Smtp-Source: ABdhPJxxNMKGv/NhLtIdMl/BRJOCT+zMUUqyt4AWTJHdlm9O9AHyBiNnpE4YQWobAiLulE4sZ0UvKQ==
X-Received: by 2002:a05:6a00:21c2:b0:44c:fa0b:f72 with SMTP id
 t2-20020a056a0021c200b0044cfa0b0f72mr54948884pfj.13.1636065717795; 
 Thu, 04 Nov 2021 15:41:57 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h2sm4707798pjk.44.2021.11.04.15.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 15:41:57 -0700 (PDT)
Date: Thu, 4 Nov 2021 22:41:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Ben Gardon <bgardon@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 James Morse <james.morse@arm.com>,
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
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
Message-ID: <YYRhsclZpZwilkE5@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
 <CANgfPd-uuPFjAHk5kVNom2Qs=UU_GX6CQ0xDLg1h_iL8t8S2aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANgfPd-uuPFjAHk5kVNom2Qs=UU_GX6CQ0xDLg1h_iL8t8S2aQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_154159_216910_496C85A2 
X-CRM114-Status: GOOD (  22.29  )
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

On Thu, Nov 04, 2021, Ben Gardon wrote:
> > @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
> >                 kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
> >         }
> >
> > +       /*
> > +        * Make a full copy of the old memslot, the pointer will become stale
> > +        * when the memslots are re-sorted by update_memslots(), and the old
> > +        * memslot needs to be referenced after calling update_memslots(), e.g.
> > +        * to free its resources and for arch specific behavior.  This needs to
> > +        * happen *after* (re)acquiring slots_arch_lock.
> > +        */
> > +       slot = id_to_memslot(slots, new->id);
> > +       if (slot) {
> > +               old = *slot;
> > +       } else {
> > +               WARN_ON_ONCE(change != KVM_MR_CREATE);
> > +               memset(&old, 0, sizeof(old));
> > +               old.id = new->id;
> > +               old.as_id = as_id;
> > +       }
> > +
> > +       /* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> > +       memcpy(&new->arch, &old.arch, sizeof(old.arch));
> > +
> 
> Is new->arch not initialized before this function is called? Does this
> need to be here, or could it be moved above into the first branch of
> the if statement?
> Oh I see you removed the memset below and replaced it with this. I
> think this is fine, but it might be easier to reason about if we left
> the memset and moved the memcopy into the if.
> No point in doing a memcpy of zeros here.

Hmm, good point.  I wrote it like this so that the "arch" part is more identifiable
since that's what needs to be protected by the lock, but I completely agree that
it's odd when viewed without that lens.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
