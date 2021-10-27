Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2927C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:38:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9672060F02
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9672060F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/JYN1caJOQ+Z+DmUpxj/KZRKC3pCrhRjkO+8glIvdo=; b=OTNhGx+Fcy5BiO
	+mDAw7e2PzSsmdVfSbJxOfkBK6Po+uKKZDrUkfGs2mRz89YSprHJiAcueQbh2+/pI9qSABsU1ER47
	B8K5f7GXYSKMhhlhnSqxUFJeFSaE4MGYEzaSHd8D+cmzTBek0jQ7AXeQWYriNTerl2sA7x85jdUKQ
	x3nATCJxpyGw8yfqvcgOLcUkfSsPyXnE65GHPDa6Mu2Riqcco/GxQyHb77Yhlv+PhO5bzmeuTNYln
	NI88ciU66ikWwgs+jrVT8Jo0REStW11EA7S/PB6memY6HuEH7k4D/5Iv3wO+RgFWeeoo4hFmrlgDV
	CxTmZz759uMzjp0TYfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfl0L-005LQn-GM; Wed, 27 Oct 2021 15:38:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfl05-005LLF-5u
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 15:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSqxXsSY7PzPPy6E5Cy05Nx/OdmHcN1STcnBEYyHdIs=;
 b=MbMxbXAupMhsOj7n1ORnzGUbt2FJk9mfhs1WY97br91xQhy2gI1grOuvQnxEp6LE0pzRZZ
 1ueNqOMlSarkjIx3XpEKw+UEb5n1ek2asuexqFwukbmOUCbHmkd+mobwHsmwa1bWXKCwn1
 2CRz2Zv9n8TOyxe7u0sslDWf0CgTm/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-8J_AROqAMeq5SOLLCcbdXQ-1; Wed, 27 Oct 2021 11:37:58 -0400
X-MC-Unique: 8J_AROqAMeq5SOLLCcbdXQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so2670045edl.17
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bSqxXsSY7PzPPy6E5Cy05Nx/OdmHcN1STcnBEYyHdIs=;
 b=O3E6MdBvxuFvFpSDoNd4sQ1MluCwnvEz7JpBZ/UjEHfsGFFZC5N3cu3bBG7b28vzDw
 pY8CwkyFBYkKk+O1CDDCOzk+F2SFocx0KBuL72l1e4K9nvZXd7mjSes4dNuVSjZPntsJ
 0NdBgSrnD7gj7ialn/TQYjgR5BwqvlEZcmBj29NfqKBZ8WkbGOy3Y2YHnxclvFCDAd52
 0p82dTigXjNFLOhGgOiTk7tm8xzNOFBeiEK7VLrhI+sgZkPjGUSgTd9QV17HNDAms0k0
 bRSwdMmz8wVsJbPBP7FauYSQNtq5CeS3k1abHrTJp3t7HlBi/oznaOOlmAoYMaROlcdb
 jpbw==
X-Gm-Message-State: AOAM5302ntlsDNFEBvc9gZoFe+m0Nq7EkAUto9q48BofrfskSqoTjuAc
 HKCwbkpeCkHz8hUTPXLCJbeiD6e9j3ape9RLeBBzImOsiBrrsBVf0TfB0UhO//zmAfeDmmGVkOu
 YXsr1AmnTh05VblvWCem57mc46fMb
X-Received: by 2002:a05:6402:520f:: with SMTP id
 s15mr19650597edd.376.1635349077568; 
 Wed, 27 Oct 2021 08:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcV3ajcrSuCCBMr6jO83QbO8KNKYMvLx5Z90JLfoEGGYsQl7acheIlREFbLHWM9uSofWHX3A==
X-Received: by 2002:a05:6402:520f:: with SMTP id
 s15mr19650552edd.376.1635349077353; 
 Wed, 27 Oct 2021 08:37:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h7sm218074edt.37.2021.10.27.08.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:37:56 -0700 (PDT)
Message-ID: <5b8f554b-5bbc-e257-12d0-800ec82489d0@redhat.com>
Date: Wed, 27 Oct 2021 17:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
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
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
 <YXllGfrjPX1pVUx6@google.com>
 <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
 <YXlwH2vWILFS9QOG@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXlwH2vWILFS9QOG@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_083801_306016_5149B484 
X-CRM114-Status: GOOD (  12.04  )
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

On 27/10/21 17:28, Sean Christopherson wrote:
> On Wed, Oct 27, 2021, Paolo Bonzini wrote:
>> On 27/10/21 16:41, Sean Christopherson wrote:
>>> The other thing I don't like about having the WARN in the loop is that it suggests
>>> that something other than the vCPU can modify the NDST and SN fields, which is
>>> wrong and confusing (for me).
>>
>> Yeah, I can agree with that.  Can you add it in a comment above the cmpxchg
>> loop, it can be as simple as
>>
>> 	/* The processor can set ON concurrently.  */
>>
>> when you respin patch 21 and the rest of the series?
> 
> I can definitely add a comment, but I think that comment is incorrect.

It's completely backwards indeed.  I first had "the hardware" and then 
shut down my brain for a second to replace it.

> So something like this?
> 
> 	/* ON can be set concurrently by a different vCPU or by hardware. */

Yes, of course.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
