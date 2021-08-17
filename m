Return-Path: <SRS0=wXHl=NI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96F6C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 07:33:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22F460EB5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 07:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A22F460EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OvPNvgT1pHOiNEH8hWgtn4UFiaGyXwAz4ypPEjtqLg4=; b=obuhJkOv6L1CbD56MqSaIx+uYj
	dyLyP7xlVOWlJwJnT6J3hEwcK6X5/o7OuvxnexHdt1JkFwu6m5t6apG9wtZmeL4VOGisP87fIU1wf
	IZGW1YrgprZSehGZQxv4s9uZ3p01xn+nsd0xkzbldrbSUMwEmfNjvEDBZ4tyxeILGZ7PC0dGX3j7t
	gYnqxVBKvpmhDqXDZSAwd1aH8svQBKX5UWFB0saw1NPaL1QBsYi40UXbs39HrPY3i//SBvYnfChP1
	6kNuB1/vpCXDBMNLkQOBHa4ZHkk9lGGCcWo4E0fGWwv8AmxBShiwPWZ8FLpr02ew4Hp3x8BpM10KH
	4vfaO4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtao-001KfF-PC; Tue, 17 Aug 2021 07:33:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtal-001Kdu-Pu
 for linux-riscv@lists.infradead.org; Tue, 17 Aug 2021 07:33:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id f3so23923063plg.3
 for <linux-riscv@lists.infradead.org>; Tue, 17 Aug 2021 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OmGjoPwRoQioipcSA3lcuU3i2adzPOju2P2is/uAIkQ=;
 b=pVnJAOXGmg6N9WpcoLwoGv6FSI2VUrPlhODr+6OGg9ggyE5FSefT4kC/j9ZXaWu+AP
 gy8mN4iyl9Q84JBHoE/htWADyU1/MTG7j8wVzT346I/P20PNNEjOHeJ7gsgpE+2wV61Z
 M9YzaX+ZQRnqoPzPI1385x5Ze66bAcLR6+G91yVcwyr+C5426940BPBLDtLgK0U1Nuq+
 GsvqR1zn1W0T9TGHsiTveF+MRIGgdoioNBywTZnSA2ItEy0ttewOZQd4Y8/7L7Aw6rWd
 Wr9L6HemLcKuIzrKCgDyoAYRREnXXfn9WBLoXjwtmkZyLNPxDwS8fX3m3snqEIb8SEwI
 y9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmGjoPwRoQioipcSA3lcuU3i2adzPOju2P2is/uAIkQ=;
 b=K377uLQCjcX7OaSguPZcNB4RHRacjV8jj6Yu/EpEyBJalauwqViYsbbcRobCX7Tt2K
 WCGr4MNC9UacKTyCjRiy8ig4W7LdSyl3bHU3rFQAxEDSTPg/NGQQ5TTOGxHxSIt9oSMD
 wY4M/HOHBNoKimtacxCWEOXQl/AOX3VZY+jr5FjbRtdiKRKZNY2plAwFpEGL8ktQrHLv
 nCWG2gSpUKjimU5kfP9wqPcErZkgL6GpgBuaIhlJhq3qj1GdjLsssZwmCTg51vC2PV4g
 PijQgqhwJwArxOlPNwSmYxwUEYMyGRtFNwzjFnsdQzREa+8TyUFPQ9mCNX3lhndK7v9d
 nVzQ==
X-Gm-Message-State: AOAM532lVBiD7xS3n8CP17eIP+WTJiICQGRv0P9tYAo3W3CYWIp2rwS1
 wCFHfT2VR2iva7e7Z8jHCTQ=
X-Google-Smtp-Source: ABdhPJyiSPzAA1MHRo1eVK5qvZ4f9+4RBMZHH/IJ9YL7+giF9oSEkcUjduIHaXRAkmaQjwkBIXZ3Bg==
X-Received: by 2002:a17:90a:c705:: with SMTP id
 o5mr2235956pjt.55.1629185577147; 
 Tue, 17 Aug 2021 00:32:57 -0700 (PDT)
Received: from [10.252.0.198]
 (ec2-54-250-108-108.ap-northeast-1.compute.amazonaws.com. [54.250.108.108])
 by smtp.gmail.com with ESMTPSA id z16sm1734052pgu.21.2021.08.17.00.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:32:56 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com
Subject: Re: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
 <61187c37.1c69fb81.ed9bd.cc45SMTPIN_ADDED_BROKEN@mx.google.com>
 <a85be25a-3a67-2baa-531d-98fa4f292f30@gmail.com>
 <611a33ac.1c69fb81.12aae.89a5SMTPIN_ADDED_BROKEN@mx.google.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <62b045c0-28ae-5d59-a91b-a2edaf060a62@gmail.com>
Date: Tue, 17 Aug 2021 16:32:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <611a33ac.1c69fb81.12aae.89a5SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_003259_913549_BBD3A8A3 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUWl1LAoKCk9uIDgvMTYvMjAyMSA2OjQ1IFBNLCBRaXUgV2VuYm8gd3JvdGU6Cj4gSGkgQWtp
cmEsCj4gCj4gCj4gSSBjYW4gcmVwcm9kdWNlIGl0IG9uIG15IEhpRml2ZSBVbm1hdGNoZWQgd2l0
aCBhIGN1c3RvbSBHZW50b28gcm9vdGZzLiBBcyBwb2ludGVkIG91dCBieSBBbmRyZWFzLCB0aGVy
ZSBtaWdodCBiZSBhIG1pc3NpbmcgZml4dXAuwqAgSSdtIGdvaW5nIHRvIGRlYnVnIHRoaXMgaXNz
dWUgbXlzZWxmIHNpbmNlIEkgY2FuIHJlcHJvZHVjZSBpdCBmYWlybHkgc3RhYmxlLgoKQWghIE5v
dyBJIHVuZGVyc3RhbmQgdGhlIGJ1Zy4KCj4gKyAgICBSRUdfTCAgICBhNSwgMChhMSkKCnNob3Vs
ZCBiZSAKCisgICAgZml4dXAgUkVHX0wgICAgYTUsIDAoYTEpCgpJZiB5b3UgZG8gbm90IG1pbmQs
IGNvdWxkIHlvdSBtYWtlIHRoZSBwYXRjaCB0byBhZGQgJ2ZpeHVwJyB0byBhbGwgUkVHX1MgYW5k
IFJFR19MPwpUaGVuIEkgd2lsbCByZXN1Ym1pdCB0aGVtIHRvIFBhbG1lciB3aXRoIHlvdXIgcGF0
Y2guCgpUaGFua3MsCgpBa2lyYQoKPiAKPiAKPiBRaXUKPiAKPiAKPiBPbiA4LzE2LzIxIDE0OjI0
LCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4+IEhpIFFpdSwKPj4KPj4gT24gOC8xNS8yMDIxIDEx
OjMwIEFNLCBRaXUgV2VuYm8gd3JvdGU6Cj4+PiBIaSBBa2lyYSwKPj4+Cj4+Pgo+Pj4gVGhpcyBw
YXRjaCBicmVha3MgbXkgdXNlcnNwYWNlwqAgYW5kIEkgY2FuJ3QgYm9vdCBteSBzeXN0ZW0gYWZ0
ZXIgYXBwbHlpbmcgdGhpcy4gSGVyZSBpcyB0aGUgc3RhY2sgdHJhY2U6Cj4+Pgo+Pj4KPj4+IFvC
oMKgIDEwLjM0OTA4MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCj4+PiBbwqDCoCAxMC4z
NTcxMTZdIE9vcHMgWyMxNV0KPj4+IFvCoMKgIDEwLjM1OTQzM10gQ1BVOiAyIFBJRDogMTY5IENv
bW06IChuZXR3b3JrZCkgVGFpbnRlZDogRyBEwqDCoMKgwqDCoMKgwqDCoMKgwqAgNS4xNC4wLXJj
NSAjNTMKPj4+IFvCoMKgIDEwLjM2NzQyMl0gSGFyZHdhcmUgbmFtZTogU2lGaXZlIEhpRml2ZSBV
bm1hdGNoZWQgQTAwIChEVCkKPj4+IFvCoMKgIDEwLjM3Mjk4MV0gZXBjIDogX19hc21fY29weV9m
cm9tX3VzZXIrMHg0OC8weGYwCj4+PiBbwqDCoCAxMC4zNzc1ODRdwqAgcmEgOiBfY29weV9mcm9t
X3VzZXIrMHgyOC8weDY4Cj4+PiBbwqDCoCAxMC4zODE3NTRdIGVwYyA6IGZmZmZmZmZmODA5OWEy
ODAgcmEgOiBmZmZmZmZmZjgwMzYxNGE4IHNwIDogZmZmZmZmZDAwNDE2YmQ5MAo+Pj4gW8KgwqAg
MTAuMzg4OTYzXcKgIGdwIDogZmZmZmZmZmY4MTFlZTU0MCB0cCA6IGZmZmZmZmUwODQxYjM2ODAg
dDAgOiBmZmZmZmZkMDA0MTZiZGUwCj4+PiBbwqDCoCAxMC4zOTYxNzJdwqAgdDEgOiBmZmZmZmZk
MDA0MTZiZGQ4IHQyIDogMDAwMDAwM2ZmMDljYTNhMCBzMCA6IGZmZmZmZmQwMDQxNmJkYzAKPj4+
IFvCoMKgIDEwLjQwMzM4MV3CoCBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiBmZmZmZmZkMDA0
MTZiZGQ4IGExIDogMDAwMDAwMDAwMDAwMDAwMAo+Pj4gW8KgwqAgMTAuNDEwNTkwXcKgIGEyIDog
MDAwMDAwMDAwMDAwMDAxMCBhMyA6IDAwMDAwMDAwMDAwMDAwNDAgYTQgOiBmZmZmZmZkMDA0MTZi
ZTE4Cj4+PiBbwqDCoCAxMC40MTc4MDBdwqAgYTUgOiAwMDAwMDAzZmZmZmZmZmYwIGE2IDogMDAw
MDAwMDAwMDAwMDAwZiBhNyA6IGZmZmZmZmUwODVkNTg1NDAKPj4+IFvCoMKgIDEwLjQyNTAwOV3C
oCBzMiA6IDAwMDAwMDAwMDAwMDAwMTAgczMgOiBmZmZmZmZkMDA0MTZiZGQ4IHM0IDogMDAwMDAw
MDAwMDAwMDAwMgo+Pj4gW8KgwqAgMTAuNDMyMjE4XcKgIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBz
NiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiBmZmZmZmZlMDg0MWIzNjgwCj4+PiBbwqDCoCAxMC40
Mzk0MjddwqAgczggOiAwMDAwMDAyYWFkNzg4MDQwIHM5IDogMDAwMDAwMDAwMDAwMDAwMCBzMTA6
IDAwMDAwMDAwMDAwMDAwMDEKPj4+IFvCoMKgIDEwLjQ0NjYzNl3CoCBzMTE6IDAwMDAwMDAwMDAw
MDAwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDogMDAwMDAwMDAwMDAwMDAwMQo+Pj4gW8Kg
wqAgMTAuNDUzODQ1XcKgIHQ1IDogMDAwMDAwMDAwMDAwMDAxMCB0NiA6IDAwMDAwMDAwMDAwNDAw
MDAKPj4+IFvCoMKgIDEwLjQ1OTE0NF0gc3RhdHVzOiAwMDAwMDAwMjAwMDQwMTIwIGJhZGFkZHI6
IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKPj4+IFvCoMKgIDEwLjQ2
NzA0OV0gWzxmZmZmZmZmZjgwOTlhMjgwPl0gX19hc21fY29weV9mcm9tX3VzZXIrMHg0OC8weGYw
Cj4+PiBbwqDCoCAxMC40NzI5NTVdIFs8ZmZmZmZmZmY4MDA5YTU2Mj5dIGRvX3NlY2NvbXArMHg2
Mi8weDhiZQo+Pj4gW8KgwqAgMTAuNDc4MDc5XSBbPGZmZmZmZmZmODAwOWFmNTg+XSBwcmN0bF9z
ZXRfc2VjY29tcCsweDI0LzB4MzIKPj4+IFvCoMKgIDEwLjQ4MzcyNV0gWzxmZmZmZmZmZjgwMDIw
NzU2Pl0gc3lzX3ByY3RsKzB4ZjYvMHg0NTAKPj4+IFvCoMKgIDEwLjQ4ODc2M10gWzxmZmZmZmZm
ZjgwMDAzNGYyPl0gcmV0X2Zyb21fc3lzY2FsbCsweDAvMHgyCj4+Pgo+Pj4KPj4+IFRoZSBQQyBy
ZWdpc3RlciBwb2ludHMgdG8gdGhpcyBsaW5lOgo+Pj4KPj4+ICsxOgo+Pj4gK8KgwqDCoCBSRUdf
TMKgwqDCoCBhNSwgMChhMSkKPj4gVGhhbmtzIGZvciB0ZXN0aW5nISBEbyB5b3UgbWluZCB0ZWFj
aGluZyBtZSBob3cgdG8gcmVwcm9kdWNlIHRoZSBlcnJvcj8KPj4KPj4gQWtpcmEKPj4KPiAKPiAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
