Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2182F557F4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Cc:To:Message-Id:Subject:
	References:In-Reply-To:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Dg8lk3P7igfjLa2bR/8h1fTu1pGc6XI/NAFlTmP15w=; b=t8Ng3Tusz9CHQO
	R6nq12iJc9k5gREarNGKZpFsAg/k7OnGT6aa0JROqZnuyPdGyzC6ORNKX9rgYKsK6IxVN+IPRcQv7
	fXfIoXaPDgZHAkPvmD2cfJM/huCoY7c856bYEPKW3UrQJBXVtPtEDtFgfGeUBCttz3AnNaH2Qxr9x
	Zjl9YnlIxq69cooBTzNZZ8aaHFw7koFoiPntlMAaeaZtmKkqPTlnBiSCmB66K4whrt8/53IDt0FXl
	AyXKBibsLJ/4+jU6B5XCYnyX9/6cBDu2JbaLzyBbDsy3Z7qRbOxrpnaFEbjyh7qUwTndb5e5UXV/+
	THd9ULgeXLc/5Rs81uPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktj-00000006fsv-3XX6;
	Mon, 20 Apr 2026 09:26:31 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktf-00000006fqu-2J0L
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 09:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776677180;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=c/cSJ0sI8II6L7VDGRHSSR6QMp4ljxaqU3hFC4CrDJQ=;
 b=FDEthD4QguF5e2bfCsYrhLXifhx+wj5j6RA+uAKNMqdmXiS/AtAtlMPFsGJNSgHJNsyTW4
 o2nAt9xOpXz6RJJciAkXWWEP4uGBTvyjRntnLFNGhqyh7VZtrF501KKypNXeVreR2RYukx
 1LLrCrY3jR98hoWjcZrGft0wtfKvERv552Ofi4pKXiEgry+r9oI7+pX4R5YL+rNcsfDPDm
 9srZezm80tJGx8taetZTTBTPSd/4qXMzWJaoy33tjYo+g/EzcGOtrANnBvdlMjxNpRlzHf
 PKMLjAh/zOauAzxlDn9lX5o/dss+0FzwxCJdzgjt3U72I4JoXRIs8CNo2oizMQ==
Mime-Version: 1.0
In-Reply-To: <20260420090936-GKB203300@kernel.org>
X-Lms-Return-Path: <lba+169e5f13a+17fb7a+lists.infradead.org+sandie.cao@deepcomputing.io>
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io> <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org> <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org> <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
	<20260420090936-GKB203300@kernel.org>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"kernel test robot" <lkp@intel.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon, 20 Apr 2026 17:26:16 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022628_502501_F17EEE16 
X-CRM114-Status: GOOD (  12.22  )
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

SGksIExhbiAmIFRyb3kgJiBLcnp5c3p0b2YgOgoKPiBGcm9tOiAiWWl4dW4gTGFuIjxkbGFuQGtl
cm5lbC5vcmc+Cj4gRGF0ZTrCoCBNb24sIEFwciAyMCwgMjAyNiwgMTc6MDkKCj4gSGkgVHJveSwK
PsKgCj4gT24gMTY6NTAgTW9uIDIwIEFwciDCoCDCoCAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4g
PiBPbiBNb24gQXByIDIwLCAyMDI2IGF0IDQ6NDQgUE0gQ1NULCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+ID4gPiBPbiAyMC8wNC8yMDI2IDEwOjQzLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+ID4gPj4gT24gMjAvMDQvMjAyNiAxMDozOSwgU2FuZGllIENhbyB3cm90ZToKPiA+ID4+
PiBGaXggZHRjaGVjayBpc3N1ZTogY29tcGF0aWJsZTowOiAnc3BhY2VtaXQsazEtaTJjJyB3YXMg
ZXhwZWN0ZWQKPiA+ID4+wqAKPiA+ID4+IE1pc3Npbmcgc3BhY2UgYWZ0ZXIgbWFpbiBjb21taXQg
bXNnLgo+ID4gPj7CoAo+ID4gPj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiA+ID4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NjA0MTQwMjU5LmVLRGF4S3VhLWxrcEBpbnRlbC5jb20vCj4gPiA+Pj4KPiA+ID4KPiA+ID4gQWxz
bywgdGhlIGZpbGUgcmVwb3J0ZWQgaW4gYWJvdmUgd2FybmluZyBET0VTIE5PVCBFWElTVCAoSSBj
aGVja2VkCj4gPiA+IG5leHQtMjAyNjA0MTQpLgo+ID4gSW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3BhY2VtaXQsazEtcGluY3RybC55YW1sOgo+ID7CoAo+ID4g
cHJvcGVydGllczoKPiA+IMKgIGNvbXBhdGlibGU6Cj4gPiDCoCDCoCBlbnVtOgo+ID4gwqAgwqAg
wqAgLSBzcGFjZW1pdCxrMS1waW5jdHJsCj4gPiDCoCDCoCDCoCAtIHNwYWNlbWl0LGszLXBpbmN0
cmwKPiA+wqAKPiBJIHRoaW5rIHlvdSByZWZlciB0byB3cm9uZyBmaWxlLCB3aGljaCBzaG91bGQg
YmUKPiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc3BhY2VtaXQsazEt
aTJjLnlhbWwKPsKgCj4gPiBTbyB0aGVyZSdzIG5vIHJlYXNvbiB0byB1c2UgazEtaTJjLiBBcyBm
YXIgYXMgSSBjYW4gdGVsbCwgd2hpbGUgdGhleSBhcmUgdGhlIHNhbWUgSVAsCj4gPiB0aGVyZSBh
cmUgc3VidGxlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlbS4KPiA+wqAKPiBCdXQgeWVzLCB0aGUg
aWRlYSBpcyBjb3JyZWN0LCBzbyBOQUsgdG8gdGhpcyBwYXRjaAo+ID4gwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLSBUcm95Cj7CoAo+IC0twqAKPiBZ
aXh1biBMYW4gKGRsYW4pCj7CoAoKUGxlYXNlIGtub3cgdGhhdCwgSSBzZW5kIHBhdGNoWzFdIHRv
IGFkZCBEZWVwQ29tcHV0aW5nIEZNTDEzVjA1IGJvYXJkIGRldmljZSB0cmVlLsKgIFRoZSBwYXRj
aCBpcyBiYXNlZCBvbiBrMS9kdC1mb3ItbmV4dFsyXS7CoApBbmQgaXQgbWVldHMgZHRzY2hlY2sg
aXNzdWU6ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KQ2xv
c2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDE0MDI1OS5lS0RheEt1YS1sa3BA
aW50ZWwuY29tLwoKT24gazEvZHQtZm9yLW5leHQsIGl0IGRvZXNuJ3QgaGF2ZSBzcGFjZW1pdCxr
My1pMmMgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9zcGFjZW1pdCxr
MS1pMmMueWFtbC4KT3IgSSB1c2UgdGhlIHdyb25nIGJyYW5jaD/CoAoKQW5kIHdoYXQgc2hvdWxk
IEkgZG8gZm9yIG15IHBhdGNoWzFdID8gwqAKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA0MTMwNjA1MjQuMTIzNTk4Mi0xLXNhbmRpZS5jYW9AZGVlcGNvbXB1dGluZy5pby8K
WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvdHJlZS9rMS9mb3ItbmV4
dCMKCkJlc3QgcmVnYXJkcwpTYW5kaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
