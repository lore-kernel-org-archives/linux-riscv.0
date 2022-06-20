Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCA0C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CybdChPmx3CAb9ypqJaClEHFKuIMCOHjbu9gr1GT8/E=; b=Epm1EEXpdhGOUs
	jMDPVWi9FWbS7T3ndIGcZyAQ/bp+Yac4bMyunAun5t5rwd+WIigXX5Rthnco1BHEIeo/gh4YloF+M
	D1TM1AypYyGn+8AQCq3cr4R3Be1VyDzCc3EZrYE3G8FCpmQ5q9b7qhnRsU5sCiuTZAWfY7zGio3xB
	sR4FgiALf/05rtb3cA0ZF6INKJxcPXYazDrvWxNqEaxfo2bo5clR5f90I1LwMOpsyoZVQpVo/SRmx
	mCKUeJLbF68vhKa/j1quXpc61XxS1caE69qqi6HEv2xT3Y1hb7X6FPj/L9SAF76mk2sTD6+kH2Sx7
	kaglw0IulSdNHOaPTavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3GAM-000FwP-EP; Mon, 20 Jun 2022 12:06:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3G8Z-000Ezh-B2
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 12:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655726647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fWG6f9+wPyZUdKpzq6SUM1FvIBmD72g2Gxfy7zPec8=;
	b=dRwY5VDDBDHsFGzABSg0ZHQJQf/0K6G89yufHd/cc6ecWuwrkSmKOtbQZtw2ooojbH8+Z6
	Okriva/0xWYGqosNB4QvPhZQxGFPdSjqEqXhlynEwxxNh+hyLzyoN8XvmUuyQgeoJ3IVCW
	P0FOGIfyUBbwe8fJwonIyioPZDuPlWI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-2-z9qMrLMoaECP50xhphmw-1; Mon, 20 Jun 2022 08:04:06 -0400
X-MC-Unique: 2-z9qMrLMoaECP50xhphmw-1
Received: by mail-ed1-f71.google.com with SMTP id z4-20020a05640240c400b004358a7d5a1dso1215615edb.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3fWG6f9+wPyZUdKpzq6SUM1FvIBmD72g2Gxfy7zPec8=;
        b=Y9wZQp0/DJpJazHrlQy8DhWFu2I1jmJHVgHkbVZzcc5jlT1bL1Sq1YV1FQCeBtyi/0
         6ry3PgXgQjjzbkgyu1LS+gWh9H9bdLNYrolf9J0HsArErAe7GRONn7WGdCn+Hnh/Sn42
         rnfbp8LfeFYw+dltiYK5qGYeFY9JoUbo58XAddaGpP/a5RQwpQ1KBdYQtiw9ETx/xf29
         Hc69CDP5kDUgrfYsddXCvzOHgPUW7+w22CNCts+zGqJzn5J92te41m0wx2NGR0dZ/9a5
         5HhRBD9Pcv3pqOo541f2Ul/53b9VqDNC8Ns32n8TZG42Z+FCon1No7BmkpXfo/pUm7by
         3E5g==
X-Gm-Message-State: AJIora/Haq9m8qzFt9aUVt5OiQgxyub9cjYHJW6pA+9mfHiB22L8U6Ys
	k7UFp4OanvZiMpiqPUXdqjCUFIVJFll4k+DVdloa8kZ04ZGosJ6hYOvANxq/NIEx+M18fmcCJq7
	rDtpoos0AKxQsVcRJmR8dTuv+32VR
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id d17-20020a056402001100b00431680ccca1mr29443298edu.420.1655726645156;
        Mon, 20 Jun 2022 05:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9VhJ+ObuyZNUvGoEylbYK2DQSNd9ckf8bXsZN3l2pKVlgkfhq7FwfxpWwysL4rM30ugQ6lg==
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id d17-20020a056402001100b00431680ccca1mr29443254edu.420.1655726644932;
        Mon, 20 Jun 2022 05:04:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id u20-20020a17090657d400b00712134a676asm5894961ejr.93.2022.06.20.05.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:04:01 -0700 (PDT)
Message-ID: <19bba1a0-8fb7-2aae-a65a-1111e29b92d3@redhat.com>
Date: Mon, 20 Jun 2022 14:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] KVM: selftests: Consolidate ucall code
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Colton Lewis <coltonlewis@google.com>, Andrew Jones <drjones@redhat.com>
References: <20220618001618.1840806-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_050411_492744_420253D6 
X-CRM114-Status: UNSURE (   9.94  )
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

On 6/18/22 02:16, Sean Christopherson wrote:
> Consolidate the code for making and getting ucalls.  All architectures pass
> the ucall struct via memory, so filling and copying the struct is 100%
> generic.  The only per-arch code is sending and receiving the address of
> said struct.
> 
> Tested on x86 and arm, compile tested on s390 and RISC-V.

I'm not sure about doing this yet.  The SEV tests added multiple 
implementations of the ucalls in one architecture.  I have rebased those 
recently (not the SEV part) to get more familiar with the new kvm_vcpu 
API for selftests, and was going to look at your old review next...

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
