Return-Path: <SRS0=TPRL=V6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9798AC32750
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 08:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFFB2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 08:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I43N96Tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFFB2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgZVjxuUbqkNSnhCqcNTkrRWP3XXvg951EQ8ii0EJko=; b=I43N96TrWy23/8
	Zet4y3PoeXzCeFaC5T/HO2uK7XQXUVSdQkfhjafsbSGGu9rCH8m80IWUf/SIzisCBwqP9aURFNJEa
	VOESxJVAN7hxVsBr33r6/7uDTmwQvzBys1AodU6EtQ3q/Pz5a8id76WBD0BrVJcfdOT5JBXeRfaMQ
	eeh369NoXI8MXC5R2jH2akBasNRZgjuN2KTkJkRJ73zRhRto+mhsYa5/2Haaz2OWJhxyjEIqtIL64
	OvoFbarslXdobg0yytGjTKMARtsHx7md68eWE5NiPLUgAbq3BSxRJsw0V7GPxLKryc9YWcQexf7Wv
	ZvEDBAQ/cmKYVjY/fiLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htSl4-0006Hf-2D; Fri, 02 Aug 2019 08:17:50 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htSl0-0006H5-NL
 for linux-riscv@lists.infradead.org; Fri, 02 Aug 2019 08:17:48 +0000
Received: by mail-wr1-f66.google.com with SMTP id p13so1677011wru.10
 for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2019 01:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=APOXhup+sZGXS5d0UC7uGeTiWB/G8v81K64OFOYtTQY=;
 b=OM5yfmDRoL7KTIuHS24R9OEKBUBBel/4T6COuMwYZFIcNeild3bgB9uW0y5NpDHbkV
 M79yIAO9KuNMGycgMCUrzBUChJTKwfnPmGmAxWJCvAJmG2HcyEhM0x8TPgL3zjwYEzo8
 pTI/2IORArWE6yPrUkicX0mYFd0U669aFa+Z4Ekk+OImma0SkUVnuB9VwM5ej96R3kK8
 TRZJzcldqpsnSCLlusSWqcn6vwYBtMJOyUVpqRkZKzKosOhuZR/9tjuaT8ya/fe8NZU8
 WHr0dXnuVCGi+IfOD1wxaCWJwqFL3Nd7GuIEeVc6aCPYcZ4tIGVbRUgJmQbz4aYxxJlA
 DUjQ==
X-Gm-Message-State: APjAAAVXsETO7EZALIPkuYn4CZhx07VUWN1daniVqSSoEkpWd6cCBkZg
 cj7B+QAQcZSNm48p5GLJdrM2hQ==
X-Google-Smtp-Source: APXvYqxouFvTCxPN5ary3LSNHZng7Fu6r6547Mi/qZeNJXWg0W3zH8U/xLY5N3dAloNhdOrtFxV+kg==
X-Received: by 2002:a5d:4101:: with SMTP id l1mr7547509wrp.202.1564733864909; 
 Fri, 02 Aug 2019 01:17:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4013:e920:9388:c3ff?
 ([2001:b07:6468:f312:4013:e920:9388:c3ff])
 by smtp.gmail.com with ESMTPSA id p18sm75207312wrm.16.2019.08.02.01.17.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 01:17:44 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/19] RISC-V: KVM: Implement VCPU interrupts and
 requests handling
To: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Radim K <rkrcmar@redhat.com>
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-7-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <98eaa917-8270-ecdc-2420-491ed1c903d8@redhat.com>
Date: Fri, 2 Aug 2019 10:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802074620.115029-7-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_011746_770279_9534CFA6 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/08/19 09:47, Anup Patel wrote:
> +	/* VCPU interrupts */
> +	unsigned long irqs_pending;
> +	unsigned long irqs_pending_mask;
> +

This deserves a comment on the locking policy (none for producer,
vcpu_lock for consumers).

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
