Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE110C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1mf8L7+8XGT9KZH4bzJMyGmAvkFskxSkJGAreyf+d8=; b=Jx8hgiMA+qR0YC
	BxrrbvjQTf8lXPcG3ASjZ9pUCabn+o4SVbu5NNlMoJLXdE00XAiYAUmq0lDWLstYFFIPdhvAGO09l
	x50c0il8o8JSmWJQAS3tVI35b8UQNfs7UXiSkyK8WabFPX1teNDhF7MrQvzekXZaf5LFzTAU4JVGE
	2DE1wu6GpLcW0I46Sw13eRsECsWylDFGn3JnTncRg5UlWHWOGa8gtvzJzU64FHjo8/+qRRA+u1fj4
	L3bRFAvORrzw+J57EwVlOdgL1jiOSZ2pQNKXoybdQp/cIIvXiqrkqG/bclytT4v5GxfWgisTSSo3S
	2PYjFogdGYwlBjLBgGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmgJ-0000000ElW8-0sGi;
	Thu, 14 Mar 2024 15:07:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmgG-0000000ElTw-3A8Y
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 15:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C314ACE1B79;
	Thu, 14 Mar 2024 15:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F50C433F1;
	Thu, 14 Mar 2024 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710428857;
	bh=GTQVrWcs6XBMnV9a14mAay7RyQJOjR0XkVbs68SqZPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gfl+o6VtDn9x2Fj955iyoM1+yBnt/TsF7oYp6foNPn9asCM6e9NsX2I9HbgeW5uI5
	 fcoKb3FedKukBXX05fexGqKId3twgTL/3iq3jcYCxobZ48JHMiJZeVz6tNs+6+wtPk
	 w0PHcqFQDARplTSrKVp2EpgNYKTWO/itjTRfg5WmqLw27khIRRf86AdB+DLL+0n6yq
	 YuRRZ8GgUx+px5xHy1V2xBnnxhSwa01rK/mFRerJSP2rfaYES1mWmZYix4YtILbgy8
	 IdhL0TkeHcMvr787XJOsXnCZPM+gUee6OTjB2Y6oT4qAy7EhvEt6PntEVMY5jSyrkk
	 loOBoYle/+6mg==
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
 linux-trace-kernel@vger.kernel.org, Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <mb61pplvw6grf.fsf@gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
Date: Thu, 14 Mar 2024 16:07:33 +0100
Message-ID: <87zfv0onre.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_080741_220537_D8071DC5 
X-CRM114-Status: GOOD (  18.94  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+Pgo+PiBIbW0sIGRlcGVuZGluZyBv
biBSSVNDLVYncyBDTU9EWCBwYXRoLCB0aGUgcHJvL2NvbnMgQ0FMTF9PUFMgdnMgZHluYW1pYwo+
PiB0cmFtcG9saW5lcyBjaGFuZ2VzIHF1aXRlIGEgYml0Lgo+Pgo+PiBUaGUgbW9yZSBJIGxvb2sg
YXQgdGhlIHBhaW5zIG9mIHBhdGNoaW5nIHR3byBpbnN0cnVjdGlvbiAoInNwbGl0Cj4+IGltbWVk
aWF0ZXMiKSwgdGhlIGJldHRlciAicGF0Y2ggZGF0YSIgKyBvbmUgaW5zbiBwYXRjaGluZyBsb29r
Lgo+Cj4gSSB3YXMgbG9va2luZyBhdCBob3cgZHluYW1pYyB0cmFtcG9saW5lcyB3b3VsZCBiZSBp
bXBsZW1lbnRlZCBmb3IgUklTQy1WLgo+Cj4gV2l0aCBDQUxMLU9QUyB3ZSBuZWVkIHRvIHBhdGNo
IHRoZSBhdWlwYytqYWxyIGF0IGZ1bmN0aW9uIGVudHJ5IG9ubHksIHRoZQo+IG9wcyBwb2ludGVy
IGFib3ZlIHRoZSBmdW5jdGlvbiBjYW4gYmUgcGF0Y2hlZCBhdG9taWNhbGx5Lgo+Cj4gV2l0aCBh
IGR5bmFtaWMgdHJhbXBvbGluZSB3ZSBuZWVkIGEgYXVpcGMramFsciBwYWlyIGF0IGZ1bmN0aW9u
IGVudHJ5IHRvIGp1bXAKPiB0byB0aGUgdHJhbXBvbGluZSBhbmQgdGhlbiBhbm90aGVyIGF1aXBj
K2phbHIgcGFpciB0byBqdW1wIGZyb20gdHJhbXBvbGluZSB0bwo+IG9wcy0+ZnVuYy4gV2hlbiB0
aGUgb3BzLT5mdW5jIGlzIG1vZGlmaWVkLCB3ZSB3b3VsZCBuZWVkIHRvIHVwZGF0ZSB0aGUKPiBh
dWlwYytqYWxyIGF0IGluIHRoZSB0cmFtcG9saW5lLgo+Cj4gU28sIEkgYW0gbm90IHN1cmUgaG93
IHRvIG1vdmUgZm9yd2FyZCBoZXJlLCBDQUxMLU9QUyBvciBEeW5hbWljIHRyYW1wb2xpbmVzPwoK
WWVhaC4gSG9uZXN0bHksIHdlIG5lZWQgdG8gZmlndXJlIG91dCB0aGUgcGF0Y2hpbmcgc3Rvcnkg
cHJpb3IKY2hvb3NpbmcgdGhlIHBhdGgsIHNvIGxldCdzIHN0YXJ0IHRoZXJlLgoKQWZ0ZXIgcmVh
ZGluZyBNYXJrJ3MgcmVwbHksIGFuZCBkaXNjdXNzaW5nIHdpdGggT3BlbkpESyBmb2xrcyAod2hv
IGRvZXMKdGhlIG1vc3QgY3JhenkgdGV4dCBwYXRjaGluZyBvbiBhbGwgcGxhdGZvcm1zKSwgaGF2
aW5nIHRvIHBhdGNoIG11bHRpcGxlCmluc3RydWN0aW9ucyAod2hlcmUgdGhlIGFkZHJlc3MgbWF0
ZXJpYWxpemF0aW9uIGlzIHNwbGl0IG92ZXIgbXVsdGlwbGUKaW5zdHJ1Y3Rpb25zKSBpcyBhIG5v
LWdvLiBJdCdzIGp1c3QgYSB0b28gYmlnIGNhbiBvZiB3b3Jtcy4gU28sIGlmIHdlCmNhbiBvbmx5
IHBhdGNoIG9uZSBpbnNuLCBpdCdzIENBTExfT1BTLgoKQSBjb3VwbGUgb2Ygb3B0aW9ucyAoaW4g
YWRkaXRpb24gdG8gQW5keSdzKSwgYW5kIGFsbCByZXF1aXJlIGEKcGVyLWZ1bmN0aW9uIGxhbmRp
bmcgYWRkcmVzcyBhbGEgQ0FMTF9PUFMpIHR3ZWFraW5nIHdoYXQgTWFyayBpcyBkb2luZwpvbiBB
cm0gKGdpdmVuIHRoZSBwb29yIGJyYW5jaCByYW5nZSkuCgouLi5hbmQgbWF5YmUgd2UnbGwgZ2V0
IFJJU0MtViByYWluYm93cy91bmljb3JucyBpbiB0aGUgZnV0dXJlIGdldHRpbmcKYmV0dGVyIHJl
YWNoIChmdWxsIDY0YiEgOy0pKS4KCkEpIFVzZSBhdWlwYy9qYWxyLCBvbmx5IHBhdGNoIGphbHIg
dG8gdGFrZSB1cyB0byBhIGNvbW1vbgogICBkaXNwYXRjaGVyL3RyYW1wb2xpbmUKICAKIHwgPGZ1
bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRhIGNhY2hlLWxpbmUg
IT0gZnVuYyAudGV4dCB0byBhdm9pZCBwaW5nLXBvbmcKIHwgLi4uCiB8IGZ1bmM6CiB8ICAgLi4u
bWFrZSBzdXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgogfCAgIGF1cGljCiB8ICAgbm9wIDw9PiBq
YWxyICMgVGV4dCBwYXRjaCBwb2ludCAtPiBjb21tb25fZGlzcGF0Y2gKIHwgICBBQ1RVQUxfRlVO
QwogfCAKIHwgY29tbW9uX2Rpc3BhdGNoOgogfCAgIGxvYWQgPGZ1bmNfdHJhY2VfdGFyZ2V0X2Rh
dGFfOEI+IGJhc2VkIG9uIHJhCiB8ICAgamFscgogfCAgIC4uLgoKVGhlIGF1aXBjIGlzIG5ldmVy
IHRvdWNoZWQsIGFuZCB3aWxsIGJlIG92ZXJoZWFkLiBBbHNvLCB3ZSBuZWVkIGEgbXYgdG8Kc3Rv
cmUgcmEgaW4gYSBzY3JhdGNoIHJlZ2lzdGVyIGFzIHdlbGwgLS0gbGlrZSBBcm0uIFdlJ2xsIGhh
dmUgdHdvIGluc24KcGVyLWNhbGxlciBvdmVyaGVhZCBmb3IgYSBkaXNhYmxlZCBjYWxsZXIuCgpC
KSBVc2UgamFsLCB3aGljaCBjYW4gb25seSB0YWtlIHVzICsvLTFNLCBhbmQgcmVxdWlyZXMgbXVs
dGlwbGUKICAgZGlzcGF0Y2hlcnMgKGFuZCB0cmFja2luZyB3aGljaCBvbmUgdG8gdXNlLCBhbmQg
cHJvcGVybHkgZGlzdHJpYnV0ZQogICB0aGVtLiBJY2suKQoKIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0
X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRhIGNhY2hlLWxpbmUgIT0gZnVuYyAudGV4dCB0
byBhdm9pZCBwaW5nLXBvbmcKIHwgLi4uCiB8IGZ1bmM6CiB8ICAgLi4ubWFrZSBzdXJlIHJhIGlz
bid0IG1lc3NlZCB1cC4uLgogfCAgIG5vcCA8PT4gamFsICMgVGV4dCBwYXRjaCBwb2ludCAtPiB3
aXRoaW5fMU1fdG9fZnVuY19kaXNwYXRjaAogfCAgIEFDVFVBTF9GVU5DCiB8IAogfCB3aXRoaW5f
MU1fdG9fZnVuY19kaXNwYXRjaDoKIHwgICBsb2FkIDxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhC
PiBiYXNlZCBvbiByYQogfCAgIGphbHIKCkMpIFVzZSBqYWwsIHdoaWNoIGNhbiBvbmx5IHRha2Ug
dXMgKy8tMU0sIGFuZCB1c2UgYSBwZXItZnVuY3Rpb24KICAgdHJhbXBvbGluZSByZXF1aXJlcyBt
dWx0aXBsZSBkaXNwYXRjaGVycyAoYW5kIHRyYWNraW5nIHdoaWNoIG9uZSB0bwogICB1c2UpLiBC
bG93cyB1cCB0ZXh0IHNpemUgQSBMT1QuCgogfCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4g
IyBzb21ld2hlcmUsIGJ1dCBwcm9iYWJseSBvbiBhIGRpZmZlcmVudCBjYWNoZWxpbmUgdGhhbiB0
aGUgLnRleHQgdG8gYXZvaWQgcGluZy1vbmdzCiB8IC4uLgogfCBwZXJfZnVuY19kaXNwYXRjaAog
fCAgIGxvYWQgPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEI+IGJhc2VkIG9uIHJhCiB8ICAgamFs
cgogfCBmdW5jOgogfCAgIC4uLm1ha2Ugc3VyZSByYSBpc24ndCBtZXNzZWQgdXAuLi4KIHwgICBu
b3AgPD0+IGphbCAjIFRleHQgcGF0Y2ggcG9pbnQgLT4gcGVyX2Z1bmNfZGlzcGF0Y2gKIHwgICBB
Q1RVQUxfRlVOQwoKSXQncyBhIGJpdCBzYWQgdGhhdCB3ZSdsbCBhbHdheXMgaGF2ZSB0byBoYXZl
IGEgZGlzcGF0Y2hlci90cmFtcG9saW5lLApidXQgaXQncyBzdGlsbCBiZXR0ZXIgdGhhbiBzdG9w
X21hY2hpbmUoKS4gKEFuZCB3ZSdsbCBuZWVkIGEgZmVuY2VpIElQSQphcyB3ZWxsLCBidXQgb25s
eSBvbmUuIDstKSkKClRvZGF5LCBJJ20gbGVhbmluZyB0b3dhcmRzIEEgKHdoaWNoIGlzIHdoYXQg
TWFyayBzdWdnZXN0ZWQsIGFuZCBhbHNvClJvYmJpbikuLiBBbnkgb3RoZXIgb3B0aW9ucz8KCltO
b3cgaG93IGRvIHdlIGltcGxlbWVudCBPUFRQUk9CRVM/IEknbSBraWRkaW5nLiA7LSldCgoKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
