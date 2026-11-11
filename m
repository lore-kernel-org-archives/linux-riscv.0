Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9F606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJFeG+1N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcpl0JmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=APllL9czfTeKJwxnE9h+68shUjqfTfaV4KnVHF37h7A=; b=FJFeG+1NcUKnXqD33HF1TmgsYe
	nmq5Bh8jOC3JmAYa+eiXltURSyDlkZ7460ymdikDEFEDSwFyRtczc7UBgT0RSY5TJDXD0pfyAm6it
	X0nqUpofheBZ/8nNoDQeAWUyTFEcsp9XhrkZl6gLMxtzne8mLy8pyCIiZP5Z825EnX7YLqXLDiKO7
	/yIdDRMkGW/mPmTRv1QY6eG3ngI9bE87oi2SQ+e3K2npGKkG9cAu63/Y0Bea6S7Eyh7HCrvZFeRcX
	6sxG4q2EVV0QwbcwOX2MnHalRQH4XRnJg3H0m8jTr2+o92gJ/iL83/jM+gkYPk3sEYPWWF1RxQJyy
	vfB/0O7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCE6-00000007JcW-2aNq;
	Wed, 11 Nov 2026 17:35:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCE5-00000007Jc9-2DiC
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 17:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B442B6356B;
	Wed, 11 Nov 2026 17:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056771F00A09;
	Wed, 11 Nov 2026 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418512;
	bh=t2tMbMlMUgA0x3ONKcoOJiyALI2CAjBxMqrWxQvzdZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lcpl0JmNfi0hGiZdgHhI35YjoBPYwQfagsfOk06DSWRnOS6tAZ29Dekzd6uOu/fGA
	 7x55jW/tGA9b3NDlb7uX52rBf9t5Kb8Bjd3grfD09Tp5l5aIGRcSMRl3tpH1iRrlCZ
	 p+EB1cv+fNBUPGf0VNQxfPTsLsB/8N5dWDk+zeRcnzywiXAgLxo+4kI4s8XSN6bTW2
	 VqbMaWv8frsAxHReEMxc+OLUK/vKwOwcNC7ElT+4TWOiwP6PZM7I//1QjiIezVjnva
	 DRo6TwdDx/8jk/YZPiN1f8eZB5KJ8u0+fpVzNY6w2QQdF4m5DCNHuzNBJvSBrd1ZUr
	 BxMcstaEjcWeg==
Date: Wed, 11 Nov 2026 18:35:06 +0100
From: Thorsten Blum <blum@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
Message-ID: <avSnSvPLqdkGWWYF@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
 <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
 <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
 <aruH26spDeM8O9dh@kernel.org>
 <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGF1bCwKCk9uIFRodSwgT2N0IDAxLCAyMDI2IGF0IDEwOjQ1OjExQU0gLTA2MDAsIFBhdWwg
V2FsbXNsZXkgd3JvdGU6Cj4gT24gVHVlLCAyOSBTZXAgMjAyNiwgVGhvcnN0ZW4gQmx1bSB3cm90
ZToKPiAKPiA+IE9uIFR1ZSwgU2VwIDI5LCAyMDI2IGF0IDExOjExOjU1QU0gKzAyMDAsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gSGkgUGF1bCwgVGhvcnN0ZW4sCj4gPiA+IAo+ID4g
PiBPbiBTYXQsIDI2IFNlcHQgMjAyNiBhdCAwMTo0OCwgUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMjQgU2VwIDIwMjYsIFRob3JzdGVuIEJsdW0g
d3JvdGU6Cj4gPiA+ID4gPiBSZXBsYWNlIGhhcmQtY29kZWQgc3RyaW5ncyB3aXRoIHRoZSBzdHJf
c3VwcG9ydGVkX3Vuc3VwcG9ydGVkKCkgaGVscGVyLgo+ID4gPiA+ID4gVGhpcyB1bmlmaWVzIHRo
ZSBvdXRwdXQgYW5kIGhlbHBzIHRoZSBsaW5rZXIgd2l0aCBkZWR1cGxpY2F0aW9uLCB3aGljaAo+
ID4gPiA+ID4gY2FuIHJlc3VsdCBpbiBhIHNtYWxsZXIgYmluYXJ5Lgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPGJsdW1Aa2VybmVsLm9yZz4KPiA+ID4g
Pgo+ID4gPiA+IFRoYW5rcywgcXVldWVkIGZvciB2Ny40Lgo+ID4gPiAKPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGEwNjc3NjU2NWI5ZTczNTEgKCJyaXNj
djoKPiA+ID4gcHJvY2VzczogVXNlIHN0cl9zdXBwb3J0ZWRfdW5zdXBwb3J0ZWQoKSBpbiBjb21w
YXRfbW9kZV9kZXRlY3QoKSIpCj4gPiA+IGluIHJpc2N2L2Zvci1uZXh0Lgo+ID4gPiAKPiA+ID4g
VGhpcyBmYWlscyB0byBidWlsZDoKPiA+ID4gCj4gPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmM6IEluIGZ1bmN0aW9uIOKAmGNvbXBhdF9tb2RlX2RldGVjdOKAmToKPiA+ID4gICAg
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYzoxMzg6MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZgo+ID4gPiBmdW5jdGlvbiDigJhzdHJfc3VwcG9ydGVkX3Vuc3VwcG9ydGVk4oCZ
Cj4gPiA+IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gPiAgICAg
ICAxMzggfCAgICAgICAgICAgICAgICAgc3RyX3N1cHBvcnRlZF91bnN1cHBvcnRlZChjb21wYXRf
bW9kZV9zdXBwb3J0ZWQpKTsKPiA+ID4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+ID4gCj4gPiA+IGFzIGl0IGhhcyBhIGhhcmQgZGVwZW5k
ZW5jeSBvbiBjb21taXQgNTM4M2NmMjgwZWY0ZjAwYgo+ID4gPiAoImxpYi9zdHJpbmdfY2hvaWNl
czogQWRkIHN0cl9zdXBwb3J0ZWRfdW5zdXBwb3J0ZWQoKQo+ID4gPiBoZWxwZXIiKSwgd2hpY2gg
aXMgb25seSBwcmVzZW50IGluIHRoZSBmb3ItbmV4dCBicmFuY2ggb2YKPiA+ID4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJp
dmVycy14ODYuZ2l0Lgo+ID4gCj4gPiBIaSBHZWVydCwKPiA+IAo+ID4gSXQncyBhbHNvIGluIGxp
bnV4LW5leHQ6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD01MzgzY2YyODBlZjRmMDBi
MTVmMWQ5ZTJhMjg4NmQwZDAyYzAxMThiCj4gCj4gSSdtIGRyb3BwaW5nIHRoaXMgb25lIHVudGls
IHRoZSBkZXBlbmRlbmN5IGxhbmRzIGluIG1haW5saW5lLiAgCgpEbyB5b3Ugd2FudCBtZSB0byBy
ZXNlbmQgdGhpcyBwYXRjaCBub3cgdGhhdCB0aGUgZGVwZW5kZW5jeSBbMV0gaXMgaW4KbWFpbmxp
bmUsIG9yIGNhbiB5b3UgcmUtYXBwbHkgdGhpcyBvbmU/CgpUaGFua3MsClRob3JzdGVuCgpbMV0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aWQ9Y2NkNWZmNDEwZmViMmFkY2YzODQwZDA3MWNmNzk2Y2M1YzU0
OTUyMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
