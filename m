Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B0C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5jYLl1jNly9LWSzbHk1kgKekgyzrlrOOJnOm19lT+E=; b=CyckPR4sz+YDVf
	qkWwya3SMgPFY7+Dl6iCR+JKRpmGJ7VE/c5bz71DiKbK5iqX+AtRnzwtdWcp9fWrH8yY8H8zB+TzA
	fOvgtDfGXu2AahuzLPTxwUQqlqKVVNRT86SDFvsIp3ysa5GoSQxJV1Rmba7l/hVUNeQ3AIYAm+KCm
	sTrnygUdJ7j+29Up74mCl5t/j9qL2WMR9rJINGQVVfepfsF3je7lx5i2ESe99zCMTT/reedNSvYpv
	xuYczkvybbAG4MdL1LALlYAmhRtyVaWpTF0Cj07RlJSy8CBs/Lcbcy6fo37JbFa0d0ItNbQoij6BR
	9dJXubFdjI6KNwVua+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rks1t-0000000FfDb-1G6s;
	Thu, 14 Mar 2024 20:50:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rks1q-0000000FfD0-0yQZ
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 20:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D913CE1E80;
	Thu, 14 Mar 2024 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BAC433F1;
	Thu, 14 Mar 2024 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710449414;
	bh=dkDMtvv2pEkypl9VNokAWmauFxTdX5cLHzL3XjbhbMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iTZXdwP6aC7xzjJ8MgcLLrQ6/iIDqdEfmXRQNgIkp9Oau1qgT57pSLXX7sP1cseXV
	 ER0FR23LtfY+R50uwGom+cHRiAn8/hp3TGEPVxJitlEigZqlpzB9qeeF38xACjfE0K
	 fHfgJVxUU2wm9w3OsEB26AhNZiUQ35VIMZNVAkMgomTRGb4pJ+D25n6SeY5ZDtl2sC
	 XduHyAmKFNOEoTGzs1ugIu+ksQALSr1qtPdnGxojMIUIuc4GtSCuyhomgglQrR6SL7
	 AIDGNHpddNLwpUUySh34r20VVWDQFt9vnn2IcApEvWbZqyda5nzA2tSJdFVfrSpGoN
	 guOU5J466Os3w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
 <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Bjorn Topel <bjorn@rivosinc.com>, Song
 Shuai <suagrfillet@gmail.com>, Cl'ement L'eger <cleger@rivosinc.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Robbin Ehn <rehn@rivosinc.com>,
 	Brendan Sweeney <brs@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <87zfv0onre.fsf@all.your.base.are.belong.to.us>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
 <87zfv0onre.fsf@all.your.base.are.belong.to.us>
Date: Thu, 14 Mar 2024 21:50:11 +0100
Message-ID: <87il1oedx8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_135018_646194_B11FECAA 
X-CRM114-Status: GOOD (  19.82  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBQdXJhbmpheSBNb2hh
biA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+Cj4+Pgo+Pj4gSG1tLCBkZXBlbmRpbmcgb24gUklTQy1W
J3MgQ01PRFggcGF0aCwgdGhlIHByby9jb25zIENBTExfT1BTIHZzIGR5bmFtaWMKPj4+IHRyYW1w
b2xpbmVzIGNoYW5nZXMgcXVpdGUgYSBiaXQuCj4+Pgo+Pj4gVGhlIG1vcmUgSSBsb29rIGF0IHRo
ZSBwYWlucyBvZiBwYXRjaGluZyB0d28gaW5zdHJ1Y3Rpb24gKCJzcGxpdAo+Pj4gaW1tZWRpYXRl
cyIpLCB0aGUgYmV0dGVyICJwYXRjaCBkYXRhIiArIG9uZSBpbnNuIHBhdGNoaW5nIGxvb2suCj4+
Cj4+IEkgd2FzIGxvb2tpbmcgYXQgaG93IGR5bmFtaWMgdHJhbXBvbGluZXMgd291bGQgYmUgaW1w
bGVtZW50ZWQgZm9yIFJJU0MtVi4KPj4KPj4gV2l0aCBDQUxMLU9QUyB3ZSBuZWVkIHRvIHBhdGNo
IHRoZSBhdWlwYytqYWxyIGF0IGZ1bmN0aW9uIGVudHJ5IG9ubHksIHRoZQo+PiBvcHMgcG9pbnRl
ciBhYm92ZSB0aGUgZnVuY3Rpb24gY2FuIGJlIHBhdGNoZWQgYXRvbWljYWxseS4KPj4KPj4gV2l0
aCBhIGR5bmFtaWMgdHJhbXBvbGluZSB3ZSBuZWVkIGEgYXVpcGMramFsciBwYWlyIGF0IGZ1bmN0
aW9uIGVudHJ5IHRvIGp1bXAKPj4gdG8gdGhlIHRyYW1wb2xpbmUgYW5kIHRoZW4gYW5vdGhlciBh
dWlwYytqYWxyIHBhaXIgdG8ganVtcCBmcm9tIHRyYW1wb2xpbmUgdG8KPj4gb3BzLT5mdW5jLiBX
aGVuIHRoZSBvcHMtPmZ1bmMgaXMgbW9kaWZpZWQsIHdlIHdvdWxkIG5lZWQgdG8gdXBkYXRlIHRo
ZQo+PiBhdWlwYytqYWxyIGF0IGluIHRoZSB0cmFtcG9saW5lLgo+Pgo+PiBTbywgSSBhbSBub3Qg
c3VyZSBob3cgdG8gbW92ZSBmb3J3YXJkIGhlcmUsIENBTEwtT1BTIG9yIER5bmFtaWMgdHJhbXBv
bGluZXM/Cj4KPiBZZWFoLiBIb25lc3RseSwgd2UgbmVlZCB0byBmaWd1cmUgb3V0IHRoZSBwYXRj
aGluZyBzdG9yeSBwcmlvcgo+IGNob29zaW5nIHRoZSBwYXRoLCBzbyBsZXQncyBzdGFydCB0aGVy
ZS4KPgo+IEFmdGVyIHJlYWRpbmcgTWFyaydzIHJlcGx5LCBhbmQgZGlzY3Vzc2luZyB3aXRoIE9w
ZW5KREsgZm9sa3MgKHdobyBkb2VzCj4gdGhlIG1vc3QgY3JhenkgdGV4dCBwYXRjaGluZyBvbiBh
bGwgcGxhdGZvcm1zKSwgaGF2aW5nIHRvIHBhdGNoIG11bHRpcGxlCj4gaW5zdHJ1Y3Rpb25zICh3
aGVyZSB0aGUgYWRkcmVzcyBtYXRlcmlhbGl6YXRpb24gaXMgc3BsaXQgb3ZlciBtdWx0aXBsZQo+
IGluc3RydWN0aW9ucykgaXMgYSBuby1nby4gSXQncyBqdXN0IGEgdG9vIGJpZyBjYW4gb2Ygd29y
bXMuIFNvLCBpZiB3ZQo+IGNhbiBvbmx5IHBhdGNoIG9uZSBpbnNuLCBpdCdzIENBTExfT1BTLgo+
Cj4gQSBjb3VwbGUgb2Ygb3B0aW9ucyAoaW4gYWRkaXRpb24gdG8gQW5keSdzKSwgYW5kIGFsbCBy
ZXF1aXJlIGEKPiBwZXItZnVuY3Rpb24gbGFuZGluZyBhZGRyZXNzIGFsYSBDQUxMX09QUykgdHdl
YWtpbmcgd2hhdCBNYXJrIGlzIGRvaW5nCj4gb24gQXJtIChnaXZlbiB0aGUgcG9vciBicmFuY2gg
cmFuZ2UpLgo+Cj4gLi4uYW5kIG1heWJlIHdlJ2xsIGdldCBSSVNDLVYgcmFpbmJvd3MvdW5pY29y
bnMgaW4gdGhlIGZ1dHVyZSBnZXR0aW5nCj4gYmV0dGVyIHJlYWNoIChmdWxsIDY0YiEgOy0pKS4K
Pgo+IEEpIFVzZSBhdWlwYy9qYWxyLCBvbmx5IHBhdGNoIGphbHIgdG8gdGFrZSB1cyB0byBhIGNv
bW1vbgo+ICAgIGRpc3BhdGNoZXIvdHJhbXBvbGluZQo+ICAgCj4gIHwgPGZ1bmNfdHJhY2VfdGFy
Z2V0X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRhIGNhY2hlLWxpbmUgIT0gZnVuYyAudGV4
dCB0byBhdm9pZCBwaW5nLXBvbmcKPiAgfCAuLi4KPiAgfCBmdW5jOgo+ICB8ICAgLi4ubWFrZSBz
dXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+ICB8ICAgYXVwaWMKPiAgfCAgIG5vcCA8PT4gamFs
ciAjIFRleHQgcGF0Y2ggcG9pbnQgLT4gY29tbW9uX2Rpc3BhdGNoCj4gIHwgICBBQ1RVQUxfRlVO
Qwo+ICB8IAo+ICB8IGNvbW1vbl9kaXNwYXRjaDoKPiAgfCAgIGxvYWQgPGZ1bmNfdHJhY2VfdGFy
Z2V0X2RhdGFfOEI+IGJhc2VkIG9uIHJhCj4gIHwgICBqYWxyCj4gIHwgICAuLi4KPgo+IFRoZSBh
dWlwYyBpcyBuZXZlciB0b3VjaGVkLCBhbmQgd2lsbCBiZSBvdmVyaGVhZC4gQWxzbywgd2UgbmVl
ZCBhIG12IHRvCj4gc3RvcmUgcmEgaW4gYSBzY3JhdGNoIHJlZ2lzdGVyIGFzIHdlbGwgLS0gbGlr
ZSBBcm0uIFdlJ2xsIGhhdmUgdHdvIGluc24KPiBwZXItY2FsbGVyIG92ZXJoZWFkIGZvciBhIGRp
c2FibGVkIGNhbGxlci4KPgo+IEIpIFVzZSBqYWwsIHdoaWNoIGNhbiBvbmx5IHRha2UgdXMgKy8t
MU0sIGFuZCByZXF1aXJlcyBtdWx0aXBsZQo+ICAgIGRpc3BhdGNoZXJzIChhbmQgdHJhY2tpbmcg
d2hpY2ggb25lIHRvIHVzZSwgYW5kIHByb3Blcmx5IGRpc3RyaWJ1dGUKPiAgICB0aGVtLiBJY2su
KQo+Cj4gIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRh
IGNhY2hlLWxpbmUgIT0gZnVuYyAudGV4dCB0byBhdm9pZCBwaW5nLXBvbmcKPiAgfCAuLi4KPiAg
fCBmdW5jOgo+ICB8ICAgLi4ubWFrZSBzdXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+ICB8ICAg
bm9wIDw9PiBqYWwgIyBUZXh0IHBhdGNoIHBvaW50IC0+IHdpdGhpbl8xTV90b19mdW5jX2Rpc3Bh
dGNoCj4gIHwgICBBQ1RVQUxfRlVOQwo+ICB8IAo+ICB8IHdpdGhpbl8xTV90b19mdW5jX2Rpc3Bh
dGNoOgo+ICB8ICAgbG9hZCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4gYmFzZWQgb24gcmEK
PiAgfCAgIGphbHIKPgo+IEMpIFVzZSBqYWwsIHdoaWNoIGNhbiBvbmx5IHRha2UgdXMgKy8tMU0s
IGFuZCB1c2UgYSBwZXItZnVuY3Rpb24KPiAgICB0cmFtcG9saW5lIHJlcXVpcmVzIG11bHRpcGxl
IGRpc3BhdGNoZXJzIChhbmQgdHJhY2tpbmcgd2hpY2ggb25lIHRvCj4gICAgdXNlKS4gQmxvd3Mg
dXAgdGV4dCBzaXplIEEgTE9ULgo+Cj4gIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEI+ICMg
c29tZXdoZXJlLCBidXQgcHJvYmFibHkgb24gYSBkaWZmZXJlbnQgY2FjaGVsaW5lIHRoYW4gdGhl
IC50ZXh0IHRvIGF2b2lkIHBpbmctb25ncwo+ICB8IC4uLgo+ICB8IHBlcl9mdW5jX2Rpc3BhdGNo
Cj4gIHwgICBsb2FkIDxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCPiBiYXNlZCBvbiByYQo+ICB8
ICAgamFscgo+ICB8IGZ1bmM6Cj4gIHwgICAuLi5tYWtlIHN1cmUgcmEgaXNuJ3QgbWVzc2VkIHVw
Li4uCj4gIHwgICBub3AgPD0+IGphbCAjIFRleHQgcGF0Y2ggcG9pbnQgLT4gcGVyX2Z1bmNfZGlz
cGF0Y2gKPiAgfCAgIEFDVFVBTF9GVU5DCgpCcmVuZGFuIHByb3Bvc2VkIHlldCBhbm90aGVyIG9w
dGlvbiwgImluLWZ1bmN0aW9uIGRpc3BhdGNoIjoKCkQpIAogIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0
X2RhdGFfOEJfcGVyX2Z1bmN0aW9uPiAjIGlkayBzb21ld2hlcmUKICB8IC4uLgogIHwgZnVuYzoK
ICB8ICAgIG12IHRtcDEsIHJhCiAgfCAgICBhdXBpYyB0bXAyLCA8ZnVuY190cmFjZV90YXJnZXRf
ZGF0YV84Ql9wZXJfZnVuY3Rpb246dXBwZXI+CiAgfCAgICBtdiB0bXAzLCB6ZXJvIDw9PiBsZCB0
bXAzLCB0bXAyPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEJfcGVyX2Z1bmN0aW9uOmxvd2VyPgog
IHwgICAgbm9wIDw9PiBqYWxyIHJhLCB0bXAzCiAgfCAgICBBQ1RVQUxfRlVOQwoKVGhlcmUgYXJl
IDQgQ01PRFggcG9zc2libGl0aWVzOgogICBtdiwgbm9wOiAgZnVsbHkgZGlzYWJsZWQsIG5vIHBy
b2JsZW1zCiAgIG12LCBqYWxyOiBXZSB3aWxsIGp1bXAgdG8gemVyby4gV2Ugd291bGQgbmVlZCB0
byBoYXZlIHRoZSBpbnN0CiAgICAgICAgICAgICBwYWdlL2FjY2VzcyBmYXVsdCBoYW5kbGVyIHRh
a2UgY2FyZSBvZiB0aGlzIGNhc2UuIEVzcGVjaWFsbHkKICAgICAgICAgICAgIGlmIHdlIGFsaWdu
IHRoZSBpbnN0cnVjdGlvbnMgc28gdGhhdCB0aGV5IGNhbiBiZSBwYXRjaGVkCiAgICAgICAgICAg
ICB0b2dldGhlciwgYmVpbmcgaW50ZXJydXB0ZWQgaW4gdGhlIG1pZGRsZSBhbmQgdGFraW5nIHRo
aXMKICAgICAgICAgICAgIHBhdGggd2lsbCBiZSByYXJlLgogIGxkLCBub3A6ICAgbm8gcHJvYmxl
bXMKICBsZCwgamFscjogIGZ1bGx5IGVuYWJsZWQsIG5vIHByb2JsZW1zCgpQYXRjaGluZyBpcyBh
IDY0YiBzdG9yZS9zZCwgYW5kIHdlIG9ubHkgbmVlZCBhIGZlbmNlLmkgYXQgdGhlIGVuZCwgc2lu
Y2UKd2UgY2FuIGhhbmRsZSBhbGwgNCBwb3NzaWJpbGl0aWVzLgoKRm9yIHRoZSBkaXNhYmxlZCBj
YXNlIHdlJ2xsIGhhdmU6CkEpIG12LCBhdXBpYywgbm9wCkQpIG12LCBhdXBpYywgbXYsIG5vcC4K
ClB1cmFuamF5LCBJJ3ZlIGZsaXBwZWQuIExldCdzIGdvIE1hcmsncyBDQUxMX09QUyB0b2dldGhl
ciB3aXRoIGEgbmV3CnRleHQgcGF0Y2ggbWVjaGFuaXNtIHcvbyBzdG9wX21hY2hpbmUoKS4KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
