Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31826C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsiKd9H6GampECU6I8vgyZyH7taU4o04Mkp066VnOBk=; b=XZsOjZBw9EYf68
	beVtEMlrGwOqMrvKHFKM2VUimOlq/L/Lb8NkVcPjM61sDIa+/XqfyXSofIyFGng2lzcOUK8kQz7ac
	Pj7Gkt1NQQrsmfhsxrou3I5OJ5nl93uaXxjaagJGXCweUUZvgPiWoPXIobAK3TpK3hMGzHoPF3xVF
	PkESUxBYHcwiF2TsDjIkwmBTxSdtaVuVW4xkvLa1tC06mgnw6SHX/BogfsY+jeuCWUo0rh5wP6UUO
	81cPAe9V7mzfxXFn5eFgOPvqbCxS6kZMbHaK9lqnhDE/hmCuueHFI0Ae4ooSRr+gT+4pIZHFbgIw9
	N3L9cPuc4zBwKZ8BtCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6aUC-00000007xMk-3G5g;
	Tue, 15 Sep 2026 21:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6aUB-00000007xMb-28oR
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 21:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ip+Cwgi5TYff8rWkT7U+yZ7I3GxFDhKXbdUOWRBh9sw=; b=YYx/oUa7MwXe1nx0t9ub82CVzj
	vjLblZc6tMaWKp5l9qcPdzwkscHw3PqSrQCKZ+Yl7ocz9B8h52FcdemZz77P93m7IFJxtGUQ0P9cK
	3mlK/UwdIghUGAUeoopBo0eBhpFbmbJBXGompdW02kvLmfLkZyR+0uHR2DYNp/qm7t4Eef+yfYtcP
	gqSwgkHgtKgzFsRLbH6ufNvhP2zGyMBVV52cF8pnz3287PmPSRXmNaoB/2ZUHf64a5QHYkKI7gP3/
	nqKeaMy+Ot4KtG0RzrWlFRUDqEFxbpPyjBYEyMtC7mGxGEce2WZIuGqk/v2QZ4kkhj2MBmNk272Xd
	KxRsl5sA==;
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6aTx-00000007GED-1oev
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 21:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Ip+Cwgi5TYff8rWkT7U+yZ7I3GxFDhKXbdUOWRBh9sw=; b=AbdbTVd/t4g7VUKOe/btkYV3/l
	jC6jDgpBI9uJMs2MMTzqczNZ8JMt/pqmMLhRpksxqGPlDOQ7ZwtgDImhU9E8HFu0UYFuDHMZGaWpT
	3DsQDFstH3rc5mA4Sfqfm9ffClQZM23cOTeVyci9GVClr2fX5lRCJxIJdCONDJelTw9/i8Y6a6wlf
	UkPYRvaTUg6QSDxxuIdwCaQHC0y1k6iFh5YQlbo+byqpFKLtZBf6bEcmTUIthgPdWLkOD+uvS5eT9
	8dM5LEc+vYPbfn0F50SoDPS6xFHApQ6OYl1WurRxwTB7jgRNM3NEYZH2tEIZBwvB4Fnb0M30vlLSz
	RjGzjUhA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x6aTj-0000000EYvq-0zIR;
	Tue, 15 Sep 2026 23:14:11 +0200
Date: Tue, 15 Sep 2026 23:14:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, Andy Chiu <tchiu@tenstorrent.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <aqm1Ik5202PyscK3@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqGNGp8PInSV4vty@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221432_060464_8C5271BD 
X-CRM114-Status: GOOD (  30.52  )
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

SGksCgpTb21lIG1vcmUgdXBkYXRlLCBldmVuIGlmIHRoZSBwcm9ncmVzcyBpcyBxdWl0ZSBsb3cu
CgpPbiAyMDI2LTA5LTA5IDE4OjQ1LCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiBbQWRkZWQgQW5k
eSBhbmQgS2FybCBpbiBDYzogYXMgdGhleSBoYXZlIGJlZW4gaW52b2x2ZWQgaW4gdGhlIHZlY3Rv
cmVkIAo+IHVzZXIgY29weSBjb2RlIGFuZCBmaWdodGluZyBzaW1pbGFyIGlzc3Vlc10KPiAKPiBI
aSwKPiAKPiBTb21lIG1vcmUgcHJvZ3Jlc3Mgb24gdGhhdCB0b3BpYy4KPiAKPiBPbiAyMDI2LTA5
LTA4IDA2OjQyLCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiA+IERlYXIgYWxsLAo+ID4gCj4gPiBJ
IGhhdmUgZG9uZSBzb21lIHNtYWxsIHByb2dyZXNzIG9uIHRoYXQgaXNzdWUuIEhlbHAgaXMgc3Rp
bGwgd2FudGVkIGFuZCAKPiA+IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+ID4gCj4gPiBPbiAyMDI2
LTA4LTMwIDIyOjUyLCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiA+ID4gRGVhciBhbGwsCj4gPiA+
IAo+ID4gPiBGb3IgdGhlIGxhc3Qgd2Vla3MsIEkgaGF2ZSBiZWVuIHRyYWNraW5nIGEgcmFuZG9t
IG1lbW9yeSBjb3JydXB0aW9uIGFuZAo+ID4gPiByZWxhdGl2ZWx5IHJhcmUgb24gU3BhY2VtaVQg
SzEgKEJhbmFuYSBQaSBGMyBhbmQgTWlsay1WIEp1cGl0ZXIpLiBJdCAKPiA+ID4gc3RhcnRlZCB1
cGdyYWRpbmcgdG8gZ2xpYmMgMi40Mywgd2hpY2ggZG9lcyBtZW1zZXQoKSB0aHJvdWdoIHZlY3Rv
ciAKPiA+ID4gaW5zdHJ1Y3Rpb25zLiAgSXQgaXMgcmVwcm9kdWNpYmxlIHVzaW5nIHRoZSBEZWJp
YW4gNy4xLjctMX5icG8xMysxIAo+ID4gPiBrZXJuZWwsIGJ1dCBJIGhhdmUgYWxzbyBiZWVuIGFi
bGUgdG8gcmVwcm9kdWNlIGl0IHdpdGggYSB2YW5pbGxhIDcuMi4yIAo+ID4gPiBrZXJuZWwsIHVz
aW5nIGEgc2ltaWxhciBjb25maWd1cmF0aW9uIHRvIHRoZSBEZWJpYW4ga2VybmVsLiBUaGUgYm9h
cmQgCj4gPiA+IHVzZXMgT3BlblNCSSAxLjkgYW5kIHRoZSB2ZW5kb3IgVS1Cb290LgoKSSBoYXZl
IGJlZW4gYWJsZSB0byBhbHNvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCB0aGUgdmVuZG9yIE9w
ZW5TQkkuIEl0IAppcyBhbHNvIHJlcHJvZHVjaWJsZSB3aXRoIGxpbnV4IDcuMi42LgoKPiA+IEkg
aGF2ZSBiZWVuIGFibGUgdG8gcnVsZSBvdXQgT3BlblNCSSBmcm9tIHRoZSBpc3N1ZSwgSSBoYXZl
IGNoZWNrZWQgCj4gPiB0aGVyZSBpcyBub3QgdHJhcCB0byBPcGVuU0JJIHdoZW4gdGhlIHByb2Js
ZW0gaGFwcGVucy4KPiA+IAo+ID4gPiBUeXBpY2FsbHkgaXQgbWFuaWZlc3RzIGl0c2VsZiB3aXRo
IHRoZSBmb2xsb3dpbmcga2luZCBvZiBlcnJvciwgd2hlbiAKPiA+ID4gcnVubmluZyBnKysgZnJv
bSBHQ0MgMTYgYXMgcGFydCBvZiBidWlsZGluZyBzb2Z0d2FyZSAoZS5nLiBPcGVuSkRLLCAKPiA+
ID4gQmxlbmRlciwgRG9sZmluLCBRdDYpOiAgIAo+ID4gPiAKPiA+ID4gQXNzZW1ibGVyIG1lc3Nh
Z2VzOgo+ID4gPiB7c3RhbmRhcmQgaW5wdXR9OjI4NDU4ODogRXJyb3I6IHVua25vd24gcHNldWRv
LW9wOiBgLnVsZWIxJwo+ID4gPiB7c3RhbmRhcmQgaW5wdXR9OjI4NDU4ODogRXJyb3I6IHVucmVj
b2duaXplZCBvcGNvZGUgYMO/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w792
bDg3NCcKPiA+ID4gCj4gPiA+IFRoZSBicm9rZW4gY2hhcnMgYXJlIDB4ZmYgYW5kIGl0IHNlZW1z
IHRoZXJlIGFyZSBhbHdheXMgMjQwIChidXQgd2l0aCAKPiA+ID4gcG9vciBzdGF0aXN0aWNzKS4g
U29tZXRpbWVzIGl0IGluc3RlYWQgY2F1c2VzIGEgR0NDIElDRSBpbnN0ZWFkLgo+ID4gCj4gPiBJ
IGhhdmUgaWRlbnRpZmllZCB0aGF0IHRoZSAweGZmIGNvbWVzIGZyb20gdGhlIHBvaXNvbmluZyBk
b25lIGZvciB2MCBpbgo+ID4gX19yaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKCksIHdoaWNoIHNob3Vs
ZCBvbmx5IGhhcHBlbiBmb3IgYSBzeXNjYWxsLiAKPiA+IEluZGVlZCBjaGFuZ2luZyB0aGUgdmFs
dWUgdG8gZGlmZmVyZW50IG9uZXMgcHJvcGFnYXRlcyB0byB0aGUgYWJvdmUgCj4gPiBlcnJvciBt
ZXNzYWdlLgo+ID4gCj4gPiBGdXJ0aGVybW9yZSBJIGhhdmUgZm91bmQgdGhhdCBjaGFuZ2luZyBD
T05GSUdfUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRSAKPiA+IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5n
LCBhbmQgdGhhdCBjaGFuZ2luZyBSSVNDVl9JU0FfVl9VQ09QWV9USFJFU0hPTEQgCj4gPiBjaGFu
Z2VzIHRoZSBudW1iZXIgb2YgYnJva2VuIGJ5dGVzLgo+IAo+IFRoZSB2YWx1ZXMgZnJvbSBfX3Jp
c2N2X3ZfdnN0YXRlX2Rpc2NhcmQoKSBlbmQtdXAgdGhlcmUgYmVjYXVzZSB0aGV5IGFyZSAKPiB0
aGUgbGFzdCB2YWx1ZXMgd3JpdHRlbiB0byB0aGUgdmVjdG9yIHJlZ2lzdGVycy4gSSBoYXZlIGFk
ZGVkIHNvbWUgCj4gcG9pc29uaW5nIGluIF9fYXNtX3ZlY3Rvcl91c2VyY29weV9zdW1fZW5hYmxl
ZCBiZWZvcmUgdGhlIGxvb3AsIGFuZCAKPiB0aG9zZSB2YWx1ZXMgYXBwZWFyIGluc3RlYWQuIFVz
aW5nIGRpZmZlcmVudCB2YWx1ZXMgcGVyIHZlY3RvciByZWdpc3RlciwgCj4gSSBoYXZlIGZvdW5k
IHRoYXQgdGhlIGNvcnJ1cHRpb24gY29tZXMgZnJvbSBhIHBhcnRpYWwgbG9hZCBvZiB0aGUgdmxl
OC52IAo+IGluc3RydWN0aW9uLCB3aGlsZSB0aGUgcmVzdWx0IG9mIHRoZSBwb2lzb25pbmcgYW5k
IHRoZSBwYXJ0aWFsIGxvYWQgYXJlCj4gdGhlbiBib3RoIHdyaXR0ZW4gYnkgdGhlIHZzZTgudjoK
PiAKPiAgbG9vcDoKPiAgICAgICAgIHZzZXR2bGkgaVZMLCBpTnVtLCBlOCwgRUxFTV9MTVVMX1NF
VFRJTkcsIHRhLCBtYQo+ICAgICAgICAgZml4dXAgdmxlOC52IHZEYXRhLCAocFNyYyksIDEwZgo+
ICAgICAgICAgc3ViIGlOdW0sIGlOdW0sIGlWTAo+ICAgICAgICAgYWRkIHBTcmMsIHBTcmMsIGlW
TAo+ICAgICAgICAgZml4dXAgdnNlOC52IHZEYXRhLCAocERzdCksIDExZgo+ICAgICAgICAgYWRk
IHBEc3QsIHBEc3QsIGlWTAo+ICAgICAgICAgYm5leiBpTnVtLCBsb29wCgpJIGhhdmUgaW5zdHJ1
bWVudGVkIHRoYXQgY29kZSwgYmFzaWNhbGx5IGFkZGluZyBhIGZ1bmN0aW9uIHRvIGNoZWNrIHRo
ZSAKY29weSBhZnRlcndhcmRzIChvbmx5IHVzaW5nIHNjYWxhciBpbnN0cnVjdGlvbnMpLCBhbmQg
cmVwb3J0IHZhbHVlcyBpbiAKY2FzZSBvZiBlcnJvcnMuIFNvIGZhciBJIGhhdmUgYmVlbiBhYmxl
IHRvIGNhdGNoIHRoZSBpc3N1ZSA0IHRpbWVzIHRoYXQgCndheSAoaW5jbHVkaW5nIG9uZSB3aGVy
ZSBJIGhhdmVuJ3Qgc2VlbiBhbnkgdmlzaWJsZSBjb25zZXF1ZW5jZSBvbiB0aGUgCnVzZXJsYW5k
KS4gCgpUaGlzIGlzIHdoYXQgSSBvYnNlcnZlZDoKLSBUaGUgaXNzdWUgYWx3YXlzIGhhcHBlbnMg
Zm9yIHRoZSBmaXJzdCBieXRlcyBvZiB0aGUgdXNlciBjb3B5LCB3aGljaCAKICBpbiBhbGwgY2Fz
ZXMgd2VyZSBzdXBwb3NlZCB0byBiZSB1cCB0byA0MDk2IGJ5dGVzIGxvbmcuCi0gT24gdGhlIGZp
cnN0IGl0ZXJhdGlvbiBvZiB0aGUgbG9vcCBvbmx5IHRoZSBmaXJzdCAxNiBieXRlcyBhcmUgbG9h
ZGVkIAogIGJ5IHRoZSB2bGU4LnYgaW5zdHJ1Y3Rpb24gYnV0IHRoZSBmdWxsIDI1NiBieXRlcyBh
cmUgd3JpdHRlbiB0byB0aGUgCiAgZGVzdGluYXRpb24gYnkgdGhlIHZzZTgudiBpbnN0cnV0aW9u
LgotIE9uIHRoZSBzZWNvbmQgaXRlcmF0aW9uIG9mIHRoZSBsb29wLCB0aGUgdmxlOC52IGNhdXNl
cyBhIHRyYXAsIHdoaWNoIAogIGVuZHMgdXAgaW4gdGhlIDEwZiBmaXh1cC4gQXQgZml4dXAgbGV2
ZWwsIHZsPTB4MTAwLCB2bGVuYj0weDIwLCAKICB2c3RhcnQ9MHgwIGFuZCB2dHlwZT0weGMzLgot
IENvbnNpZGVyaW5nIHRoZSAyIGZpcnN0IGl0ZXJhdGlvbnMgb2YgdGhlIGxvb3AgKGkuZS4gNTEy
IGJ5dGVzKSwgCiAgbmVpdGhlciB0aGUgc291cmNlIG5vciBkZXN0aW5hdGlvbiBhZGRyZXNzZXMg
Y3Jvc3MgYSBwYWdlLgoKQWxsIHRoYXQgc2FpZCwgaXQgaXMgd2hhdCBJIGNhbiAqb2JzZXJ2ZSou
IEkgaGF2ZSBubyBpZGVhIGlmIHRoZSBmaXJzdCAKaXRlcmF0aW9uIG9mIHRoZSBsb29wIGFsc28g
Z29lcyB0aHJvdWdoIGZpeHVwIG9yIG5vdC4gQWxzbyBpbiBhZGRpdGlvbiAKdG8gcHJlY2lzZSB0
cmFwcyAod2hpY2ggZGVmaW5pdGVseSBoYXBwZW4gZm9yIHRoZSBzZWNvbmQgaXRlcmF0aW9uKSwg
SVJRIApjb3VsZCBoYXBwZW4gYXQgYW55IG1vbWVudC4gSSB1c2UgQ09ORklHX1JJU0NWX0lTQV9W
X1BSRUVNUFRJVkU9biBmb3IgbXkgCnRlc3QsIGluIG9yZGVyIHRvIGxpbWl0IHRoZSBjb2RlIHBh
dGhzIHRvIHJldmlldywgc28gZHVyaW5nIHRoYXQgY29weSAKcHJlZW1wdCBpcyBkaXNhYmxlZCwg
YnV0IElSUSBpcyBub3QuCgpSZWdhcmRzCkF1cmVsaWVuCgotLSAKQXVyZWxpZW4gSmFybm8gICAg
ICAgICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIKYXVyZWxpZW5AYXVyZWwz
Mi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
