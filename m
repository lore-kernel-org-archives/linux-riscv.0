Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4539CC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucn7XuVp9mNoknbY2PXqmGPes6sqOmcAEX1jr7SuHS4=; b=MKqJd/Cg+vbGjB
	sFVXp7fuXMFCsZA0UTss+UlBgC8oWYUVAn4re9z7IKb2Jyz/arcP02iex8Gs6Sg3IzyeIMq74IecO
	uiGIxXWSSzCxMlkeJIyqemOfup3//2KRHpY0/sskCZqzvA1vky9xm6J1wHVYBld2XwVIAvFTZge3c
	8MmpnE1lGW28CBaFadykdxBdVGet10ddjahhtC8WazPPDJdtGbLh3ucHWX+i4zTjDvZWELJRBGC4p
	pC/EMPynfZYTET5H2xkRgTBh7xmu3u4yWziBtCJhQjgE2zMOAp6/655lNfXMWIJ2VtHtCRJ7xZgO7
	m9oJoNEUyua04YCZSsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE6E-00000002NuV-1Kug;
	Thu, 21 Mar 2024 08:48:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE6C-00000002Nu4-1bWj
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 08:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861E96116F;
	Thu, 21 Mar 2024 08:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DD6C433C7;
	Thu, 21 Mar 2024 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711010911;
	bh=15ZtzjY1fNYkJ0k0FnRr+bctv3Yg6O2wYPUdrRw1jU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gmijaw2QPhHATpi68Owc0NGfwiqqzkpz2elHJSZbXKXUtlFJaiMVN25OSGx/pyYsx
	 CZ3kVp43itxG2hgscjbik/tkL8uZt3tSxsi+IPsN7Ba2XGwFTfC5uohzxBijORayQ9
	 n7Pgt7AeV1UUBPYTjeKHvYoOxeaTy6llr4/LY+l1nrprWsOPmriJOk+3172fXQ/Ju6
	 7OPpeamnaOUlwa8S0taZC5fBwzPqk9tv/NEb+TNeCZUUsms2jmV871Vo1WF4ExCJbK
	 H7RV8eaovOIrHEuRjj9rLqqA3jpYLvK3ND9HQwNKifeA7kF+8TmQmFrTtg1E/urVUR
	 obBYTsqsWcF7g==
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
In-Reply-To: <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
 <87zfv0onre.fsf@all.your.base.are.belong.to.us>
 <87il1oedx8.fsf@all.your.base.are.belong.to.us>
 <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
Date: Thu, 21 Mar 2024 09:48:27 +0100
Message-ID: <87msqsotr8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014832_523757_8575B5A6 
X-CRM114-Status: GOOD (  22.61  )
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

QW5keSwKClB1bGxpbmcgb3V0IHRoZSBBIG9wdGlvbjoKCj4+ID4gQSkgVXNlIGF1aXBjL2phbHIs
IG9ubHkgcGF0Y2ggamFsciB0byB0YWtlIHVzIHRvIGEgY29tbW9uCj4+ID4gICAgZGlzcGF0Y2hl
ci90cmFtcG9saW5lCj4+ID4KPj4gPiAgfCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4gIyBw
cm9iYWJseSBvbiBhIGRhdGEgY2FjaGUtbGluZSAhPSBmdW5jIC50ZXh0IHRvIGF2b2lkIHBpbmct
cG9uZwo+PiA+ICB8IC4uLgo+PiA+ICB8IGZ1bmM6Cj4+ID4gIHwgICAuLi5tYWtlIHN1cmUgcmEg
aXNuJ3QgbWVzc2VkIHVwLi4uCj4+ID4gIHwgICBhdXBpYwo+PiA+ICB8ICAgbm9wIDw9PiBqYWxy
ICMgVGV4dCBwYXRjaCBwb2ludCAtPiBjb21tb25fZGlzcGF0Y2gKPj4gPiAgfCAgIEFDVFVBTF9G
VU5DCj4+ID4gIHwKPj4gPiAgfCBjb21tb25fZGlzcGF0Y2g6Cj4+ID4gIHwgICBsb2FkIDxmdW5j
X3RyYWNlX3RhcmdldF9kYXRhXzhCPiBiYXNlZCBvbiByYQo+PiA+ICB8ICAgamFscgo+PiA+ICB8
ICAgLi4uCj4+ID4KPj4gPiBUaGUgYXVpcGMgaXMgbmV2ZXIgdG91Y2hlZCwgYW5kIHdpbGwgYmUg
b3ZlcmhlYWQuIEFsc28sIHdlIG5lZWQgYSBtdiB0bwo+PiA+IHN0b3JlIHJhIGluIGEgc2NyYXRj
aCByZWdpc3RlciBhcyB3ZWxsIC0tIGxpa2UgQXJtLiBXZSdsbCBoYXZlIHR3byBpbnNuCj4+ID4g
cGVyLWNhbGxlciBvdmVyaGVhZCBmb3IgYSBkaXNhYmxlZCBjYWxsZXIuCj4KPiBNeSBwYXRjaCBz
ZXJpZXMgdGFrZXMgYSBzaW1pbGFyICJpbi1mdW5jdGlvbiBkaXNwYXRjaCIgYXBwcm9hY2guIEEK
PiBkaWZmZXJlbmNlIGlzIHRoYXQgdGhlIDxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCX3Blcl9m
dW5jdGlvbj4gaXMKPiBlbWJlZGRlZCB3aXRoaW4gZWFjaCBmdW5jdGlvbiBlbnRyeS4gSSdkIGxp
a2UgdG8gaGF2ZSBpdCBtb3ZlZCB0byBhCj4gcnVuLXRpbWUgYWxsb2NhdGVkIGFycmF5IHRvIHJl
ZHVjZSB0b3RhbCB0ZXh0IHNpemUuCgpUaGlzIGlzIHdoYXQgYXJtNjQgaGFzIGFzIHdlbGwuIEl0
J3MgYSA4QiArIDEtMiBkaXJ0IGNoZWFwIG1vdmlzaCBsaWtlCmluc3RydWN0aW9ucyAoc2F2ZSBy
YSwgcHJlcGFyZSBqdW1wIHdpdGggYXVpcGMpLiBJIHRoaW5rIHRoYXQncyBhCnJlYXNvbmFibGUg
b3ZlcmhlYWQuCgo+IEFub3RoZXIgZGlmZmVyZW5jZSBpcyB0aGF0IG15IHNlcmllcyBjaGFuZ2Vz
IHRoZSBmaXJzdCBpbnN0cnVjdGlvbiB0bwo+ICJqIEFDVFVBTF9GVU5DIiBmb3IgdGhlICJmdHJh
Y2UgZGlzYWJsZSIgY2FzZS4gQXMgbG9uZyBhcyB0aGUKPiBhcmNoaXRlY3R1cmUgZ3VhcmFudGVl
cyB0aGUgYXRvbWljaXR5IG9mIHRoZSBmaXJzdCBpbnN0cnVjdGlvbiwgdGhlbgo+IHdlIGFyZSBz
YWZlLiBGb3IgZXhhbXBsZSwgd2UgYXJlIHNhZmUgaWYgdGhlIGZpcnN0IGluc3RydWN0aW9uIGNv
dWxkCj4gb25seSBiZSAibXYgdG1wLCByYSIgb3IgImogQUNUVUFMX0ZVTkMiLiBBbmQgc2luY2Ug
dGhlIGxvYWRlZCBhZGRyZXNzIGlzCj4gYWx3YXlzIHZhbGlkLCB3ZSBjYW4gZml4ICJtdiArIGph
bHIiIGRvd24gc28gd2UgZG9uJ3QgaGF2ZSB0bwo+IHBsYXkgd2l0aCB0aGUgZXhjZXB0aW9uIGhh
bmRsZXIgdHJpY2suIFRoZSBndWFyYW50ZWUgZnJvbSBhcmNoIHdvdWxkCj4gcmVxdWlyZSB6aWNj
aWYgKGluIFJWQTIyKSB0aG91Z2gsIGJ1dCBJIHRoaW5rIGl0IGlzIHRoZSBzYW1lIGZvciB1cwo+
ICh1bmxlc3Mgd2l0aCBzdG9wX21hY2hpbmUpLiBGb3IgemljY2lmLCBJIHdvdWxkIHJhdGhlciBj
YWxsIHRoYXQgb3V0Cj4gZHVyaW5nIGJvb3QgdGhhbiBibGluZGx5IGFzc3VtZS4KCkknbSBtYXli
ZSBiaWFzZWQsIGJ1dCBJJ2QgcHJlZmVyIHRoZSBBKSBvdmVyIHlvdXIgdmVyc2lvbiB3aXRoIHRo
ZQp1bmNvbmRpdGlvbmFsIGp1bXAuIEEpIGhhcyB0aGUgb3ZlcmhlYWQgb2YgdHdvLCBJJ2Qgc2F5
LCBmcmVlCmluc3RydWN0aW9ucyAoYWdhaW4gIk1ldGVuIGlzIFdldGVuISIgOy0pKS4KCj4gSG93
ZXZlciwgb25lIHRoaW5nIEkgYW0gbm90IHZlcnkgc3VyZSBpczogZG8gd2UgbmVlZCBhIGRlc3Rp
bmF0aW9uCj4gYWRkcmVzcyBpbiBhICJwZXItZnVuY3Rpb24iIG1hbm5lcj8gSXQgc2VlbXMgbGlr
ZSBtb3N0IG9mIHRoZSB0aW1lIHRoZQo+IGRlc3RpbmF0aW9uIGFkZHJlc3MgY2FuIG9ubHkgYmUg
ZnRyYWNlX2NhbGwsIG9yIGZ0cmFjZV9yZWdzX2NhbGwuIElmCj4gdGhlIG51bWJlciBvZiBkZXN0
aW5hdGlvbiBhZGRyZXNzZXMgaXMgdmVyeSBmZXcsIHRoZW4gd2UgY291bGQKPiBwb3RlbnRpYWxs
eSByZWR1Y2UgdGhlIHNpemUgb2YKPiA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Ql9wZXJfZnVu
Y3Rpb24+LgoKWWVzLCB3ZSBkbyBuZWVkIGEgcGVyLWZ1bmN0aW9uIG1hbm5lci4gQlBGLCBlLmcu
LCB1c2VzCmR5bmFtaWNhbGx5L0pJVDplZCB0cmFtcG9saW5lcy90YXJnZXRzLgoKCgpCasO2cm4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
