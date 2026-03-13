Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D00F107BCD0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcvY1Yo4MpApbvOWqXWYXqO+rslP9s17bSr0A5SxgmQ=; b=InZ+MHEOjMuqkw
	mq+XWJ000brk0BnpKpfawBP5zJvCHxqeWn2P78dkOZRvgbt7hnmhVXGnf66JYs+EEw0brsrHKNce1
	Tc4ZZIXtBU61TOyHcewws40Z+w+IZYVcojRe4oNNYgQiXOFJ4uI/wLuHNwQoY/1zH3L+srWsiPTZ+
	IdbxClMlMnFBGidRuJIHzbIb/GH8bKFFoaAQ617Xd+bCeYH3xPHW2F20ghjCdZ8ojgbQ6q4BAGl82
	DVT9ELkJdxX/inzsHCKTwBRuxOCoddfBJZlFfLK8E2pJzmudN4QXDr0BcIcmhbHmMpL5Udu8dOwIa
	9sU/gqcSuiwy7C4l8sTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1605-00000000jMN-45pi;
	Fri, 13 Mar 2026 17:08:38 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1601-00000000jLz-3yNw
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 17:08:35 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8cd858e860aso336342085a.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773421712; x=1774026512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2wUEHO95agDl9HgpTnHWh4fawNLMxRmnfJlPuyaoJY=;
        b=kBDE99u4ImHp6STa21Tasq2eWYVkkGEqTmUhDVZxs8lxrKtL25lLOs47budA0j8RW9
         DC2EjvkPsHD/o7Y0WslXuP+O2ZGxtE4At4Mk8fJ4Fs4dx8hb1C0n1AgWFtdB5xw1BvIC
         6n1h/MDFrID5A5OofDVbEkCWbgWn9+wi/+ltnMgOvYc3G4xOJU0JzC3RpnL5MzKnEczL
         sgPxnykNydR8KHo3BiFKEIc3nKRZ+YTYpRst8ZGUr2yTkC++U4+lLd5SVAfX3EFcRUgb
         MYVZAzqn5tRsCpTwgGTsDwz5oJu+Sb6u0QkwtALxQg24AfxG6PenbFRf1P7HjQKFJ04z
         +UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421712; x=1774026512;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2wUEHO95agDl9HgpTnHWh4fawNLMxRmnfJlPuyaoJY=;
        b=Va/ZX41kNzxsOYykYQXYDDfV15dcnXFF2ePBl+uPXnx+JPGg520FlDnVn5DKC71WMB
         zD/uS6fI9fTvgHLJhL3B7/IcFsiUEdBhOhU8SkGeGVo9E2xrTF3g2rwQoNFWFa07jADx
         cpHa3cTKi4X1kjNu4xc+Ybdj9qK29vzkdaYO7s43wZ9GRmit7EP+FjtE+tLyYQTu6qBD
         aD8Q1/E82Ucy/8K1KJ5Jotv87Eyzse29R7F5bGpdOnP2SFikGeL0mDg0+3JofpPBEcnf
         M5QmdnlXsoDvIollcMIqeKSrHkEYuZql8R4caZrvDMGSHZdFgX8liv6QebJx665anRah
         lOZg==
X-Forwarded-Encrypted: i=1; AJvYcCWORT0NCt5C12IwHyt/IK5Eqm9UjzXs8TyPNOlj7nF63lOMrTr8+e7Iv+I2YflNB6ZORY12wnljhYk2cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEiI8UDQCPkW7WQnB1PIJgtP46W28yK/mULZIZwBLkk3z3+HAA
	2xiW1VIXEL8sBa1+610I+u9m/eFCJs+ithrZ+/+8jK2K3xL4f8JddYi9Q5osUH2YG5k=
X-Gm-Gg: ATEYQzzdXpM9Hxnafu27M0OOsRHqChtyTTg85+eT1s3eH3vt77anv0OiYIoDkbHmQZt
	66VF7Rxo5ZU8XIIB5GEq5Nh+iTRovr6nnMqRaB9y2ExhTGaOXM0vdF92i+cuTc4ee85HI+gET+C
	NUxUaJqctx6/hcypJj/f0eDRssrdYc06gyzcwpjIgIIA2r6yIZdGJlvF9X2klD3no5znC7+Diyp
	serwMZyBU046aBDsA4YCcUu/QRg9KSfv43aJXRVvyUVKm/ckuOwtzqectUslcvtQvJbkFo2bSNV
	nPYj553TooOIUhU+TeXpHqpe9d0SycljPZXlhNpRovOPmiJ6qiUZrBedgkLHhTHJeq48b5RbFOA
	xJ7jBB+B8tX+FK6TEb63ZzDiCJzTlbLSyfYFDhLK1QWCfupfYohG9N7ltAoQIQ5QAD/AoWD2PG/
	OXW1v91eOQf2UoNtVbOOGyprcK+1jmYZLoMhWUNxBCP3gkWfgCxG2GMDLx11ZMhBYc0Hcwocl3E
	Z1M
X-Received: by 2002:a05:620a:1a19:b0:8cd:90d5:92c with SMTP id af79cd13be357-8cdb59fe41amr594805385a.12.1773421712407;
        Fri, 13 Mar 2026 10:08:32 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fda2c6sm583719685a.13.2026.03.13.10.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 10:08:31 -0700 (PDT)
Message-ID: <b3fa0aef-8efc-4c5a-8c9e-ee319b3cb0e2@baylibre.com>
Date: Fri, 13 Mar 2026 13:08:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Anand Moon <linux.amoon@gmail.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
 <f2eeddcb-712f-4a67-9687-e217f46f9ea8@baylibre.com>
 <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANAwSgSjsn46p13LokjYZBLdOrUBTFsmDNf80TG=nvkqHWNkfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_100834_008474_DB85A303 
X-CRM114-Status: GOOD (  23.99  )
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

Ck9uIDIwMjYtMDMtMTMgMTA6NDIsIEFuYW5kIE1vb24gd3JvdGU6Cj4gSGkgVHJldm9yLAo+Cj4g
T24gRnJpLCAxMyBNYXIgMjAyNiBhdCAxOToyNiwgVHJldm9yIEdhbWJsaW48dGdhbWJsaW5AYmF5
bGlicmUuY29tPiB3cm90ZToKPj4gT24gMjAyNi0wMy0wOSAwNzo0MCwgSWtlciBQZWRyb3NhIHdy
b3RlOgo+Pj4gQWRkIGNvbXBsZXRlIFNEIGNhcmQgY29udHJvbGxlciBzdXBwb3J0IHdpdGggVUhT
IGhpZ2gtc3BlZWQgbW9kZXMuCj4+Pgo+Pj4gLSBFbmFibGUgc2RoY2kwIGNvbnRyb2xsZXIgd2l0
aCA0LWJpdCBidXMgd2lkdGgKPj4+IC0gQ29uZmlndXJlIGNhcmQgZGV0ZWN0IEdQSU8gd2l0aCBp
bnZlcnNpb24KPj4+IC0gQ29ubmVjdCB2bW1jLXN1cHBseSB0byBidWNrNCBmb3IgMy4zViBjYXJk
IHBvd2VyCj4+PiAtIENvbm5lY3QgdnFtbWMtc3VwcGx5IHRvIGFsZG8xIGZvciAxLjhWLzMuM1Yg
SS9PIHN3aXRjaGluZwo+Pj4gLSBBZGQgZHVhbCBwaW5jdHJsIHN0YXRlcyBmb3Igdm9sdGFnZS1k
ZXBlbmRlbnQgcGluIGNvbmZpZ3VyYXRpb24KPj4+IC0gU3VwcG9ydCBVSFMtSSBTRFIyNSwgU0RS
NTAsIGFuZCBTRFIxMDQgbW9kZXMKPj4+Cj4+PiBUaGlzIGVuYWJsZXMgZnVsbCBTRCBjYXJkIGZ1
bmN0aW9uYWxpdHkgaW5jbHVkaW5nIGhpZ2gtc3BlZWQgVUhTIG1vZGVzCj4+PiBmb3IgaW1wcm92
ZWQgcGVyZm9ybWFuY2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSWtlciBQZWRyb3NhPGlrZXJw
ZWRyb3NhbUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwo+Pj4gaW5kZXggNDE0YjAz
ZjVlNjQ4MGYwNWY1ZDdlZWFhYTBhZmI0ZTg2NDI1YWUzNi4uMzYxMTM1MjY5ODAxZjQzNjcwM2I2
ZjFkNzY4YzkxMzI1YTUyZjA3ZiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4+PiBAQCAtMTQwLDMgKzE0MCwyMiBAQCBz
ZF92cW1tYzogYWxkbzEgewo+Pj4gICAgICAgICAgICAgICAgfTsKPj4+ICAgICAgICB9Owo+Pj4g
ICAgfTsKPj4+ICsKPj4+ICsmc2RoY2kwIHsKPj4+ICsgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCIsICJzdGF0ZV91aHMiOwo+Pj4gKyAgICAgcGluY3RybC0wID0gPCZtbWMxX2NmZz47Cj4+
PiArICAgICBwaW5jdHJsLTEgPSA8Jm1tYzFfdWhzX2NmZz47Cj4+PiArICAgICBidXMtd2lkdGgg
PSA8ND47Cj4+PiArICAgICBjZC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDgwKSBHUElPX0FDVElW
RV9ISUdIPjsKPj4+ICsgICAgIGNkLWludmVydGVkOwo+Pj4gKyAgICAgbm8tbW1jOwo+Pj4gKyAg
ICAgbm8tc2RpbzsKPj4+ICsgICAgIGRpc2FibGUtd3A7Cj4+PiArICAgICBjYXAtc2QtaGlnaHNw
ZWVkOwo+Pj4gKyAgICAgdm1tYy1zdXBwbHkgPSA8JnNkX3ZtbWM+Owo+Pj4gKyAgICAgdnFtbWMt
c3VwcGx5ID0gPCZzZF92cW1tYz47Cj4+PiArICAgICBzZC11aHMtc2RyMjU7Cj4+PiArICAgICBz
ZC11aHMtc2RyNTA7Cj4+PiArICAgICBzZC11aHMtc2RyMTA0Owo+Pj4gKyAgICAgc3RhdHVzID0g
Im9rYXkiOwo+Pj4gK307Cj4+Pgo+PiBIZWxsbyBhZ2FpbiwKPj4KPj4gVGhhbmtzIGZvciBkb2lu
ZyB0aGlzIHdvcmsuIE15IGNvbGxlYWd1ZXMgYW5kIEkgaGF2ZSBiZWVuIHRlc3RpbmcgdGhpcwo+
PiBvbiBhbiBPcmFuZ2VQaSBSVjIsIGFuZCBhbHNvIGEgTXVzZSBQaSBQcm8gYm9hcmQgKG1ha2lu
ZyBhIHNpbWlsYXIgdHdlYWsKPj4gdG8gdGhpcyBwYXRjaCBpbiBrMS1tdXNlcGktcHJvLmR0cyku
IFRvIGRvIHRoZSB0ZXN0aW5nIG9uIG15IGVuZCwgSSdtCj4+IGFwcGx5aW5nIHRoZSBwYXRjaCBz
ZXJpZXMgb24gdG9wIG9mIDYuMTkgaW4gYSBZb2N0byBCU1AuCj4+Cj4+IEkndmUgYmVlbiBmaW5k
aW5nIHRoYXQgSSBzZWUgaXNzdWVzIHdpdGggdGhlIFVIUyBzdXBwb3J0IG9uIG15IHNpZGUKPj4g
KHRoaXMgbG9nIGNvbWVzIGZyb20gYW4gaW1hZ2UgYnVpbHQgYW5kIGZsYXNoZWQgdG8gYW4gU0Qg
Y2FyZCk6Cj4+Cj4+Cj4+IFsgMS4wNzI0MTddIHNkaGNpLXNwYWNlbWl0IGQ0MjgwMDAwLm1tYzog
R290IENEIEdQSU8KPj4gWyAxLjEwOTc0MV0gbW1jMDogU0RIQ0kgY29udHJvbGxlciBvbiBkNDI4
MDAwMC5tbWMgW2Q0MjgwMDAwLm1tY10gdXNpbmcKPj4gQURNQQo+PiBbIDEuMTE0NTg5XSBjbGs6
IERpc2FibGluZyB1bnVzZWQgY2xvY2tzCj4+IFsgMS4xMTg0MjFdIFBNOiBnZW5wZDogRGlzYWJs
aW5nIHVudXNlZCBwb3dlciBkb21haW5zCj4+IFsgMS4xMjMyNDldIEFMU0EgZGV2aWNlIGxpc3Q6
Cj4+IFsgMS4xMjZbIDEuMTI5OTQ5XSBjaGVjayBhY2Nlc3MgZm9yIHJkaW5pdD0vaW5pdCBmYWls
ZWQ6IC0yLCBpZ25vcmluZwo+PiBbIDEuMTMzMjg0XSBXYWl0aW5nIGZvciByb290IGRldmljZQo+
PiBQQVJUVVVJRD1lOTRiZmRkNy1hMzZmLTQzMTUtYTQ4MC00NzZlMmExMjQwM2QuLi4KPj4gWyAx
LjE3NjU2OV0gbW1jMDogbmV3IFVIUy1JIHNwZWVkIEREUjUwIFNESEMgY2FyZCBhdCBhZGRyZXNz
IGFhYWEKPj4gWyAxLjE4MDczMl0gbW1jYmxrMDogbW1jMDphYWFhIFNTMTZHIDE0LjggR2lCCj4+
IFsgMS4yNzYyNjhdIG1tY2JsazA6IHJlY292ZXJ5IGZhaWxlZCEKPj4gWyAxLjI3NzM1MV0gSS9P
IGVycm9yLCBkZXYgbW1jYmxrMCwgc2VjdG9yIDAgb3AgMHgwOihSRUFEKSBmbGFncwo+PiAweDgw
MDAwMCBwaHlzX3NlZyAxIHByaW8gY2xhc3MgMgo+PiBbIDEuMjg2MzQ2XSBCdWZmZXIgSS9PIGVy
cm9yIG9uIGRldiBtbWNibGswLCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIHBhZ2UKPj4gcmVhZAo+
PiBbIDEuMjkzODkxXSBtbWNibGswOiByZWNvdmVyeSBmYWlsZWQhCj4+IFsgMS4yOTcyODldIEkv
TyBlcnJvciwgZGV2IG1tY2JsazAsIHNlY3RvciAwIG9wIDB4MDooUkVBRCkgZmxhZ3MKPj4gMHg4
MDAwMDAgcGh5c19zZWcgMSBwcmlvIGNsYXNzIDIKPj4gWyAxLjMwNjI2OV0gQnVmZmVyIEkvTyBl
cnJvciBvbiBkZXYgbW1jYmxrMCwgbG9naWNhbCBibG9jayAwLCBhc3luYyBwYWdlCj4+IHJlYWQK
Pj4gWyAxLjMxMzUyMl0gbW1jYmxrMDogdW5hYmxlIHRvIHJlYWQgcGFydGl0aW9uIHRhYmxlCj4+
Cj4+Cj4+IEF0IGZpcnN0IEkgd29uZGVyZWQgaWYgbWF5YmUgdGhlcmUgd2FzIGFuIGlzc3VlIHdp
dGggdGhlIGNhcmQgaXRzZWxmLAo+PiBidXQgYnkgY2hhbmdpbmcgdGhlIHNkaGNpMCBzZWN0aW9u
IHRvIHRoaXMsIEknbSBhYmxlIHRvIHJlYWQgdGhlIFNEIGp1c3QKPj4gZmluZToKPj4KPiBJIHVz
ZWQgdGhlIHNhbWUgZXhhbXBsZSBvbiB0aGUgSzEtT3JhbmdlUGktUlYyIERUUywKPiBCdXQgaXTi
gJlzIHNsaWdodGx5IGRpZmZlcmVudCBmcm9tIHRoZSBvbmUgeW914oCZcmUgd29ya2luZyB3aXRo
Lgo+IEkgdGVzdGVkIG9uIHRoZSBsYXRlc3QgIDcuMC1yYzMuCj4KPj4gJnNkaGNpMCB7Cj4+ICAg
ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gICAgICAgICAgICBwaW5jdHJs
LTAgPSA8Jm1tYzFfY2ZnPjsKPj4gICAgICAgICAgICBidXMtd2lkdGggPSA8ND47Cj4+ICAgICAg
ICAgICAgY2QtZ3Bpb3MgPSA8JmdwaW8gSzFfR1BJTyg4MCkgR1BJT19BQ1RJVkVfSElHSD47Cj4+
ICAgICAgICAgICAgY2QtaW52ZXJ0ZWQ7Cj4+ICAgICAgICAgICAgbm8tbW1jOwo+PiAgICAgICAg
ICAgIG5vLXNkaW87Cj4+ICAgICAgICAgICAgZGlzYWJsZS13cDsKPj4gICAgICAgICAgICB2bW1j
LXN1cHBseSA9IDwmc2Rfdm1tYz47Cj4+ICAgICAgICAgICAgdnFtbWMtc3VwcGx5ID0gPCZzZF92
cW1tYz47Cj4+ICAgICAgICAgICAgbm8tMS04LXY7Cj4+ICAgICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOwo+PiB9Owo+Pgo+ICsKPiArJnNkaGNpMCB7Cj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiLCAic3RhdGVfdWhzIjsKPiArICAgICAgIHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+
Owo+ICsgICAgICAgcGluY3RybC0xID0gPCZtbWMxX3Voc19jZmc+Owo+ICsgICAgICAgYnVzLXdp
ZHRoID0gPDQ+Owo+ICsgICAgICAgY2QtZ3Bpb3MgPSA8JmdwaW8gSzFfR1BJTyg4MCkgR1BJT19B
Q1RJVkVfSElHSD47Cj4gKyAgICAgICBjZC1pbnZlcnRlZDsKPiArICAgICAgIG5vLW1tYzsKPiAr
ICAgICAgIG5vLXNkaW87Cj4gKyAgICAgICBkaXNhYmxlLXdwOwo+ICsgICAgICAgY2FwLXNkLWhp
Z2hzcGVlZDsKPiArICAgICAgIHZtbWMtc3VwcGx5ID0gPCZzZF92bW1jPjsKPiArICAgICAgIHZx
bW1jLXN1cHBseSA9IDwmc2RfdnFtbWM+Owo+ICsgICAgICAgc2QtdWhzLXNkcjI1Owo+ICsgICAg
ICAgc2QtdWhzLXNkcjUwOwo+ICsgICAgICAgc2QtdWhzLXNkcjEwNDsKPiArICAgICAgIHN0YXR1
cyA9ICJva2F5IjsKPiArfTsKPgo+IFRoYW5rcwo+IC1BbmFuZApZZXMsIG15IG1pc3Rha2UgLSB3
aXRoIDcuMC1yYzMgaXQgd29ya3MgZm9yIG1lOgoKW8KgIMKgIDEuMDcxNzY3XSBzZGhjaS1zcGFj
ZW1pdCBkNDI4MDAwMC5tbWM6IEdvdCBDRCBHUElPClvCoCDCoCAxLjExMDM2OF0gbW1jMDogU0RI
Q0kgY29udHJvbGxlciBvbiBkNDI4MDAwMC5tbWMgW2Q0MjgwMDAwLm1tY10gdXNpbmcgQURNQQpb
wqAgwqAgMS4xMTUyMzFdIGNsazogRGlzYWJsaW5nIHVudXNlZCBjbG9ja3MKW8KgIMKgIDEuMTE5
MDcyXSBQTTogZ2VucGQ6IERpc2FibGluZyB1bnVzZWQgcG93ZXIgZG9tYWlucwpbwqAgwqAgMS4x
MjM4NzVdIEFMU0EgZGV2aWNlIGxpc3Q6ClvCoCDCoCAxLjEyNjhbwqAgwqAgMS4xMzA3MThdIFdh
aXRpbmcgZm9yIHJvb3QgZGV2aWNlIFBBUlRVVUlEPWU5NGJmZGQ3LWEzNmYtNDMxNS1hNDgwLTQ3
NmUyYTEyNDAzZC4uLgpbwqAgwqAgMS4xODExNThdIG1tYzA6IG5ldyBVSFMtSSBzcGVlZCBERFI1
MCBTREhDIGNhcmQgYXQgYWRkcmVzcyBhYWFhClvCoCDCoCAxLjE4NTM0MV0gbW1jYmxrMDogbW1j
MDphYWFhIFNTMTZHIDE0LjggR2lCClvCoCDCoCAxLjE5ODAwOV0gR1BUOlByaW1hcnkgaGVhZGVy
IHRoaW5rcyBBbHQuIGhlYWRlciBpcyBub3QgYXQgdGhlIGVuZCBvZiB0aGUgZGlzay4KW8KgIMKg
IDEuMjAyODc0XSBHUFQ6MTEzNDMzMSAhPSAzMTExNjI4NwpbwqAgwqAgMS4yMDYzODhdIEdQVDpB
bHRlcm5hdGUgR1BUIGhlYWRlciBub3QgYXQgdGhlIGVuZCBvZiB0aGUgZGlzay4KW8KgIMKgIDEu
MjEyNDY4XSBHUFQ6MTEzNDMzMSAhPSAzMTExNjI4NwpbwqAgwqAgMS4yMTU5OTNdIEdQVDogVXNl
IEdOVSBQYXJ0ZWQgdG8gY29ycmVjdCBHUFQgZXJyb3JzLgpbwqAgwqAgMS4yMjEyMzBdwqAgbW1j
YmxrMDogcDEgcDIgcDMKW8KgIMKgIDEuNTI5OTc4XSBFWFQ0LWZzIChtbWNibGswcDMpOiBtb3Vu
dGVkIGZpbGVzeXN0ZW0gZGJjNzY4NzctMDkyZS00ZjhhLTlmMDYtYmYyODYzMDlkOGRlIHIvdyB3
aXRoIG9yZGVyZWQgZGF0YSBtb2RlLiBRdW90YSBtb2RlOiBkaXNhYmxlZC4KW8KgIMKgIDEuNTQw
MDY5XSBWRlM6IE1vdW50ZWQgcm9vdCAoZXh0NCBmaWxlc3lzdGVtKSBvbiBkZXZpY2UgMTc5OjMu
CgoKSW4gd2hpY2ggY2FzZToKClRlc3RlZC1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJh
eWxpYnJlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
