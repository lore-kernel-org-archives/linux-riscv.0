Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3BBC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 13:32:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600BE6143A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 13:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600BE6143A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iHQsejlv/gyCqfJlBjUcIckjSwXWBrt6c37y/bBaN0U=; b=GmGlAMlu3eRdZXR1eyR77AXFY
	nqDBx++ZQ+h06FAgc6i6Hly5MoodyUSJ0rAFabi94Lhnh3ODjLF6jqTH+/vyLJfoCqvfpDFFsNeDo
	+yuXVxAB5bIJEyBrlsFy7shn+6CtiUw5zIQmY3Gk9jl/g6elrys71VYatAfY2HA+023w6T5Jyupaj
	eKRyVK3EtVaUEO7qqDIUVraSq2pSClIlNbluGO+Kq6pPPaJAqvV3Z5F0037o6tMZBQy5Z5zpQaWFB
	xZjmOBmI8YH5iPuuY+PeIU33o+TfzrgOAWx/XmNwLrdVDMT19ZuG6e2w6lEddAjdE3k9l33sH1wLn
	CAw891zdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc6lv-005hf2-A2; Thu, 29 Apr 2021 13:32:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc6lr-005hdu-Jx
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 13:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=bGCNjr3er/3FHFKGFGqbonwhr/RqbFRVZkFsqPA2A+Q=; b=DfUykW6HJw0XDAZKFP3dJf2Fv7
 e3g8t45wJr55/rXgNJlt8IJ3unM4akUEwHnp5HkvA0x0Ep94HWSH5mUxJRGQfIME5EeHly8NdJ/+i
 +1SCPLmy+D28pdvasuvLYJ8/4twscfvS2nlHQ7TJPpgHwaIxEJs/ut+fjlwuewutRtz6gsuPDJPWV
 gqZXULfKDKUektmYbTuQ9jsoRINZtp7X+P8VEuedfu7i1070+Ki32G0NR63vgTfUlSrBNUrd+UIoF
 vWCNl5xwsT4i8AZd12Fs4DxfqNA6u/Htu9dYbHR2QWjkAFcbcM00Il7f/M54kiAUw7TqySOkXSKmI
 aEC256nQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc6lo-000edn-C6
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 13:31:58 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 34F5E240004;
 Thu, 29 Apr 2021 13:31:48 +0000 (UTC)
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 rppt@kernel.org, vitaly.wool@konsulko.com, greentime.hu@sifive.com,
 0x7f454c46@gmail.com, chenhuang5@huawei.com, linux-kernel@vger.kernel.org,
 kernel-team@android.com, linux@roeck-us.net
References: <mhng-2e1a7543-84bc-4954-843a-b577fc132157@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <890b2709-a317-9437-2d05-a94a64a03a3e@ghiti.fr>
Date: Thu, 29 Apr 2021 09:31:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-2e1a7543-84bc-4954-843a-b577fc132157@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_063156_711513_E1055D36 
X-CRM114-Status: GOOD (  19.73  )
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

TGUgNC8yOS8yMSDDoCAxMjo0MyBBTSwgUGFsbWVyIERhYmJlbHQgYSDDqWNyaXTCoDoKPiBPbiBX
ZWQsIDI4IEFwciAyMDIxIDAxOjI1OjU1IFBEVCAoLTA3MDApLCBhbGV4QGdoaXRpLmZyIHdyb3Rl
Ogo+PiBMZSA0LzI3LzIxIMOgIDExOjM0IFBNLCBQYWxtZXIgRGFiYmVsdCBhIMOpY3JpdMKgOgo+
Pj4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPj4+Cj4+
PiBYSVAgZGVwZW5kcyBvbiBNTVUsIGJ1dCBYSVBfRklYVVAgaXMgZGVmaW5lZCB0aHJvdWdob3V0
IHRoZSBrZXJuZWwgaW4KPj4+IG9yZGVyIHRvIGF2b2lkIGV4Y2Vzc2l2ZSBpZmRlZnMuwqAgVGhp
cyBqdXN0IG1ha2VzIHN1cmUgdG8gYWx3YXlzIGRlZmluZQo+Pj4gWElQX0ZJWElQLCB3aGljaCB3
aWxsIGZpeCBNTVU9biBidWlsZHMuCj4+Cj4+IEEgc21hbGwgdHlwbyBoZXJlLgo+IAo+IEFjdHVh
bGx5IHR3bzogImRlZmluZWQiIHNob3VsZCBoYXZlIGJlZW4gInVzZWQiLsKgIEJvdGggYXJlIGZp
eGVkLgo+IAo+Pgo+Pj4KPj4+IEZpeGVzOiA0NGM5MjI1NzI5NTIgKCJSSVNDLVY6IGVuYWJsZSBY
SVAiKQo+Pj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5j
b20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMjQg
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIAo+Pj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+Pj4gaW5kZXggMmYxMzg0ZTE0ZTMxLi5mZDc0OTM1MWY0MzIgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+IEBAIC03MywxOCArNzMsNiBAQAo+Pj4gwqAgI2VuZGlm
Cj4+PiDCoCAjZGVmaW5lIEZJWEFERFJfU1RBUlTCoMKgwqAgKEZJWEFERFJfVE9QIC0gRklYQURE
Ul9TSVpFKQo+Pj4KPj4+IC0jaWZkZWYgQ09ORklHX1hJUF9LRVJORUwKPj4+IC0jZGVmaW5lIFhJ
UF9PRkZTRVTCoMKgwqDCoMKgwqDCoCBTWl84TQo+Pj4gLSNkZWZpbmUgWElQX0ZJWFVQKGFkZHIp
ICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4+IC3CoMKgwqAgdWludHB0cl90IF9fYSA9ICh1aW50cHRyX3QpKGFkZHIpO8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqAgKF9fYSA+PSBDT05G
SUdfWElQX1BIWVNfQUREUiAmJiBfX2EgPCBDT05GSUdfWElQX1BIWVNfQUREUiArIAo+Pj4gU1pf
MTZNKSA/wqDCoMKgIFwKPj4+IC3CoMKgwqDCoMKgwqDCoCBfX2EgLSBDT05GSUdfWElQX1BIWVNf
QUREUiArIENPTkZJR19QSFlTX1JBTV9CQVNFIC0gCj4+PiBYSVBfT0ZGU0VUIDpcCj4+PiAtwqDC
oMKgwqDCoMKgwqAgX19hO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqAgfSkKPj4+IC0jZWxzZQo+Pj4gLSNk
ZWZpbmUgWElQX0ZJWFVQKGFkZHIpwqDCoMKgwqDCoMKgwqAgKGFkZHIpCj4+PiAtI2VuZGlmIC8q
IENPTkZJR19YSVBfS0VSTkVMICovCj4+PiAtCj4+PiDCoCAjZW5kaWYKPj4+Cj4+PiDCoCAjaWZu
ZGVmIF9fQVNTRU1CTFlfXwo+Pj4gQEAgLTEwMSw2ICs4OSwxOCBAQAo+Pj4gwqAgI2luY2x1ZGUg
PGFzbS9wZ3RhYmxlLTMyLmg+Cj4+PiDCoCAjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4+Pgo+
Pj4gKyNpZmRlZiBDT05GSUdfWElQX0tFUk5FTAo+Pj4gKyNkZWZpbmUgWElQX09GRlNFVMKgwqDC
oMKgwqDCoMKgIFNaXzhNCj4+Cj4+Cj4+IFhJUF9PRkZTRVQgaXMgdXNlZCBpbiBoZWFkLlMgYW5k
IHRoZW4gdGhpcyBicmVha3MgWElQX0tFUk5FTC4gWElQX09GRlNFVAo+PiBtdXN0IGxpdmUgb3V0
c2lkZSB0aGUgaWZuZGVmIF9fQVNTRU1CTFlfXy4KPiAKPiBUaGFua3MsIEkgaGFkbid0IGV2ZW4g
c2VlbiBYSVBfT0ZGU0VULsKgIFRoaXMgaXMgZml4ZWQgaW4gdGhlIHYyLgo+IAo+IERvIHlvdSBo
YXZlIGFuIFhJUCBjb25maWcgdGhhdCB3aWxsIHJ1biBvbiBRRU1VLCBhbmQgYSB3YXkgdG8gcnVu
IGl0PyBJZiAKPiBzbywgY2FuIHlvdSBwb3N0IGEgZGVmY29uZmlnIGFuZCBzb21lIGluc3RydWN0
aW9ucz/CoCBUaGF0J2xsIG1ha2UgaXQgCj4gZWFzaWVyIHRvIHRlc3Qgb24gbXkgZW5kLgo+IAoK
WWVzLCBJJ2xsIGRvIHRoYXQgbGF0ZXIgdG9kYXkgb3IgdG9tb3Jyb3cuCgo+Pj4gKyNkZWZpbmUg
WElQX0ZJWFVQKGFkZHIpICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4+ICvCoMKgwqAgdWludHB0cl90IF9fYSA9ICh1aW50cHRyX3Qp
KGFkZHIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+ICvCoMKg
wqAgKF9fYSA+PSBDT05GSUdfWElQX1BIWVNfQUREUiAmJiBfX2EgPCBDT05GSUdfWElQX1BIWVNf
QUREUiArIAo+Pj4gU1pfMTZNKSA/wqDCoMKgIFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2EgLSBD
T05GSUdfWElQX1BIWVNfQUREUiArIENPTkZJR19QSFlTX1JBTV9CQVNFIC0gCj4+PiBYSVBfT0ZG
U0VUIDpcCj4+PiArwqDCoMKgwqDCoMKgwqAgX19hO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+ICvCoMKgwqAgfSkKPj4+
ICsjZWxzZQo+Pj4gKyNkZWZpbmUgWElQX0ZJWFVQKGFkZHIpwqDCoMKgwqDCoMKgwqAgKGFkZHIp
Cj4+PiArI2VuZGlmIC8qIENPTkZJR19YSVBfS0VSTkVMICovCj4+PiArCj4+PiDCoCAjaWZkZWYg
Q09ORklHX01NVQo+Pj4gwqAgLyogTnVtYmVyIG9mIGVudHJpZXMgaW4gdGhlIHBhZ2UgZ2xvYmFs
IGRpcmVjdG9yeSAqLwo+Pj4gwqAgI2RlZmluZSBQVFJTX1BFUl9QR0TCoMKgwqAgKFBBR0VfU0la
RSAvIHNpemVvZihwZ2RfdCkpCj4+Pgo+Pgo+PiBUaGFuayB5b3UgZm9yIGRvaW5nIHRoYXQhCj4+
Cj4+IEFsZXgKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
