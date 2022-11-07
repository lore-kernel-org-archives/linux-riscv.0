Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaNMfOJ1WFBplNnldbf5uxTi/TH/4FLWqPmdpsbqvog=; b=bCriikBaxUHv7o
	31tFVxs8fWCsGq87ADSUcE9g1ZQ6ao1zr78e0Wqyvhxmu8xArPrLFxlZ+BVofhoXLLhE27b5eMrgk
	RxCfoZCx83LSsAXkBDyedA10v0MCft+zkx2rH2ev7lAmHmo3D5V44wiHFycfin/DCKq1PMV0WiOry
	wohIOut7FXd1DHa10gRapKAi7k+YHjdKLmGoNh2RbjQFwMeb298fSEJ2VP9MSpXe+mFbuP5ccHvnV
	gn1u6OO55v7wJf9A9GO0sT6W4g1Oo6CAnv9anTnqfJh6XPok3F+nhGX+mnybSoO+gkorQHpVSDjkp
	cEr1eLKgo8+pb1MiD9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9r8-000hSn-M7; Mon, 07 Nov 2022 21:40:34 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9r4-000gof-6u
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 21:40:33 +0000
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 21C5A41200;
	Mon,  7 Nov 2022 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received
	:received:received; s=mta-01; t=1667857222; x=1669671623; bh=esC
	ycxrxvZxM5Pm8Ikehw6aoj6hzkD7c5GQWfXbXSNI=; b=SnrTOZE/hAkiqhNhe/8
	zC5CBOXk+n5d9doal91SEURgpbzKMZ4f7GzTT1rcOPDqSg2CmhPfN9VWNOKeaw1E
	qRxvKsA57Ze0ThAJH+KuH/8VltvA4I73AOTYr++3oMJU1chjoar5uhUoR9dSfA4k
	n96iTB9CnNh4dHcG8n4CNLAo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8uoBLs-ZLt2; Tue,  8 Nov 2022 00:40:22 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 4B5A2411FB;
	Tue,  8 Nov 2022 00:40:20 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 8 Nov 2022 00:40:21 +0300
Received: from [10.199.21.212] (10.199.21.212) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 8 Nov 2022
 00:40:20 +0300
Message-ID: <497c057d-4e7d-0dcb-fd4c-2c7ef6efb573@yadro.com>
Date: Tue, 8 Nov 2022 00:40:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1] riscv: fix reserved memory setup
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt
	<palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daire McNamara <daire.mcnamara@microchip.com>, "Anup
 Patel" <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, "Nick
 Kossifidis" <mick@ics.forth.gr>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>
References: <20221107151524.3941467-1-conor.dooley@microchip.com>
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <20221107151524.3941467-1-conor.dooley@microchip.com>
X-Originating-IP: [10.199.21.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_134030_969865_30957B2F 
X-CRM114-Status: GOOD (  29.72  )
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

SGksCgpPbiAwNy4xMS4yMDIyIDE4OjE1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gwqvQktC90LjQ
vNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/QuNGB0YzQvNC+INC+0YIg0LLQvdC10YjQvdC10LPQ
viDQsNC00YDQtdGB0LDRgtCwIcK7Cj4gCj4gQ3VycmVudGx5LCBSSVNDLVYgc2V0cyB1cCByZXNl
cnZlZCBtZW1vcnkgdXNpbmcgdGhlICJlYXJseSIgY29weSBvZiB0aGUKPiBkZXZpY2UgdHJlZS4g
QXMgYSByZXN1bHQsIHdoZW4gdHJ5aW5nIHRvIGdldCBhIHJlc2VydmVkIG1lbW9yeSByZWdpb24K
PiB1c2luZyBvZl9yZXNlcnZlZF9tZW1fbG9va3VwKCksIHRoZSBwb2ludGVyIHRvIHJlc2VydmVk
IG1lbW9yeSByZWdpb25zCj4gaXMgdXNpbmcgdGhlIGVhcmx5LCBwcmUtdmlydHVhbC1tZW1vcnkg
YWRkcmVzcyB3aGljaCBjYXVzZXMgYSBrZXJuZWwKPiBwYW5pYyB3aGVuIHRyeWluZyB0byB1c2Ug
dGhlIGJ1ZmZlcidzIG5hbWU6Cj4gCj4gICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcg
cmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDA0MDFjMzFhYwo+ICAgT29wcyBbIzFd
Cj4gICBNb2R1bGVzIGxpbmtlZCBpbjoKPiAgIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlciBO
b3QgdGFpbnRlZCA2LjAuMC1yYzEtMDAwMDEtZzBkOWQ2OTUzZDgzNCAjMQo+ICAgSGFyZHdhcmUg
bmFtZTogTWljcm9jaGlwIFBvbGFyRmlyZS1Tb0MgSWNpY2xlIEtpdCAoRFQpCj4gICBlcGMgOiBz
dHJpbmcrMHg0YS8weGVhCj4gICAgcmEgOiB2c25wcmludGYrMHgxZTQvMHgzMzYKPiAgIGVwYyA6
IGZmZmZmZmZmODAzMzVlYTAgcmEgOiBmZmZmZmZmZjgwMzM4OTM2IHNwIDogZmZmZmZmZmY4MTIw
M2JlMAo+ICAgIGdwIDogZmZmZmZmZmY4MTJlMGE5OCB0cCA6IGZmZmZmZmZmODEyMGRlNDAgdDAg
OiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgdDEgOiBmZmZmZmZmZjgxMjAzZTI4IHQyIDogNzI2NTcz
NjU3MjIwM2E0NiBzMCA6IGZmZmZmZmZmODEyMDNjMjAKPiAgICBzMSA6IGZmZmZmZmZmODEyMDNl
MjggYTAgOiBmZmZmZmZmZjgxMjAzZDIyIGExIDogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIGEyIDog
ZmZmZmZmZmY4MTIwM2QwOCBhMyA6IDAwMDAwMDAwODEyMDNkMjEgYTQgOiBmZmZmZmZmZmZmZmZm
ZmZmCj4gICAgYTUgOiAwMDAwMDAwMDQwMWMzMWFjIGE2IDogZmZmZjBhMDBmZmZmZmYwNCBhNyA6
IGZmZmZmZmZmZmZmZmZmZmYKPiAgICBzMiA6IGZmZmZmZmZmODEyMDNkMDggczMgOiBmZmZmZmZm
ZjgxMjAzZDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwOAo+ICAgIHM1IDogZmZmZmZmZmYwMDAwMDBm
ZiBzNiA6IDAwMDAwMDAwMDBmZmZmZmYgczcgOiAwMDAwMDAwMGZmZmZmZjAwCj4gICAgczggOiBm
ZmZmZmZmZjgwZDk4MjFhIHM5IDogZmZmZmZmZmY4MTIwM2QyMiBzMTA6IDAwMDAwMDAwMDAwMDAw
MDIKPiAgICBzMTE6IGZmZmZmZmZmODBkOTgyMWMgdDMgOiBmZmZmZmZmZjgxMmYzNjE3IHQ0IDog
ZmZmZmZmZmY4MTJmMzYxNwo+ICAgIHQ1IDogZmZmZmZmZmY4MTJmMzYxOCB0NiA6IGZmZmZmZmZm
ODEyMDNkMDgKPiAgIHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDQw
MWMzMWFjIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4gICBbPGZmZmZmZmZmODAzMzg5MzY+XSB2
c25wcmludGYrMHgxZTQvMHgzMzYKPiAgIFs8ZmZmZmZmZmY4MDA1NWFlMj5dIHZwcmludGtfc3Rv
cmUrMHhmNi8weDM0NAo+ICAgWzxmZmZmZmZmZjgwMDU1ZDg2Pl0gdnByaW50a19lbWl0KzB4NTYv
MHgxOTIKPiAgIFs8ZmZmZmZmZmY4MDA1NWVkOD5dIHZwcmludGtfZGVmYXVsdCsweDE2LzB4MWUK
PiAgIFs8ZmZmZmZmZmY4MDA1NjNkMj5dIHZwcmludGsrMHg3Mi8weDgwCj4gICBbPGZmZmZmZmZm
ODA2ODEzYjI+XSBfcHJpbnRrKzB4MzYvMHg1MAo+ICAgWzxmZmZmZmZmZjgwNjhhZjQ4Pl0gcHJp
bnRfcmVzZXJ2ZWRfbWVtKzB4MWMvMHgyNAo+ICAgWzxmZmZmZmZmZjgwODA1N2VjPl0gcGFnaW5n
X2luaXQrMHg1MjgvMHg1YmMKPiAgIFs8ZmZmZmZmZmY4MDgwMzFhZT5dIHNldHVwX2FyY2grMHhk
MC8weDU5Mgo+ICAgWzxmZmZmZmZmZjgwODAwNzBlPl0gc3RhcnRfa2VybmVsKzB4ODIvMHg3M2MK
PiAKPiBlYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpIHRha2VzIG5vIGFyZ3VtZW50
cyBhcyBpdCBvcGVyYXRlcyBvbgo+IGluaXRpYWxfYm9vdF9wYXJhbXMsIHdoaWNoIGlzIHBvcHVs
YXRlZCBieSBlYXJseV9pbml0X2R0X3ZlcmlmeSgpLiBPbgo+IFJJU0MtViwgZWFybHlfaW5pdF9k
dF92ZXJpZnkoKSBpcyBjYWxsZWQgdHdpY2UuIE9uY2UsIGRpcmVjdGx5LCBpbgo+IHNldHVwX2Fy
Y2goKSBpZiBDT05GSUdfQlVJTFRJTl9EVEIgaXMgbm90IGVuYWJsZWQgYW5kIG9uY2UgaW5kaXJl
Y3RseSwKPiB2ZXJ5IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MsIGJ5IHBhcnNlX2R0YigpIHdo
ZW4gaXQgY2FsbHMKPiBlYXJseV9pbml0X2R0X3NjYW5fbm9kZXMoKS4KPiAKPiBUaGlzIGZpcnN0
IGNhbGwgdXNlcyBkdGJfZWFybHlfdmEgdG8gc2V0IGluaXRpYWxfYm9vdF9wYXJhbXMsIHdoaWNo
IGlzCj4gbm90IHVzYWJsZSBsYXRlciBpbiB0aGUgYm9vdCBwcm9jZXNzIHdoZW4KPiBlYXJseV9p
bml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpIGlzIGNhbGxlZC4gT24gYXJtNjQgZm9yIGV4YW1w
bGUsIHRoZQo+IGNvcnJlc3BvbmRpbmcgY2FsbCB0byBlYXJseV9pbml0X2R0X3NjYW5fbm9kZXMo
KSB1c2VzIGZpeG1hcCBhZGRyZXNzZXMKPiBhbmQgZG9lc24ndCBzdWZmZXIgdGhlIHNhbWUgZmF0
ZS4KClRoYW5rIHlvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMhCgpBcyBJIHdyb3RlIGVhcmxpZXIs
IEkgcmFuIGludG8gdGhpcyBpc3N1ZSB0b28sIHdoaWxlIHdvcmtpbmcgb24gYSAKcmVtb3RlcHJv
YyBkcml2ZXIgZm9yIG91ciBSSVNDLVYtYmFzZWQgU29DLgoKVGhlIHByb3Bvc2VkIHBhdGNoIGZp
eGVzIHRoZSBidWcgZm9yIG1lIGFuZCBzZWVtcyB0byBoYXZlIG5vIHByb2JsZW1hdGljIApzaWRl
LWVmZmVjdHMuIFNvOgoKVGVzdGVkLWJ5OiBFdmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5A
eWFkcm8uY29tPgoKPiAKPiBNb3ZlIGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkg
ZnVydGhlciBhbG9uZyB0aGUgYm9vdCBzZXF1ZW5jZSwKPiBhZnRlciB0aGUgZGlyZWN0IGNhbGwg
dG8gZWFybHlfaW5pdF9kdF92ZXJpZnkoKSBpbiBzZXR1cF9hcmNoKCkgc28gdGhhdAo+IHRoZSBu
YW1lcyB1c2UgdGhlIGNvcnJlY3QgdmlydHVhbCBtZW1vcnkgYWRkcmVzc2VzLiBUaGUgYWJvdmUg
c3VwcG9zZWQKPiB0aGF0IENPTkZJR19CVUlMVElOX0RUQiB3YXMgbm90IHNldCwgYnV0IHNob3Vs
ZCB3b3JrIGVxdWFsbHkgaW4gdGhlIGNhc2UKPiB3aGVyZSBpdCBpcyAtIHVuZmxhdHRlZF9hbmRf
Y29weV9kZXZpY2VfdHJlZSgpIGFsc28gdXBkYXRlcwo+IGluaXRpYWxfYm9vdF9wYXJhbXMuCj4g
Cj4gUmVwb3J0ZWQtYnk6IFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5kZXph
bGFuaXNAbWljcm9jaGlwLmNvbT4KPiBSZXBvcnRlZC1ieTogRXZnZW5paSBTaGF0b2toaW4gPGUu
c2hhdG9raGluQHlhZHJvLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi9mOGU2N2Y4Mi0xMDNkLTE1NmMtZGViMC1kNmQ2ZTI3NTZmNWVAbWljcm9jaGlwLmNv
bS8KPiBGaXhlczogOTIyYjAzNzVmYzkzICgicmlzY3Y6IEZpeCBtZW1ibG9jayByZXNlcnZhdGlv
biBmb3IgZGV2aWNlIHRyZWUgYmxvYiIpCj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMgfCAxICsKPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgfCAxIC0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMK
PiBpbmRleCBhZDc2YmI1OWIwNTkuLjY3ZWMxZmFkY2ZlMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IEBA
IC0yODMsNiArMjgzLDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9w
KQo+ICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgIHByX2VycigiTm8gRFRCIGZvdW5k
IGluIGtlcm5lbCBtYXBwaW5nc1xuIik7Cj4gICAjZW5kaWYKPiArICAgICAgIGVhcmx5X2luaXRf
ZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7Cj4gICAgICAgICAgbWlzY19tZW1faW5pdCgpOwo+IAo+
ICAgICAgICAgIGluaXRfcmVzb3VyY2VzKCk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0v
aW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCBiNTZhMGE3NTUzM2YuLjUwYTFi
NmVkZDQ5MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gQEAgLTI2Miw3ICsyNjIsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXBfYm9vdG1lbSh2b2lkKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19y
ZXNlcnZlKGR0Yl9lYXJseV9wYSwgZmR0X3RvdGFsc2l6ZShkdGJfZWFybHlfdmEpKTsKPiAgICAg
ICAgICB9Cj4gCj4gLSAgICAgICBlYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpOwo+
ICAgICAgICAgIGRtYV9jb250aWd1b3VzX3Jlc2VydmUoZG1hMzJfcGh5c19saW1pdCk7Cj4gICAg
ICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkKPiAgICAgICAgICAgICAgICAgIGh1
Z2V0bGJfY21hX3Jlc2VydmUoUFVEX1NISUZUIC0gUEFHRV9TSElGVCk7Cj4gLS0KPiAyLjM4LjAK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
