Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBDBC83003
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:To:From:References:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OGEiVcNJz2TL+EAaZmLe22BTVCdvFaoN9j7GyNmD9g=; b=kqNRyKQsjqStUg
	m+BRrYBk+YfQSJUQAf9hKdBEFiJRUmgERHta8Nx4kZ0k+XQc0zbWEwmI1l76zFY3wCmzjJXtjXOnv
	smqhhELUOUhfDeV3FbfpcShFYNY75KaXHKBzdvhhK473K4rqG5sBN/EuzqBwo0hErJvt/jWth/Uum
	AHnGaVcZQHCb5FQ/cpocKuZrea3qhNPapGWIeYH+0ihTxOe+u6QG7Ld0/3AkgYgL8TDPFKJVldOqw
	IuLAele/fw4ZOTTHMDn/6TEa/Pi8BWccWD3ThkwB5pYe9IvCjSioZjaFmu3j3pZrtK9xDKeKB1NtX
	CTxR2JclQwJs6EZOCT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LBl-00AJzj-37;
	Thu, 08 Jun 2023 19:20:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6o8Z-004qou-2U
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 08:03:26 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E591624E307;
	Wed,  7 Jun 2023 16:02:35 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 16:02:35 +0800
Received: from [192.168.60.122] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 16:02:35 +0800
Message-ID: <ab89b684-8b49-2088-b0d2-ca362fd9dfb4@starfivetech.com>
Date: Wed, 7 Jun 2023 16:02:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Content-Language: en-US
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <1991848.PYKUYFuaPT@diego> <20230606-geometry-blurb-1f0f07d4bf6a@spud>
 <ifgjvonhkzcwrklzch5efguor2x6az4m737dwte4uyow7ar5dr@z4glaxse6dou>
From: Keith Zhao <keith.zhao@starfivetech.com>
To: undisclosed-recipients:;
In-Reply-To: <ifgjvonhkzcwrklzch5efguor2x6az4m737dwte4uyow7ar5dr@z4glaxse6dou>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_010324_128784_62C23518 
X-CRM114-Status: GOOD (  29.50  )
X-Mailman-Approved-At: Thu, 08 Jun 2023 12:20:52 -0700
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

CgpPbiAyMDIzLzYvNyAxNDo0MSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBUdWUsIEp1biAw
NiwgMjAyMyBhdCAxMTozNzo1M1BNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIFdl
ZCwgSnVuIDA3LCAyMDIzIGF0IDEyOjIyOjMzQU0gKzAyMDAsIEhlaWtvIFN0w7xibmVyIHdyb3Rl
Ogo+PiA+IEFtIERpZW5zdGFnLCA2LiBKdW5pIDIwMjMsIDIwOjQxOjE3IENFU1Qgc2NocmllYiBT
aGVuZ3l1IFF1Ogo+PiA+ID4gPiBPbiBGcmksIEp1biAwMiwgMjAyMyBhdCAwMzo0MDozNVBNICsw
ODAwLCBLZWl0aCBaaGFvIHdyb3RlOgo+PiA+ID4gPj4gQWRkIGJpbmRpbmdzIGZvciBKSDcxMTAg
ZGlzcGxheSBzdWJzeXN0ZW0gd2hpY2gKPj4gPiA+ID4+IGhhcyBhIGRpc3BsYXkgY29udHJvbGxl
ciB2ZXJpc2lsaWNvbiBkYzgyMDAKPj4gPiA+ID4+IGFuZCBhbiBIRE1JIGludGVyZmFjZS4KPj4g
Cj4+ID4gPiA+PiArZGVzY3JpcHRpb246Cj4+ID4gPiA+PiArICBUaGUgU3RhckZpdmUgU29DIHVz
ZXMgdGhlIEhETUkgc2lnbmFsIHRyYW5zbWl0ZXIgYmFzZWQgb24gaW5ub3NpbGljb24gSVAKPj4g
PiA+ID4gSXMgaW5ub3NpbGljb24gdGhlIHNhbWUgdGhpbmcgYXMgdmVyaXNpbGljb24/IEFsc28K
Pj4gPiA+ID4gcy90cmFuc21pdGVyL3RyYW5zbWl0dGVyLywgYm90aCBoZXJlIGFuZCBpbiB0aGUg
dGl0bGUuCnllcyxpbm5vc2lsaWNvbiBpcyB0aGUgSERNSSBJUCAgYW5kIHZlcmlzaWxpY29uIGlz
IHRoZSBEQy1jb250cm9sbGVyIElQCgo+PiA+ID4gCj4+ID4gPiBJIHRoaW5rIHRoYXQgaXMgbm90
IHRoZSBzYW1lLCBJIHJlbWVtYmVyIFJvY2tjaGlwIGhhcyB1c2VkIGEgSERNSSAKPj4gPiA+IHRy
YW5zbWl0dGVyIGZyb20KPj4gPiA+IAo+PiA+ID4gSW5ub3NpbGljb24sIGFuZCB0aGVyZSBpcyBh
IGV4aXN0aW5nIGRyaXZlciBmb3IgdGhhdCBpbiBtYWlubGluZS4KPj4gPiAKPj4gPiBZZXAsIEkg
dGhpbmsgSW5ub3NpbGljb24gaXMgdGhlIGNvbXBhbnkgeW91IHR1cm4gdG8gd2hlbiB5b3Ugd2Fu
dCB0byBzYXZlCj4+ID4gYSBiaXQgb2YgbW9uZXkgOy0pIC4gSW4gdGhlIGJpZ2dlciBTb0NzIFJv
Y2tjaGlwIG1vc3Qgb2YgdGhlIHRpbWUgdXNlcwo+PiA+IERlc2lnbndhcmUgaGRtaSBibG9ja3Mg
YW5kIGxvb2tpbmcgYXQgdGhlIGhpc3Rvcnkgb25seSB0aGUgcmszMDM2IGV2ZXIKPj4gPiB1c2Vk
IGFuIElubm9zaWxpY29uIGJsb2NrLgo+PiA+IApJIGhhdmUgZG9uZSBhIEhETUljb21wYXJpc29u
IG9mIHRoZSByazMwMzYgYW5kIHRoZSBqaDcxMTAsIGFuZCB0aGV5IGFyZSBib3RoIGJhc2VkIG9u
IGlwIElubm9zaWxpY29uLgoKdGhlIGhhcmR3YXJlIG9mIHRoZW0gLgpTb21lIHBhcnRzIG9mIHRo
ZSBoYXJkd2FyZSBvZiB0aGUgdHdvIGFyZSBjb21tb24sIHN1Y2ggYXMgdGhlIGxvZ2ljIG9mIGhk
bWkgSTJDIHRvIG9idGFpbiBlZGlkLCBhbmQgdGhlIHJlZ2lzdGVyIGRlZmluaXRpb24gaXMgY29u
c2lzdGVudC4KCk1hbnkgcmVnaXN0ZXJzIGFyZSBkZWZpbmVkIGRpZmZlcmVudGx5IGZyb20gdGhl
IGxpbnV4IG1haW4gbGluZSBpbm5vIGRyaXZlciwgaW5jbHVkaW5nIHJlZ2lzdGVycyB0aGF0IGNv
bnRhaW4gc3BlY2lmaWMgYml0cwphbmQgc29tZSByZWdpc3RlcnMgaW4gbGludXggbWFpbiBsaW5l
IGlubm8gZHJpdmVyIG5vIGxvbmdlciB1c2VkIGluIG15IG5ldyBpbm9vIGhkbWkgaGFyZHdhcmUu
Cgo+PiA+IExvb2tpbmcgYXQgdGhlIGhpc3RvcnksIDIwMTYgcmVhbGx5IHdhcyBhIGxvbmcgdGlt
ZSBhZ28gOi1ELgo+PiA+IAo+PiA+ID4gU28gS2VpdGgsIGlmIHRoYXQncyB0cnVlLCBJIHRoaW5r
IGl0IGlzIGJldHRlciB0byBzZXBlcmF0ZSB0aGUgSERNSSAKPj4gPiA+IHN0dWZmIGFuZCByZXVz
ZSBleGlzdGluZyBkcml2ZXIuCj4+ID4gCj4+ID4gSSdtIG5vdCBzbyBzdXJlIGFib3V0IHRoYXQg
LSBhdCBsZWFzdCBmcm9tIGEgY3Vyc29yeSBnbGFuY2UgOi0pIC4KPj4gPiAKPj4gPiBUaGUgcmVn
aXN0ZXJzIGRvIGxvb2sgc2xpZ2h0bHkgZGlmZmVyZW50IGFuZCBJIGRvbid0IGtub3cgaG93IG11
Y2gKPj4gPiB0aGUgSVAgY2hhbmdlZCBiZXR3ZWVuIHRoZSByazMwMzYtdmVyc2lvbiBhbmQgdGhl
IGpoNzExMCB2ZXJzaW9uLgo+PiA+IAo+PiA+IEF0IHRoZSB2ZXJ5IGxlYXN0LCBJIGtub3cgbXkg
cmszMDM2IGJvYXJkIGlzbid0IGJvb3RpbmcgcmlnaHQgbm93LCBzbwo+PiA+IEkgY2FuJ3QgcmVh
bGx5IHByb3ZpZGUgaGVscCBmb3IgZ2VuZXJhbGl6aW5nIHRoZSByb2NrY2hpcC1kcml2ZXIuCj4+
ID4gCj4+ID4gQXQgdGhlIHZlcnkgbGVhc3QgYm90aCB0aGUgYmluZGluZyBhbmQgZHJpdmVyIGNv
dWxkIGRyb3AgdGhlICJzdGFyZml2ZS1oZG1pIgo+PiA+IGFuZCBhY3R1YWxseSB1c2UgdGhlIElu
bm9zaWxpY29uIGluIHRoZSBuYW1pbmcgc29tZXdoZXJlLCBzbyB0aGF0IGl0J3MKPj4gPiBjbGVh
ciBmb3IgZnV0dXJlIGRldmVsb3BlcnMgOi0pCj4+IAo+PiBTZWVpbmcgImJhc2VkIG9uIiBhbHdh
eXMgbWFrZXMgbWUgYSBsaXR0bGUgYml0IG5lcnZvdXMgdG8gYmUgaG9uZXN0IHdoZW4KPj4gaXQg
Y29tZXMgdG8gdXNpbmcgYSBjb21wYXRpYmxlIGZyb20gdGhlIElQLiBJcyBpdCB0aGUgSVA/IFdo
YXQgdmVyc2lvbgo+PiBpcyBpdD8gZXRjLiBQZXJoYXBzICJzdGFyZml2ZSxqaDcxMTAtaGRtaSIg
JiBmYWxsaW5nIGJhY2sgdG8gc29tZSBzb3J0Cj4+IG9mICJpbm5vc2lsaWNvbixoZG1pIiB3b3Vs
ZCBiZSBtb3JlIGZ1dHVyZS9JUC1zaWxsaW5lc3MgcHJvb2YuCj4+IERyaXZlciBjYW4gYWx3YXlz
IGJlIGdlbmVyaWMgJiBiaW5kIGFnYWluc3QgImlubm9zaWxpY29uLGhkbWkiIHVudGlsCj4+IHRo
YXQgYmVjb21lcyBpbXBvc3NpYmxlLgo+IAo+IEdpdmVuIHRoYXQgTmVpbCB3YXMgc2F5aW5nIHRo
YXQgdGhlcmUncyBhdCBsZWFzdCB0d28KPiBnZW5lcmF0aW9ucy9yZXZpc2lvbnMvbW9kZWxzIG9m
IGFuIEhETUkgY29udHJvbGxlciBmcm9tIElubm9zaWxpY29uLCBJJ20KPiBub3Qgc3VyZSB0aGF0
IGNvbXBhdGlibGUgaXMgZW5vdWdoIHRvIHJlYWNoIHRoYXQgZ29hbCBhbnl3YXkuCj4gCj4gTWF4
aW1lCgoKCkkgd2lsbCBjaGFuZ2UgdGhlICB0aGUgYmluZGluZyAgdG8gbWVldCBpbm5vc2lsaWNv
bixoZG1pIC4KZm9yIHRoZSBkcml2ZXJzIHBhcnQgLCBJIHdpbGwgc3R1ZHkgdGhlIHBvc3NpYmls
aXR5IG9mIFJLLUhETUkgcmV1c2UuCgpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMKCgoKCgoK
CgoKCgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
