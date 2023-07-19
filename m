Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFDCC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdrQbdFue6A3IOFWe+EG47RxA5JgqZDlz1+OnUkfm4k=; b=UD0IOvwvCHbGD+
	ZG/15bFWbBeKz2TypPIicL3QNYiFNpsNlcyAftmnPMcujlVN4UIykMF5cvr26jEfC8qahP4NyXXhZ
	B9DFy9xlrDO1wDSl32JA590EQj/eewpywCgCnP/qSRfAhfSYpbyB/+RmJ/rwdmQLLF8/oUb4DpwyB
	QtMqMcNKS1GsURZe0KqINdR19+4J9udVDothVxRL6Rxx9msM2bhsnr6kc/+6WHyXXA9MwZKcVLb31
	cbvSW2FQm/egLut8C0OYgUSu0NzPBBOOIe/mD+nxrgNO5jVdcLOBlSx9WRHaYBbQ4ihAWhM+PUCwf
	841kTs6fj/B0Z/WkgSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMASi-008E3r-0J;
	Wed, 19 Jul 2023 16:55:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMASd-008Dz9-1t
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689785732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybZMnwXlmIEE0ADI9FsKUlcEynrHTdW2zV41y3cU4q8=;
	b=GywAJTHHLcxJVwUJVakntTMUsC9ImefzxWcs8ba2GGuU7mN0qPIBWmkS6OiMKea8ncFEmX
	GqmxHuyFFHDhYM5yhA6J+t4roOPPCnCIaXDkG4qsKtkkTzaNZ1kPGNB4hsHV+fZywytjKw
	m1nR9lV36gw3ZVAxhygmL3U5yVEGzxY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-j-JNk3OcPoSKN0RSqcP--Q-1; Wed, 19 Jul 2023 12:55:30 -0400
X-MC-Unique: j-JNk3OcPoSKN0RSqcP--Q-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5218b9647a8so2537551a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785729; x=1692377729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybZMnwXlmIEE0ADI9FsKUlcEynrHTdW2zV41y3cU4q8=;
        b=lB9WPFVPWENzEqpC4k21vA6cB2wUGmg7WqJfpF8WUh0jJKC2tfyI0r6JQF+8DK/LQ7
         VumkTCZp2GrvKmUENtKneisgil0kRe5ArTKdDCURqM1HtKdJpL4WuQSReAwAeX4ePD4a
         iJ31YHmu+Q5ivn5rQyQrdMMPtFIANUQNSi44mbdQGUjDgntaMPpbGyBX5X4yU2UhCwiJ
         5dbJOHGByvxwV4uAG/jYOTrvdVs5CX9PVG4uryfd2byTQhJumU2SvJFgxPc6z0NMam/U
         4hPoXiCIYHWuhwKtKlxZgoaoYqmf9mAYfnZpnrfgRljD8dPN9IP47SD9GCUOi25iFUog
         ANGA==
X-Gm-Message-State: ABy/qLZZha+7AyHXNX9XNvPttdt2nOo1VOV9CvHR9HMt6/fAcEe26sUZ
	FtnapX821KXuaiAEoOjUdJhecjiWGTgyXYEYnPWhI/ptYgmAjrNO1k7jFN/az+B+GFeZ/XpCBf9
	AQ4wpsYZWxmzNKYxQ0gBowvNIZOKD
X-Received: by 2002:aa7:df12:0:b0:51e:28e6:3838 with SMTP id c18-20020aa7df12000000b0051e28e63838mr2675094edy.17.1689785729747;
        Wed, 19 Jul 2023 09:55:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEE4qOGG9V7ZI8+WFW37awHpPD5aiip3zVhw1ks31Z/kpX3OD6eusNtSgp6OKt44xHjSBz/kg==
X-Received: by 2002:aa7:df12:0:b0:51e:28e6:3838 with SMTP id c18-20020aa7df12000000b0051e28e63838mr2675066edy.17.1689785729461;
        Wed, 19 Jul 2023 09:55:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id r18-20020aa7d592000000b0051df5eefa20sm2911736edq.76.2023.07.19.09.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 09:55:28 -0700 (PDT)
Message-ID: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Date: Wed, 19 Jul 2023 18:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action
 union
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_095535_727398_39212C19 
X-CRM114-Status: UNSURE (   7.47  )
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

On 7/19/23 01:44, Sean Christopherson wrote:
> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));

I think these should be static assertions near the definition of the 
structs.  However another possibility is to remove 'raw' and just assign 
the whole union.

Apart from this,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(range->arg));



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
