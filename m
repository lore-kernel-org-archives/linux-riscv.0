Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E9E6F086
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O/1rM3eLTCWRmvZYVvPYl9RzEuk6JeU8YrFihNAptI=; b=XQOfwqrkNafObU
	1GzJZqr96rihZULrMbT5JtK/M1ZVC01zAE5D3cQbNV0SNuxCgYD16LNgInIooAcU1LvSo8TqvPeWl
	URlJDC4pGMyBZNl4mgLzzFYSNSE1h/tr6j/BoB2BNn3fyE/4UYx+tB489nG+hPN1AQ7POJbOOZf9j
	wi7Qvf4cD2dO77sC//rWE/gJ4O/krly1elG6uoQdLLT0wO81Q1qVP/Y89N/bvNEyQcPOGS0kD2dNg
	4pmVxmj2iPPm5bENICRcjnHARptJ0ykdxmDbt0vEfBe2/b1oEYdf3DKv3Cl2PcgUNZ+3d/HF60zCT
	vx09CRgS56uVcn+97jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xQd-0000000899D-3zxC;
	Fri, 01 Nov 2024 19:35:27 +0000
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xKw-000000087y7-3DdU;
	Fri, 01 Nov 2024 19:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730489374; x=1762025374;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=NjClUgMgjMVgsWcpgKIDByy4IpAOZ+8mqyCzWaNAYPY=;
  b=Li2m4VLo4nLkI5+9FgkKIUZn1yFw7ATtWoj3FENL18JoIJ0jCt14kaMo
   E8NDDGdeU+IJ0kkTfsjCalKGOnpWWQl6PtGMEaM/qEGsK+2PW8yxJve6Q
   XRFHN8Vo4kZy3vABsCPXloQkIkdYVxpnBhtJifQHYw2ES7I9SZjEAdH6x
   Q=;
X-IronPort-AV: E=Sophos;i="6.11,250,1725321600"; 
   d="scan'208";a="1341371"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:29:33 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:29829]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.158:2525] with esmtp (Farcaster)
 id 9b6a62cb-9bef-4c52-ac7f-cb4c542891d8; Fri, 1 Nov 2024 19:29:32 +0000 (UTC)
X-Farcaster-Flow-ID: 9b6a62cb-9bef-4c52-ac7f-cb4c542891d8
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 1 Nov 2024 19:29:32 +0000
Received: from [192.168.8.242] (10.106.101.33) by
 EX19D003UWC002.ant.amazon.com (10.13.138.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 1 Nov 2024 19:29:28 +0000
Message-ID: <71e9b2c8-0cc4-4646-88f0-7780e108e610@amazon.com>
Date: Fri, 1 Nov 2024 12:29:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <dave.hansen@intel.com>
References: <d467e6bd-c673-415f-8bb0-91603f06498a@intel.com>
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <d467e6bd-c673-415f-8bb0-91603f06498a@intel.com>
X-Originating-IP: [10.106.101.33]
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122934_882894_6E7E9DCA 
X-CRM114-Status: GOOD (  10.45  )
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

T24gMjAyNC0xMS0wMSBhdCAxODo0MyswMDAwLCBEYXZlIEhhbnNlbiB3cm90ZToKPiBPbiAxMS8x
LzI0IDExOjMxLCBNYW53YXJpbmcsIERlcmVrIHdyb3RlOgo+ID4gRnJvbSB0aGF0IHN0YW5kcG9p
bnQgSSdtIHN0aWxsIHRlbXB0ZWQgdG8gdHVybiB0aGUgcXVlc3Rpb24gYXJvdW5kIGEgYml0Cj4g
PiBmb3IgdGhlIGhvc3Qga2VybmVsJ3MgcGVyc3BlY3RpdmUuIExpa2UgaWYgdGhlIGhvc3Qga2Vy
bmVsIHNob3VsZCBub3QKPiA+IChhbmQgaW5kZWVkIGNhbm5vdCB3aXRoIFREWCBjb250cm9scyBp
biBwbGFjZSkgYWNjZXNzIGd1ZXN0IHByaXZhdGUKPiA+IG1lbW9yeSwgd2h5IG5vdCByZW1vdmUg
aXQgZnJvbSB0aGUgZGlyZWN0IG1hcD8KPgo+IFByZXRlbmQgdGhhdCB0aGUgbWFjaGluZSBjaGVj
ayB3YXJ0cyBhcmVuJ3QgdGhlcmUuCj4KPiBJdCBjb3N0cyBwZXJmb3JtYW5jZSBhbmQgY29tcGxl
eGl0eSwgZm9yIGFuIG9ubHkgdGhlb3JldGljYWwgZ2Fpbi7CoCBUaGlzCj4gaXMgZXNwZWNpYWxs
eSB0cnVlIGZvciBhIFZNTSB0aGF0J3Mgbm90IGRvaW5nIGEganVzdCBkb2luZyBjb25maWRlbnRp
YWwKPiBndWVzdHMuwqAgWW91IGZyYWN0dXJlIHRoZSBkaXJlY3QgbWFwIHRvIHBpZWNlcyBmb3Jl
dmVyIChmb3Igbm93KS4KCkknbSBob3BlZnVsIHdlJ2xsIG5hdmlnYXRlIHRoZSBjb21wbGV4aXR5
IGluIGEgd29ydGh3aGlsZSB3YXkgZm9yIHRoZQpub24tQ29DbyBjYXNlLiBBc3N1bWluZyB3ZSBn
ZXQgdGhlcmUgYW5kIGhhdmUgdGhlIG9wdGlvbiB0byByZW1vdmUgZnJvbQpkaXJlY3QgbWFwLCB1
c2VycyB3aXRoIENvQ28gaGFyZHdhcmUgY291bGQgY2hvb3NlIGlmIHRoZXkgd2FudCB0byBkbwpi
b3RoIG9uIHRoZWlyIGhvc3QuIEZvciBtZSB0aGF0J3MgYSBzZW5zaWJsZSBjaG9pY2UsIGJ1dCBt
YXliZSB0aGF0J3MKanVzdCBtZS4KCkFzIGZhciBhcyBwZXJmb3JtYW5jZSwgYXJlIHlvdSB0YWxr
aW5nIGFib3V0IGp1c3QgdGhlIGZyYWN0dXJpbmcgb3IKc29tZXRoaW5nIGJleW9uZCB0aGF0PyBU
aGUgZGF0YSBNaWtlIGJyb3VnaHQgdG8gTFNGTU1CUEYgMjAyMyBzaG93ZWQgdGhlCnBlcmYgaW1w
YWN0IGZyb20gZGlyZWN0IG1hcCBmcmFnbWVudGF0aW9uIGZvciBtZW1mZF9zZWNyZXQgaXNuJ3Qg
InRoYXQKYmFkIiBbMV0uCgpEZXJlawoKClsxXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvOTMx
NDA2LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
