Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C5C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQIgO8vSTgcPHvzv1BBQHoYEZMzijiWwU0mCiDJXq7I=; b=zyXuwh+QQ/PJx4
	0kyS95+QI4HcNQNxAjoshi8f7qPIHEPmZdnfc6y9aKhyhB55pgmlfoawtJDAnSdqehg7E6l70EYAo
	ZxM4eZnTqKxj+E5lGDAUdIoz3aRt6NNBXh3st3p5O/VoFu3B3h8le/+vzc+aqYDc+nxhGfVWx2xpZ
	LzeAr0izgTiWfCqJXs8ZyHRb/VBRInvBGHWZOaC/tLVJJ4PT5waKW0YqNT+igQvXFn9y0YoYsGkH/
	QuNhLukfj8XILAZOz4+l34mcOvYkxf55j6bgIVDaaYjqQWO5tMLBrfqA0+/e7yzeVd183AM4uGv+Z
	yMMPK5OOaTIMBttZcrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa541-007Pit-Sh; Thu, 09 Mar 2023 01:27:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa53x-007Ped-0G
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 01:27:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3FC4224E057;
	Thu,  9 Mar 2023 09:26:55 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 09:26:55 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 09:26:54 +0800
Message-ID: <08d3d24b-f568-0592-6e77-07113cde86be@starfivetech.com>
Date: Thu, 9 Mar 2023 09:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 04/12] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
	<pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-5-samin.guo@starfivetech.com>
 <20230308215915.GA3911690-robh@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230308215915.GA3911690-robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_172721_349445_37F57F43 
X-CRM114-Status: GOOD (  10.72  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0KUmU6IFtQQVRDSCB2NSAwNC8xMl0gZHQt
YmluZGluZ3M6IG5ldDogQWRkIHN1cHBvcnQgU3RhckZpdmUgZHdtYWMKRnJvbTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KCgo+IE9uIEZyaSwgTWFyIDAzLCAyMDIzIGF0IDA0OjU5OjIw
UE0gKzA4MDAsIFNhbWluIEd1byB3cm90ZToKPj4gRnJvbTogWWFuaG9uZyBXYW5nIDx5YW5ob25n
LndhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4KPj4gQWRkIGRvY3VtZW50YXRpb24gdG8gZGVzY3Jp
YmUgU3RhckZpdmUgZHdtYWMgZHJpdmVyKEdNQUMpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5o
b25nIFdhbmcgPHlhbmhvbmcud2FuZ0BzdGFyZml2ZXRlY2guY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgICB8ICAgMSArCj4+ICAuLi4v
YmluZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sICAgfCAxMTcgKysrKysrKysr
KysrKysrKysrCj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDYgKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKQo+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3Rh
cmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4gaW5kZXggODkwOTlhODg4
ZjBiLi4zOTVmMDgxMTYxY2UgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+IEBAIC05MSw2ICs5MSw3IEBA
IHByb3BlcnRpZXM6Cj4+ICAgICAgICAgIC0gc25wcyxkd21hYy01LjIwCj4+ICAgICAgICAgIC0g
c25wcyxkd3hnbWFjCj4+ICAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPj4gKyAgICAgICAg
LSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPj4gIAo+PiAgICByZWc6Cj4+ICAgICAgbWluSXRlbXM6
IDEKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
c3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2E0OWYwOGQ1MGRkCj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxq
aDcxMTAtZHdtYWMueWFtbAo+PiBAQCAtMCwwICsxLDExNyBAQAo+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICsjIENvcHlyaWdo
dCAoQykgMjAyMiBTdGFyRml2ZSBUZWNobm9sb2d5IENvLiwgTHRkLgo+PiArJVlBTUwgMS4yCj4+
ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3N0YXJmaXZl
LGpoNzExMC1kd21hYy55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBTdGFyRml2ZSBKSDcxMTAgRFdN
QUMgZ2x1ZSBsYXllcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBFbWlsIFJlbm5lciBC
ZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+PiArICAtIFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0
YXJmaXZldGVjaC5jb20+Cj4+ICsKPj4gK3NlbGVjdDoKPj4gKyAgcHJvcGVydGllczoKPj4gKyAg
ICBjb21wYXRpYmxlOgo+PiArICAgICAgY29udGFpbnM6Cj4+ICsgICAgICAgIGVudW06Cj4+ICsg
ICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPj4gKyAgcmVxdWlyZWQ6Cj4+ICsgICAg
LSBjb21wYXRpYmxlCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsg
ICAgaXRlbXM6Cj4+ICsgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgLSBzdGFyZml2ZSxqaDcx
MTAtZHdtYWMKPj4gKyAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtNS4yMAo+PiArCj4+ICsgIGNs
b2NrczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdNQUMgbWFpbiBj
bG9jawo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBBSEIgY2xvY2sKPj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IFBUUCBjbG9jawo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogVFggY2xvY2sK
Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdUWCBjbG9jawo+PiArCj4+ICsgIGNsb2NrLW5hbWVz
Ogo+PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBjb25zdDogc3RtbWFjZXRoCj4+ICsgICAgICAt
IGNvbnN0OiBwY2xrCj4+ICsgICAgICAtIGNvbnN0OiBwdHBfcmVmCj4+ICsgICAgICAtIGNvbnN0
OiB0eAo+PiArICAgICAgLSBjb25zdDogZ3R4Cj4+ICsKPj4gKyAgcmVzZXRzOgo+PiArICAgIGl0
ZW1zOgo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogTUFDIFJlc2V0IHNpZ25hbC4KPj4gKyAgICAg
IC0gZGVzY3JpcHRpb246IEFIQiBSZXNldCBzaWduYWwuCj4+ICsKPj4gKyAgcmVzZXQtbmFtZXM6
Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPj4gKyAgICAgIC0g
Y29uc3Q6IGFoYgo+PiArCj4+ICsgIHN0YXJmaXZlLHR4LXVzZS1yZ21paS1jbGs6Cj4+ICsgICAg
ZGVzY3JpcHRpb246Cj4+ICsgICAgICBUeCBjbG9jayBpcyBwcm92aWRlZCBieSBleHRlcm5hbCBy
Z21paSBjbG9jay4KPj4gKyAgICB0eXBlOiBib29sZWFuCj4+ICsKPj4gK2FsbE9mOgo+PiArICAt
ICRyZWY6IHNucHMsZHdtYWMueWFtbCMKPj4gKwo+PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiB0
cnVlCj4gCj4gVGhpcyBtdXN0IGJlIGZhbHNlLgo+IApUaGFua3MsIHdpbGwgZml4IG5ldCB2ZXJz
aW9uLgo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gY2xvY2tz
Cj4+ICsgIC0gY2xvY2stbmFtZXMKPj4gKyAgLSByZXNldHMKPj4gKyAgLSByZXNldC1uYW1lcwo+
PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAgZXRoZXJuZXRAMTYwMzAwMDAgewo+
PiArICAgICAgICBjb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1kd21hYyIsICJzbnBzLGR3
bWFjLTUuMjAiOwo+PiArICAgICAgICByZWcgPSA8MHgxNjAzMDAwMCAweDEwMDAwPjsKPj4gKyAg
ICAgICAgY2xvY2tzID0gPCZjbGsgMz4sIDwmY2xrIDI+LCA8JmNsayAxMDk+LAo+PiArICAgICAg
ICAgICAgICAgICA8JmNsayA2PiwgPCZjbGsgMTExPjsKPj4gKyAgICAgICAgY2xvY2stbmFtZXMg
PSAic3RtbWFjZXRoIiwgInBjbGsiLCAicHRwX3JlZiIsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgInR4IiwgImd0eCI7Cj4+ICsgICAgICAgIHJlc2V0cyA9IDwmcnN0IDE+LCA8JnJzdCAyPjsK
Pj4gKyAgICAgICAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIiwgImFoYiI7Cj4+ICsgICAgICAg
IGludGVycnVwdHMgPSA8Nz4sIDw2PiwgPDU+Owo+PiArICAgICAgICBpbnRlcnJ1cHQtbmFtZXMg
PSAibWFjaXJxIiwgImV0aF93YWtlX2lycSIsICJldGhfbHBpIjsKPj4gKyAgICAgICAgcGh5LW1v
ZGUgPSAicmdtaWktaWQiOwo+PiArICAgICAgICBzbnBzLG11bHRpY2FzdC1maWx0ZXItYmlucyA9
IDw2ND47Cj4+ICsgICAgICAgIHNucHMscGVyZmVjdC1maWx0ZXItZW50cmllcyA9IDw4PjsKPj4g
KyAgICAgICAgcngtZmlmby1kZXB0aCA9IDwyMDQ4PjsKPj4gKyAgICAgICAgdHgtZmlmby1kZXB0
aCA9IDwyMDQ4PjsKPj4gKyAgICAgICAgc25wcyxmaXhlZC1idXJzdDsKPj4gKyAgICAgICAgc25w
cyxuby1wYmwteDg7Cj4+ICsgICAgICAgIHNucHMsdHNvOwo+PiArICAgICAgICBzbnBzLGZvcmNl
X3RocmVzaF9kbWFfbW9kZTsKPj4gKyAgICAgICAgc25wcyxheGktY29uZmlnID0gPCZzdG1tYWNf
YXhpX3NldHVwPjsKPj4gKyAgICAgICAgc25wcyxlbi10eC1scGktY2xvY2tnYXRpbmc7Cj4+ICsg
ICAgICAgIHNucHMsdHhwYmwgPSA8MTY+Owo+PiArICAgICAgICBzbnBzLHJ4cGJsID0gPDE2PjsK
Pj4gKyAgICAgICAgcGh5LWhhbmRsZSA9IDwmcGh5MD47Cj4+ICsKPj4gKyAgICAgICAgbWRpbyB7
Cj4+ICsgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gKyAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDA+Owo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFj
LW1kaW8iOwo+PiArCj4+ICsgICAgICAgICAgICBwaHkwOiBldGhlcm5ldC1waHlAMCB7Cj4+ICsg
ICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+PiArICAgICAgICAgICAgfTsKPj4gKyAgICAgICAg
fTsKPj4gKwo+PiArICAgICAgICBzdG1tYWNfYXhpX3NldHVwOiBzdG1tYWMtYXhpLWNvbmZpZyB7
Cj4+ICsgICAgICAgICAgICBzbnBzLGxwaV9lbjsKPj4gKyAgICAgICAgICAgIHNucHMsd3Jfb3Ny
X2xtdCA9IDw0PjsKPj4gKyAgICAgICAgICAgIHNucHMscmRfb3NyX2xtdCA9IDw0PjsKPj4gKyAg
ICAgICAgICAgIHNucHMsYmxlbiA9IDwyNTYgMTI4IDY0IDMyIDAgMCAwPjsKPj4gKyAgICAgICAg
fTsKPj4gKyAgICB9Owo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+
PiBpbmRleCA1YzY3Yzc1YTk0MGYuLjRlMjM2YjdjN2ZkMiAxMDA2NDQKPj4gLS0tIGEvTUFJTlRB
SU5FUlMKPj4gKysrIGIvTUFJTlRBSU5FUlMKPj4gQEAgLTE5OTEyLDYgKzE5OTEyLDEyIEBAIE06
CUVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4+ICBTOglNYWludGFpbmVk
Cj4+ICBGOglhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlLwo+PiAgCj4+ICtTVEFSRklWRSBE
V01BQyBHTFVFIExBWUVSCj4+ICtNOglFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWls
LmRrPgo+PiArTToJU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPj4gK1M6
CU1haW50YWluZWQKPj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
c3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKPj4gKwo+PiAgU1RBUkZJVkUgSkg3MVgwIENMT0NL
IERSSVZFUlMKPj4gIE06CUVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4+
ICBNOglIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gLS0gCj4+IDIuMTcu
MQo+PgoKLS0gCkJlc3QgcmVnYXJkcywKU2FtaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
