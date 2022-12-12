Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuJf18Hi8uCr3Bs6kaY+ItxL6Ztc2+zgWwQHnZbEnO4=; b=wFwEBfcDH8nLJh
	e0cvzHGNxDkHmQR45geGwOisI2kH25b7+rZAKr+g5wZoa6L16RStAICUe3k47necKf0nSaw/IpOjn
	tXYzwAuTZNq9Iv40KR2znUqQUQPbgPXtH1JCQw5bPZPgbujJELe6B+eceZ9TxXLbF8rB7QqQixs3m
	n0Qi00yBAT0c1ZlcboCctdtHScdTUtu3AC526R7ojNg2B+opLYoCx7CSRcBtjNssO6DxTs9HAUKdG
	bwVp+DGHFJUtT6TxbWzM9ItRGBMSwQJhssy0ZS57HK76mkOsLwfN2pKlKKiSS/AVbtp4RK0AFwPBi
	f7LH7OvixvSJgMpJq+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rGi-006bh0-Sy; Mon, 12 Dec 2022 22:27:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rGV-006baH-P3
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670884033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeSZwvHmFeU5UUDXCwOByZegtobcOblZc96Ym35chsE=;
	b=eibkr8klbSQncXZQFstboW32gdZU30uF/uZNuLtSCBH+qDEk1p072CAsnB4a3YkaUUN9s9
	zIk57Eph/Rcb+BxTxBPd0WcRP986anbY+D3LY3EKJPoLTo4JExUblgfjhqjtzB4gYGekxc
	ZV8bqpbprW4cjWgc61DbG8mSThkutxc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-d9KnigagOj6w2Yh7tVIcwA-1; Mon, 12 Dec 2022 17:27:11 -0500
X-MC-Unique: d9KnigagOj6w2Yh7tVIcwA-1
Received: by mail-wm1-f72.google.com with SMTP id c126-20020a1c3584000000b003cfffcf7c1aso4736475wma.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeSZwvHmFeU5UUDXCwOByZegtobcOblZc96Ym35chsE=;
        b=3XBi2bYO80Wg4epoe6yJCileWEvOGQrPYDrQAQwXHxY+OA34UJ5IQY6TTKvzzsGfkZ
         J53fjumx2zu0I87fUZmNazjcfve8vrL07jYOmEEjaVXQsw9dgxk4HGtp8+lVMpSQd77y
         1xbsnwlMm357PJPy1T9/cyqvG2BJEk8oKiBBrBdgiNieDo2wsUxJ3b8Qo4FpRp7VmfE1
         cKk+oThRQw4yiHf/3MOoV38c9JQpmL2xUiI4sG9aceb3CchI2veiKu9axbttIBxS3iqv
         5rqvdFsmUO8HT8dNwrEmWwkzZOxoBggCLigZ4LORYcBUP4ZZsHkRc8nrRitaduMMK6vn
         CKSQ==
X-Gm-Message-State: ANoB5pn4J0PcoQfvzq7WCiqBjRNLXKvGGJ5PYQ2iegfSXCnDJZWjRMUU
	S+40nrcXAkKW1i1/VCEnZ34sdsK+9fJj6hhsc4t3l0aFCypNjweqFgXtwjqefQbzthhQPGnaGLP
	2nfT2dRM6JYud+DddvhNUsGEEs+jg
X-Received: by 2002:a05:600c:35cb:b0:3cf:360e:f37d with SMTP id r11-20020a05600c35cb00b003cf360ef37dmr14411565wmq.22.1670884030411;
        Mon, 12 Dec 2022 14:27:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dJ0ARaW77iY6LzN30Dnbz5ebYPZeA9S1gDChcfg6ar2i9lvJt/8ICiG48/nDxEpBydsoLBw==
X-Received: by 2002:a05:600c:35cb:b0:3cf:360e:f37d with SMTP id r11-20020a05600c35cb00b003cf360ef37dmr14411523wmq.22.1670884030137;
        Mon, 12 Dec 2022 14:27:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l8-20020a05600c4f0800b003cf54b77bfesm11143797wmq.28.2022.12.12.14.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:27:09 -0800 (PST)
Message-ID: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
Date: Mon, 12 Dec 2022 23:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common
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
 <20221208193857.4090582-11-dmatlack@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-11-dmatlack@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_142715_893456_A55F4B72 
X-CRM114-Status: UNSURE (   7.69  )
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
> +
> +	/* Derived from mmu and global state.  */
> +	const bool is_tdp;

I think this could stay in the architecture-independent part.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
