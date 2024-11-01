Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6689CE6F07D
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdVogIyO+AGMXc8AIgagt/bHvgVi9sGRn1zu/65/1Qk=; b=IE1e49nLXVGE0S
	EQPwXsuP5Ji/I/3l1cB9KJ+V9SY/o4dEfJRbAvRwzlXIBK5VZjhHd91sl1EPs+WpTMRtalDcpIB/E
	vP4vWmpYHIEHBuf3wwpL2U5UABigzXHZu0shh4Q3417f2yjE7YbeTQ8Oql6Uwug35tx9rlwKCb3Kf
	sgCPK66oO1tQyGTyABafcopTUV2ni9Q2IaUDDPVuRF4ZxJ9Edd2kcY87LxO96uhGAccbIH/Sb5s3m
	XvPLVwkoOsR43kVWX2Tyb7buDnk1+oK/n4v4XaPJvL+ZTU2U/00lFgtRpy/sUa6o0YtBaLwbAP4S/
	VacQfWuzYJ9HDrjN1k6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wQd-00000007zM8-3kl8;
	Fri, 01 Nov 2024 18:31:23 +0000
Received: from smtp-fw-80008.amazon.com ([99.78.197.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wQa-00000007zKa-0j3m;
	Fri, 01 Nov 2024 18:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730485880; x=1762021880;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=VBXbIFvMdAI0b5axWwLGdBXRoBbolCT6d2ZfYFcgkm4=;
  b=Zk5tbgVcKyx2xx7X1apImXLO0+1K8LZ2uTPXS17nE5n63kJPuAyAWiaK
   uHZKFZobKfF79l7Kn9LW6WUmrobUfwHOFEzW8J2Y1ApPZvD8SxdfCv6w7
   26qhnGiO8a/DJkXH+LCnBswkQPDfI9wB9yxg522RUEcnSvr++78MTcasW
   E=;
X-IronPort-AV: E=Sophos;i="6.11,250,1725321600"; 
   d="scan'208";a="142665536"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 18:31:18 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.38.20:58862]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.72:2525] with esmtp (Farcaster)
 id dae0559c-5720-41e8-8da6-e0592ac6ae3b; Fri, 1 Nov 2024 18:31:17 +0000 (UTC)
X-Farcaster-Flow-ID: dae0559c-5720-41e8-8da6-e0592ac6ae3b
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 1 Nov 2024 18:31:17 +0000
Received: from [10.142.234.83] (10.142.234.83) by
 EX19D003UWC002.ant.amazon.com (10.13.138.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 1 Nov 2024 18:31:14 +0000
Message-ID: <37fbfc65-b145-4a22-a48c-1921204d5635@amazon.com>
Date: Fri, 1 Nov 2024 11:31:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <dave.hansen@intel.com>
References: <51fe5ad1-7057-4d43-b92c-580d187d2aeb@intel.com>
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <51fe5ad1-7057-4d43-b92c-580d187d2aeb@intel.com>
X-Originating-IP: [10.142.234.83]
X-ClientProxiedBy: EX19D040UWB001.ant.amazon.com (10.13.138.82) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_113120_331505_8FEA2DA7 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, elena.reshetova@intel.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, seanjc@google.com, derekmn@amazon.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0xMS0wMSBhdCAxNzoyMCswMDAwLCBEYXZlIEhhbnNlbiB3cm90ZToKPiBPbiAxMS8x
LzI0IDA5OjU2LCBNYW53YXJpbmcsIERlcmVrIHdyb3RlOgo+ID4gQnV0IGlmIG90aGVyIG1pdGln
YXRpb25zIGNvbXBsZXRlbHkgcHJldmVudCBldmVuIHNwZWN1bGF0aXZlIGFjY2Vzcwo+ID4gb2Yg
VEQgcHJpdmF0ZSBtZW1vcnkgbGlrZSB5b3UncmUgc2F5aW5nLCB0aGVuIGFncmVlIG5vdGhpbmcg
dG8gZ2Fpbgo+ID4gZnJvbSBkaXJlY3QgbWFwIHJlbW92YWwgaW4gdGhlIFREWCBjYXNlLgo+IFJl
bWVtYmVyLCBndWVzdCB1bm1hcHBpbmcgaXMgZG9uZSBpbiB0aGUgVk1NLsKgIFRoZSBWTU0gaXMg
bm90IHRydXN0ZWQgaW4KPiB0aGUgVERYIChvciBTRVYtU05QKSBtb2RlbC7CoCBJZiBhbnkgVk1N
IGNhbiBoYXJtIHRoZSBwcm90ZWN0aW9ucyBvbgo+IGd1ZXN0IG1lbW9yeSwgdGhlbiB3ZSBoYXZl
IGEgYmlnIHByb2JsZW0uCj4KPiBUaGF0IGlzbid0IHRvIHNheSBiaWcgcHJvYmxlbSBjYW4ndCBo
YXBwZW4uwqAgU2F5IHNvbWUgY3JhenkgYXR0YWNrIGNvbWVzCj4gdG8gbGlnaHQgd2hlcmUgdGhl
IFZNTSBjYW4gYXR0YWNrIFREWCBpZiB0aGUgVk1NIGhhcyBtYXBwaW5nIGZvciBhIGd1ZXN0Cj4g
KG9yIFREWCBtb2R1bGUpIG1lbW9yeS7CoCBDcmF6aWVyIHRoaW5ncyBoYXZlIGhhcHBlbmVkLCBh
bmQgZ3Vlc3QKPiB1bm1hcHBpbmcgX3dvdWxkXyBoZWxwIHRoZXJlLCBpZiB5b3UgdHJ1c3RlZCB0
aGUgVk1NLgo+Cj4gQmFzaWNhbGx5LCBJIHRoaW5rIGd1ZXN0IHVubWFwcGluZyBvbmx5IGhlbHBz
IHN5c3RlbSBzZWN1cml0eSBhcyBhIHdob2xlCj4gaWYgeW91IG11c3QgX2FscmVhZHlfIHRydXN0
IHRoZSBWTU0uCgpZZWFoIHRoYXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UuIEkganVzdCB2aWV3IHRo
ZSBpZGVhbCBvdXRjb21lIGFzIGEKY29tcG9zaXRpb24gb2Ygc3Ryb25nLCBpbmRlcGVuZGVudCBk
ZWZlbnNlcy4gU28gYXMgYSBndWVzdCB5b3UgaGF2ZSB0aGUKY29uZmlkZW50aWFsaXR5IGFuZCBp
bnRlZ3JpdHkgZ3VhcmFudGVlcyBvZiB0aGUgaGFyZHdhcmUsICphbmQqIHlvdSBoYXZlCmFuIHVw
LXRvLWRhdGUsIGdvb2QtaHlnaWVuZSAoYWxiZWl0IG5vdCBhdHRlc3RlZCkgaG9zdCBrZXJuZWwg
anVzdCBpbgpjYXNlIHNvbWUgY3JhenkgYXR0YWNrL2dhcCBjb21lcyB1cC4KCkZyb20gdGhhdCBz
dGFuZHBvaW50IEknbSBzdGlsbCB0ZW1wdGVkIHRvIHR1cm4gdGhlIHF1ZXN0aW9uIGFyb3VuZCBh
IGJpdApmb3IgdGhlIGhvc3Qga2VybmVsJ3MgcGVyc3BlY3RpdmUuIExpa2UgaWYgdGhlIGhvc3Qg
a2VybmVsIHNob3VsZCBub3QKKGFuZCBpbmRlZWQgY2Fubm90IHdpdGggVERYIGNvbnRyb2xzIGlu
IHBsYWNlKSBhY2Nlc3MgZ3Vlc3QgcHJpdmF0ZQptZW1vcnksIHdoeSBub3QgcmVtb3ZlIGl0IGZy
b20gdGhlIGRpcmVjdCBtYXA/CgpEZXJlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
