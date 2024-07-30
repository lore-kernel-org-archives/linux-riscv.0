Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB3BC3DA7E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulqGcdCUs/AOU/5FPjn79EPyyZz+evo7DcgX9/N1hAY=; b=RpYhAY/vdvESq7
	AOkRPYWKkrbdjYbVR/Ux5LaXTyXoIVdp0HqA1+fcDNYQw1O8Vl6Wt5jsfurgNX7fm/4FA3zp406RR
	hYD6zUvRBWypGxuVg6H8hJGaecLNZnXS0OZJMALYiKo2+gqv1+nGIJ+W6wvzBmgs1EBPcoglwYTvF
	EevvJHs5gjq1hdXXhMGcySMwxMxe2HlW5DQ/MpdzrShsUuAIOUiESI9Cm+xZRkvEnEqAREZFJLttK
	uq2QfLd5F61AvXgnw2IRanihmL9jHm9sk0UYgSv5+lRl1Bf/DCpX+WYPf1mn3N59fCTBG/1iurX7b
	vgOzOZOXOBpPKESn+SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYlP0-0000000F0Ft-2lws;
	Tue, 30 Jul 2024 11:52:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYlOw-0000000F0Dm-0wvr
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 11:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722340340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
	b=SGyv4jOwFUplvcgLXsMuTlbyFADjfg06EmLvLjvOnows7sK4Tk5PNjXsIQRXt71GY/DL29
	KfdswJ+2Gq4OfamdpnoFFNFACXYLxiYIN3fQkRKgcqo2J2dW+7xLQAW43RmNJLE0Sqi+s+
	MdN6maZbLH+8F0OyR1PL79yw+i9eaRo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-WExVosqnMnyV4kROphMm-Q-1; Tue, 30 Jul 2024 07:52:19 -0400
X-MC-Unique: WExVosqnMnyV4kROphMm-Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5a7c6a0f440so3330525a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 04:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340338; x=1722945138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
        b=uQld6vBN+I7yl3/cuhN5H7fIqm7PsqpRyjhWojGozfXj91KIjZvzlcZdrT7+g+0ty8
         izEaJKqFmOCm5g2UYpxFeKMRdJHULeexgq3zVxV6NwsSgnwmhKbnJynsMp8LhzFOJJr2
         e2PorNDiK67TtWkdxyBNGmUMXRpgH5TEc+hiaw1gRAhF2Jot3gHwtSy3SOWcjAZPal+s
         0LgnK5vWF4B8TQJdCAxZ81Yv66ygvsc8L/WqPGxj8vIgYOPMrs8ZHNLWYRMY0B4XsL0j
         Vj7srNdSgFdWbaIjUkAKCSFXcsx8w143RGSuz0kTgsCL427Xe3C8Kc/xPabSuPeQhR+I
         ANoA==
X-Forwarded-Encrypted: i=1; AJvYcCUlGEV7wVb6uo/9Tblf1lErbXD6TvtSojRkh7y76OWY7twGy6hilVt9lmO89VE0dc/ERjzhSiixnhgyH5z3z38QUOeZFS1sEsdZsw+5Y3XI
X-Gm-Message-State: AOJu0YybEutnQCdhy/+b/w67roFlEm4j2lkl7DHtSuIqhCALMMmBWUNG
	yiYNf4WjvXslnh20js5Tc/FKdFFNh60Y9IQSoZvXLd3frNgyc7b5ALD0ndRPNZM90NWSn6pS4DG
	EdNhrUHlK8UIbKScdvlZlCxCoEFzBSxV4/9ypevih9UdGlUtIYxl48wbMqcdzDmhEDw==
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926696a12.37.1722340338225;
        Tue, 30 Jul 2024 04:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBJKwuTl3GcCc5YuDbeqMD1zDkMcs4VmkJUQMAj6w6PoPQ2QTlBUJ4IvJ66qrB4FTpUDSGzA==
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926669a12.37.1722340337692;
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5b0044c72d4sm5211327a12.70.2024.07.30.04.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Message-ID: <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
Date: Tue, 30 Jul 2024 13:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_045222_374435_2FC4119A 
X-CRM114-Status: GOOD (  15.46  )
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

On 7/27/24 01:51, Sean Christopherson wrote:
> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
> 
> On to the series...  The TL;DR is that I would like to get input on two
> things:
> 
>   1. Marking folios dirty/accessed only on the intial stage-2 page fault
>   2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

Wow!

Splitting out prefetching makes a lot of sense, as it's the only one 
with npages > 1 and it doesn't need all the complexity of hva_to_pfn().

I've left a comment on the lookup API, which is probably the only one 
that can be simplified further.

The faulting API looks good as a first iteration.  Code-wise, 
kvm_resolve_pfn() is probably unnecessary at the end of the series but I 
can see why you had to restrain yourself and declare it done. :)

An interesting evolution of the API could be to pass a struct 
kvm_follow_pfn pointer to {,__}kvm_faultin_pfn() and __gfn_to_page() 
(the "constructors"); and on the other side to 
kvm_release_faultin_page() and kvm_release_page_*().  The struct 
kvm_follow_pfn could be embedded in the (x86) kvm_page_fault and 
(generic) kvm_host_map structs.  But certainly not as part of this 
already huge work.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
