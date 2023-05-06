Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EDCC7EE2A
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 05:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjfook8B91OU3kV1JViIWiBZBqFArou9k1RAAEKpkk0=; b=ORjMD8Ua9mxAet
	H0gUd6qgp0u3GFQa7L9cX+4AeSXDXxedgM6pXyChzPFmJ2LyVZ0F8HOse/ZiTu4wpMnXOJlnxe3Ev
	/LQf47QmN56Eb//Y+62FfQKduMXolf29Hw7BFAXNohjM/bIaRyMQwXQnqwEcoNdf9PWKMGT+f5fen
	AHsPdYDWG1VJnULbHQvTFfMe369QuVmBatuoueia5P6LGiC7PkWqHlvO6994jEtjCCUeTOs139kdm
	GS9kiT0KLl1eV3bPhDolpQYW/k/KsJGcKjsghY6CWLLgaFjXe2fvo2rhSP6v9VJ1sZEVLioUCzROI
	d1FVf+7Yx/JCvZ+FnFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvApa-00Cc6a-1W;
	Sat, 06 May 2023 05:51:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvApX-00Cc5c-14
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 05:51:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 534F161371;
	Sat,  6 May 2023 05:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D3DC433D2;
	Sat,  6 May 2023 05:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683352292;
	bh=Rk8NCPME9XF2pz/U0ElsAeB7PwFCQM4oV/d+9gKgK50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlXqFmGvkuhMTaePBFpOVDGzRGX97j0CcjsYaPU59lGW3B5hoc5DJszahlgW0s3Yx
	 9cMPJ02Dt45YZjRZDkkFIJWs1cPy7bfYrqPnBRvbIFp4NT8+OFZTl3Gw7PASGGa/qv
	 sah5KtIzj1EcTKFDmPIjIEBPczMfF/okBQUuE+90=
Date: Sat, 6 May 2023 09:56:30 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH linux-5.15.y] RISC-V: Fix up a cherry-pick warning in
 setup_vm_final()
Message-ID: <2023050606-emote-motion-38b3@gregkh>
References: <20230429224330.18699-1-palmer@rivosinc.com>
 <dc9c1ba9-a6b5-67f0-4499-f044fbca92f1@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc9c1ba9-a6b5-67f0-4499-f044fbca92f1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_225139_473559_82CA7CCC 
X-CRM114-Status: GOOD (  28.45  )
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

T24gTW9uLCBNYXkgMDEsIDIwMjMgYXQgMDk6MzM6MjVBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIFBhbG1lciwKPiAKPiBPbiA0LzMwLzIzIDAwOjQzLCBQYWxtZXIgRGFiYmVs
dCB3cm90ZToKPiA+IFRoaXMgdHJpZ2dlcnMgYSAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVu
dCBhcyB0aGUgY29kZSBoYXMgY2hhbmdlZCBhCj4gPiBiaXQgc2luY2UgdXBzdHJlYW0uICBJdCBt
aWdodCBiZSBiZXR0ZXIgdG8gaG9pc3QgdGhlIHdob2xlIGJsb2NrIHVwLCBidXQKPiA+IHRoaXMg
aXMgYSBzbWFsbGVyIGNoYW5nZSBzbyBJIHdlbnQgd2l0aCBpdC4KPiA+IAo+ID4gYXJjaC9yaXNj
di9tbS9pbml0LmM6NzU1OjE2OiB3YXJuaW5nOiBtaXhpbmcgZGVjbGFyYXRpb25zIGFuZCBjb2Rl
IGlzIGEgQzk5IGV4dGVuc2lvbiBbLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnRdCj4gPiAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpZHggPSBwZ2RfaW5kZXgoX19maXhfdG9fdmlydChG
SVhfRkRUKSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPiAgICAgIDEgd2Fy
bmluZyBnZW5lcmF0ZWQuCj4gPiAKPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWls
ZC1hbGwvMjAyMzA0MzAwNDI5LlNYWk9BNXVwLWxrcEBpbnRlbC5jb20vCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gSSBo
YXZlbid0IGV2ZW4gYnVpbGQgdGVzdGVkIHRoaXMgb25lLCBidXQgaXQgbG9va3Mgc2ltcGxlIGVu
b3VnaCB0aGF0IEkgZmlndXJlZAo+ID4gSSdkIGp1c3Qgc2VuZCBpdC4gIEJlIHdhcm5lZCwgdGhv
dWdoOiBJIGJyb2tlIGdsaWJjIGFuZCBtaXNzZWQgYSBtZXJnZWQKPiA+IGNvbmZsaWN0IHllc3Rl
cmRheS4uLgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMyArKy0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
ID4gaW5kZXggZTgwMGQ3OTgxZTk5Li44ZDY3ZjQzZjE4NjUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+IEBAIC03
MTcsNiArNzE3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3ZtX2ZpbmFsKHZvaWQpCj4g
PiAgIAl1aW50cHRyX3QgdmEsIG1hcF9zaXplOwo+ID4gICAJcGh5c19hZGRyX3QgcGEsIHN0YXJ0
LCBlbmQ7Cj4gPiAgIAl1NjQgaTsKPiA+ICsJdW5zaWduZWQgbG9uZyBpZHg7Cj4gPiAgIAkvKioK
PiA+ICAgCSAqIE1NVSBpcyBlbmFibGVkIGF0IHRoaXMgcG9pbnQuIEJ1dCBwYWdlIHRhYmxlIHNl
dHVwIGlzIG5vdCBjb21wbGV0ZSB5ZXQuCj4gPiBAQCAtNzM1LDcgKzczNiw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cF92bV9maW5hbCh2b2lkKQo+ID4gICAJICogZGlyZWN0bHkgaW4gc3dh
cHBlcl9wZ19kaXIgaW4gYWRkaXRpb24gdG8gdGhlIHBnZCBlbnRyeSB0aGF0IHBvaW50cwo+ID4g
ICAJICogdG8gZml4bWFwX3B0ZS4KPiA+ICAgCSAqLwo+ID4gLQl1bnNpZ25lZCBsb25nIGlkeCA9
IHBnZF9pbmRleChfX2ZpeF90b192aXJ0KEZJWF9GRFQpKTsKPiA+ICsJaWR4ID0gcGdkX2luZGV4
KF9fZml4X3RvX3ZpcnQoRklYX0ZEVCkpOwo+ID4gICAJc2V0X3BnZCgmc3dhcHBlcl9wZ19kaXJb
aWR4XSwgZWFybHlfcGdfZGlyW2lkeF0pOwo+ID4gICAjZW5kaWYKPiAKPiBUaGUgYWJvdmUgcmVz
dWx0cyB0byBpbiBydjY0Ogo+IAo+IC4uL2FyY2gvcmlzY3YvbW0vaW5pdC5jOiBJbiBmdW5jdGlv
biDigJhzZXR1cF92bV9maW5hbOKAmToKPiAuLi9hcmNoL3Jpc2N2L21tL2luaXQuYzo3MjA6MTY6
IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhpZHjigJkKPiBbLVd1bnVzZWQtdmFyaWFibGVd
Cj4gwqAgNzIwIHzCoCB1bnNpZ25lZCBsb25nIGlkeDsKPiAKPiAKPiBUaGUgZm9sbG93aW5nIGZp
eGVzIHRoaXMgd2FybmluZzoKPiAKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IDhkNjdmNDNmMTg2NS4uZTY5ZDgyZDU3
M2YxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiBAQCAtNzE3LDcgKzcxNyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1
cF92bV9maW5hbCh2b2lkKQo+IMKgwqDCoMKgwqDCoMKgIHVpbnRwdHJfdCB2YSwgbWFwX3NpemU7
Cj4gwqDCoMKgwqDCoMKgwqAgcGh5c19hZGRyX3QgcGEsIHN0YXJ0LCBlbmQ7Cj4gwqDCoMKgwqDC
oMKgwqAgdTY0IGk7Cj4gLcKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGlkeDsKPiArwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGxvbmcgaWR4IF9fbWF5YmVfdW51c2VkOwo+IAo+IMKgwqDCoMKgwqDC
oMKgIC8qKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBNTVUgaXMgZW5hYmxlZCBhdCB0aGlzIHBvaW50
LiBCdXQgcGFnZSB0YWJsZSBzZXR1cCBpcyBub3QKPiBjb21wbGV0ZSB5ZXQuCj4gCj4gCj4gTGV0
IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gc2VuZCBhIHByb3BlciBwYXRjaCBhcyBJJ20gdGhl
IG9uZSB0byBibGFtZQo+IGhlcmUuCgpBcyB0aGUgb3JpZ2luYWwgZml4IGhlcmUgd2lsbCBub3Qg
d29yaywgYSAiY29ycmVjdCIgb25lIG1pZ2h0IGJlIGJlc3QgdG8KaGF2ZSA6KQoKdGhhbmtzLAoK
Z3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
