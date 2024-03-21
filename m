Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BBDC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYRQlMj8006ezfFGK6dn+Qm1UJAD379pgAvS0VeJNjc=; b=KPsUHW8/YOR2im
	2nrQTR+oQ6s635SKPskzBsZ0kUUJxV1/yGLZG7gthL/lwDwfJT8Mo9FcbyIx7ICScM4ubEpTwlW4P
	UuiEZuJin+nbyxNUkhS254iyw1425Mk8G+NmmKD5ve+AE1ttYWc5pANR2D3mWzUEk3C2ySxKccYE5
	hEVxtW9MJ2azPXvbsQKtIau8TlPUlqYC0+F24HhrP3S7wNvKXaz1tP9jYcn1g/6Fesj6lGGM0+wZZ
	JbLQQBYpJOeOcX+psW9Nh5/ouwj0MEyeo5vuQhZFJRDO7mD1zQ9KGdoiu/EHCKduLFdxzMThQHLMt
	IvnQBr2IaVDT/6shQhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMs9-00000004DeQ-0nSQ;
	Thu, 21 Mar 2024 18:10:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMs5-00000004DdO-3i8n
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 18:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D54CACE12E8;
	Thu, 21 Mar 2024 18:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D638C433F1;
	Thu, 21 Mar 2024 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711044631;
	bh=C/Xs/YhoEIKUB5a72gt+BlmWEN/hpBUi8RqVqzQGdU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l5or/Xz8OLwlWXFIJwiS/LM+xBUv08OZl7NI8BcUn11G6kr2g19+W6IZDamAVCltX
	 FB+b4repBxbi+qcbU+0/JDZaRRK9T+mbMEXgADHgiMsug52fR0QVHEO4BOc164YyIG
	 aHTN83CBjUQfikXkDeL2GbukbHhbV0za8vyFT/fgMX9Jt28RPxkfDfeqm6UwIc8un/
	 PP336dtMGRpO9sSaGq5gEvCKBr64/AmUM6FcQu+1bF/pzY3/LJU0ZUXRJGKuQooSbh
	 r6AflhHkBoyfYMdGjoj4NVcVsgA/hlpucNs/JZ6Bfo8pY7msEj4VucSue+UbfMTnoU
	 HD46/kGFj+nEg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, Ley
 Foon Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta
 <debug@rivosinc.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Bjorn
 Topel <bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, Cl'ement
 L'eger <cleger@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>, Jisheng
 Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Robbin
 Ehn <rehn@rivosinc.com>, Brendan Sweeney <brs@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <CABgGipUayONdvaH0nexBJUai=qT3yqURhinTbDWxORfMDQ_5pw@mail.gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
 <87zfv0onre.fsf@all.your.base.are.belong.to.us>
 <87il1oedx8.fsf@all.your.base.are.belong.to.us>
 <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
 <87msqsotr8.fsf@all.your.base.are.belong.to.us>
 <CABgGipUayONdvaH0nexBJUai=qT3yqURhinTbDWxORfMDQ_5pw@mail.gmail.com>
Date: Thu, 21 Mar 2024 19:10:27 +0100
Message-ID: <877chve9rg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_111034_331997_024671DE 
X-CRM114-Status: GOOD (  24.76  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBPbiBUaHUsIE1hciAy
MSwgMjAyNCBhdCA0OjQ44oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Cj4+IEFuZHksCj4+Cj4+IFB1bGxpbmcgb3V0IHRoZSBBIG9wdGlvbjoKPj4KPj4gPj4g
PiBBKSBVc2UgYXVpcGMvamFsciwgb25seSBwYXRjaCBqYWxyIHRvIHRha2UgdXMgdG8gYSBjb21t
b24KPj4gPj4gPiAgICBkaXNwYXRjaGVyL3RyYW1wb2xpbmUKPj4gPj4gPgo+PiA+PiA+ICB8IDxm
dW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCPiAjIHByb2JhYmx5IG9uIGEgZGF0YSBjYWNoZS1saW5l
ICE9IGZ1bmMgLnRleHQgdG8gYXZvaWQgcGluZy1wb25nCj4+ID4+ID4gIHwgLi4uCj4+ID4+ID4g
IHwgZnVuYzoKPj4gPj4gPiAgfCAgIC4uLm1ha2Ugc3VyZSByYSBpc24ndCBtZXNzZWQgdXAuLi4K
Pj4gPj4gPiAgfCAgIGF1cGljCj4+ID4+ID4gIHwgICBub3AgPD0+IGphbHIgIyBUZXh0IHBhdGNo
IHBvaW50IC0+IGNvbW1vbl9kaXNwYXRjaAo+PiA+PiA+ICB8ICAgQUNUVUFMX0ZVTkMKPj4gPj4g
PiAgfAo+PiA+PiA+ICB8IGNvbW1vbl9kaXNwYXRjaDoKPj4gPj4gPiAgfCAgIGxvYWQgPGZ1bmNf
dHJhY2VfdGFyZ2V0X2RhdGFfOEI+IGJhc2VkIG9uIHJhCj4+ID4+ID4gIHwgICBqYWxyCj4+ID4+
ID4gIHwgICAuLi4KPj4gPj4gPgo+PiA+PiA+IFRoZSBhdWlwYyBpcyBuZXZlciB0b3VjaGVkLCBh
bmQgd2lsbCBiZSBvdmVyaGVhZC4gQWxzbywgd2UgbmVlZCBhIG12IHRvCj4+ID4+ID4gc3RvcmUg
cmEgaW4gYSBzY3JhdGNoIHJlZ2lzdGVyIGFzIHdlbGwgLS0gbGlrZSBBcm0uIFdlJ2xsIGhhdmUg
dHdvIGluc24KPj4gPj4gPiBwZXItY2FsbGVyIG92ZXJoZWFkIGZvciBhIGRpc2FibGVkIGNhbGxl
ci4KPj4gPgo+PiA+IE15IHBhdGNoIHNlcmllcyB0YWtlcyBhIHNpbWlsYXIgImluLWZ1bmN0aW9u
IGRpc3BhdGNoIiBhcHByb2FjaC4gQQo+PiA+IGRpZmZlcmVuY2UgaXMgdGhhdCB0aGUgPGZ1bmNf
dHJhY2VfdGFyZ2V0X2RhdGFfOEJfcGVyX2Z1bmN0aW9uPiBpcwo+PiA+IGVtYmVkZGVkIHdpdGhp
biBlYWNoIGZ1bmN0aW9uIGVudHJ5LiBJJ2QgbGlrZSB0byBoYXZlIGl0IG1vdmVkIHRvIGEKPj4g
PiBydW4tdGltZSBhbGxvY2F0ZWQgYXJyYXkgdG8gcmVkdWNlIHRvdGFsIHRleHQgc2l6ZS4KPj4K
Pj4gVGhpcyBpcyB3aGF0IGFybTY0IGhhcyBhcyB3ZWxsLiBJdCdzIGEgOEIgKyAxLTIgZGlydCBj
aGVhcCBtb3Zpc2ggbGlrZQo+PiBpbnN0cnVjdGlvbnMgKHNhdmUgcmEsIHByZXBhcmUganVtcCB3
aXRoIGF1aXBjKS4gSSB0aGluayB0aGF0J3MgYQo+PiByZWFzb25hYmxlIG92ZXJoZWFkLgo+Pgo+
PiA+IEFub3RoZXIgZGlmZmVyZW5jZSBpcyB0aGF0IG15IHNlcmllcyBjaGFuZ2VzIHRoZSBmaXJz
dCBpbnN0cnVjdGlvbiB0bwo+PiA+ICJqIEFDVFVBTF9GVU5DIiBmb3IgdGhlICJmdHJhY2UgZGlz
YWJsZSIgY2FzZS4gQXMgbG9uZyBhcyB0aGUKPj4gPiBhcmNoaXRlY3R1cmUgZ3VhcmFudGVlcyB0
aGUgYXRvbWljaXR5IG9mIHRoZSBmaXJzdCBpbnN0cnVjdGlvbiwgdGhlbgo+PiA+IHdlIGFyZSBz
YWZlLiBGb3IgZXhhbXBsZSwgd2UgYXJlIHNhZmUgaWYgdGhlIGZpcnN0IGluc3RydWN0aW9uIGNv
dWxkCj4+ID4gb25seSBiZSAibXYgdG1wLCByYSIgb3IgImogQUNUVUFMX0ZVTkMiLiBBbmQgc2lu
Y2UgdGhlIGxvYWRlZCBhZGRyZXNzIGlzCj4+ID4gYWx3YXlzIHZhbGlkLCB3ZSBjYW4gZml4ICJt
diArIGphbHIiIGRvd24gc28gd2UgZG9uJ3QgaGF2ZSB0bwo+PiA+IHBsYXkgd2l0aCB0aGUgZXhj
ZXB0aW9uIGhhbmRsZXIgdHJpY2suIFRoZSBndWFyYW50ZWUgZnJvbSBhcmNoIHdvdWxkCj4+ID4g
cmVxdWlyZSB6aWNjaWYgKGluIFJWQTIyKSB0aG91Z2gsIGJ1dCBJIHRoaW5rIGl0IGlzIHRoZSBz
YW1lIGZvciB1cwo+PiA+ICh1bmxlc3Mgd2l0aCBzdG9wX21hY2hpbmUpLiBGb3IgemljY2lmLCBJ
IHdvdWxkIHJhdGhlciBjYWxsIHRoYXQgb3V0Cj4+ID4gZHVyaW5nIGJvb3QgdGhhbiBibGluZGx5
IGFzc3VtZS4KPj4KPj4gSSdtIG1heWJlIGJpYXNlZCwgYnV0IEknZCBwcmVmZXIgdGhlIEEpIG92
ZXIgeW91ciB2ZXJzaW9uIHdpdGggdGhlCj4+IHVuY29uZGl0aW9uYWwganVtcC4gQSkgaGFzIHRo
ZSBvdmVyaGVhZCBvZiB0d28sIEknZCBzYXksIGZyZWUKPj4gaW5zdHJ1Y3Rpb25zIChhZ2FpbiAi
TWV0ZW4gaXMgV2V0ZW4hIiA7LSkpLgo+Cj4gWWVzLCBJJ2QgYWxzbyBwcmVmZXIgQSBmb3IgbGVz
cyBvdmVyYWxsIHBhdGNoIHNpemUuIFdlIGNhbiBhbHNvCj4gb3B0aW1pemUgdGhlIG92ZXJoZWFk
IHdpdGggYSBkaXJlY3QganVtcCBpZiB0aGF0IG1ha2VzIHNlbnNlLiBUaG91Z2gsCj4gd2UgbmVl
ZCB0byBzb3J0IG91dCBhIHdheSB0byBtYXAgZnVuY3Rpb25zIHRvIGNvcnJlc3BvbmRpbmcKPiB0
cmFtcG9saW5lcy4gQSBkaXJlY3Qgd2F5IEkgY291bGQgaW1hZ2UgaXMgQ0FMTF9PUFMnaXNoIHBh
dGNoaW5nCj4gc3R5bGUsIGlmIHRoZSBmdHJhY2UgZGVzdGluYXRpb24gaGFzIHRvIGJlIHBhdGNo
ZWQgaW4gYSBwZXItZnVuY3Rpb24KPiBtYW5uZXIuIEZvciBleGFtcGxlOgo+Cj4gPGluZGV4LWlu
LWRpc3BhdGNoLWxpc3Q+Cj4gZnVuY19zeW1ib2w6Cj4gYXVpcGMgdDAsIGNvbW1vbl9kaXNwYXRj
aDpoaWdoIDw9PiBqIGFjdHVhbF9mdW5jOgo+IGphbHIgdDAsIGNvbW1vbl9kaXNwYXRjaDpsb3co
dDApCj4KPiBjb21tb25fZGlzcGF0Y2g6Cj4gbG9hZCB0MSwgaW5kZXggKyBkaXNwYXRjaC1saXN0
Cj4gbGQgdDEsIDAodDEpCj4ganIgdDEKCll1cCwgZXhhY3RseSBsaWtlIHRoYXQgKGJ1dCBJJ2Qg
cHV0IHRoZSBhY3V0YWwgdGFyZ2V0IHB0ciBpbiB0aGVyZSwKaW5zdGVhZCBvZiBhbiBhZGRpdGlv
bmFsIGluZGlyZWN0aW9uLiBFeGFjdGx5IHdoYXQgTWFyayBkb2VzIGZvciBhcm02NCkuCgpXaGVu
IHdlIGVudGVyIHRoZSBjb21tb25fZGlzcGF0Y2gsIHRoZSBwdHIgPGluZGV4LWluLWRpc3BhdGNo
LWxpc3Q+CndvdWxkIGJlIC0xMih0MCkuCgpBcyBmb3IgcGF0Y2hpbmcgYXVpcGMgb3IgamFsciwg
SSBndWVzcyB3ZSBuZWVkIHRvIG1lYXN1cmUgd2hhdCdzIGJlc3QuCk15IGtuZWUtamVyayB3b3Vs
ZCBiZSBhbHdheXMgYXVpcGMgaXMgYmV0dGVyIHRoYW4ganVtcCAtLSBidXQgbGV0J3MKbWVhc3Vy
ZS4gOy0pCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
