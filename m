Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5902CD2D8FA
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPkHZKyf3DXsQiYuhNCuIia/eeon9gbs7+mTrUJtC0s=; b=Y+L5JVlN6dRb/w
	GzCejOx9WDdoU2g76feFm48zoRN4QuOJsi0RMxi1lFR5zVqjtVskq/DkwE/nlxKCbwOnJu4sOL0aC
	B648dpF9JXVLf1oTkn6HZD2/pXBS/58A2dqtSUD9BFSODgqnEQvXlooEX6UHx6vgkqP3wuOid1wsg
	QjUvQBHwN53Fn0eKri3A0UElb2NFTcFZNn3YSMhD670go80NzLoVM9xvAeFiXxTQpspjD28e4lb0C
	2S4dak5OTy2SiOYBjeb2NIimaZPsfVzBN1QwX//KFs1hh+8b6twaJFBUA4wZzofDpnWXWDDhfbAC3
	6ia3sZvBV40Ylm1ucNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgs5-0000000E7aU-2yjD;
	Tue, 27 Jan 2026 11:04:33 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgs0-0000000E7Zh-2s18
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 11:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769511863; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qg9X3pcoJnoqViWAtoWu+1abukl8Fw5lGIAyAv5BWD3vf2Qt+Y2HBJoSm6lHZzgY07f9QhbdgMnisC8fVRFzFp4CUU5HhGtDUJfPfY89ioVwpqdt8hXeZ0xpvyx1oZiwhLKIIUkrWK40ABNm/4+axHkf/jSJsjLFuS134r3jGpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769511863; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zIZv98xexLqGPRXaRA7uJoEdTPOCRvLcc++itdaM4UI=; 
	b=D+E2caX5GVBGRR0A8rjCa2P57YJRm8gJTwfYBgJFz0Ffg43w0VLJZCQlCoRDdYKahcNa2xnx/CjuKY4KGhPHfFZDFyGeBox2Arze2ad1Ac9ED0AluOZlgXXxzaFxBpMAyRREUfl2ctsmkp2W3p69mhQkCho4FIvzkjS4wB0Z6tU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769511863;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=zIZv98xexLqGPRXaRA7uJoEdTPOCRvLcc++itdaM4UI=;
	b=Yssn+2MqnT1qoMPXr6YSK96CPNXVriKXqEsW0mq/UEwfSKYG4Bu+HG8e/oaAAkno
	jMBGI1Um3eAiMZeBuuNH1jma14j1gOEaS7iIUZ9ASMOb7tW3WyXclPRjU0cgrzHPAsw
	HnfbuposIAuRXBDIRp+LCc2H8kJFktwrdXwklJWU=
Received: by mx.zohomail.com with SMTPS id 1769511855331786.2569087782504;
	Tue, 27 Jan 2026 03:04:15 -0800 (PST)
Message-ID: <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
Date: Tue, 27 Jan 2026 19:03:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
 <aXJJ3MjQSq8Rq084@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aXJJ3MjQSq8Rq084@duge-virtual-machine>
Feedback-ID: rr08011227a510c0fba220186bba5f362e000053b54e7061a9cbdd371d5284c83a55924f9557a426366cbb14:zu080112272a5276332e1090ec5d5ceed40000b2c296e870bfa7ef506b33ce0394521dd45f1929333996b33b:rf0801122cc4400f0c83132b1947518dc60000c8bd395d79c79d723ff8939ceba3fa55336a182f4efa95f61dab38722347:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030428_772674_11A5F561 
X-CRM114-Status: GOOD (  16.07  )
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

Ck9uIDIwMjYvMS8yMyAwMDowMSwgSmlheXUgRHUgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjIsIDIw
MjYgYXQgMDc6NDA6MjlQTSArMDgwMCwgWHVrYWkgV2FuZyB3cm90ZToKPj4gT24gMjAyNi8xLzE5
IDE2OjE4LCBKaWF5dSBEdSB3cm90ZToKPj4+PiArCj4+Pj4gK0syMzBfQ0xLX0dBVEVfRk9STUFU
KGhzX2hjbGtfc3JjX2dhdGUsCj4+Pj4gKwkJICAgICBLMjMwX0hTX0hDTEtfU1JDX0dBVEUsCj4+
Pj4gKwkJICAgICAweDE4LCAwLCAwLCAwLAo+Pj4+ICsJCSAgICAgJmhzX2hjbGtfaGlnaF9zcmNf
cmF0ZS5jbGsuaHcpOwo+Pj4gSGVyZSwgeW91IHJlcGxhY2VkIGhzX2hjbGtfaGlnaF9nYXRlKGlu
IHY5KSB3aXRoIGhzX2hjbGtfaGlnaF9zcmNfcmF0ZSwKPj4gSSdtIGEgYml0IGNvbmZ1c2VkLCBh
cyBJIGRvbid0IHJlY2FsbCBtYWtpbmcgdGhlc2Ugc3BlY2lmaWMgY2hhbmdlcy4KPj4gTG9va2lu
ZyBhdCB0aGUgY29kZSBiZWxvdywgdGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHY5IGFuZCB2
MTAgaXMKPj4gd2l0aGluIHRoZSBLMjMwX0NMS19HQVRFX0ZPUk1BVChoc19oY2xrX3NyY19nYXRl
LCAuLi4pIGRlZmluaXRpb24sIHdoZXJlCj4+IHRoZSBzZWNvbmQgcGFyYW1ldGVyIGNoYW5nZWQg
ZnJvbSAxIHRvIDAuIEV2ZXJ5dGhpbmcgZWxzZSBhcHBlYXJzCj4+IGNvbnNpc3RlbnQuIENvdWxk
IHlvdSBjbGFyaWZ5IHdoaWNoIGNoYW5nZSB5b3Ugd2VyZSByZWZlcnJpbmcgdG8/Cj4+PiBidXQg
YWZ0ZXIgbXkgYm9hcmQgdGVzdCwgSSBmaW5kIHRoYXQgd2hlbiBoc19oY2xrX2hpZ2hfZ2F0ZSBp
cyB0dXJuZWQKPj4+IG9mZiwgdGhlIG1tYy9zZCBhbmQgb3RoZXIgaGlnaC1zcGVlZCBzdWJzeXN0
ZW1zIGNhbiBub3Qgd29yay4gU28gbWF5YmUKPj4+IHlvdSBzaG91bGQgbm90IGNoYW5nZSB0aGUg
aHNfaGNsa19oaWdoX2dhdGUgdG8gaHNfaGNsa19oaWdoX3NyY19yYXRlLgo+PiBSZWdhcmRpbmcg
dGhlIGNsb2NrIG1hbmFnZW1lbnQsIEkgcmVjb21tZW5kIGV4cGxpY2l0bHkgZW5hYmxpbmcKPj4g
aHNfaGNsa19oaWdoX2dhdGVhcyBpdCB3aWxsIGJlIGNsb3NlZCBieSBgY2xvc2UgdW51c2VkIGNs
b2Nrc2AuCj4gU29ycnksIHlvdSBhcmUgcmlnaHQuIEl0IHdhcyBtZSB3aG8gbWFkZSB0aGUgY2hh
bmdlcyBsb2NhbGx5LiBBbmQgSQo+IHNhdyB5b3VyIHJlcGx5IHRvIHRoaXMgZW1haWxbMV0sIHdo
aWNoIHlvdSBzYWlkIEFjY29yZGluZyB0byB0aGUgdmVuZG9yJ3MKPiBjb2RlLCB0aGUgcGFyZW50
IGNsb2NrIG9mIGhzX2hjbGtfc3JjIGlzIGhzX2hjbGtfaGlnaF9zcmMuCj4KPiBJbmRlZWQsIHRo
ZSBwYXJlbnQgY2xvY2sgb2YgaHNfaGNsa19zcmMgaXMgaHNfaGNsa19oaWdoX3NyYy4gCgo+IGJ1
dCBoc19oY2xrX2hpZ2hfZ2F0ZSBpcyB0aGUgZ2F0ZSBvZiBoc19oY2xrX2hpZ2hfc3JjLiAKCk5v
LiBJdCBzZWVtcyB0aGVyZSBpcyBzb21lIGNvbmZ1c2lvbi4gVGhlIGhzX2hjbGtfaGlnaF9zcmMg
ZG9lcyBub3QgaGF2ZQphIGdhdGUuCgpUaGUgY2xvY2sgdHJlZSBpcyBhcyBmb2xsb3c6CgrCoCDC
oCDCoCDCoHBsbDBfZGl2NArCoCDCoCDCoCDCoCDCoCBoc19oY2xrX2hpZ2hfc3JjX3JhdGUKwqAg
wqAgwqAgwqAgwqAgwqAgwqBoc19oY2xrX2hpZ2hfZ2F0ZQrCoCDCoCDCoCDCoCDCoCDCoCDCoGhz
X2hjbGtfc3JjX2dhdGUKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaHNfaGNsa19zcmNfcmF0ZQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX3NkMF9haGJfZ2F0ZQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGhzX3NkMV9haGJfZ2F0ZQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGhzX3NzaTFfYWhiX2dhdGUKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoc19zc2ky
X2FoYl9nYXRlCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaHNfdXNiMF9haGJfZ2F0ZQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX3VzYjFfYWhiX2dhdGUKCj4gU28sIHdoYXQg
eW91IG1lYW4gaXMKPiB0aGF0IHlvdSB3aWxsIGFkZCB0aGUgQ0xLX0lTX0NSSVRJQ0FMIGZsYWcg
dG8gdGhlIGhzX2hjbGtfaGlnaF9nYXRlPwpObywgSSBkb24ndCBpbnRlbmQgdG8gYWRkIENMS19J
U19DUklUSUNBTCBmbGFnLiBJbnN0ZWFkLCBJIHJlY29tbWVuZCB5b3UKdG8gZXhwbGljaXRseSBl
bmFibGUgdGhlIGNsb2NrIGJ5IHVzaW5nIGNsa19wcmVwYXJlX2VuYWJsZSBpbiB5b3VyIGRyaXZl
ci4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNTk2MTVkMy1jYzUyLTQz
YmUtYmY2ZC01ZmU3MTdlZjFjYzRAem9ob21haWwuY29tLyBbMV0KPgo+IFJlZ2FyZHMsCj4gSmlh
eXUgRHUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
