Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B8CF6AB6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twVeYd9er2AJiBcxUlHRWGr1P/PuI3Z/Cgdsh57Bh/c=; b=ADisoFuB3uP4j+
	s7skPHD9dckk9uLYTpQXoBGKklewCcfyfDc8hRnztYaGa89gWm8AgKcLstkWn5g2eW3F8SZVJjdij
	rQFAAA12Y0G0lUGKx7MPr5AV80YIZyDyUwBmumYZGGe5p9FwaIDqGoTDt2PnSbHaUIphYme3w/e4y
	Zvydo2NkapM7foV35ztKYL18zwLOsxntNf8Wtf9b3HHeybT+zaZAQMoAiJDD8R9BVnS35HJwvY3w0
	XVYHz4PjhH3J1jFziaU0S1bte/T7PwgeAov59js3ajFQ419HDEp7BdVhUyJBPPeb8Q3wjfysMiYj0
	kkY2bUvvJR8jY8da8mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmop-0000000GY0v-0S4s;
	Thu, 08 Jan 2026 10:00:39 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmom-0000000GXzh-10bx
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 10:00:38 +0000
X-UUID: d9ba585cec7811f0a38c85956e01ac42-20260108
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:92d9c349-e32f-4ee6-b4bd-7d53920b3c09,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:cd288c550dff6a7cd085b327586eb50b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9ba585cec7811f0a38c85956e01ac42-20260108
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 12501923; Thu, 08 Jan 2026 18:00:24 +0800
Message-ID: <e02320c8-eff2-44af-a66c-a3c7ca9ca0ea@kylinos.cn>
Date: Thu, 8 Jan 2026 18:00:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] lib/string_kunit: add test case for strnlen
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org,
 andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
 Jason@zx2c4.com, conor.dooley@microchip.com, samuel.holland@sifive.com,
 charlie@rivosinc.com, ajones@ventanamicro.com, nathan@kernel.org,
 linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260107023517.46840-1-jiangfeng@kylinos.cn>
 <20260107023517.46840-3-jiangfeng@kylinos.cn>
 <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
 <b419c6db-0f3f-4666-8f7c-156f7eda2b5b@kylinos.cn>
 <aV9cQ2QMA-jwFNUO@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aV9cQ2QMA-jwFNUO@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_020036_594871_8831AE0D 
X-CRM114-Status: GOOD (  11.00  )
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

T24gMjAyNi8xLzggMTU6MjYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBUaHUsIEphbiAw
OCwgMjAyNiBhdCAwMjo1Mzo1OFBNICswODAwLCBGZW5nIEppYW5nIHdyb3RlOgo+PiBPbiAyMDI2
LzEvNyAxOTo1NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4gT24gV2VkLCBKYW4gNywgMjAy
NiBhdCA0OjM14oCvQU0gRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyb3RlOgo+
IAo+IC4uLgo+IAo+Pj4+IEFkZCBhIEtVbml0IHRlc3QgZm9yIHN0cm5sZW4oKSB0byB2ZXJpZnkg
Y29ycmVjdG5lc3MgYWNyb3NzCj4+Pj4gZGlmZmVyZW50IHN0cmluZyBsZW5ndGhzIGFuZCBtZW1v
cnkgYWxpZ25tZW50cy4KPj4+Cj4+PiBTYW1lIGNvbW1lbnQgYXMgcGVyIHBhdGNoIDEgKGl0IHdv
dWxkIHByb2JhYmx5IHJlcXVpcmUgdG8gY2FsbCBmb3IKPj4+IGFyY2hfc3RybmxlbigpIG9yIHNv
bWV0aGluZyBsaWtlIHRoaXMpLgo+Pgo+PiBUaGFua3MsIG1ha2VzIHNlbnNlLgo+Pgo+PiBJJ2xs
IGFkZCB0aGUgcGVyZm9ybWFuY2UgYmVuY2htYXJraW5nIChyYW5kb20gZmlsbGluZyArIHRpbWlu
ZykgaW4gVjIuCj4+Cj4+IFNpbmNlIHN0cmluZyBmdW5jdGlvbnMgYXJlIHR5cGljYWxseSBleHBv
cnRlZCBkaXJlY3RseSBieSBlYWNoIGFyY2hpdGVjdHVyZQo+PiB3aXRob3V0IGFuIGFyY2hfIHBy
ZWZpeCwgSSdsbCBpbnRyb2R1Y2UgYSBnZW5lcmljX3N0cm5sZW4oKSAoYmFzZWQgb24KPj4gbGli
L3N0cmluZy5jKSB3aXRoaW4gdGhlIHRlc3QgZm9yIGNvbXBhcmlzb24uCj4gCj4gUHJvYmFibHkg
eW91IHdhbnQgdG8gbWFrZSB0aGUgZXhpc3Rpbmcgb25lIHRvIGhhdmUgdGhhdCBuYW1lIGFuZCB1
c2UgaXQgaW5zaWRlCj4gdGhlIHRlc3QgYW5kIGluIHRoZSBmYWxsYmFjayB3cmFwcGVyLiBXZSBk
b24ndCB3YW50IHRvIGhhdmUgZHVwbGljYXRlIGNvZGUsIGl0Cj4gaXMgYmFkIGZyb20gbWFpbnRl
bmFuY2UgcGVyc3BlY3RpdmUuCj4gCgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucyEKClRvIGF2
b2lkIGNvZGUgZHVwbGljYXRpb24sIEknbGwgcmVuYW1lIHRoZSBnZW5lcmljIGltcGxlbWVudGF0
aW9uIGluIGxpYi9zdHJpbmcuYwp0byBfX2dlbmVyaWNfc3RybmxlbigpIGFuZCBrZWVwIHRoZSBv
cmlnaW5hbCBzdHJubGVuKCkgYXMgYSB3cmFwcGVyLiBUaGVuIEknbGwgdXNlCnRoZSBnZW5lcmlj
IG9uZSBpbiB0aGUgS1VuaXQgdGVzdCBmb3IgY29tcGFyaXNvbi4KCkRvZXMgdGhpcyBhcHByb2Fj
aCBsb29rIGdvb2QgdG8geW91PwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
