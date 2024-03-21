Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA03CC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Erhnjo7GkSVWcxtFTFB7jmpeyJqt9P9RrAwQg47PUCY=; b=K2nyusynY6D/xo
	bqxZAyyw26NqYwJfZ/YAN3Ufrslwc8YHklno5Ji1wTOJwkmD/Di6QyFNa/4bEQt+qP8anKfddI88a
	1NLweo7nGlwru92GJFGdy1Y23k9yzF9Dwnc4xNJWSkpbGLGRU9NeaqLMLyXLuC4De6+9ZfMcQM7yO
	cvyV0k+KD4S9sUPeqCLzPEZlb8OHKPi2RU/CUWYRU1SFAN4GxCTtiLAn4jgIGf6gcmy+4JFtAevSM
	kjaKREjF81gQ8ZpqjEjzncF+mdkgJiBUDMsNB8x8MxuQjWtqQuPkHrLTTaRk4qED+EBy0VLlrZLO5
	m+dqbTuWryn2lCYabfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEFw-00000002PSl-1rXh;
	Thu, 21 Mar 2024 08:58:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEFt-00000002PSG-3GRs
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 08:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB1F96113A;
	Thu, 21 Mar 2024 08:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D37C433F1;
	Thu, 21 Mar 2024 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711011512;
	bh=uGpBd9QI+Atx1GoKgTQyA4nlsR96BwgZ79GAu7yGD1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qvP43udcWQrSBEPeuwihpyfg0fFvip845SrGXz7bPiJjHieri42mcfdZqQDG0kc6+
	 OH13aUlpu3Q4xJGkyE5mQ8T6efE522w++4IKlroUpju0JeINkt9GlEC1N83+uXyi7F
	 MjWsXYk7eQKzrLijzdZdzSzMHK5L8Gr9qWKLjjV7hCGVSRSo9V5h04V5nBDNG2M3xh
	 ZpCC5a0xqmaaguE1omKiNqgV/r3BztmHo5kwuSNw8Nqfo7AajuHr0qhEIS5APplFIZ
	 ieJmyvkcZaMGR1TpRYbNkZ3mjrtsosTVruW/SOf/7dEs4M9cn0jwf4SNaozH2UWJUR
	 hMCzRnWoXxyeA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, Ley Foon
 Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta <debug@rivosinc.com>, Sia
 Jee Heng <jeeheng.sia@starfivetech.com>, Bjorn Topel <bjorn@rivosinc.com>,
 Song Shuai <suagrfillet@gmail.com>, Cl'ement L'eger <cleger@rivosinc.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <ZfslAb_W0Gk-0pmR@FVFF77S0Q05N.cambridge.arm.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
 <87zfv0onre.fsf@all.your.base.are.belong.to.us>
 <ZfslAb_W0Gk-0pmR@FVFF77S0Q05N.cambridge.arm.com>
Date: Thu, 21 Mar 2024 09:58:28 +0100
Message-ID: <87frwkotaj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015833_931325_32D373D1 
X-CRM114-Status: GOOD (  16.44  )
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

TWFyaywKCk1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyaXRlczoKCj4+IEEp
IFVzZSBhdWlwYy9qYWxyLCBvbmx5IHBhdGNoIGphbHIgdG8gdGFrZSB1cyB0byBhIGNvbW1vbgo+
PiAgICBkaXNwYXRjaGVyL3RyYW1wb2xpbmUKPj4gICAKPj4gIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0
X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRhIGNhY2hlLWxpbmUgIT0gZnVuYyAudGV4dCB0
byBhdm9pZCBwaW5nLXBvbmcKPj4gIHwgLi4uCj4+ICB8IGZ1bmM6Cj4+ICB8ICAgLi4ubWFrZSBz
dXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+PiAgfCAgIGF1cGljCj4+ICB8ICAgbm9wIDw9PiBq
YWxyICMgVGV4dCBwYXRjaCBwb2ludCAtPiBjb21tb25fZGlzcGF0Y2gKPj4gIHwgICBBQ1RVQUxf
RlVOQwo+PiAgfCAKPj4gIHwgY29tbW9uX2Rpc3BhdGNoOgo+PiAgfCAgIGxvYWQgPGZ1bmNfdHJh
Y2VfdGFyZ2V0X2RhdGFfOEI+IGJhc2VkIG9uIHJhCj4+ICB8ICAgamFscgo+PiAgfCAgIC4uLgo+
PiAKPj4gVGhlIGF1aXBjIGlzIG5ldmVyIHRvdWNoZWQsIGFuZCB3aWxsIGJlIG92ZXJoZWFkLiBB
bHNvLCB3ZSBuZWVkIGEgbXYgdG8KPj4gc3RvcmUgcmEgaW4gYSBzY3JhdGNoIHJlZ2lzdGVyIGFz
IHdlbGwgLS0gbGlrZSBBcm0uIFdlJ2xsIGhhdmUgdHdvIGluc24KPj4gcGVyLWNhbGxlciBvdmVy
aGVhZCBmb3IgYSBkaXNhYmxlZCBjYWxsZXIuCj4KPiBJcyB0aGUgQVVJUEMgYSBzaWduaWZpY2Fu
dCBvdmVyaGVhZD8gSUlVQyB0aGF0J3Mgc2ltaWxhciB0byBBcm0ncyBBRFJQLCBhbmQgSSdkCj4g
aGF2ZSBleHBlY3RlZCB0aGF0IHRvIGJlIHByZXR0eSBjaGVhcC4KCk5vLCByZWctdG8tcmVnIG1v
dmVzIGFyZSBkaXJ0IGNoZWFwIGluIG15IGJvb2suCgo+IElJVUMgeW91ciBKQUxSIGNhbiBjaG9v
c2Ugd2hpY2ggZGVzdGluYXRpb24gcmVnaXN0ZXIgdG8gc3RvcmUgdGhlIHJldHVybgo+IGFkZHJl
c3MgaW4sIGFuZCBpZiBzbywgeW91IGNvdWxkIGxlYXZlIHRoZSBvcmlnaW5hbCByYSB1bnRvdWNo
ZWQgKGFuZCByZWNvdmVyCj4gdGhhdCBpbiB0aGUgY29tbW9uIHRyYW1wb2xpbmUpLiBIYXZlIEkg
bWlzdW5kZXJzdG9vZCB0aGF0Pwo+Cj4gTWF5YmUgdGhhdCBkb2Vzbid0IHBsYXkgbmljZWx5IHdp
dGggc29tZXRoaW5nIGVsc2U/CgpObywgeW91J3JlIHJpZ2h0LCB3ZSBjYW4gbGluayB0byBhbm90
aGVyIHJlZ2lzdGVyLCBhbmQgc2hhdmUgb2ZmIGFuCmluc3RydWN0aW9uLiBJIGNhbiBpbWFnaW5l
IHRoYXQgc29tZSBpbXBsZW1lbnRhdGlvbiBwcmVmZXIgeDEveDUgZm9yCmJyYW5jaCBwcmVkaWN0
aW9uIHJlYXNvbnMsIGJ1dCB0aGF0J3Mgc29tZXRoaW5nIHRoYXQgd2UgY2FuIG1lYXN1cmUgb24u
IAoKU28sIDEtMiBtb3ZzICsgbm9wIGFyZSB1bmNvbmRpdGlvbmFsbHkgZXhlY3V0ZWQgb24gdGhl
IGRpc2FibGVkIGNhc2UuCigxLTIgZGVwZW5kaW5nIG9uIHRoZSByYSBzYXZlL2phbHIgcmVnIHN0
cmF0ZWd5KS4KCj4+IEIpIFVzZSBqYWwsIHdoaWNoIGNhbiBvbmx5IHRha2UgdXMgKy8tMU0sIGFu
ZCByZXF1aXJlcyBtdWx0aXBsZQo+PiAgICBkaXNwYXRjaGVycyAoYW5kIHRyYWNraW5nIHdoaWNo
IG9uZSB0byB1c2UsIGFuZCBwcm9wZXJseSBkaXN0cmlidXRlCj4+ICAgIHRoZW0uIEljay4pCj4+
IAo+PiAgfCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4gIyBwcm9iYWJseSBvbiBhIGRhdGEg
Y2FjaGUtbGluZSAhPSBmdW5jIC50ZXh0IHRvIGF2b2lkIHBpbmctcG9uZwo+PiAgfCAuLi4KPj4g
IHwgZnVuYzoKPj4gIHwgICAuLi5tYWtlIHN1cmUgcmEgaXNuJ3QgbWVzc2VkIHVwLi4uCj4+ICB8
ICAgbm9wIDw9PiBqYWwgIyBUZXh0IHBhdGNoIHBvaW50IC0+IHdpdGhpbl8xTV90b19mdW5jX2Rp
c3BhdGNoCj4+ICB8ICAgQUNUVUFMX0ZVTkMKPj4gIHwgCj4+ICB8IHdpdGhpbl8xTV90b19mdW5j
X2Rpc3BhdGNoOgo+PiAgfCAgIGxvYWQgPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEI+IGJhc2Vk
IG9uIHJhCj4+ICB8ICAgamFscgo+PiAKPj4gQykgVXNlIGphbCwgd2hpY2ggY2FuIG9ubHkgdGFr
ZSB1cyArLy0xTSwgYW5kIHVzZSBhIHBlci1mdW5jdGlvbgo+PiAgICB0cmFtcG9saW5lIHJlcXVp
cmVzIG11bHRpcGxlIGRpc3BhdGNoZXJzIChhbmQgdHJhY2tpbmcgd2hpY2ggb25lIHRvCj4+ICAg
IHVzZSkuIEJsb3dzIHVwIHRleHQgc2l6ZSBBIExPVC4KPj4gCj4+ICB8IDxmdW5jX3RyYWNlX3Rh
cmdldF9kYXRhXzhCPiAjIHNvbWV3aGVyZSwgYnV0IHByb2JhYmx5IG9uIGEgZGlmZmVyZW50IGNh
Y2hlbGluZSB0aGFuIHRoZSAudGV4dCB0byBhdm9pZCBwaW5nLW9uZ3MKPj4gIHwgLi4uCj4+ICB8
IHBlcl9mdW5jX2Rpc3BhdGNoCj4+ICB8ICAgbG9hZCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84
Qj4gYmFzZWQgb24gcmEKPj4gIHwgICBqYWxyCj4+ICB8IGZ1bmM6Cj4+ICB8ICAgLi4ubWFrZSBz
dXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+PiAgfCAgIG5vcCA8PT4gamFsICMgVGV4dCBwYXRj
aCBwb2ludCAtPiBwZXJfZnVuY19kaXNwYXRjaAo+PiAgfCAgIEFDVFVBTF9GVU5DCj4KPiBCZXdh
cmUgdGhhdCB3aXRoIG9wdGlvbiAoQykgeW91J2xsIG5lZWQgdG8gaGFuZGxlIHRoYXQgaW4geW91
ciB1bndpbmRlciBmb3IKPiBSRUxJQUJMRV9TVEFDS1RSQUNFLiBJZiB5b3UgZG9uJ3QgaGF2ZSBh
IHN5bWJvbCBmb3IgcGVyX2Z1bmNfZGlzcGF0Y2ggKG9yCj4gZnVuY190cmFjZV90YXJnZXRfZGF0
YV84QiksIFBDIHZhbHVlcyB3aXRoaW4gcGVyX2Z1bmNfZGlzcGF0Y2ggd291bGQgYmUKPiBzeW1i
b2xpemVkIGFzIHRoZSBwcmlvciBmdW5jdGlvbi9kYXRhLgoKR29vZCBwb2ludCAoYnV0IEkgZG9u
J3QgbGlrZSBDIG11Y2guLi4pIQoKPj4gSXQncyBhIGJpdCBzYWQgdGhhdCB3ZSdsbCBhbHdheXMg
aGF2ZSB0byBoYXZlIGEgZGlzcGF0Y2hlci90cmFtcG9saW5lLAo+PiBidXQgaXQncyBzdGlsbCBi
ZXR0ZXIgdGhhbiBzdG9wX21hY2hpbmUoKS4gKEFuZCB3ZSdsbCBuZWVkIGEgZmVuY2VpIElQSQo+
PiBhcyB3ZWxsLCBidXQgb25seSBvbmUuIDstKSkKPj4gCj4+IFRvZGF5LCBJJ20gbGVhbmluZyB0
b3dhcmRzIEEgKHdoaWNoIGlzIHdoYXQgTWFyayBzdWdnZXN0ZWQsIGFuZCBhbHNvCj4+IFJvYmJp
bikuLiBBbnkgb3RoZXIgb3B0aW9ucz8KPgo+IEFzc3VtaW5nIG15IHVuZGVyc3RhbmRpbmcgb2Yg
SkFMUiBhYm92ZSBpcyBjb3JyZWN0LCBJIHJlY2tvbiBBIGlzIHRoZSBuaWNlc3QKPiBvcHRpb24g
b3V0IG9mIEEvQi9DLgoKWWVzISArMSEKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
