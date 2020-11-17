Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2F1C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC43238E6
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRwzp9tc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8sWlliy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BC43238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tb1cwRCFE3AFHVxjEQuj6oMYgw66uGYJyalZlXcSSI0=; b=rRwzp9tcDLImdtqzzokpg6R1B
	4/XvVljT/d6zpVgrdiHKLYyhProLzsJuzxqOBYKUu2n7fV2AXhEEe8HEyDdOKl5i9ejt/kClTQGjW
	RPgkRmk95IoADPtK9iackc0+s+YbVPMn1o1iVBW7zYsQ0wgxkpuTk1+XZ/IIsNoWXrxMQzRHAkWA4
	QsdeJHH26jijTBfg/n6x5llM9fP+CmXItYTXOupKY8hvAySY3uAz7OQ9bcGYOt/IdmBxSoK3F2YCO
	bFf6HtBX2U+jbw5Xjj05gz2Xr/T9jofAluJjkI2oIDEmwTw+t+aOQ6xncFkZQakUBkrLPUuzfUGcs
	2Yft8qKEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf3NX-0006ND-R2; Tue, 17 Nov 2020 15:58:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf3NS-0006LF-Nj; Tue, 17 Nov 2020 15:58:44 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3B60238E6;
 Tue, 17 Nov 2020 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605628721;
 bh=9is+MjALfTGepw57FVx0JouySPxlzfHt3CDVLQ4Unmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8sWlliyDkUNYoXZjFWSoiuQvdgEZNX+2SxP4AeRu3E6J1nQ7q1oTfz+6Ip2yE0wn
 cmwAFaK1S/AmhU4S6q0bHx0jhCupiexg9VCuzKWD3rTOMD16YOJ0wT4exivwNxppfK
 VG9oFzcdjadQK9Y3xyHqBPePYLUqwIL58wy/neZo=
Date: Tue, 17 Nov 2020 17:58:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
Message-ID: <20201117155829.GJ370813@kernel.org>
References: <20201112190827.GP4758@kernel.org>
 <7A16CA44-782D-4ABA-8D93-76BDD0A90F94@redhat.com>
 <20201115082625.GT4758@kernel.org>
 <d47fdd2e-a8fa-6792-ca8f-e529be76340c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d47fdd2e-a8fa-6792-ca8f-e529be76340c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_105843_032567_278F5DB9 
X-CRM114-Status: GOOD (  25.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDQ6MDk6MzlQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMTUuMTEuMjAgMDk6MjYsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwOToxNToxOFBNICswMTAwLCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToKCi4uLgoKPiA+IE15IHRoaW5raW5nIHdhcyB0aGF0IHNpbmNlIHNlY3JldG1lbSBk
b2VzIHdoYXQgbWxvY2soKSBkb2VzIHdydAo+ID4gc3dhcGFiaWxpdHksIGl0IHNob3VsZCBhdCBs
ZWFzdCBvYmV5IHRoZSBzYW1lIGxpbWl0LCBpLmUuCj4gPiBSTElNSVRfTUVNTE9DSy4KPiAKPiBS
aWdodCwgYnV0IGF0IGxlYXN0IGN1cnJlbnRseSwgaXQgYmVoYXZlcyBsaWtlIGFueSBvdGhlciBD
TUEgYWxsb2NhdGlvbgo+IChJSVJDIHRoZXkgYXJlIGFsbCB1bm1vdmFibGUgYW5kLCB0aGVyZWZv
cmUsIG5vdCBzd2FwcGFibGUpLiBJbiB0aGUgZnV0dXJlLAo+IGlmIHBhZ2VzIHdvdWxkIGJlIG1v
dmFibGUgKGJ1dCBub3Qgc3dhcHBhYmxlKSwgSSBndWVzcyBpdCBtaWdodCBtYWtlcyBtb3JlCj4g
c2Vuc2UuIEkgYXNzdW1lIHdlIG5ldmVyIGV2ZXIgd2FudCB0byBzd2FwIHNlY3JldG1lbS4KPiAK
PiAibWFuIGdldHJsaW1pdCIgc3RhdGVzIGZvciBSTElNSVRfTUVNTE9DSzoKPiAKPiAiVGhpcyBp
cyB0aGUgbWF4aW11bSBudW1iZXIgb2YgYnl0ZXMgb2YgbWVtb3J5IHRoYXQgbWF5IGJlCj4gIGxv
Y2tlZCBpbnRvIFJBTS4gIFsuLi5dIFRoaXMgbGltaXQgYWZmZWN0cwo+ICBtbG9jaygyKSwgbWxv
Y2thbGwoMiksIGFuZCB0aGUgbW1hcCgyKSBNQVBfTE9DS0VEIG9wZXJhdGlvbi4KPiAgU2luY2Ug
TGludXggMi42LjksIGl0IGFsc28gYWZmZWN0cyB0aGUgc2htY3RsKDIpIFNITV9MT0NLIG9w4oCQ
Cj4gIGVyYXRpb24gWy4uLl0iCj4gCj4gU28gdGhhdCBwbGFjZSBoYXMgdG8gYmUgdXBkYXRlZCBh
cyB3ZWxsIEkgZ3Vlc3M/IE90aGVyd2lzZSB0aGlzIG1pZ2h0IGNvbWUKPiBhcyBhIHN1cnByaXNl
IGZvciB1c2Vycy4KClN1cmUuCgo+ID4gCj4gPiA+IEUuZy4sIHdlIGFsc28gZG9u4oCYdAo+ID4g
PiBhY2NvdW50IGZvciBnaWdhbnRpYyBwYWdlcyAtIHdoaWNoIG1pZ2h0IGJlIGFsbG9jYXRlZCBm
cm9tIENNQSBhbmQgYXJlCj4gPiA+IG5vdCBzd2FwcGFibGUuCj4gPiBEbyB5b3UgbWVhbiBnaWdh
bnRpYyBwYWdlcyBpbiBodWdldGxiZnM/Cj4gCj4gWWVzCj4gCj4gPiBJdCBzZWVtcyB0byBtZSB0
aGF0IGh1Z2V0bGJmcyBhY2NvdW50aW5nIGlzIGEgY29tcGxldGVseSBkaWZmZXJlbnQKPiA+IHN0
b3J5Lgo+IAo+IEknZCBzYXkgaXQgaXMgcmlnaHQgbm93IGNvbXBhcmFibGUgdG8gc2VjcmV0bWVt
IC0gd2hpY2ggaXMgd2h5IEkgdGhvdWdoCj4gc2ltaWxhciBhY2NvdW50aW5nIHdvdWxkIG1ha2Ug
c2Vuc2UuCgpJTUhPLCB1c2luZyBSTElNSVRfTUVNTE9DSyBhbmQgbWVtY2cgaXMgYSBtb3JlIHN0
cmFpZ2h0Zm9yd2FyZCB3YXkgdGhhbgphIGN1c3RvbSBjZ3JvdXAuCgpBbmQgaWYgd2UnbGwgc2Vl
IGEgbmVlZCBmb3IgYWRkaXRpb25hbCBtZWNoYW5pc20sIHdlIGNhbiBhbHdheXMgYWRkIGl0Lgog
Cj4gLS0gCj4gVGhhbmtzLAo+IAo+IERhdmlkIC8gZGhpbGRlbmIKPiAKPiAKCi0tIApTaW5jZXJl
bHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
