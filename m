Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45760C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 23:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0muXenK2e0kYOtSBAr3b/mQNFHfxdpftadr7YLZN2Dk=; b=XzmMW3C8Cj1jeu
	GtQ2mBjlc/EYYM6zo5my2D59Z97jjICpBu7fG1ppTBtIbms/FLXCiHYPDmur/F7UxIGmrhLQjGpKT
	aHn7nPVYryorIbr3HZXXlv4n3jHiPiPiB7KyQRYhn4R85K/CoXxMr5qbeZlFc3ISKVLb9XbDHMo7r
	7O36bK+wfzZ8Bg8dF8WMTGusMaqTGrW3HOoBE2GJn901pNtDYYH/HoaKifK/hdaKI7qnCcMwzf8wp
	fGsxt703PyeDYAkuihlbqbbKmLSG9CoMQYSNCSyYkism2DARHCVwv8VLg6QvEV8o5wcWiX0Wvo74p
	8oY5JUo5EEBymdIux3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sSI-007zkR-N2; Mon, 12 Dec 2022 23:43:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sSF-007zQs-Q3
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 23:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670888604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEA/kHTqeoXaUaGcLLLnYDpNScpRzske2CPEB3QlR58=;
	b=GBwdnTy/KG4l0LSw7AF1K4tvHMdsKCijYdzXDFnkEkJ4KUToRshhm2Djpbgyza/rxYIkDU
	aU6NUL+DkrqUMO69oKH59QK9vmgVnw6+VdK0RJLMyFcj2aVgyqv83DhidsCiDuOKCsa4BZ
	ZD+3/52MqOObTP4r33jbw+1uQB7dRU8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-k6ItWO4tNuOXOiYq2B0yyA-1; Mon, 12 Dec 2022 18:43:21 -0500
X-MC-Unique: k6ItWO4tNuOXOiYq2B0yyA-1
Received: by mail-wm1-f69.google.com with SMTP id m38-20020a05600c3b2600b003d1fc5f1f80so4809886wms.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 15:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEA/kHTqeoXaUaGcLLLnYDpNScpRzske2CPEB3QlR58=;
        b=v2lQi9ZC83qtqVesl7U97QCtGn70sjr8PLhF35dDtYSD9uHwCB+ZoBrjPwqBgdxU5N
         kK7qeeYk5SAAzML0/TIJ42JSdz/tISxnJKDXrvR1n72fOTPS4kYIjm166rrX9BikM3Ep
         7QTltVnFz28RD9MsguPCG/JnQpJkJ6m2KNhUQ23Z7GPTXWCVgjk836ZyXTpaExbPTL9x
         a9UJ6e08pimPAzKIQFNgZGofPFm0phj08QiFBCydcYeQRT5UylzPnXAY7M3kiI5Sqypj
         BDY2GhEBFpxaPLw98CX1bTx/18JGZT1gVVMM6ASlxG1MOB4Sxmya5KDzmD3NBE9vsmxe
         f8qg==
X-Gm-Message-State: ANoB5plju2OHsZEhZ2v4pR7lfuUDxvUQNDe+DKytiEhmnrjMuxbHmR4f
	iElgSNQ3id0Cn6d8e12kfxx2s/3JGkhUr1FoHSbKCDkxWwBJdR51FSTPsjC6jm+wbc8DVJrcFoB
	FRfqu6zdU67iT5c5nnLf7RMKIj97l
X-Received: by 2002:a05:6000:1a41:b0:232:be5d:4896 with SMTP id t1-20020a0560001a4100b00232be5d4896mr11068895wry.10.1670888600347;
        Mon, 12 Dec 2022 15:43:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FE6NAMqQtmSlBoZgWlaFymznZFcQYb9/qLkdQoBRkq0uuA5oTNuN3c0LKnzZL0EytBO3qiw==
X-Received: by 2002:a05:6000:1a41:b0:232:be5d:4896 with SMTP id t1-20020a0560001a4100b00232be5d4896mr11068853wry.10.1670888600068;
        Mon, 12 Dec 2022 15:43:20 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id j18-20020a5d5652000000b002427bfd17b6sm12017830wrw.63.2022.12.12.15.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 15:43:19 -0800 (PST)
Message-ID: <f1026204-1895-1a7e-5bf8-3527223f3778@redhat.com>
Date: Tue, 13 Dec 2022 00:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, David Matlack
 <dmatlack@google.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
 Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
 Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
 Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
 <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
 <Y5e4qxjHWoMt8YGs@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y5e4qxjHWoMt8YGs@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_154327_947800_498DED5B 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMTMvMjIgMDA6MjYsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4+PiBJIHdvdWxk
IHN0cm9uZ2x5IGJlIGluIGZhdm9yIG9mIGRpc2NhcmRpbmcgdGhlIHNoYWRvdyBwYWdpbmcgcmVz
aWR1ZSBpZgo+Pj4geDg2IGZvbGtzIGFyZSB3aWxsaW5nIHRvIHBhcnQgd2F5cyB3aXRoIGl0IPCf
mIQKPj4gWWVzLCBhYnNvbHV0ZWx5LiAgU29tZXRoaW5nIGxpa2UgdG9fc2hhZG93X3BhZ2UtPnRv
X21tdV9kYXRhLCBzcC0+bWQsCj4+IHNwdC0+aHB0LCBzcHRlLT5zcHRlLCBzcHRlcC0+aHB0ZXAu
Cj4gImhvc3QiIHdpbGwgYmUgY29uZnVzaW5nIGlmIHdoZW4gdGhlIHByaW1hcnkgTU1VIGlzIGlu
dm9sdmVkIHRob3VnaCwgZS5nLiBJIGFsd2F5cwo+IHRoaW5rIG9mIHRoZSBwcmltYXJ5IE1NVSdz
IHBhZ2UgdGFibGVzIGFzIHRoZSAiaG9zdCBwYWdlIHRhYmxlcyIuCj4gCj4gV2hhdCBpZiB3ZSBr
ZWVwIHRoZSAiUyIgZm9yIFNQVChFKSBhbmQgcmVwdXJwb3NlIGl0IHRvIG1lYW4gU2Vjb25kYXJ5
IFBURT8KCk1ha2VzIHNlbnNlLCBzbyBqdXN0IHRvX3NoYWRvd19wYWdlLT50b19zZWNtbXVfcGFn
ZT8KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
