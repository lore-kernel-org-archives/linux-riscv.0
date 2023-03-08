Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947E1C6FA99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiJslb1MxYzguA41OY9D3qmhBUU486MJZwOLG2UCra8=; b=Q1y7XHf2eHZ8DK
	mpS7KPYQ35ew2GmAivRRgAh+601yseofA2mfOfdiZ3/YFOZEqwKWRebpOz2w50W/m7J3oQtmvqGa5
	RE+/bfZ73DHwrKsy7c77Te88nlmbuO0s+znmmtZedlvJ7rErZ4N8X9OI7BO94TP7SwrK5MlNzAdyr
	QpyXzE4WSGlZXzQsv81S/wMscfqpptKXYpQhDRiTg/QAzB6k33S6Pka9rTCCuXNHxbDFyHM9BamGV
	o3p5MdFMemCqByw1SY2FHIuXh2Ufq7n14X9hiDmmYhZtDTYYd4Uk2IbfTdPg4xwmJmhbNWGI7J3ol
	kDIv/9vyQ1CCgoApu7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZk40-003FSC-La; Wed, 08 Mar 2023 03:02:00 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZk3w-003FQ0-Ar
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:01:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A528424E2E2;
	Wed,  8 Mar 2023 11:01:24 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 11:01:24 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 11:01:23 +0800
Message-ID: <aa404236-9845-3a3a-3327-b3a075b37a32@starfivetech.com>
Date: Wed, 8 Mar 2023 11:01:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 11/12] riscv: dts: starfive: visionfive-2-v1.2a: Add
 gmac+phy's delay configuration
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-12-samin.guo@starfivetech.com>
 <CAJM55Z_8m42vfoPDicTP18S6Z1ZXYbFeS1edTjzYVB3Kq2xFeQ@mail.gmail.com>
 <8bd8654e-4bba-c718-4b17-5291e70f05fe@starfivetech.com>
 <CAJM55Z8-65ENJHfSUOTd+FSNx2b-mYF1L64CKT+Gez2jK3Qr2Q@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z8-65ENJHfSUOTd+FSNx2b-mYF1L64CKT+Gez2jK3Qr2Q@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_190156_711659_76B5C20F 
X-CRM114-Status: GOOD (  16.21  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHY1IDEx
LzEyXSByaXNjdjogZHRzOiBzdGFyZml2ZTogdmlzaW9uZml2ZS0yLXYxLjJhOiBBZGQgZ21hYytw
aHkncyBkZWxheSBjb25maWd1cmF0aW9uCkZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWls
LnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgrmlLbku7bkuro6IEd1byBTYW1pbiA8c2Ft
aW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+CuaXpeacnzogMjAyMy8zLzcKCj4gT24gVHVlLCA3IE1h
ciAyMDIzIGF0IDAyOjQzLCBHdW8gU2FtaW4gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPiB3
cm90ZToKPj4g5ZyoIDIwMjMvMy82IDIxOjAwOjE5LCBFbWlsIFJlbm5lciBCZXJ0aGluZyDlhpnp
gZM6Cj4+PiBPbiBGcmksIDMgTWFyIDIwMjMgYXQgMTA6MDEsIFNhbWluIEd1byA8c2FtaW4uZ3Vv
QHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Pj4+IHYxLjJBIGdtYWMwIHVzZXMgbW90b3Jjb21t
IFlUODUzMShyZ21paS1pZCkgUEhZLCBhbmQgbmVlZHMgZGVsYXkKPj4+PiBjb25maWd1cmF0aW9u
cy4KPj4+Pgo+Pj4+IHYxLjJBIGdtYWMxIHVzZXMgbW90b3Jjb21tIFlUODUxMihybWlpKSBQSFks
IGFuZCBuZWVkcyB0bwo+Pj4+IHN3aXRjaCByeCBhbmQgcnggdG8gZXh0ZXJuYWwgY2xvY2sgc291
cmNlcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJm
aXZldGVjaC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIC4uLi9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUt
dmlzaW9uZml2ZS0yLXYxLjJhLmR0cyB8IDEzICsrKysrKysrKysrKysKPj4+PiAgMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuMmEuZHRz
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2
ZS0yLXYxLjJhLmR0cwo+Pj4+IGluZGV4IDRhZjMzMDBmM2NmMy4uMjA1YTEzZDhjOGIxIDEwMDY0
NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZl
LXZpc2lvbmZpdmUtMi12MS4yYS5kdHMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuMmEuZHRzCj4+Pj4gQEAgLTEx
LDMgKzExLDE2IEBACj4+Pj4gICAgICAgICBtb2RlbCA9ICJTdGFyRml2ZSBWaXNpb25GaXZlIDIg
djEuMkEiOwo+Pj4+ICAgICAgICAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSx2aXNpb25maXZlLTIt
djEuMmEiLCAic3RhcmZpdmUsamg3MTEwIjsKPj4+PiAgfTsKPj4+PiArCj4+Pj4gKyZnbWFjMSB7
Cj4+Pj4gKyAgICAgICBwaHktbW9kZSA9ICJybWlpIjsKPj4+PiArICAgICAgIGFzc2lnbmVkLWNs
b2NrcyA9IDwmc3lzY3JnIEpINzExMF9TWVNDTEtfR01BQzFfVFg+LAo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19HTUFDMV9SWD47Cj4+Pj4gKyAg
ICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19HTUFD
MV9STUlJX1JUWD4sCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZzeXNj
cmcgSkg3MTEwX1NZU0NMS19HTUFDMV9STUlJX1JUWD47Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsm
cGh5MCB7Cj4+Pj4gKyAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxOTAwPjsKPj4+PiAr
ICAgICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDEzNTA+Owo+Pj4+ICt9Owo+Pj4KPj4+IEhl
cmUgeW91J3JlIG5vdCBzcGVjaWZ5aW5nIHRoZSBpbnRlcm5hbCBkZWxheXMgZm9yIHBoeTEgd2hp
Y2ggbWVhbnMgaXQKPj4+IGRlZmF1bHRzIHRvIDE5NTBwcyBmb3IgYm90aCByeCBhbmQgdHguIElz
IHRoYXQgcmlnaHQgb3IgZGlkIHlvdSBtZWFuCj4+PiB0byBzZXQgdGhlbSB0byAwIGxpa2UgdGhl
IHYxLjNiIHBoeTE/Cj4+Cj4+IEhpLCBlbWlsLCB1c3VhbGx5LCBvbmx5IDEwMDBNIChyZ21paSkg
bmVlZHMgdG8gY29uZmlndXJlIHRoZSBkZWxheSwgYW5kIDEwME0ocm1paSkgZG9lcyBub3QuCj4g
Cj4gQWgsIEkgc2VlLgo+IAo+Pj4gQWxzbyB5b3VyIHUtYm9vdCBzZWVtcyB0byBzZXQgd2hhdCB0
aGUgbGludXggcGh5IGRyaXZlciBjYWxscwo+Pj4gbW90b3Jjb21tLGtlZXAtcGxsLWVuYWJsZWQg
YW5kIG1vdG9yY29tbSxhdXRvLXNsZWVwLWRpc2FibGVkIGZvciBhbGwKPj4+IHRoZSBwaHlzLiBE
aWQgeW91IGxlYXZlIHRob3NlIG91dCBvbiBwdXJwb3NlPwo+Pgo+PiBIaSwgRW1pbCwgV2UgZGlk
IGNvbmZpZ3VyZSBtb3RvcmNvbW0sYXV0by1zbGVlcC1kaXNhYmxlZCBmb3IgeXQ4NTEyIGluIHVi
b290LAo+PiBidXQgWXV0YWkgdXBzdHJlYW0ncyBMaW51eCBkcml2ZXIgb25seSB5dDg1MjEveXQ4
NTMxIHN1cHBvcnRzIHRoaXMgcHJvcGVydHkuCj4gCj4gSSdtIGNvbmZ1c2VkLiBJcyBZdXRhaSBh
bHNvIEZyYW5rIFNhZT8gQmVjYXVzZSBoZSBpcyB0aGUgb25lIHdobyBhZGRlZAo+IHN1cHBvcnQg
Zm9yIHRoZSB5dDg1MzEgdXBzdHJlYW0uCgpNeSBmYXVsdCAsIEZyYW5rIFNhZSBpcyBmcm9tIE1v
dG9yY29tbSwgYWxzbyBrbm93biBhcyBZdXRhaS4gCnl0ODUzMSA9PT4gWXV0YWkgODUzMQo+IAo+
PiBZdDg1MTIgaXMgYSBHZW5lcmljIFBIWSBkcml2ZXIgYW5kIGRvZXMgbm90IHN1cHBvcnQgdGhl
IGNvbmZpZ3VyYXRpb24gb2YKPj4gbW90b3Jjb21tLGF1dG8tc2xlZXAtZGlzYWJsZWQgYW5kIG1v
dG9yY29tbSxrZWVwLXBsbC1lbmFibGVkLgo+IAo+IFJpZ2h0IHBoeTEgb2YgdGhlIDEuMmEgbWln
aHQgdXNlIGEgZGlmZmVyZW50IHBoeSwgYnV0IEknbSBhbHNvIHRhbGtpbmcKPiBhYm91dCBwaHkw
IGFuZCB0aGUgdjEuM2Igd2hpY2ggZG9lcyB1c2UgdGhlIHl0ODUzMSByaWdodD8KUmlnaHQ6CnYx
LjNiOiBnbWFjMDp5dDg1MzEgICBnbWFjMTp5dDg1MzEKdjEuMmE6IGdtYWMwOnl0ODUzMSAgIGdt
YWMxOnl0ODUxMgo+IAo+PiBBbmQgd2l0aG91dCBjb25maWd1cmluZyB0aGVzZSB0d28gYXR0cmli
dXRlcywgdmYyLTEuMmEgZ21hYzEgYWxzbyB3b3JrcyBub3JtYWxseS4KPiAKPiBZZXMsIGJ1dCB3
aGF0IEknbSB3b3JyaWVkIGFib3V0IGlzIHRoYXQgaXQgb25seSB3b3JrcyBiZWNhdXNlIHUtYm9v
dAo+IGluaXRpYWxpc2VzIHRoZSBQSFlzIGFuZCBldGhlcm5ldCBtYXkgc3RvcCB3b3JraW5nIGlm
IHlvdSdyZSB1c2luZyBhCj4gZGlmZmVyZW50IGJvb3Rsb2FkZXIgb3IgTGludXggZ2FpbnMgc3Vw
cG9ydCBmb3IgcmVzZXR0aW5nIHRoZSBQSFlzCj4gYmVmb3JlIHVzZS4KPiAKSSBoYXZlIHRlc3Rl
ZCB0aGF0IGluIHVib290LCB1c2UgdGhlIHNkIGNhcmQgdG8gc3RhcnQgTGludXgsIGRvIG5vdCBy
dW4gbmV0d29yayBwcm9ncmFtcyAoZG8gbm90IHVzZSB1Ym9vdCB0byBpbml0aWFsaXplIHBoeSBh
bmQgZ21hYyksCmFuZCB0aGUgbmV0d29yayB3b3JrcyBub3JtYWxseSBpbiBMaW51eC4KCkJlc3Qg
cmVnYXJkcywKU2FtaW4KCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gU2FtaW4KPj4+Cj4+Pj4gLS0K
Pj4+PiAyLjE3LjEKPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+PiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Pgo+PiAtLQo+PiBCZXN0IHJlZ2FyZHMs
Cj4+IFNhbWluCgotLSAKQmVzdCByZWdhcmRzLApTYW1pbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
