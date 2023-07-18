Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069EBEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSBT4wwkb6ASRTpB4CUWW0lHB4NIk9DalGXfsabtyDk=; b=i6/h50iREPDuPy
	G8dourhDTQUnhX8aR/ttkpR8UJ6ctj6XHBgBuBxJbOJHSLhrb5mENLbjaXEfO35n/uSY5E/LtJLp8
	5AohEFeFEBl3NERf4Hfy+UAhis6S09SRGaEoarvo1q0VxMC/rjXlfWaUopot9IUZfisvI/PvJ3q96
	hm4icHnimGSVjvhDXfZWcmtfVYn96o7yRXa9mXOcxiz1bIVmKUVdFoXhF0D+o14koVs7CcRSrfClV
	2bkAy5LFp3TLuP6u4EvxG7JXzUceI4+4P3Nsx1NcL+OVmp38B8ekNKyV9LkzEhCsycoz3OxOia/1D
	MQTYEftB2bUgb1IuiRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM12w-005wYE-13;
	Wed, 19 Jul 2023 06:52:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM12u-005wWT-2U
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0DKCHR724FC0eduKrAlUVTYvdLgrl2+HvadsLTAl6Us=; b=CNBHXO1fw8D6kpbOZTc2r+p0hG
	CAE1YRe61ZtGwwsp5SSCeAB0IkARbninkMqUMLsFzI4Rn0q5VSFW9x32MzoCLKYWwgtV/RKOd5+BP
	4yMPSS87NVGMi4eHYuF7vMuPS+zkDU/dYgJa81BqiUOee3S5HgAcndVTi/A01vWCgUpLaIhGlQ6bV
	OfXHFLVRO/o5AIAa8xncOkMTnpiYvHd5Qm69smbdRUHq4KH5vRMV0NYmKTlB5PXAaBRwp1uXrf31u
	HwDWBQaKPlUoSGnbvivIxpFWCPg1Puy22Z54nqJ81gznnHHa5w4eXj+CBqTbnhFzV391LM9Z2zuBS
	BIucPEmA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLree-00C0YX-1M
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 20:50:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6188D60F61;
	Tue, 18 Jul 2023 20:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B9DC433C7;
	Tue, 18 Jul 2023 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689713437;
	bh=gEw8p5anenofWHBZHWKW/M+NiMyaqUqwak/8urPi6d0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KoWuP96wI+fWF75KtEEfSTM7QZlGgyUN+r99fgZJAOZCbu3s3WepGiN78qpbm23ec
	 ELTNWYXCY6CDlPQg1F8OkTZdxeWP5A9VRfECDCxWwUV52mEfW873IZv1hsrV+tw5i3
	 fb3jJua0QevRiYL+4UX7YS34g6PetCisPQBcr2nLSlv3K3uDSbHcco5tW/9AUFv6dt
	 8v36TclnokUEie2tDstig83bO+u56kGL7ZkzdPbfb66wSuYgf9DXdytSVbxRTvzsfL
	 WFuJ1k/zhiuVDGmnBI3m4fXipJNgg0jGyGprr74eW4lIX3akkuzV//duzrZWov14Vt
	 7Cx6CnyRphAig==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] riscv: entry: set a0 prior to
 syscall_enter_from_user_mode
In-Reply-To: <03206759-8d6a-a410-a8f9-d4678236bdbf@gmail.com>
References: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
 <87pm4p2et2.fsf@all.your.base.are.belong.to.us>
 <03206759-8d6a-a410-a8f9-d4678236bdbf@gmail.com>
Date: Tue, 18 Jul 2023 22:50:35 +0200
Message-ID: <87r0p5kkpw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_215046_601825_D3FBACA4 
X-CRM114-Status: GOOD (  18.30  )
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

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gMjAy
My83LzE5IDAzOjM1LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBDZWxlc3RlIExpdSA8Y29lbGFj
YW50aHVzaGV4QGdtYWlsLmNvbT4gd3JpdGVzOgo+PiAKPj4+IFdoZW4gd2UgdGVzdCBzZWNjb21w
IHdpdGggNi40IGtlcm5lbCwgd2UgZm91bmQgZXJybm8gaGFzIHdyb25nIHZhbHVlLgo+Pj4gSWYg
d2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1MDU4
NmQsIHdlIHdpbGwKPj4+IGdldCBFTk9TWVMgaW5zdGVhZC4gV2UgZ290IHNhbWUgcmVzdWx0IHdp
dGggOWMyNTk4ZDQzNTEwICgicmlzY3Y6IGVudHJ5OiBTYXZlIGEwCj4+PiBwcmlvciBzeXNjYWxs
X2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KPj4+Cj4+PiBBZnRlciBhbmFseXNpbmcgY29kZSwg
d2UgdGhpbmsgdGhhdCByZWdzLT5hMCA9IC1FTk9TWVMgc2hvdWxkIGJlIGFkdmFuY2VkIGJlZm9y
ZQo+Pj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSB0byBmaXggdGhpcyBwcm9ibGVtLiBJ
biBfX3NlY2NvbXBfZmlsdGVyLCB3aGVuCj4+PiBzZWNjb21wIHJlamVjdGVkIHRoaXMgc3lzY2Fs
bCB3aXRoIHNwZWNpZmllZCBlcnJubywgdGhleSB3aWxsIHNldCBhMCB0byByZXR1cm4KPj4+IG51
bWJlciBhcyBzeXNjYWxsIEFCSSwgYW5kIHRoZW4gcmV0dXJuIC0xLiBUaGlzIHJldHVybiBudW1i
ZXIgaXMgZmluYWxseSBwYXNzCj4+PiBhcyByZXR1cm4gbnVtYmVyIG9mIHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUsIGFuZCB0aGVuIGlzIGNvbXBhcmVkCj4+PiB3aXRoIE5SX3N5c2NhbGxz
IGFmdGVyIGNvbnZlcnRlZCB0byB1bG9uZyAoc28gaXQgd2lsbCBiZSBVTE9OR19NQVgpLgo+Pj4g
VGhlIGNvbmRpdGlvbiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFsc2Us
IHNvIHJlZ3MtPmEwID0gLUVOT1NZUwo+Pj4gaXMgYWx3YXlzIGV4ZWN1dGFibGUuIEl0IGNvdmVy
ZWQgYTAgc2V0IGJ5IHNlY2NvbXAsIHNvIHdlIGFsd2F5cyBnZXQKPj4+IEVOT1NZUyB3aGVuIG1h
dGNoIHNlY2NvbXAgUkVUX0VSUk5PIHJ1bGUuCj4+IAo+PiBJc24ndCBzb21ldGhpbmcgbGlrZS4u
Lgo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4+IGluZGV4IGY5MTBkZmNjYmY1ZC4uMTVhOGI0ODk4YTZjIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPj4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBhc21saW5rYWdlIF9fdmlz
aWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBf
ZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gIHsKPj4gIAlpZiAodXNlcl9tb2RlKHJl
Z3MpKSB7Cj4+IC0JCXVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPj4gKwkJbG9uZyBzeXNjYWxs
ID0gcmVncy0+YTc7Cj4+ICAKPj4gIAkJcmVncy0+ZXBjICs9IDQ7Cj4+ICAJCXJlZ3MtPm9yaWdf
YTAgPSByZWdzLT5hMDsKPj4gQEAgLTMwNiw3ICszMDYsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJs
ZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKPj4gIAo+PiAgCQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdz
LCBzeXNjYWxsKTsKPj4gIAo+PiAtCQlpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+PiArCQlp
ZiAoc3lzY2FsbCA+IC0xICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gIAkJCXN5c2NhbGxf
aGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPj4gIAkJZWxzZQo+PiAgCQkJcmVncy0+YTAgPSAtRU5P
U1lTOwo+PiAKPj4gCj4+IC4uLmVhc2llciB0byByZWFkPwo+PiAKPj4gCj4+IEJqw7Zybgo+Cj4g
SXQgc2VlbXMgdGhhdCB5b3VyIGNoYW5nZSB0dXJuIGl0IGJhY2sgdG8gdGhlIGJlZ2lubmluZy4g
SWYgc3lzY2FsbCA9PSAtMSwKPiBpdCBpcyBzdXBwb3NlZCB0byBnbyBuZWl0aGVyIGZpcnN0IG5v
ciBlbHNlIGJyYW5jaC4gSXQgc2hvdWxkIGRvIE5PVEhJTkcuCj4gSG93ZXZlciBpdCB3YXMgc3Rp
bGwgYSBncmVhdCBpZGVhLiBJdCBtYXkgYmUgYmV0dGVyIHRvIHVzZSBhIHNldCBvZiBpZi1zdGF0
ZW1lbnQKPiB0byBjbGFyaWZ5IHRoZSBsb2dpYy4KCkFoLCBnb3RjaGEhIChOb3RpY2UgdGhhdCBh
cmNoL3g4Ni9lbnRyeS9jb21tb24uYyBoYXMKCiAgfCAJaWYgKCFkb19zeXNjYWxsX3g2NChyZWdz
LCBucikgJiYgIWRvX3N5c2NhbGxfeDMyKHJlZ3MsIG5yKSAmJiBuciAhPSAtMSkgewoKYW5kIGlu
IGRvX3N5c2NhbGxfeDY0KCkKCiAgfCAJLyoKICB8IAkgKiBDb252ZXJ0IG5lZ2F0aXZlIG51bWJl
cnMgdG8gdmVyeSBoaWdoIGFuZCB0aHVzIG91dCBvZiByYW5nZQogIHwgCSAqIG51bWJlcnMgZm9y
IGNvbXBhcmlzb25zLgogIHwgCSAqLwogIHwgCXVuc2lnbmVkIGludCB1bnIgPSBucjsKCgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+IGluZGV4IGY5MTBkZmNjYmY1ZDIuLmQwYmQ3MjUyNDQ1OTQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiBAQCAtMzA2LDcgKzMwNiw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9z
ZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAKPiAg
CQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsK
PiAgCj4gLQkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPiArCQlpZiAoc3lzY2FsbCA9PSAt
MSkKPiArCQkJLy8gRG8gbm90aGluZwo+ICsJCWVsc2UgaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxs
cykKPiAgCQkJc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+ICAJCWVsc2UKPiAgCQkJ
cmVncy0+YTAgPSAtRU5PU1lTOwoKTWF5YmUgc29tZXRoaW5nIGEgYml0IG1vcmUgZXhwbGljaXQ/
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKaW5kZXggZjkxMGRmY2NiZjVkLi41Y2VmNzI4NzQ1NDIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YwpAQCAtMjk3LDYgKzI5NywxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlv
biB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiBhc21saW5rYWdlIF9f
dmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKIHsKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CisJCS8qCisJCSAqIENvbnZlcnQg
bmVnYXRpdmUgbnVtYmVycyB0byB2ZXJ5IGhpZ2ggYW5kIHRodXMgb3V0IG9mIHJhbmdlCisJCSAq
IG51bWJlcnMgZm9yIGNvbXBhcmlzb25zLgorCQkgKi8KIAkJdWxvbmcgc3lzY2FsbCA9IHJlZ3Mt
PmE3OwogCiAJCXJlZ3MtPmVwYyArPSA0OwpAQCAtMzA4LDcgKzMxMiw3IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogCiAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCiAJCQlzeXNjYWxsX2hh
bmRsZXIocmVncywgc3lzY2FsbCk7Ci0JCWVsc2UKKwkJZWxzZSBpZiAoKGxvbmcpc3lzY2FsbCAh
PSAtMUwpCiAJCQlyZWdzLT5hMCA9IC1FTk9TWVM7CiAKIAkJc3lzY2FsbF9leGl0X3RvX3VzZXJf
bW9kZShyZWdzKTsKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
