Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mOHHXY30XDqUv/BncljMGzO6dd1loaaFcL6Dgn03ms=; b=sl0/LxWfJJ20St
	VG3WsAyZ6vLs7AmdrJBsC3BeZF8soUxBlMXjFHKX126KI6DubICSJ2B5tXTWrVAA8m1BTlpSRdvjN
	yIAjsBwgTi8d/UCdF3sw+3tZhNizYOamhOSmRcCHlalYc1/UhojuDLF25Yn7nd4oYEsXFl9fhlEDP
	eqWVVnXlcfi+EEHEw/YnAgWPZETI7YFytPueyY2Z44JM9lAQZlK75YDu7BMRRcIG4uWmwNfGylJEu
	UuFsaTKo2m4otiHfPuxdI1nVpEmAkj/E4dJGN9g8XBugsXjITNzVMRXyg/bhtuTRrO5mYVlHqOkcT
	z8DB8fX6z2kmBNINyEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCT63-009ZWO-4f; Tue, 25 Jan 2022 21:11:23 +0000
Received: from outbound-ss-761.bluehost.com ([74.220.211.250])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCT5z-009ZSg-Md
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 21:11:21 +0000
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
 by progateway8.mail.pro1.eigbox.com (Postfix) with ESMTP id 3D7381004932D
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 21:11:06 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59]) by cmsmtp with ESMTP
 id CT5ln5dhEwm8iCT5ln50IZ; Tue, 25 Jan 2022 21:11:06 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=DpSTREz+ c=1 sm=1 tr=0 ts=61f0676a
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=DghFqjY3_ZEA:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=eFWqtd3rAAAA:8
 a=tBb2bbeoAAAA:8 a=h0uksLzaAAAA:8 a=W-_n0kkjAAAA:8 a=BouTL1r6kgS_ZzKWE9cA:9
 a=QEXdDO2ut3YA:10:nop_charset_2 a=OmE4rGSwGH90ucjH_eFs:22
 a=Oj-tNtZlA1e06AYgeCfH:22 a=MSi_79tMYmZZG2gvAgS0:22 a=qeNa2pbTr82C0GpJEZFS:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWOkGwXKalirvDlhGoXrr7N1kHlpsTkkyxGyIlZUW2I=; b=auTzbuQjEdMeBZq+n+7UshnKHn
 8OJLxyeBzFQZy+YI8z2/oLmbC1X3sHbP15V/gzHdE2ZvqXMm38deynzur5qpBWfPbNX7I+W/4Z77G
 IhkHRFNUiQG9z3gYhKTiEhaL1;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:51656
 helo=[10.0.1.23]) by box5620.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <re@w6rz.net>)
 id 1nCT5k-0049Qa-N6; Tue, 25 Jan 2022 14:11:04 -0700
Message-ID: <1200181c-9380-5405-0b37-4fbc49f6c095@w6rz.net>
Date: Tue, 25 Jan 2022 13:11:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
 <CAOnJCULjqeL9Q27n=g19ALbOivzid6pc_gYv6JUF4iP=64kJ-Q@mail.gmail.com>
 <CAMuHMdWBF0XXXQLfAH81F=BczjsDeQFU454_A2C_-qLPKJGpiQ@mail.gmail.com>
From: Ron Economos <re@w6rz.net>
In-Reply-To: <CAMuHMdWBF0XXXQLfAH81F=BczjsDeQFU454_A2C_-qLPKJGpiQ@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1nCT5k-0049Qa-N6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.23])
 [73.162.232.9]:51656
X-Source-Auth: re@w6rz.net
X-Email-Count: 5
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_131119_919809_36F35490 
X-CRM114-Status: GOOD (  17.14  )
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

T24gMS8yNS8yMiAxMjo1MiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEF0aXNoLAo+
Cj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQgOToxNyBQTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0
aXNocGF0cmEub3JnPiB3cm90ZToKPj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQgMTI6MTIgUE0g
R2VlcnQgVXl0dGVyaG9ldmVuCj4+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+PiBP
biBUaHUsIEphbiAyMCwgMjAyMiBhdCAxMDoxMiBBTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4+Pj4gQ3VycmVudGx5LCBTQkkgQVBJcyBhY2NlcHQgYSBoYXJ0bWFz
ayB0aGF0IGlzIGdlbmVyYXRlZCBmcm9tIHN0cnVjdAo+Pj4+IGNwdW1hc2suIENwdW1hc2sgZGF0
YSBzdHJ1Y3R1cmUgY2FuIGhvbGQgdXB0byBOUl9DUFVzIHZhbHVlLiBUaHVzLCBpdAo+Pj4+IGlz
IG5vdCB0aGUgY29ycmVjdCBkYXRhIHN0cnVjdHVyZSBmb3IgaGFydGlkcyBhcyBpdCBjYW4gYmUg
aGlnaGVyCj4+Pj4gdGhhbiBOUl9DUFVzIGZvciBwbGF0Zm9ybXMgd2l0aCBzcGFyc2Ugb3IgZGlz
Y29udGd1b3VzIGhhcnRpZHMuCj4+Pj4KPj4+PiBSZW1vdmUgYWxsIGFzc29jaWF0aW9uIGJldHdl
ZW4gaGFydGlkIG1hc2sgYW5kIHN0cnVjdCBjcHVtYXNrLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IChGb3IgTGludXggUklTQy1WIGNoYW5n
ZXMpCj4+Pj4gQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IChGb3Ig
S1ZNIFJJU0MtViBjaGFuZ2VzKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgo+Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cg
Y29tbWl0IDI2ZmI3NTFjYTM3ODQ2YzkgKCJSSVNDLVY6Cj4+PiBEbyBub3QgdXNlIGNwdW1hc2sg
ZGF0YSBzdHJ1Y3R1cmUgZm9yIGhhcnRpZCBiaXRtYXAiKSBpbiB2NS4xNy1yYzEuCj4+Pgo+Pj4g
SSBhbSBoYXZpbmcgYW4gaXNzdWUgd2l0aCByYW5kb20gdXNlcnNwYWNlIFNFR1ZzIG9uIFN0YXJs
aWdodCBCZXRhCj4+PiAod2hpY2ggbmVlZHMgb3V0LW9mLXRyZWUgcGF0Y2hlcykuICBJdCBkb2Vz
bid0IGFsd2F5cyBtYW5pZmVzdAo+Pj4gaXRzZWxmIGltbWVkaWF0ZWx5LCBzbyBpdCB0b29rIGEg
d2hpbGUgdG8gYmlzZWN0LCBidXQgSSBzdXNwZWN0IHRoZQo+Pj4gYWJvdmUgY29tbWl0IHRvIGJl
IHRoZSBjdWxwcml0Lgo+PiBJIGhhdmUgbmV2ZXIgc2VlbiBvbmUgYmVmb3JlIGR1cmluZyBteSB0
ZXN0aW5nLiBIb3cgZnJlcXVlbnRseSBkbyB5b3Ugc2VlIHRoZW0/Cj4+IERvZXMgaXQgaGFwcGVu
IHdoaWxlIHJ1bm5pbmcgYW55dGhpbmcgb3IganVzdCBpZGxlIHVzZXIgc3BhY2UgcmVzdWx0cwo+
PiBpbiBTRUdWcyByYW5kb21seS4KPiBTb21ldGltZXMgdGhleSBoYXBwZW4gZHVyaW5nIHN0YXJ0
dXAgKGxvdHMgb2YgZmFpbHVyZXMgZnJvbSBzeXN0ZW1kKSwKPiBzb21ldGltZXMgdGhleSBoYXBw
ZW4gbGF0ZXIsIGR1cmluZyBpbnRlcmFjdGl2ZSB3b3JrLgo+IFNvbWV0aW1lcyB3aGlsZSBpZGxl
LCBhbmQgc29tZXRoaW5nIHJ1bnMgaW4gdGhlIGJhY2tncm91bmQgKGUuZy4gbWFuZGIpLgo+Cj4+
IERvIHlvdSBoYXZlIGEgdHJhY2UgdGhhdCBJIGNhbiBsb29rIGludG8gPwo+ICMgYXB0IHVwZGF0
ZQo+IFsgIDgwNy40OTkwNTBdIGFwdFsyNThdOiB1bmhhbmRsZWQgc2lnbmFsIDExIGNvZGUgMHgx
IGF0Cj4gMHhmZmZmZmY4MzAwMDYwMDIwIGluIGxpYmFwdC1wa2cuc28uNi4wLjBbM2ZhNDlhYzAw
MCsxNzQwMDBdCj4gWyAgODA3LjUwOTU0OF0gQ1BVOiAwIFBJRDogMjU4IENvbW06IGFwdCBOb3Qg
dGFpbnRlZAo+IDUuMTYuMC1zdGFybGlnaHQtMTExOTItZzI2ZmI3NTFjYTM3OC1kaXJ0eSAjMTUz
Cj4gWyAgODA3LjUxODY3NF0gSGFyZHdhcmUgbmFtZTogQmVhZ2xlViBTdGFybGlnaHQgQmV0YSAo
RFQpCj4gWyAgODA3LjUyNDA3N10gZXBjIDogMDAwMDAwM2ZhNGE0N2EwYSByYSA6IDAwMDAwMDNm
YTRhNDc5ZmMgc3AgOgo+IDAwMDAwMDNmY2I0YjM5YjAKPiBbICA4MDcuNTMxMzgzXSAgZ3AgOiAw
MDAwMDAyYWRjZWY0ODAwIHRwIDogMDAwMDAwM2ZhNDMyODdiMCB0MCA6Cj4gMDAwMDAwMDAwMDAw
MDAwMQo+IFsgIDgwNy41Mzg2MDNdICB0MSA6IDAwMDAwMDAwMDAwMDAwMDkgdDIgOiAwMDAwMDAw
MDAwMDAwM2ZmIHMwIDoKPiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgODA3LjU0NTg4N10gIHMxIDog
MDAwMDAwMmFkY2YzY2I2MCBhMCA6IDAwMDAwMDAwMDAwMDAwMDMgYTEgOgo+IDAwMDAwMDAwMDAw
MDAwMDAKPiBbICA4MDcuNTUzMTY3XSAgYTIgOiAwMDAwMDAzZmNiNGIzYTMwIGEzIDogMDAwMDAw
MDAwMDAwMDAwMCBhNCA6Cj4gMDAwMDAwMmFkY2YzY2MxYwo+IFsgIDgwNy41NjAzOTBdICBhNSA6
IDAwMDcwMDAzMDAwNjAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAzIGE3IDoKPiAxOTk5OTk5OTk5
OTk5OTk5Cj4gWyAgODA3LjU2NzY1NF0gIHMyIDogMDAwMDAwM2ZjYjRiM2EyOCBzMyA6IDAwMDAw
MDAwMDAwMDAwMDIgczQgOgo+IDAwMDAwMDNmY2I0YjNhMzAKPiBbICA4MDcuNTc1MDM5XSAgczUg
OiAwMDAwMDAzZmE0YmFhODEwIHM2IDogMDAwMDAwMDAwMDAwMDAxMCBzNyA6Cj4gMDAwMDAwMmFk
Y2YxOWE0MAo+IFsgIDgwNy41ODIzNjNdICBzOCA6IDAwMDAwMDNmY2I0YjQwMTAgczkgOiAwMDAw
MDAzZmE0YmFhODEwIHMxMDoKPiAwMDAwMDAzZmNiNGIzZTkwCj4gWyAgODA3LjU4OTYwNl0gIHMx
MTogMDAwMDAwM2ZhNGIyYTUyOCB0MyA6IDAwMDAwMDAwMDAwMDAwMDAgdDQgOgo+IDAwMDAwMDNm
YTQ3OTA2YTAKPiBbICA4MDcuNTk2ODkxXSAgdDUgOiAwMDAwMDAwMDAwMDAwMDA1IHQ2IDogZmZm
ZmZmZmZmZmZmZmZmZgo+IFsgIDgwNy42MDIzMDJdIHN0YXR1czogMDAwMDAwMDIwMDAwNDAyMCBi
YWRhZGRyOiBmZmZmZmY4MzAwMDYwMDIwCj4gY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKPgo+ICgt
ZGlydHkgZHVlIHRvIFN0YXJsaWdodCBEVFMgYW5kIGRyaXZlciB1cGRhdGVzKQo+Cj4gR3J7b2V0
amUsZWV0aW5nfXMsCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+IC0tCgpJ
J20gbm90IHN1cmUgaWYgaXQncyByZWxhdGVkLCBidXQgSSdtIGFsc28gc2VlaW5nIGEgc3lzdGVt
ZCBzZWdmYXVsdCBvbiAKYm9vdCB3aXRoIHRoZSBIaUZpdmUgVW5tYXRjaGVkIGFuZCA1LjE3LjAt
cmMxLiBJIGRvbid0IGhhdmUgdGhlIGRtZXNnIApkdW1wLCBidXQgaGVyZSdzIHRoZSBqb3VybmFs
Y3RsIGR1bXAuIEl0IHdhcyBidWlsdCBiZWZvcmUgdGhlIHRhZywgc28gaXQgCnNheXMgNS4xNi4w
LgoKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQgc3lzdGVtZC11ZGV2ZFs1NTFdOiBtbWNibGswcDEy
OiBGYWlsZWQgdG8gd2FpdCAKZm9yIHNwYXduZWQgY29tbWFuZCAnL3Vzci9iaW4vdW5zaGFyZSAt
bSAvdXNyL2Jpbi9zbmFwIGF1dG8taW1wb3J0IAotLW1vdW50PS9kZXYvbW1jYmxrMHAxMic6IElu
dmFsaWQgYXJndW1lbnQKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQgc3lzdGVtZC11ZGV2ZFs0MTJd
OiBtbWNibGswcDEyOiBQcm9jZXNzIAonL3Vzci9iaW4vdW5zaGFyZSAtbSAvdXNyL2Jpbi9zbmFw
IGF1dG8taW1wb3J0IC0tbW91bnQ9L2Rldi9tbWNibGswcDEyJyAKdGVybWluYXRlZCBieSBzaWdu
YWwgU0VHVi4KSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQga2VybmVsOiBzeXN0ZW1kLXVkZXZkWzU1
MV06IHVuaGFuZGxlZCBzaWduYWwgMTEgCmNvZGUgMHgxIGF0IDB4MDAwMDAwMDAwMzkzODcwMCBp
biB1ZGV2YWRtWzNmYTdlZWUwMDArYjEwMDBdCkphbiAyMyAwMjo0MTo1MCByaXNjdjY0IGtlcm5l
bDogQ1BVOiAyIFBJRDogNTUxIENvbW06IHN5c3RlbWQtdWRldmQgTm90IAp0YWludGVkIDUuMTYu
MCAjMQpKYW4gMjMgMDI6NDE6NTAgcmlzY3Y2NCBrZXJuZWw6IEhhcmR3YXJlIG5hbWU6IFNpRml2
ZSBIaUZpdmUgVW5tYXRjaGVkIApBMDAgKERUKQpKYW4gMjMgMDI6NDE6NTAgcmlzY3Y2NCBrZXJu
ZWw6IGVwYyA6IDAwMDAwMDNmYTdmMTQxMDQgcmEgOiAKMDAwMDAwM2ZhN2YxNDEwMiBzcCA6IDAw
MDAwMDNmZTNkYTUzMjAKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQga2VybmVsOsKgIGdwIDogMDAw
MDAwM2ZhN2ZjM2VmOCB0cCA6IAowMDAwMDAzZmE3OWY4NTMwIHQwIDogMDAwMDAwM2ZlM2RhMzhm
MApKYW4gMjMgMDI6NDE6NTAgcmlzY3Y2NCBrZXJuZWw6wqAgdDEgOiAwMDAwMDAzZmE3ZjA0MjVj
IHQyIDogCjAwMDAwMDAwMDAwMDAwMDAgczAgOiAwMDAwMDAzZmNkMDQ2ZDg4CkphbiAyMyAwMjo0
MTo1MCByaXNjdjY0IGtlcm5lbDrCoCBzMSA6IDAwMDAwMDNmY2QwNDZkNjAgYTAgOiAKZmZmZmZm
ZmZmZmZmZmZmZiBhMSA6IDAwMDAwMDNmY2QwY2IzMzAKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQg
a2VybmVsOsKgIGEyIDogMDAwMDAwM2ZjZDA0MzAyOCBhMyA6IAowMDAwMDAwMDAwMDAwMDA3IGE0
IDogYzk4YjZhMTgxM2U0NmQwMApKYW4gMjMgMDI6NDE6NTAgcmlzY3Y2NCBrZXJuZWw6wqAgYTUg
OiBmZmZmZmZmZmZmZmZmZmZmIGE2IDogCmZlZmVmZWZlZmVmZWZlZmYgYTcgOiAwMDAwMDAwMDAw
MDAwMDM5CkphbiAyMyAwMjo0MTo1MCByaXNjdjY0IGtlcm5lbDrCoCBzMiA6IDAwMDAwMDAwMDAw
MDAwMDAgczMgOiAKZmZmZmZmZmZmZmZmZmZlYSBzNCA6IDAwMDAwMDAwMDAwMDAwMDAKSmFuIDIz
IDAyOjQxOjUwIHJpc2N2NjQga2VybmVsOsKgIHM1IDogMDAwMDAwM2ZlM2RhNTM3OCBzNiA6IApm
ZmZmZmZmZmZmZmZmZmVhIHM3IDogMDAwMDAwMDAwMzkzODcwMApKYW4gMjMgMDI6NDE6NTAgcmlz
Y3Y2NCBrZXJuZWw6wqAgczggOiAwMDAwMDAzZmUzZGE1M2UwIHM5IDogCjAwMDAwMDNmZTNkYTUz
ZDggczEwOiAwMDAwMDAzZmE3ZmMyMDBjCkphbiAyMyAwMjo0MTo1MCByaXNjdjY0IGtlcm5lbDrC
oCBzMTE6IDAwMDAwMDAwMDAwODEwMDAgdDMgOiAKMDAwMDAwM2ZhN2RiMzgyMiB0NCA6IDAwMDAw
MDAwMDAwMDAwMDAKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQga2VybmVsOsKgIHQ1IDogMDAwMDAw
M2ZlM2RhMzhjOCB0NiA6IDAwMDAwMDAwMDAwMDAwMmEKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQg
a2VybmVsOiBzdGF0dXM6IDAwMDAwMDAyMDAwMDQwMjAgYmFkYWRkcjogCjAwMDAwMDAwMDM5Mzg3
MDAgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKSmFuIDIzIDAyOjQxOjUwIHJpc2N2NjQgc3lzdGVt
ZC11ZGV2ZFs0MTJdOiBtbWNibGswcDEyOiBGYWlsZWQgdG8gd2FpdCAKZm9yIHNwYXduZWQgY29t
bWFuZCAnL3Vzci9iaW4vdW5zaGFyZSAtbSAvdXNyL2Jpbi9zbmFwIGF1dG8taW1wb3J0IAotLW1v
dW50PS9kZXYvbW1jYmxrMHAxMic6IElucHV0L291dHB1dCBlcnJvcgpKYW4gMjMgMDI6NDE6NTAg
cmlzY3Y2NCBzeXN0ZW1kLXVkZXZkWzQxMl06IG1tY2JsazBwMTI6IEZhaWxlZCB0byAKZXhlY3V0
ZSAnL3Vzci9iaW4vdW5zaGFyZSAtbSAvdXNyL2Jpbi9zbmFwIGF1dG8taW1wb3J0IAotLW1vdW50
PS9kZXYvbW1jYmxrMHAxMicsIGlnbm9yaW5nOiBJbnB1dC9vdXRwdXQgZXJyb3IKCkknbGwgdHJ5
IHJlbW92aW5nIHRoaXMgcGF0Y2guCgpSb24KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
