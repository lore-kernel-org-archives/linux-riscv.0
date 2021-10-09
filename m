Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73C2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 13:25:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E8760F6C
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 13:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54E8760F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46eQNr9V90Qlw29vHXMTdqww+8tjjpXtNoEUrMT66qQ=; b=ovOnI4dyXKaoUoximvAONB51Ox
	Ez8aSLc18YrRBSjya9hKXqUw5HDKNZOET/Wb1z/AMLQxl5TzPC8gmWRvlWTPhY0oDFuvS1UeZj8Ao
	NCUrBUGgnKHme2+MDnyRzXwnnGZ0CEGWskN5RmSCpqioDkYlW0vbQpI3ONzRrwq+3wdWG8OS3+J5i
	U8j9IRnR7XKtZmLd8DFPZDBjZ8Dw4kFi9iqeIZsNS19PuZn5AKsPHl5Gtbb4kZWLdp75SI/lLlDtF
	WlmveatJypCq4u40qY0u+QKoaXZeXmGVNb7mL1YcNKneRnjtPVpLTsbK92qsmQwNsbJZhhSbPmC+j
	1xxKtcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZCLp-005e3b-CR; Sat, 09 Oct 2021 13:25:21 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZCLk-005e1y-AQ
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 13:25:18 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 199DPEai034048
 for <linux-riscv@lists.infradead.org>; Sat, 9 Oct 2021 16:25:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1633785909; x=1636377909;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LKgfWeR7ZhCTfdeuwvy2JeMeyWkTvqRR7ugkMIMnQl4=;
 b=dHfnCWgvOny+S1WEiB9lJDg8owB0nb3g1mDbYVEX2pJxMuhpmk3tPqFvOhaLgnQl
 r7GPRKDOdLFuOPapJCm7ywT/I5sEKMx44LoFO3ycH2UfA0qvZPScYzSnS233zyr2
 VWuUzyQ9A1OLscngKICsiQYvA0q9ndlqM/Xl1vtV0evCTuU2iBuZMoMPkiH/Cvkh
 z5Cz+efpJGL6aezFmyR6Po88wE1aF3wgDPeRN8wDVOustYQwfu+hF1pBrlSjz6lJ
 25c327kiIa9EOW1xXIjx5AuML0d+qlmo0r/Y94kV2dEKVgGEz1xf8wwfifj0p357
 hK2CJ19TASgIBjTQDHOtoQ==;
X-AuditID: 8b5b014d-b84f570000005d46-c7-616198350cae
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 55.96.23878.53891616; Sat,  9 Oct 2021 16:25:09 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 09 Oct 2021 16:25:05 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, ebiederm@xmission.com,
 kexec@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alexandre ghiti <alex@ghiti.fr>, rppt@kernel.org,
 geert+renesas@glider.be, Stephano Cetola <scetola@linuxfoundation.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>
Subject: Re: RISC-V: patched kexec-tools on github for review/testing
Organization: FORTH
In-Reply-To: <CA+zEjCscL1dWASm7u20p1B7-JeJaGTXiWG=K1XiWtZj=VFX+WQ@mail.gmail.com>
References: <00c521b5b872b06c9350145c7d39fe7c@mailhost.ics.forth.gr>
 <CA+zEjCs0n8KA_oaFKJbaP6kNohDA=qJHvUKhePUK+hDFJSbHig@mail.gmail.com>
 <CA+zEjCscL1dWASm7u20p1B7-JeJaGTXiWG=K1XiWtZj=VFX+WQ@mail.gmail.com>
Message-ID: <d75edc49681473bf8b88e474ae61b524@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsXSHT1dWdd0RmKiwdoDchbP7nxltVi36AKr
 xZMPE9ksFq34zmLxf1sLu8Xc2ZMYLXaf/spkcXnXHDaLbZ9b2Cya351jt3h5uYfZontltcWR
 9duZLGZ/WMLiwOcxq6GXzePNy5csHvdOTGP1mHhW1+PhpktMHptWdbJ57J+7ht1j85J6j8+b
 5Dx23n7I5NF+oJvJY8qhdpYAnigum5TUnMyy1CJ9uwSujFXPL7EW9MlXPP7yk7WB8aFEFyMn
 h4SAicS06z/Zuxi5OIQEjjJKfDmxjhEiYSoxe28nmM0rIChxcuYTFhCbWcBCYuqV/YwQtrxE
 89bZzCA2i4CqxN6l35lAbDYBTYn5lw6C1YsIGEs8PjGRGaJ+OYvE63OqILawgKvEzt17weL8
 AsISn+5eZAWxOQUCJW4/nsQCcdAlRonG35NYII5wkdizvY0Z4jgViQ+/HwBdzcEhCmRvnqs0
 gVFwFpJTZyE5dRaSUxcwMq9iFEgsM9bLTC7WS8svKsnQSy/axAiOPEbfHYy3N7/VO8TIxMF4
 iFGCg1lJhFfLJDFRiDclsbIqtSg/vqg0J7X4EKM0B4uSOC+v3oR4IYH0xJLU7NTUgtQimCwT
 B6dUA9PZ8C3nGMUlV+qLOVzsW1LBtPKc4WK3kEdb5lq/V7Z2WjfpRDp3ZOqV7XZ2Jy0v6Dk5
 /GTcLhqhniZmyqnR584R63rZcj2nzhebCeaCl1yfngpuOuHXksicFJ8laeCktpZ9q6DBoQAV
 Q937AXfe1Kd8Zb2/SdeyffL7ktMOmj1tb4JWF5159GHfpfdRH55Zll4TvuJvsXrH3+Mb/uvx
 zn/QupWj8NtWk9zsTpfeD1PtxCba7Tvn4rmHubdzml5X5F75V6oaTVeYpujM0FcL/vh/ze2H
 bjMFcwSCXRe47zJsXsm71Jlv5p42/vo9N6JunEv2Xd/9J/XkX/mJK5nPSSQ9+HHx9bQlx62n
 9kdGrFRiKc5INNRiLipOBACMBsx2KwMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_062516_747590_5E2EA9E8 
X-CRM114-Status: GOOD (  17.66  )
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

zqPPhM65z4IgMjAyMS0xMC0wNiAxNDoxMCwgQWxleGFuZHJlIEdoaXRpIM6tzrPPgc6xz4jOtToK
PiAKPiBTbyBJIGZvbGxvd2VkIHRoZSBpbnN0cnVjdGlvbnMgaGVyZToKPiBodHRwczovL2RvY3Vt
ZW50YXRpb24uc3VzZS5jb20vZnItZnIvc2xlcy8xMi1TUDMvaHRtbC9TTEVTLWFsbC9jaGEtdHVu
aW5nLWtleGVjLmh0bWwjY2hhLXR1bmluZy1rZXhlYy1iYXNpYy11c2FnZSwKPiBiZWxvdyB0aGUg
b3V0cHV0IG9uIGFuIFVubWF0Y2hlZCBib2FyZCB1c2luZyBhIHZtbGludXggc3RvcmVkIG9uIGEg
c2QKPiBjYXJkOgo+IAo+IHVidW50dUB1YnVudHU6fiQgc3VkbyBzYmluL2tleGVjIC1sIHZtbGlu
dXggLS1hcHBlbmQ9IiQoY2F0Cj4gL3Byb2MvY21kbGluZSkiIC0taW5pdHJkPS9ib290L2luaXRy
ZC5pbWcKPiBXYXJuaW5nOiBObyBjbWRsaW5lIHByb3ZpZGVkLCB1c2luZyBhcHBlbmQgc3RyaW5n
IGFzIGNtZGxpbmUKPiBXYXJuaW5nOiBObyBkdGIgcHJvdmlkZWQsIHVzaW5nIC9zeXMvZmlybXdh
cmUvZmR0Cj4gWyAxODEzLjQ3MjY3MV0gSU5GTzogdGFzayBrd29ya2VyLzE6MDo5ODggYmxvY2tl
ZCBmb3IgbW9yZSB0aGFuIDEyMCAKPiBzZWNvbmRzLgo+IFsgMTgxMy40Nzg3NTFdICAgICAgIE5v
dCB0YWludGVkIDUuMTUuMC1yYzErICMxNQo+IFsgMTgxMy40ODMxMTBdICJlY2hvIDAgPiAvcHJv
Yy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiCj4gZGlzYWJsZXMgdGhpcyBtZXNz
YWdlLgo+IENvdWxkIG5vdCBmaW5kIGEgZnJlZSBhcmVhIG9mIG1lbW9yeSBvZiAweDMwMDAgYnl0
ZXMuLi4KPiBsb2NhdGVfaG9sZSBmYWlsZWQKPiAKPiBJIHVzZWQgdGhlIFVidW50dSBrZXJuZWws
IHNvIHRoaXMgaXMgcHJldHR5IGxhcmdlOgo+IC1yd3hyd3hyLXggMSB1YnVudHUgdWJ1bnR1IDI3
N00gT2N0ICA1IDE1OjQ3IHZtbGludXgKPiAtcnctci0tci0tIDEgcm9vdCByb290IDk4TSBTZXAg
MjEgMDM6MjUgL2Jvb3QvaW5pdHJkLmltZwo+IAoKQUNLLCBJIGhhdmVuJ3QgdGVzdGVkIGluaXRy
ZCBtdWNoIFRCSCwgSSB1c3VhbGx5IGRvbid0IHVzZSBhbiBpbml0cmQsIAphbmQgd2hlbiBJIGRv
IGl0J3MgYSBzbWFsbCBidXN5Ym94LWJhc2VkIHJvb3Rmcy4KCj4gVGhlbiBpZiBJIGRvbid0IGxv
YWQgdGhlIGluaXRyZCAoSSBzb21ldGltZXMgaGF2ZSB0aGUgc2FtZSB3YXJuaW5nIGFzCj4gYWJv
dmUpIEkgY2FuIGF0IGxlYXN0IGtleGVjIHRoZSBuZXcga2VybmVsIGJ1dCBpdCBmYWlscyB0byBi
b290Ogo+IAo+IHVidW50dUB1YnVudHU6fiQgc3VkbyAuL3NiaW4va2V4ZWMgLWUKPiBXYXJuaW5n
OiBObyBjbWRsaW5lIG9yIGFwcGVuZCBzdHJpbmcgcHJvdmlkZWQKPiBXYXJuaW5nOiBObyBkdGIg
cHJvdmlkZWQsIHVzaW5nIC9zeXMvZmlybXdhcmUvZmR0Cj4gWy4uLl0KPiBbICAgIDAuMDAwMDAw
XSBTQkkgdjAuMiBIU00gZXh0ZW5zaW9uIGRldGVjdGVkCj4gWyAgICAwLjAwMDAwMF0gQ1BVIHdp
dGggaGFydGlkPTAgaXMgbm90IGF2YWlsYWJsZQo+IFsgICAgMC4wMDAwMDBdIC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IFsgICAgMC4wMDAwMDBdIGtlcm5lbCBCVUcgYXQg
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jOjEwNyEKPiBbICAgIDAuMDAwMDAwXSBLZXJuZWwg
QlVHIFsjMV0KPiBbICAgIDAuMDAwMDAwXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAgIDAuMDAw
MDAwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS4xNS4wLXJjMSsg
IzE1Cj4gWyAgICAwLjAwMDAwMF0gSGFyZHdhcmUgbmFtZTogU2lGaXZlIEhpRml2ZSBVbm1hdGNo
ZWQgQTAwIChEVCkKPiBbICAgIDAuMDAwMDAwXSBlcGMgOiBzZXR1cF9zbXArMHhjYy8weDE0Mgo+
IFsgICAgMC4wMDAwMDBdICByYSA6IHNldHVwX3NtcCsweGM0LzB4MTQyCj4gWyAgICAwLjAwMDAw
MF0gZXBjIDogZmZmZmZmZmY4MGEwNDA4MCByYSA6IGZmZmZmZmZmODBhMDQwNzggc3AgOgo+IGZm
ZmZmZmZmODE4MDNlYzAKPiBbICAgIDAuMDAwMDAwXSAgZ3AgOiBmZmZmZmZmZjgxYTIzMjIwIHRw
IDogZmZmZmZmZmY4MTgxMDUwMCB0MCA6Cj4gZmZmZmZmZmY4MWEzNTUxZgo+IFsgICAgMC4wMDAw
MDBdICB0MSA6IGZmZmZmZmZmZmZmZmZmZmYgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDoKPiBm
ZmZmZmZmZjgxODAzZjAwCj4gWyAgICAwLjAwMDAwMF0gIHMxIDogMDAwMDAwMDAwMDAwMDAwMCBh
MCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOgo+IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuMDAw
MDAwXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAwMSBhNCA6Cj4g
MDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC4wMDAwMDBdICBhNSA6IGZmZmZmZmZmODBjNjQ1MDAg
YTYgOiAwMDAwMDAwMDAwMDAwMDA0IGE3IDoKPiAwMDAwMDAwMDAwMDBmZjAwCj4gWyAgICAwLjAw
MDAwMF0gIHMyIDogMDAwMDAwMDAwMDAwMDAwNSBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOgo+
IGZmZmZmZmZmODExOGY5YTgKPiBbICAgIDAuMDAwMDAwXSAgczUgOiAwMDAwMDAwMDAwMDAwMDA3
IHM2IDogZmZmZmZmZmY4MGMwYjc5MCBzNyA6Cj4gMDAwMDAwMDA4MDAwMDIwMAo+IFsgICAgMC4w
MDAwMDBdICBzOCA6IDAwMDAwMDAwMDAwMDBmZmYgczkgOiAwMDAwMDAwMDgxMDAwMjAwIHMxMDoK
PiAwMDAwMDAwMDAwMDAwMDE4Cj4gWyAgICAwLjAwMDAwMF0gIHMxMTogMDAwMDAwMDAwMDAwMDAw
YiB0MyA6IDAwMDAwMDAwMDBmZjAwMDAgdDQgOgo+IGZmZmZmZmZmZmZmZmZmZmYKPiBbICAgIDAu
MDAwMDAwXSAgdDUgOiBmZmZmZmZmZjgwYzBiN2EwIHQ2IDogZmZmZmZmZmY4MTgwM2JkOAo+IFsg
ICAgMC4wMDAwMDBdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAw
MDAwMDAwCj4gY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDMKPiBbICAgIDAuMDAwMDAwXSBbPGZmZmZm
ZmZmODBhMDQwODA+XSBzZXR1cF9zbXArMHhjYy8weDE0Mgo+IFsgICAgMC4wMDAwMDBdIFs8ZmZm
ZmZmZmY4MGEwM2Q4OD5dIHNldHVwX2FyY2grMHg1NmEvMHg1OTAKPiBbICAgIDAuMDAwMDAwXSBb
PGZmZmZmZmZmODBhMDBhYTI+XSBzdGFydF9rZXJuZWwrMHhhYS8weGE1Ywo+IFsgICAgMC4wMDAw
MDBdIHJhbmRvbTogZ2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbQo+IG9vcHNfZXhpdCsweDQ0
LzB4NzAgd2l0aCBjcm5nX2luaXQ9MAo+IFsgICAgMC4wMDAwMDBdIC0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQo+IFsgICAgMC4wMDAwMDBdIEtlcm5lbCBwYW5pYyAtIG5vdCBz
eW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCB0aGUgaWRsZSAKPiB0YXNrIQo+IFsgICAgMC4wMDAw
MDBdIC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2ls
bAo+IHRoZSBpZGxlIHRhc2shIF0tLS0KPiAKPiBUaGlzIHJlbGlhYmx5IGZhaWxzIGhlcmUuCj4g
CgpUaGlzIGxvb2tzIHdlaXJkLCBJJ2xsIGNoZWNrIGl0IG91dCAod2UgaGF2ZSBhbiB1bm1hdGNo
ZWQgaGVyZSBzbyBJJ2xsIAp0cnkgdG8gZ2V0IG15IGhhbmRzIG9uIGl0IHNvbWV0aW1lIG5leHQg
d2VlaykuCgpEaWQgeW91IHRyeSBrZHVtcCA/IERvIHlvdSBnZXQgdGhlIHNhbWUgZXJyb3IgPwoK
QlRXIHRoaXMgaXMgd2hhdCBJIHVzZSBmb3IgdGVzdGluZyBtb3N0IG9mIHRoZSB0aW1lOgoKRm9y
IGtleGVjOgprZXhlYyAtbCAvbW50L3NoYXJlZC92bWxpbnV4IC0tcmV1c2UtY21kbGluZQprZXhl
YyAtZQoKRm9yIGtkdW1wOgprZXhlYyAtcCAvbW50L3NoYXJlZC92bWxpbnV4CmVjaG8gYyA+IC9w
cm9jL3N5c3JxLXRyaWdnZXIKClRoYW5rcyBhIGxvdCBmb3IgeW91ciB0aW1lICEKClJlZ2FyZHMs
Ck5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
