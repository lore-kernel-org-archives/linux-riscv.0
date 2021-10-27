Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F83C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7268B60F38
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7268B60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdKRAIdKUusgOfxVC8J3U36Q9uiOf+2kCfGUlL50aRI=; b=Cyh6YxURr/qRe1
	HHY41hEwUKZYQ6nzYMAwvhjVm4cwUq/ltBUWIeYCIYl5uisJKmmqjCY9BXhs3675SEXUJEThtPP0C
	LDwHEOKR+O6eto9Q1Vvy+ix/UqRQBvSwltF3n12Vqpcti5TFMdiXCxvvdRYQ86pWGHKI0X+9yecJ9
	Rv6IcJicp0K5VaLTmZXOcowKkybEFi1iikpw5oBydEw3ibxtURPlLeu8AtYVtGO5nJOxuqhBhqxit
	aZbUTmldrBGvEWz4rKtv66WUjdYpxIlYPDIRZkzeFA65B2RyJ2XvO6fSSsQDtt6CuVJBbOlEFU0De
	DBRWzqw7is5oRvl223iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfla2-005Qu6-AI; Wed, 27 Oct 2021 16:15:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflZk-005Qpf-GO
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 16:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635351289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJ1AvjILyDHE6A0xH65m+vjqkknvkqBvDuAHk95niU8=;
 b=NNZezK5I92wtIcPstDA/xymm972gQZ9WtIC5LNxfA9/cKxuo+jbIJpAKxG+WhoLmdVV01i
 NfPQgaZ9mJOfSB0HBcNLWZgEKlOhbZu9FMixihVNRp0ciu5gnbRZwRTQfUaUFD0slfDuBp
 DgWNhhGjuOT8NzyXPJVCkv+W8CekUrs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-ihc-uhQ5MrSNMVyASV3syw-1; Wed, 27 Oct 2021 12:14:48 -0400
X-MC-Unique: ihc-uhQ5MrSNMVyASV3syw-1
Received: by mail-ed1-f69.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so2849450edx.3
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 09:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJ1AvjILyDHE6A0xH65m+vjqkknvkqBvDuAHk95niU8=;
 b=PFhMn1tZ2ULsPo1A8Qd2N2oriX+Kwb4OpWSzsKOeGMEgVM+z13fCJ6xHO/e/XYnV83
 EQUHs+4STyhJnXVxvSG9osF6F+IeA5d3/sXVGRcf+BlT7UidVXR22IWmZdTdBc80tux4
 uvidxzDO5AEKEFOni3IuZSAmy1/KzDdQd9cvben/JC1QoLUVOLIk8fq13WrILnO9XdlX
 NPf5rRzGIXw2emgskZrKPKeHYzXxA78bjgOGWU70mN8dnfzMQsuxDi4G4NAXOQoah3qH
 idToI6G+CkjZU6khsorKgjkq6jBmITTJcFRtqCbMI9LU5hVeghYwX8WMWimIQU/agYnw
 kWNw==
X-Gm-Message-State: AOAM530voUM9F2RfF8X79tTPo5DMWx9lFXDZlOL+PwhuPYDZ0FyEvLel
 VcONlerwGgMGgrYiOePWp5sngb4ip8oHuRV/wt0pegwWqSihF8JbOlHAflNCdLOQsTF+xfFzfw+
 V17HH9Y+irs2Lgfc6GQag0RTkQmg6
X-Received: by 2002:a17:907:16a7:: with SMTP id
 hc39mr22891329ejc.214.1635351287181; 
 Wed, 27 Oct 2021 09:14:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO/QgQ5GMyh0vFS/oBYQIX6qwD3vL9k6RGrSUIXFucShmCvNWLSsmfmRBNY3o+Ac+4bg3ipQ==
X-Received: by 2002:a17:907:16a7:: with SMTP id
 hc39mr22891269ejc.214.1635351286915; 
 Wed, 27 Oct 2021 09:14:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id sb30sm195562ejc.45.2021.10.27.09.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:14:46 -0700 (PDT)
Message-ID: <d0746ea4-06e9-f65d-6e45-72b1b0dea29b@redhat.com>
Date: Wed, 27 Oct 2021 18:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
 <YXlrEWmBohaDXmqL@google.com>
 <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
 <YXl5anv0Lyjx1cws@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXl5anv0Lyjx1cws@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_091452_682512_1980F298 
X-CRM114-Status: GOOD (  12.86  )
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

On 27/10/21 18:08, Sean Christopherson wrote:
>> Right, so should we drop the "if (running)" check in this patch, at the same
>> time as it's adding the IN_GUEST_MODE check?
> LOL, I think we have a Three^WTwo Stooges routine going on.  This patch does
> remove avic_vcpu_is_running() and replaces it with the vcpu->mode check.  Or am
> I completely misunderstanding what your referring to?
> 
> -       if (avic_vcpu_is_running(vcpu)) {
> +       /*
> +        * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
> +        * is in the guest.  If the vCPU is not in the guest, hardware will
> +        * automatically process AVIC interrupts at VMRUN.
> +        */
> +       if (vcpu->mode == IN_GUEST_MODE) {
>                  int cpu = READ_ONCE(vcpu->cpu);

Nevermind, I confused svm_deliver_avic_intr with avic_kick_target_vcpus, 
which anyway you are handling in patch 36.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
