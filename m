Return-Path: <SRS0=lw90=JS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2565C43460
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 13:10:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0494D61454
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 13:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0494D61454
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=st7Xfsov+6D6BY8DiYkOa213wb7WCnV8Aw0kBKvQJPQ=; b=LaORqF+nbQkNYTmUdV/wM5k1X
	TfstpmnNpIZCAWdRtnzTT3LWbXg7w/ulqLepOofqGwRGxIPhe1BgpALoPgWQnQBxVNDrRzRnmBBA2
	argqtUySjPL64/gfDnSZ7n4i4rQchRooTLI/2TfIKJ7KkgCdCt0GEdKh8VWkydActPUR3TBtHibBB
	51gEak405uThJAvSskw5wfEyE87+Pc6njmLHf1UywGfN/uoJ3VfNoZp+tKfTFOJnKnHKBZhi1yzjg
	d+dztB8GGoarXADL3XMsbb+5GpLsugcJF1xRg44nKk+2PbtggeEKt4CdVLEgRXqKIbcgwR6KdGDpH
	W/EGIXA1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCcg-00EQiq-3B; Wed, 21 Apr 2021 13:10:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCcb-00EQiI-5C; Wed, 21 Apr 2021 13:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0JRgoaw/+DxjwArJdpImvV2/5CL8nzkAFiBkL9j+Hiw=; b=ODBC0r54ujLUmoJX2U6v8urlNa
 zcIOvt6yCtac/GnidBEnS6xj9Vmu0U8slPoORLy+/3T1ouNwDsQqWCNa6O1LqJJu7VVPqM+X6/ORl
 6LqgFQgBgOnfy+8o8YxYt3sj0Q49lpqgzhmbXSbtyahn55lhBN014NDOGS6xBtolp6bJV6msL3rbz
 xy9CJfCUFIOq2ILCmHXd+OVM5FE6fgh6K7DmdEkBqTSK6IKEcfWPFgbRqxAMD+TKKqpukw/GJC4h0
 z5GTcQJr9PybR0Ol8nBf7J1dk5gPfx9J+t8OMPlbhpiAfKlSEuDhTZDIgVL7YvEaNy9LI4bLMQwXZ
 s2oJxG6Q==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCcU-00CtfG-NX; Wed, 21 Apr 2021 13:10:23 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQLWV02G6z9vBLd;
 Wed, 21 Apr 2021 15:10:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3N9b8eVAXEqi; Wed, 21 Apr 2021 15:10:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQLWT5ptNz9vBLc;
 Wed, 21 Apr 2021 15:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 04BB08B82B;
 Wed, 21 Apr 2021 15:10:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yvkEbdNGcAw4; Wed, 21 Apr 2021 15:10:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3C3C8B825;
 Wed, 21 Apr 2021 15:10:11 +0200 (CEST)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Quentin Monnet <quentin@isovalent.com>, Ian Rogers <irogers@google.com>,
 Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, paulburton@kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, grantseltzer@gmail.com,
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Luke Nelson <luke.r.nels@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 KP Singh <kpsingh@kernel.org>, iecedge@gmail.com,
 Simon Horman <horms@verge.net.au>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 tsbogend@alpha.franken.de, Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, Wang YanQing <udknight@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 bpf <bpf@vger.kernel.org>, Jianlin Lv <Jianlin.Lv@arm.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
Date: Wed, 21 Apr 2021 15:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061019_108920_1510C0C2 
X-CRM114-Status: GOOD (  23.49  )
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

CgpMZSAyMC8wNC8yMDIxIMOgIDA1OjI4LCBBbGV4ZWkgU3Rhcm92b2l0b3YgYSDDqWNyaXTCoDoK
PiBPbiBTYXQsIEFwciAxNywgMjAyMSBhdCAxOjE2IEFNIENocmlzdG9waGUgTGVyb3kKPiA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPj4KPj4KPj4KPj4gTGUgMTYvMDQvMjAy
MSDDoCAwMTo0OSwgQWxleGVpIFN0YXJvdm9pdG92IGEgw6ljcml0IDoKPj4+IE9uIFRodSwgQXBy
IDE1LCAyMDIxIGF0IDg6NDEgQU0gUXVlbnRpbiBNb25uZXQgPHF1ZW50aW5AaXNvdmFsZW50LmNv
bT4gd3JvdGU6Cj4+Pj4KPj4+PiAyMDIxLTA0LTE1IDE2OjM3IFVUQyswMjAwIH4gRGFuaWVsIEJv
cmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4KPj4+Pj4gT24gNC8xNS8yMSAxMTozMiBBTSwg
SmlhbmxpbiBMdiB3cm90ZToKPj4+Pj4+IEZvciBkZWJ1Z2dpbmcgSklUcywgZHVtcGluZyB0aGUg
SklUZWQgaW1hZ2UgdG8ga2VybmVsIGxvZyBpcyBkaXNjb3VyYWdlZCwKPj4+Pj4+ICJicGZ0b29s
IHByb2cgZHVtcCBqaXRlZCIgaXMgbXVjaCBiZXR0ZXIgd2F5IHRvIGV4YW1pbmUgSklUZWQgZHVt
cHMuCj4+Pj4+PiBUaGlzIHBhdGNoIGdldCByaWQgb2YgdGhlIGNvZGUgcmVsYXRlZCB0byBicGZf
aml0X2VuYWJsZT0yIG1vZGUgYW5kCj4+Pj4+PiB1cGRhdGUgdGhlIHByb2MgaGFuZGxlciBvZiBi
cGZfaml0X2VuYWJsZSwgYWxzbyBhZGRlZCBhdXhpbGlhcnkKPj4+Pj4+IGluZm9ybWF0aW9uIHRv
IGV4cGxhaW4gaG93IHRvIHVzZSBicGZfaml0X2Rpc2FzbSB0b29sIGFmdGVyIHRoaXMgY2hhbmdl
Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEppYW5saW4gTHYgPEppYW5saW4uTHZAYXJt
LmNvbT4KPj4+Pgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gRm9yIHdoYXQgaXQncyB3b3J0aCwgSSBo
YXZlIGFscmVhZHkgc2VlbiBwZW9wbGUgZHVtcCB0aGUgSklUIGltYWdlIGluCj4+Pj4ga2VybmVs
IGxvZ3MgaW4gUWVtdSBWTXMgcnVubmluZyB3aXRoIGp1c3QgYSBidXN5Ym94LCBub3QgZm9yIGtl
cm5lbAo+Pj4+IGRldmVsb3BtZW50LCBidXQgaW4gYSBjb250ZXh0IHdoZXJlIGJ1aWRpbmcvdXNp
bmcgYnBmdG9vbCB3YXMgbm90Cj4+Pj4gcG9zc2libGUuCj4+Pgo+Pj4gSWYgYnVpbGRpbmcvdXNp
bmcgYnBmdG9vbCBpcyBub3QgcG9zc2libGUgdGhlbiBtYWpvcml0eSBvZiBzZWxmdGVzdHMgd29u
J3QKPj4+IGJlIGV4ZXJjaXNlZC4gSSBkb24ndCB0aGluayBzdWNoIGVudmlyb25tZW50IGlzIHN1
aXRhYmxlIGZvciBhbnkga2luZAo+Pj4gb2YgYnBmIGRldmVsb3BtZW50LiBNdWNoIHNvIGZvciBK
SVQgZGVidWdnaW5nLgo+Pj4gV2hpbGUgYnBmX2ppdF9lbmFibGU9MiBpcyBub3RoaW5nIGJ1dCB0
aGUgZGVidWdnaW5nIHRvb2wgZm9yIEpJVCBkZXZlbG9wZXJzLgo+Pj4gSSdkIHJhdGhlciBudWtl
IHRoYXQgY29kZSBpbnN0ZWFkIG9mIGNhcnJ5aW5nIGl0IGZyb20ga2VybmVsIHRvIGtlcm5lbC4K
Pj4+Cj4+Cj4+IFdoZW4gSSBpbXBsZW1lbnRlZCBKSVQgZm9yIFBQQzMyLCBpdCB3YXMgZXh0cmVt
ZWx5IGhlbHBmdWxsLgo+Pgo+PiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCBmb3IgdGhlIHRpbWUg
YmVpbmcgYnBmdG9vbCBpcyBub3QgdXNhYmxlIGluIG15IGVudmlyb25tZW50IGJlY2F1c2UgaXQK
Pj4gZG9lc24ndCBzdXBwb3J0IGNyb3NzIGNvbXBpbGF0aW9uIHdoZW4gdGhlIHRhcmdldCdzIGVu
ZGlhbmVzcyBkaWZmZXJzIGZyb20gdGhlIGJ1aWxkaW5nIGhvc3QKPj4gZW5kaWFuZXNzLCBzZWUg
ZGlzY3Vzc2lvbiBhdAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjFlNjZhMDktNTE0
Zi1mNDI2LWI5ZTItMTNiYWFiMGI5MzhiQGNzZ3JvdXAuZXUvCj4+Cj4+IFRoYXQncyByaWdodCB0
aGF0IHNlbGZ0ZXN0cyBjYW4ndCBiZSBleGVyY2lzZWQgYmVjYXVzZSB0aGV5IGRvbid0IGJ1aWxk
Lgo+Pgo+PiBUaGUgcXVlc3Rpb24gbWlnaHQgYmUgY2FuZGlkIGFzIEkgZGlkbid0IGludmVzdGln
YXRlIG11Y2ggYWJvdXQgdGhlIHJlcGxhY2VtZW50IG9mICJicGZfaml0X2VuYWJsZT0yCj4+IGRl
YnVnZ2luZyBtb2RlIiBieSBicGZ0b29sLCBob3cgZG8gd2UgdXNlIGJwZnRvb2wgZXhhY3RseSBm
b3IgdGhhdCA/IEVzcGVjaWFsbHkgd2hlbiB1c2luZyB0aGUgQlBGCj4+IHRlc3QgbW9kdWxlID8K
PiAKPiB0aGUga2VybmVsIGRldmVsb3BlcnMgY2FuIGFkZCBhbnkgYW1vdW50IG9mIHByaW50ayBh
bmQgZHVtcHMgdG8gZGVidWcKPiB0aGVpciBjb2RlLAo+IGJ1dCBzdWNoIGRlYnVnZ2luZyBhaWQg
c2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBwcm9kdWN0aW9uIGtlcm5lbC4KPiBUaGF0IHN5c2N0
bCB3YXMgdHdvIHRoaW5ncyBhdCBvbmNlOiBkZWJ1Z2dpbmcgdG9vbCBmb3Iga2VybmVsIGRldnMg
YW5kCj4gaW50cm9zcGVjdGlvbiBmb3IgdXNlcnMuCj4gYnBmdG9vbCBqaXQgZHVtcCBzb2x2ZXMg
dGhlIDJuZCBwYXJ0LiBJdCBwcm92aWRlcyBKSVQgaW50cm9zcGVjdGlvbiB0byB1c2Vycy4KPiBE
ZWJ1Z2dpbmcgb2YgdGhlIGtlcm5lbCBjYW4gYmUgZG9uZSB3aXRoIGFueSBhbW91bnQgb2YgYXV4
aWxpYXJ5IGNvZGUKPiBpbmNsdWRpbmcgY2FsbGluZyBwcmludF9oZXhfZHVtcCgpIGR1cmluZyBq
aXRpbmcuCj4gCgpJIGdldCB0aGUgZm9sbG93aW5nIG1lc3NhZ2Ugd2hlbiB0cnlpbmcgdGhlIGNv
bW1hbmQgc3VnZ2VzdGVkIGluIHRoZSBwYXRjaCBtZXNzYWdlOgoKcm9vdEB2Z29pcDp+IyAuL2Jw
ZnRvb2wgcHJvZyBkdW1wIGppdGVkCkVycm9yOiBObyBsaWJiZmQgc3VwcG9ydAoKQ2hyaXN0b3Bo
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
