Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C925CF3180
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B96CN1i3mHSEepm1MmDFahZrLoptFQWz185IhXox+1Q=; b=cOAQ3W+3R0UQxQ
	1dxpl89XcfBluPf13EPLH1Zg/OEkW2lsvT25q0xOvAA0qESHlBmslSuBCiMh24iOd0oEwGnsbIayH
	I1zNq6DCQnAvbFFC2ydTJRRireU3Jb3sMaS76fscR9yij5JymQeE8yjvo8SsP33Mf8AfVUjlEiJCt
	pBULOzpCEK188qo2XXvChlgWgEZiah+L/4dzRQQXXp4Iz59TGV9t2vjFd9a5F56Kg2Gs4LxYff7L2
	bDUURcHIwiMlrgPq0cCH9GzzKCGMUTioYyRpj0YiCtPSSShRCW2ddeIvGziX4rmnpnN/ECUhtKeee
	3RQmhfuZ4zwuUhjCtKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjyx-0000000446L-1GwC;
	Tue, 01 Oct 2024 21:00:31 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjyu-0000000445P-1sNn
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 21:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+0So0jtyAkK9Nmr0QnOAYyJ1G0FsvBN2cpdIHAK7ugQ=; b=JvOamwIke34xGC/aUYf2s/TBye
	PGe+uovoA7992JsGubNIAR6/TgaqK8aWfwtEjlSfHLXDM26RnAQ5EVb9x41BphAfPwSFnIPxsETfz
	Ir7TOPDWznxdYYoMYEANvdwUNFaxOfntdEUc6NwPR6V8PBQPf2V9j+qvciEAWmDxhh7zUj5TP6ogY
	fJ20yyvG8T6jVqCXVOq9XWzjSP9atfNvJg+U6yxtG30PSHGa7hlhM4wEXCnzZRP0t4cLl9v+N4eXU
	Iyj/ZpepdzcCCmcC4Q9MNTjMJAExvYKhNIxZQKKYq+Oy7i8qyLsf65fxUVnuXhk1sLrHY9VXSmW/e
	yOQHdcSQ==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1svjyp-007BBk-9i; Tue, 01 Oct 2024 22:00:23 +0100
Message-ID: <155ce5f8-083a-40b3-b38c-f01e0fbb5dde@codethink.co.uk>
Date: Tue, 1 Oct 2024 22:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
 <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
 <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
 <CAHBxVyGAJOXwws92M13vf-=+7Z2Nk0c8VjwsQ_YwMa0y+PgtoQ@mail.gmail.com>
 <2ab33735-8218-4cb4-ae8f-ecca27185f66@ghiti.fr>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2ab33735-8218-4cb4-ae8f-ecca27185f66@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_140028_591839_BC39FF2A 
X-CRM114-Status: GOOD (  22.64  )
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

T24gMDEvMTAvMjAyNCAxMDo0MSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIEF0aXNoLCBC
ZW4sCj4gCj4gT24gMTkvMDkvMjAyNCAwMToyMywgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6Cj4+
IE9uIFdlZCwgU2VwIDE4LCAyMDI0IGF0IDI6NTfigK9BTSBCZW4gRG9va3MgPGJlbi5kb29rc0Bj
b2RldGhpbmsuY28udWs+IAo+PiB3cm90ZToKPj4+IE9uIDE4LzA5LzIwMjQgMTA6NTUsIEF0aXNo
IFBhdHJhIHdyb3RlOgo+Pj4+IE9uIDkvMTcvMjQgNzowMSBBTSwgQmVuIERvb2tzIHdyb3RlOgo+
Pj4+PiBPbiAxNy8wOS8yMDI0IDE0OjQ2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+Pj4+IE9u
IFR1ZSwgMTcgU2VwIDIwMjQgMDY6MDg6NTAgUERUICgtMDcwMCksIGJlbi5kb29rc0Bjb2RldGhp
bmsuY28udWsKPj4+Pj4+IHdyb3RlOgo+Pj4+Pj4+IFRoaXMgaXMgYSBSRkMgc2VyaWVzIHRvIGNo
YW5nZSBob3cgdGhlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gdHJhcAo+Pj4+Pj4+IGlzIGhhbmRsZWQg
YW5kIHRoZW4gaG93IHRvIHRyYXAgUkRDWUNMRSBhbmQgZW11bGF0ZSBpdCB3aXRoIFJEVElNRQo+
Pj4+Pj4+IGluc3RlYWQuCj4+Pj4+PiBPbmx5IDEvMyBtYWRlIGl0IHRvIGxvcmUgZm9yIG1lLCBu
b3Qgc3VyZSBpZiBpdCdzIGp1c3Qgc3R1Y2sgCj4+Pj4+PiBzb21ld2hlcmUuCj4+Pj4+Pgo+Pj4+
Pj4+IEkgZGlkIHRoaXMgd2hlbiB3ZSBmb3VuZCBtdWx0aXBsZSBsaWJyYXJpZXMgdXNpbmcgUkRD
WUNMRSBhbmQKPj4+Pj4+PiB1cGdyYWRpbmcgbXVsdGlwbGUgcnVubmVycyB0byBuZXdlciBrZXJu
ZWxzIGNhdXNlZCBtYW55IHByb2JsZW1zCj4+Pj4+PiBPSywgc28gSSB0aGluayB3ZSdyZSBraW5k
IG9mIGp1c3Qgc3R1Y2sgd2l0aCBSRENZQ0xFIHRoZW4gLS0gaXQgd2FzCj4+Pj4+PiBwYXJ0IG9m
IHRoZSBiYXNlIElTQSB3aGVuIHdlIG1lcmdlZCB0aGUgcG9ydCwgYW5kIGV2ZXJ5IHRpbWUgaXQK
Pj4+Pj4+IGRpc2FwcGVhcnMgd2UgZW5kIHVwIGJyZWFraW5nIHVzZXJzcGFjZS4KPj4+Pj4gWWVz
LCBpdCB3YXMgYW4gYW5ub3lhbmNlLCB3ZSBtYW5hZ2VkIHRvIHRyYWNrIGRvd24gYWxsIHRoZSB1
c2VycyBhbmQKPj4+Pj4gcGF0Y2ggb3V0Lgo+Pj4+Pgo+Pj4+PiBJIHRob3VnaHQgdGhpcyBtaWdo
dCBiZSBhIHVzZWZ1bCBpZGVhIGZvciBtb3JlIGdlbmVyaWMgdHlwZSwgc28gbWlnaHQKPj4+Pj4g
bG9vayBhdCB1cGRhdGluZyB0byBoYXZlIGEgdGFibGUgb2YgaW5zdHJ1Y3Rpb24gbWFza3MgdG8g
Y2FsbC4KPj4+Pj4KPj4+Pj4+IEknbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgdGhlIHJpZ2h0IHdh
eSB0byBkbyB0aGlzIGlzOiBJSVJDIHRoZXJlJ3MKPj4+Pj4+IHNvbWUgcGVyZi1yZWxhdGVkIGhv
b2tzIGZvciB0aGlzLCBidXQgdGhlcmUncyBhbHNvIHN5c3RlbXMgdGhhdCBqdXN0Cj4+Pj4+PiBk
b24ndCBpbXBsZW1lbnQgdGhlIFJEQ1lDTEUgaW5zdHJ1Y3Rpb24gYXQgYWxsIGFuZCB0aHVzIHdl
J2xsIG5lZWQKPj4+Pj4+IHNvbWUgc29ydCBvZiBlbXVsYXRpb24gZm9yIHRob3NlLgo+Pj4+PiBJ
IGNvdWxkbid0IGdldCB0aGUgUE1VIGRyaXZlciB0byBhbGxvdyBpdCwgbm90IHN1cmUgaWYgdGhl
cmUgd2FzIGFuCj4+Pj4+IGlzc3VlIGhpZ2hlciB1cCBvciBzb21lIG90aGVyIGlzc3VlPwo+Pj4+
Pgo+Pj4+IEhlcmUgaXMgdGhlIHdheSB0byBwcm9wZXJseSBhbGxvdyBpdCB2aWEgdGhlIGRyaXZl
ci4KPj4+Pgo+Pj4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QKPj4+Pgo+Pj4+IENoZWNrIHRoZSBwZXJmX3VzZXJf
YWNjZXNzCj4+PiBEaWRuJ3Qgd29yayBmb3IgbWUsIG5vdCBzdXJlIHdoeQo+Pj4KPj4gK0FsZXhh
bmRyZSBHaGl0aQo+Pgo+PiBIbW0uIFRoYXQncyB3ZWlyZC4gTWF5YmUgc29tZSBidWcgY3JlcHQg
aW4gcmVjZW50bHkuIENhbiB5b3UgcHJvdmlkZQo+PiBzb21lIG1vcmUgZGV0YWlscwo+PiBvbiB0
aGUgcGxhdGZvcm0sIGtlcm5lbCB2ZXJzaW9uIGFuZCBwcm9jZWR1cmUgZm9sbG93ZWQgdG8gY2hh
bmdlIGl0ID8KPiAKPiAKPiBTbyBJIGhhdmUganVzdCB0cmllZCBwZXJmX3VzZXJfYWNjZXNzIG9u
IDYuMTEgYW5kIGl0IHdvcmtzIGZpbmUsIG1lYW5pbmcgCj4gc2V0dGluZyB0aGUgImxlZ2FjeSIg
YmVoYXZpb3VyIChpZSAyKSBhbGxvd3MgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gdG8gCj4gZGly
ZWN0bHkgYWNjZXNzIFJEQ1lDTEUuCj4gCj4gQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscyBC
ZW4/CgpJJ3ZlIGdvbmUgdGhyb3VnaCBhbmQgY2hlY2tlZCB0aGlzIGFnYWluLCBJIHRoaW5rIGl0
IGlzIHZlcnkgbGlrZWx5CnRoYXQgSSBnb3QgdGhlIGVuYWJsZSBhcyAxIGluc3RlYWQgb2YgMi4g
SXQgd29ya3Mgb24gUUVNVSwgSSd2ZSBub3QKZ290IGFjY2VzcyB0byB0aGUgcnVubmVycyB0aGF0
IHdlIHVwZ3JhZGVkIGFuZCB3ZSd2ZSBmaXhlZCB0aGUgaXNzdWUKYnkgdXBncmFkaW5nIGxpYmFi
c2wgdG8gYSBsYXRlciB2ZXJzaW9uLgoKVGhhbmtzLgoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8v
d3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3Zp
ZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
