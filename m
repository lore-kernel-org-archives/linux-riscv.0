Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5F8D6D23D
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGyr2lgd+mlB7PlAJKbfpIBBoezCTdG5zFtinLUT+lo=; b=4CQca0LySn2xxz
	snGuNSBPW76LNvkl4hYs/d9D7YCqzC1YRlL0WTvt2MqESop+6IZJ7ui2XAYXfh1PtK4PtOJfst18e
	HAg2gZv8b3n7gGQkvgIphRnZ77n/qfN6w/hNndoPjbEKhYP2li6aLdbVUAkG+lE6WFF/P0k48vZ7J
	+gEFzm1Vd2LudpkM8fB/5440oWr3niM3G215EHUVb0DbFgwq219m8mA0m7Cpq+TvijXHX/XBs3GfK
	URFuHzmB0naTlxXrxg31B9RysEdSgnqQdDhTgQ4cYbRYMJ+tnQCXP/J5gh08pevcBYjk6BJOhhyvI
	71OHOtnbX2PhC2IbdR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPXw-0000000E7dn-2jPd;
	Wed, 27 Nov 2024 21:26:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPXu-0000000E7dB-17SH
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 21:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79064A40336;
	Wed, 27 Nov 2024 21:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CAFC4CED2;
	Wed, 27 Nov 2024 21:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732742761;
	bh=RrHDVweNwvoqrOMwYtZp9qluVuL3gDi+cBfsfnkg6Tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A3t9bZ8EmXIioTHMce62anSQn+jiH5uF/rZyxanOkDQJTerumAdx6BvH5CUUsYVJY
	 /FqFUQGppa67XuiFZ9AkIgMmjCuGgQXl5XFZY3t741JUj5LIJ3SXK4EwbXSvP2aneT
	 3ua+zeVZDXd4LWpXvuq2wTnL/7UQSVPj6fIN+cjiFwVUCDEhgf0efVqY9rmFbmxxn8
	 I0j+DJGmy1npu6wud1U7fF129t/G923zKnTTXC+by5V/0dI0GrL4d0DaWYwWEk+pME
	 ryFsL/TTc2wFoSYXhUjuX+A7WRBWaOg6wHYeaqQILgET258ezYH79S2JJhRkP0hIwf
	 yzFaJNvlNoEsQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Steven Rostedt
 <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, bjorn@rivosinc.com, puranjay12@gmail.com,
 alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
 eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
 samuel.holland@sifive.com
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
Date: Wed, 27 Nov 2024 22:25:57 +0100
Message-ID: <87frncmkre.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_132602_437113_04F89103 
X-CRM114-Status: GOOD (  24.45  )
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

QWRkaW5nIFN0ZXZlbi4KCkFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPiB3cml0ZXM6Cgo+
IFRoaXMgc2VyaWVzIG1ha2VzIGF0bW9pYyBjb2RlIHBhdGNoaW5nIHBvc3NpYmxlIGluIHJpc2N2
IGZ0cmFjZS4gQQo+IGRpcmVjdCBiZW5lZml0IG9mIHRoaXMgaXMgdGhhdCB3ZSBjYW4gZ2V0IHJp
ZCBvZiBzdG9wX21hY2hpbmUoKSB3aGVuCj4gcGF0Y2hpbmcgZnVuY3Rpb24gZW50cmllcy4gVGhp
cyBhbHNvIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHJ1biBmdHJhY2UKPiB3aXRoIGZ1bGwga2VybmVs
IHByZWVtcHRpb24uIEJlZm9yZSB0aGlzIHNlcmllcywgdGhlIGtlcm5lbCBpbml0aWFsaXplcwo+
IHBhdGNoYWJsZSBmdW5jdGlvbiBlbnRyaWVzIHRvIE5PUDQgKyBOT1A0LiBUbyBzdGFydCB0cmFj
aW5nLCBpdCB1cGRhdGVzCj4gZW50cmllcyB0byBBVUlQQyArIEpBTFIgd2hpbGUgaG9sZGluZyBv
dGhlciBjb3JlcyBpbiBzdG9wX21hY2hpbmUuCj4gc3RvcF9tYWNoaW5lKCkgaXMgcmVxdWlyZWQg
YmVjYXVzZSBpdCBpcyBpbXBvc3NpYmxlIHRvIHVwZGF0ZSAyCj4gaW5zdHJ1Y3Rpb25zLCBhbmQg
YmUgc2VlbiBhdG9taWNhbGx5LiBBbmQgcHJlZW1wdGlvbiBtdXN0IGhhdmUgdG8gYmUKPiBwcmV2
ZW50ZWQsIGFzIGtlcm5lbCBwcmVlbXB0aW9uIGFsbG93cyBwcm9jZXNzIHRvIGJlIHNjaGVkdWxl
ZCBvdXQgd2hpbGUKPiBleGVjdXRpbmcgb24gb25lIG9mIHRoZXNlIGluc3RydWN0aW9uIHBhaXJz
Lgo+Cj4gVGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRoZSBwcm9ibGVtIGJ5IGluaXRpYWxpemluZyB0
aGUgZmlyc3QgTk9QNCB0bwo+IEFVSVBDLiBTbywgYXRtb2ljIHBhdGNoaW5nIGlzIHBvc3NpYmxl
IGJlY2F1c2UgdGhlIGtlcm5lbCBvbmx5IGhhcyB0bwo+IHVwZGF0ZSBvbmUgaW5zdHJ1Y3Rpb24u
IEFzIGxvbmcgYXMgdGhlIGluc3RydWN0aW9uIGlzIG5hdHVyYWxseSBhbGlnbmVkLAo+IHRoZW4g
aXQgaXMgZXhwZWN0ZWQgdG8gYmUgdXBkYXRlZCBhdG9taWNhbGx5Lgo+Cj4gSG93ZXZlciwgdGhl
IGFkZHJlc3MgcmFuZ2Ugb2YgdGhlIGZ0cmFjZSB0cmFtcG9saW5lIGlzIGxpbWl0ZWQgdG8gKy0y
Swo+IGZyb20gZnRyYWNlX2NhbGxlciBhZnRlciBhcHBwbHlpbmcgdGhpcyBzZXJpZXMuIFRoaXMg
aXNzdWUgaXMgZXhwZWN0ZWQKPiB0byBiZSBzb2x2ZWQgYnkgUHVyYW5qYXkncyBDQUxMX09QUywg
d2hlcmUgaXQgYWRkcyA4QiBuYXR1cmFsbHkgYWxpZ24KPiBkYXRhIGluIGZyb250IG9mIHBhY3Ro
YWJsZSBmdW5jdGlvbnMgYW5kIGNhbiAgdXNlIGl0IHRvIGRpcmVjdCBleGVjdXRpb24KPiBvdXQg
dG8gYW55IGN1c3RvbSB0cmFtcG9saW5lcy4KPgo+IFRoZSBzZXJpZXMgaXMgY29tcG9zZWQgYnkg
dGhyZWUgcGFydHMuIFRoZSBmaXJzdCBwYXJ0IGNsZWFucyB1cCB0aGUKPiBleGlzdGluZyBpc3N1
ZXMgd2hlbiB0aGUga2VybmVsIGlzIGNvbXBpbGVkIHdpdGggY2xhbmcuVGhlIHNlY29uZCBwYXJ0
Cj4gbW9kaWZpZXMgdGhlIGZ0cmFjZSBjb2RlIHBhdGNoaW5nIG1lY2hhbmlzbSAoMi00KSBhcyBt
ZW50aW9uZWQgYWJvdmUuCj4gVGhlbiBwcmVwYXJlIGZ0cmFjZSB0byBiZSBhYmxlIHRvIHJ1biB3
aXRoIGtlcm5lbCBwcmVlbXB0aW9uICg1LDYpCj4KPiBBbiBvbmdvaW5nIGZpeDoKPgo+IFNpbmNl
IHRoZXJlIGlzIG5vIHJvb20gZm9yIG1hcmtpbmcgKmtlcm5lbF90ZXh0X2FkZHJlc3MgYXMgbm90
cmFjZVsxXSBhdAo+IHNvdXJjZSBjb2RlIGxldmVsLCB0aGVyZSBpcyBhIHNpZ25pZmljYW50IHBl
cmZvcm1hbmNlIHJlZ3Jlc3Npb24gd2hlbgo+IHVzaW5nIGZ1bmN0aW9uX2dyYXBoIHdpdGggVFJB
Q0VfSVJRRkxBR1MgZW5hYmxlZC4gVGhlcmUgY2FuIGJlIGFzIG11Y2ggYXMKPiA4IGdyYXBoIGhh
bmRsZXIgYmVpbmcgY2FsbGVkIGluIGVhY2ggZnVuY3Rpb24tZW50cnkuIFRoZSBjdXJyZW50Cj4g
d29ya2Fyb3VuZCByZXF1aXJlcyB1cyBlY2hvICIqa2VybmVsX3RleHRfYWRkcmVzcyIgaW50bwo+
IHNldF9mdHJhY2Vfbm90cmFjZSBiZWZvcmUgc3RhcnRpbmcgdGhlIHRyYWNlLiBIb3dldmVyLCB3
ZSBvYnNlcnZlZCB0aGF0Cj4gdGhlIGtlcm5lbCBzdGlsbCBlbmFibGVzIHRoZSBwYXRjaCBzaXRl
IGluIHNvbWUgY2FzZXMgZXZlbiB3aXRoCj4gKmtlcm5lbF90ZXh0X2FkZHJlc3MgcHJvcGVybHkg
YWRkZWQgaW4gdGhlIGZpbGUgV2hpbGUgdGhlIHJvb3QgY2F1c2UgaXMKPiBzdGlsbCB1bmRlciBp
bnZlc3RhZ3Rpb24sIHdlIGNvbnNpZGVyIHRoYXQgaXQgc2hvdWxkIG5vdCBiZSB0aGUgcmVhc29u
Cj4gZm9yIGhvbGRpbmcgYmFjayB0aGUgY29kZSBwYXRjaGluZywgaW4gb3JkZXIgdG8gdW5ibG9j
ayB0aGUgY2FsbF9vcHMKPiBwYXJ0LgoKTWF5YmUgU3RldmVuIGtub3dzIHRoaXMgZnJvbSB0aGUg
dG9wIG9mIGhpcyBoZWFkIQoKQXMgQW5keSBwb2ludHMgb3V0LCAiKmtlcm5lbF90ZXh0X2FkZHJl
c3MiIGlzIHVzZWQgaW4gdGhlIHN0YWNrCnVud2luZGluZyBvbiBSSVNDLVYuIFNvLCBpZiB5b3Ug
ZG8gYSB0cmFjaW5nIHdpdGhvdXQgZmlsdGVyaW5nICphbmQqClRSQUNFX0lSUUZMQUdTLCBvbmUg
d2lsbCBkcm93biBpbiB0cmFjZXMuCgpFLmcuIHRoZSBmdHJhY2Ugc2VsZnRlc3Q6CiAgfCAkIC4v
ZnRyYWNldGVzdCAtdnZ2IHRlc3QuZC9mdHJhY2UvZmdyYXBoLW11bHRpLnRjCgp3aWxsIGdlbmVy
YXRlIGEgbG90IG9mIHRyYWNlcy4KCk5vdywgaWYgd2UgYWRkOgotLTg8LS0KZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFwaC1tdWx0
aS50YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2ZncmFw
aC1tdWx0aS50YwppbmRleCBmZjg4Zjk3ZTQxZmIuLjRmMzBhNGQ4MWQ5OSAxMDA2NDQKLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC9mdHJhY2UvZmdyYXBoLW11bHRp
LnRjCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2Zn
cmFwaC1tdWx0aS50YwpAQCAtODQsNiArODQsNyBAQCBjZCAkSU5TVEFOQ0UyCiBkb190ZXN0ICcq
cmN1KicgJ3JjdScKIGNkICRXRAogY2QgJElOU1RBTkNFMworZWNobyAnKmtlcm5lbF90ZXh0X2Fk
ZHJlc3MnID4gc2V0X2Z0cmFjZV9ub3RyYWNlCiBlY2hvIGZ1bmN0aW9uX2dyYXBoID4gY3VycmVu
dF90cmFjZXIKIAogc2xlZXAgMQotLT44LS0KClRoZSBncmFwaCB0cmFjZXIgd2lsbCBub3QgaG9u
b3IgdGhlICJzZXRfZnRyYWNlX25vdHJhY2UiIGluICRJTlNUQU5DRTMsCmJ1dCBzdGlsbCBlbmFi
bGUgdGhlICprZXJuZWxfdGV4dF9hZGRyZXNzIHRyYWNlcy4gKE5vdGUgdGhhdCB0aGVyZSBhcmUK
bm8gZmlsdGVycyBpbiB0aGUgdGVzdCwgc28gKmFsbCogZnRyYWNlIHJlY3Mgd2lsbCBiZSBlbmFi
bGVkLikKCkFyZSB3ZSBob2xkaW5nIHRoZSBncmFwaCB0cmFjZXIgd3Jvbmc/CgoKSGFwcHkgdGhh
bmtzZ2l2aW5nIQpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
