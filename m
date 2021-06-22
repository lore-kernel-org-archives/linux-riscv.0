Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A82AC48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 00:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED45C60FE6
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 00:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED45C60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7OPA16D4ZnECR3lFT5RRFTaejdhdUMKXdifHFtMAMI=; b=lnFMifilnQyz4TGW4HMQl3Fsci
	/ocoLvBT7jea9tI5F9NguTcU2TqDQU0V+8SuugfhOqtUwGO8quXpVEbWqWiWd3TdiectQVFZZ2uBT
	8wl/gTjNDsN2DA9xQ8MgGzCY3p87OUboBMB65BA5mY5BzY1sdTBjbwQ6wwp1MYfmLGvOLjR9omD8v
	I0KB+CBCMVTMWqtiQRdSszlLoCeJV8laiTBJUOwwRF+K3EsIh1OUikogu2xFBckqmko3+LEdixNxA
	HXKc3VtKTRkX9aVQ7wGS9nbpRguS6dusucaePNxTc/ZTRDU+N/odQwxAXHH8CH06mpI3JQOg/LmHV
	91WhgA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvU4X-005CMj-Ad; Tue, 22 Jun 2021 00:15:21 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvU4U-005CLk-0P
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 00:15:19 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15M0F5kb034279
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 03:15:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1624320900; x=1626912900;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GN1BQE4IVzgLNDLmDfQi5g0v7raY1rltDK6TrpB/hoI=;
 b=T/ZTBp8WMcCd45upwLsTymuB+aLQ+c12zHFJBTI35VhEPx+IZF8cU592K5Q6lU4y
 JOEh36S04/Chc1i9W+rCJzgjW2dkmuohksu3wVfH0g7i+mtQ8e3gMwjR3GkNMKJ2
 Sr7XfzXapO8TZwkXXOjsIYW0Tds4NDG5ocRrSud864F3ELbgLQF/cmw1EmHPYOUx
 wY5tF8CuGXsh1c/TxCH9e7jMT2TPuRbAsyCsIqMc1OKuPU60ieyd4zrqplRjTuc2
 PhV/DsLutYjbogmLeTCzaupUPtqvQ+tef5ExK0zl/ZR9PiKHTwHoYJJYz+ub3ezh
 dZsUgSOjZ/1ELNBSGrYWsA==;
X-AuditID: 8b5b014d-962f1700000067b6-93-60d12b833daa
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 45.10.26550.38B21D06; Tue, 22 Jun 2021 03:14:59 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 03:14:59 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
Organization: FORTH
In-Reply-To: <20210617152754.17960-2-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
Message-ID: <87f2cf0e98c5c5560cfb591b4f4b29c8@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsXSHT1dWbdZ+2KCwaXdNhbb3l1lsdj6exa7
 xaIV31kspvbEW+xYupnJ4t6KZewWL/Y2slg8WTOT0aJj11cWi8u75rBZbPvcwmZx8dd8RouX
 l3uYLdpm8TvwefTPnsLm8e73MkaPNy9fsngc7vjC7tHR94/FY+esu+wem1Z1snn82n6UyWPz
 knqPS83X2T0+b5LzaD/QzRTAE8Vlk5Kak1mWWqRvl8CVce/OR/aCC7IVG2beY25gPC7WxcjJ
 ISFgInHi8DXGLkYuDiGBo4wSze/2MEIkTCVm7+0Es3kFBCVOznzCAmIzC1hITL2ynxHClpdo
 3jqbGcRmEVCVODn1PVgNm4CmxPxLB8FsEQFdiYsfDrODLGAWmM4i8at3NxtIQljAWOL8pUaw
 QfwCwhKf7l5kBbE5BRwkNrRvYwexhQRKJS5+/soKcYSLxJLLr6GOU5H48PsBUA0HhyiQvXmu
 0gRGwVlITp2F5NRZSE5dwMi8ilEgscxYLzO5WC8tv6gkQy+9aBMjOPIYfXcw3t78Vu8QIxMH
 4yFGCQ5mJRHemykXEoR4UxIrq1KL8uOLSnNSiw8xSnOwKInz8upNiBcSSE8sSc1OTS1ILYLJ
 MnFwSjUwyb0KStn05UR79cQfi5kXWjprbTyxRzpm8vebs07Xn+SUVDF8XH3epObHf73YLWnT
 4jnNi49fubJ0Xg43/8xmba4TftdXbFDTWlu854PTTpaXm8QsJ1noy7NMVD41pT7VMCwpfU7e
 nceTXq6RyfrxOeroD5WzGeeCZz+a315Z9yLo0bEVnOeqtdntfu2rZ44pSfRJCf2x5cLK5rsH
 t0+fmxnl4K8dk5mk2jvH3PFJjquF/i1Of/1a3gVPzirfVzfQqJ1j4Wg49WL0rUtl/Ddkg/yk
 d7J5sxxfqFe+N3j9m4121r45PLJHH9kuvJjwVu/CG0POG0d/Kc5u3BqzXKLu7pO5Oybq3W76
 zshtkjmhQomlOCPRUIu5qDgRAN1SIgwrAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_171518_483146_5FB59626 
X-CRM114-Status: GOOD (  23.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWF0dGVvIGFuZCB0aGFua3MgZm9yIHRoZSBwYXRjaCwKCs6jz4TOuc+CIDIwMjEtMDYt
MTcgMTg6MjcsIE1hdHRlbyBDcm9jZSDOrc6zz4HOsc+IzrU6Cj4gCj4gQEAgLTAsMCArMSw5MSBA
QAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAq
IFN0cmluZyBmdW5jdGlvbnMgb3B0aW1pemVkIGZvciBoYXJkd2FyZSB3aGljaCBkb2Vzbid0Cj4g
KyAqIGhhbmRsZSB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzIGVmZmljaWVudGx5Lgo+ICsgKgo+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgTWF0dGVvIENyb2NlCj4gKyAqLwo+ICsKPiArI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArCj4gKy8q
IE1pbmltdW0gc2l6ZSBmb3IgYSB3b3JkIGNvcHkgdG8gYmUgY29udmVuaWVudCAqLwo+ICsjZGVm
aW5lIE1JTl9USFJFU0hPTEQgKEJJVFNfUEVSX0xPTkcgLyA4ICogMikKPiArCj4gKy8qIGNvbnZl
bmllbmNlIHVuaW9uIHRvIGF2b2lkIGNhc3QgYmV0d2VlbiBkaWZmZXJlbnQgcG9pbnRlciB0eXBl
cyAqLwo+ICt1bmlvbiB0eXBlcyB7Cj4gKwl1OCAqdTg7CgpZb3UgYXJlIHVzaW5nIGEgdHlwZSBh
cyBhIG5hbWUsIEknZCBnbyB3aXRoIGFzX2J5dGVzL2FzX3Vsb25nL2FzX3VwdHIgCndoaWNoIG1h
a2VzIGl0IGVhc2llciBmb3IgdGhlIHJlYWRlciB0byB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSB0
cnlpbmcgCnRvIGRvLgoKPiArCXVuc2lnbmVkIGxvbmcgKnVsb25nOwo+ICsJdWludHB0cl90IHVw
dHI7Cj4gK307Cj4gKwo+ICt1bmlvbiBjb25zdF90eXBlcyB7Cj4gKwljb25zdCB1OCAqdTg7Cj4g
Kwl1bnNpZ25lZCBsb25nICp1bG9uZzsKPiArfTsKPiArCgpJIHN1Z2dlc3QgeW91IGRlZmluZSB0
aG9zZSB1bmlvbnMgaW5zaWRlIHRoZSBmdW5jdGlvbiBib2R5LCBubyBvbmUgZWxzZSAKaXMgdXNp
bmcgdGhlbS4KCj4gK3ZvaWQgKl9fbWVtY3B5KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywg
c2l6ZV90IGNvdW50KQo+ICt7Cj4gKwljb25zdCBpbnQgYnl0ZXNfbG9uZyA9IEJJVFNfUEVSX0xP
TkcgLyA4Owo+ICsjaWZuZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
Cj4gKwljb25zdCBpbnQgbWFzayA9IGJ5dGVzX2xvbmcgLSAxOwo+ICsJY29uc3QgaW50IGRpc3Rh
bmNlID0gKHNyYyAtIGRlc3QpICYgbWFzazsKCldoeSBub3QgdW5zaWduZWQgaW50cyA/Cgo+ICsj
ZW5kaWYKPiArCXVuaW9uIGNvbnN0X3R5cGVzIHMgPSB7IC51OCA9IHNyYyB9Owo+ICsJdW5pb24g
dHlwZXMgZCA9IHsgLnU4ID0gZGVzdCB9Owo+ICsKPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJ
Q0lFTlRfVU5BTElHTkVEX0FDQ0VTUwoKSWYgeW91IHdhbnQgdG8gYmUgY29tcGxpYW50IHdpdGgg
bWVtY3B5IHlvdSBzaG91bGQgY2hlY2sgZm9yIG92ZXJsYXBwaW5nIApyZWdpb25zIGhlcmUgc2lu
Y2UgIlRoZSBtZW1vcnkgYXJlYXMgbXVzdCBub3Qgb3ZlcmxhcCIsIGFuZCBkbyBub3RoaW5nIAph
Ym91dCBpdCBiZWNhdXNlIGFjY29yZGluZyB0byBQT1NJWCB0aGlzIGxlYWRzIHRvIHVuZGVmaW5l
ZCBiZWhhdmlvci4gClRoYXQncyB3aHkgcmVjZW50IGxpYmMgaW1wbGVtZW50YXRpb25zIHVzZSBt
ZW1tb3ZlIGluIGFueSBjYXNlIChtZW1jcHkgCmlzIGFuIGFsaWFzIHRvIG1lbW1vdmUpLCB3aGlj
aCBpcyB0aGUgc3VnZ2VzdGVkIGFwcHJvYWNoLgoKPiArCWlmIChjb3VudCA8IE1JTl9USFJFU0hP
TEQpCj4gKwkJZ290byBjb3B5X3JlbWFpbmRlcjsKPiArCj4gKwkvKiBjb3B5IGEgYnl0ZSBhdCB0
aW1lIHVudGlsIGRlc3RpbmF0aW9uIGlzIGFsaWduZWQgKi8KPiArCWZvciAoOyBjb3VudCAmJiBk
LnVwdHIgJiBtYXNrOyBjb3VudC0tKQo+ICsJCSpkLnU4KysgPSAqcy51OCsrOwo+ICsKCllvdSBz
aG91bGQgY2hlY2sgZm9yICFJU19FTkFCTEVEKENPTkZJR19DUFVfQklHX0VORElBTikgaGVyZS4K
Cj4gKwlpZiAoZGlzdGFuY2UpIHsKPiArCQl1bnNpZ25lZCBsb25nIGxhc3QsIG5leHQ7Cj4gKwo+
ICsJCS8qIG1vdmUgcyBiYWNrd2FyZCB0byB0aGUgcHJldmlvdXMgYWxpZ25tZW50IGJvdW5kYXJ5
ICovCj4gKwkJcy51OCAtPSBkaXN0YW5jZTsKCkl0J2QgaGVscCBoZXJlIHRvIGV4cGxhaW4gdGhh
dCBzaW5jZSBzIGlzIGRpc3RhbmNlIGJ5dGVzIGFoZWFkIHJlbGF0aXZlIAp0byBkLCBhbmQgZCBy
ZWFjaGVkIHRoZSBhbGlnbm1lbnQgYm91bmRhcnkgYWJvdmUsIHMgaXMgbm93IGFsaWduZWQgYnV0
IAp0aGUgZGF0YSBuZWVkcyB0byBiZSBzaGlmdGVkIHRvIGNvbXBlbnNhdGUgZm9yIGRpc3RhbmNl
LCBpbiBvcmRlciB0byBkbyAKd29yZC1ieS13b3JkIGNvcHkuCgo+ICsKPiArCQkvKiAzMi82NCBi
aXQgd2lkZSBjb3B5IGZyb20gcyB0byBkLgo+ICsJCSAqIGQgaXMgYWxpZ25lZCBub3cgYnV0IHMg
aXMgbm90LCBzbyByZWFkIHMgYWxpZ25tZW50IHdpc2UsCj4gKwkJICogYW5kIGRvIHByb3BlciBz
aGlmdCB0byBnZXQgdGhlIHJpZ2h0IHZhbHVlLgo+ICsJCSAqIFdvcmtzIG9ubHkgb24gTGl0dGxl
IEVuZGlhbiBtYWNoaW5lcy4KPiArCQkgKi8KClRoaXMgY29tbWVuZCBpcyBtaXNsZWFkaW5nIGJl
Y2F1c2UgcyBpcyBhbGlnbmVkIG9yIGVsc2Ugcy51bG9uZ1swXS9bMV0gCmJlbG93IHdvdWxkIHJl
c3VsdCBhbiB1bmFsaWduZWQgYWNjZXNzLgoKPiArCQlmb3IgKG5leHQgPSBzLnVsb25nWzBdOyBj
b3VudCA+PSBieXRlc19sb25nICsgbWFzazsgY291bnQgLT0gCj4gYnl0ZXNfbG9uZykgewo+ICsJ
CQlsYXN0ID0gbmV4dDsKPiArCQkJbmV4dCA9IHMudWxvbmdbMV07Cj4gKwo+ICsJCQlkLnVsb25n
WzBdID0gbGFzdCA+PiAoZGlzdGFuY2UgKiA4KSB8Cj4gKwkJCQkgICAgIG5leHQgPDwgKChieXRl
c19sb25nIC0gZGlzdGFuY2UpICogOCk7Cj4gKwo+ICsJCQlkLnVsb25nKys7Cj4gKwkJCXMudWxv
bmcrKzsKPiArCQl9Cj4gKwo+ICsJCS8qIHJlc3RvcmUgcyB3aXRoIHRoZSBvcmlnaW5hbCBvZmZz
ZXQgKi8KPiArCQlzLnU4ICs9IGRpc3RhbmNlOwo+ICsJfSBlbHNlCj4gKyNlbmRpZgo+ICsJewo+
ICsJCS8qIGlmIHRoZSBzb3VyY2UgYW5kIGRlc3QgbG93ZXIgYml0cyBhcmUgdGhlIHNhbWUsIGRv
IGEgc2ltcGxlCj4gKwkJICogMzIvNjQgYml0IHdpZGUgY29weS4KPiArCQkgKi8KCkEgd2hpbGUo
KSBsb29wIHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBoZXJlLgoKPiArCQlmb3IgKDsgY291bnQgPj0g
Ynl0ZXNfbG9uZzsgY291bnQgLT0gYnl0ZXNfbG9uZykKPiArCQkJKmQudWxvbmcrKyA9ICpzLnVs
b25nKys7Cj4gKwl9Cj4gKwo+ICsJLyogc3VwcHJlc3Mgd2FybmluZyB3aGVuIENPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkgKi8KPiArCWdvdG8gY29weV9yZW1haW5kZXI7
Cj4gKwo+ICtjb3B5X3JlbWFpbmRlcjoKPiArCXdoaWxlIChjb3VudC0tKQo+ICsJCSpkLnU4Kysg
PSAqcy51OCsrOwo+ICsKPiArCXJldHVybiBkZXN0Owo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woX19t
ZW1jcHkpOwo+ICsKPiArdm9pZCAqbWVtY3B5KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywg
c2l6ZV90IGNvdW50KSBfX3dlYWsKPiBfX2FsaWFzKF9fbWVtY3B5KTsKPiArRVhQT1JUX1NZTUJP
TChtZW1jcHkpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
