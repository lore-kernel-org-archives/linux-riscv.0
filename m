Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03A1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 03:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9781520828
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 03:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tEj7SXtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9781520828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zKK8XTBBNOsF5EvnRErLx+VEBdmQJl3v6o9wuN8bOMY=; b=tEj7SXtT/6ONYiBzkCE5ZqYcn
	pbgqBVQRxbzIOohI0J2/Yn64lFauMJVxH6CPkRu9xShWT/4uhI1tFrBtlkFMmnTaHsHw11pkkp59W
	LBm9btxmo5VlLHaRSTzRe5cSiP9dnfEuERLv5D7SayCP77utXWWNEIy++lKqGzy9znFNP8PAi/mpa
	l1HL1qm2UN7F7660ABleyEgrvPVV6iiW6hAO4AlJjmwmYZair2r5FO/iVqVZKBd496O1+rmuPNKXJ
	o28inCjqRQKabS3sDjwf15q45hfhaXKjW/5ihIVG8y1rVA/EriQ+oQM23tGKFGg2+tLTBDqtoCLvd
	K4KKlpNSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8ci3-000686-RW; Tue, 26 Mar 2019 03:25:07 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8chw-00050l-TI
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 03:25:06 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x2Q3OZYe010419; Tue, 26 Mar 2019 03:24:37 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-49-5c999b73f47d
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 B7.5A.09052.37B999C5; Tue, 26 Mar 2019 05:24:35 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x2Q3OY9S011971; Tue, 26 Mar 2019 05:24:34 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 26 Mar 2019 05:24:34 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: Thoughts on kexec / SBI
Organization: FORTH
In-Reply-To: <mhng-ae8f91c3-e0a0-481b-8c51-a2dbf9630a36@palmer-si-x1c4>
References: <mhng-ae8f91c3-e0a0-481b-8c51-a2dbf9630a36@palmer-si-x1c4>
Message-ID: <67571f5519274a4402d8b4b4f7b4a6f6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsXSHc2orFs8e2aMwfIHUhZPPkxks1i04juL
 xbbPLWwWze/OsVtsnrCA1aJtFr8Dm8fDTZeYPDYvqfe41Hyd3aP9QDdTAEsUl01Kak5mWWqR
 vl0CV8arf1eYChpVKxq2ZzYwnpHtYuTgkBAwkbj0s6yLkYtDSOAwo8TSQ3/YIZxDjBIt9yYC
 OZxARaYSs/d2MoLYvAKCEidnPmEBsZkFLCSmXtnPCGHLSzRvnc0MYrMIqEp8O3aUFcRmE9CU
 mH/pIFi9iICaxKGmI4wgC5gFdjBKbD+0AmyBsICKxNyTV8Aa+AWEJT7dvQhmcwq4S2zoOMgE
 cqmQgJvEzdXlEDe4SPRMOccIcZuKxIffD8DGiAooS7w4MZ11AqPQLCSnzkJy6iwkpy5gZF7F
 KJBYZqyXmVysl5ZfVJKhl160iREc8nN9dzCeW2B/iFGAg1GJh3fFjP4YIdbEsuLKXGDAcDAr
 ifDaewKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8x5+ER4kJJCeWJKanZpakFoEk2Xi4JRqYPR+
 0b9U79ueANev/z6VzXVJEzivfaemXjD646dlDOL+C37WHPo4Wf50bbN8etzbPfUtiWWld3Pn
 CB2z/W27v6eksUP14+vnZf/XsjvkZXxsKfr966BTYNXyyW3JPFlt+xuXz7690XIV00S5D6Iv
 b3hWLftiHu664v+2PdpdDLKJXiLWn8zC7imxFGckGmoxFxUnAgBJPafSdQIAAA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Tue, 26 Mar 2019 03:24:37 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Tue, 26 Mar 2019 03:24:37 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_202501_344515_AE1514BD 
X-CRM114-Status: GOOD (  21.80  )
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
Cc: mick@ics.forth.gr, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMy0yNiAwMzo1OCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFN1biwgMjQgTWFyIDIwMTkgMTU6MTc6MTAgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBIZWxsbyBBdGlzaCwKPj4gCj4+IM6jz4TOuc+CIDIwMTktMDMtMjQgMDA6
MzEsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4+IEhpIE5pY2ssCj4+PiAKPj4+IE9uIE1h
ciAyMywgMjAxOSwgYXQgMTE6MDUgQU0sIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGgu
Z3I+Cj4+PiB3cm90ZToKPj4+IAo+Pj4+IEhlbGxvIGFsbCwKPj4+PiAKPj4+PiBJJ20gd29ya2lu
ZyBvbiBpbXBsZW1lbnRpbmcga2V4ZWMgb24gUklTQy1WIChqdXN0IGtleGVjIGZvciBub3csIG5v
dAo+Pj4+IGtkdW1wIHlldCkgc2luY2Ugd2Ugd2FudCB0byBiZSBhYmxlIHRvIHRlc3QgbmV3IGtl
cm5lbCBpbWFnZXMgZWFzaWx5Cj4+Pj4gb24gb3VyIHRlc3RiZWRzLiBJdCdzIHBhcnQgb2YgYSBs
YXJnZXIgcHJvamVjdCB3aGVyZSBJJ20gdHJ5aW5nIHRvCj4+Pj4gaGF2ZSBhIHVuaWZpZWQgd2F5
IG9mIHRlc3RpbmcgdmFyaW91cyBsaW51eC1jYXBhYmxlIFJJU0MtViB0YXJnZXRzCj4+Pj4gKGh0
dHBzOi8vZ2l0aHViLmNvbS9taWNrZmxlbW0veWFydnQgWzFdKSB0aGF0IHdlIGhhdmUgb24gdGhl
IGxhYi4KPj4+IAo+Pj4gR3JlYXQuIFRoaXMgcmVwbyB3aWxsIGJlIHZlcnkgaGVscGZ1bCB0byBi
ZWdpbm5lcnMuIEkgaGFkIGEgcXVpY2sgCj4+PiBsb29rCj4+PiBhdCB0aGUgc2lmaXZlLWZ1NTQw
L2NvbW1hbmRzLnNoLgo+Pj4gb2JqY29weSBzdGVwIGlzIHJlZHVuZGFudCBmb3IgT3BlblNCSSBh
cyBpdCBhbHJlYWR5IGdlbmVyYXRlcyB0aGUKPj4+IGZ3X3BheWxvYWQuYmluIGFzIHdlbGwuCj4+
PiAKPj4gCj4+IEkgaG9wZSBzbywgdGhhbmtzIGZvciB0aGUgdXBkYXRlLCBJIHByZWZlciBpdCB0
aGlzIHdheSBzaW5jZSBpdCBzaG93cwo+PiBob3cgdGhlIC5iaW4gaXMgZ2VuZXJhdGVkLgo+PiAK
Pj4+PiBUaGUgaXNzdWUgaXMgdGhhdCB3ZSBkb24ndCBoYXZlIGEgd2F5IG9mIHN0b3BwaW5nIHRo
ZSBzZWNvbmRhcnkKPj4+PiBoYXJ0cyBpbiBhIHJlY292ZXJhYmxlIHdheSwgc28gYXQgdGhpcyBw
b2ludCBJIGhhdmUgdHdvIG9wdGlvbnMsCj4+Pj4gZWl0aGVyIEknbSBnb2luZyB0byBjYWxsIHNt
cF9zZW5kX3N0b3AoKSBvbiBtYWNoaW5lX3NodXRkb3duKCkgYW5kCj4+Pj4gY29tZSBiYWNrIGZy
b20ga2V4ZWMgd2l0aCBhIHNpbmdsZSBoYXJ0IHJ1bm5pbmcgKHdoaWNoIHNob3VsZCBiZQo+Pj4+
IGZpbmUgZm9yIGtkdW1wIGJ0dyksIG9yIEkgbmVlZCB0byBoYXZlIGEgcmVzZXJ2ZWQgbWVtb3J5
IHNwYWNlIHdoZXJlCj4+Pj4gSSdsbCBoYXZlIHRvIGtlZXAgc29tZSBjb2RlIHRvIGJlIGV4ZWN1
dGVkIGJ5IHRoZSBzZWNvbmRhcnkgaGFydHMsCj4+Pj4gdGhhdCB3aWxsIGJlIHBhdGNoZWQgYnkg
dGhlIGJvb3QgaGFydCBvbmNlIHRoZSBuZXcga2VybmVsIGlzIGluCj4+Pj4gcGxhY2UsIHRvIGxl
dCB0aGVtIGV4ZWN1dGUgdGhlIG5ldyBrZXJuZWwuIFRoZSBzZWNvbmQgb3B0aW9uIGlzIHRvbwo+
Pj4+IGNvbXBsaWNhdGVkIGZvciBubyByZWFzb24gYW5kIGl0IGFsc28gcmVkdWNlcyB0aGUgZmxl
eGliaWxpdHkgb2YgdGhlCj4+Pj4gcHJvY2VzcyBzaW5jZSB3ZSBjYW4ndCB1c2UgdGhlIHdob2xl
IFJBTSBmb3IgdGhlIGxvYWRlZCBraW1hZ2UsIHBsdXMKPj4+PiBpdCB3aWxsIGJlIG9ic29sZXRl
IHdoZW4gd2UgaGF2ZSBwcm9wZXIgaGFuZGxpbmcgb2YgQ1BVIHN1c3BlbmQgLwo+Pj4+IHBlci1o
YXJ0IHJlc2V0LCB0aHJvdWdoIFNCSS4gU28gSSdtIGdvaW5nIGZvciB0aGUgZmlyc3Qgb3B0aW9u
IHVudGlsCj4+Pj4gdGhlbi4KPj4+PiAKPj4+PiBJJ2QgbGlrZSB0byBqdW1wLXN0YXJ0IHRoZSBk
aXNjdXNzaW9uIG9uIGhvdyB3ZSBjYW4gaGFuZGxlIHRoaW5ncwo+Pj4+IHRocm91Z2ggU0JJLCBt
eSBpbml0aWFsIHRocm91Z2ggd2FzIHRoaXM6Cj4+Pj4gCj4+Pj4gYSkgSGF2ZSBhIG5ldyBJUEkg
Y29kZSBJUElfU1VTUEVORCwgaGFuZGxlZCBieSB0aGUgZmlybXdhcmUgKGl0cwo+Pj4+IGNvZGUv
ZGF0YSBpcyBwZXJzaXN0ZW50IGFjcm9zcyBrZXhlY3MpLCB0aGF0IHB1dHMgdGhlIGhhcnQgb24g
YSB3ZmkKPj4+PiBsb29wLCBjaGVja2luZyBmb3IgYSB2YXJpYWJsZSB0aGF0IGNvbnRhaW5zIHRo
ZSBuZXcgdmlydHVhbCBhZGRyZXNzCj4+Pj4gdG8ganVtcCB0byAod2hlcmUgdGhlIG5ldyBrZXJu
ZWwgaXMgbG9jYXRlZCkgb24gdGhpcyBoYXJ0J3Mgc2NyYXRjaAo+Pj4+IGJ1ZmZlci4gQWx0ZXJu
YXRpdmVseSB0aGlzIGNhbGwgbWF5IGRvIHBvd2VyIG1hbmFnZW1lbnQgYW5kCj4+Pj4gY29tcGxl
dGVseSBzaHV0IGRvd24gdGhlIENQVSwgaWYgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIHRoaXMuCj4+
Pj4gCj4+Pj4gYikgSGF2ZSBhbm90aGVyIElQSSBjb2RlIElQSV9SRVNVTUUsIHRoYXQgd2FrZXMg
dXAgdGhlIGhhcnRzIGJ5Cj4+Pj4gcHJvdmlkaW5nIHRoZW0gd2l0aCB0aGUgdmlydHVhbCBhZGRy
ZXNzIHRvIGp1bXAgdG8uIFRoaXMgY2FuIGJlIGEKPj4+PiBzaW1wbGUgd3JpdGUgb2YgdGhlIG5l
dyBhZGRyZXNzIG9uIHRoZSByZW1vdGUgaGFydCdzIHNjcmF0Y2ggYnVmZmVyCj4+Pj4gKyBpbnRl
cnJ1cHQsIG9yIGl0IGNhbiB1c2UgcG93ZXIgbWFuYWdlbWVudCB0byBwb3dlciB1cCB0aGUgaGFy
dCBhbmQKPj4+PiBlaXRoZXIgcHJvdmlkZSBpdCB3aXRoIGEgbmV3IHJlc2V0IHZlY3Rvciwgb3Ig
ZG8gc29tZSBoYW5kbGluZyBvbgo+Pj4+IHRoZSBCb290Uk9NIGNvZGUgZm9yIHRoYXQgKHRoaXMg
YnR3IGlzIGFsc28gYW4gb3BlbiBkaXNjdXNzaW9uIG9uCj4+Pj4gdGhlIFRFRSBncm91cCB3aGVy
ZSB3ZSBhcmUgZGlzY3Vzc2luZyBTZWN1cmUgQm9vdCkuIEFsc28gaW4gY2FzZSB0aGUKPj4+PiBo
YXJ0IGlzIGFscmVhZHkgcnVubmluZyAoYW4gSVBJX1NVU1BFTkQgaGFzbid0IGJlZW4gc2VudCBv
biBpdAo+Pj4+IGJlZm9yZSwgZS5nLiBkdXJpbmcgYm9vdCksIHRoZSBmaXJtd2FyZSB3aWxsIGln
bm9yZSB0aGUgZXZlbnQsCj4+Pj4gYWx0ZXJuYXRpdmVseSB3ZSBtYXkgY2FsbCBJUElfU1VTUEVO
RCBvbiB0aGUgZmlybXdhcmUgZHVyaW5nIGJvb3Qgc28KPj4+PiB0aGF0IHRoZSBib290IHByb2Nl
c3MgaGFwcGVucyB3aXRoIGEgc2luZ2xlIGhhcnQgYW5kIG90aGVyIGhhcnRzCj4+Pj4gd2FpdCBm
b3IgdGhlIE9TIHRvIHdha2UgdGhlbSB1cC4KPj4+IAo+Pj4gTG9va3MgZ29vZCB0byBtZS4gSSBo
YWQgc2ltaWxhciBJUEkgYXBwcm9hY2goSVBJIFdBS0VVUCkgZm9yIGNwdQo+Pj4gaG90cGx1ZyBp
bXBsZW1lbnRhdGlvbiBleGNlcHQgdGhlIHJlc3VtZSBhZGRyZXNzIHJlcXVpcmVtZW50Lgo+Pj4g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOS82LzIxNCBbMl0KPj4+IAo+Pj4gVGhlIG9ubHkg
aXNzdWUgaXMgdGhhdCB3aXRoIGFsbCB0aGlzIElQSXMgd2lsbCBiZSByZWR1bmRhbnQgd2hlbiBo
YXJ0Cj4+PiBwb3dlciBtYW5hZ2VtZW50IFNCSSBleHRlbnNpb24gKGEgbXVjaCBjbGVhbmVyIGlu
dGVyZmFjZSkgd2lsbCBiZQo+Pj4gYXZhaWxhYmxlLiBNeSBob3RwbHVnIHBhdGNoIGlzIG9uIGhv
bGQgYmVjYXVzZSBvZiB0aGF0IHJlYXNvbiBhcyAKPj4+IHdlbGwuCj4+PiAKPj4+IAo+Pj4gUmVn
YXJkcywKPj4+IEF0aXNoCj4+PiAKPj4gCj4+IE15IHByb3Bvc2FsIGlzIGFib3V0IHRoZSBuZXcg
U0JJIEFQSS9leHRlbnNpb24sIGFzIEkgbWVudGlvbiB0aGVzZSBJUEkKPj4gY2FsbHMgaSdtIHRh
bGtpbmcgYWJvdXQgbmVlZCB0byBiZSBpbXBsZW1lbnRlZCBvbiB0aGUgZmlybXdhcmUgc2lkZSwK
Pj4gdGhleSB3b24ndCBiZSBoYW5kbGVkIGJ5IHRoZSBPUyBsaWtlIElQSV9TT0ZULiBTbyBzaW5j
ZSB5b3UgcHJlZmVyIHRvCj4+IGhhdmUgc2VwYXJhdGUgY2FsbHMgZm9yIGVhY2ggb2YgdGhlIGhh
cnQgc3RhdGVzIHRoZSBpZGVhIGlzOgo+PiAKPj4gc2JpX2hhcnRfc3VzcGVuZChjcHVtYXNrKSAt
PiBzZW5kIGFuIElQSV9TVVNQRU5EIHRvIGNwdXMgb24gY3B1bWFzawo+PiBzYmlfaGFydF9yZXN1
bWUoY3B1bWFzaykgLT4gc2VuZCBhbiBJUElfUkVTVU1FIHRvIGNwdXMgb24gY3B1bWFzawo+IAo+
IFRoZSBJUEkgdHlwZXMgYXJlIGN1cnJlbnRseSBub3QgZXhwb3NlZCBiZXR3ZWVuIExpbnV4IGFu
ZCB0aGUgZmlybXdhcmUKPiBhbmQgSSdkIGxpa2UgdG8ga2VlcCBpdCB0aGF0IHdheS4gIExldCdz
IGp1c3QgcHJvdG90eXBlIHRoZSBmaXJzdAo+IHZlcnNpb24gb2YgdGhlIGhhcnQgcG93ZXIgbWFu
YWdlbWVudCBleHRlbnNpb24gaW5zdGVhZC4gIEltcGxlbWVudGluZwo+IHRoZW0gaW4gdGhlIGZp
cm13YXJlIHZpYSBJUElzIGlzIHRoZSBvbmx5IHZhbGlkIG1lY2hhbmlzbSBvbiBvdXIKPiBleGlz
dGluZyBpbXBsZW1lbnRhdGlvbiwgYnV0IHRoZSBjb2RlcyBjYW4gc3RheSB3aXRoaW4gdGhlIGZp
cm13YXJlLgoKSSBoYWQgT3BlblNCSSBpbiBtaW5kIHdoZW4gSSBtZW50aW9uZWQgdGhlIElQSV8q
IGNvZGVzLCBJIHRvdGFsbHkgYWdyZWUgCndpdGggeW91IHRoZXNlIHNob3VsZG4ndCBiZSBleHBv
c2VkIC8gaGFuZGxlZCBieSB0aGUgT1MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
