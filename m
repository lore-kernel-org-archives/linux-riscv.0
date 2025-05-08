Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863A9C3ABC6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRlODON7VXMcGYfWw8gDSInAk7lbD4KrEKYwCv0WPMY=; b=Wb8mltx/bnXilc
	+hW3LxE9vxfQw4pw+PO3zvhchs8lK+49XDL6q6iKZE0YryOc8PgJwbNjjQQPeotGtkLVKoV1Zcipt
	OURhJeI/8VGlYEfD0aCpsp1VrViMWzwgr+DrX2qbHiLMewqRf8d4OEP5NRNRGkWUCO6aK5bl37Bye
	oXfhY/UIMZkMEL7UPj0wFtBpDWeP+UVWSDL3yjcMBXtHKttzGzsbC0MJq10Vg9pd6vF/446pVkZdU
	6C6icFRyfeP6ObsYzWTf2G7RJzqCOAecL1wr6ho1KSaXCJCuEYo3/CEjOHW6KCYCF5C1lJY/V3k2q
	TUNl9vaFW+6gaZOYAbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7gw-00000001k1G-3Izv;
	Thu, 08 May 2025 20:18:02 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7gt-00000001k0W-318k
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 20:18:00 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3da79204277so8619495ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746735479; x=1747340279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETi+juIkyQnejMlNPha6WwCCX1oR6QtFi1j8HpYbzjk=;
        b=zGUvAlBMs1/phhBw3Lo2G2oIYF3tlG+6NkVf/UbYPYJb63WGCfr1ot57dFOvBhfiUO
         fRNytPGGu556Fk7xk2Dck0PIHF7mrfA5WZfD0VpRSr250NBGPV3Zu6jklFAvIG2JFRD2
         +yzndRV45qhwTW74DUB4Zx3oavVnX7kAnB6lM2XwvZNVWHnW95E/F1hJdyt85UL+ntYv
         6CxgYlFqmV4M9JCKzUYo2dqAiG63rygD1IJUK+0WNhrm2JnSMQ1UtJhKLDnaykR8Xdds
         BX7UwgUbwD9ar1pLBKS7M+X0Vkox0yt6pvJ4YSryDhLFMR1MBGwElgT9kTJ7RM+jW9Fb
         MW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735479; x=1747340279;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETi+juIkyQnejMlNPha6WwCCX1oR6QtFi1j8HpYbzjk=;
        b=RxpxvC9/D31Xj/uKh0P8K1bB44lGhTWp/t+KEwM9ahYbNdERp+vFTP/LPsPqBUnbp3
         6ZX5Z9oT9G6IwTO3T0JHZ0mlOPX9bIlDPmPmwvli8oGgAkmyVLL4XYZeGhWtzANzmrfy
         MN8uEJXg1Sxm70sviWi68pBJwPuSrToyHDkn8cgror0lFnLB0e49bv7ZoLkLcc2b8kLO
         09yeDPYs7tcyNwYPgrb1CwbDTObZyUThABL7QCgXu63x0440csUuuJkiD1ARBS9TapZj
         4ukFhJ2kGmdp6ExMYUdw80ZDvHA5Gw9SmG+fBLuHHzD5JVOqH9jkp0CnLbrW9ovwDNyM
         ksdg==
X-Forwarded-Encrypted: i=1; AJvYcCUWjLWi3jZONOYA2arFJ985y5uyrvsGVVi2EwItKPXA1p1lMHC7QvOCc8XTxqAI9jPqdtJRXevV9vk5vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi0+OmYsC88FtfutKTp+O6oVbnZ7sHpCBhUnluLDzXms4BPq7f
	M/PWNV58I53BAtS+IUppONWCfu0+Zv1vTpo/pFxmYCrsWcQfFXKv24m/R8utpWU=
X-Gm-Gg: ASbGncvs9cHJ1dcrJT5JVviitUaju6YFJv13ga4Y7P5hT8c7R75rio5p4P/LqjdrEPr
	QfSwI4nPpUS9F38H/B4NJEROPRZrc+lFQfLKCtYccA153iyGVlCQPi2ENlBEf8G/++V2s5JY5Ib
	CB/sC2Mhm3X2xcamLXmEnkpXMWGS8fUvCD9rF86Dp/vGvpt4IJIUFrxVCDqBfYOmNzvFmef9Rt6
	qa7D2YeLiogp4cuY2KVVJjXlYJMK/awgBALJeztZzHvFkkbm2IZe/F3CdO+2v88jBN4Rf4WBuFN
	eNLQ5kw2T5Qw3uJw021UfgTg4XpCJJnGPXJy/NlFRiXxooW9QtAZg6Nqk7py77dCGjGMwN6Dsjh
	DZQC6
X-Google-Smtp-Source: AGHT+IGJAd0oucTC9Dfp7hY2K4c9PGXfx+VquDL7ztVyi8dVyRm1MKOCjz+TCJ63cr0iCG2Azpd+Lg==
X-Received: by 2002:a05:6e02:1605:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3da7e1e6ff5mr13544025ab.9.1746735478876;
        Thu, 08 May 2025 13:17:58 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e0f9a5dsm1342015ab.15.2025.05.08.13.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:17:58 -0700 (PDT)
Message-ID: <ec118fe2-00c3-47d0-957d-cbd7a8ecfbb1@riscstar.com>
Date: Thu, 8 May 2025 15:17:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
From: Alex Elder <elder@riscstar.com>
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com> <aBw3KNwjMeCIfnNR@ketchup>
 <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Content-Language: en-US
In-Reply-To: <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_131759_763444_9EF1164D 
X-CRM114-Status: GOOD (  26.89  )
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

T24gNS84LzI1IDM6MDQgUE0sIEFsZXggRWxkZXIgd3JvdGU6Cj4gT24gNS83LzI1IDExOjQ2IFBN
LCBIYXlsZW4gQ2h1IHdyb3RlOgo+PiBPbiBUdWUsIE1heSAwNiwgMjAyNSBhdCAwNDowNjozNFBN
IC0wNTAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+Pj4gQWRkIGEgbmV3IHJlc2V0X25hbWUgZmllbGQg
dG8gdGhlIHNwYWNlbWl0X2NjdV9kYXRhIHN0cnVjdHVyZS7CoCBJZiBpdCBpcwo+Pj4gbm9uLW51
bGwsIHRoZSBDQ1UgaW1wbGVtZW50cyBhIHJlc2V0IGNvbnRyb2xsZXIsIGFuZCB0aGUgbmFtZSB3
aWxsIGJlCj4+PiB1c2VkIGFzIHRoZSBuYW1lIGZvciB0aGUgYXV4aWxpYXJ5IGRldmljZSB0aGF0
IGltcGxlbWVudHMgaXQuCj4+Pgo+Pj4gRGVmaW5lIGEgbmV3IHR5cGUgdG8gaG9sZCBhbiBhdXhp
bGlhcnkgZGV2aWNlIGFzIHdlbGwgYXMgdGhlIHJlZ21hcAo+Pj4gcG9pbnRlciB0aGF0IHdpbGwg
YmUgbmVlZGVkIGJ5IENDVSByZXNldCBjb250cm9sbGVycy7CoCBTZXQgdXAgY29kZSB0bwo+Pj4g
aW5pdGlhbGl6ZSBhbmQgYWRkIGFuIGF1eGlsaWFyeSBkZXZpY2UgZm9yIGFueSBDQ1UgdGhhdCBp
bXBsZW1lbnRzIHJlc2V0Cj4+PiBmdW5jdGlvbmFsaXR5Lgo+Pj4KPj4+IE1ha2UgaXQgb3B0aW9u
YWwgZm9yIGEgQ0NVIHRvIGltcGxlbWVudCBhIGNsb2NrIGNvbnRyb2xsZXIuwqAgVGhpcwo+Pj4g
ZG9lc24ndCBhcHBseSB0byBhbnkgb2YgdGhlIGV4aXN0aW5nIENDVXMgYnV0IHdpbGwgZm9yIHNv
bWUgbmV3IG9uZXMKPj4+IHRoYXQgd2lsbCBiZSBhZGRlZCBzb29uLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJp
dmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMgfCA4NSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQo+Pj4gwqAgaW5jbHVkZS9zb2Mvc3BhY2VtaXQvY2N1X2sxLmggfCAxMiArKysr
Kwo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYyBiL2Ry
aXZlcnMvY2xrL3NwYWNlbWl0LyAKPj4+IGNjdS1rMS5jCj4+PiBpbmRleCA5NTQ1Y2ZlNjBiOTJi
Li42YjE4NDVlODk5ZTVmIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1
LWsxLmMKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCj4+Cj4+IC4uLgo+
Pgo+Pj4gK3N0YXRpYyB2b2lkIHNwYWNlbWl0X2NhZGV2X3JlbGVhc2Uoc3RydWN0IGRldmljZSAq
ZGV2KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYgPSB0
b19hdXhpbGlhcnlfZGV2KGRldik7Cj4+PiArCj4+PiArwqDCoMKgIGtmcmVlKHRvX3NwYWNlbWl0
X2NjdV9hZGV2KGFkZXYpKTsKPj4+ICt9Cj4+Cj4+IHNwYWNlbWl0X2NjdV9hZGV2IHN0cnVjdHVy
ZXMgYXJlIGFsbG9jYXRlZCB3aXRoIGRldm1fa3phbGxvYygpIGluCj4+IHNwYWNlbWl0X2NjdV9y
ZXNldF9yZWdpc3RlcigpLCB3aGljaCBtZWFucyBpdHMgbGlmZXRpbWUgaXMgYm91bmQgdG8gdGhl
Cj4+IGRyaXZlciBhbmQgaXQnbGwgYmUgYXV0b21hdGljYWxseSByZWxlYXNlZCBhZnRlciBkcml2
ZXIgcmVtb3ZhbDsgd29uJ3QKPj4gdGhlcmUgYmUgYSBwb3NzaWJpbGl0eSBvZiBkb3VibGUtZnJl
ZT8gSSB0aGluayB0aGUgcmVsZWFzZSBjYWxsYmFjawo+PiBjb3VsZCBiZSBzaW1wbHkgZHJvcHBl
ZC4KPiAKPiBZb3UgYXJlIGNvcnJlY3QuwqAgQW5kIHVuZm9ydHVuYXRlbHkgSSBkaWRuJ3QgaW5j
bHVkZSB0aGUgZml4Cj4gZm9yIHRoaXMgaW4gdGhlIHBhdGNoZXMgSSBqdXN0IHBvc3RlZCwgYmVj
YXVzZSBzb21laG93IHRoaXMKPiBtZXNzYWdlIHdhcyBub3QgaW5jbHVkZWQgd2l0aCB0aGUgZ3Jv
dXAgaW4gbXkgbWFpbCBwcm9ncmFtLgo+IAo+IEknbSBnb2luZyB0byBzZW5kIHY4IGFmdGVyIEkg
Zml4IHRoaXMgYW5kIHZlcmlmeSBpdCBhZ2Fpbi4KClRvIGJlIGNsZWFyLCB0aGUgZml4IGlzIHRv
IHVzZSBremFsbG9jKCksIHJhdGhlciB0aGFuIGNhbGxpbmcKZGV2bV9remFsbG9jKCkgd2l0aCB0
aGUgcGFyZW50IGRldmljZSBhcyBmaXJzdCBhcmd1bWVudC4KCkknbGwgYWxzbyBpbmNsdWRlIDxs
aW51eC9zbGFiLmg+IHRvIGF2b2lkIHRoZSB3YXJuaW5nCnJlcG9ydGVkIGJ5IHRoZSBrZXJuZWwg
dGVzdCByb2JvdC4KCgkJCQkJLUFsZXgKCj4gCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC1BbGV4Cj4gCj4gCj4+IC4uLgo+Pgo+Pj4gK3N0YXRpYyBpbnQgc3BhY2Vt
aXRfY2N1X3Jlc2V0X3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmVnbWFwICpyZWdtYXAs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
Y2hhciAqcmVzZXRfbmFtZSkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBzcGFjZW1pdF9jY3Vf
YWRldiAqY2FkZXY7Cj4+PiArwqDCoMKgIHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Owo+
Pj4gK8KgwqDCoCBzdGF0aWMgdTMyIG5leHRfaWQ7Cj4+PiArwqDCoMKgIGludCByZXQ7Cj4+PiAr
Cj4+PiArwqDCoMKgIC8qIE5vdGhpbmcgdG8gZG8gaWYgdGhlIENDVSBkb2VzIG5vdCBpbXBsZW1l
bnQgYSByZXNldCAKPj4+IGNvbnRyb2xsZXIgKi8KPj4+ICvCoMKgwqAgaWYgKCFyZXNldF9uYW1l
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+Pj4gK8KgwqDCoCBjYWRldiA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqY2FkZXYpLCBHRlBfS0VSTkVMKTsKPj4KPj4gSGVy
ZSBzcGFjZW1pdF9jY3VfYWRldiBpcyBhbGxvY2F0ZWQuCj4+Cj4+PiArwqDCoMKgIGlmICghY2Fk
ZXYpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+PiArwqDCoMKgIGNhZGV2
LT5yZWdtYXAgPSByZWdtYXA7Cj4+PiArCj4+PiArwqDCoMKgIGFkZXYgPSAmY2FkZXYtPmFkZXY7
Cj4+PiArwqDCoMKgIGFkZXYtPm5hbWUgPSByZXNldF9uYW1lOwo+Pj4gK8KgwqDCoCBhZGV2LT5k
ZXYucGFyZW50ID0gZGV2Owo+Pj4gK8KgwqDCoCBhZGV2LT5kZXYucmVsZWFzZSA9IHNwYWNlbWl0
X2NhZGV2X3JlbGVhc2U7Cj4+PiArwqDCoMKgIGFkZXYtPmRldi5vZl9ub2RlID0gZGV2LT5vZl9u
b2RlOwo+Pj4gK8KgwqDCoCBhZGV2LT5pZCA9IG5leHRfaWQrKzsKPj4+ICsKPj4+ICvCoMKgwqAg
cmV0ID0gYXV4aWxpYXJ5X2RldmljZV9pbml0KGFkZXYpOwo+Pj4gK8KgwqDCoCBpZiAocmV0KQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IGF1
eGlsaWFyeV9kZXZpY2VfYWRkKGFkZXYpOwo+Pj4gK8KgwqDCoCBpZiAocmV0KSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgYXV4aWxpYXJ5X2RldmljZV91bmluaXQoYWRldik7Cj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4g
ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgc3BhY2VtaXRfYWRldl91bnJlZ2lzdGVyLCAK
Pj4+IGFkZXYpOwo+Pj4gK30KPj4+ICsKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBIYXlsZW4gQ2h1
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
