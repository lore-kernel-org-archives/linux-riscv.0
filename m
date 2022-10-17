Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55BAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 21:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/iSsxjgMN6R4O177haUfJ5jfTpxXeqIge4q6edufHs=; b=Wu0OpJYi0WW6zf
	dxQYIYFopAnkVLz7s9VHuFw1Ibpp8S6GXPvBERzEz1/VYKB3PydNQObMRl3hLwf8+PEdKCGnJHH/P
	BcOJnYRAcEd23UBAFPCgPLbl+8/UJYY42Y12LalAo92KwmxNCQnLPuyk0Xi0gndDNeHOF5Tn2/pAo
	nBTeTFmGpOG59x59pgfd1QcNxXfyABQunm81I7+ks6XimgNf0aQTHSkVsFcAc71z8j454WYHrwOmr
	tu9xmJY3IZuV6jwF/Itz2NL8GmJpAlDepQPyVMkxOopK4VgJ2gCNETtaM59Cv2c4KYMBAy5P/MQ9u
	bJ5RxbZF6HMP0yoF4EVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXRj-00EyCa-2g; Mon, 17 Oct 2022 21:14:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXRg-00EyBW-1T
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 21:14:49 +0000
Received: from [192.168.1.90] (unknown [188.24.131.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC7E5660229A;
	Mon, 17 Oct 2022 22:14:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666041286;
	bh=6GOLhrGgwzzH00fPL4O2mqsIa2iWSLJ77uzRHsOFl1M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JTij1qwJSLzBeIh9AbGxEE9TNM+2LfslXZn1Jn6rJvwuL2AwhYURIRPVwSoxp6N5y
	 l5AZ4qDyXQM0y9SSVocWKPee1K82qfmr/+6aZ5HS5H+FukhdmRDQyv8Z66HEjia51z
	 fRbizNOGffkXtqXIduVTbxMZ2MKLhUyIKXDrd6Hkrj8ED8XsYjVPRutVs1zfLnVpHi
	 pIAwJIux1mhqRcGY0wDN7lMRuPi7aY5QFdbK2SIlmr7X6x85RxVN4rkkh0DMK+/Qud
	 tB7HLipYUCajr8lqssz+Xnz0pqZSlVZDcnj3hoUwOMo6gFKUP58+LJSy0t6Mb5kxwr
	 Puc9RH4ggpV6w==
Message-ID: <fd259c32-6a9d-7ab5-2172-3f2fe947ebfe@collabora.com>
Date: Tue, 18 Oct 2022 00:14:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
 <c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com> <YzwCWDN4NyIQ8a46@wendy>
 <b1139318-b87e-b257-28ba-e2b0c7596053@collabora.com>
In-Reply-To: <b1139318-b87e-b257-28ba-e2b0c7596053@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_141448_227322_DE2FA14F 
X-CRM114-Status: GOOD (  18.05  )
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

T24gMTAvNC8yMiAxMzoxNSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgo+IE9uIDEwLzQvMjIg
MTI6NTIsIENvbm9yIERvb2xleSB3cm90ZToKPj4gT24gTW9uLCBPY3QgMDMsIDIwMjIgYXQgMDI6
MDY6MzJQTSArMDMwMCwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgo+Pj4gUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgbWlzc2luZyBpbiBvcmRlciB0byBnZXQg
Cj4+PiB0aGlzCj4+PiBxdWV1ZWQgZm9yIG1lcmdpbmcuCj4+Cj4+IEhleSBDcmlzdGlhbiwKPj4K
Pj4gTGludXNXIGhhcyBhcHBsaWVkIGEgY29uZmxpY3RpbmcgY2hhbmdlIGZvciA2LjEgYXMgaGUg
cmVuYW1lZCB0aGUKPj4gcGluY3RybCBoZWFkZXIgdGhhdCB5b3UgaGF2ZSBtb3ZlZCBmcm9tIG9u
ZSBmaWxlIHRvIGFub3RoZXIgaW4gdGhpcwo+PiBwYXRjaCBbMF0uIENvdWxkIHlvdSByZWJhc2Ug
b25jZSB0aGF0IGxhbmRzIHVwc3RyZWFtIHBsZWFzZT8KPiAKPiBIaSBDb25vciwKPiAKPiBTdXJl
LCBJIHdpbGwgcmViYXNlIGFzIHNvb24gYXMgcmMxIGlzIG91dC4KCkkgaGF2ZSBzdWJtaXR0ZWQg
djQ6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEwMTcyMTA1NDIuOTc5MDUxLTEt
Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20vCgo+IFRoYW5rcywKPiBDcmlzdGlhbgo+
IAo+Pgo+PiBUaGFua3MsCj4+IENvbm9yLgo+Pgo+PiAwIC0gCj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJpc2N2L0NBQ1Jwa2RabW1NalZ3cEh4a0pQK1VpMFhKZ3JkWng4a3BWeWJp
ZmJ3a1JCMV91TWhBZ0BtYWlsLmdtYWlsLmNvbS8KPj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBDcmlz
dGlhbgo+Pj4KPj4+IE9uIDkvOC8yMiAxNzoyOSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgo+
Pj4+IFRoZSBTdGFyRml2ZSBWaXNpb25GaXZlIFYxIFNCQyBbMV0gaXMgc2ltaWxhciB3aXRoIHRo
ZSBhbHJlYWR5IAo+Pj4+IHN1cHBvcnRlZAo+Pj4+IEJlYWdsZVYgU3RhcmxpZ2h0IEJldGEgYm9h
cmQsIGJvdGggYmVpbmcgYmFzZWQgb24gdGhlIFN0YXJGaXZlIAo+Pj4+IEpINzEwMCBTb0MuCj4+
Pj4KPj4+PiBJbiBhZGRpdGlvbiB0byBkb2N1bWVudGluZyB0aGUgbmVjZXNzYXJ5IGNvbXBhdGli
bGVzLCB0aGlzIHBhdGNoIHNlcmllcwo+Pj4+IG1vdmVzIG1vc3Qgb2YgdGhlIGNvbnRlbnQgZnJv
bSBqaDcxMDAtYmVhZ2xldi1zdGFybGlnaHQuZHRzIHRvIGEgbmV3IAo+Pj4+IGZpbGUKPj4+PiBq
aDcxMDAtY29tbW9uLmR0c2ksIHRvIGJlIHNoYXJlZCBiZXR3ZWVuIHRoZSB0d28gYm9hcmRzLgo+
Pj4+Cj4+Pj4gTm8gb3RoZXIgY2hhbmdlcyBhcmUgcmVxdWlyZWQgaW4gb3JkZXIgdG8gc3VjY2Vz
c2Z1bGx5IGJvb3QgdGhlIGJvYXJkLgo+Pj4+Cj4+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9z
dGFyZml2ZS10ZWNoL1Zpc2lvbkZpdmUKPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjM6Cj4+Pj4gwqDC
oCAtIEFkZGVkIFJldmlld2VkLWJ5IHRhZyBmcm9tIEtyenlzenRvZiBpbiBwYXRjaCAxLzMKPj4+
PiDCoMKgIC0gT3B0aW1pemVkIHBhdGNoIDIvMyBieSBlbmFibGluZyBjb3B5IGRldGVjdGlvbiBv
biAiZ2l0IAo+Pj4+IGZvcm1hdC1wYXRjaCIsCj4+Pj4gwqDCoMKgwqAgYXMgaW5kaWNhdGVkIGJ5
IEtyenlzenRvZgo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+PiDCoMKgIC0gU2ltcGxpZmll
ZCBkb2N1bWVudGF0aW9uIGJ5IHVzaW5nICdlbnVtJyBpbnN0ZWFkIG9mICdjb25zdCcgaW4KPj4+
PiDCoMKgwqDCoCBwYXRjaCAxLzMsIGFjY29yZGluZyB0byBDb25vcidzIHJldmlldwo+Pj4+IMKg
wqAgLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWdzIGZyb20gQ29ub3IKPj4+Pgo+Pj4+IENyaXN0aWFu
IENpb2NhbHRlYSAoMyk6Cj4+Pj4gwqDCoMKgIGR0LWJpbmRpbmdzOiByaXNjdjogc3RhcmZpdmU6
IEFkZCBTdGFyRml2ZSBWaXNpb25GaXZlIFYxIGJvYXJkCj4+Pj4gwqDCoMKgIHJpc2N2OiBkdHM6
IHN0YXJmaXZlOiBBZGQgY29tbW9uIERUIGZvciBKSDcxMDAgYmFzZWQgYm9hcmRzCj4+Pj4gwqDC
oMKgIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBBZGQgU3RhckZpdmUgVmlzaW9uRml2ZSBWMSBkZXZp
Y2UgdHJlZQo+Pj4+Cj4+Pj4gwqDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zdGFy
Zml2ZS55YW1swqDCoCB8wqDCoCA0ICstCj4+Pj4gwqDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+Pj4gwqDCoCAuLi4v
ZHRzL3N0YXJmaXZlL2poNzEwMC1iZWFnbGV2LXN0YXJsaWdodC5kdHMgfCAxNTMgCj4+Pj4gKy0t
LS0tLS0tLS0tLS0tLS0tCj4+Pj4gwqDCoCAuLi5hZ2xldi1zdGFybGlnaHQuZHRzID0+IGpoNzEw
MC1jb21tb24uZHRzaX0gfMKgwqAgMyAtCj4+Pj4gwqDCoCAuLi4vamg3MTAwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtdjEuZHRzwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjAgKysrCj4+Pj4gwqDCoCA1IGZp
bGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE1NyBkZWxldGlvbnMoLSkKPj4+PiDCoMKg
IGNvcHkgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS97amg3MTAwLWJlYWdsZXYtc3Rhcmxp
Z2h0LmR0cyAKPj4+PiA9PiBqaDcxMDAtY29tbW9uLmR0c2l9ICg5NiUpCj4+Pj4gwqDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgCj4+Pj4gYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAt
c3RhcmZpdmUtdmlzaW9uZml2ZS12MS5kdHMKPj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
