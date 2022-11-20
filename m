Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87867C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlAHhMS/3OnDETiFMstPwWvtJKnmrH8H6z+JiqkFKng=; b=NTxkHlEiSGo27+
	Miyj8gH/+STph2MDL6hnHvCI351W8iT6TXMA+uxD/TlM7bp3zOqU/wy9sxZGWASE7j15B55J7eV8P
	QcpawLTcuP87X54OydFdeS3Kz+AbgomYgiQVVo68nnKRw0ibJBVfj9HbZNuF7H33Hdu8xxRdQ0wu+
	QmmgCespLmEt0ZEnc9eqw5g8Em63CgWkPF1Tq5PGSb66RawPZZIzKjMwUDjLeP5G/3M+hpLajPSeA
	C+XLNbcZSm4TuD9Ic7XZ00fjuR+7PwLYNKzgvGxs318HvBcX3eIrYSON96H7QrAsAdCuz5EX5wfi/
	J/kQwrE5ISnouGZTBIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiwu-0048UE-0b; Sun, 20 Nov 2022 11:57:24 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiwr-0048Ta-C3
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 11:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1668945436; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ng3Yjnce5LoSWYNSaPWg8YBKbAm8VShZgrA7Stnl55Jy4XHxc5F6yHyAzx7heFlNk+4nGq4oecz00/IrFQAKKTDQ1+qJ1eIMOnFfZx90ht1oLCrmFdkv8aUqwqJ0kCoQsT+WWDvHTA2+wFHcGZwbRzY4EweGvlAAeDIxWrl091s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1668945436; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TWmgry8NgngIUiXTgpSXxtbDHcnIyfa0JiiI/7Nvz+0=; 
	b=FFrifJu29X09dDqjHasO3Vvv8Vl6sQ/2nAY6cxlXZPfC0LnNeJn5z3OZ1wAn9L7tZ6He6o96YLVOeiudF5xbqaQg1BewHtCDKEliP9CiD7NXMNpddwtQ8zXDM5pxBV5jWmGZkPEp35X01Wr1s6lo6NWI0EWVuTpG39BGt1TzxfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1668945436;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TWmgry8NgngIUiXTgpSXxtbDHcnIyfa0JiiI/7Nvz+0=;
	b=TEHdXYjcq2IQ8SOZRsIQ+VcXg+Cgi8+rzb9YilugQd39ZKud1ac/HG0nBANeMvVw
	gwxjcJSNMWXGtchc8j7AwZ0cBxEawyAiMQw3RofSPqk5Kp6v0bQhB6Rf5Kd3SAz9fVm
	ikkOdE3JkRLqWVyD2KTFIDM1KrExGxQ/0TwBEwlo=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1668945432410994.7351069945597; Sun, 20 Nov 2022 03:57:12 -0800 (PST)
Message-ID: <924b302f8714677b4f018b0d64a7e92db6d9e6ea.camel@icenowy.me>
Subject: Re: [PATCH 6/7] riscv: dts: bouffalolab: add Sipeed M1S dock
 devicetree
From: Icenowy Zheng <uwu@icenowy.me>
To: Jisheng Zhang <jszhang@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sun, 20 Nov 2022 19:57:06 +0800
In-Reply-To: <20221120082114.3030-7-jszhang@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
	 <20221120082114.3030-7-jszhang@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_035721_508885_E9BD1CF7 
X-CRM114-Status: GOOD (  11.21  )
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

5ZyoIDIwMjItMTEtMjDmmJ/mnJ/ml6XnmoQgMTY6MjEgKzA4MDDvvIxKaXNoZW5nIFpoYW5n5YaZ
6YGT77yaCj4gU2lwZWVkIG1hbnVmYWN0dXJlcyBhIE0xUyBzeXN0ZW0tb24tbW9kdWxlIGFuZCBk
b2NrIGJvYXJkLCBhZGQgYmFzaWMKPiBzdXBwb3J0IGZvciB0aGVtLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0KPiDCoGFyY2gvcmlz
Y3YvYm9vdC9kdHMvYm91ZmZhbG9sYWIvTWFrZWZpbGXCoMKgwqDCoMKgIHzCoCAyICsrCj4gwqAu
Li4vYm9vdC9kdHMvYm91ZmZhbG9sYWIvYmw4MDgtc2lwZWVkLW0xcy5kdHMgfCAzMAoKSSBzdWdn
ZXN0IGEgTTFzIERUU0kgYW5kIGEgTTFzIERvY2sgRFRTLgoKPiArKysrKysrKysrKysrKysrKysr
Cj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL01ha2VmaWxlCj4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQt
Cj4gbTFzLmR0cwo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxv
bGFiL01ha2VmaWxlCj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL01ha2VmaWxl
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQyZTE3ZTFhOTdi
ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFi
L01ha2VmaWxlCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPiArZHRiLSQoQ09ORklHX1NPQ19CT1VGRkFMT0xBQikgKz0gYmw4MDgtc2lwZWVk
LW0xcy5kdGIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9i
bDgwOC1zaXBlZWQtbTFzLmR0cwo+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9i
bDgwOC1zaXBlZWQtbTFzLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi42NDQyMWZiMmFkNjcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtbTFzLmR0cwo+IEBAIC0wLDAgKzEsMzAg
QEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBvciBNSVQpCj4gKy8q
Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5v
cmc+Cj4gKyAqLwo+ICsKPiArL2R0cy12MS87Cj4gKwo+ICsjaW5jbHVkZSAiYmw4MDguZHRzaSIK
PiArCj4gKy8gewo+ICvCoMKgwqDCoMKgwqDCoG1vZGVsID0gIlNpcGVlZCBNMVMiOwo+ICvCoMKg
wqDCoMKgwqDCoGNvbXBhdGlibGUgPSAic2lwZWVkLG0xcyIsICJib3VmZmFsb2xhYixibDgwOCI7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGFsaWFzZXMgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzZXJpYWwwID0gJnVhcnQwOwo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoGNob3NlbiB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0ZG91
dC1wYXRoID0gInNlcmlhbDA6MjAwMDAwMG44IjsKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICsKPiAr
wqDCoMKgwqDCoMKgwqBtZW1vcnlANTAwMDAwMDAgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZWcgPSA8MHg1MDAwMDAwMCAweDA0MDAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqB9
Owo+ICt9Owo+ICsKPiArJnVhcnQwIHsKPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2theSI7
Cj4gK307CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
