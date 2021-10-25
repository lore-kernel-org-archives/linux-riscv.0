Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8704EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A45E60F46
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A45E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAt98caIe/YvQxRwzVpeMRl+jvYa5y35chzHTtFzZi8=; b=m1+yWNEUlVZRfw
	NkNztspBydb+MRS5XrrPY47lyZW2MrBP1Je17tZsQv1IsOlA9tSytvWLt16PwFNAjfUTVPjLvlNGI
	E4LwPZ88+mVGZqsN0Jhqs96Gkfqa7VDUkHvrWZHyveaC9ouwtqbd3QZQcU43M5XSYC0nCPLfeNH7m
	sNFamQKtESVHm8umE8UAIR38kJvSHaEZuOpQHjywONZ2TnWzLPWYaSF+BEzr5qi3TCnmzruJWk9ed
	F1YOVAtDRU/KLoZAlvtArw4zg2SuF6GjAkxlp2g9/qQAbpSidFbtNrOtbAjUX2APPLpVhkRETMz8C
	+mxeUr7eZ0IwQUrfSObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0vw-00GgL4-8W; Mon, 25 Oct 2021 14:26:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0vW-00GgFv-Np
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bye7ObUVwxXJ2WkSXV7ATW6vdQkdYkTKPDS9mWywO4k=;
 b=VG20wsfW81XXPKqAw5GP7sPzbhA4Uz7GMRjfobhJBnMpVfvvUHWtqpsDWNV2Ht62lM784j
 pmJYBcOfQP8oznAKfuriTSHgRiFZxel+Z5PdBLZkPiya2ceE8r5gdUcHnnS6TYFTDxslEe
 4hEwvDnnw9gXIQwLAumNBYRTW6lPNLM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-1jK8OXHYMmutRCIVq3Aujg-1; Mon, 25 Oct 2021 10:26:12 -0400
X-MC-Unique: 1jK8OXHYMmutRCIVq3Aujg-1
Received: by mail-ed1-f71.google.com with SMTP id
 f21-20020a0564021e9500b003dd77985601so761668edf.9
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bye7ObUVwxXJ2WkSXV7ATW6vdQkdYkTKPDS9mWywO4k=;
 b=M9IRp0n7pNeU0gUZm8VvQxlaa59Bk8HGsyoaoWxuZcz+JYCn3vghnnh/ZRQcGS1E0W
 +vCzLg8Brvg9mU3jErk/MVmb1OGfEMvDnFIoCF4Izqcpf6Yb2v4U7R9vL3NFDNAGhTRI
 9O+7MARG4hvNM/NrRk51PpEqYQ3xgygeLbtZu5/Q+5ayJ6Y1v/7zk9hknppRU92xlBF5
 Q2p/jLFebAx46/lu68pSK3wBcaI/iak4b0XjbnB8d94KpecwEEMMVlT7YvhrlrajCVR6
 /a1ePwhLYxaYT1h0WSrNYQMRDzitGFaWNFNrQvIWDgAJEtf7bBT0W6HZaa1Z8weJSLuO
 N6Eg==
X-Gm-Message-State: AOAM530YM64vavMKUEh5XZqiYWDrHMduC0oQPEzPo78J8eUEhOwtI/Bs
 U9Wj3B6Dd3VK4OiW+hbQL1uatcBUNVUA7nejIl0CqcZM4d0ea8hU6VYjU79JlRdcnriMfj3GjNH
 /WjPwSp4pVMyqC43KJQkiXl7fpFOh
X-Received: by 2002:a17:906:c0cf:: with SMTP id
 bn15mr21819137ejb.54.1635171971317; 
 Mon, 25 Oct 2021 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1tQyM0wVdwMUOMrIgmjrbrmjI7F4R9FGcgAmNEuZGC3NNZA+IU7BqgOO63yxAXGZ3HmbepA==
X-Received: by 2002:a17:906:c0cf:: with SMTP id
 bn15mr21819096ejb.54.1635171971137; 
 Mon, 25 Oct 2021 07:26:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g14sm5171403edp.31.2021.10.25.07.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:26:10 -0700 (PDT)
Message-ID: <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
Date: Mon, 25 Oct 2021 16:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 16/43] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
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
 <20211009021236.4122790-17-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-17-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_072614_861647_785BD342 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/10/21 04:12, Sean Christopherson wrote:
> Calculate the halt-polling "stop" time using "cur" instead of redoing
> ktime_get().  In the happy case where hardware correctly predicts
> do_halt_poll, "cur" is only a few cycles old.  And if the branch is
> mispredicted, arguably that extra latency should count toward the
> halt-polling time.
> 
> In all likelihood, the numbers involved are in the noise and either
> approach is perfectly ok.

Using "start" makes the change even more obvious, so:

     Calculate the halt-polling "stop" time using "start" instead of redoing
     ktime_get().  In practice, the numbers involved are in the noise (e.g.,
     in the happy case where hardware correctly predicts do_halt_poll and
     there are no interrupts, "start" is probably only a few cycles old)
     and either approach is perfectly ok.  But it's more precise to count
     any extra latency toward the halt-polling time.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
