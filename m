Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D8E6F06F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwuK2BfAazdTjcIoqAojcRpUzudvWSZnMYbYxbvNkLI=; b=anVoAXt2RLavc7
	TcX9CpeOqkuBQdU02GNwjkDdU1oALlug/8xcN4doRxf5YCGGHgMuZC7zwTj2+UF8Wpw7qK9Z3woPy
	Sch+03uoX16aITBz29gEQ1dtmxHDk9PaVt0uHJj9xkrCb8ttIdPiugz0c57qgm6xD23HdLEbrIRr9
	k5ITlasraDn0607vuAgrlU6Sd6kRLhCh0n7VFDzWGv/l8e2kcEnoRPAOFCWzcR9oJXSBImaC2gI0v
	AWUEeiXPJTDyTF6w4JxwglmMdRSytTlCRy/1vztdx/Dq4ct2WlcbHe7UnBuGR0pM8DZmuLpSctIWy
	jX959+XE3ivHH7uWZ1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vLs-00000007pUR-3PCG;
	Fri, 01 Nov 2024 17:22:24 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vKH-00000007pAe-26om;
	Fri, 01 Nov 2024 17:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730481646; x=1762017646;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JQUGAkKtWtuixpyKXvV6X4p91cSL2otwfZ1ndMlp72U=;
  b=miP8HM941nVYs2B0PEE+LW9IgfIxD1adf1feIRrjl77slJgnug+62jp1
   tG0KrGN2woAx6KDHYHCnDHt3FyegNTJuAMAGb4gZp/nxSqgX33dRp6g5i
   lOT2upr3bSfix8kk5pvuMwm1+2JGNqvZVmZHyo/AlFR5AsxQ11NpwBgXL
   j0lhfVECZD6gH+jVzu4cvDZ3Tnl/5XVi22rNPR1RNUjZLf7gq7MyHltKJ
   2DYRWdZdrcl7ClcOEfdRFTP6K5ppkxJDnpirhxsQXGld+plwOrDp9FIwk
   6L8slk0QVLWtrxoP+j6nlxdecgy43aDt/Rx6OmIQ1DhBDSE4rUvSJWyPC
   w==;
X-CSE-ConnectionGUID: eQmAY1gNSreT/oQH5PWS4Q==
X-CSE-MsgGUID: QW0+qxT1SEy1J929giExBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41352556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41352556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:20:44 -0700
X-CSE-ConnectionGUID: P6WoitMvTceDc6oAW6kXww==
X-CSE-MsgGUID: LNpDzPlsRxCpzCJmDkTCdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="82899568"
Received: from ccbilbre-mobl3.amr.corp.intel.com (HELO [10.124.220.146]) ([10.124.220.146])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:20:41 -0700
Message-ID: <51fe5ad1-7057-4d43-b92c-580d187d2aeb@intel.com>
Date: Fri, 1 Nov 2024 10:20:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
To: "Manwaring, Derek" <derekmn@amazon.com>
References: <784d1522-0451-4844-a334-8b7d49019437@intel.com>
 <7bd627df-0303-4ded-b8c8-ceb84fb20f0d@amazon.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <7bd627df-0303-4ded-b8c8-ceb84fb20f0d@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_102045_609841_B2D464E2 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, elena.reshetova@intel.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, seanjc@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMS8yNCAwOTo1NiwgTWFud2FyaW5nLCBEZXJlayB3cm90ZToKLi4uCj4+PiBBbnkgc29m
dHdhcmUgZXhjZXB0IGd1ZXN0IFREIG9yIFREWCBtb2R1bGUgbXVzdCBub3QgYmUgYWJsZSB0bwo+
Pj4gc3BlY3VsYXRpdmVseSBvciBub24tc3BlY3VsYXRpdmVseSBhY2Nlc3MgVEQgcHJpdmF0ZSBt
ZW1vcnksCj4+Cj4+IFRoYXQncyBhIHByZXR0eSBicm9hZCBjbGFpbSBhbmQgaXQgaW52b2x2ZXMg
bWl0aWdhdGlvbnMgaW4gaGFyZHdhcmUgYW5kCj4+IHRoZSBURFggbW9kdWxlLgo+Pgo+PiAxLiBo
dHRwczovL2NkcmR2Mi5pbnRlbC5jb20vdjEvZGwvZ2V0Q29udGVudC83MzM1NzUKPiAKPiBUaGFu
ayB5b3UsIEkgaGFkbid0IHNlZW4gdGhhdC4gVGhhdCBpcyBhIHZlcnkgc3Ryb25nIGNsYWltIGFz
IGZhciBhcwo+IHByZXZlbnRpbmcgc3BlY3VsYXRpdmUgYWNjZXNzOyBJIGRpZG4ndCByZWFsaXpl
IEludGVsIGNsYWltZWQgdGhhdCBhYm91dAo+IFREWC4gVGhlIGNvbW1hIGZvbGxvd2VkIGJ5ICJ0
byBkZXRlY3QgaWYgYSBwcmlvciBjb3JydXB0aW9uIGF0dGVtcHQgd2FzCj4gc3VjY2Vzc2Z1bCIg
bWFrZXMgbWUgd29uZGVyIGEgYml0IGlmIHRoZSBzdGF0ZW1lbnQgaXMgbm90IHF1aXRlIGFzIGJy
b2FkCj4gYXMgaXQgc291bmRzLCBidXQgbWF5YmUgdGhhdCdzIGp1c3QgbWVhbnQgdG8gcmVsYXRl
IGl0IHRvIHRoZSBpbnRlZ3JpdHkKPiBzZWN0aW9uPwoKSSB0aGluayBpdCdzIGp1c3QgcmVsYXRp
bmcgaXQgdG8gdGhlIGludGVncml0eSBzZWN0aW9uLgoKPj4gSWYgdGhlIGF0dGFjayBpcyBtaXRp
Z2F0ZWQgd2hlbiB0aGUgPiBkYXRhIGlzIF9tYXBwZWRfLCB0aGVuIGl0J3MKPj4gY2VydGFpbmx5
IG5vdCBwb3NzaWJsZSBfdW5tYXBwZWRfLgo+Pgo+PiBTbyB3aHkgYm90aGVyIHdpdGggZGlyZWN0
IG1hcCByZW1vdmFsIGZvciBURFg/wqAgQSBWTU0gd3JpdGUgdG8gVEQKPj4gcHJpdmF0ZSBkYXRh
IGNhdXNlcyBtYWNoaW5lIGNoZWNrcy7CoCBTbyBhbnkga2VybmVsIGJ1ZyB0aGF0IGV2ZW4KPj4g
YWNjaWRlbnRhbGx5IHdyaXRlcyB0byBrZXJuZWwgbWVtb3J5IGNhbiBicmluZyB0aGUgd2hvbGUg
c3lzdGVtIGRvd24uCj4+IE5vdCBuaWNlLgo+IAo+IEZhaXIgZW5vdWdoLiBJdCBoYXNuJ3QgYmVl
biBjbGVhciB0byBtZSBpZiB0aGVyZSBpcyBhIG1hY2hpbmUgY2hlY2sgd2hlbgo+IHRoZSBob3N0
IGtlcm5lbCBhY2Nlc3NlcyBndWVzdCBtZW1vcnkgb25seSB0cmFuc2llbnRseS4gSSB3YXMgYXNz
dW1pbmcKPiB0aGVyZSBpcyBub3QuIAoKUHJldmlvdXMgZ2VuZXJhdGlvbnMgb2YgaGFyZHdhcmUg
aGF2ZSBoYWQgc29tZSBuYXN0aW5lc3MgaW4gdGhpcyBhcmVhLgpTcGVjdWxhdGl2ZSBhY2Nlc3Nl
cyB3ZXJlIChJIHRoaW5rKSBsb2dnZWQgaW4gdGhlIG1hY2hpbmUgY2hlY2sgYmFua3MsCmJ1dCB3
b3VsZG4ndCByYWlzZSBhbiAjTUMuICBJIGJlbGlldmUgVERYLWNhcGFibGUgaGFyZHdhcmUgd29u
J3QgZXZlbgpsb2cgc3BlY3VsYXRpdmUgYWNjZXNzZXMuCgo+IEJ1dCBpZiBvdGhlciBtaXRpZ2F0
aW9ucyBjb21wbGV0ZWx5IHByZXZlbnQgZXZlbiBzcGVjdWxhdGl2ZSBhY2Nlc3MKPiBvZiBURCBw
cml2YXRlIG1lbW9yeSBsaWtlIHlvdSdyZSBzYXlpbmcsIHRoZW4gYWdyZWUgbm90aGluZyB0byBn
YWluCj4gZnJvbSBkaXJlY3QgbWFwIHJlbW92YWwgaW4gdGhlIFREWCBjYXNlLgpSZW1lbWJlciwg
Z3Vlc3QgdW5tYXBwaW5nIGlzIGRvbmUgaW4gdGhlIFZNTS4gIFRoZSBWTU0gaXMgbm90IHRydXN0
ZWQgaW4KdGhlIFREWCAob3IgU0VWLVNOUCkgbW9kZWwuICBJZiBhbnkgVk1NIGNhbiBoYXJtIHRo
ZSBwcm90ZWN0aW9ucyBvbgpndWVzdCBtZW1vcnksIHRoZW4gd2UgaGF2ZSBhIGJpZyBwcm9ibGVt
LgoKVGhhdCBpc24ndCB0byBzYXkgYmlnIHByb2JsZW0gY2FuJ3QgaGFwcGVuLiAgU2F5IHNvbWUg
Y3JhenkgYXR0YWNrIGNvbWVzCnRvIGxpZ2h0IHdoZXJlIHRoZSBWTU0gY2FuIGF0dGFjayBURFgg
aWYgdGhlIFZNTSBoYXMgbWFwcGluZyBmb3IgYSBndWVzdAoob3IgVERYIG1vZHVsZSkgbWVtb3J5
LiAgQ3JhemllciB0aGluZ3MgaGF2ZSBoYXBwZW5lZCwgYW5kIGd1ZXN0CnVubWFwcGluZyBfd291
bGRfIGhlbHAgdGhlcmUsIGlmIHlvdSB0cnVzdGVkIHRoZSBWTU0uCgpCYXNpY2FsbHksIEkgdGhp
bmsgZ3Vlc3QgdW5tYXBwaW5nIG9ubHkgaGVscHMgc3lzdGVtIHNlY3VyaXR5IGFzIGEgd2hvbGUK
aWYgeW91IG11c3QgX2FscmVhZHlfIHRydXN0IHRoZSBWTU0uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
