Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E4C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbR5t0DFeIHpLz3hEKxrFiYEAJmy6ai36W3WXbzX9xc=; b=U5igCyGRkBgCPP
	T4XinplgIV75PaajQz3sWS6VmaM/dsrcHsxq+a5ImUcZRFs6Mxtk2pl9CNmGHHybbF6Gfkdo5U735
	YFuDjwTWAexpn9CySlykvK1MULp9iTJukyIGKnYfDJ1X999YL9ReuHdmmlg5JzA4s/TFuazJda2t+
	J+iurbMY+nkx36AFggd/h3dy3c9JJwllnFCF9Q5eWSk1Ro6sjrvJDm3TjfzjTvhWJO1FEpPMoF3CY
	REaMouY9R9XBhyVtLqPIHbyDVE/LaxFZF5rEVXPPVvMpUVnOxVZydMcxayWDMwnVVVEKY1FxEzv6a
	PnI/K3z4BrwfXI0E7CrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rM1-006dcX-LL; Mon, 12 Dec 2022 22:32:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rLn-006dYR-Nf
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670884362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHhE1QP3jUCpk1cxLuQ6KAYvI1S2lfEsXBvTRJ9YN5A=;
	b=UetGr0hQVlIH9v/ykp0zGN6+9zvzvtvVdcXe7oQn+OqrdWQIpX2zqz8g8/FQM+VlDuxHzw
	wM86+ABgxGCcKQk60xiLKJYsZw8RlRAHS/8HBKCXW+TY1+RrNMjycrKoSoIqko4QGTuAgI
	pMtYkGduynuGJkVdEcMYHj+ErjMF8rY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-FncG6I7vNPqcfZESSu8NQA-1; Mon, 12 Dec 2022 17:32:38 -0500
X-MC-Unique: FncG6I7vNPqcfZESSu8NQA-1
Received: by mail-wm1-f70.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so3958630wms.9
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHhE1QP3jUCpk1cxLuQ6KAYvI1S2lfEsXBvTRJ9YN5A=;
        b=jJhCDu2D3sDSwlepWfgt/axUP2ZCQGEadHI7yZ9+AWwPBIcUePN89JWVlw8fktYjYT
         M/6NsYZjwNdMZleCLHjBbwFpMI3buH1ug/KI3Th5cJ98qnkWUb5tHZbwTPfqlBTwwoyW
         6Wl8W5bdOJPBVRKpBhPYHEqRGFcuilix0x27+9DNmjLC4i1l75dTe9n3nKmqSfBRltmw
         9QE4wtynqsRdZlkEKwm7G5r05lAAJb8Q6T4Xx3gOzegTqQLOEsLx5DMUYg1ISr/jscO4
         ldPOCXjBpThozOnt+yQH3Rj3tA4fPecfjQR1w+Vv3LZMvKGNpyDubdqzIpQFk+2bv2Cz
         FERg==
X-Gm-Message-State: ANoB5pmy+XKazCxLis3icATawd0sladiT5VWlYa/fejbI7DIVRN4i8fv
	h/0H4GLuRNTJOPsuVIhg3dU8S7mxA6mfnFJ5dcfuH+vE+HBLR3+JSbli3cavCP60qAsMV0BuBV8
	3+iOlb4T5Q2x0E3E3BgD1SXAu3FNR
X-Received: by 2002:a05:600c:3d8f:b0:3c6:e62e:2e74 with SMTP id bi15-20020a05600c3d8f00b003c6e62e2e74mr13978206wmb.15.1670884357779;
        Mon, 12 Dec 2022 14:32:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5rK2wuh16AKn0g4El+6pmLN9CiGHMIzRy1p4C+zNER/+4S5U+s8UBV98mPUqtRVzVGakI9Nw==
X-Received: by 2002:a05:600c:3d8f:b0:3c6:e62e:2e74 with SMTP id bi15-20020a05600c3d8f00b003c6e62e2e74mr13978185wmb.15.1670884357516;
        Mon, 12 Dec 2022 14:32:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id o5-20020a05600c510500b003cfa3a12660sm186503wms.1.2022.12.12.14.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:32:36 -0800 (PST)
Message-ID: <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
Date: Mon, 12 Dec 2022 23:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 06/37] KVM: MMU: Move struct kvm_mmu_page to common
 code
To: David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>,
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
 <20221208193857.4090582-7-dmatlack@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-7-dmatlack@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_143243_894400_0BB65E19 
X-CRM114-Status: UNSURE (   9.88  )
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

On 12/8/22 20:38, David Matlack wrote:
> This commit increases the size of struct kvm_mmu_page by 64 bytes on
> x86_64 (184 bytes -> 248 bytes). The size of this struct can be reduced
> in future commits by moving TDP MMU root fields into a separate struct
> and by dynamically allocating fields only used by the Shadow MMU.

I think it's already possible to use a union like

	union {
		struct kvm_mmu_page_arch arch;
		struct {
			struct work_struct work;
			void *data;
		};
	};

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
