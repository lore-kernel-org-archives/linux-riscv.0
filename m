Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8375C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 10:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B12820827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 10:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="df0ZH5pj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wWcC/Hy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B12820827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6opidvfrFmuUW1uAlGLKkboBlQBO8hK/t1kMFt+7jmo=; b=df0ZH5pjjYUjBDZjE/J4f1Sgm
	WFQjcSaBrNZF3/v27F7IV+Y/egb3kJJ3p7ivJUShbYLZmKQm+Wf3Tn1XC6UtfN5+B/F1hR2I1aXzy
	fEwe3iSR3o/oPJj+lY+oovagp05TCzUamE/DFUs0dt15FVMNv74ghEV9bRJ0G696/1wojLSt9BTBG
	qtUw+EUwmdkJX0W3eDxalVPodQ0p/UcGOilccQ063p1nMhkOM0BRd2PyBuSkk/0OxdyZF1ndixtm4
	BC3CHpXIAE+a60iwCP/Ot9uyCTgdLI/yg9vn5yfQ+Q2KV+gRVKJua2eaQ89PG2lsPSu0H0csKCQOL
	CjX4FvD9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJyEl-000629-T1; Tue, 06 Nov 2018 10:05:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJyEk-00061v-AJ
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 10:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZmApM4WxwEnMo8Bs6+9kqtvy0ri6rT6kT8h9iLtdnqo=; b=wWcC/Hy7zoRW7kSIomPA8EZpyj
 B3CuA4sBQ+MluhHs0sdjlhnzr5qYRdtcOVbEB75OHRBb0agqmEQ3UxhyBeYjrScpt4+mF1RsEZLNb
 XiAc1tisAffZE2ujEwoh/ewXivoHkAF7nNM83mpqDGTlpyDyGBe/0jvde+rzCDY4TI8nHRzOWnZGO
 wwti7ORu1LkomSRJlj+xvWcZV5EY8Cz3wIMxLJbvrRvZuOBPQxCwHTJzM2JjQ1kIyNWz3kskFB9TY
 v6eiqdSgSxT9TwgUjBiWCmGs5FT7TCvnbJPStI0530DXv4DOXkhiZmvW1JsI9gHoLblByM2P5Hf+s
 goJJtCSQ==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJyEf-0002tC-Sh
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 10:05:29 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA6A3Kkv051876; Tue, 6 Nov 2018 12:03:22 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-72-5be166e76bcb
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 A4.A8.03682.7E661EB5; Tue,  6 Nov 2018 12:03:19 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA6A3HlQ008115; Tue, 6 Nov 2018 12:03:17 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 06 Nov 2018 12:03:17 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Organization: FORTH
In-Reply-To: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
References: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
Message-ID: <9e77989d6b868d914bc328401cd64557@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsXSHc2orPs87WG0waIeM4ttS1azWrR8eMdq
 sWjFdxaL1vZvTBbzj5xjtTg9YRGTxeVdc9gstn1uYbNYev0ik8XmCQtYLVr3HmG32LxpKrPF
 85W9bA68HntOz2L2WDNvDaPH1N9nWDw2r9Dy2LSqk83j3blz7B6bl9R7XGq+zu7xeZOcR/uB
 bqYArigum5TUnMyy1CJ9uwSujGPv1zAXfFOsOLJ0FnMD4zHpLkZODgkBE4n9Z3axdDFycQgJ
 HGGUmHOljxnCOcgo8e37WzaIKlOJ2Xs7GUFsXgFBiZMzn7CA2MwCFhJTr+xnhLDlJZq3zmYG
 sVkEVCWmtvaBxdkENCXmXzoIVi8ioCZxqOkII8gCZoErTBKH9k8FSwgLuEl8uPkIrJlfQFji
 092LrCA2p4C7xK/zf8BqhIBqXt+/ydTFyAF0hIvE/QM6ELepSHz4/YAdxBYVUJZ4cWI66wRG
 oVlITp2F5NRZSE5dwMi8ilEgscxYLzO5WC8tv6gkQy+9aBMjOO7m+u5gPLfA/hCjAAejEg8v
 R8GDaCHWxLLiytxDjBIczEoivEpsQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8h1+EBwkJpCeW
 pGanphakFsFkmTg4pRoYzaqbDX9/9jb773f0tABHWsOOrEc8Tw2nlTr+vqj8zPP5TYfSDS/3
 unOc5es59eiNXJaRxTUPf9/mug+LJ+iefnI81yXvLtut+EtTjVR8H4ef6WRckmjZ0LU2NXXK
 NDYbeYkNW59yrXS7sWq6vpD8y43WhS+5T+qGrZb5JLpW8dL87ZeluWInKLEUZyQaajEXFScC
 ADT1tbO3AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_100526_137501_A1F29AA5 
X-CRM114-Status: GOOD (  30.54  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, Christoph Hellwig <hch@infradead.org>,
 anup@brainfault.org, linux-kernel@vger.kernel.org, zong@andestech.com,
 atish.patra@wdc.com, robh+dt@kernel.org, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106100317.vAiS4SWoOp8N29O_roaF4rnEKbxUrl5qqkU4cwcmiYQ@z>

zqPPhM65z4IgMjAxOC0xMS0wNSAyMTozOCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIEZyaSwgMDIgTm92IDIwMTggMDY6MDk6MzkgUERUICgtMDcwMCksIHJvYmgrZHRAa2VybmVs
Lm9yZyB3cm90ZToKPj4gT24gVGh1LCBOb3YgMSwgMjAxOCBhdCA2OjA0IFBNIEF0aXNoIFBhdHJh
IDxhdGlzaC5wYXRyYUB3ZGMuY29tPiAKPj4gd3JvdGU6Cj4+PiAKPj4+IERlZmluZSBhIFJJU0Mt
ViBjcHUgdG9wb2xvZ3kuIFRoaXMgaXMgYmFzZWQgb24gY3B1LW1hcCBpbiBBUk0gd29ybGQuCj4+
PiBCdXQgaXQgZG9lc24ndCBuZWVkIGEgc2VwYXJhdGUgdGhyZWFkIG5vZGUgZm9yIGRlZmluaW5n
IFNNVCBzeXN0ZW1zLgo+Pj4gTXVsdGlwbGUgY3B1IHBoYW5kbGUgcHJvcGVydGllcyBjYW4gYmUg
cGFyc2VkIHRvIGlkZW50aWZ5IHRoZSBzaWJsaW5nCj4+PiBoYXJkd2FyZSB0aHJlYWRzLiBNb3Jl
b3Zlciwgd2UgZG8gbm90IGhhdmUgY2x1c3RlciBjb25jZXB0IGluIFJJU0MtVi4KPj4+IFNvIHBh
Y2thZ2UgaXMgYSBiZXR0ZXIgd29yZCBjaG9pY2UgdGhhbiBjbHVzdGVyIGZvciBSSVNDLVYuCj4+
IAo+PiBUaGVyZSB3YXMgYSBwcm9wb3NhbCB0byBhZGQgcGFja2FnZSBpbmZvIGZvciBBUk0gcmVj
ZW50bHkuIE5vdCBzdXJlCj4+IHdoYXQgaGFwcGVuZWQgdG8gdGhhdCwgYnV0IHdlIGRvbid0IG5l
ZWQgMiBkaWZmZXJlbnQgd2F5cy4KPj4gCj4+IFRoZXJlJ3MgbmV2ZXIgZ29pbmcgdG8gYmUgY2x1
c3RlcnMgZm9yIFJJU0MtVj8gV2hhdCBwcmV2ZW50cyB0aGF0Pwo+PiBTZWVtcyBzaG9ydHNpZ2h0
ZWQgdG8gbWUuCj4+IAo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gu
cGF0cmFAd2RjLmNvbT4KPj4+IC0tLQo+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L3RvcG9sb2d5LnR4dCAgICAgICAgIHwgMTU0IAo+Pj4gKysrKysrKysrKysrKysrKysrKysrCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspCj4+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IAo+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RvcG9sb2d5
LnR4dAo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L3RvcG9sb2d5LnR4dCAKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L3RvcG9sb2d5LnR4dAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGlu
ZGV4IDAwMDAwMDAwLi45NjAzOWVkMwo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RvcG9sb2d5LnR4dAo+Pj4gQEAgLTAs
MCArMSwxNTQgQEAKPj4+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Cj4+PiArUklTQy1WIGNwdSB0b3BvbG9neSBiaW5kaW5nIGRlc2NyaXB0aW9uCj4+PiArPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4gKwo+Pj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4+ICsxIC0gSW50cm9kdWN0
aW9uCj4+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4g
Kwo+Pj4gK0luIGEgUklTQy1WIHN5c3RlbSwgdGhlIGhpZXJhcmNoeSBvZiBDUFVzIGNhbiBiZSBk
ZWZpbmVkIHRocm91Z2ggCj4+PiBmb2xsb3dpbmcgbm9kZXMgdGhhdAo+Pj4gK2FyZSB1c2VkIHRv
IGRlc2NyaWJlIHRoZSBsYXlvdXQgb2YgcGh5c2ljYWwgQ1BVcyBpbiB0aGUgc3lzdGVtOgo+Pj4g
Kwo+Pj4gKy0gcGFja2FnZXMKPj4+ICstIGNvcmUKPj4+ICsKPj4+ICtUaGUgY3B1IG5vZGVzIChi
aW5kaW5ncyBkZWZpbmVkIGluIFsxXSkgcmVwcmVzZW50IHRoZSBkZXZpY2VzIHRoYXQKPj4+ICtj
b3JyZXNwb25kIHRvIHBoeXNpY2FsIENQVXMgYW5kIGFyZSB0byBiZSBtYXBwZWQgdG8gdGhlIGhp
ZXJhcmNoeSAKPj4+IGxldmVscy4KPj4+ICtTaW11bHRhbmVvdXMgbXVsdGktdGhyZWFkaW5nIChT
TVQpIHN5c3RlbXMgY2FuIGFsc28gcmVwcmVzZW50IHRoZWlyIAo+Pj4gdG9wb2xvZ3kKPj4+ICti
eSBkZWZpbmluZyBtdWx0aXBsZSBjcHUgcGhhbmRsZXMgaW5zaWRlIGNvcmUgbm9kZS4gVGhlIGRl
dGFpbHMgYXJlIAo+Pj4gZXhwbGFpbmVkCj4+PiAraW4gcGFyYWdyYXBoIDMuCj4+IAo+PiBJIGRv
bid0IHNlZSBhIHJlYXNvbiB0byBkbyB0aGlzIGRpZmZlcmVudGx5IHRoYW4gQVJNLiBUaGF0IHNh
aWQsIEkKPj4gZG9uJ3QgdGhpbmsgdGhlIHRocmVhZCBwYXJ0IGlzIGluIHVzZSBvbiBBUk0sIHNv
IGl0IGNvdWxkIHBvc3NpYmx5IGJlCj4+IGNoYW5nZWQuCj4+IAo+Pj4gKwo+Pj4gK1RoZSByZW1h
aW5kZXIgb2YgdGhpcyBkb2N1bWVudCBwcm92aWRlcyB0aGUgdG9wb2xvZ3kgYmluZGluZ3MgZm9y
IAo+Pj4gQVJNLCBiYXNlZAo+PiAKPj4gZm9yIEFSTT8KPj4gCj4+PiArb24gdGhlIERldmljZXRy
ZWUgU3BlY2lmaWNhdGlvbiwgYXZhaWxhYmxlIGZyb206Cj4+PiArCj4+PiAraHR0cHM6Ly93d3cu
ZGV2aWNldHJlZS5vcmcvc3BlY2lmaWNhdGlvbnMvCj4+PiArCj4+PiArSWYgbm90IHN0YXRlZCBv
dGhlcndpc2UsIHdoZW5ldmVyIGEgcmVmZXJlbmNlIHRvIGEgY3B1IG5vZGUgcGhhbmRsZSAKPj4+
IGlzIG1hZGUgaXRzCj4+PiArdmFsdWUgbXVzdCBwb2ludCB0byBhIGNwdSBub2RlIGNvbXBsaWFu
dCB3aXRoIHRoZSBjcHUgbm9kZSBiaW5kaW5ncyAKPj4+IGFzCj4+PiArZG9jdW1lbnRlZCBpbiBb
MV0uCj4+PiArQSB0b3BvbG9neSBkZXNjcmlwdGlvbiBjb250YWluaW5nIHBoYW5kbGVzIHRvIGNw
dSBub2RlcyB0aGF0IGFyZSBub3QgCj4+PiBjb21wbGlhbnQKPj4+ICt3aXRoIGJpbmRpbmdzIHN0
YW5kYXJkaXplZCBpbiBbMV0gaXMgdGhlcmVmb3JlIGNvbnNpZGVyZWQgaW52YWxpZC4KPj4+ICsK
Pj4+ICtUaGlzIGNwdSB0b3BvbG9neSBiaW5kaW5nIGRlc2NyaXB0aW9uIGlzIG1vc3RseSBiYXNl
ZCBvbiB0aGUgCj4+PiB0b3BvbG9neSBkZWZpbmVkCj4+PiAraW4gQVJNIFsyXS4KPj4+ICs9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+PiArMiAtIGNwdS10b3Bv
bG9neSBub2RlCj4+IAo+PiBjcHUtbWFwLiBXaHkgY2hhbmdlIHRoaXM/Cj4+IAo+PiBXaGF0IEkg
d291bGQgbGlrZSB0byBzZWUgaXMgdGhlIEFSTSB0b3BvbG9neSBiaW5kaW5nIHJld29ya2VkIHRv
IGJlCj4+IGNvbW1vbiBvciBzb21lIGdvb2QgcmVhc29ucyB3aHkgaXQgZG9lc24ndCB3b3JrIGZv
ciBSSVNDLVYgYXMtaXMuCj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBncmVhdCBpZiBDUFUgdG9w
b2xvZ2llcyB3ZXJlIG5vdCBhIFJJU0MtViBzcGVjaWZpYwo+IHRoaW5nLiAgV2UgZG9uJ3QgcmVh
bGx5IGRvIGFueXRoaW5nIGRpZmZlcmVudCB0aGFuIGFueW9uZSBlbHNlLCBzbwo+IGl0J2QgYmUg
Z3JlYXQgaWYgd2UgY291bGQgYWxsIHNoYXJlIHRoZSBzYW1lIHNwZWMgYW5kIGNvZGUuICBMb29r
aW5nCj4gcXVpY2tseSBhdCB0aGUgQVJNIGNwdS1tYXAgYmluZGluZ3MsIEkgZG9uJ3Qgc2VlIGFu
eSByZWFzb24gd2h5IHdlCj4gY2FuJ3QganVzdCB1c2UgdGhlIHNhbWUgdGhpbmcgb24gUklTQy1W
IC0tIGl0J3Mgbm90IHF1aXRlIGhvdyBJJ2QgZG8KPiBpdCwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhl
IGRpZmZlcmVuY2VzIGFyZSB3b3J0aCBoYXZpbmcgYW5vdGhlcgo+IGltcGxlbWVudGF0aW9uLiAg
TWVjaGFuaWNhbGx5IEknbSBub3Qgc3VyZSBob3cgdG8gZG8gdGhpczogc2hvdWxkCj4gdGhlcmUg
anVzdCBiZSBhICJEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3B1LW1hcC50eHQi
Pwo+IAo+IElmIGV2ZXJ5b25lIGlzIE9LIHdpdGggdGhhdCB0aGVuIEkgdm90ZSB3ZSBqdXN0IGdv
IGFoZWFkIGFuZAo+IGdlbmVyaWNpc2UgdGhlIEFSTSAiY3B1LW1hcCIgc3R1ZmYgZm9yIENQVSB0
b3BvbG9neS4gIFNoYXJpbmcgdGhlCj4gaW1wbGVtZW50YXRpb24gbG9va3MgZmFpcmx5IHN0cmFp
Z2h0LWZvcndhcmQgYXMgd2VsbC4KPiAKClBsZWFzZSBjaGVjayB0aGlzIG91dC4uLgpodHRwczov
L2xrbWwub3JnL2xrbWwvMjAxOC8xMS8zLzk5CgpJdCdzIGFsc28gbm9uIGFyY2gtZGVwZW5kZW50
IGFuZCBpdCBjYW4gaGFuZGxlIHRoZSBzY2hlZHVsZXIncyAKY2FwYWJpbGl0aWVzCmJldHRlciB0
aGFuIGNwdS1tYXAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
