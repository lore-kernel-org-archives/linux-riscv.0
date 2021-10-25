Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3863C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A203F60E08
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A203F60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihBKG46fIevwPVn9UT+9Gdosj+BApSluID2Xm7M2dcM=; b=423r2OD2JDoYs2
	BVTd+B3DpzMIq2KcvZ9kyFMwmO+o/ZcdQx3UobildQ0I8IKU6OUsSIR9FKMUB6HtfuEz2ne2aNdsv
	4HgKkG3r7wEAAdwRRJ0Dc/AUltidhsM6XYw8D6BMr/Z338graE2ZHjW8rcvejash9iqaD/SW/wGZK
	EpSszeOZKCss5rgKPSKioZfeEaL2zymzmb/dkioeY2Cc3xOju7JfLyJlMRmBVKU4ArICwQ4x68YQT
	y9UYIpzGYxDDlEHkh4cppKuBvMeb1DAUnF2/apX0V6VS+8JrgNt460YwSt0eusQ9XiDSuiRIbCiuP
	8IgwLeWBNK3yFokZtxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0Y5-00GcBM-9r; Mon, 25 Oct 2021 14:02:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0Xt-00Gc8Q-BF
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GxuWusEjMHZ4JQn5qLWUyg1MyGQPS66ltUGy4HnHFU=;
 b=LTAJJXA6gfcvH8FfYagOIEjcLjtfU1pf6A1jqzc9+E74Nzq4xvgT/emRiNrwGpl7EeuaZG
 rxMUo8rjBjFRlw1ujqmRYrN8yaly/emG/PCs4jUIsivvieTF3mvRkJFgXU3CWw2VIHMg+V
 IBTgj3rYwZXMbdSyiBwwtz/OPhEVtfA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-sBx1erdZOy2GvIaHisobJA-1; Mon, 25 Oct 2021 10:01:46 -0400
X-MC-Unique: sBx1erdZOy2GvIaHisobJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z8-20020adfec88000000b00168672580e0so1928567wrn.21
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5GxuWusEjMHZ4JQn5qLWUyg1MyGQPS66ltUGy4HnHFU=;
 b=K94Ef1AWlUQdp4DJ8bAGrIStb3+hYttJfpTEtv9kfnwTpHop2OqEpZW/DPsBsIFvn+
 SJ1E07/xFQ1aUuePknO9ELEFlzu4N6rHU0kbDVLfilStQWKjFjQV3eZ//Sf5+kINu744
 kB+SNHBvjiGMc21sr3lRQTEQRVmcFbV71BUwS+fvJ+14TwcZ91i4RyGlbSZm0tYxe2W3
 n5HPmuQYPuvkqqPHfi1qOHAuwBvn8W+4eK29ndExazXKCiXiuRfjXOqHdv959BKQlqok
 UTrBESJfda1WgEwrw1fWP3QhVHm15YTso4nIO6s17Y9wVfe6Yude8Sg6P7HZMZQbip+8
 0SHw==
X-Gm-Message-State: AOAM530toHDIAv7FsLT9hZfy0nqmG8k3IoPriYPwxH3/n5/NGW2YmXJm
 5JfdOfytKplL3Tc/mhCklHo2a+fLISCiKmOlIDmv5kQiCA8cGkLaHP0BPsJmV+gjjNYsJB7T4jb
 +r99mDkA5cgQNArJo4M5MX7RbMcpQ
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr23589890wrr.76.1635170505449; 
 Mon, 25 Oct 2021 07:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiqFlcSYWH7tg/r7nyk/acEU7XFm6PKMcaIfNQ0d2l1GPzyRzlNJCdOi1PnQIqdfTr2oUQaw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr23589820wrr.76.1635170505123; 
 Mon, 25 Oct 2021 07:01:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x2sm5765371wmj.3.2021.10.25.07.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:01:44 -0700 (PDT)
Message-ID: <18e6a656-f583-0ad4-6770-9678be3f5cf4@redhat.com>
Date: Mon, 25 Oct 2021 16:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when
 blocking
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-25-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-25-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_070149_475588_EF769DE2 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/10/21 04:12, Sean Christopherson wrote:
> Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
> pre-block path, as NDST is guaranteed to be up-to-date.  The comment
> about the vCPU being preempted during the update is simply wrong, as the
> update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
> until after the update completes).

Right, it didn't as of commit bf9f6ac8d74969690df1485b33b7c238ca9f2269 
(when VT-d posted interrupts were introduced).

The interrupt disable/enable pair was added in the same commit that 
motivated the introduction of the sanity checks:

     commit 8b306e2f3c41939ea528e6174c88cfbfff893ce1
     Author: Paolo Bonzini <pbonzini@redhat.com>
     Date:   Tue Jun 6 12:57:05 2017 +0200

     KVM: VMX: avoid double list add with VT-d posted interrupts

     In some cases, for example involving hot-unplug of assigned
     devices, pi_post_block can forget to remove the vCPU from the
     blocked_vcpu_list.  When this happens, the next call to
     pi_pre_block corrupts the list.

     Fix this in two ways.  First, check vcpu->pre_pcpu in pi_pre_block
     and WARN instead of adding the element twice in the list.  Second,
     always do the list removal in pi_post_block if vcpu->pre_pcpu is
     set (not -1).

     The new code keeps interrupts disabled for the whole duration of
     pi_pre_block/pi_post_block.  This is not strictly necessary, but
     easier to follow.  For the same reason, PI.ON is checked only
     after the cmpxchg, and to handle it we just call the post-block
     code.  This removes duplication of the list removal code.

At the time, I didn't notice the now useless NDST update.

Paolo

> The vCPU can get preempted_before_  the update starts, but not during.
> And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
> for updating NDST when the vCPU is scheduled back in.  In that case, the
> check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
> that would require the notification vector to have been set to the wakeup
> vector_before_  blocking.
> 
> Opportunistically switch to using vcpu->cpu for the list/lock lookups,
> which presumably used pre_pcpu only for some phantom preemption logic.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
