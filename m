Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AF7CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ12Ck/IuRzB9xrcIfkp2G4rY60js90CPIcz4UvSd7U=; b=14xBJJm3yDfxuk
	oRX6laSX1n1gUv92wCcBBvPHfNeXCY0fAXv5jswDKdhkJ3Oye1PjQRGWQKVv52IpCXYVZlnt4KbsE
	VID9OemEnEVbz47oarlXp/3cJzWqTNHIy3tyCjjMyxN6xLk1Al3o9wiHvfO/NLnqQXxMTj50GnayO
	jueOkIOBwNvHGLID1RUfQl1krNyPkvW+AY35d32ziwcbZe3gr6HKs7PHkswpuHGO3JsSnM3i3QBVW
	Q1HOqAGPGjc1hZb7dgoonejxFaW+GOCOjSSfzElcHNAgzlC940r6w4sFzvkDjDa0K4by/FBTNIy3w
	sXtH5eGmeq0J7RygI1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD2x-00000008M5L-2tD3;
	Thu, 01 Oct 2026 09:25:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD2w-00000008M4t-1KWG;
	Thu, 01 Oct 2026 09:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B4876022B;
	Thu,  1 Oct 2026 09:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC6E1F000FF;
	Thu,  1 Oct 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WWTEvHs+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790846740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRiq/gc/1/v3q1z4vqQ1Z479kjp0uI+oeZqHFxoYK3k=;
	b=WWTEvHs+Glx9cwBY3B1J4eFsMVayAa8DZTePcEN0LwV8619xjbZb+A3Te+DbQ8bzZJ95Rl
	nakLPPxk3P6NpEgkw8BAvLRde47zWZGiGtwlUURKwXZEieW6g5dYOrgW3q1U+6OPmcgwQQ
	/6QP7vXzfWvWvdrBScZiV3GjkkHM4XE=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id d847d3a4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 1 Oct 2026 09:25:39 +0000 (UTC)
Date: Thu, 1 Oct 2026 11:25:35 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <ar4nD8aRH7wEvTMt@zx2c4.com>
References: <areYMjNcaqe86ds4@zx2c4.com>
 <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
 <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162>
 <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
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

T24gVGh1LCBPY3QgMDEsIDIwMjYgYXQgMDY6NDE6MjBBTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSAoQ1MgR1JPVVApIHdyb3RlOgo+IEhpLAo+IAo+IExlIDMwLzA5LzIwMjYgw6AgMTc6MTYsIEph
c29uIEEuIERvbmVuZmVsZCBhIMOpY3JpdMKgOgo+ID4gT24gV2VkLCBTZXAgMzAsIDIwMjYgYXQg
NToxM+KAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4KPiA+PiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCAwNDo0NDoyOVBNICswMjAwLCBKYXNvbiBB
LiBEb25lbmZlbGQgd3JvdGU6Cj4gPj4+IE5hdGhhbiwgd291bGQgdGhpcyBiZSBva2F5IHdpdGgg
eW91Pwo+ID4+PiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZnaXQuengyYzQuY29tJTJGbGludXgtcm5nJTJGY29tbWl0JTJG
JTNGaWQlM0RkMjE2NzAxNzI0YjdkODIwOWZmNDIxNTA2NThhZDVjNzEyYmRiNTAzJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3kyJTQwY3Mtc29wcmFzdGVyaWEuY29tJTdDOGY2OTkzNWJm
ZmIzNDRiZjBkZGMwOGRmMWYwNWUzNTglN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJi
NSU3QzAlN0MwJTdDNjM5MjYzNzgyMzI0MDgwODM3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJ
c0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT1CQTdG
eXIwJTJGeW5nZ3ZCblIlMkZwaUN2TkNRSHROQmFncXZTYjBpMTFBdm9MVSUzRCZyZXNlcnZlZD0w
Cj4gPj4KPiA+PiBDYW4geW91IHN0aWNrCj4gPj4KPiA+PiAgICBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZyAjIHY2LjEyKwo+ID4+ICAgIENsb3NlczogaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRkNs
YW5nQnVpbHRMaW51eCUyRmxpbnV4JTJGaXNzdWVzJTJGMjE4MyZkYXRhPTA1JTdDMDIlN0NjaHJp
c3RvcGhlLmxlcm95MiU0MGNzLXNvcHJhc3RlcmlhLmNvbSU3QzhmNjk5MzViZmZiMzQ0YmYwZGRj
MDhkZjFmMDVlMzU4JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3
QzYzOTI2Mzc4MjMyNDExMDY3OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhj
R2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRX
RnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9NkM4JTJGQUVRb2glMkI4
cGZnZllRa0w3cWY1VWUlMkY1c0FHdGZxUnB0enNTRzBDTSUzRCZyZXNlcnZlZD0wCj4gPj4KPiA+
PiBvbiB0aGF0PyBPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8gbWUsIHRoYXQncyBiYXNpY2FsbHkg
d2hhdCBJIGhhZCBmb3IgbXkKPiA+PiB2MyBsb2NhbGx5Lgo+ID4gCj4gPiBTdXJlLCBkb25lLiBB
bHNvIHJlbW92ZWQgdGhlIG5vdy11bnVzZWQgYXJyYXlfc2l6ZS5oIGluY2x1ZGUuCj4gCj4gSSdt
IHN0aWxsIHZlcnkgc2NlcHRpYyB3aXRoIHRoaXMgcGF0Y2guIFlvdSBhcmUgZGVncmFkaW5nIHRo
ZSBiZWhhdmlvdXIgCj4gd2l0aCBHQ0MgZm9yIGEgcHJvYmxlbSB3aXRoIENMQU5HLiBXaHkgPwo+
IAo+IEJlZm9yZSB0aGUgcGF0Y2gsIHdpdGggYm90aCBHQ0MgMTMgYW5kIEdDQyAxNiBvbiBwb3dl
cnBjMzIgSSBnZXQgYSAKPiBwcmV0dHkgc3RhbmRhcmQgb3B0aW1pc2VkIGxvb3AgdGhhdCBjbGVh
cnMgd29yZHMgNCBieSA0ICh3aXRoIGF1dG8gCj4gaW5jcmVtZW50IG9mIHBvaW50ZXIpIHdoaWNo
IGlzIHRoZSBtb3N0IG9wdGltYWwgb24gcG93ZXJwYzoKPiAKPiAgIDNmMDoJMzkgMDAgMDAgMGMg
CWxpICAgICAgcjgsMTIKPiAgIDNmNDoJMzUgMDggZmYgZmMgCWFkZGljLiAgcjgscjgsLTQKPiAg
IDNmODoJOTEgNDkgMDAgMDQgCXN0dyAgICAgcjEwLDQocjkpCj4gICAzZmM6CTkxIDQ5IDAwIDA4
IAlzdHcgICAgIHIxMCw4KHI5KQo+ICAgNDAwOgk5MSA0OSAwMCAwYyAJc3R3ICAgICByMTAsMTIo
cjkpCj4gICA0MDQ6CTk1IDQ5IDAwIDEwIAlzdHd1ICAgIHIxMCwxNihyOSkKPiAgIDQwODoJNDAg
ODIgZmYgZWMgCWJuZSAgICAgM2Y0IDxfX2Nfa2VybmVsX2dldHJhbmRvbSsweDNmND4KPiAKPiBX
aXRoIHRoZSBwYXRjaCwKPiAKPiBXaXRoIEdDQyAxMyBJIGdldCBhIHZlcnkgc3Vib3B0aW1hbCBs
b29wIGNvcHlpbmcgYnl0ZXMgb25lIGJ5IG9uZQo+IAo+ICAgM2Q4OgkzOSA0MCAwMCAzNCAJbGkg
ICAgICByMTAsNTIKPiAuLi4KPiAgIDNlNDoJMzkgMjAgMDAgMDAgCWxpICAgICAgcjksMAo+ICAg
M2U4Ogk3ZCA0OSAwMyBhNiAJbXRjdHIgICByMTAKPiAgIDNlYzoJOWQgM2UgMDAgMDEgCXN0YnUg
ICAgcjksMShyMzApCj4gICAzZjA6CTQyIDAwIGZmIGZjIAliZG56ICAgIDNlYyA8X19jX2tlcm5l
bF9nZXRyYW5kb20rMHgzZWM+Cj4gCj4gV2l0aCBHQ0MgMTYgSSBnZXQgc29tZXRoaW5nIGEgYml0
IGJldHRlciBidXQgbm90IGFzIGdvb2QgYXMgYmVmb3JlLCBpdCAKPiBpcyBhIGxvb3AgY2xlYXJp
bmcgd29yZHMgb25seSBvbmUgYnkgb25lIGFuZCBpbmNyZW1lbnRpbmcgcG9pbnRlciB3aXRoIAo+
IGFuIGFkZGl0aW9uYWwgaW5zbiBpbnN0ZWFkIG9mIHVzaW5nIGF1dG8taW5jcmVtZW50IGluc3Ry
dWN0aW9uIHN0d3UuCj4gCj4gICAzZTA6CTM5IDQwIDAwIDBkIAlsaSAgICAgIHIxMCwxMwo+IC4u
Lgo+ICAgM2YwOgk3ZCA0OSAwMyBhNiAJbXRjdHIgICByMTAKPiAgIDNmNDoJOTEgM2YgMDAgMDAg
CXN0dyAgICAgcjksMChyMzEpCj4gICAzZjg6CTNiIGZmIDAwIDA0IAlhZGRpICAgIHIzMSxyMzEs
NAo+ICAgM2ZjOgk0MiAwMCBmZiBmOCAJYmRueiAgICAzZjQgPF9fY19rZXJuZWxfZ2V0cmFuZG9t
KzB4M2Y0Pgo+IAo+IFBsZWFzZSByZXN0cmljdCB0aGUgcGF0Y2ggdG8gY2xhbmcgYnVpbGRzLgoK
RGFybi4gWWVhLiBUaGUgbmFpdmUgbWVtc2V0IGtpbGxzIG9wdGltaXphdGlvbnMuCgpPa2F5LCBu
ZXcgc3RyYXRlZ3k6CgotIG9uIGNsYW5nLCBwYXNzIGAtbWxsdm0gLW1heC1zdG9yZS1tZW1zZXQ9
NDI5NDk2NzI5NWAKLSBvbiBnY2MsIHBhc3MgYC1maW5saW5lLXN0cmluZ29wcz1tZW1zZXRgCgpB
bmQga2VlcCB0aGUgc2FtZSBjb2RlLiAoT3IsIGJldHRlciwgc2VlIGlmIHRob3NlIG9wdGlvbnMg
Z2VuZXJhdGUgZ29vZApjb2RlIHdpdGggYjdiYWQwODJlMTEzNjQwZmM4MTIwMGZmODY5ZTVjMmQ3
YTljMjlhMiByZXZlcnRlZDsgSSB3b3VsZApwcmVmZXIgdGhhdCBzaW1wbGVyIGluaXRpYWxpemVy
LikKCk5hdGhhbiwgZG8gdGhlc2Ugd29yaz8KCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
