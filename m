Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3093C636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmsvZ2gpXROdtC0t2JF2Fw0PeNyd1jWRNlA6FHrUeCQ=; b=BbyvUXd27gQ597
	YiaQvGmas4VMkeZjjX+ExbKi6ZkF9rhytcE3DXmMtgewFK3WBGs3e8yYS9vEuMHFtCJXVMmXtW9Ad
	BtcVDivhimRqzlJDN61UBJ8X9Hfpv8DrvXokUNnkwUmeCMw915R6iu/SEaGsafX0KBBOqXodJGo4u
	GpBBEyGAwe7KwTSFmlsCahLDThp9kfuAOlTleA3qN6ujfrNML+QBR7RD8inSgpJUvf5ydAP4xRixe
	4tK5fvvl5BmW+xUpg4HNZCMrXyTTrtQ3xISQ5fZKkNApalOfOxpQLq93DIyEB7S7rPsXGkCL+zIsk
	fborI+wVmrqnRUgoGchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDBQ-00C46G-EH; Wed, 01 Feb 2023 13:29:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDBN-00C450-KT
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:29:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3ECB0B82184;
	Wed,  1 Feb 2023 13:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01B0C433EF;
	Wed,  1 Feb 2023 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258187;
	bh=m5cOWjvGFnEbPHdMo+hVyURcA9Sf5AmPc4tPLsKg/K8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q8RkUhlgMXaHZzAiSnftDSU99sAZsj7Yp/5aF3VmX+96F9vgWrrErveWzkHfYuqoQ
	 FPbfUPOmxNQ1NoqoyW9aCHuePE3vygXckO1sinM1pWt2pzy5stb3C91rUngm46+NHi
	 r3R1+P1H+HfI0y0ijIGfgWBC0RoypDh54zA1rGfGNzRLWTECEJh3WAmvNn5wm26UtA
	 s4tuh/vg6KdRTlVz23PF3BDpdqiAO1OzMaNByKYPIgLBsbtP6vNiKCp+0vXL4vrxKX
	 V2BfTzqnvu3UpGs4+DFCumXGrrOlomyvgd2GBmBruzCelpJD2b1zZYr3C9VXgIZgor
	 gcKgx1MXNGJaA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v6 04/13] riscv/kprobe: Add common RVI and RVC
 instruction decoder code
In-Reply-To: <20230127130541.1250865-5-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-5-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:29:44 +0100
Message-ID: <87y1phtsxj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_052949_996192_659049DF 
X-CRM114-Status: GOOD (  20.24  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPgo+IFRoZXNlIFJWSSBhbmQg
UlZDIGluc3RydWN0aW9uIGRlY29kZXIgYXJlIHVzZWQgaW4gdGhlIGZyZWUgcmVnaXN0ZXIKPiBz
ZWFyY2hpbmcgYWxnb3JpdGhtLCBlYWNoIGluc3RydWN0aW9uIG9mIGluc3RydW1lbnRlZCBmdW5j
dGlvbiBuZWVkcyB0bwo+IGRlY29kZSBhbmQgdGVzdCBpZiBpdCBjb250YWlucyBhIGZyZWUgcmVn
aXN0ZXIgdG8gZm9ybSBBVUlQQy9KQUxSLgo+Cj4gRm9yIFJWSSBpbnN0cnVjdGlvbiBmb3JtYXQs
IHRoZSBwb3NpdGlvbiBhbmQgbGVuZ3RoIG9mIHJzMS9yczIvcmQvb3Bjb2RlCj4gcGFydHMgYXJl
IHVuaWZvcm0gWzFdLCBidXQgUlZDIGluc3RydWN0aW9uIGZvcm1hdHMgYXJlIGNvbXBsaWNhdGVk
LCBzbwo+IGl0IGFkZHJlc3NlcyBhIHNlcmllcyBvZiBmdW5jdGlvbnMgdG8gZGVjb2RlIHJzMS9y
czIvcmQgZm9yIFJWQyBbMV0uCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2
LWlzYS1tYW51YWwvcmVsZWFzZXMKPgo+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hhbmcgPGxpYW9j
aGFuZzFAaHVhd2VpLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IENoZW4gR3Vva2FpIDxjaGVuZ3Vv
a2FpMTdAbWFpbHMudWNhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIEd1b2thaSA8Y2hl
bmd1b2thaTE3QG1haWxzLnVjYXMuYWMuY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYnVnLmggICAgICAgICAgICAgfCAgIDUgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L2RlY29kZS1pbnNuLmggICB8IDE0OCArKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oIHwgIDQyICsrKysrKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxOTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYnVnLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2J1Zy5oCj4gaW5kZXggMWFhZWE4MWZiMTQxLi45YzMzZDNiNTgyMjUgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9idWcuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYnVnLmgKPiBAQCAtMTksMTEgKzE5LDE0IEBACj4gICNkZWZpbmUgX19CVUdfSU5TTl8zMglf
VUwoMHgwMDEwMDA3MykgLyogZWJyZWFrICovCj4gICNkZWZpbmUgX19CVUdfSU5TTl8xNglfVUwo
MHg5MDAyKSAvKiBjLmVicmVhayAqLwo+ICAKPiArI2RlZmluZSBSVklfSU5TTl9MRU4JNFVMCj4g
KyNkZWZpbmUgUlZDX0lOU05fTEVOCTJVTAo+ICsKPiAgI2RlZmluZSBHRVRfSU5TTl9MRU5HVEgo
aW5zbikJCQkJCQlcCj4gICh7CQkJCQkJCQkJXAo+ICAJdW5zaWduZWQgbG9uZyBfX2xlbjsJCQkJ
CQlcCj4gIAlfX2xlbiA9ICgoaW5zbiAmIF9fSU5TTl9MRU5HVEhfTUFTSykgPT0gX19JTlNOX0xF
TkdUSF8zMikgPwlcCj4gLQkJNFVMIDogMlVMOwkJCQkJCVwKPiArCQlSVklfSU5TTl9MRU4gOiBS
VkNfSU5TTl9MRU47CQkJCVwKPiAgCV9fbGVuOwkJCQkJCQkJXAo+ICB9KQo+ICAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2RlY29kZS1pbnNuLmggYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvZGVjb2RlLWluc24uaAo+IGluZGV4IDQyMjY5YTdkNjc2ZC4uNzg1YjAy
M2E2MmVhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9kZWNvZGUtaW5z
bi5oCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2RlY29kZS1pbnNuLmgKPiBAQCAt
Myw2ICszLDcgQEAKPiAgI2lmbmRlZiBfUklTQ1ZfS0VSTkVMX0tQUk9CRVNfREVDT0RFX0lOU05f
SAo+ICAjZGVmaW5lIF9SSVNDVl9LRVJORUxfS1BST0JFU19ERUNPREVfSU5TTl9ICj4gIAo+ICsj
aW5jbHVkZSA8bGludXgvYml0b3BzLmg+Cj4gICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KPiAg
I2luY2x1ZGUgPGFzbS9rcHJvYmVzLmg+Cj4gIAo+IEBAIC0xNSw0ICsxNiwxNTEgQEAgZW51bSBw
cm9iZV9pbnNuIHsKPiAgZW51bSBwcm9iZV9pbnNuIF9fa3Byb2Jlcwo+ICByaXNjdl9wcm9iZV9k
ZWNvZGVfaW5zbihwcm9iZV9vcGNvZGVfdCAqYWRkciwgc3RydWN0IGFyY2hfcHJvYmVfaW5zbiAq
YXNpKTsKPiAgCj4gKyNpZmRlZiBDT05GSUdfS1BST0JFUwoKTm8gcmVhc29uIHRvIGhpZGUgdGhl
IHN0YXRpYyBpbmxpbmVzIGJlaGluZCBhbiBpZmRlZjsgTGVhdmUgaXQgb3V0LCBzbwppdCdzIGxl
c3MgbGlrZWx5IHRoYXQgY29kZSBicmVha3Mgc2xpcCB0aHJvdWdoLgoKSSB3b25kZXIgaWYgdGhl
c2UgZnVuY3Rpb25zIGJlbG93IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBpbiB0aGUKYXNtL2luc24u
aCwgd2hlcmUgcmlzY3ZfaW5zbl9pc18jI25hbWUgbGl2ZSAod2hpY2ggeW91J3JlIHVzaW5nIGlu
IGxhdGVyCnBhdGNoZXMpLiBIZWlrbyAoQ2MnZCkgcmVjZW50bHkgZGlkIGEgYmlnIGNsZWFuIHVw
IHRoZXJlLCB3aGljaCBwcm9iYWJseQphcHBseSB0byB0aGUgY29kZSBiZWxvdy4KCj4gKwo+ICtz
dGF0aWMgaW5saW5lIHUxNiBydmlfcnMxKGtwcm9iZV9vcGNvZGVfdCBvcGNvZGUpCj4gK3sKPiAr
CXJldHVybiAodTE2KSgob3Bjb2RlID4+IDE1KSAmIDB4MWYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW5saW5lIHUxNiBydmlfcnMyKGtwcm9iZV9vcGNvZGVfdCBvcGNvZGUpCj4gK3sKPiArCXJldHVy
biAodTE2KSgob3Bjb2RlID4+IDIwKSAmIDB4MWYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5l
IHUxNiBydmlfcmQoa3Byb2JlX29wY29kZV90IG9wY29kZSkKPiArewo+ICsJcmV0dXJuICh1MTYp
KChvcGNvZGUgPj4gNykgJiAweDFmKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBzMzIgcnZp
X2JyYW5jaF9pbW1lKGtwcm9iZV9vcGNvZGVfdCBvcGNvZGUpCj4gK3sKPiArCXUzMiBpbW1lID0g
MDsKPiArCj4gKwlpbW1lIHw9ICgoKG9wY29kZSA+PiA4KSAgJiAweGYpICAgPDwgMSkgIHwKPiAr
CQkoKChvcGNvZGUgPj4gMjUpICYgMHgzZikgIDw8IDUpICB8Cj4gKwkJKCgob3Bjb2RlID4+IDcp
ICAmIDB4MSkgICA8PCAxMSkgfAo+ICsJCSgoKG9wY29kZSA+PiAzMSkgJiAweDEpICAgPDwgMTIp
Owo+ICsKPiArCXJldHVybiBzaWduX2V4dGVuZDMyKGltbWUsIDEzKTsKPiArfQo+ICsKPiArc3Rh
dGljIGlubGluZSBzMzIgcnZpX2phbF9pbW1lKGtwcm9iZV9vcGNvZGVfdCBvcGNvZGUpCj4gK3sK
PiArCXUzMiBpbW1lID0gMDsKPiArCj4gKwlpbW1lIHw9ICgoKG9wY29kZSA+PiAyMSkgJiAweDNm
ZikgPDwgMSkgIHwKPiArCQkoKChvcGNvZGUgPj4gMjApICYgMHgxKSAgIDw8IDExKSB8Cj4gKwkJ
KCgob3Bjb2RlID4+IDEyKSAmIDB4ZmYpICA8PCAxMikgfAo+ICsJCSgoKG9wY29kZSA+PiAzMSkg
JiAweDEpICAgPDwgMjApOwo+ICsKPiArCXJldHVybiBzaWduX2V4dGVuZDMyKGltbWUsIDIxKTsK
PiArfQo+ICsKPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfQwoKRGl0by4gSnVzdCBnZXQgcmlk
IG9mIHRoZSBpZmRlZiBjbHV0dGVyLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
