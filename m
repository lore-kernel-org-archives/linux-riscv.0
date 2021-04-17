Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094EDC433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 08:17:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B00611AF
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 08:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B00611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7eXKpFQBfpkk5W6hqFXBG0qvffAk8I7uNKco0bRBpk=; b=lm74KzEYcBfhG3LG/+UfP866s
	zUF/wgzENUNI9tF1wNyOtT4JOsVTqHwEBLZukZ7NRvmlrM3dLsIjB5ImqY8eZXPcOI/IFiX4EFf49
	/MYJpwmoQjzfMukdQdRNtivAS2bSILJgJGj4sy+lqpHS4MlrJAlXxk2K77hHQ+yCm6rn5nm59K9Fy
	WRHY027fL/vhK0q08wwig3g1sPgBWjYOOqeRosPozADIAnOpct/ogij+S3ogfbl11CY05o5YIMuEo
	7txR7Uf5H3J7lTmnW3V6eDr+lIjQdZ+AQDko6EWpyjJaFuHyxCLyfKwU31U6NNUZnEDBzmoY742YM
	kbcDRjjgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXg8C-004kN6-8V; Sat, 17 Apr 2021 08:16:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXg85-004kM7-Nm; Sat, 17 Apr 2021 08:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=DGj4/AfWt6t8Mp0zpo745urhL3LCeVZTEyZplVBIOs4=; b=jKNWaeiBLiEW78rsi4qnOYOtWf
 qUyNqmAZxzw+nyduq2e+E8J0iC58KlxZfxuufYjWoJqDLzex9znudCzr9OhzuMW7rh5VdVW/6Uprx
 Ov1peWmYev/FlHqB9BJDBBB+vyepX8u62kNQIkUVuqWVEWus2dLI+MgU1cyqh7zcA9mDcOZZO2p0B
 pDiAAGKvejkWsOfFs4gNjE0kYORWNVAXQ3DDhnokauR9cXlbAcSgwW6LyAAPVK/wcCyVRayOZBCB1
 VP+3NKQawNNpm6kgr4XEpxNWKgDEpgHsaCnwPRLcOD5oDlC8LNJtJwfoAYQFuzy9TjE51e2BFYy+X
 wJ3PEQzQ==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXg81-009w7f-Kw; Sat, 17 Apr 2021 08:16:36 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMmBL3J3fz9vBnF;
 Sat, 17 Apr 2021 10:16:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wonQJcvXPfFi; Sat, 17 Apr 2021 10:16:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMmBL1x8Xz9vBn9;
 Sat, 17 Apr 2021 10:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3776F8B778;
 Sat, 17 Apr 2021 10:16:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eGIdiAD4X9M2; Sat, 17 Apr 2021 10:16:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BFFF8B75B;
 Sat, 17 Apr 2021 10:16:24 +0200 (CEST)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Quentin Monnet <quentin@isovalent.com>
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
Date: Sat, 17 Apr 2021 10:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_011634_026251_D82BD45E 
X-CRM114-Status: GOOD (  17.57  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDAxOjQ5LCBBbGV4ZWkgU3Rhcm92b2l0b3YgYSDDqWNyaXTCoDoK
PiBPbiBUaHUsIEFwciAxNSwgMjAyMSBhdCA4OjQxIEFNIFF1ZW50aW4gTW9ubmV0IDxxdWVudGlu
QGlzb3ZhbGVudC5jb20+IHdyb3RlOgo+Pgo+PiAyMDIxLTA0LTE1IDE2OjM3IFVUQyswMjAwIH4g
RGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4KPj4+IE9uIDQvMTUvMjEgMTE6
MzIgQU0sIEppYW5saW4gTHYgd3JvdGU6Cj4+Pj4gRm9yIGRlYnVnZ2luZyBKSVRzLCBkdW1waW5n
IHRoZSBKSVRlZCBpbWFnZSB0byBrZXJuZWwgbG9nIGlzIGRpc2NvdXJhZ2VkLAo+Pj4+ICJicGZ0
b29sIHByb2cgZHVtcCBqaXRlZCIgaXMgbXVjaCBiZXR0ZXIgd2F5IHRvIGV4YW1pbmUgSklUZWQg
ZHVtcHMuCj4+Pj4gVGhpcyBwYXRjaCBnZXQgcmlkIG9mIHRoZSBjb2RlIHJlbGF0ZWQgdG8gYnBm
X2ppdF9lbmFibGU9MiBtb2RlIGFuZAo+Pj4+IHVwZGF0ZSB0aGUgcHJvYyBoYW5kbGVyIG9mIGJw
Zl9qaXRfZW5hYmxlLCBhbHNvIGFkZGVkIGF1eGlsaWFyeQo+Pj4+IGluZm9ybWF0aW9uIHRvIGV4
cGxhaW4gaG93IHRvIHVzZSBicGZfaml0X2Rpc2FzbSB0b29sIGFmdGVyIHRoaXMgY2hhbmdlLgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlhbmxpbiBMdiA8Smlhbmxpbi5MdkBhcm0uY29tPgo+
Pgo+PiBIZWxsbywKPj4KPj4gRm9yIHdoYXQgaXQncyB3b3J0aCwgSSBoYXZlIGFscmVhZHkgc2Vl
biBwZW9wbGUgZHVtcCB0aGUgSklUIGltYWdlIGluCj4+IGtlcm5lbCBsb2dzIGluIFFlbXUgVk1z
IHJ1bm5pbmcgd2l0aCBqdXN0IGEgYnVzeWJveCwgbm90IGZvciBrZXJuZWwKPj4gZGV2ZWxvcG1l
bnQsIGJ1dCBpbiBhIGNvbnRleHQgd2hlcmUgYnVpZGluZy91c2luZyBicGZ0b29sIHdhcyBub3QK
Pj4gcG9zc2libGUuCj4gCj4gSWYgYnVpbGRpbmcvdXNpbmcgYnBmdG9vbCBpcyBub3QgcG9zc2li
bGUgdGhlbiBtYWpvcml0eSBvZiBzZWxmdGVzdHMgd29uJ3QKPiBiZSBleGVyY2lzZWQuIEkgZG9u
J3QgdGhpbmsgc3VjaCBlbnZpcm9ubWVudCBpcyBzdWl0YWJsZSBmb3IgYW55IGtpbmQKPiBvZiBi
cGYgZGV2ZWxvcG1lbnQuIE11Y2ggc28gZm9yIEpJVCBkZWJ1Z2dpbmcuCj4gV2hpbGUgYnBmX2pp
dF9lbmFibGU9MiBpcyBub3RoaW5nIGJ1dCB0aGUgZGVidWdnaW5nIHRvb2wgZm9yIEpJVCBkZXZl
bG9wZXJzLgo+IEknZCByYXRoZXIgbnVrZSB0aGF0IGNvZGUgaW5zdGVhZCBvZiBjYXJyeWluZyBp
dCBmcm9tIGtlcm5lbCB0byBrZXJuZWwuCj4gCgpXaGVuIEkgaW1wbGVtZW50ZWQgSklUIGZvciBQ
UEMzMiwgaXQgd2FzIGV4dHJlbWVseSBoZWxwZnVsbC4KCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQs
IGZvciB0aGUgdGltZSBiZWluZyBicGZ0b29sIGlzIG5vdCB1c2FibGUgaW4gbXkgZW52aXJvbm1l
bnQgYmVjYXVzZSBpdCAKZG9lc24ndCBzdXBwb3J0IGNyb3NzIGNvbXBpbGF0aW9uIHdoZW4gdGhl
IHRhcmdldCdzIGVuZGlhbmVzcyBkaWZmZXJzIGZyb20gdGhlIGJ1aWxkaW5nIGhvc3QgCmVuZGlh
bmVzcywgc2VlIGRpc2N1c3Npb24gYXQgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMWU2
NmEwOS01MTRmLWY0MjYtYjllMi0xM2JhYWIwYjkzOGJAY3Nncm91cC5ldS8KClRoYXQncyByaWdo
dCB0aGF0IHNlbGZ0ZXN0cyBjYW4ndCBiZSBleGVyY2lzZWQgYmVjYXVzZSB0aGV5IGRvbid0IGJ1
aWxkLgoKVGhlIHF1ZXN0aW9uIG1pZ2h0IGJlIGNhbmRpZCBhcyBJIGRpZG4ndCBpbnZlc3RpZ2F0
ZSBtdWNoIGFib3V0IHRoZSByZXBsYWNlbWVudCBvZiAiYnBmX2ppdF9lbmFibGU9MiAKZGVidWdn
aW5nIG1vZGUiIGJ5IGJwZnRvb2wsIGhvdyBkbyB3ZSB1c2UgYnBmdG9vbCBleGFjdGx5IGZvciB0
aGF0ID8gRXNwZWNpYWxseSB3aGVuIHVzaW5nIHRoZSBCUEYgCnRlc3QgbW9kdWxlID8KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
