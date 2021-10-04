Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76F2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 08:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FAE610A2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 08:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95FAE610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3QvC08c6lF0JPotU5aVKuOwKSJ+6O4wMMrwKcQpaXw=; b=jMWYC0vkeNLMiT
	ReXcaOuFZuAVKrGFbzu6ZmJ4QWSSGC63cQ8Src2F0jTpopJazymO+Gr5lkDyGVN9sOp9pPvvIHzsX
	CCydsLS/AYJGNeO4q5laCEv/AcyEobLou3IDXdjTaE8BlieneesE03kY8OIP5BRpbCr/mPskkWQXI
	5jrs4FQBN9Fr4EUiU48LucAepbHlaYs737POdKM40bbWr9UCHsDbJqsIZ6/9mgnsFuWopBl0PrOE7
	Xkz4VsJvv3PA2B+s2VYygXXWj5EqSbSVrTxmXxmz1k3vMf4tbubVuyyMB7DH+Z7R5sZrM4b7Gb/3a
	yzUVm0Q2y+Pc1CObV/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXJWt-005e5Y-Ef; Mon, 04 Oct 2021 08:40:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJWq-005e4Q-4Q
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 08:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++xf85KrwjKjUR0N++5TlHyfSBlnuiKqimGu6zW+36M=;
 b=BIFX/Xp8W5vCuMPd7cPWFs78RVgTUCVjP0VTo+0sz8hjJyajxU70a2Dnu1UivaZNCmcNdM
 757OvBPCFQIYIzDgTfJqVfMD5rgWC5uyzLEV6qrJUk9qG+7zV7xN/ErOcwazwodh0Y2IQj
 m8xrvBvSpU6ZwgSarXokvndSG8tUkt8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-rXDznWbrN5WgK4-ZmgEE5A-1; Mon, 04 Oct 2021 04:40:52 -0400
X-MC-Unique: rXDznWbrN5WgK4-ZmgEE5A-1
Received: by mail-ed1-f70.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso1917276edn.4
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 01:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=++xf85KrwjKjUR0N++5TlHyfSBlnuiKqimGu6zW+36M=;
 b=niECrx2i+QIrdQXEZ+wK4Yphp/EbppBig3odEaCcJuzWUwmqTZovWgth56ThyM3ial
 61iLklCaaz2LYaEF/lOR1c/H3pvrB7jN2b39hgoFX6Ll065xACksNS4m5ObkgxbzrVoE
 Uqrn+btknx21AQk06oztk9oFmtPsaoeYRvVWDKVk0NARBcziHHMh5jPEifPO4kh7N5Ay
 9F4z5lcxMykddWHUahWn0QHd9szGqQXzQT0EgGx5QEU+2lwMVRyAMM9xHO1IKrP9bck2
 Qa/lZrzuJt9YMQnfDGIT/jTrSix+eMc/B2VTcnVCWYIIZK+e1BqDya/onI0ZqpaMCWzr
 hShQ==
X-Gm-Message-State: AOAM530jmfMMyyORkmEtFvLHyqHiJn6zUeF0DICdBDKhP9zsnpWG+K3Z
 fNuWKhlzQ+1bhCGBlB9uvSZdrQ+B/01nLqos37uBNnczf3nyWxKMN84WphfZmVNdTlyfF1rae5v
 wfjT6P1+6AiwgEDtNa7SIVeX40DTq
X-Received: by 2002:a17:906:bcf7:: with SMTP id
 op23mr16092837ejb.317.1633336851491; 
 Mon, 04 Oct 2021 01:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcakdHkBGbuLanS3x3wbeKZDEtGC7oRl9PdPTJXqNEgmgTiWU4R0A0+dfATKe3rGIuRn6dnQ==
X-Received: by 2002:a17:906:bcf7:: with SMTP id
 op23mr16092816ejb.317.1633336851258; 
 Mon, 04 Oct 2021 01:40:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j16sm6957067edw.23.2021.10.04.01.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:40:50 -0700 (PDT)
Message-ID: <86d3981b-2195-7c03-9917-520761aaeaa5@redhat.com>
Date: Mon, 4 Oct 2021 10:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Palmer Dabbelt <palmerdabbelt@google.com>, anup@brainfault.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 philipp.tomsich@vrull.eu
References: <mhng-b5a035ae-a545-4c81-a8d9-301c6f7e6982@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <mhng-b5a035ae-a545-4c81-a8d9-301c6f7e6982@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_014056_270192_F97FA6EB 
X-CRM114-Status: UNSURE (   6.35  )
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

T24gMDIvMTAvMjEgMTg6MTgsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IAo+IEFja2VkLWJ5OiBQ
YWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+IAo+IElJVUMgdGhlIHBs
YW4gaGVyZSBpbnZvbHZlZCBhIHNoYXJlZCB0YWcgYXQgc29tZSBwb2ludCwgd2l0aCBtb3N0IG9m
IAo+IHRoaXMgZ29pbmcgdGhyb3VnaCBQYW9sbydzIHRyZWUuwqAgSWYgeW91IHN0aWxsIHdhbnQg
bWUgdG8gbWVyZ2UgCj4gc29tZXRoaW5nIHRoZW4gSSdtIGhhcHB5IHRvIGRvIHNvLCBqdXN0IG1h
a2UgaXQgY2xlYXIgYXMgSSd2ZSBtb3N0bHkgCj4gbG9zdCB0cmFjayBvZiB0aGluZ3MuCgpJJ2xs
IHByZXBhcmUgYSBzaGFyZWQgdGFnIHdpdGggdGhlIGZpcnN0IHR3byBwYXRjaGVzIGFzIHNvb24g
YXMgSSBmaW5pc2ggCnJldmlld2luZyB0aGUgcmVzdC4KClBhb2xvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
