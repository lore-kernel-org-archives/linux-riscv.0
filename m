Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFD7C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jGF5m/igxsuFiQKEy0GBdWDR8HqOKUzzu8vT4C7yME=; b=tKMbb92IAb8wTC
	mrzLohkQ8AADr0pyw8Y6RJBjrLZbbEuGqYI7P09FkZFr8LQdVvJpau9f+qy4ZQtIAIgdIKextZ9K0
	P7e5cg0KQEHgyVTNN5prifeerHoN9hO2eP1x8uC53MT3pYPo98csNbZVUVrkrXcd9hRDZI7APLOZ9
	B4SS3M/C0C5LSgpqQCiOsLBio91lbG3fO49nP6trmK+FPzwYwHyClToUStyC3dqNo/fOQTgtCbyW/
	cT7u5uz77y5KvyJJBuy9BtogZAjMEVpAbCCEELPp9uxMiQ3cZGDDCC5pxNAb+JIoXmaolMYIMlcOE
	gX+DjYK+YNvKGj9W3Ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1D7-0000000BTat-30IC;
	Thu, 20 Aug 2026 11:45:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1D7-0000000BTae-07Rb
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 11:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6896743CF7
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 11:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6331F00AC4
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787226328;
	bh=hBVCbdn3EEHFDipkM52+ES86DnnMbe9gd2U25NMqEbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ld/J46QTq+sUbtovv+en3C/LSKMAogmu4UjaPHCxgW2nfY57tx8t3PD46s9NgUcKJ
	 NChEwAMAkqTSm94qCinNk75xGp/2x162FU2/Hwx2GROgNylzG7G3X2TlCnsTNS5X9Y
	 A4oq6CzzPjwEKL6YWQTQzEMSs4evVfIiuTu5JL+Lp3SBbDKfAkK1x2gBycs0Od3WOi
	 VYMtuYmVtMMSy7FREr6tv7hHnIN7LkX82RPK0CzaeK7rrPsh0tuDDA027Sa4EwYufc
	 Y93CCES/6c6uQVT/jxUnKfumcGmzTDEEwy+hB88Xn9dhkRh3w8damBfdSLj4nzTR5O
	 2YDYVoIvudp3g==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-481412f1828so854241f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 04:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpFvDrgC5ftc0Nj1GWeT9DhiW/u64F4U8ZgInwoDdPbVbrRrPeKjs1kNzf4+2n9RXwsV3hs090B89M+yA==@lists.infradead.org
X-Gm-Message-State: AFuF++lVqSjzsTiVtsaSrAWAUkzgw3LD3Y84n9OWVrI12pNvcgv64v6o
	LNMve/Q65ATMDEtXPL8Y+d7YJyH2uC5HMylrrgNRv1qUDVfgMu1rvUzxfeJj1AtulM4jNIrOMII
	z/mj2jFZJapTj60LEarrAYXHnp9CGzNc=
X-Received: by 2002:a05:6000:1445:b0:482:9dc6:16c4 with SMTP id
 ffacd0b85a97d-482b1e83abdmr18437712f8f.1.1787226326941; Thu, 20 Aug 2026
 04:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260820063233.2567-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260820063233.2567-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Aug 2026 19:45:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ-_kSrtV_rpoMK2pKPM3q-CmgDwyX111XvM9oJ=oyDxg@mail.gmail.com>
X-Gm-Features: AcwNN1XdGt6Og7pbvA5AWf8snjRkbQz-gJqB8zUegZGNFED00Q9cedb9vkScv6s
Message-ID: <CAJF2gTQ-_kSrtV_rpoMK2pKPM3q-CmgDwyX111XvM9oJ=oyDxg@mail.gmail.com>
Subject: Re: [PATCH] riscv: ptrace: reject CFI regset access when extensions
 are absent
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, oleg@redhat.com, debug@rivosinc.com, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjAsIDIwMjYgYXQgMjozMuKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gcmlzY3ZfY2ZpX2dldCgpIGFuZCByaXNjdl9jZmlfc2V0
KCkgZG8gbm90IGNoZWNrIHdoZXRoZXIgdGhlIFppY2ZpbHAKPiBvciBaaWNmaXNzIGV4dGVuc2lv
bnMgYXJlIHByZXNlbnQuIE9uIHN5c3RlbXMgd2l0aG91dCB0aGVtLAo+IFBUUkFDRV9HRVRSRUdT
RVQgb24gUkVHU0VUX0NGSSBzdGlsbCBzdWNjZWVkcyBhbmQgcmV0dXJucyBhIHplcm9lZAo+IHVz
ZXJfY2ZpX3N0YXRlLCBtaXNsZWFkaW5nIGRlYnVnZ2VycyBpbnRvIGJlbGlldmluZyB0aGUgcmVn
aXN0ZXIgc2V0Cj4gaXMgYXZhaWxhYmxlLCBhbmQgUFRSQUNFX1NFVFJFR1NFVCBzaWxlbnRseSBh
Y2NlcHRzIHdyaXRlcyB0aGF0IGhhdmUKPiBubyBlZmZlY3QgKGUuZy4gY2xlYXJpbmcgU1JfRUxQ
KS4KPgo+IFJlamVjdCB0aGUgYWNjZXNzIHdpdGggLUVJTlZBTCB3aGVuIG5laXRoZXIgYnJhbmNo
IGxhbmRpbmcgcGFkcyBub3IKPiBzaGFkb3cgc3RhY2sgaXMgYXZhaWxhYmxlIHRvIHVzZXJzcGFj
ZSwgdXNpbmcgdGhlIHNhbWUgYXZhaWxhYmlsaXR5Cj4gaGVscGVycyBhcyB0aGUgcHJjdGwgcGF0
aC4KPgo+IEZpeGVzOiAyYWY3YzljZjAyMWMgKCJyaXNjdi9wdHJhY2U6IGV4cG9zZSByaXNjdiBD
Rkkgc3RhdHVzIGFuZCBzdGF0ZSB2aWEgcHRyYWNlIGFuZCBpbiBjb3JlIGZpbGVzIikKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0Bs
aW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiBUaGlzIGZvbGxvd3MgdGhlIGJlaGF2aW91ciBvZiB0
aGUgYXJtNjQgR0NTIHJlZ3NldC4gVW5saWtlIHZlY3Rvcgo+IHJlZ2lzdGVycywgbm8gRU5PREFU
QSBjYXNlIGFwcGxpZXMgaGVyZTogdGhlIENGSSBzdGF0dXMgcmVnc2V0IGhhcyBhCj4gdmFsaWQg
YWxsLXplcm8gcmVwcmVzZW50YXRpb24gZXZlbiB3aGVuIENGSSBoYXMgbm90IGJlZW4gZW5hYmxl
ZCBmb3IKPiB0aGUgdHJhY2VkIHRhc2suCj4KPiBpc191c2VyX2xwYWRfZW5hYmxlZCgpL2lzX3Vz
ZXJfc2hzdGtfZW5hYmxlZCgpIGFyZSB1c2VkIGluc3RlYWQgb2YgYQo+IHBsYWluIElTQSBjaGVj
ayBzbyB0aGF0IHRoZSByZWdzZXQgdmlzaWJpbGl0eSBtYXRjaGVzIHdoYXQgdXNlcnNwYWNlCj4g
Y2FuIGFjdHVhbGx5IHVzZSB2aWEgcHJjdGw6IGJvdGggaGVscGVycyBhbHNvIGhvbm9yIHRoZQo+
IHJpc2N2X25vdXNlcmNmaSBrZXJuZWwgY29tbWFuZCBsaW5lIHN3aXRjaC4KPgo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9wdHJhY2UuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gaW5kZXggZjMzNmExODM2NjdlLi41NjY4NTZlNDJm
NjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+IEBAIC0yOTksNiArMjk5LDkgQEAgc3RhdGljIGludCBy
aXNjdl9jZmlfZ2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICAgICAgICAgc3RydWN0
IHVzZXJfY2ZpX3N0YXRlIHVzZXJfY2ZpOwo+ICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3M7
Cj4KPiArICAgICAgIGlmICghaXNfdXNlcl9scGFkX2VuYWJsZWQoKSAmJiAhaXNfdXNlcl9zaHN0
a19lbmFibGVkKCkpCkRvIHlvdSB3YW50OgoKLyogSWYgc2hhZG93IHN0YWNrIGlzIG5vdCBzdXBw
b3J0ZWQgb3Igbm90IGVuYWJsZWQsIG5vdGhpbmcgdG8gLi4uICovCmlmICghaXNfdXNlcl9zaHN0
a19lbmFibGVkKCkgfHwgIWlzX3Noc3RrX2VuYWJsZWQodHNrKSkKCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgICAgIG1lbXNldCgmdXNlcl9jZmksIDAsIHNpemVv
Zih1c2VyX2NmaSkpOwo+ICAgICAgICAgcmVncyA9IHRhc2tfcHRfcmVncyh0YXJnZXQpOwo+Cj4g
QEAgLTMzNyw2ICszNDAsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2NmaV9zZXQoc3RydWN0IHRhc2tf
c3RydWN0ICp0YXJnZXQsCj4gICAgICAgICBzdHJ1Y3QgdXNlcl9jZmlfc3RhdGUgdXNlcl9jZmk7
Cj4gICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVnczsKPgo+ICsgICAgICAgaWYgKCFpc191c2Vy
X2xwYWRfZW5hYmxlZCgpICYmICFpc191c2VyX3Noc3RrX2VuYWJsZWQoKSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgICAgICAgcmVncyA9IHRhc2tfcHRfcmVncyh0
YXJnZXQpOwo+Cj4gICAgICAgICByZXQgPSB1c2VyX3JlZ3NldF9jb3B5aW4oJnBvcywgJmNvdW50
LCAma2J1ZiwgJnVidWYsICZ1c2VyX2NmaSwgMCwgLTEpOwo+IC0tCj4gMi41MC4xCj4KCgotLSAK
QmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
