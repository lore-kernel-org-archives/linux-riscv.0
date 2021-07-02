Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE41C11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 15:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63600613F7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 15:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63600613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsvcZVl4aAB/SY0FkSwZEGyAtgBr11Cxquhvygprv3M=; b=ofBjAG4DWsiIIda+e8si4Vn/Zd
	SOAC2STBvFjN9TAYPBTZcRZEOXpncTYjpx1iBlVANZvod8KCJifZ3sLot4XNPmRQALQan6ZKMn/Ay
	ifZDdkxfh5REuXQdlVRW71xQdrQH0o4jebKRfcpth1l1pqsrtwzudCSKXadNB0bi34M/cHuuwylYj
	ey5EcYn94/hSSfzsEhvkSep76bnLmgPlm4yIIQcgUHu7VOhDvFm0is02XGTtcus0IESn3/tJKNlV+
	X4DIINlku81io003NGWTeVEp4RbwpIwaouAQMatP7o7dDyWlRaOjAvkja1tdBlotXJEv7a+wouVZL
	yiUJwKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzLXj-003TS1-GN; Fri, 02 Jul 2021 15:57:27 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLXW-003TOl-1g
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 15:57:16 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 162Fv1Jt051418
 for <linux-riscv@lists.infradead.org>; Fri, 2 Jul 2021 18:57:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1625241416; x=1627833416;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t0VSE4yvqzLzoGTJTNfADyTmW4ylvlyixsQMnViMXlE=;
 b=W1poDQWGMNUQdc02AMMYJSW6C6qUeRH/acUywkO/d4MD5tgcU/o9zF5+Py8WOclL
 trm5ZmcrwwzVK4p6jn0HpS5Fu2EVOWe5rdrsVUK5f4m856HJfHqlCAdFhMIzc8Mw
 qlXFnflYUcFaIFRQLtnAtTpR/RFAVQ6p2k+US/xgkE0dRnOb1QNb3VWB1skgzSuU
 IRGY4LBskN2z22ucXLRJ1hYPbxIYMyPjjcKxCvwTAikA6OF4CSPO5UuuqhQsc+B3
 hMWF7K5VDUgEyqADTZetuUeeyG9M8AujzOnpBfW+Nde7H1TsvLDIagHEjYiRLTXO
 zYReTKkrXBgvg7WKpeXrFQ==;
X-AuditID: 8b5b014d-96ef2700000067b6-a9-60df37486b8d
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 F8.F9.26550.8473FD06; Fri,  2 Jul 2021 18:56:56 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 18:56:55 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: robh+dt@kernel.org, mick@ics.forth.gr, geert@linux-m68k.org, Paul
 Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 frowand.list@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
Organization: FORTH
In-Reply-To: <mhng-6db38728-4f82-45bd-9b17-c41da55c41e9@palmerdabbelt-glaptop>
References: <mhng-6db38728-4f82-45bd-9b17-c41da55c41e9@palmerdabbelt-glaptop>
Message-ID: <008ddfd79d256dcddd7c802e4eef6b5a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42Lpjp6urOthfj/B4Mh+YYutv2exW7xf1sNo
 Mf/IOVaLmW/+s1k8u7WXyWLT42usFpd3zWGz2Pa5hc2i+d05douXl3uYLdpm8Vu07j3CbtFy
 x9SB12PNvDWMHm9evmTxONzxhd1j56y77B4PN11i8ti0qpPN49DhDkaPzUvqPS41X2f3+LxJ
 LoArissmJTUnsyy1SN8ugSvjVvNy5oJNghULWjuYGxj7+boYOTkkBEwk+tr3sXQxcnEICRxl
 lOhvuMQGkTCVmL23kxHE5hUQlDg58wkLiM0sYCEx9cp+RghbXqJ562xmEJtFQFXi2cmLYHE2
 AU2J+ZcOgtWLCKhLHHh9hxmi/iWTxK6/VSC2sICvxK+ZF9lBbH4BYYlPdy+ygticAn4SHS92
 Ad3AAXSQr8Tn6yYQJ7hI/N38lBXiNBWJD78fsIOUiALZm+cqTWAUnIXk0FlIDp2F5NAFjMyr
 GAUSy4z1MpOL9dLyi0oy9NKLNjGC44rRdwfj7c1v9Q4xMnEwHmKU4GBWEuENnXcvQYg3JbGy
 KrUoP76oNCe1+BCjNAeLkjgvr96EeCGB9MSS1OzU1ILUIpgsEwenVANT/6/LD0RTd+2v8D9Z
 96Z3S0fekS9aMs67BYLYbdo39SwyOb71rcM7LbW/DE0f7yo+992sIJvzO3rFnXaPTc1XGXZd
 ibz3dnrZef6tL765b70Y5RJqo79CNCzt6LO95r9nch91W/XLfW3P3lJxpZUb80ILRHPFDedZ
 HLm3siqiTjDszu8nuRosz+qVGDylIr1qfLoELjG9/aGksoN58q9So0tdp1jC/EqrNnW2boiV
 TZu+hV9l9dof9b1bCs+YbHvg49p+yMV/WhnrLLvJnHuU+2/9PJX74Uhb2baj36uLJ3Nv3PSQ
 XUT/SWbUT3EG1ZvJEa+eVJ3u1J2ulHjnuyyP+okfd4OCjFuzj3pE5hUqsRRnJBpqMRcVJwIA
 3+AlDBoDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_085714_483336_CF510D9A 
X-CRM114-Status: GOOD (  18.98  )
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

zqPPhM65z4IgMjAyMS0wNy0wMSAwNTo1MiwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFdlZCwgMTYgSnVuIDIwMjEgMDc6NDc6NDYgUERUICgtMDcwMCksIHJvYmgrZHRAa2VybmVs
Lm9yZyB3cm90ZToKPj4gT24gV2VkLCBKdW4gMTYsIDIwMjEgYXQgNDo0MyBBTSBOaWNrIEtvc3Np
ZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiAKPj4gd3JvdGU6Cj4+PiAKPj4+IM6jz4TOuc+CIDIw
MjEtMDYtMTYgMTA6NTYsIEdlZXJ0IFV5dHRlcmhvZXZlbiDOrc6zz4HOsc+IzrU6Cj4+PiA+Cj4+
PiA+IEkgY2FuJ3QgY29tbWVudCBvbiB0aGUgZHVwbGljYXRpb24gb24gYXJtNjQsIGJ1dCB0byBt
ZSwgL2Nob3Nlbgo+Pj4gPiBzb3VuZHMgbGlrZSB0aGUgbmF0dXJhbCBwbGFjZSBmb3IgYm90aCAi
bGludXgsZWxmY29yZWhkciIgYW5kCj4+PiA+ICJsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIi4g
IEZpcnN0IHJ1bGUgb2YgRFQgaXMgIkRUIGRlc2NyaWJlcwo+Pj4gPiBoYXJkd2FyZSwgbm90IHNv
ZnR3YXJlIHBvbGljeSIsIHdpdGggL2Nob3NlbiBkZXNjcmliaW5nIHNvbWUgc29mdHdhcmUKPj4+
ID4gY29uZmlndXJhdGlvbi4KPj4+ID4KPj4+IAo+Pj4gV2UgYWxyZWFkeSBoYXZlICJsaW51eCx1
c2FibGUtbWVtb3J5IiBvbiAvbWVtb3J5IG5vZGU6Cj4+PiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xMy1yYzYvc291cmNlL2RyaXZlcnMvb2YvZmR0LmMjTDEwMTEKPj4+IGFu
ZCBpdCBtYWtlcyBwZXJmZWN0IHNlbnNlIHRvIGJlIHRoZXJlIHNpbmNlIGl0IG92ZXJyaWRlcyAv
bWVtb3J5J3MgCj4+PiByZWcKPj4+IHByb3BlcnR5Lgo+Pj4gCj4+PiBXaHkgZGVmaW5lIGFub3Ro
ZXIgYmluZGluZyBmb3IgdGhlIHNhbWUgdGhpbmcgb24gL2Nob3NlbiA/Cj4+IAo+PiBHbyBsb29r
IGF0IHRoZSB0aHJlYWQgYWRkaW5nICJsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIi4gVGhlcmUg
d2VyZQo+PiBvbmx5IDM1IHZlcnNpb25zIG9mIGl0WzFdLiBJIHdhc24ndCBoYXBweSB3aXRoIGEg
Mm5kIHdheSBlaXRoZXIsIGJ1dAo+PiBhcyBJJ3ZlIG1lbnRpb25lZCBiZWZvcmUgd2UgZG9uJ3Qg
YWx3YXlzIGhhdmUgL21lbW9yeSBub2RlLgo+IAo+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQg
d2hhdCdzIGdvaW5nIG9uIGhlcmUsIGJ1dCBJSVVDIHdoYXQgSSBtZXJnZWQKPiBpbiA1LjEzIGRv
ZXNuJ3QgbWF0Y2ggdGhlIGJlaGF2aW9yIHRoYXQgb3RoZXIgYXJjaGl0ZWN0dXJlcyBoYXZlLiAg
SW4KPiB0aGF0IGNhc2UgSSdtIGhhcHB5IG1vdmluZyBSSVNDLVYgb3ZlciB0byB0aGUgbW9yZSBz
dGFuZGFyZCB3YXkgb2YKPiBkb2luZyB0aGluZ3MgYW5kIGp1c3QgY2FsbGluZyB3aGF0IHdlIGhh
dmUgaW4gNS4xMyBhIHNjcmV3dXAuCj4gCj4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24uCgpMb25n
IHN0b3J5IHNob3J0OgoKYSkgV2UgdXNlICJsaW51eCx1c2FibGUtbWVtb3J5IiBvbiAvbWVtb3J5
IG5vZGUgdG8gbGltaXQgdGhlIG1lbW9yeSBvZiAKdGhlIGtkdW1wIGtlcm5lbCwgaXQncyBhIHN0
YW5kYXJkIGJpbmRpbmcgZGVmaW5lZCBhdDoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjUuMTMtcmM2L3NvdXJjZS9kcml2ZXJzL29mL2ZkdC5jI0wxMDExCgpiKSBXZSB1c2VkIGEg
cmVzZXJ2ZWQgcmVnaW9uIChhZ2FpbiBhIHN0YW5kYXJkIGJpbmRpbmcpIG5hbWVkIAoibGludXgs
ZWxmY29yZWhkciIgd2hpY2ggaGFzIHRoZSBzYW1lIG5hbWUgYXMgYSBwcm9wZXJ0eSBvbiAvY2hv
c2VuIHVzZWQgCmJ5IGFybTY0IGZvciB0aGUgc2FtZSB0aGluZy4gV2l0aCB0aGlzIHBhdGNoIHdl
ICdsbCB1c2UgYXJtNjQncyAKYXBwcm9hY2gsIGFsdGhvdWdoIGl0J3MgYSBiaXQgd29yc2Ugc2lu
Y2Ugd2UnbGwgbmVlZCB0byBhZGQgdGhlIHNhbWUgCnJlZ2lvbiB0d2ljZSBvbiB0aGUgZmR0IChv
bmNlIGluIC9jaG9zZW4gYXMgYSBwcm9wZXJ0eSBhbmQgYW5vdGhlciBvbmUgCmluIHRoZSByZXNl
cnZhdGlvbiBtYXAgc28gdGhhdCBpdCBnZXRzIHJlc2VydmVkIGR1cmluZyBlYXJseSBib290KS4K
CkZvcnR1bmF0ZWx5IEkgKHN0aWxsKSBoYXZlbid0IHBvc3RlZCB0aGUga2V4ZWMtdG9vbHMgcGF0
Y2hlcyBvbiB0aGUgCm1haWxpbmcgbGlzdCBzbyB3ZSBkb24ndCBicmVhayB1c2Vyc3BhY2UgYnkg
ZG9pbmcgdGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
