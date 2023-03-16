Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F29EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5ImYVayNEkx0LhuVyLzMiRXUoHpBH6eC5rLPsieoO0=; b=tPplmTCWJiabou
	O8VVGdNyNvTNXzsouREL22IT5X5k87tcsSH2EI5A++vwADcD4hDfFq9fnSQeJdU42f8PmF0M6bqwe
	e30IJpV/qOUk1ohLNkCF43/YYfpLk828sIlCC29pV4KKPEdNF3Py/3bWJBEKXkT6FkkaFnMT9tDKD
	QAZkMKJh4vhyy7f8cBuN4iXFQmC13As/yM7AOywGQh4igPddlLqXfAB6XcT3kfZOklHI+AsLZUP1T
	u8U3P0JpwIRgqG/OmVb2G7yQhi95RjNcdfvwhH8sT6ZzjeHjrrki6CiTFn9Qowtw18u+wC0+CZIIx
	F49QiRXNpvCPkm5cOMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcilj-00FdKY-2G;
	Thu, 16 Mar 2023 08:15:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcilf-00FdJL-0V
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 08:15:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8944824E231;
	Thu, 16 Mar 2023 16:15:09 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:15:09 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:15:08 +0800
Message-ID: <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
Date: Thu, 16 Mar 2023 16:15:06 +0800
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
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
 <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_011523_495730_59735F91 
X-CRM114-Status: GOOD (  12.84  )
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

CgpSZTogW1BBVENIIHY3IDQvNl0gZHQtYmluZGluZ3M6IG5ldDogQWRkIHN1cHBvcnQgU3RhckZp
dmUgZHdtYWMKRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgp0bzogR3VvIFNhbWluIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4sIGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCmRh
dGE6IDIwMjMvMy8xNgoKPiBPbiAxNi8wMy8yMDIzIDA5OjAyLCBHdW8gU2FtaW4gd3JvdGU6Cj4+
Cj4+Cj4+IC0tLS0tLS0tIOWOn+Wni+S/oeaBryAtLS0tLS0tLQo+PiDkuLvpopg6IFJlOiBbUEFU
Q0ggdjcgNC82XSBkdC1iaW5kaW5nczogbmV0OiBBZGQgc3VwcG9ydCBTdGFyRml2ZSBkd21hYwo+
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Cj4+IOaUtuS7tuS6ujogU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4s
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcs
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Cj4+IOaXpeacnzogMjAyMy8zLzE2Cj4+Cj4+PiBPbiAxNi8wMy8yMDIzIDA1OjM3LCBTYW1pbiBH
dW8gd3JvdGU6Cj4+Pj4gRnJvbTogWWFuaG9uZyBXYW5nIDx5YW5ob25nLndhbmdAc3RhcmZpdmV0
ZWNoLmNvbT4KPj4+Pgo+Pj4+IEFkZCBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIFN0YXJGaXZl
IGR3bWFjIGRyaXZlcihHTUFDKS4KPj4+Pgo+Pj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLiBU
aGVyZSBpcyBzb21ldGhpbmcgdG8gZGlzY3Vzcy9pbXByb3ZlLgo+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBZYW5ob25nIFdhbmcgPHlhbmhvbmcud2FuZ0BzdGFyZml2ZXRlY2guY29tPgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+Cj4+Pj4g
VGVzdGVkLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW0ubWVyY2lhaUBnbWFpbC5jb20+Cj4+Pj4g
LS0tCj4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgICB8
ICAgMSArCj4+Pj4gIC4uLi9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwg
ICB8IDEzMCArKysrKysrKysrKysrKysrKysKPj4+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPj4+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzcg
aW5zZXJ0aW9ucygrKQo+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbAo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxk
d21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwKPj4+PiBpbmRleCBlNDUxOWNmNzIyYWIuLjI0NWY3ZDcxMzI2MSAxMDA2NDQKPj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25w
cyxkd21hYy55YW1sCj4+Pj4gQEAgLTkxLDYgKzkxLDcgQEAgcHJvcGVydGllczoKPj4+PiAgICAg
ICAgICAtIHNucHMsZHdtYWMtNS4yMAo+Pj4+ICAgICAgICAgIC0gc25wcyxkd3hnbWFjCj4+Pj4g
ICAgICAgICAgLSBzbnBzLGR3eGdtYWMtMi4xMAo+Pj4+ICsgICAgICAgIC0gc3RhcmZpdmUsamg3
MTEwLWR3bWFjCj4+Pj4gIAo+Pj4+ICAgIHJlZzoKPj4+PiAgICAgIG1pbkl0ZW1zOiAxCj4+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZp
dmUsamg3MTEwLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmI1OWU2YmQ4MjAxZgo+Pj4+IC0tLSAvZGV2L251bGwK
Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZl
LGpoNzExMC1kd21hYy55YW1sCj4+Pj4gQEAgLTAsMCArMSwxMzAgQEAKPj4+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4gKyMg
Q29weXJpZ2h0IChDKSAyMDIyIFN0YXJGaXZlIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4+Pj4gKyVZ
QU1MIDEuMgo+Pj4+ICstLS0KPj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6
IFN0YXJGaXZlIEpINzExMCBEV01BQyBnbHVlIGxheWVyCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVy
czoKPj4+PiArICAtIEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4+Pj4g
KyAgLSBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+Pj4+ICsKPj4+PiAr
c2VsZWN0Ogo+Pj4+ICsgIHByb3BlcnRpZXM6Cj4+Pj4gKyAgICBjb21wYXRpYmxlOgo+Pj4+ICsg
ICAgICBjb250YWluczoKPj4+PiArICAgICAgICBlbnVtOgo+Pj4+ICsgICAgICAgICAgLSBzdGFy
Zml2ZSxqaDcxMTAtZHdtYWMKPj4+PiArICByZXF1aXJlZDoKPj4+PiArICAgIC0gY29tcGF0aWJs
ZQo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRpYmxlOgo+Pj4+ICsgICAg
aXRlbXM6Cj4+Pj4gKyAgICAgIC0gZW51bToKPj4+PiArICAgICAgICAgIC0gc3RhcmZpdmUsamg3
MTEwLWR3bWFjCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtNS4yMAo+Pj4+ICsKPj4+
Cj4+PiByZWc6Cj4+PiAgIG1heEl0ZW1zOiAxCj4+Cj4+Pgo+Pj4+ICsgIGNsb2NrczoKPj4+PiAr
ICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHTUFDIG1haW4gY2xvY2sKPj4+
PiArICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBBSEIgY2xvY2sKPj4+PiArICAgICAgLSBkZXNj
cmlwdGlvbjogUFRQIGNsb2NrCj4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFRYIGNsb2NrCj4+
Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdUWCBjbG9jawo+Pj4+ICsKPj4+PiArICBjbG9jay1u
YW1lczoKPj4+PiArICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPj4+
PiArICAgICAgLSBjb25zdDogcGNsawo+Pj4+ICsgICAgICAtIGNvbnN0OiBwdHBfcmVmCj4+Pj4g
KyAgICAgIC0gY29uc3Q6IHR4Cj4+Pj4gKyAgICAgIC0gY29uc3Q6IGd0eAo+Pj4+ICsKPj4+Cj4+
PiBpbnRlcnJ1cHRzOiA/Pz8KPj4+Cj4+Cj4+IEhpIEtyenlzenRvZiwgCj4+Cj4+IHNucHMsZHdt
YWMueWFtbCBoYXMgZGVmaW5lZCB0aGUgcmVnL2ludGVycnVwdC9pbnRlcnJ1cHQtbmFtZXMgbm9k
ZXMsCj4+IGFuZCB0aGUgSkg3MTEwIFNvQyBpcyBhbHNvIGFwcGxpY2FibGUuCj4+IE1heWJlIGp1
c3QgYWRkIHJlZy9pbnRlcnJ1cHQvaW50ZXJydXB0LW5hbWVzIHRvIHRoZSByZXF1aXJlZCA/Cj4g
Cj4gWW91IG5lZWQgdG8gY29uc3RyYWluIHRoZW0uCgoKSSBzZWUuIEkgd2lsbCBhZGQgcmVnIGNv
bnN0cmFpbnRzIGluIHRoZSBuZXh0IHZlcnNpb24sIHRoYW5rcy4KCkkgaGF2ZSBvbmUgbW9yZSBx
dWVzdGlvbiwgdGhlIGludGVycnVwdHMvaW50ZXJydXAtbmFtZXMgb2YgSkg3MTEwIFNvQydzIGdt
YWMgYXJlIGV4YWN0bHkgdGhlIHNhbWUgYXMgc25wcyxkd21hYy55YW1sLApkbyB0aGVzZSBhbHNv
IG5lZWQgdG8gYmUgY29uc3RyYWluZWQ/CgoKQmVzdCByZWdhcmRzLApTYW1pbgo+IAo+Pgo+Pgo+
PiAgIHJlcXVpcmVkOgo+PiAgICAgLSBjb21wYXRpYmxlCj4+ICsgICAtIHJlZwo+PiAgICAgLSBj
bG9ja3MKPj4gICAgIC0gY2xvY2stbmFtZXMKPj4gKyAgIC0gaW50ZXJydXB0cwo+PiArICAgLSBp
bnRlcnJ1cHQtbmFtZXMKPj4gICAgIC0gcmVzZXRzCj4+ICAgICAtIHJlc2V0LW5hbWVzCj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
