Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B714AC7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4MS+5cP4UrqoFBxgoQwVk3RPKfOy5RCYqrQ8nwtixE=; b=hNEgXJy8b/1qvY
	ux94kTqxBYJLy4DA+InJC5xAYIQgcWAFE65b0so8AdoDmtr5HaBNdVCeXAZWVMAgJewrWCrbs3i7e
	79YDPAf9Ej+X1Qy8KpCW5GZ8/WHHSTymuctYAvxrffBZpqFj/nl55oZiUoD5yNAsBEqdsCXabEdyd
	XhCrNJosd053ItyawdjXEw+KQkCLGe+kDzP1hkhtdYjjcn/gOOr3cmzZAyXNwDJfyI9OwsbzGTvaL
	5ET8MHyjG1WUtSkpbz63r3T9ZHFGaA2NqbjlPkZg3R7CMO/sfdld0Z+8PuZ4YGQc/fkg8ahORDp5U
	298BGqS1bRjne4Xixtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR2u-00000008xIR-2ZiU;
	Wed, 25 Jun 2025 14:24:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNqg-00000008Osd-3tpT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 10:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GQ708vu4avBCMPhkM+hqdqAXtmzk7kBGgUnbB1W0/yM=;
	b=gi1CxZlMf+H2JYkAEiZDL1rKw3wdK7NlhYobf9Wz//sOFgQicHy9zpk7fLkbfgeheDJDQ0
	4PXos7jMxdyB45os5bTjdbcojiqvyWKezNQfW/oXLeZnpJO/gCEVrm111/JQC7a1HXjZdH
	5E6V/hv5HhLGIuTztJMlSAP0yKfn4GE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-nLPPXoP6MqmjN7mmWZPg4A-1; Wed, 25 Jun 2025 06:59:24 -0400
X-MC-Unique: nLPPXoP6MqmjN7mmWZPg4A-1
X-Mimecast-MFC-AGG-ID: nLPPXoP6MqmjN7mmWZPg4A_1750849163
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d64026baso8397195e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 03:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849163; x=1751453963;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GQ708vu4avBCMPhkM+hqdqAXtmzk7kBGgUnbB1W0/yM=;
        b=VC0Xy0bcA8Y7hHddXNvXfVVTBwooLtNhnGauX8ktPw0t/Ne1OESdwPbZd4GdmCg//J
         fZs5v64eTiYeQ4M+WZlG3qQi0YvFDqJU1UWdbDW18VrR/KD0NiOixUmNvXVxU/Y2puhv
         JKtPPfPnTZaBmccSfGkKzMyDCWkKLuXyfOyc/n5F+m/+Y9n5azo8bl3s8wencXdH3Oo/
         isqqddArXO3PXwGibO3oHls/7QMUUgVCOujPjhhItkk1UaUzvrRs2NG3O8EVEaOl2ia2
         rX/PmpbpNBr3gH6PWInSqZJ7XcIeY1Ltgf9zzG1F099VLsoFksb4VWhrHyAW+1bJL3Lp
         GJrA==
X-Forwarded-Encrypted: i=1; AJvYcCUbdAD78ChTId0MralOrUSmSfYCYJNh59KI8r2a1A1yIlNwlk4rPHFimH0n399aYy+5OQ2m9s2krf22Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW9OydDZeaP7H1WSMfgY4usnvHGxbPq0Gy3pgP8tHBnu2xya4g
	EYRndmfWPLx7NtZlui32AAEZSjsR/4BssoXK0asGmJvHPq/6v3qt3IXNbkw0FstNzo4YQgzgJUZ
	s+Bqjdk8e+J6DTJHtKKG11orcOoe6dSfxX6hc8upbxD0osmkY5Doye15oEw3CairfsTCIkQ==
X-Gm-Gg: ASbGncu0bkdu1YvMhKHpnaRV7TXZRIZ3lXZfHhvA7spywptCr613LGkI190WRV9IPWr
	C9Zh2QtcGlahjY88RSkiUqGMEAiUIqJEZ6BZyw/7uQ6Vjl9wZHTPqqqxXtbp2BiOPOnSteqaLMc
	pNOep+riSWIzPgwgGt8BXSW7delTS+USkObL4/xf4Rwgz5VdYSyil1JPGsFXwOy+muFpgVBwSNm
	SK+582g3DfjluBkdrnok3sf2D+b+h7g4i3nXM1CcKokdJu/iNPGJENej7k6VAiAL3macwrDc48q
	OpPqKwtRY+qr9/IU/Q7QOZxSfUgU3OPrTO5eCXiDcfAzhJJyAYDuHTZNUNgb0YF0OgFGG4U9/MX
	JU2LvzrqUOX6sbQYfyiHb8Hb+YtrdoSymx7k8F+CA9TVs
X-Received: by 2002:a05:600c:64cf:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45381af6af8mr20391425e9.33.1750849163293;
        Wed, 25 Jun 2025 03:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDpfug9PmYOC/S+NqZ57NJ8Jm3l0ZdGNpTYbf8qxhN/FecM/8gb7Bcic4PKJ268lMQ/vZeMA==
X-Received: by 2002:a05:600c:64cf:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45381af6af8mr20391015e9.33.1750849162720;
        Wed, 25 Jun 2025 03:59:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff461sm4398628f8f.67.2025.06.25.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:59:22 -0700 (PDT)
Message-ID: <146b4cb1-aa1e-4519-9e03-f98cfb1135d2@redhat.com>
Date: Wed, 25 Jun 2025 12:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com>
 <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
 <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _5EV3hsJPm2Dhay1pugwTSUcbMxKgxlD-EdTqYP-8Qc_1750849163
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035927_046544_E7D3F968 
X-CRM114-Status: GOOD (  17.94  )
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

T24gMjUuMDYuMjUgMTI6NDksIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjUsIDIw
MjUgYXQgMTA6NDPigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDI1LjA2LjI1IDEyOjM4LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4+PiBkaWZm
IC0tZ2l0IGEvbW0vcm1hcC5jIGIvbW0vcm1hcC5jCj4+Pj4+IGluZGV4IGZiNjNkOTI1NmYwOS4u
MjQxZDU1YTkyYTQ3IDEwMDY0NAo+Pj4+PiAtLS0gYS9tbS9ybWFwLmMKPj4+Pj4gKysrIGIvbW0v
cm1hcC5jCj4+Pj4+IEBAIC0xODQ3LDEyICsxODQ3LDI1IEBAIHZvaWQgZm9saW9fcmVtb3ZlX3Jt
YXBfcHVkKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBwYWdlICpwYWdlLAo+Pj4+Pgo+Pj4+
PiAgICAgLyogV2Ugc3VwcG9ydCBiYXRjaCB1bm1hcHBpbmcgb2YgUFRFcyBmb3IgbGF6eWZyZWUg
bGFyZ2UgZm9saW9zICovCj4+Pj4+ICAgICBzdGF0aWMgaW5saW5lIGJvb2wgY2FuX2JhdGNoX3Vu
bWFwX2ZvbGlvX3B0ZXModW5zaWduZWQgbG9uZyBhZGRyLAo+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGZvbGlvICpmb2xpbywgcHRlX3QgKnB0ZXApCj4+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZvbGlvICpmb2xpbywgcHRl
X3QgKnB0ZXAsCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4+Pj4+ICAgICB7Cj4+Pj4+ICAgICAgICAg
Y29uc3QgZnBiX3QgZnBiX2ZsYWdzID0gRlBCX0lHTk9SRV9ESVJUWSB8IEZQQl9JR05PUkVfU09G
VF9ESVJUWTsKPj4+Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBuZXh0X3BtZCwgdm1hX2VuZCwgZW5k
X2FkZHI7Cj4+Pj4+ICAgICAgICAgaW50IG1heF9uciA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsK
Pj4+Pj4gICAgICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVwKTsKPj4+Pj4KPj4+Pj4gKyAg
ICAgLyoKPj4+Pj4gKyAgICAgICogTGltaXQgdGhlIGJhdGNoIHNjYW4gd2l0aGluIGEgc2luZ2xl
IFZNQSBhbmQgd2l0aGluIGEgc2luZ2xlCj4+Pj4+ICsgICAgICAqIHBhZ2UgdGFibGUuCj4+Pj4+
ICsgICAgICAqLwo+Pj4+PiArICAgICB2bWFfZW5kID0gdm1hLT52bV9lbmQ7Cj4+Pj4+ICsgICAg
IG5leHRfcG1kID0gQUxJR04oYWRkciArIDEsIFBNRF9TSVpFKTsKPj4+Pj4gKyAgICAgZW5kX2Fk
ZHIgPSBhZGRyICsgKHVuc2lnbmVkIGxvbmcpbWF4X25yICogUEFHRV9TSVpFOwo+Pj4+PiArCj4+
Pj4+ICsgICAgIGlmIChlbmRfYWRkciA+IG1pbihuZXh0X3BtZCwgdm1hX2VuZCkpCj4+Pj4+ICsg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+Cj4+Pj4gTWF5IEkgc3VnZ2VzdCB0aGF0IHdl
IGNsZWFuIGFsbCB0aGF0IHVwIGFzIHdlIGZpeCBpdD8KPj4+Pgo+Pj4+IE1heWJlIHNvbWV0aGlu
ZyBsaWtlIHRoaXM6Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvbW0vcm1hcC5jIGIvbW0vcm1hcC5j
Cj4+Pj4gaW5kZXggM2I3NGJiMTljMTFkZC4uMTFmYmRkYzZhZDhkNiAxMDA2NDQKPj4+PiAtLS0g
YS9tbS9ybWFwLmMKPj4+PiArKysgYi9tbS9ybWFwLmMKPj4+PiBAQCAtMTg0NSwyMyArMTg0NSwz
OCBAQCB2b2lkIGZvbGlvX3JlbW92ZV9ybWFwX3B1ZChzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1
Y3QgcGFnZSAqcGFnZSwKPj4+PiAgICAgI2VuZGlmCj4+Pj4gICAgIH0KPj4+Pgo+Pj4+IC0vKiBX
ZSBzdXBwb3J0IGJhdGNoIHVubWFwcGluZyBvZiBQVEVzIGZvciBsYXp5ZnJlZSBsYXJnZSBmb2xp
b3MgKi8KPj4+PiAtc3RhdGljIGlubGluZSBib29sIGNhbl9iYXRjaF91bm1hcF9mb2xpb19wdGVz
KHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
Zm9saW8gKmZvbGlvLCBwdGVfdCAqcHRlcCkKPj4+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBp
bnQgZm9saW9fdW5tYXBfcHRlX2JhdGNoKHN0cnVjdCBmb2xpbyAqZm9saW8sCj4+Pj4gKyAgICAg
ICAgICAgICAgIHN0cnVjdCBwYWdlX3ZtYV9tYXBwZWRfd2FsayAqcHZtdywgZW51bSB0dHVfZmxh
Z3MgZmxhZ3MsCj4+Pj4gKyAgICAgICAgICAgICAgIHB0ZV90IHB0ZSkKPj4+PiAgICAgewo+Pj4+
ICAgICAgICAgICAgY29uc3QgZnBiX3QgZnBiX2ZsYWdzID0gRlBCX0lHTk9SRV9ESVJUWSB8IEZQ
Ql9JR05PUkVfU09GVF9ESVJUWTsKPj4+PiAtICAgICAgIGludCBtYXhfbnIgPSBmb2xpb19ucl9w
YWdlcyhmb2xpbyk7Cj4+Pj4gLSAgICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVwKTsKPj4+
PiArICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gcHZtdy0+dm1hOwo+Pj4+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBlbmRfYWRkciwgYWRkciA9IHB2bXctPmFkZHJlc3M7Cj4+Pj4g
KyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X25yOwo+Pj4+ICsKPj4+PiArICAgICAgIGlmIChmbGFn
cyAmIFRUVV9IV1BPSVNPTikKPj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4+Pj4gKyAg
ICAgICBpZiAoIWZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pKQo+Pj4+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMTsKPj4+PiArCj4+Pj4gKyAgICAgICAvKiBXZSBtYXkgb25seSBiYXRjaCB3aXRoaW4g
YSBzaW5nbGUgVk1BIGFuZCBhIHNpbmdsZSBwYWdlIHRhYmxlLiAqLwo+Pj4+ICsgICAgICAgZW5k
X2FkZHIgPSBtaW5fdCh1bnNpZ25lZCBsb25nLCBBTElHTihhZGRyICsgMSwgUE1EX1NJWkUpLCB2
bWEtPnZtX2VuZCk7Cj4+Pgo+Pj4gSXMgdGhpcyBwbWRfYWRkcl9lbmQoKT8KPj4+Cj4+Cj4+IFll
cywgdGhhdCBjb3VsZCBiZSByZXVzZWQgYXMgd2VsbCBoZXJlLgo+Pgo+Pj4+ICsgICAgICAgbWF4
X25yID0gKGVuZF9hZGRyIC0gYWRkcikgPj4gUEFHRV9TSElGVDsKPj4+Pgo+Pj4+ICsgICAgICAg
LyogV2Ugb25seSBzdXBwb3J0IGxhenlmcmVlIGJhdGNoaW5nIGZvciBub3cgLi4uICovCj4+Pj4g
ICAgICAgICAgICBpZiAoIWZvbGlvX3Rlc3RfYW5vbihmb2xpbykgfHwgZm9saW9fdGVzdF9zd2Fw
YmFja2VkKGZvbGlvKSkKPj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMTsKPj4+PiAgICAgICAgICAgIGlmIChwdGVfdW51c2VkKHB0
ZSkpCj4+Pj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4+PiAtICAgICAgIGlmIChw
dGVfcGZuKHB0ZSkgIT0gZm9saW9fcGZuKGZvbGlvKSkKPj4+PiAtICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMTsKPj4+PiArICAgICAgIC8q
IC4uLiB3aGVyZSB3ZSBtdXN0IGJlIGFibGUgdG8gYmF0Y2ggdGhlIHdob2xlIGZvbGlvLiAqLwo+
Pj4+ICsgICAgICAgaWYgKHB0ZV9wZm4ocHRlKSAhPSBmb2xpb19wZm4oZm9saW8pIHx8IG1heF9u
ciAhPSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAx
Owo+Pj4+ICsgICAgICAgbWF4X25yID0gZm9saW9fcHRlX2JhdGNoKGZvbGlvLCBhZGRyLCBwdm13
LT5wdGUsIHB0ZSwgbWF4X25yLCBmcGJfZmxhZ3MsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCwgTlVMTCwgTlVMTCk7Cj4+Pj4KPj4+PiAtICAgICAgIHJldHVybiBm
b2xpb19wdGVfYmF0Y2goZm9saW8sIGFkZHIsIHB0ZXAsIHB0ZSwgbWF4X25yLCBmcGJfZmxhZ3Ms
IE5VTEwsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwpID09
IG1heF9ucjsKPj4+PiArICAgICAgIGlmIChtYXhfbnIgIT0gZm9saW9fbnJfcGFnZXMoZm9saW8p
KQo+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMTsKPj4+PiArICAgICAgIHJldHVybiBtYXhf
bnI7Cj4+Pj4gICAgIH0KPj4+Pgo+Pj4+ICAgICAvKgo+Pj4+IEBAIC0yMDI0LDkgKzIwMzksNyBA
QCBzdGF0aWMgYm9vbCB0cnlfdG9fdW5tYXBfb25lKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChwdGVfZGlydHkocHRldmFsKSkKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZvbGlvX21hcmtfZGlydHkoZm9saW8pOwo+Pj4+ICAgICAgICAgICAgICAgICAgICB9IGVs
c2UgaWYgKGxpa2VseShwdGVfcHJlc2VudChwdGV2YWwpKSkgewo+Pj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChmb2xpb190ZXN0X2xhcmdlKGZvbGlvKSAmJiAhKGZsYWdzICYgVFRVX0hX
UE9JU09OKSAmJgo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBjYW5fYmF0Y2hfdW5t
YXBfZm9saW9fcHRlcyhhZGRyZXNzLCBmb2xpbywgcHZtdy5wdGUpKQo+Pj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbnJfcGFnZXMgPSBmb2xpb19ucl9wYWdlcyhmb2xpbyk7Cj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbnJfcGFnZXMgPSBmb2xpb191bm1hcF9wdGVfYmF0
Y2goZm9saW8sICZwdm13LCBmbGFncywgcHRldmFsKTsKPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbmRfYWRkciA9IGFkZHJlc3MgKyBucl9wYWdlcyAqIFBBR0VfU0laRTsKPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIGFkZHJlc3Ms
IGVuZF9hZGRyKTsKPj4+Pgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IEkgZG9uJ3QgcXVpdGUgdW5kZXJz
dGFuZCB3aHkgd2UgaGF2ZSB0byBiYXRjaCB0aGUgd2hvbGUgdGhpbmcgb3IgZmFsbGJhY2sgdG8K
Pj4+PiBpbmRpdmlkdWFsIHBhZ2VzLiBXaHkgY2FuJ3Qgd2UgcGVyZm9ybSBvdGhlciBiYXRjaGVz
IHRoYXQgc3BhbiBvbmx5IHNvbWUgUFRFcz8gV2hhdCdzIHNwZWNpYWwKPj4+PiBhYm91dCAxIFBU
RSB2cy4gMiBQVEVzIHZzLiBhbGwgUFRFcz8KPj4+Pgo+Pj4+Cj4+Pj4gQ2FuIHNvbWVvbmUgZW5s
aWdodGVuIG1lIHdoeSB0aGF0IGlzIHJlcXVpcmVkPwo+Pj4KPj4+IEl0J3MgcHJvYmFibHkgbm90
IGEgc3RyaWN0IHJlcXVpcmVtZW50IOKAlCBJIHRob3VnaHQgY2FzZXMgd2hlcmUgdGhlCj4+PiBj
b3VudCBpcyBncmVhdGVyIHRoYW4gMSBidXQgbGVzcyB0aGFuIG5yX3BhZ2VzIG1pZ2h0IG5vdCBw
cm92aWRlIG11Y2gKPj4+IHByYWN0aWNhbCBiZW5lZml0LCBleGNlcHQgcGVyaGFwcyBpbiB2ZXJ5
IHJhcmUgZWRnZSBjYXNlcywgc2luY2UKPj4+IG1hZHZfZnJlZSgpIGFscmVhZHkgY2FsbHMgc3Bs
aXRfZm9saW8oKS4KPj4KPj4gT2theSwgYnV0IGl0IG1ha2VzIHRoZSBjb2RlIG1vcmUgY29tcGxp
Y2F0ZWQuIElmIHRoZXJlIGlzIG5vIHJlYXNvbiB0bwo+PiBwcmV2ZW50IHRoZSBiYXRjaGluZywg
d2Ugc2hvdWxkIGRyb3AgaXQuCj4gCj4gSXQncyBub3QgbmVjZXNzYXJpbHkgbW9yZSBjb21wbGV4
LCBzaW5jZSBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpIHN0aWxsCj4gaGFzIHRvIGNoZWNrIGVhY2gg
UFRFIGluZGl2aWR1YWxseSBhbmQgY2FuJ3Qgc2tpcCBhaGVhZCBiYXNlZCBvbiBuci4KPiBXaXRo
IG5yX3BhZ2VzIGJhdGNoZWQsIHdlIGNhbiBleGl0IHRoZSBsb29wIGVhcmx5IGluIG9uZSBnby4K
Ckkgc2FpZCAiY29tcGxpY2F0ZWQiLCBub3QgImNvbXBsZXgiLiBUaGUgY29kZSBpcyBtb3JlIGNv
bXBsaWNhdGVkIHRoYW4gCm5lY2Vzc2FyeS4KCi0tIApDaGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5i
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
