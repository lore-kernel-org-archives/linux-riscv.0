Return-Path: <SRS0=b7IV=KA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07609C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 14:37:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543A661176
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 14:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543A661176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=H3GD/4f/5vDKKVCDWgniXc5zpeDimPlTc77wll/MeGA=; b=MKcphANkDSw7dp3IlkP+WJxxb
	vh4rgE7Et0FRDSBA8yv8uuPEQUIFIEwybPGLOG95rQeZl2/PYsIItiSI60DmxwHvmH6CJOFdceE7u
	2uC/cUuQZRwZGcz+du4DhA/RMtuLBM5Y/XD7Q5JINh/GdNnb6g0pDLAZcHLGP708WcKWCvoOsWJjj
	UbxEgKYhb/8yt9Zpj8QORue76ri4VukzK0HXWQZTepgiUW3uyY5xanZgkvOhX1YYYI4ZKdg1XYIKm
	hoaQKRCmDv5ShLGROZka6es8gfoH/n4WxQQp7n3MdSw1fvFsP1Em050P9urZR9jWhlmFB1tO01xC3
	W3O7Me7cQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leIeG-001S1Y-3d; Wed, 05 May 2021 14:37:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leIeD-001S1C-0Z
 for linux-riscv@desiato.infradead.org; Wed, 05 May 2021 14:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To
 :Content-ID:Content-Description:References;
 bh=HC9xV7d/BATEosmW9FbTvv6AWuwxRlX27fD8ky5mtac=; b=FoGcW8NEQ3DDtja3Pk6IW/eG4y
 JnIixx9wXzFHctQVjjVOQWgbV4MsbQieDPOZlZslqSmrWtDRNDTzUYVM/6jVU2skCplXkyl3nU1eO
 rP4et4WOzgmiCf+OTo2CKIS7O4psDMb/8Mm3Ek22EX9IlsmNpAUprWR6fMcrBRUCrUPPlEYB18Y98
 U6hiYAl/AqC9N/LTnWXcat9GU2RlJDPycL5BpeUw0wmRGi1cmuhV1LlFL01FUhiDaqmLQ5IYbZH3T
 pQay0vbnmHL4OYJnBYjVSQbIJd2T48GFmPQeOq1kikV7u5wWw8ZuI0VyR8N/s440Osc17TMqztMGl
 n6TvmbPg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leIeA-004pcB-9m
 for linux-riscv@lists.infradead.org; Wed, 05 May 2021 14:37:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7075961157;
 Wed,  5 May 2021 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620225425;
 bh=Ehq7zR5EL010xOPMeZxXULfS9dLTcxOv/Y8XH3TPNrg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AzPXRTqmdq8Gz1ySQkPfIP+VwZ8kSkK6//JYOAbDkcwfoDIkqxchIywlAiyKINUW/
 swIh3U5xJndPjHMTVXtNVGmEbpZURJADcYop7RZYbbCzqs8UUzopXq0gggYYsoyUEf
 LwHXJDv/SjP21Y7DWJAHJvySXeRqlMJDIL8jnoWwhC87n5FdymnbKGtLLZUhtlJx2V
 vTvyFjkVO4dZGm2fI9HuFRr0eaFdSLvEvH4LA0o+RHPFCCFg2HjNHLqzuU6/d2Co+h
 vbAOkNH4d/Daab1BGohc7xqjj9AdhcCUblGAB/UuScxBK9Q9/asI7LG1ZBTPQlyUu+
 5jqeISgj6Of1g==
Date: Wed, 5 May 2021 09:37:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com,
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, alex.dewar90@gmail.com,
 khilman@baylibre.com, hayashi.kunihiko@socionext.com,
 vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <20210505143704.GA1298791@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCEehL21cFLp+JWMhKP8rAVtGunMv2fmfo6C6tbTGpgL9q2RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_073706_432121_398E6324 
X-CRM114-Status: GOOD (  25.25  )
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

T24gV2VkLCBNYXkgMDUsIDIwMjEgYXQgMTI6MjY6MzFQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdy
b3RlOgo+IEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQ15pyI
NOaXpSDpgLHkuowg5LiL5Y2IOTo0NuWvq+mBk++8mgo+ID4gT24gVHVlLCBNYXkgMDQsIDIwMjEg
YXQgMDY6NTk6MzlQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiBGcm9tOiBQYXVs
IFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPiA+Cj4gPiA+IEFkZCBkcml2
ZXIgZm9yIHRoZSBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIuCj4gPiA+IFRoaXMg
Y29udHJvbGxlciBpcyBiYXNlZCBvbiB0aGUgRGVzaWduV2FyZSBQQ0llIGNvcmUuCj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNv
bT4KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBIZW5yeSBTdHlsZXMgPGhlc0BzaWZpdmUuY29tPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBTdHlsZXMgPGhlc0BzaWZpdmUuY29tPgo+ID4gPiBD
by1kZXZlbG9wZWQtYnk6IEVyaWsgRGFuaWUgPGVyaWsuZGFuaWVAc2lmaXZlLmNvbT4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogRXJpayBEYW5pZSA8ZXJpay5kYW5pZUBzaWZpdmUuY29tPgo+ID4gPiBD
by1kZXZlbG9wZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZyAgICAg
IHwgIDEwICsKPiA+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL01ha2VmaWxlICAgICB8
ICAgMSArCj4gPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMgfCAz
MDkgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMyMCBp
bnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9LY29uZmlnIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2Nv
bmZpZwo+ID4gPiBpbmRleCAyMmM1NTI5ZTlhNjUuLjI1NWQ0M2IxNjYxYiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gPiArKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiA+IEBAIC0zMTgsNCArMzE4LDE0IEBA
IGNvbmZpZyBQQ0lFX0FMCj4gPiA+ICAgICAgICAgcmVxdWlyZWQgb25seSBmb3IgRFQtYmFzZWQg
cGxhdGZvcm1zLiBBQ1BJIHBsYXRmb3JtcyB3aXRoIHRoZQo+ID4gPiAgICAgICAgIEFubmFwdXJu
YSBMYWJzIFBDSWUgY29udHJvbGxlciBkb24ndCBuZWVkIHRvIGVuYWJsZSB0aGlzLgo+ID4gPgo+
ID4gPiArY29uZmlnIFBDSUVfRlU3NDAKPiA+ID4gKyAgICAgYm9vbCAiU2lGaXZlIEZVNzQwIFBD
SWUgaG9zdCBjb250cm9sbGVyIgo+ID4gPiArICAgICBkZXBlbmRzIG9uIFBDSV9NU0lfSVJRX0RP
TUFJTgo+ID4gPiArICAgICBkZXBlbmRzIG9uIFNPQ19TSUZJVkUgfHwgQ09NUElMRV9URVNUCj4g
PiA+ICsgICAgIGRlcGVuZHMgb24gR1BJT0xJQgo+ID4gLi4uCj4gPiAyKSBJIHdvdWxkIHByZWZl
ciBub3QgdG8gZGVwZW5kIG9uIEdQSU9MSUIgYmVjYXVzZSBpdCByZWR1Y2VzCj4gPiAgICBjb21w
aWxlLXRlc3QgY292ZXJhZ2UuICBGb3IgZXhhbXBsZSwgdGhlIHg4Nl82NCBkZWZjb25maWcgZG9l
cyBub3QKPiA+ICAgIGVuYWJsZSBHUElPTElCLCBzbyBvbmUgbXVzdCBtYW51YWxseSBlbmFibGUg
aXQgdG8gZXZlbiBiZSBhYmxlIHRvCj4gPiAgICBlbmFibGUgUENJRV9GVTc0MC4KPiA+IC4uLgoK
PiBTb3JyeSBmb3IgbGF0ZSB0byBkZWJ1ZyB0aGlzIGNhc2UuIEkgd2FzIHdvcmtpbmcgb24gb3Ro
ZXIgd29ya3MgYW5kCj4ganVzdCBtaXNzZWQgdGhlIGVtYWlsLgo+IEhvdyBhYm91dCB0aGlzPwoK
V2UgYWxyZWFkeSBkcm9wcGVkIHRoZSAiZGVwZW5kcyBvbiBHUElPTElCIiBmb3IgdjUuMTMuCgpZ
b3UgY2FuIGFkZCBhIHNlbGVjdCBsYXRlciwgZm9yIHY1LjE0LiAgT2YgY291cnNlLCB5b3Ugc2hv
dWxkIHBvc3QgYQpjb21wbGV0ZSBwYXRjaCBpbmNsdWRpbmcgY29tbWl0IGxvZyBhbmQgc2lnbmVk
LW9mZi1ieS4KCkFuZCBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgaG93IG90aGVyIGRyaXZlcnMgaGFu
ZGxlIHRoaXMgc28geW91IGRvIGl0CnRoZSBzYW1lIHdheS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiBpbmRleCBlMWIy
NjkwYjZlNDUuLjY2ZjU3ZjJkYjQ5ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcu
c29jcwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gQEAgLTcsNiArNyw3IEBAIGNv
bmZpZyBTT0NfU0lGSVZFCj4gICAgICAgICBzZWxlY3QgQ0xLX1NJRklWRQo+ICAgICAgICAgc2Vs
ZWN0IENMS19TSUZJVkVfUFJDSQo+ICAgICAgICAgc2VsZWN0IFNJRklWRV9QTElDCj4gKyAgICAg
ICBzZWxlY3QgR1BJT0xJQiBpZiBQQ0lFX0ZVNzQwCj4gICAgICAgICBoZWxwCj4gICAgICAgICAg
IFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBTaUZpdmUgU29DIHBsYXRmb3JtIGhhcmR3YXJlLgo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gaW5kZXggMjU1ZDQzYjE2NjFiLi4w
YTM3ZDIxZWQ2NGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2Nv
bmZpZwo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiBAQCAtMzIy
LDcgKzMyMiw2IEBAIGNvbmZpZyBQQ0lFX0ZVNzQwCj4gICAgICAgICBib29sICJTaUZpdmUgRlU3
NDAgUENJZSBob3N0IGNvbnRyb2xsZXIiCj4gICAgICAgICBkZXBlbmRzIG9uIFBDSV9NU0lfSVJR
X0RPTUFJTgo+ICAgICAgICAgZGVwZW5kcyBvbiBTT0NfU0lGSVZFIHx8IENPTVBJTEVfVEVTVAo+
IC0gICAgICAgZGVwZW5kcyBvbiBHUElPTElCCj4gICAgICAgICBzZWxlY3QgUENJRV9EV19IT1NU
Cj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgUENJZSBj
b250cm9sbGVyIHN1cHBvcnQgZm9yIHRoZSBTaUZpdmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
