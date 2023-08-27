Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548E7C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 19:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXA16blgPQeTWJqgwfe2agrLXx5nflYmJ2MM6VZ3CeQ=; b=T8WoGam+K4/Zzc
	LEgelfoYZ6DX+2e3BnagqVzvZ2g8I415r/iLud0UIGZWPOp7/C6GtBtXpbZsnOv3j7p8lxySzccHF
	j6wuB8uFbR5/khxG/tiL/Gc8Es156GXgxTMTFxGudbpBH7TxySOIfX/JaXL1e3rrQwFEw+yVHPlZ/
	2L9E20tSiLsaAPhPNHurOUJ4+9KSDQSAdW0A4EnLX9hTBxWnSqzhdtT+JD2T72vW12G9vTq6QxG+x
	LcuZQwn9uEB6ndVkxQRnp3K/NawyceqbMuGdkKGb4tmTr/n6gUPdKmE5ec5eUJqBVnfCh146rCTV1
	uL65qQ+c4rsLNBF8PIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLJc-008OQ7-0b;
	Sun, 27 Aug 2023 19:20:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaLJZ-008OPj-0C
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 19:20:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CBB560F5E;
	Sun, 27 Aug 2023 19:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50982C433C7;
	Sun, 27 Aug 2023 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693164047;
	bh=R0yz9DYWWTF2JfkG/4yrB5YqEhnyNDO2Qx4lGAj3G8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gn4fHzjutkm+Ah9eK4/+X5VRkqcVs72ObgB6xwovTEYUbeD/vFf0BVWr4h0Crvqbh
	 77/IM2PbfLgVOt7DmGJsrcmvDRf8LXlZgSlrUD1QSBexwtTS4+FAH02Wb1SbxY1fua
	 twNjIDgbmbMeJxsa85cEOJEy6eauNLD7S70Qu36z6vw7wKi3/T36i6SOPQjc47g84Z
	 GOHnJRwi/blt+92dYdE8VMhqGhEP9rmul+/DlPycbD9U2Lonl2UPcd6vf+MlS+kpSt
	 /l7wB2BUeDw2GG8Ga6Zzj7YEA73qsSbLQW7jx895NSzJlfeJ+Y0nykJxfziehCbwmC
	 H2YnEAZ3ygcOQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
 bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
 yonghong.song@linux.dev, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
In-Reply-To: <ZOsZtH+5P0/R6kvd@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
 <ZOsKukBz8i+h4Y8j@nam-dell>
 <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
 <ZOsZtH+5P0/R6kvd@nam-dell>
Date: Sun, 27 Aug 2023 21:20:44 +0200
Message-ID: <87jztgwaur.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_122049_190070_B3F393DA 
X-CRM114-Status: GOOD (  30.72  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gU3VuLCBBdWcgMjcsIDIw
MjMgYXQgMTE6MDQ6MzRBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gTmFtIENhbyA8
bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKPj4gCj4+ID4gT24gU3VuLCBBdWcgMjcsIDIwMjMg
YXQgMTA6MTE6MjVBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gPj4gVGhlIGRlZmF1
bHQgaW1wbGVtZW50YXRpb24gb2YgaXNfdHJhcF9pbnNuKCkgd2hpY2ggUklTQy1WIGlzIHVzaW5n
IGNhbGxzCj4+ID4+IGlzX3N3YnBfaW5zbigpLCB3aGljaCBpcyBkb2luZyB3aGF0IHlvdXIgcGF0
Y2ggZG9lcy4gWW91ciBwYXRjaCBkb2VzIG5vdAo+PiA+PiBhZGRyZXNzIHRoZSBpc3N1ZS4KPj4g
Pgo+PiA+IGlzX3N3YnBfaW5zbigpIGRvZXMgdGhpczoKPj4gPgo+PiA+ICAgICAgICAgI2lmZGVm
IENPTkZJR19SSVNDVl9JU0FfQwo+PiA+ICAgICAgICAgICAgICAgICByZXR1cm4gKCppbnNuICYg
MHhmZmZmKSA9PSBVUFJPQkVfU1dCUF9JTlNOOwo+PiA+ICAgICAgICAgI2Vsc2UKPj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuICppbnNuID09IFVQUk9CRV9TV0JQX0lOU047Cj4+ID4gICAgICAg
ICAjZW5kaWYKPj4gPgo+PiA+IC4uLnNvIGl0IGRvZXNuJ3QgZXZlbiBjaGVjayBmb3IgMzItYml0
IGVicmVhayBpZiBDIGV4dGVuc2lvbiBpcyBvbi4gTXkgcGF0Y2gKPj4gPiBpcyBub3QgdGhlIHNh
bWUuCj4+IAo+PiBBaCwgd2FzIHRvbyBxdWljay4KPj4gCj4+IEFGQUlVIHVwcm9iZXMgKmFsd2F5
cyogdXNlcyBjLmVicmVhayB3aGVuIENPTkZJR19SSVNDVl9JU0FfQyBpcyBzZXQsIGFuZAo+PiBl
YnJlYWsgb3RoZXJ3aXNlLiBUaGF0J3MgdGhlIHJlYXNvbiBpc19zd2JwX2luc24oKSBpcyBpbXBs
ZW1lbnRlZCBsaWtlCj4+IHRoYXQuCj4KPiBUaGF0J3Mgd2hhdCBJIHVuZGVyc3RhbmQgdG9vLgo+
Cj4+IElmIHRoYXQncyBub3QgdGhlIGNhc2UsIHRoZXJlJ3MgYSBhbm90aGVyIGJ1ZywgdGhhdCB5
b3VyIHBhdGNoZXMKPj4gYWRkcmVzc2VzLgo+Cj4gSSB0aGluayBpdCdzIGEgYnVnIHJlZ2FyZGxl
c3MuIGlzX3RyYXBfaW5zbigpIGlzIHVzZWQgYnkgdXByb2JlcyB0byBmaWd1cmUgb3V0Cj4gaWYg
dGhlcmUgaXMgYW4gaW5zdHJ1Y3Rpb24gdGhhdCBnZW5lcmF0ZXMgdHJhcCBleGNlcHRpb24sIG5v
dCBqdXN0IGluc3RydWN0aW9ucwo+IHRoYXQgYXJlICJTV0JQIi4gVGhlIHJlYXNvbiBpcyBiZWNh
dXNlIHdoZW4gdGhlcmUgaXMgYSB0cmFwLCBidXQgdXByb2JlcyBkb2Vzbid0Cj4gc2VlIGEgcHJv
YmUgaW5zdGFsbGVkIGhlcmUsIGl0IG5lZWRzIGlzX3RyYXBfaW5zbigpIHRvIGZpZ3VyZSBvdXQg
aWYgdGhlIHRyYXAKPiBpcyBnZW5lcmF0ZWQgYnkgZWJyZWFrIGZyb20gc29tZXRoaW5nIGVsc2Us
IG9yIGJlY2F1c2UgdGhlIHByb2JlIGlzIGp1c3QgcmVtb3ZlZC4KPiBJbiB0aGUgbGF0dGVyIGNh
c2UsIHVwcm9iZXMgd2lsbCByZXR1cm4gYmFjaywgYmVjYXVzZSBwcm9iZSBoYXMgYWxyZWFkeSBi
ZWVuIHJlbW92ZWQsCj4gc28gaXQgc2hvdWxkIGJlIHNhZmUgdG8gZG8gc28uIFRoYXQncyB3aHkg
SSB0aGluayB0aGUgaW5jb3JyZWN0IGlzX3N3YnBfaW5zbigpCj4gd291bGQgY2F1c2UgYSBoYW5n
LCBiZWNhdXNlIHVwcm9iZXMgaW5jb3JyZWN0bHkgdGhpbmtzIHRoZXJlIGlzIG5vIGVicmVhayB0
aGVyZSwKPiBzbyBpdCBzaG91bGQgYmUgb2theSB0byBnbyBiYWNrLCBidXQgdGhlcmUgYWN0dWFs
bHkgaXMuCj4KPiBTbywgZnJvbSBteSB1bmRlcnN0YW5kaW5nLCBpZiB1cHJvYmVzIGVuY291bnRl
ciBhIDMyLWJpdCBlYnJlYWsgZm9yIGFueSByZWFzb24sCj4gdGhlIGtlcm5lbCB3b3VsZCBoYW5n
LiBJIHRoaW5rIHlvdXIgcGF0Y2ggaXMgYSBncmVhdCBhZGRpdGlvbiBub25ldGhlbGVzcywgYnV0
IEkKPiBhbSBndWVzc2luZyB0aGF0IGl0IG9ubHkgbWFza3MgdGhlIHByb2JsZW0gYnkgcHJldmVu
dGluZyB1cHJvYmVzIGZyb20gc2VlaW5nIHRoZQo+IDMyLWJpdCBlYnJlYWsgaW4gdGhlIHNwZWNp
ZmljIHRlc3QsIG5vdCByZWFsbHkgc29sdmUgaXQuIFNvLCBpZiB0aGVyZSBpcyBhIDMyLWJpdAo+
IGVicmVhayBpbiB1c2Vyc3BhY2UsIHRoZSBidWcgc3RpbGwgY2F1c2VzIHRoZSBrZXJuZWwgdG8g
aGFuZy4KPgo+IEkgYW0gc3RpbGwgcXVpdGUgY29uZmlkZW50IG9mIG15IGxvZ2ljLCBzbyBJIHdv
dWxkIGJlIHZlcnkgc3VwcmlzZWQgaWYgbXkgZml4Cj4gZG9lc24ndCBzb2x2ZSB0aGUgcmVwb3J0
ZWQgaGFuZy4gRG8geW91IG1pbmQgdGVzdGluZyBteSBwYXRjaD8gTXkgcG90YXRvIG9mIGEKPiBs
YXB0b3AgdW5mb3J0dW5hdGVseSBjYW5ub3QgcnVuIHRoZSB0ZXN0IDooCgpNYXliZSBJIHdhc24n
dCBjbGVhciwgc29ycnkgZm9yIHRoYXQhIEkgZGlkIHRha2UgdGhlIHBhdGNoIGZvciBhIHNwaW4s
CmFuZCBpdCBkaWQgbm90IHNvbHZlIHRoaXMgcGFydGljdWxhciBwcm9ibGVtLgoKV2hlbiB3ZSdy
ZSB0YWtpbmcgYSB0cmFwIGZyb20gKmtlcm5lbCptb2RlLCB3ZSBzaG91bGQgbmV2ZXIgZGVhbCB3
aXRoCnVwcm9iZXMgYXQgYWxsLiBIYXZlIGEgbG9vayBhdCB1cHJvYmVfcHJlX3NzdGVwX25vdGlm
aWVyKCksIHRoaXMKZnVuY3Rpb24gcmV0dXJucyAxLCB3aGljaCB0aGVuIG1lYW5zIHRoYXQgdGhl
IHRyYXAgaGFuZGxlciBleGl0CnByZW1hdHVyZS4KClRoZSBjb2RlIHlvdSdyZSByZWZlcnJpbmcg
dG8gKGNhbGxlZCBmcm9tIHVwcm9iZV9ub3RpZnlfcmVzdW1lKCkpLCBhbmQKd2lsbCBuZXZlciBi
ZSBlbnRlcmVkLCBiZWNhdXNlIHdlJ3JlIG5vdCBleGl0aW5nIHRoZSB0cmFwIHRvCnVzZXJsYW5k
LiBIYXZlIGEgbG9vayBpbiBrZXJuZWwvZW50cnkvY29tbW9uLmMgKHNlYXJjaCBmb3IKZS5nLiBU
SUZfVVBST0JFKS4KCk5vdywgZm9yIHlvdXIgY29uY2Vybiwgd2hpY2ggSSBzZWUgYXMgYSBwb3Rl
bnRpYWwgZGlmZmVyZW50IGJ1Zy4gTm90IGF0CmFsbCByZWxhdGVkIHRvIG15IGlzc3VlICJ0cmFw
IGZyb20ga2VybmVsbW9kZSB0b3VjaGVzIHVwcm9iZQppbmNvcnJlY3RseSI7IEEgInJhbmRvbSIg
ZWJyZWFrIGZyb20gKnVzZXJsYW5kKiBpcyB0cmFwcGVkLCB3aGVuIHVwcm9iZXMKaXMgZW5hYmxl
ZCB3aWxsIHNldCB0aGUga2VybmVsIGluIGEgaGFuZy4gSSBzdWdnZXN0IHlvdSBjb25zdHJ1Y3Qg
dHJ5IHRvCndyaXRlIGEgc2ltcGxlIHByb2dyYW0gdG8gcmVwcm9kdWNlIHRoaXMhCgpJIGhhZCBh
IHF1aWNrIGxvb2sgaW4gdGhlIHVwcm9iZSBoYW5kbGluZyBjb2RlLCBhbmQgQUZBSVUgdGhlIHdh
cyB1c2VkCndoZW4gaW5zdGFsbGluZyB0aGUgdXByb2JlIGFzIGFuIGFkZGl0aW9uYWwgY2hlY2ss
IGFuZCB3aGVuIHNlYXJjaGluZwpmb3IgYW4gYWN0aXZlIHVwcm9iZS4gSSdtIHN0aWxsIGEgYml0
IHB1enpsZWQgaG93IHRoZSBpc3N1ZSB5b3UncmUKZGVzY3JpYmluZyBjb3VsZCB0cmlnZ2VyLiBB
IHJlcHJvZHVjZXIgd291bGQgaGVscCEKCgpDaGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
