Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE19C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED1D20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bT/e3q3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r4F5Fh5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AED1D20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q4029tih4giIqifSNWZEQEwNds88B5V1V2QKvCND1T0=; b=bT/e3q3kw1EQGYONshBOQW9Qq
	BZ6E/QDiON3LmUmZAgyOIyxAo3wRP6TYK779VL1ouzn2AKScWPfwKnYnYSeiHxIfRhVgwdxwhWZ6R
	TGZCmVsxuz2dwIAjlFHs7Ssvb8Sj8lUhzOFRKMW2JKFm/+/4Oo0oLEvOxDv+YWfLbUoZ8DadZCSNT
	UtViB4you4c9m7SwJh4z2rtux3uLDsZDHYHMj5sOae9AplfZ+ZjTAz3pvdCrkM/H015zw3ZmtO0h7
	uPVI2oZbj0fMmGM8Scv+a57G4hlBuU1B6LBVly6XkuzvuTIhNxf2kRezEqn6+VcGtyKg7s+q5SIrw
	t8MOmBa+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXUx-0003AL-W7; Sat, 10 Nov 2018 17:56:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXUw-0003AC-0A
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=54313UJXPpg2Ci2a/N5nEdYwOh9b1VlCHRPie00jzJg=; b=r4F5Fh5HnE+VqDI23wqsNxM/fU
 +M2nLde/6McORR4yrd39/9rbjqL1uQIzMi4Z5AdoWaReFuT7GAHxe9pZExurXR/mmokMM08guujp0
 u0njeHqAkReO1QImnTQdYTJv5+erYnnUX8rxMhtYoWdAV91Opw54s/1jUGectC6LdcyiGsohlaQWk
 MoDhFyqfd455cKu7qRutfpFtNiWJLcMZeWCvJAdMHA2Uve6UdF7veVV9KaDMJufFYBkh/edMdUzK3
 CGvtsCFZV/DF3dnqh820fahquZsx8ln/tvfuEiKt1oFIoJd0W+JnhdYiedn3GSNYid1NgL64uxzTE
 Rer0BMCQ==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXUs-0001eb-TK
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:56:40 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAAHsvoV053282; Sat, 10 Nov 2018 19:54:59 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-ac-5be71b70ed59
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 58.CD.03682.07B17EB5; Sat, 10 Nov 2018 19:54:56 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAAHsuHU004856; Sat, 10 Nov 2018 19:54:56 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 10 Nov 2018 19:54:56 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
Message-ID: <357bd90554bff728520be2ee69d802c1@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsXSHc2orFsg/Tza4NdqNYuHPXeYLE5c+cdo
 sW3JalaLnbtfsFpsuR1j0fLhHavFohXfWSxa278xWZyesIjJYtvnFjaL028WMFksvX6RyaL5
 3Tl2i51dd1gtTl3/zGaxecICVou2WfwWmw6mWWx/0c9m8XxlL5uDiMee07OYPdbMW8PoMfX3
 GRaPnbPusnvMfPWQyWPXrkZ2j4ebLjF5bF6h5bF5Sb3HlRNNrB7vr/9m87jUfJ3dY/Ppao/2
 A91MAXxRXDYpqTmZZalF+nYJXBknr39mLTinUPHtzFqWBsbXkl2MnBwSAiYS+6euZ+5i5OIQ
 EjjMKPHm4jtGkISQwCFGiQ27lSCKTCVm7+0Ei/MKCEqcnPmEBcRmFrCQmHplPyOELS/RvHU2
 M4jNIqAqcaWzBcxmE9CUmH/pIFi9iICyxJO2S2DLmAWesEjsubOcHSQhLKAvMeXzIVYQm19A
 WOLT3YtgNqdAoMS9O2cYIa6byCzxcdoCVogrXCTWrXnHBnGdisSH3w/ABokCbXhxYjrrBEah
 WUiOnYXk2FlIjl3AyLyKUSCxzFgvM7lYLy2/qCRDL71oEyM4wuf67mA8t8D+EKMAB6MSD++P
 5U+jhVgTy4orc4Ehw8GsJMIruwUoxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfwi/AgIYH0xJLU
 7NTUgtQimCwTB6dUA2NB20nfGTwqd5T91h4p/ntY66zx68S3B/+a3f+0+NKLHO4Jzvz7jaP6
 2/V4WKRYF17/Gaz7/5uD6r3yvllnizc2eLw56NbYGmN4XcxPd9slQSs/z+TW9l/9Lxcci5U5
 aV3jFrT++oGF9qEbpv7bw3js+7yr18ONmeavffTjWiBj/gWjQK9lK34rsRRnJBpqMRcVJwIA
 pLdSTOwCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_175639_146474_F89A49D3 
X-CRM114-Status: GOOD (  30.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, olof johansson <olof.johansson@gmail.com>,
 alankao@andestech.com, abner.chang@hpe.com, atish.patra@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alexander Graf <agraf@suse.de>, zong@andestech.com, rminnich@gmail.com,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, lkcl@lkcl.net, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175456._3-659h0hh9P4Z0ITcZV09pM7rF3qonXHKTykOCJDnk@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAxOTo0MSwgT2xvZiBKb2hhbnNzb24gzq3Os8+BzrHPiM61Ogo+
IE9uIFNhdCwgTm92IDEwLCAyMDE4IGF0IDg6NDYgQU0gcm9uIG1pbm5pY2ggPHJtaW5uaWNoQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+IAo+PiBBdCBHb29nbGUgYW5kIG90aGVyIHBsYWNlcywgd2UndmUg
YmVlbiBzdHJ1Z2dsaW5nIG5vdyBmb3IgeWVhcnMgd2l0aAo+PiBvdmVybHkgY29tcGxleCBmaXJt
d2FyZSB0aGF0IGlzIGltcGxlbWVudGVkIGluY29ycmVjdGx5LCBlbmFibGluZwo+PiBleHBsb2l0
cyBhbmQgb3RoZXIgYmFkIHRoaW5ncy4gVGhlIGxpc3Qgb2YgdGhpbmdzIHZlbmRvcnMgZ2V0IHdy
b25nIGluCj4+IGZpcm13YXJlLCBib3RoIGVuYWJsaW5nIGV4cGxvaXRzIGFuZCBlbmFibGluZyBv
dGhlcnMgdG8gZW5hYmxlCj4+IGV4cGxvaXRzLCBpcyBsb25nIGFuZCBpdCBjb250aW51ZXMgdG8g
dGhpcyBkYXkuIFRoZXJlIGlzIGFuCj4+IHVuYmVsaWV2YWJsZSBhbW91bnQgb2YgbW9uZXkgb3V0
IHRoZXJlIGFsbCBpbnZvbHZpbmcgZmlybXdhcmUKPj4gZXhwbG9pdHMsIHZlcnkgbGl0dGxlIG9m
IGl0IGludm9sdmluZyBuaWNlIHBlb3BsZS4KPj4gCj4+IEknbSBjdXJyZW50bHkgd29ya2luZyBv
biBkZWxldGluZyBhbGwgdXNlIG9mIHRoZSB4ODYgdmVyc2lvbiBvZiBNCj4+IG1vZGUsIGkuZS4g
U01NLiBUaGVyZSBhcmUgbWFueSBwcm9wb3NhbHMgb3V0IHRoZXJlIGZvciBkZWxldGluZyBTTU0K
Pj4gZnJvbSB0aGUgYXJjaGl0ZWN0dXJlLiBJJ3ZlIGFsc28gc2hvd24gYXQgYSB0YWxrIGluIDIw
MTcgaG93IHdlIGNvdWxkCj4+IHJlZGlyZWN0IFNNTSBpbnRlcnJ1cHRzIGJhY2sgaW50byB0aGUg
a2VybmVsLiBXZSdyZSBhbHNvIHJlbW92aW5nIGFsbAo+PiB1c2Ugb2YgY2FsbGJhY2tzIGludG8g
VUVGSSBvbiB4ODYuIFdlJ3JlIGFsbW9zdCB0aGVyZS4KPj4gCj4+IFdoaWNoIGlzIHdoeSBJJ20g
YSBiaXQgdW5oYXBweSB0byBzZWUgdGhpcyAodG8gbWUpIGNhbmNlcm91cyBncm93dGggaW4KPj4g
cHJvcG9zYWxzIGZvciBNLSBtb2RlIGNvZGUuIFBQUCBpbiBmaXJtd2FyZT8gUmVhbGx5PyBtdWx0
aXBsZSBzZXJpYWwKPj4gZGV2aWNlcz8gcmVhbGx5PyBXZSd2ZSBiZWVuIGhlcmUgYmVmb3JlLCBp
biB0aGUgMTk3MHMsIHdpdGggc29tZXRoaW5nCj4+IGNhbGxlZCB0aGUgQklPUy4gSWYgeW91J3Jl
IG5vdCBmYW1pbGlhciB3aXRoIGl0LCBnbyB0YWtlIGEgbG9vaywgb3IKPj4geW91IGNhbiB0YWtl
IG15IHdvcmQgZm9yIGl0IHRoYXQgdGhlc2UgcHJvcG9zYWxzIGltcGxlbWVudCB0aGF0IGlkZWEu
Cj4+IFdlIHNwZW50IG92ZXIgMjAgeWVhcnMgZnJlZWluZyBvdXJzZWx2ZXMgZnJvbSBpdCBvbiB4
ODYuIFdoeSBnbyBiYWNrCj4+IHRvIGEgNTAgeWVhciBvbGQgbW9kZWwgb24gYSBDUFUgZGVzaWdu
ZWQgdG8gYmUgaW4gdXNlIGZvciA1MCB5ZWFycz8KPj4gCj4+IE15IGVhcmx5IHVuZGVyc3RhbmRp
bmcgb2YgTSBtb2RlIHdhcyB0aGF0IGl0IHdhcyBhbiBBbHBoYSBQQUxDb2RlIGxpa2UKPj4gdGhp
bmcsIGVuYWJsaW5nIGFjY2VzcyB0byByZXNvdXJjZXMgdGhhdCB3ZXJlIGJlaGluZCBhIHByaXZp
bGVnZSB3YWxsLgo+PiBJIGRpZCBub3QgbGlrZSBpdCB0aGF0IG11Y2gsIGJ1dCBJIHdhcyBPSzog
aXQgd2FzIHZlcnkgbGltaXRlZCBpbgo+PiBmdW5jdGlvbiwgYW5kIHRoZSBrZXJuZWwgY291bGQg
cmVwbGFjZSBpdCwgb3IgYXQgbGVhc3QgbWVhc3VyZSBpdC4gSQo+PiBhbHNvIGFjY2VwdCB0aGF0
IGV2ZXJ5IGNwdSB2ZW5kb3IgdXNlcyBtIG1vZGUgbGlrZSB0aGluZ3MgKGUuZy4gQVJNCj4+IFRG
KSBmb3IgcmVhc29uYWJsZSBwdXJwb3NlcyBhbmQgYWxzbyAobGV0J3MgYmUgaG9uZXN0IGhlcmUp
ICBmb3IKPj4gZGVhbGluZyB3aXRoIGNoaXBzZXQgbWlzdGFrZXMuIEJ1dCB0aGF0IGRvZXMgbm90
IG1lYW4geW91IG5lZWQgdG8KPj4gcmVjcmVhdGUgQklPUy4KPj4gCj4+IFRoZSBTQkkgc2hvdWxk
IGJlIGhhcmQgdG8gYWRkIHRvLCBkZWxpYmVyYXRlbHkuIEl0IHNob3VsZCBiZSB1c2VkIG9ubHkK
Pj4gd2hlbiB0aGVyZSBhcmUgbm8gcG9zc2libGUgYWx0ZXJuYXRpdmVzLiBJdCBuZWVkcyB0byBi
ZSBvcGVuIHNvdXJjZQo+PiBhbmQgaGVsZCBpbiBjb21tb24uIEl0IHNob3VsZCBiZSBwb3NzaWJs
ZSBmb3IgYSBrZXJuZWwgdG8gcmVwbGFjZSBvcgo+PiBhdCBsZWFzdCBtZWFzdXJlIGl0LiBBbmQs
IGZ1cnRoZXIsIHRoZXJlIG5lZWRzIHRvIGJlIHNvbWUgd29yayBkb25lIG9uCj4+IHdoeSB5b3Ug
YWRkIHRvIGl0LCBhbmQgd2h5IHlvdSBkb24ndCwgd2l0aCBiaWFzIGFnYWluc3QgYWRkaW5nIHRv
IGl0Lgo+PiBUaGlzIHByb3Bvc2FsIHdvcmtzIGFnYWluc3QgdGhvc2UgaWRlYWxzLCBhcyBpdCBl
eHBsaWNpdGx5IGVuYWJsZXMKPj4gdmVuZG9yLXNwZWNpZmljIGZvcmtzIG9mIHRoZSBTQkkuIFN1
cmUsIHRoaXMgY2FuIGhhcHBlbiwgYnV0IHdoeSBtYWtlCj4+IGl0IHNvIGVhc3k/Cj4gCj4gVGhl
cmUncyBhIHRlbnNpb24gYmV0d2VlbiBsZXR0aW5nIHBlb3BsZSBkbyB0aGUgbWVzc3kgdGhpbmdz
IHRoYXQgcmVhbAo+IGhhcmR3YXJlIHNvbWV0aW1lcyBuZWVkcyB3aXRob3V0IHBvbGx1dGluZyBo
aWdoZXIgbGF5ZXJzIGluIHRoZQo+IHNvZnR3YXJlIHN0YWNrLCBhbmQgbGV0dGluZyB0aGVtIGRv
IHRvbyBtdWNoIG9mIHRoaW5ncyB0aGF0IF9zaG91bGRfCj4gYmUgaGFuZGxlZCBpbiB0aGUgdXBw
ZXIgbGF5ZXJzLiBJIGhhdmUgeWV0IHRvIGZpbmQgYSBzb2x1dGlvbiB0aGF0Cj4gZG9lc24ndCBu
ZWVkIHR3ZWFraW5nIG92ZXIgdGltZSwgdGhlIHBlbmR1bHVtIHRlbmRzIHRvIHN3aW5nIGJhY2sg
YW5kCj4gZm9ydGggaW50byAidG9vIGZhciIgaW4gYm90aCBkaXJlY3Rpb25zIHNvbWV0aW1lcy4K
PiAKPiBUaGUgY2FzZSBvZiBjb25zb2xlIGlzIGluIHRoaXMgY2FzZSBwcmV0dHkgc2ltcGxlOiBJ
dCdzIGludGVuZGVkIGZvcgo+IGVhcmx5IGJvb3QgZm9yIHZlcnkgc2ltcGxpc3RpYyBlbnZpcm9u
bWVudHMgKGJlZm9yZSB0aGUgcmVzdCBvZiB0aGUKPiBrZXJuZWwgaXMgdXAsIGV0YykuIEtlZXBp
bmcgdGhlIFNCSSBjb25zb2xlIGFyb3VuZCBiZXlvbmQgZWFybHkgYm9vdCwKPiBhbmQgc29tZWhv
dyB0cnlpbmcgdG8gb3B0aW1pemUgZm9yIGl0IGZvciB0aG9zZSB1c2UgY2FzZXMgaXMgYQo+IG1p
c2RpcmVjdGVkIGVmZm9ydDsgdGhhdCdzIHdoYXQgbmF0aXZlIGRyaXZlcnMgYXJlIGZvci4KPiAK
PiBIYXZpbmcgdG8gZG8gZmluZS1ncmFpbmVkIGFyYml0cmF0aW9uIG9mIGRldmljZSBvd25lcnNo
aXAgYmV0d2Vlbgo+IGZpcm13YXJlIGFuZCBrZXJuZWwgYXQgcnVudGltZSBpcyB1c3VhbGx5IGVy
cm9yIHByb25lIGFuZCBhd2t3YXJkIGFuZAo+IGJlc3QgdG8gYXZvaWQuCj4gCj4gCgorMQoKPj4g
cC5zLiBGb3IgaW50ZXJsZWF2aW5nIGRlYnVnIGFuZCBjb25zb2xlIG91dHB1dCBmaXJtd2FyZSwg
dXNlIHRoZQo+PiBvbGRlc3QgdHJpY2sgaW4gdGhlIGJvb2s6IEFTQ0lJIGlzIDcgYml0cy4gU2lu
Y2UgY29uc29sZSBvdXQgaXMgOAo+PiBiaXRzLCByZXNlcnZlIDEyOCB2YWx1ZXMgZm9yIGNvbnNv
bGUgb3V0LCBhbmQgMTI4IGZvciBkZWJ1ZyBzdHJlYW0sCj4+IGFuZCBpZiB0aGUgZGVidWcgc3Ry
ZWFtIG5lZWRzIDggYml0IGZvciBzb21lIHdvcmRzLCB5b3Uga25vdyB3aGF0IHRvCj4+IGRvLiBJ
dCdzIHZlcnkgZWFzeSBhbmQgZG9lc24ndCByZXF1aXJlIHRoYXQgd2UgYWRkIG11bHRpcGxlIFVB
UlQKPj4gc3VwcG9ydCB0byBTQkkuCj4gCj4gU3VyZSwgaXQgaGVscHMgZm9yIDIgY2hhbm5lbHMu
IEFuZCB0aGVuIGJleW9uZCB0aGF0IHlvdSBuZWVkIGEgbW9yZQo+IGNvbXBsZXggcHJvdG9jb2wu
IEVpdGhlciB3YXksIGl0J3Mgbm90IGEgcHJvYmxlbSB3ZSBuZWVkIHRvIHNvbHZlIGhlcmUKPiBh
bmQgbm93Lgo+IAoKKzEsIG1vc3QgcGVvcGxlIHdpbGwganVzdCB1c2UgbWluaWNvbS9waWNvY29t
IHRvIGRvIHRoZWlyIGpvYiwgbm90IAppbXBsZW1lbnQKYSBwcm90b2NvbCBvdmVyIHNlcmlhbCBm
b3Igc3BsaXR0aW5nIG1haW4gY29uc29sZSBmcm9tIGRlYnVnIGNvbnNvbGUuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
