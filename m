Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD3D2E01F
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMZyyGcmPrgqZlP4Ke2xhS7miDiN+dnX0zswtafM5ZI=; b=iXkqqT7i8Hy//k
	X5mAg61bEe0iOz6cx7hlNjMf6ek7f7F9ULd7jduWf7NmAKl8GhqNR0sY8LKjJzVZUs0Y/hihke0f3
	44mHDIzTuYoQbuqKPWLhhJHzJVaZHkY6g8daHVLtsTr89x3169CO5rcQc1nqyKOZA1vHueXuChAc3
	FS6TNALa+2cxo8lXwlEBefZni/M3MMIjJJzwZNT+hnyFdbL39BmqEAiflCf0vav1LS6i8r2eDHLan
	x1YN8bzed2PlNBKtW3OqiyZfWMJtpEvHTNsXDPgllwaLMBAsYFFFomDkx/gvsR9mjO+Wg3otAh7Ir
	R2KuhjSZOxY178mMGYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQHk-00000009AHQ-2NuL;
	Fri, 05 Dec 2025 07:31:24 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQHh-00000009AGq-0wfT
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 07:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764919826;
	bh=dPQlBy9bP0uCp0f8xzuAly/jIN+QVZE/QzkPoToIR0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BQLgiN4Ypn2XIuJBDBsG2T95NfTpHXAXZ8y3aKRybJyBqGzRN48aVWiznrV/zv5LG
	 z2BpmPfG/q+518F2XXyvzde0huclOLz1gawF5QUXjxVA720eaaeM5nUYn/eyifBzo4
	 JzNonO70XQwv8rui2bPZ+DbFjNqjZaFuEYmO7/OfnD0qcXx7+BzvzcqU0ODsU/gTG1
	 qYXtChTpkIIoYMDyY+gg7L9s1F33GAiP+HctzWXHui7Dqg5FNGkJlDuGKwhUOJPOT7
	 v90yiVQYEK4j/bMdK2lJhck9G+yNBZPlu3OLRcHcg1cMiqVCaqK0MSPuTtHFq2IEDy
	 SAhzdGF6W50LA==
Received: from [192.168.2.54] (unknown [98.97.27.25])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A331FB220603;
	Fri,  5 Dec 2025 08:30:21 +0100 (CET)
Message-ID: <72318f65-a360-4be0-baee-7f94b7cbf949@freeshell.de>
Date: Thu, 4 Dec 2025 23:30:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
To: Maud Spierings <maud_spierings@hotmail.com>, linux.amoon@gmail.com
Cc: aou@eecs.berkeley.edu, bhelgaas@google.com, broonie@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, hal.feng@starfivetech.com,
 heinrich.schuchardt@canonical.com, krzk+dt@kernel.org,
 kwilczynski@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 rafael@kernel.org, robh@kernel.org, viresh.kumar@linaro.org,
 sandie.cao@deepcomputing.io
References: <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
 <AM7P189MB1009B900894F02496519B2F4E3A7A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <AM7P189MB1009B900894F02496519B2F4E3A7A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_233121_762278_693710D0 
X-CRM114-Status: GOOD (  19.45  )
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

CgpPbiAxMi80LzI1IDIzOjIzLCBNYXVkIFNwaWVyaW5ncyB3cm90ZToKPj4KPj4gSGkgSGFsLAo+
Pgo+PiBPbiBUdWUsIDI1IE5vdiAyMDI1IGF0IDEzOjI3LCBIYWwgRmVuZyA8aGFsLmZlbmdAc3Rh
cmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gQWRkIGEgY29tbW9uIGJvYXJkIGR0c2kgZm9y
IHVzZSBieSBWaXNpb25GaXZlIDIgTGl0ZSBhbmQKPj4+IFZpc2lvbkZpdmUgMiBMaXRlIGVNTUMu
Cj4+Pgo+Pj4gQWNrZWQtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0
aGluZ0BjYW5vbmljYWwuY29tPgo+Pj4gVGVzdGVkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFy
Zml2ZXRlY2guY29tPgo+Pj4gLS0tCj4+PiDCoC4uLi9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2
ZS0yLWxpdGUuZHRzacKgwqDCoCB8IDE2MSArKysrKysrKysrKysrKysrKysKPj4+IMKgMSBmaWxl
IGNoYW5nZWQsIDE2MSBpbnNlcnRpb25zKCspCj4+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS0KPj4+IHZpc2lvbmZpdmUt
Mi1saXRlLmR0c2kKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtc3RhcmZpdmUtCj4+PiB2aXNpb25maXZlLTItbGl0ZS5kdHNpIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtCj4+PiBzdGFyZml2ZS12aXNpb25maXZlLTIt
bGl0ZS5kdHNpCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5mODc5N2E2NjZkYmYKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi0KPj4+IGxpdGUuZHRz
aQo+Pj4gQEAgLTAsMCArMSwxNjEgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCBPUiBNSVQKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBTdGFyRml2
ZSBUZWNobm9sb2d5IENvLiwgTHRkLgo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBIYWwgRmVu
ZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+ICsgKi8KPj4+ICsKPj4+ICsvZHRzLXYx
LzsKPj4+ICsjaW5jbHVkZSAiamg3MTEwLWNvbW1vbi5kdHNpIgo+Pj4gKwo+Pj4gKy8gewo+Pj4g
K8KgwqDCoMKgwqDCoCB2Y2NfM3YzX3BjaWU6IHJlZ3VsYXRvci12Y2MtM3YzLXBjaWUgewo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4
ZWQiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWFjdGl2ZS1oaWdo
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3BpbyA9IDwmc3lzZ3BpbyAyNyBH
UElPX0FDVElWRV9ISUdIPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZ3Vs
YXRvci1uYW1lID0gInZjY18zdjNfcGNpZSI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+
Pj4gK8KgwqDCoMKgwqDCoCB9Owo+Pj4gK307Cj4+Cj4+IFRoZSB2Y2NfM3YzX3BjaWUgcmVndWxh
dG9yIG5vZGUgaXMgY29tbW9uIHRvIGFsbCBKSDcxMTAgZGV2ZWxvcG1lbnQKPj4gYm9hcmRzLgo+
PiBhbmQgaXQgaXMgZW5hYmxlZCB0aHJvdWdoIHRoZSBQV1JFTl9IIHNpZ25hbCAoUENJRTBfUFdS
RU5fSF9HUElPMzIpLgo+Pgo+PiBWaXNpb25GaXZlIDIgUHJvZHVjdCBEZXNpZ24gU2NoZW1hdGlj
cyBiZWxvdwo+PiBbMV0gaHR0cHM6Ly9kb2MtZW4ucnZzcGFjZS5vcmcvVmlzaW9uRml2ZTIvUERG
Lwo+PiBTQ0hfUlYwMDJfVjEuMkFfMjAyMjEyMTYucGRmCj4+Cj4+IE1hcnNfSGFyZHdhcmVfU2No
ZW1hdGljcwo+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL21pbGt2LW1hcnMvbWFycy1maWxlcy9i
bG9iL21haW4vCj4+IE1hcnNfSGFyZHdhcmVfU2NoZW1hdGljcy9NaWxrLVZfTWFyc19TQ0hfVjEu
MjFfMjAyNC0wNTEwLnBkZgo+Pgo+IAo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIGFsc28gaG9sZHMg
dHJ1ZSBmb3IgdGhlIGRlZXBjb21wdXRpbmcgZm1sMTN2MDEsCj4gc2FkbHkgYXMgZmFyIGFzIEkg
a25vdyB0aGVyZSBpcyBubyBzY2hlbWF0aWNzIGF2YWlsYWJsZSBmb3IgdGhhdC4KPiAKPiB0aGUg
ZG93bnN0cmVhbSBkdHMgWzNdIGRvZXNuJ3QgY29udGFpbiBhbnkgZXZpZGVuY2Ugb2YgaXQsIG5l
aXRoZXIgZG9lcwo+IHVwc3RyZWFtLgo+IAo+IEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIGl0
IGlzIHRoZXJlIGJ1dCBqdXN0IG5vdCBwcmVzZW50IGluIHRoZSBkdHMsCj4gYnV0IGl0IG1heSBi
ZSBuaWNlIHRvIGdldCBzb21lIGZlZWRiYWNrIGZyb20gc29tZW9uZSBhdCBkZWVwY29tcHV0aW5n
Lgo+IAo+IGFkZGluZyBTYW5kaWUgQ2FvIHdobyBkaWQgc29tZSBvZiB0aGUgdXBzdHJlYW1pbmcg
d29yay4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vREMtRGVlcENvbXB1dGluZy9mbWwx
M3YwMS1saW51eC8KPiBibG9iLzk3YzY0ZmUyODMyYjY4MjY5MTRiNmRhN2FhNGZlYmNkZDRkM2Q0
NDQvYXJjaC9yaXNjdi9ib290L2R0cy8KPiBzdGFyZml2ZS9qaDcxMTAtZGVlcGNvbXB1dGluZy1m
bWwxM3YwMS5kdHMjTDQxNi1MNDMyIFszXQo+IAo+IGtpbmQgcmVnYXJkcywKPiBNYXVkCj4gCgpJ
IGFza2VkICh0byBEZWVwQ29tcHV0aW5nIHNhbGVzIGUtbWFpbCBhZGRyZXNzKSBmb3Igc2NoZW1h
dGljcyAyOHRoIEp1bHkKMjAyNSwgdGhlIHJlcGx5IHdhcyAiVGhlcmUgaXMgbm8gcGxhbiB0byBw
dWJsaWMgaXQgYnkgbm93LiIgSSBhbHNvIGdvdApzb21lIGdlbmVyaWMgcmVzcG9uc2Ugd2hlbiBJ
IGFza2VkIGEgdGVjaG5pY2FsIHF1ZXN0aW9uIGFib3V0IFJHUElPMwpjb25uZWN0aW9uIHRvIGxv
b2sgYXQgdGhlIERlZXBDb21wdXRpbmcgcmVwbyBvbiBnaXRodWIuCgpObyBzY2hlbWF0aWNzIGFu
ZCBubyBoZWxwIHRvIGRldmVsb3BlcnMuCgotRQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
