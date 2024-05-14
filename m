Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1002C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eTNRM3eURzERXtYjyBwPY0fPhesblQ68us2Mz7+97k=; b=NmPg1i2o+28A0wMFmtZPuJWn/S
	3AcGjti9k50X+gCV/o9M5xtzoHJbaGsY582NaOG7b3QGhrDH8ULZ15Y3FbdylOSN6p7+ND0zxyYDF
	xVOvp4AisZcJnHUynBz65J4haIbu5R89kf/tlSFimS5VZF+d5Reu19lXqf12QnprsVCXTIb2M3nnT
	2fYXLm5OKY9JSWjeDarPQdPPQlhIoNlyR5327sMMwy5OvcziV/7UQpYRu94C3o6RXLuc5+IU4h0Bw
	OfTpkeRHERVOpQ1i9SHJpMsnFWPsNYqjNAaAlxbr3t/YZaUb68xpVlRd3jPhIX55Jh1/3cdvMtUcw
	Pcr94hJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6vlP-0000000GdD2-2OL0;
	Tue, 14 May 2024 17:16:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ueH-0000000GR1g-0skN
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 May 2024 16:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dmMmRWEieJM/VyycAHEtr/8G1hbbQFys09rSH0ZH8zw=; b=naRoFlK2yW0ojet262TYi6kQ4L
	Djt42FcB8ojeU2R1uqHv6D2TJXmjCIsaHBu7dmsqNQqAbb8RJoH3GhtaRQF9JRf9q477s6CbL4h+F
	So3+B8ceUCqdLr9jgH5wP4NtnBTeWdhfAAPTqiCNbJwqiaMlVU/PwwMV3AypSEcCSZcoBvONxLDsN
	fe+3QK3U74a3mja/J4LZCR5GZzW6ZHYF81rW1wQMT6FhM45AxvKMMhf4wLa4lkUM5UU62Go50hUPY
	Irv45B4fksVVPbHzc+2nOuYQjpPdCrNUolKqUj8kGXxvX4dJdI7s1vTAM2woZ4dkZSXanL2LG86Q4
	SOoMsmWQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ueC-00000004oPE-1TFP
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 16:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715702696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dmMmRWEieJM/VyycAHEtr/8G1hbbQFys09rSH0ZH8zw=;
	b=RaSxXuIEjpBcAuvh+eDbfPYz3gFiQY6GbSZyEz1+IU80oKL2HxZkIWh2M12dOPdUiCz6Cb
	sqT+kDunQU6kOGG+M40cQAce1ctHNj+p4PB8YNgwChgyRH2p6z53v8mmBE8s7Jh1UM1wZL
	2Vyme8dy6FdWTt66HgBVSxTgAPTMoFk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715702696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dmMmRWEieJM/VyycAHEtr/8G1hbbQFys09rSH0ZH8zw=;
	b=RaSxXuIEjpBcAuvh+eDbfPYz3gFiQY6GbSZyEz1+IU80oKL2HxZkIWh2M12dOPdUiCz6Cb
	sqT+kDunQU6kOGG+M40cQAce1ctHNj+p4PB8YNgwChgyRH2p6z53v8mmBE8s7Jh1UM1wZL
	2Vyme8dy6FdWTt66HgBVSxTgAPTMoFk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-d35bwQxcPfeyxmPkCiEutQ-1; Tue, 14 May 2024 12:04:54 -0400
X-MC-Unique: d35bwQxcPfeyxmPkCiEutQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-649731dd35bso1296866a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702693; x=1716307493;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dmMmRWEieJM/VyycAHEtr/8G1hbbQFys09rSH0ZH8zw=;
        b=GJfcEBW6cTxxv+JZQYv5igYFuxOLTughmWZoQrvSlzPIFPBd2AfsjoFyM9LpTmAVX4
         X35cxKOSQNjEG5c2sJ83WwCVn/RUfDppSY4fdr1t9i8SFaighPKxPeHHBinqAmLSP3z/
         mKrFDeCNLHSx6WtEywoUj9aX4vRM9psFHlzppkU1S+nLZ5vXBbxdusm2ME+KYznCKijm
         WNBRt1Xd6QiTHpaxlS7NRo5YX3vUtdlIyi/zQ0U+iBwZFWfevSvAq13eVhk5IKVcU3aK
         D+QLMMx8ok0RkhPreH5IXa+BLVjU6G9RSD+2DkL8ZHedz3BVFjA6EbdVNPRbFhnwsNo8
         PrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVfOgQzmVFJ6A0V9t8cGCC6pX6/3h+2ddw+9Vc0bZ2d7H3jkL3b2btlG7WSmaK/l5pWxjYrrsNhAPMJXP0KKgGsEZkATttqrDPbhcS67NHa
X-Gm-Message-State: AOJu0YxhG5FSOff9BxLBs5RSVh0jDNYRXKmzaXyfUcaOa/F2vNzJLHyk
	KsZVjtCrVuRQJRhcMKM1n+oFhIeusZcsL2kXcEFppozFt0h0u0ox8h4+i5qaFw5AnekrPFxcUfJ
	Ep+ZoxTnXBXTo2s7AIjEuvDiLt4l+dni8tEbaextHMPY/pfLgrthUS0OWaZANCQIC4w==
X-Received: by 2002:a17:902:dacf:b0:1ec:c9e0:c749 with SMTP id d9443c01a7336-1ef440505a0mr157388165ad.48.1715702692864;
        Tue, 14 May 2024 09:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyf1swdEc22d91QGE9oGlryQiUSYdvmusRTHKjFTFoYZZ/QMi0pxUaBLy+FRW8uQxZQ9IVjw==
X-Received: by 2002:a17:902:dacf:b0:1ec:c9e0:c749 with SMTP id d9443c01a7336-1ef440505a0mr157387705ad.48.1715702692355;
        Tue, 14 May 2024 09:04:52 -0700 (PDT)
Received: from [172.21.1.2] ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c2566c1sm99172045ad.293.2024.05.14.09.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 09:04:51 -0700 (PDT)
Message-ID: <267be75e-ed4a-45d0-883f-51c7324c30f1@redhat.com>
Date: Tue, 14 May 2024 18:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] riscv: mm: Add memory hotplugging support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-5-bjorn@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240514140446.538622-5-bjorn@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_170501_187044_27DF4A4D 
X-CRM114-Status: GOOD (  27.18  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQuMDUuMjQgMTY6MDQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IEZvciBhbiBhcmNoaXRlY3R1cmUgdG8gc3Vw
cG9ydCBtZW1vcnkgaG90cGx1Z2dpbmcsIGEgY291cGxlIG9mCj4gY2FsbGJhY2tzIG5lZWRzIHRv
IGJlIGltcGxlbWVudGVkOgo+IAo+ICAgYXJjaF9hZGRfbWVtb3J5KCkKPiAgICBUaGlzIGNhbGxi
YWNrIGlzIHJlc3BvbnNpYmxlIGZvciBhZGRpbmcgdGhlIHBoeXNpY2FsIG1lbW9yeSBpbnRvIHRo
ZQo+ICAgIGRpcmVjdCBtYXAsIGFuZCBjYWxsIGludG8gdGhlIG1lbW9yeSBob3RwbHVnZ2luZyBn
ZW5lcmljIGNvZGUgdmlhCj4gICAgX19hZGRfcGFnZXMoKSB0aGF0IGFkZHMgdGhlIGNvcnJlc3Bv
bmRpbmcgc3RydWN0IHBhZ2UgZW50cmllcywgYW5kCj4gICAgdXBkYXRlcyB0aGUgdm1lbW1hcCBt
YXBwaW5nLgo+IAo+ICAgYXJjaF9yZW1vdmVfbWVtb3J5KCkKPiAgICBUaGlzIGlzIHRoZSBpbnZl
cnNlIG9mIHRoZSBjYWxsYmFjayBhYm92ZS4KPiAKPiAgIHZtZW1tYXBfZnJlZSgpCj4gICAgVGhp
cyBmdW5jdGlvbiB0ZWFycyBkb3duIHRoZSB2bWVtbWFwIG1hcHBpbmdzIChpZgo+ICAgIENPTkZJ
R19TUEFSU0VNRU1fVk1FTU1BUCBpcyBlbmFibGVkKSwgYW5kIGFsc28gZGVhbGxvY2F0ZXMgdGhl
Cj4gICAgYmFja2luZyB2bWVtbWFwIHBhZ2VzLiBOb3RlIHRoYXQgZm9yIHBlcnNpc3RlbnQgbWVt
b3J5LCBhbgo+ICAgIGFsdGVybmF0aXZlIGFsbG9jYXRvciBmb3IgdGhlIGJhY2tpbmcgcGFnZXMg
Y2FuIGJlIHVzZWQ7IFRoZQo+ICAgIHZtZW1fYWx0bWFwLiBUaGlzIG1lYW5zIHRoYXQgd2hlbiB0
aGUgYmFja2luZyBwYWdlcyBhcmUgY2xlYXJlZCwKPiAgICBleHRyYSBjYXJlIGlzIG5lZWRlZCBz
byB0aGF0IHRoZSBjb3JyZWN0IGRlYWxsb2NhdGlvbiBtZXRob2QgaXMKPiAgICB1c2VkLgo+IAo+
ICAgYXJjaF9nZXRfbWFwcGFibGVfcmFuZ2UoKQo+ICAgIFRoaXMgZnVuY3Rpb25zIHJldHVybnMg
dGhlIFBBIHJhbmdlIHRoYXQgdGhlIGRpcmVjdCBtYXAgY2FuIG1hcC4KPiAgICBVc2VkIGJ5IHRo
ZSBNSFAgaW50ZXJuYWxzIGZvciBzYW5pdHkgY2hlY2tzLgo+IAo+IFRoZSBwYWdlIHRhYmxlIHVu
bWFwL3RlYXJkb3duIGZ1bmN0aW9ucyBhcmUgaGVhdmlseSBiYXNlZCBvbiBjb2RlIGZyb20KPiB0
aGUgeDg2IHRyZWUuIFRoZSBzYW1lIHJlbW92ZV9wZ2RfbWFwcGluZygpIGZ1bmN0aW9uIGlzIHVz
ZWQgaW4gYm90aAo+IHZtZW1tYXBfZnJlZSgpIGFuZCBhcmNoX3JlbW92ZV9tZW1vcnkoKSwgYnV0
IGluIHRoZSBsYXR0ZXIgZnVuY3Rpb24KPiB0aGUgYmFja2luZyBwYWdlcyBhcmUgbm90IHJlbW92
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyNDIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI0MiBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiBpbmRleCA2ZjcyYjBiMmI4NTQuLjdmMGI5MjFhM2QzYSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4g
QEAgLTE0OTMsMyArMTQ5MywyNDUgQEAgdm9pZCBfX2luaXQgcGd0YWJsZV9jYWNoZV9pbml0KHZv
aWQpCj4gICAJfQo+ICAgfQo+ICAgI2VuZGlmCj4gKwo+ICsjaWZkZWYgQ09ORklHX01FTU9SWV9I
T1RQTFVHCj4gK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVlX3B0ZV90YWJsZShwdGVfdCAqcHRl
X3N0YXJ0LCBwbWRfdCAqcG1kKQo+ICt7Cj4gKwlwdGVfdCAqcHRlOwo+ICsJaW50IGk7Cj4gKwo+
ICsJZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1BURTsgaSsrKSB7Cj4gKwkJcHRlID0gcHRlX3N0
YXJ0ICsgaTsKPiArCQlpZiAoIXB0ZV9ub25lKCpwdGUpKQo+ICsJCQlyZXR1cm47Cj4gKwl9Cj4g
Kwo+ICsJZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocG1kX3BhZ2UoKnBt
ZCkpLCAwKTsKPiArCXBtZF9jbGVhcihwbWQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBfX21l
bWluaXQgZnJlZV9wbWRfdGFibGUocG1kX3QgKnBtZF9zdGFydCwgcHVkX3QgKnB1ZCkKPiArewo+
ICsJcG1kX3QgKnBtZDsKPiArCWludCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBQVFJTX1BF
Ul9QTUQ7IGkrKykgewo+ICsJCXBtZCA9IHBtZF9zdGFydCArIGk7Cj4gKwkJaWYgKCFwbWRfbm9u
ZSgqcG1kKSkKPiArCQkJcmV0dXJuOwo+ICsJfQo+ICsKPiArCWZyZWVfcGFnZXMoKHVuc2lnbmVk
IGxvbmcpcGFnZV9hZGRyZXNzKHB1ZF9wYWdlKCpwdWQpKSwgMCk7Cj4gKwlwdWRfY2xlYXIocHVk
KTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcHVkX3RhYmxlKHB1ZF90
ICpwdWRfc3RhcnQsIHA0ZF90ICpwNGQpCj4gK3sKPiArCXB1ZF90ICpwdWQ7Cj4gKwlpbnQgaTsK
PiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgUFRSU19QRVJfUFVEOyBpKyspIHsKPiArCQlwdWQgPSBw
dWRfc3RhcnQgKyBpOwo+ICsJCWlmICghcHVkX25vbmUoKnB1ZCkpCj4gKwkJCXJldHVybjsKPiAr
CX0KPiArCj4gKwlmcmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhwNGRfcGFn
ZSgqcDRkKSksIDApOwo+ICsJcDRkX2NsZWFyKHA0ZCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lk
IF9fbWVtaW5pdCBmcmVlX3ZtZW1tYXBfc3RvcmFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgc2l6ZV90
IHNpemUsCj4gKwkJCQkJICAgc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXApCj4gK3sKPiArCWlm
IChhbHRtYXApCj4gKwkJdm1lbV9hbHRtYXBfZnJlZShhbHRtYXAsIHNpemUgPj4gUEFHRV9TSElG
VCk7Cj4gKwllbHNlCj4gKwkJZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3Mo
cGFnZSksIGdldF9vcmRlcihzaXplKSk7CgpJZiB5b3UgdW5wbHVnIGEgRElNTSB0aGF0IHdhcyBh
ZGRlZCBkdXJpbmcgYm9vdCAoY2FuIGhhcHBlbiBvbiB4ODYtNjQsIApjYW4gaXQgaGFwcGVuIG9u
IHJpc2N2PyksIGZyZWVfcGFnZXMoKSB3b3VsZCBub3QgYmUgc3VmZmljaWVudC4gWW91J2QgYmUg
CmZyZWVpbmcgYSBQR19yZXNlcnZlZCBwYWdlIHRoYXQgaGFzIHRvIGJlIGZyZWVkIGRpZmZlcmVu
dGx5LgoKLS0gCkNoZWVycywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
