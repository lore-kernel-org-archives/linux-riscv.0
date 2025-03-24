Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB2C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RSaFOAAT0RzLNll1RsuHrVeYJbrhNA5iUCltLi0E9M=; b=h31RTGAONJFVJT
	3TvDjhQvMlIWs0PXfxt50mTFGsiIGUN8Kd1Y9q+3e9r6AkSf21FITgbLx5Lw4AOQXa6C9gXh/KWN9
	9u6qoueRiT9TtBKVvH5ekJeAsHhABNhbBVVk3Xqt5c31/Wae6EFqYoNsdTreFbp5Uqdgy/nRQnsRB
	hNmGvS/BO9EZ1cKScdcQUPJRpMztFE8eyCNGuwxN8Y9ZWUovtQNVgFVMpPNHbDFIy6K/rf5py+C/A
	RL3sQ3/Hoyyk1WOARKs1O2CmjJOD+l/49uMyEOqYfjsJAFaMtMX6KQUMbbJxv8/TYntrd95QTQjvt
	Z8QmyRPeud4ZQ5mAmbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twd0m-00000002YYr-2bTr;
	Mon, 24 Mar 2025 08:18:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twd0k-00000002YYQ-1aqV
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:18:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so24119375e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742804296; x=1743409096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zNYy4BfOEaeniqsuFf8sjHcFv5+D+gjfplz2a0K2Xo=;
        b=mA8045WvtT0MtVrH+LA9ysbHa3Zba7wOVbV27yyJKtrEgC2D4RTWAhXocLkeDVKiQg
         ux++G3tuFwOBCioLXpwcIqKg3IrfVGFWgS0d4s3pmbqPCBqcT7sLlzM6CJc3arNdZuJ2
         jIAvRm95jblJwHkqCEhnLdMvmXaPqjioiNBqqZMmMzV3VlhcqJexi7Zc5BpxFN40TGUP
         JEgsgYBCeeztEhhoGyQXpnK41KfV9SW/+P73i/zErrEtzjvV+cG6cqXsyWVdP/f6Eo3N
         KS4zYOFRdHWF9W8wwu0dfQ8mIQSEwEQVUktZloFS+EHxk5JhX7R/7v46fC6gzHdeEHp0
         Yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804296; x=1743409096;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zNYy4BfOEaeniqsuFf8sjHcFv5+D+gjfplz2a0K2Xo=;
        b=qkCMBDu1nZkOpiBVLXkH1G/8uQCS9CsFVv8xSMCIv+op8rbCfskn6uqknluzWOgvhs
         eNB+/eu0ubITRhpEyNjx8sEz7kc7ErCkQwDdZtuMQPXrm73jchD0lEMf2UV7XJ3iIrnT
         KuwguxWS49mZKOO2wLNOMQCi7YA+ZCgfrtjqLwJYfs2rNBKb552ZAL57Fv3gx3AwLNUc
         1dIDJg1znX7MOGoGcATfM9ajO3ecc8w92WgWXR2GrkmNGlOZKOEN1sR2DmDQLPZod0G1
         go6gVCwThxCnuns1Y1u2dzmMD9y1M8bcCTbB5XoJC88ZCFyi1mpuioJx18XLlW9vi/Sw
         xCGw==
X-Forwarded-Encrypted: i=1; AJvYcCX4f4HoGWzIzhMHOUlVHTw8fhHXsofyGv/AMIbfU1rVbcvx6/lTGN880WuK3QbmiZ2ghtVLrv/ua+vZeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGM4T2Qx3tX996AI2cBZKGaiBPSjpfY81pJAxPSYpghzDHFues
	j0QZU69D2gjjXwT8O2vqNbc3ftClkarzh7PHz7iSo+fSJWOMaOdPFEllPHRt3T8=
X-Gm-Gg: ASbGnctAvLqQ8wbl582e/88hz498Boo006N3WrwkRufknQGwoHSniJNBfHsGqLRwY3t
	xMg2n5aZ+7pfCFsSzP4rcdR23i8jhbZPjHRn4hm2te9VSeuj0sX7ONPSBscLZYQR+Valfv/6qvZ
	l6DsylceeJwN3teJtDS+jKLgukNGjnF5NNjbQAUpRac1aE/jo3vWYzjeWEghvzYSnSooFcltM3s
	ymSZvFpjzwPssjE4Nr6SUAvk7JIK9keY+FUrd7NDpt6LITajUHHRkRN3JYH2zPoR2P+3DLE2ICr
	l2qQcC8nRw36vglLjUo91MpPr6rqU4GMAqD6okYaxK1ZxF4xfWaIvTdMa+urbKA=
X-Google-Smtp-Source: AGHT+IFQLedEpN/T/xP3t+SfyD2x7HKS8CDYDWPPHjI3S1V/tjpZzq1XfrShknc2cO3vCzsS/UQ4Tw==
X-Received: by 2002:a5d:588c:0:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3997f8fa023mr11538944f8f.16.1742804295901;
        Mon, 24 Mar 2025 01:18:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f2asm10300753f8f.30.2025.03.24.01.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:18:14 -0700 (PDT)
Message-ID: <ea5de004-a26c-43a1-9408-0089fa18b44d@tuxon.dev>
Date: Mon, 24 Mar 2025 10:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem"
 compatible
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
 <20250321-macb-v1-10-537b7e37971d@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250321-macb-v1-10-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_011818_530283_ABE9FCE1 
X-CRM114-Status: GOOD (  23.09  )
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

SGksIFRoZW8sCgpPbiAyMS4wMy4yMDI1IDIxOjA5LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4gQWRk
IHN1cHBvcnQgZm9yIHRoZSB0d28gR0VNIGluc3RhbmNlcyBpbnNpZGUgTW9iaWxleWUgRXllUTUg
U29DcywgdXNpbmcKPiBjb21wYXRpYmxlICJtb2JpbGV5ZSxleWVxNS1nZW0iLiBXaXRoIGl0LCBh
ZGQgYSBjdXN0b20gaW5pdCBzZXF1ZW5jZQo+IHRoYXQgYWNjZXNzZXMgdHdvIHN5c3RlbS1jb250
cm9sbGVyIHJlZ2lzdGVycy4KPiAKPiBOb3Rld29ydGh5OiBORVRfSVBfQUxJR049MiBvbiBNSVBT
IGJ1dCB0aGUgaGFyZHdhcmUgZG9lcyBub3QgYWxpZ24gYW5kCj4gbG93IGJpdHMgYXJlbid0IGNv
bmZpZ3VyYWJsZSwgc28gd2UgY2Fubm90IHJlc3BlY3QgdGhlIHJlcXVlc3RlZCBJUAo+IGhlYWRl
ciBhbGlnbm1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1
bkBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNi
X21haW4uYyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2JfbWFpbi5jCj4gaW5kZXggNzkxNjFkNTU5MTY2NDc4Zjg1YTZmODI5NGQ0ODhlZDk2MWQ5
YmU3Zi4uOWYyYTViZjlhNWViY2E1OTQxMjI5YmQ5NjA5MWEwZmI5NmYwNjA3ZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IEBAIC0yMiw2ICsyMiw3IEBA
Cj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lwLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
cGFyYW0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L25ldGRldmljZS5oPgo+IEBAIC0zNCw2ICszNSw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3B0cF9jbGFzc2lmeS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+ICAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8bGludXgvdGNwLmg+Cj4gQEAgLTQ5
NjcsNiArNDk2OSw4NiBAQCBzdGF0aWMgaW50IGluaXRfcmVzZXRfb3B0aW9uYWwoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gKyNkZWZpbmUg
RVlFUTVfT0xCX0dQX1RYX1NXUlNUX0RJUwlCSVQoMCkJCS8vIFR4IFNXIHJlc2V0Cj4gKyNkZWZp
bmUgRVlFUTVfT0xCX0dQX1RYX01fQ0xLRQkJQklUKDEpCQkvLyBUeCBNIGNsb2NrIGVuYWJsZQo+
ICsjZGVmaW5lIEVZRVE1X09MQl9HUF9TWVNfU1dSU1RfRElTCUJJVCgyKQkJLy8gU3lzIFNXIHJl
c2V0Cj4gKyNkZWZpbmUgRVlFUTVfT0xCX0dQX1NZU19NX0NMS0UJCUJJVCgzKQkJLy8gU3lzIGNs
b2NrIGVuYWJsZQo+ICsjZGVmaW5lIEVZRVE1X09MQl9HUF9TR01JSV9NT0RFCQlCSVQoNCkJCS8v
IFNHTUlJIG1vZGUKPiArI2RlZmluZSBFWUVRNV9PTEJfR1BfUkdNSUlfRFJWCQlHRU5NQVNLKDgs
IDUpCS8vIFJHTUlJIG1vZGUKPiArI2RlZmluZSBFWUVRNV9PTEJfR1BfU01BX0RSVgkJR0VOTUFT
SygxMiwgOSkKCkRlZmluZXMgc3RhcnRpbmcgaGVyZToKCj4gKyNkZWZpbmUgRVlFUTVfT0xCX0dQ
X1JHTUlJX1BECQlCSVQoMTMpCQkvLyBSR01JSSBwdWxsLWRvd24KPiArI2RlZmluZSBFWUVRNV9P
TEJfR1BfTURJT19QVQkJQklUKDE0KQkJLy8gUkdNSUkgcHVsbC11cAo+ICsjZGVmaW5lIEVZRVE1
X09MQl9HUF9SR01JSV9SWF9TVAlCSVQoMTUpCQkvLyBTY2htaXR0IHRyaWdnZXIgb24gUkdNSUkg
UngKPiArI2RlZmluZSBFWUVRNV9PTEJfR1BfUkdNSUlfVFhfU1QJQklUKDE2KQkJLy8gU2NobWl0
dCB0cmlnZ2VyIG9uIFJHTUlJIFR4Cj4gKyNkZWZpbmUgRVlFUTVfT0xCX0dQX01ESU9fU1QJCUJJ
VCgxNykKPiArI2RlZmluZSBFWUVRNV9PTEJfR1BfTURDX1NUCQlCSVQoMTgpCj4gKyNkZWZpbmUg
RVlFUTVfT0xCX0dQX01CSVNUX0VOQUJMRQlCSVQoMTkpCgplbmRpbmcgaGVyZSBhcmUgdW51c2Vk
LgoKPiArCj4gKyNkZWZpbmUgRVlFUTVfT0xCX1NHTUlJX1BXUl9FTgkJQklUKDApCj4gKyNkZWZp
bmUgRVlFUTVfT0xCX1NHTUlJX1JTVF9ESVMJCUJJVCgxKQo+ICsjZGVmaW5lIEVZRVE1X09MQl9T
R01JSV9QTExfRU4JCUJJVCgyKQo+ICsjZGVmaW5lIEVZRVE1X09MQl9TR01JSV9TSUdfREVUX1NX
CUJJVCgzKQo+ICsjZGVmaW5lIEVZRVE1X09MQl9TR01JSV9QV1JfU1RBVEVfTUFTSwlHRU5NQVNL
KDgsIDQpCgpVbnVzZWQKCgo+ICsjZGVmaW5lIEVZRVE1X09MQl9TR01JSV9QV1JfU1RBVEUJQklU
KDQpCj4gKyNkZWZpbmUgRVlFUTVfT0xCX1NHTUlJX1RYX0VMRUNUX0lETEUJQklUKDkpCQkvLyBU
eCBlbGVjdCBpZGxlCgpVbnVzZWQKCj4gKyNkZWZpbmUgRVlFUTVfT0xCX1NHTUlJX1BPV0VSX0FD
SwlCSVQoMTYpCgpVbnVzZWQKCj4gKyNkZWZpbmUgRVlFUTVfT0xCX1NHTUlJX1BMTF9BQ0sJCUJJ
VCgxOCkKPiArI2RlZmluZSBFWUVRNV9PTEJfU0dNSUlfU0lHX0RFVAkJQklUKDE5KQo+ICsjZGVm
aW5lIEVZRVE1X09MQl9TR01JSV9QV1JfU1RBVEVfQUNLCUdFTk1BU0soMjQsIDIwKQoKVW51c2Vk
LgoKPiArCj4gK3N0YXRpYyBpbnQgZXllcTVfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsJc3RydWN0
IG5ldF9kZXZpY2UgKm5ldGRldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsJc3Ry
dWN0IG1hY2IgKmJwID0gbmV0ZGV2X3ByaXYobmV0ZGV2KTsKPiArCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAgPSBkZXYtPm9mX25vZGU7Cj4gKwl1bnNpZ25lZCBpbnQgZ3AsIHNnbWlpOwo+ICsJc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOwo+ICsJdW5zaWduZWQgaW50IGFyZ3NbMl07Cj4gKwl1bnNpZ25l
ZCBpbnQgcmVnOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xv
b2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsICJtb2JpbGV5ZSxvbGIiLCAyLCBhcmdzKTsKPiArCWlm
IChJU19FUlIocmVnbWFwKSkKPiArCQlyZXR1cm4gUFRSX0VSUihyZWdtYXApOwo+ICsKPiArCWdw
ID0gYXJnc1swXTsKPiArCXNnbWlpID0gYXJnc1sxXTsKPiArCj4gKwkvKiBGb3JjZWQgcmVzZXQg
Ki8KPiArCXJlZ21hcF93cml0ZShyZWdtYXAsIGdwLCAwKTsKPiArCXJlZ21hcF93cml0ZShyZWdt
YXAsIHNnbWlpLCAwKTsKPiArCXVzbGVlcF9yYW5nZSg1LCAyMCk7Cj4gKwo+ICsJaWYgKGJwLT5w
aHlfaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSSkgewo+ICsJCXJlZ21hcF93
cml0ZShyZWdtYXAsIGdwLCBFWUVRNV9PTEJfR1BfU0dNSUlfTU9ERSk7Cj4gKwo+ICsJCXJlZyA9
IEVZRVE1X09MQl9TR01JSV9QV1JfRU4gfCBFWUVRNV9PTEJfU0dNSUlfUlNUX0RJUyB8Cj4gKwkJ
ICAgICAgRVlFUTVfT0xCX1NHTUlJX1BMTF9FTjsKPiArCQlyZWdtYXBfd3JpdGUocmVnbWFwLCBz
Z21paSwgcmVnKTsKPiArCj4gKwkJcmV0ID0gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KHJlZ21h
cCwgc2dtaWksIHJlZywKPiArCQkJCQkgICAgICAgcmVnICYgRVlFUTVfT0xCX1NHTUlJX1BMTF9B
Q0ssCj4gKwkJCQkJICAgICAgIDEsIDEwMCk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsICJQTEwgdGltZW91dCIpOwo+ICsKPiArCQlyZWdtYXBfcmVh
ZChyZWdtYXAsIHNnbWlpLCAmcmVnKTsKPiArCQlyZWcgfD0gRVlFUTVfT0xCX1NHTUlJX1BXUl9T
VEFURSB8IEVZRVE1X09MQl9TR01JSV9TSUdfREVUX1NXOwo+ICsJCXJlZ21hcF93cml0ZShyZWdt
YXAsIHNnbWlpLCByZWcpOwoKWW91IGNhbiB1c2UgcmVnbWFwX3VwZGF0ZV9iaXRzKCkgaGVyZS4K
Cj4gKwl9Cj4gKwo+ICsJcmVnbWFwX3JlYWQocmVnbWFwLCBncCwgJnJlZyk7Cj4gKwlyZWcgJj0g
fkVZRVE1X09MQl9HUF9SR01JSV9EUlY7Cj4gKwlpZiAocGh5X2ludGVyZmFjZV9tb2RlX2lzX3Jn
bWlpKGJwLT5waHlfaW50ZXJmYWNlKSkKPiArCQlyZWcgfD0gRklFTERfUFJFUChFWUVRNV9PTEJf
R1BfUkdNSUlfRFJWLCAweDkpOwo+ICsJcmVnIHw9IEVZRVE1X09MQl9HUF9UWF9TV1JTVF9ESVMg
fCBFWUVRNV9PTEJfR1BfVFhfTV9DTEtFOwo+ICsJcmVnIHw9IEVZRVE1X09MQl9HUF9TWVNfU1dS
U1RfRElTIHwgRVlFUTVfT0xCX0dQX1NZU19NX0NMS0U7Cj4gKwlyZWdtYXBfd3JpdGUocmVnbWFw
LCBncCwgcmVnKTsKClRvIG1lIGl0IGxvb2tzIGxpa2UgdGhpcyBjb2RlIGNvdWxkIGJlIGFic3Ry
YWN0ZWQgYXMgYSBwaHkgZHJpdmVyLiBFLmcuLApjaGVjayB0aGUgaW5pdF9yZXNldF9vcHRpb25h
bCgpIGFuZCBpdHMgdXNhZ2Ugb24gImNkbnMsenlucW1wLWdlbSIgKHBoeQpkcml2ZXIgaGVyZTog
ZHJpdmVycy9waHkveGlsaW54L3BoeS16eW5xbXAuYykuCgoKPiArCj4gKwlyZXR1cm4gbWFjYl9p
bml0KHBkZXYpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1hY2JfdXNyaW9fY29u
ZmlnIHNhbWE3ZzVfdXNyaW8gPSB7Cj4gIAkubWlpID0gMCwKPiAgCS5ybWlpID0gMSwKPiBAQCAt
NTEzNSw2ICs1MjE3LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWFjYl9jb25maWcgdmVyc2Fs
X2NvbmZpZyA9IHsKPiAgCS51c3JpbyA9ICZtYWNiX2RlZmF1bHRfdXNyaW8sCj4gIH07Cj4gIAo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1hY2JfY29uZmlnIGV5ZXE1X2NvbmZpZyA9IHsKPiArCS5j
YXBzID0gTUFDQl9DQVBTX0dJR0FCSVRfTU9ERV9BVkFJTEFCTEUgfCBNQUNCX0NBUFNfSlVNQk8g
fAo+ICsJCU1BQ0JfQ0FQU19HRU1fSEFTX1BUUCB8IE1BQ0JfQ0FQU19RVUVVRV9ESVNBQkxFIHwK
PiArCQlNQUNCX0NBUFNfTk9fTFNPLAo+ICsJLmh3X2lwX2FsaWduID0gMCwKPiArCS5kbWFfYnVy
c3RfbGVuZ3RoID0gMTYsCj4gKwkuY2xrX2luaXQgPSBtYWNiX2Nsa19pbml0LAo+ICsJLmluaXQg
PSBleWVxNV9pbml0LAo+ICsJLmp1bWJvX21heF9sZW4gPSAxMDI0MCwKPiArCS51c3JpbyA9ICZt
YWNiX2RlZmF1bHRfdXNyaW8sCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtYWNiX2R0X2lkc1tdID0gewo+ICAJeyAuY29tcGF0aWJsZSA9ICJjZG5zLGF0OTFz
YW05MjYwLW1hY2IiLCAuZGF0YSA9ICZhdDkxc2FtOTI2MF9jb25maWcgfSwKPiAgCXsgLmNvbXBh
dGlibGUgPSAiY2RucyxtYWNiIiB9LAo+IEBAIC01MTUyLDYgKzUyNDYsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBtYWNiX2R0X2lkc1tdID0gewo+ICAJeyAuY29tcGF0aWJs
ZSA9ICJjZG5zLHp5bnFtcC1nZW0iLCAuZGF0YSA9ICZ6eW5xbXBfY29uZmlnfSwgLyogZGVwcmVj
YXRlZCAqLwo+ICAJeyAuY29tcGF0aWJsZSA9ICJjZG5zLHp5bnEtZ2VtIiwgLmRhdGEgPSAmenlu
cV9jb25maWcgfSwgLyogZGVwcmVjYXRlZCAqLwo+ICAJeyAuY29tcGF0aWJsZSA9ICJzaWZpdmUs
ZnU1NDAtYzAwMC1nZW0iLCAuZGF0YSA9ICZmdTU0MF9jMDAwX2NvbmZpZyB9LAo+ICsJeyAuY29t
cGF0aWJsZSA9ICJtb2JpbGV5ZSxleWVxNS1nZW0iLCAuZGF0YSA9ICZleWVxNV9jb25maWcgfSwK
Ck1heWJlIG1vdmUgaXQgYWZ0ZXIgbWljcm9jaGlwIHRvIGhhdmUgaXQgYSBiaXQgc29ydGVkLgoK
VGhhbmsgeW91LApDbGF1ZGl1Cgo+ICAJeyAuY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsbXBmcy1t
YWNiIiwgLmRhdGEgPSAmbXBmc19jb25maWcgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAibWljcm9j
aGlwLHNhbWE3ZzUtZ2VtIiwgLmRhdGEgPSAmc2FtYTdnNV9nZW1fY29uZmlnIH0sCj4gIAl7IC5j
b21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW1hN2c1LWVtYWMiLCAuZGF0YSA9ICZzYW1hN2c1X2Vt
YWNfY29uZmlnIH0sCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
