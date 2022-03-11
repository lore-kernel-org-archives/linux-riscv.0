Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB147C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PZyMQjG53CTzvLmz9vukBMCivVqPXfpPe/Bn7IjmLc=; b=MMJOGn9OTjpPvuGnqsZYnl8T3W
	kl/olqBuHzkY7Gy4AMzN9/EZiSDwwXX0Q0yp12ORYW5hYTxHry8FF4ZI6c5W+ho7tSGSNYr2gAyYe
	gjJ+c+Z1fRsbhMOQBP7RxXM+s6RbxWvd34siS67PjvSx/sKj4OtpoQJbPo3OW8jJpJ++UFmLanbHw
	xzi/8E6ZbI3MyCKxUeNGEDsZZMGDaplAlEk7mVf9VIapsgDz729cZTNQFhp0y5yHLhSNExc8Vz2gS
	RFX8//2bFqlLpNBeY7Fazsdy2yqTyORkswK7Ro7Ei7605KtdvSIkGEUJ7eJLysM9HuLg84+xvq+TX
	U9vPg8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSebm-00GOZb-W8; Fri, 11 Mar 2022 12:43:03 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSebk-00GOXd-7K
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 12:43:02 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 22BCgg6t038478
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 14:42:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1647002557; x=1649594557;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u5iax0bPoVIojUOUZZR2XGY8KQMpedcYRWJVPYiMZH0=;
 b=uzkTrBmEE/WI0x55scdRW3+aWDx5mzDbfAy7rwqZGbqPK9gj0A9Ha6aIroxSbkhH
 AEch1W0IKw7mz2COPXBV0GoguEiDWcwWcWchlt5v5DsHEtp/vuptGA0VWTD2cRKB
 /R754oPKU2+q6v+qTjeRrMaujUx2HW4vlpF6iWNVaNKuGmDP2+kefdvPwIP7FTMH
 oIa00rxLPuqbVxwVV5jcaR0AQfxsJiHC/9vM6Nmsu04NODv7MRjz4AaifV8kv0vO
 PeREWnBBh+g2BrunDGcGsyBPnr/mriw6imV/iZSBiORmuq1lRNqcZ2RYIM3fqBU3
 AtL4YeJYeB7eAEhcAZwD2w==;
X-AuditID: 8b5b014d-feeaa700000035db-85-622b43bd8380
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 50.27.13787.DB34B226; Fri, 11 Mar 2022 14:42:37 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 11 Mar 2022 14:42:35 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Atish
 Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Damien Le
 Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, linux-riscv
 <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [PATCH v5 0/6] Provide a fraemework for RISC-V ISA extensions
Organization: FORTH
In-Reply-To: <CAHBxVyHaFk6mx_uTUcOG1d+XGokT_-Y3_Y1kVJixAnGGmLjAxg@mail.gmail.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
 <mhng-4593ea1e-503d-47df-8e55-d2ef06f01518@palmer-ri-x1c9>
 <CAHBxVyHaFk6mx_uTUcOG1d+XGokT_-Y3_Y1kVJixAnGGmLjAxg@mail.gmail.com>
Message-ID: <d8d4fedad13ef063b672aadfe2ee0aff@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsXSHT1dWXevs3aSweJnvBYtH96xWmz9PYvd
 ouOcm8Xm/1+YLVrbvzFZzD9yjtWi+dh6NouNb38wWVzeNYfNYtvnFjaLl5d7mC3aZvFbdK+s
 tmjde4Tdgc/jWsdGFo+pv8+weMxq6GXzePPyJYvH4Y4v7B6bVnWyeWxeUu9xY1aEx6Xm6+we
 nzfJeey8/ZDJo/1AN1MATxSXTUpqTmZZapG+XQJXxrKzf9gKJohVXO+vaGCcK9jFyMkhIWAi
 8fjeRLYuRi4OIYEjjBJPXs1jh0iYSsze28kIYvMKCEqcnPmEBcRmFrCQmHplPyOELS/RvHU2
 M4jNIqAq0X3lIFgNm4CmxPxLIDYHh4iAtsStLdwg85kFprNK/GyaADZfWMBL4uGjE2D1/ALC
 Ep/uXmQFsTkFAiX2ty9mhDhoH6PEicurWCCOcJG4c7SJGeI4FYkPvx+wgywQBbI3z1WawCg4
 C8mps5CcOgvJqQsYmVcxCiSWGetlJhfrpeUXlWTopRdtYgTHHKPvDsbbm9/qHWJk4mA8xCjB
 wawkwtsUqpEkxJuSWFmVWpQfX1Sak1p8iFGag0VJnJflmkySkEB6YklqdmpqQWoRTJaJg1Oq
 gYnT5oEef13SjHUh7SZPF4q93Wx18K7k7Jufev6HGQfxRFyoFJw25fKpngUp33c5HHHlq3Z6
 /szXTcBn+uTZOfM/ls5ceizu6ETtw9Vuj4/Yu/X8Evjh3nP2Qc3Tct9F97QcNV9xB1gf8Uhs
 itpruliB+9wT1d7KbKbtkur/TG5mtQvblbw+HNncWSU/16Rb6uMSnojFS5p81R8mCnR49Rkc
 inFIent2+qc/lRuZGbL/ty+vlOaZNNE58zO7ztqLfx0nvmUOmnrPwUCv68PJyujP3fdXbhPr
 P/vw6uKM+/wT/bzzHtrd89RIF2LP1Dv84Gfr71PH3h7ZZPNlvgnv/qsKkpEMXHpv09/1f57e
 mqrEUpyRaKjFXFScCAAB0LWVKAMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_044300_677178_0898B95C 
X-CRM114-Status: GOOD (  26.78  )
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

zqPPhM65z4IgMjAyMi0wMy0xMSAwMjoyMSwgQXRpc2ggS3VtYXIgUGF0cmEgzq3Os8+BzrHPiM61
Ogo+IE9uIFRodSwgTWFyIDEwLCAyMDIyIGF0IDM6NTAgUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckBkYWJiZWx0LmNvbT4gCj4gd3JvdGU6Cj4+IAo+PiBPbiBUdWUsIDIyIEZlYiAyMDIyIDEyOjQ4
OjA1IFBTVCAoLTA4MDApLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4gPiBUaGlzIHNlcmllcyBpbXBs
ZW1lbnRzIGEgZ2VuZXJpYyBmcmFtZXdvcmsgdG8gcGFyc2UgbXVsdGktbGV0dGVyIElTQQo+PiA+
IGV4dGVuc2lvbnMuIFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIFRzdWthc2EncyB2MyBpc2EgZXh0
ZW5zaW9uIGltcHJvdmVtZW50Cj4+ID4gc2VyaWVzWzFdLiBJIGhhdmUgZml4ZWQgZmV3IGJ1Z3Mg
YW5kIGltcHJvdmVkIGNvbW1lbnRzIGZyb20gdGhhdCBzZXJpZXMKPj4gPiAoUEFUQ0gxLTMpLiBJ
IGhhdmUgbm90IHVzZWQgUEFUQ0ggNCBmcm9tIHRoYXQgc2VyaWVzIGFzIHdlIGFyZSBub3QgdXNp
bmcKPj4gPiBJU0EgZXh0ZW5zaW9uIHZlcnNpb25pbmcgYXMgb2Ygbm93LiBXZSBjYW4gYWRkIHRo
YXQgbGF0ZXIgaWYgcmVxdWlyZWQuCj4+ID4KPj4gPiBQQVRDSCA0IGFsbG93cyB0aGUgcHJvYmlu
ZyBvZiBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucyB2aWEgYSBtYWNyby4KPj4gPiBJdCBjb250aW51
ZXMgdG8gdXNlIHRoZSBjb21tb24gaXNhIGV4dGVuc2lvbnMgYmV0d2VlbiBhbGwgdGhlIGhhcnRz
Lgo+PiA+IFRodXMgaGV0ZXJnZW5vdXMgaGFydCBzeXN0ZW1zIHdpbGwgb25seSBzZWUgdGhlIGNv
bW1vbiBJU0EgZXh0ZW5zaW9ucy4KPj4gPgo+PiA+IFBBVENIIDYgaW1wcm92ZXMgdGhlIC9wcm9j
L2NwdWluZm8gaW50ZXJmYWNlIGZvciB0aGUgYXZhaWxhYmxlIElTQSBleHRlbnNpb25zCj4+ID4g
dmlhIC9wcm9jL2NwdWluZm8uCj4+ID4KPj4gPiBIZXJlIGlzIHRoZSBleGFtcGxlIG91dHB1dCBv
ZiAvcHJvYy9jcHVpbmZvOgo+PiA+ICh3aXRoIGRlYnVnIHBhdGNoZXMgaW4gUWVtdSBhbmQgTGlu
dXgga2VybmVsKQo+PiA+Cj4+ID4gIyBjYXQgL3Byb2MvY3B1aW5mbwo+PiA+IHByb2Nlc3NvciAg
ICAgOiAwCj4+ID4gaGFydCAgICAgICAgICA6IDAKPj4gPiBpc2EgICAgICAgICAgIDogcnY2NGlt
YWZkY2gKPj4gPiBpc2EtZXh0ICAgICAgICAgICAgICAgOiBzdnBibXQgc3ZuYXBvdCBzdmludmFs
Cj4+IAo+PiBJIGtub3cgaXQgbWlnaHQgc2VlbSBhIGJpdCBwZWRhbnRpYywgYnV0IEkgcmVhbGx5
IGRvbid0IHdhbnQgdG8KPj4gaW50cm9kdWNlIGEgbmV3IGZvcm1hdCBmb3IgZW5jb2RpbmcgSVNB
IGV4dGVuc2lvbnMgLS0gZG91Ymx5IHNvIGlmIAo+PiB0aGlzCj4+IGlzIHRoZSBvbmx5IHdheSB3
ZSdyZSBnaXZpbmcgdGhpcyBpbmZvIHRvIHVzZXJzcGFjZSwgYXMgdGhlbiB3ZSdyZSAKPj4ganVz
dAo+PiBhc2tpbmcgZm9sa3MgdG8gdHVybiB0aGlzIGludG8gYSBkZWZhY3RvIEFCSS4gIEV2ZXJ5
IHRpbWUgd2UgdHJ5IHRvIGRvCj4+IHNvbWV0aGluZyB0aGF0J3Mgc29ydCBvZiBsaWtlIGFuIElT
QSBzdHJpbmcgYnV0IG5vdCBleGFjdGx5IHdoYXQncyBpbgo+PiB0aGUgc3BlYyB3ZSBlbmQgdXAg
Z2V0dGluZyBidXJuZWQsIGFuZCB3aGlsZSBJIGRvbid0IHNlZSBhIHNwZWNpZmljIAo+PiB3YXkK
PiAKPiBJIGFncmVlIHRoYXQgdGhpcyBpcyBhbiBBQkkgY2hhbmdlL2ltcHJvdmVtZW50IHdoaWNo
IGlzIGltcG9zc2libGUgdG8KPiBtb2RpZnkgbGF0ZXIuCj4gSG93ZXZlciwgdGhpcyBpcyBhIExp
bnV4IHNwZWNpZmljIEFCSS4gRG8geW91IHRoaW5rIHRoZSBSSVNDLVYgc3BlYwo+IHdpbGwgZXZl
ciBzYXkgYW55dGhpbmcgYWJvdXQgaG93IC9wcm9jL2NwdWluZm8gaXMgc2hvd24gdG8gdGhlIHVz
ZXIgPwo+IAoKQWN0dWFsbHkgdGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBvbiBjaGFpcnMgYXQgc29t
ZSBwb2ludCBvbiBob3cgaXNhIApleHRlbnNpb25zIHdpbGwgYmUgcmVwcmVzZW50ZWQgYXMgYSBz
aW5nbGUgc3RyaW5nLiBJZiBJIHJlY2FsbCBjb3JyZWN0bHkgCnRoZXkgd2FudGVkIGEgd2F5IHRv
IGNvbXBhcmUgZmVhdHVyZXMgYmV0d2VlbiBpbXBsZW1lbnRhdGlvbnMgc28gdGhpcyAKd2FzIHNv
bWV0aGluZyB0aGUgdXNlciBzaG91bGQgYmUgYWJsZSB0byByZWFkIGFzIHdlbGwuIEknbSBjY2lu
ZyBQaGlsaXBwIApmcm9tIHRoZSBTb2Z0d2FyZSBIQyBpbiBjYXNlIGhlIGhhcyBtb3JlIGRldGFp
bHMgb24gdGhpcy4KCkkgYWxzbyBiZWxpZXZlIHdlIG5lZWQgdG8gZGlzY3VzcyB0aGlzIGEgYml0
IGZ1cnRoZXIsIGFsc28gSSB0aG91Z2h0IHdlIAphZ3JlZWQgdGhhdCBoYXZpbmcgZXZlcnl0aGlu
ZyBhcyBhIHNpbmdsZSBzdHJpbmcgKHJpc2N2LWlzYSkgb24gdGhlIApkZXZpY2UgdHJlZSBkb2Vz
bid0IHNjYWxlLCB0aGVyZSB3ZXJlIHNvbWUgb3RoZXIgc3VnZ2VzdGlvbnMgcmVnYXJkaW5nIApm
b3IgZXhhbXBsZSBtbXUgZXh0ZW5zaW9ucyBiZWluZyBkZWNsYXJlZCBpbnNpZGUgYW4gbW11IHN1
Yi1ub2RlIGV0Yy4gClRoaXMgcGF0Y2ggc2VyaWVzIHdpbGwgbm90IG9ubHkgbWFrZSBpdCBoYXJk
IHRvIGNoYW5nZSAvcHJvYy9jcHVpbmZvIApvdXRwdXQgaW4gdGhlIGZ1dHVyZSwgYnV0IGFsc28g
ZXN0YWJsaXNoZXMgYSBkZXZpY2UtdHJlZSBiaW5kaW5nIGZvciBhbGwgCmlzYSBleHRlbnNpb25z
IHRocm91Z2ggdGhlIHJpc2N2LWlzYSBzdHJpbmcgdGhhdCB3ZSBhbHNvIHdvbid0IGJlIGFibGUg
CnRvIG1vZGlmeSBsYXRlciBvbi4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
