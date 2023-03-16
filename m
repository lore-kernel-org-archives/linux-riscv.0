Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D58FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxOI9NH6wIgg+hcrd6MCBRn6FKdNXwKq37gpU0eKBRo=; b=HC8dd3O9oG2jmB
	NiHtzhCJl3jwgvpL3JMCDptlDPVO5MOG+NabdIwJGo59xm8xuooztRmfYBWNMzPGl4ImEauBMDfoC
	Ib79EpZcioDd87r5KKRz4aZXMonqx1/8m2BOSGLsYJU1rNuCBKbz14cAYjuYMZzPdvdcoxIH3mgjh
	XfkyZyKffreEvw5KA39FWq3ROpNf6lWmCoLPb8bQ7G4wYysQIlTwWmfAS3F+9K05DujI/ZBuA5M2l
	zfeF5aCgDX/56MY3jJrq/n/YQhFV02YQfDB3wgPtB2Odf0wt4OCAhgRM1Gl+MUh9WSmyBK5s89BCy
	iz3IiXtOiCary041fz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciZT-00FaBU-07;
	Thu, 16 Mar 2023 08:02:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciZP-00FaAN-1R
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 08:02:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 960CA24E201;
	Thu, 16 Mar 2023 16:02:30 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:02:30 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:02:29 +0800
Message-ID: <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
Date: Thu, 16 Mar 2023 16:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_010243_776007_B5868806 
X-CRM114-Status: GOOD (  13.91  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHY3IDQv
Nl0gZHQtYmluZGluZ3M6IG5ldDogQWRkIHN1cHBvcnQgU3RhckZpdmUgZHdtYWMKRnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgrmlLbku7bk
uro6IFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+LCBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwrml6XmnJ86IDIwMjMv
My8xNgoKPiBPbiAxNi8wMy8yMDIzIDA1OjM3LCBTYW1pbiBHdW8gd3JvdGU6Cj4+IEZyb206IFlh
bmhvbmcgV2FuZyA8eWFuaG9uZy53YW5nQHN0YXJmaXZldGVjaC5jb20+Cj4+Cj4+IEFkZCBkb2N1
bWVudGF0aW9uIHRvIGRlc2NyaWJlIFN0YXJGaXZlIGR3bWFjIGRyaXZlcihHTUFDKS4KPj4KPiBU
aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0byBkaXNjdXNzL2lt
cHJvdmUuCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFlhbmhvbmcgV2FuZyA8eWFuaG9uZy53YW5nQHN0
YXJmaXZldGVjaC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0
YXJmaXZldGVjaC5jb20+Cj4+IFRlc3RlZC1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tLm1lcmNp
YWlAZ21haWwuY29tPgo+PiAtLS0KPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBz
LGR3bWFjLnlhbWwgICB8ICAgMSArCj4+ICAuLi4vYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzEx
MC1kd21hYy55YW1sICAgfCAxMzAgKysrKysrKysrKysrKysrKysrCj4+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwo+PiAgMyBmaWxlcyBjaGFu
Z2VkLCAxMzcgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKPj4K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25w
cyxkd21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBz
LGR3bWFjLnlhbWwKPj4gaW5kZXggZTQ1MTljZjcyMmFiLi4yNDVmN2Q3MTMyNjEgMTAwNjQ0Cj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55
YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxk
d21hYy55YW1sCj4+IEBAIC05MSw2ICs5MSw3IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgIC0g
c25wcyxkd21hYy01LjIwCj4+ICAgICAgICAgIC0gc25wcyxkd3hnbWFjCj4+ICAgICAgICAgIC0g
c25wcyxkd3hnbWFjLTIuMTAKPj4gKyAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPj4g
IAo+PiAgICByZWc6Cj4+ICAgICAgbWluSXRlbXM6IDEKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzExMC1k
d21hYy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
YjU5ZTZiZDgyMDFmCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbAo+PiBAQCAtMCww
ICsxLDEzMCBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCj4+ICsjIENvcHlyaWdodCAoQykgMjAyMiBTdGFyRml2ZSBUZWNobm9s
b2d5IENvLiwgTHRkLgo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbmV0L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sIwo+PiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsK
Pj4gK3RpdGxlOiBTdGFyRml2ZSBKSDcxMTAgRFdNQUMgZ2x1ZSBsYXllcgo+PiArCj4+ICttYWlu
dGFpbmVyczoKPj4gKyAgLSBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+
PiArICAtIFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+Cj4+ICsKPj4gK3Nl
bGVjdDoKPj4gKyAgcHJvcGVydGllczoKPj4gKyAgICBjb21wYXRpYmxlOgo+PiArICAgICAgY29u
dGFpbnM6Cj4+ICsgICAgICAgIGVudW06Cj4+ICsgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAt
ZHdtYWMKPj4gKyAgcmVxdWlyZWQ6Cj4+ICsgICAgLSBjb21wYXRpYmxlCj4+ICsKPj4gK3Byb3Bl
cnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGVudW06
Cj4+ICsgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPj4gKyAgICAgIC0gY29uc3Q6
IHNucHMsZHdtYWMtNS4yMAo+PiArCj4gCj4gcmVnOgo+ICAgbWF4SXRlbXM6IDEKCj4gCj4+ICsg
IGNsb2NrczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdNQUMgbWFp
biBjbG9jawo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBBSEIgY2xvY2sKPj4gKyAgICAg
IC0gZGVzY3JpcHRpb246IFBUUCBjbG9jawo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogVFggY2xv
Y2sKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdUWCBjbG9jawo+PiArCj4+ICsgIGNsb2NrLW5h
bWVzOgo+PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBjb25zdDogc3RtbWFjZXRoCj4+ICsgICAg
ICAtIGNvbnN0OiBwY2xrCj4+ICsgICAgICAtIGNvbnN0OiBwdHBfcmVmCj4+ICsgICAgICAtIGNv
bnN0OiB0eAo+PiArICAgICAgLSBjb25zdDogZ3R4Cj4+ICsKPiAKPiBpbnRlcnJ1cHRzOiA/Pz8K
PiAKCkhpIEtyenlzenRvZiwgCgpzbnBzLGR3bWFjLnlhbWwgaGFzIGRlZmluZWQgdGhlIHJlZy9p
bnRlcnJ1cHQvaW50ZXJydXB0LW5hbWVzIG5vZGVzLAphbmQgdGhlIEpINzExMCBTb0MgaXMgYWxz
byBhcHBsaWNhYmxlLgpNYXliZSBqdXN0IGFkZCByZWcvaW50ZXJydXB0L2ludGVycnVwdC1uYW1l
cyB0byB0aGUgcmVxdWlyZWQgPwoKCiAgcmVxdWlyZWQ6CiAgICAtIGNvbXBhdGlibGUKKyAgIC0g
cmVnCiAgICAtIGNsb2NrcwogICAgLSBjbG9jay1uYW1lcworICAgLSBpbnRlcnJ1cHRzCisgICAt
IGludGVycnVwdC1uYW1lcwogICAgLSByZXNldHMKICAgIC0gcmVzZXQtbmFtZXMKCkJlc3QgcmVn
YXJkcywKU2FtaW4KCj4+ICsgIHJlc2V0czoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IE1BQyBSZXNldCBzaWduYWwuCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBBSEIg
UmVzZXQgc2lnbmFsLgo+PiArCj4+ICsgIHJlc2V0LW5hbWVzOgo+PiArICAgIGl0ZW1zOgo+PiAr
ICAgICAgLSBjb25zdDogc3RtbWFjZXRoCj4+ICsgICAgICAtIGNvbnN0OiBhaGIKPj4gKwo+PiAr
ICBzdGFyZml2ZSx0eC11c2UtcmdtaWktY2xrOgo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAg
ICAgVHggY2xvY2sgaXMgcHJvdmlkZWQgYnkgZXh0ZXJuYWwgcmdtaWkgY2xvY2suCj4+ICsgICAg
dHlwZTogYm9vbGVhbgo+PiArCj4+ICsgIHN0YXJmaXZlLHN5c2NvbjoKPj4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4+ICsgICAgaXRl
bXM6Cj4+ICsgICAgICAtIGl0ZW1zOgo+PiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5k
bGUgdG8gc3lzY29uIHRoYXQgY29uZmlndXJlcyBwaHkgbW9kZQo+PiArICAgICAgICAgIC0gZGVz
Y3JpcHRpb246IE9mZnNldCBvZiBwaHkgbW9kZSBzZWxlY3Rpb24KPj4gKyAgICAgICAgICAtIGRl
c2NyaXB0aW9uOiBTaGlmdCBvZiBwaHkgbW9kZSBzZWxlY3Rpb24KPj4gKyAgICBkZXNjcmlwdGlv
bjoKPj4gKyAgICAgIEEgcGhhbmRsZSB0byBzeXNjb24gd2l0aCB0d28gYXJndW1lbnRzIHRoYXQg
Y29uZmlndXJlIHBoeSBtb2RlLgo+PiArICAgICAgVGhlIGFyZ3VtZW50IG9uZSBpcyB0aGUgb2Zm
c2V0IG9mIHBoeSBtb2RlIHNlbGVjdGlvbiwgdGhlCj4+ICsgICAgICBhcmd1bWVudCB0d28gaXMg
dGhlIHNoaWZ0IG9mIHBoeSBtb2RlIHNlbGVjdGlvbi4KPj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0g
JHJlZjogc25wcyxkd21hYy55YW1sIwo+PiArCj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZh
bHNlCj4+ICsKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
