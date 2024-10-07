Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A45CFB446
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrUGbPElEt7c6g76We7Eg2sK1wqYFXi/753zidXPufU=; b=FpbCDl9BKbcbZr
	1ViCvPQSDl76y10gT2XVaWHzkOiC8e0VAfEqr1Qv8Rz7+XeAccFbJqlhGBRzriJ7YsFZGBNRr8nd/
	D+zNIasbHwl0/V7oL4T66VdM8vwwb6DUCQ8WbDHSzB55NXHqO0KnoAfxuA8/t1eHK1Tv3aCjCjiGh
	0ULSQ58g9QMMK2FVQR/uzdJ4JuR8RMn+pjxcObZU+LexnPvv55G8d5wby0UiqlZ+WMIUYnx8etybG
	5nWnZ/lL+rszRhjFPc4ExYGMKBhSQ8OtfnSPeu0808x6YbnxfoT3HFktLeB3VfnSJ7zP+M5h9kV2X
	NG4cdww5BLIl6wfS6K/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqAW-000000034NL-2qdM;
	Mon, 07 Oct 2024 16:01:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqAU-000000034LE-0ISf
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 473E8A418B4;
	Mon,  7 Oct 2024 16:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2E7C4CEC7;
	Mon,  7 Oct 2024 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316861;
	bh=e2NBHTw6PPvjULzXCQpYbFWcRNCqsXQxPgENG33mKoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WMvlMyGgn0mENSHuioUpratdm0Fb72jH/kyBzfNDdc11bZdmf3uNCn5qkmZiqgAjA
	 3ZgPvnDTMA/gDx07PgsHCfRvUUnLr1IBUyvMZ73Abl/ur+HQ14iEqXtKy3vXr7JRjM
	 MlB7ynIIb4SOzxaNenMQFfx2laXFSRsI2HH+0ndsfY+NTFJPjHQ3ymJFsy9YDIATXv
	 1jtvMsLJyLpwgwK83CxA/HKgkJ6cyX8TtM7h2AJixNYiNMj41W9xuQ6F3C+aVJxI8I
	 JjVsW2EV//PdyPUejWOFFV/pJMg95M+X3wSlsdtlmRGY82RB4OEnPrvcmEPr8wLw0W
	 OPYet1W0eHtfA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, Anders Roxell
 <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
In-Reply-To: <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
Date: Mon, 07 Oct 2024 18:00:57 +0200
Message-ID: <87r08rnbra.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_090106_263220_0FCB5C08 
X-CRM114-Status: GOOD (  19.38  )
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

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIE1vbiwgT2N0IDA3
LCAyMDI0IGF0IDA5OjMxOjMyQU0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4KPj4gV2hl
biBidWlsZGluZyB0aGUga3NlbGZ0ZXN0IHN1aXRlLCBlLmcuOgo+Cj4+ICAgbWFrZSBBUkNIPXJp
c2N2IENST1NTX0NPTVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIFwKPj4gICAgIFNLSVBfVEFSR0VU
Uz0iIiBPPS9vdXRwdXQvZm9vIC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzIGluc3RhbGwKPgo+
PiBUaGUgZXhwZWN0YXRpb24gaXMgdGhhdCB0aGUgc2NoZWRfZXh0IGlzIGluY2x1ZGVkLCBjcm9z
cy1idWlsdCwgYW5kCj4+IHBsYWNlZCBpbnRvIC9vdXRwdXQvZm9vLgo+Cj4gV2hlbiBidWlsZGlu
ZyBmb3IgYXJtNjQgd2l0aCB0aGlzIGFwcGxpZWQgb24gdG9wIG9mIG1haW5saW5lIG9yIC1uZXh0
Cj4gSSdtIHNlZWluZzoKClRoYW5rcyBmb3IgdGFraW5nIGl0IGZvciBhIHNwaW4hCgo+ICAgIG1h
a2UgQVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQtbGludXgtZ251LSAtQyB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cyBUQVJHRVRTPXNjaGVkX2V4dCBTS0lQX1RBUkdFVFM9Igo+Cj4gZ2l2
ZQo+Cj4gICBDTE5HLUJQRiBjcmVhdGVfZHNxLmJwZi5vCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IGNyZWF0ZV9kc3EuYnBmLmM6OToKPiAvaG9tZS9icm9vbmllL2dpdC9saW51eC90b29scy9zY2hl
ZF9leHQvaW5jbHVkZS9zY3gvY29tbW9uLmJwZi5oOjMzOjE3OiBlcnJvcjogdXNlIG9mIHVuZGVj
bGFyZWQgaWRlbnRpZmllciAnU0NYX0RTUV9GTEFHX0JVSUxUSU4nCj4gICAgMzMgfCAgICAgICAg
IF9TdGF0aWNfYXNzZXJ0KFNDWF9EU1FfRkxBR19CVUlMVElOLAo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICBeCgpUaGlzIGlzIG1vc3QgbGlrZWx5IGR1ZSB0byBpbmNvcnJlY3QgVk1M
SU5VWF9CVEZfUEFUSFMsIHNvIHRoYXQKdm1saW51eC5oIGlzIGluY29ycmVjdGx5IGdlbmVyYXRl
ZC4gVHJ5IGdyZXBwaW5nIGZvcgpTQ1hfRFNRX0ZMQUdfQlVJTFRJTiBpbiB2bWxpbnV4LmguCgo+
IGFuZCBtb3JlIChteSBzeXN0ZW0gY2xhbmcgaXMgY2xhbmcgMjApLiAgSXQncyBhbHNvIGZhaWxp
bmcgd2l0aCBhIG5hdGl2ZQo+IHg4Nl82NCBidWlsZCBpbiB0aGUgc2FtZSB3YXkuICBJJ3ZlIHJ1
biAibWFrZSBoZWFkZXJzX2luc3RhbGwiLCBpdCBsb29rcwo+IGxpa2UgY2xhbmcgaXMgbm90IGdl
dHRpbmcgdG9sZCBhYm91dCB0aGUgY29weSBvZiB0aGUgaGVhZGVycyBpbnN0YWxsZWQKPiBpbiAu
L3Vzci9pbmNsdWRlOgo+Cj4gY2xhbmcgLWcgLURfX1RBUkdFVF9BUkNIX3g4NiAtbWxpdHRsZS1l
bmRpYW4gLUkvaG9tZS9icm9vbmllL2dpdC9saW51eC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9z
Y2hlZF9leHQvaW5jbHVkZSAtSS9ob21lL2Jyb29uaWUvZ2l0L2xpbnV4L3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3NjaGVkX2V4dC9pbmNsdWRlL2JwZi1jb21wYXQgLUkvaG9tZS9icm9vbmllL2dp
dC9saW51eC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hlZF9leHQvYnVpbGQvaW5jbHVkZSAt
SS9ob21lL2Jyb29uaWUvZ2l0L2xpbnV4L3Rvb2xzL2luY2x1ZGUvdWFwaSAtSS9ob21lL2Jyb29u
aWUvZ2l0L2xpbnV4L3Rvb2xzL3NjaGVkX2V4dC9pbmNsdWRlIC1JL2hvbWUvYnJvb25pZS9naXQv
bGludXgvaW5jbHVkZSAtaWRpcmFmdGVyIC91c3IvbGliL2xsdm0tMjAvbGliL2NsYW5nLzIwL2lu
Y2x1ZGUgLWlkaXJhZnRlciAvdXNyL2xvY2FsL2luY2x1ZGUgLWlkaXJhZnRlciAvdXNyL2luY2x1
ZGUveDg2XzY0LWxpbnV4LWdudSAtaWRpcmFmdGVyIC91c3IvaW5jbHVkZSAgLVdhbGwgLVduby1j
b21wYXJlLWRpc3RpbmN0LXBvaW50ZXItdHlwZXMgLVduby1pbmNvbXBhdGlibGUtZnVuY3Rpb24t
cG9pbnRlci10eXBlcyAtTzIgLW1jcHU9djMgLXRhcmdldCBicGYgLWMgY3JlYXRlX2RzcS5icGYu
YyAtbyAvaG9tZS9icm9vbmllL2dpdC9saW51eC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hl
ZF9leHQvYnVpbGQvb2JqL3NjaGVkX2V4dC9jcmVhdGVfZHNxLmJwZi5vCgpUaGUgc2NoZWRfZXh0
IEJQRiBwcm9ncmFtcyByZWxpZXMgb24gYSB2bWxpbnV4LmgsIHdoaWNoIGlzIGdlbmVyYXRlZAp1
c2luZyBicGZ0b29sIGFuZCB0aGUgdm1saW51eCB3aXRoIEJURiBpbmZvcm1hdGlvbi4gSGF2ZSB5
b3UgYnVpbHQgYQprZXJuZWwgd2l0aCBCVEYgc3VwcG9ydD8KCj4+IEFkZCBDUk9TU19DT01QSUxF
LCBPVVRQVVQsIGFuZCBUQVJHRVRTIHN1cHBvcnQgdG8gdGhlIHNjaGVkX2V4dAo+PiBzZWxmdGVz
dC4gQWxzbywgcmVtb3ZlIHNvbWUgdmFyaWFibGVzIHRoYXQgd2VyZSB1bnVzZWQgYnkgdGhlCj4+
IE1ha2VmaWxlLgo+Cj4+ICtpZm5lcSAoJChDUk9TU19DT01QSUxFKSwpCj4+ICtERUZBVUxUX0JQ
RlRPT0wgOj0gJChPVVRQVVRfRElSKS9ob3N0L3NiaW4vYnBmdG9vbAo+PiArSE9TVF9PQkpfRElS
IDo9ICQoT0JKX0RJUikvaG9zdC9icGZ0b29sCj4+ICtIT1NUX0xJQkJQRl9PVVRQVVQgOj0gJChP
QkpfRElSKS9ob3N0L2xpYmJwZi8KPj4gK0hPU1RfTElCQlBGX0RFU1RESVIgOj0gJChPVVRQVVRf
RElSKS9ob3N0Lwo+PiArSE9TVF9ERVNURElSIDo9ICQoT1VUUFVUX0RJUikvaG9zdC8KPj4gK2Vs
c2UKPj4gK0RFRkFVTFRfQlBGVE9PTCA6PSAkKE9VVFBVVF9ESVIpL3NiaW4vYnBmdG9vbAo+PiAr
SE9TVF9PQkpfRElSIDo9ICQoT0JKX0RJUikvYnBmdG9vbAo+PiArSE9TVF9MSUJCUEZfT1VUUFVU
IDo9ICQoT0JKX0RJUikvbGliYnBmLwo+PiArSE9TVF9MSUJCUEZfREVTVERJUiA6PSAkKE9VVFBV
VF9ESVIpLwo+PiArSE9TVF9ERVNURElSIDo9ICQoT1VUUFVUX0RJUikvCj4+ICtlbmRpZgo+Cj4g
VGhpcyB3b24ndCBkZXRlY3QgYSBjcm9zcyBjb21waWxlIHdoZW4gYnVpbGRpbmcgdXNpbmcgTExW
TSBhcyB0aGF0Cj4gZG9lc24ndCBuZWVkIHRvIHNldCBDUk9TU19DT01QSUxFLCBpdCBjYW4gdXNl
IHRoZSBzYW1lIGJpbmFyaWVzIGZvciBhbGwKPiB0YXJnZXRzLiAgVGhlcmUncyBydW5lcyBpbiB0
aGUgTWFrZWZpbGUgZm9yIHRoZSBtbSBzZWxmdGVzdHMgZm9yCj4gaWRlbnRpZnlpbmcgdGhlIHRh
cmdldCBhcmNoaXRlY3R1cmUsIHRob3VnaCBhY3R1YWxseSBJJ20gd29uZGVyaW5nIGlmCj4gaXQn
cyB3b3J0aCBqdXN0IGFsd2F5cyBidWlsZGluZyB0aGUgaG9zdCBjb3B5IGFuZCBuZXZlciBoYXZp
bmcgdG8gd29ycnkKPiBpZiB0aGUgdGFyZ2V0IGJ1aWxkIGlzIGEgY3Jvc3MgYnVpbGQgb3Igbm90
PyAgSXQncyBvYnZpb3VzIG92ZXJoZWFkIGluCj4gdGhlIG5hdGl2ZSBjYXNlIHRob3VnaCBpZiB3
ZSBhY3R1YWxseSBuZWVkIHRoZSB0YXJnZXQgY29weS4KClllYWgsIHRoYXQgd291bGQgaW5kZWVk
IHNpbXBsaWZ5IHRoaW5ncyEgSSdsbCBzcGluIGEgdjMgd2l0aCB0aGF0IChhbmQKd2FpdCBmb3Ig
bW9yZSBmZWVkYmFjaykuCgoKVGhhbmtzIGZvciB0ZXN0aW5nIHRoZSBwYXRjaCEKQmrDtnJuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
