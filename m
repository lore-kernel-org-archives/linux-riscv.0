Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F87C36008
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfvUcl8GxoGduT+dXv8wCEJf4tchQJayjtMaCn977IM=; b=B1GuAKVpEx6cAT
	/ha4otVqVRzWs6blgtbJ0oc8WdPnuYvnS/IO1H4LystIUbhzpVPXAfgzOJElkuksZ6S1T8aLIsg0l
	AUZYzHHitIjNp8KjxzMXm2/7P3uPNvuJNovwo6YVtfZs38ORdrllY+JtgPQVGxdWppmTzerwvU0xS
	EM8BVn7cOhlA50BJ7zmIAv6rSaQGx69Ai+iOEp6vtiLFfFn9wTdQDJLz5UaD2hrjgYL+7AvhUg+Cn
	hbA1MOpjkV3gZUQffLRILAa3Pi3iRdQp5oP4EB6g8jktKAwWA0EXC/995Aewb2dIJxYZT3byUTTPY
	+GdXK8UmBXAAxey6MMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twd1I-00000002Ygk-0rVs;
	Mon, 24 Mar 2025 08:18:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twd1F-00000002Yfn-0tU0
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:18:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43948021a45so32726095e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742804327; x=1743409127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUV72th4YLID8Yi5m5TOOfAU6k/l5ItTBGhCs4wlkd4=;
        b=l6s3iYviyoN6DsDvI82gT9Ly2hYhNVEk966GIrGyfc/2CjU9DXcbovFLNE3NHmvUfK
         nDEaKpBE3riqtMi5IBkCPMwiJLnnTEmjbPq4eoPs28LzAxejkCnfuhVq8quXNfGmw8kQ
         VMsHVxzhWCQVyPRBPFSBevXbiqVK++XVOaoOHWmk2bVETu+2isHtru2mnbkuTvYoQ8nZ
         mHiN2MfupEtNX0wt1LcO+O6BCAJrKYde7RdLt1m2GtRiX8HJ2pzGKsrVx7meL/wAcbsu
         9901deAOpmhjrP4iCq0vN8DPP8KXbloRP+97nrPpg+CrhVFJYaMmlA3sTESBhoIPZYCz
         a3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804327; x=1743409127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUV72th4YLID8Yi5m5TOOfAU6k/l5ItTBGhCs4wlkd4=;
        b=bsN622LyFsbws+MbRn/l37Fm0zU+BXtfj3O8fwcui4g89uZ+pgZgzicS6xbMXXTRqv
         +U5fkFt9UQqxUCPrLhVc4yZ2HkeGVCm2T/IiEQuOq75famJpgQ4rOifrBJZomFZsskR9
         24C36ADSam42b70stW/fFkvoAxfCIQg9R7ke6XONjV8ia0WKzAEaL6eHdulUGPP1cKBR
         PnnHxU5VoKAdL/hwFO1kfiQpK8h+J4A1tS1kDtTLFULTnSuZXLwrDE7LETpHvcfS3pp+
         FPP9Qi2cOJxQ7jJvtlxVMQRVl+v3H1UDXgh0N9xFvf9SAiKJR+goh/1/RBrNN5TyeHEH
         AG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOcE33mqHXPUAFpuT4oNpaho3gtstA3govtl1yoMX6rL3ah8uVcc1x4W6AxZDniHCoieThNSYb/vY0sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweyI0aDBT/NBTZBow9tu4flvDTPSWDGe2wAxwifX7iA756+DhG
	xczXf82UW3fwh4Udfa1TxSZ7LIVx1QpANqLYaYmaltHA2yf0CQ91r0FSDT9/Ze8=
X-Gm-Gg: ASbGnct8e+LeVd9vtZAZ0hWT4+iwg1Zp8Q2zC/0IgX+E3WUFqbSkBC+8GT2S6RUebso
	PXCb7niVWOZVEbVKBOuKvbqunh9ldmO+e3ChB/eyHJty8ONySt4F2xewEfDLTMciZ8GQdAPunuj
	uLNEkybRNURlVCJBf9KRdJowGsG/BV1QO7DEg3YVoI0vok2KTA9Dg6vA/oKfQR+ieWitoprUdis
	Gi31IkAZduUKBTpIB+mdD4OwBH/77S+4prczb94qUCbQCt7nwxST6PVudg6sprrCTuKvm4tLnfg
	ihsrGyXahQYZB4T8iQ0X/coMA/hbgznGDNw/YqARYpQQpGRQx9k5
X-Google-Smtp-Source: AGHT+IGsHxYn5Ee/W35yKht21ggLacnLCdw5GuAkDQDpS+0jTcweaq4u/g3gFV75Q5DOsSvSYrtVtQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-43d58db52e1mr44341605e9.21.1742804327367;
        Mon, 24 Mar 2025 01:18:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdab7asm163827855e9.29.2025.03.24.01.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:18:46 -0700 (PDT)
Message-ID: <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
Date: Mon, 24 Mar 2025 10:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-5-537b7e37971d@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250321-macb-v1-5-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_011849_250240_BD0B45DF 
X-CRM114-Status: GOOD (  16.32  )
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

SGksIFRoZW8sCgpPbiAyMS4wMy4yMDI1IDIxOjA5LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4gTFNP
IGlzIHJ1bnRpbWUtZGV0ZWN0ZWQgdXNpbmcgdGhlIFBCVUZfTFNPIGZpZWxkIGluc2lkZSByZWdp
c3Rlcgo+IGRlc2lnbmNmZ19kZWJ1ZzYvR0VNX0RDRkc2LiBBbGxvdyBkaXNhYmxpbmcgdGhhdCBm
ZWF0dXJlIGlmIGl0IGlzCj4gYnJva2VuIGJ5IHVzaW5nIHN0cnVjdCBtYWNiX2NvbmZpZy0+Y2Fw
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgIHwg
MSArCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCA1ICsrKy0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oCj4gaW5kZXggM2I0M2NiOTQ2OGUzNjE4NzU0
ZmYyYmM2YzVmMzYwNDQ3YmRlZWVkMC4uZTlkYTZlM2I4NjlmYzc3MjYxM2EwZDZiODYzMDg5MTdj
OWJmZjdmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Iu
aAo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oCj4gQEAgLTczOSw2
ICs3MzksNyBAQAo+ICAjZGVmaW5lIE1BQ0JfQ0FQU19NSUlPTlJHTUlJCQkJQklUKDkpCj4gICNk
ZWZpbmUgTUFDQl9DQVBTX05FRURfVFNVQ0xLCQkJQklUKDEwKQo+ICAjZGVmaW5lIE1BQ0JfQ0FQ
U19RVUVVRV9ESVNBQkxFCQkJQklUKDExKQo+ICsjZGVmaW5lIE1BQ0JfQ0FQU19OT19MU08JCQlC
SVQoMTIpCj4gICNkZWZpbmUgTUFDQl9DQVBTX1BDUwkJCQlCSVQoMjQpCj4gICNkZWZpbmUgTUFD
Ql9DQVBTX0hJR0hfU1BFRUQJCQlCSVQoMjUpCj4gICNkZWZpbmUgTUFDQl9DQVBTX0NMS19IV19D
SEcJCQlCSVQoMjYpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2Uv
bWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4g
aW5kZXggYjU3OTdjMWFjMGE0MWU5NDcyODgzYjAxM2MxZTQ0YTAxMDkyZjI1Ny4uODA3ZjdhYmJk
OTk0MWJmNjI0ZjE0YTVkZGVhZDY4ZGFkMWM4ZGViMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IEBAIC00MzczLDggKzQzNzMsOSBAQCBzdGF0aWMgaW50
IG1hY2JfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJLyogU2V0IGZlYXR1
cmVzICovCj4gIAlkZXYtPmh3X2ZlYXR1cmVzID0gTkVUSUZfRl9TRzsKPiAgCj4gLQkvKiBDaGVj
ayBMU08gY2FwYWJpbGl0eSAqLwo+IC0JaWYgKEdFTV9CRkVYVChQQlVGX0xTTywgZ2VtX3JlYWRs
KGJwLCBEQ0ZHNikpKQo+ICsJLyogQ2hlY2sgTFNPIGNhcGFiaWxpdHk7IGNhcGFiaWxpdHkgaXMg
Zm9yIGJ1Z2d5IEhXICovCgpUaGUgY29tbWVudCBoZXJlIGlzIGEgYml0IGNvbmZ1c2luZyB0byBt
ZS4KCj4gKwlpZiAoIShicC0+Y2FwcyAmIE1BQ0JfQ0FQU19OT19MU08pICYmCj4gKwkgICAgR0VN
X0JGRVhUKFBCVUZfTFNPLCBnZW1fcmVhZGwoYnAsIERDRkc2KSkpCj4gIAkJZGV2LT5od19mZWF0
dXJlcyB8PSBNQUNCX05FVElGX0xTTzsKPiAgCj4gIAkvKiBDaGVja3N1bSBvZmZsb2FkIGlzIG9u
bHkgYXZhaWxhYmxlIG9uIGdlbSB3aXRoIHBhY2tldCBidWZmZXIgKi8KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
