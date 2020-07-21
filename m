Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F0EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EF520717
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nGP5H6ht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EF520717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eswin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+7+gDdl+cnoP1KF6YrOL5xCthJjOisy4yr4jxA6hoQk=; b=nGP5H6ht+sWGxcUv8tdymfJJD
	fwNe0GcUkB6zZ0lR3cyA0froo4lOTr4u77rytHXHUm79WjbREQMflG8+HVuiJeo+nw3evIxZg6NPq
	uLb05qGUuGBSAWRwPlABlZDYf/7yZHIzpBwUR0af87rgMSZTr1A0saj+MUXWqAtumj9cPoC4u2VxH
	N43v4eICMJSiQ1s9YXcJ/Ltm3/Hfvpwg8y9SbkGMc3Q/R0OGu7BHaAOXH0oZ9vH60ovj1qzz3ERKD
	YGGK3ocPsRVWIfw825re2HXy0kCPy43Ly7VBdI0Ep3/PhzPB6AXmJLdAOLa5EU4tbjEbVEn7+k9Ff
	v6dU6oyiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhNS-0005iG-En; Tue, 21 Jul 2020 01:47:30 +0000
Received: from out28-146.mail.aliyun.com ([115.124.28.146])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhNN-0005hM-Tf
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 01:47:27 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09037068|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0898497-0.00457316-0.905577;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=maochenxi@eswin.com; NM=1; PH=DS; RN=6;
 RT=6; SR=0; TI=SMTPD_---.I54Ds6m_1595296035; 
Received: from 10.1.56.17(mailfrom:maochenxi@eswin.com
 fp:SMTPD_---.I54Ds6m_1595296035)
 by smtp.aliyun-inc.com(10.194.98.253);
 Tue, 21 Jul 2020 09:47:16 +0800
Subject: Re: [PATCH 1/1] riscv: Enable ARCH_HAS_FAST_MULTIPLIER for RV64I
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-e8fe18f0-e6d7-4ee2-8a9b-a00dbf0b338b@palmerdabbelt-glaptop1>
From: Chenxi Mao <maochenxi@eswin.com>
Message-ID: <7ad95929-039f-9760-fc30-e89e02424361@eswin.com>
Date: Tue, 21 Jul 2020 09:47:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-e8fe18f0-e6d7-4ee2-8a9b-a00dbf0b338b@palmerdabbelt-glaptop1>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_214726_220012_9DA4DC3F 
X-CRM114-Status: GOOD (  14.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: chenxi.mao2013@gmail.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyOgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKRnJhbmtseSwgSSBkaWRuJ3QgdGVz
dCBBUkNIX0hBU19GQVNUX01VTFRJUExJRVIgb24gUlYzMiwKCnNvIEkgY2Fubm90IHB1dCBpdCBp
biBSSVNDViBwbGF0Zm9ybS4KCkkgYW0gdHJ5aW5nIHRvIGNvbXBhcmluZyBBUk02NCB3aXRoIFJp
c2N2IHRvIGZpbmQgb3V0IG1vcmUgb3B0aW1pemF0aW9uCgpjb25maWd1cmF0aW9ucy4KCkkgc3Vn
Z2VzdCB0byBlbmFibGUgQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSIG9uIFJWNjQgZmlyc3QuCgpJ
ZiBzb21lb25lIGVsc2UgZXZhbHVhdGUgdGhpcyBvbiBSVjMyLCB3ZSBjb3VsZCBtb3ZlIGl0IHRv
IFJJU0NWIHBsYXRmb3JtLgoKCkNoZW54aQoKCk9uIDIwMjAvNy8yMSDkuIrljYg5OjE3LCBQYWxt
ZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBXZWQsIDA4IEp1bCAyMDIwIDIyOjE5OjIyIFBEVCAoLTA3
MDApLCBtYW9jaGVueGlAZXN3aW4uY29tIHdyb3RlOgo+PiBFbmFibGUgQVJDSF9IQVNfRkFTVF9N
VUxUSVBMSUVSIG9uIFJWNjRJCj4+IHdoaWNoIHdvcmtzIGZpbmUgb24gR0NDLTkuMyBhbmQgR0ND
LTEwLjEKPj4KPj4gUFMyOiByZW1vdmUgQVJDSF9TVVBQT1JUU19JTlQxMjggYmVjYXVzZSBvZiBS
VjY0SSBhbHJlYWR5IGVuYWJsZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW54aSBNYW8gPG1h
b2NoZW54aUBlc3dpbi5jb20+Cj4+IC0tLQo+PiDCoGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwo+
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IDEyODE5MmUxNGZm
Mi4uODRlNjc3N2ZlY2FkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBAIC0yMDIsNiArMjAyLDcgQEAgY29uZmlnIEFSQ0hf
UlY2NEkKPj4gwqDCoMKgwqAgYm9vbCAiUlY2NEkiCj4+IMKgwqDCoMKgIHNlbGVjdCA2NEJJVAo+
PiDCoMKgwqDCoCBzZWxlY3QgQVJDSF9TVVBQT1JUU19JTlQxMjggaWYgQ0NfSEFTX0lOVDEyOCAm
JiBHQ0NfVkVSU0lPTiA+PSA1MDAwMAo+PiArwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19GQVNUX01V
TFRJUExJRVIKPj4gwqDCoMKgwqAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYgTU1VCj4+
IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZ
TkFNSUNfRlRSQUNFCj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JE
Cj4KPiBBaCwgdGhhbmtzIC0tIHRoaXMgb25lIGRpZG4ndCBzaG93IHVwIHdoZW4gSSB3YXMgbG9v
a2luZyBhdCB0aGUgbGFzdCBvbmUuwqAgSQo+IHRoaW5rIHdlIGNhbiBwdXQgdGhlIGZhc3QgbXVs
dGlwbGllciBvbiBydjMyIGFuZCBydjY0LCB0aGVyZSBzaG91bGRuJ3QgYmUgYW55Cj4gZGlmZmVy
ZW5jZSB0aGVyZS7CoCBJIGd1ZXNzIGluIHRoZW9yeSB3ZSBzaG91bGQgYmUgc3RpY2tpbmcgdGhp
cyBhbGwgaW4gc29tZQo+IHNvcnQgb2YgInBsYXRmb3JtIHR5cGUiIG9wdGltaXphdGlvbiBmbGFn
cywgYnV0IHRoYXQncyBwcm9iYWJseSBiaXQgbXVjaCBmb3IKPiBub3cuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
