Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3EC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXNbCKOS5lzw1ia/7sMMRwE05OGsIuoi5NqOuJffhrw=; b=r8FlEReWGGJIcN
	0gNPcPx72rEYdFKM/HBYPJvRC5hZuXWwBk3jogdCXbQT4SLUclNA1rPsI3YIYsMtwVgYoXvHXXCvD
	Q7mwxrsWqV362pGDnYe1rVYqosP3dHOaGHG/Z4Pr/ILtvC/inUgYO/Sm2GjXtT8FImaxH8uyCyMBt
	jmB4P04jCYbAevZJae775eXlvE139nv8KT8Jb1gEQ0SiaMYLmOLVrLVx4RFnsbzKiubh+HeI94i67
	25q90zOv/l++VTXo0VWi8EfNi25ZdhqCtveG1Bo82kJScNbtSPeIYa59zvKLHtvtXELBmiLz5iMi9
	+AljOc0XTsZnUGM/1Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQsa-004SMk-S8; Thu, 09 Jun 2022 22:43:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQsX-004SLE-Qv
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 22:43:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54819B8309B;
	Thu,  9 Jun 2022 22:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1212EC34115;
	Thu,  9 Jun 2022 22:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654814627;
	bh=B2cPDRdznb5RUKWTOcdRF0MpJnZCQPuRS1yF4z2JHhg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=df7uVm3wzmTDWNU00ljP0U1SLXpkda1igGQVXkjGR/VUxXtke5gaucVSJxjY+w9/Z
	 s+5WJrZ81Ftn0oQ2/E0TKNPs0kYjF4MoWjbxU2QTtNszgh/Ing/I3FjX1TXE9ERT2T
	 MEciaw/Jyvsf/qbDUbijTyNIrAbaOHocMrNRnv4EbJkYaoHgpsCu39cDEtg/MsGtvx
	 Q0rnxrztptTjIu0q+ihh7qgcqB7T5YGwqDd1MU9tq3829+MbSX0pMcMEO0JpYB+6s7
	 j4KLVFQ3ERUALPSWj0Uy+AL9FF35hUAeJe9ZMyizR9AX7j4cmQnAC2vn9Yi+AVErMl
	 eJbG6LZafv3CA==
MIME-Version: 1.0
In-Reply-To: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
References: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock drivers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com
To: Arnd Bergmann <arnd@arndb.de>, Conor.Dooley@microchip.com, Greg KH <gregkh@linuxfoundation.org>, Palmer Dabbelt <palmer@rivosinc.com>, kw@linux.com, linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, lorenzo.pieralisi@arm.com, mturquette@baylibre.com, robh@kernel.org
Date: Thu, 09 Jun 2022 15:43:45 -0700
User-Agent: alot/0.10
Message-Id: <20220609224347.1212EC34115@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_154350_070711_8B915649 
X-CRM114-Status: GOOD (  20.69  )
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

UXVvdGluZyBQYWxtZXIgRGFiYmVsdCAoMjAyMi0wNi0wMSAxODo1NTo0MCkKPiBPbiBNb24sIDIz
IE1heSAyMDIyIDEzOjAwOjAxIFBEVCAoLTA3MDApLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNv
bSB3cm90ZToKPiA+IE9uIDIzLzA1LzIwMjIgMjA6NTIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+
ID4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4+IAo+ID4+IE9uIE1vbiwg
MjMgTWF5IDIwMjIgMDQ6NDI6NTMgUERUICgtMDcwMCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAu
Y29tIHdyb3RlOgo+ID4+PiBPbiAwNS8wNS8yMDIyIDExOjU1LCBDb25vciBEb29sZXkgd3JvdGU6
Cj4gPj4+PiBIYXJkd2FyZSByYW5kb20sIFBDSSBhbmQgY2xvY2sgZHJpdmVycyBmb3IgdGhlIFBv
bGFyRmlyZSBTb0MgaGF2ZSBiZWVuCj4gPj4+PiB1cHN0cmVhbWVkIGJ1dCBhcmUgbm90IGNvdmVy
ZWQgYnkgdGhlIE1BSU5UQUlORVJTIGVudHJ5LCBzbyBhZGQgdGhlbS4KPiA+Pj4+IERhaXJlIGlz
IHRoZSBhdXRob3Igb2YgdGhlIGNsb2NrICYgUENJIGRyaXZlcnMsIHNvIGFkZCBoaW0gYXMgYQo+
ID4+Pj4gbWFpbnRhaW5lciBpbiBwbGFjZSBvZiBMZXdpcy4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4+Pgo+
ID4+PiBIZXkgUGFsbWVyLAo+ID4+PiBJIGtub3cgeW91cmUgYnVzeSBldGMgYnV0IGp1c3QgYSBy
ZW1pbmRlciA6KQo+ID4+IAo+ID4+IFNvcnJ5LCBJIGRpZG4ndCByZWFsaXplIHRoaXMgd2FzIGFp
bWVkIGF0IHRoZSBSSVNDLVYgdHJlZS7vv73vv70gSSdtIGZpbmUKPiA+PiB0YWtpbmcgaXQsIGJ1
dCBpdCBzZWVtcyBsaWtlIHRoZXNlIHNob3VsZCBoYXZlIGdvbmUgaW4gYWxvbmcgd2l0aCB0aGUK
PiA+PiBkcml2ZXJzLgo+ID4gCj4gPiBZZWFoLCBzb3JyeS4gSW4gaGluZHNpZ2h0IGl0IHNob3Vs
ZCd2ZSBidXQgdGhhdCBzaGlwIGhhcyBzYWlsZWQuIEkgc2VudAo+ID4gdGhlIHJuZyBidW5kbGVk
IHRoaXMgd2F5IGIvYyBJIGRpZG4ndCB3YW50IHRvIGVuZCB1cCBhIGNvbmZsaWN0Lgo+ID4gT2J2
LiB0aGVyZSdzIG5vdCBhIHJ1c2ggc28gSSBjYW4gYWx3YXlzIHNwbGl0IGl0IGJhY2sgb3V0IGlm
IG5lZWRzIGJlLgo+IAo+IEknbSBhZGRpbmcgYSBidW5jaCBvZiBzdWJzeXN0ZW0gbWFpbnRhaW5l
cnMganVzdCB0byBjaGVjayBhZ2Fpbi4gIEkgCj4gZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbSB3aXRo
IGl0LCBqdXN0IG5vdCByZWFsbHkgYSBSSVNDLVYgdGhpbmcgYW5kIGRvbid0IAo+IHdhbiB0byBt
YWtlIGEgbWVzcy4gIEkndmUgc3Rhc2hlZCBpdCBvdmVyIGF0IHBhbG1lci9wY3NvYy1tYWludGFp
bmVycyAKPiBmb3Igbm93Lgo+IAoKQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
