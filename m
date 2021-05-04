Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA7AC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 07:20:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D3A611AC
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 07:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D3A611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iAwCI26uItxG1mARglwAvvPTNfxHZhDPeOll2Ekjxw=; b=ZZKIlETsAq2NSrdNDvfrtRr8g
	DfStZWKkShuKjlyXuwYK+Jteigb5RJ28yDdzArEXJ22g9FKS5GUBM9JLQFEtg1vnvS6IMC5xSqHh1
	0DYD1nG1HjIGoLEkiob08gFrLpBe2BlWzJkZ4R/x42eiP9rMn497x06eFHMOMCerp3zmGwiLAcanx
	BBvL/mLDPuhj3Y7pExlUu+Q3fk8eeKApOnZiJq/N2IRczUco0roKUmF7zfN47k3EKdyBdME8Jzd0k
	ve613ZjDK15wq3ESWFD07t+frYBrsX54EWbLnfXey+MGvxBO+rc/If1RKaaACWj2hkqtS3xJyppIc
	ueiFtwvsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpLw-00Fc1e-1N; Tue, 04 May 2021 07:20:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpLt-00Fc1Y-FM
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 07:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=JggnRH2z+C5c6q5fwkNF9u7IZivIlxcnTgChvJQFvSA=; b=oSAU0p4K/Kt/OLQ3zng3pRPSXG
 tQaTHS3N8BZM/YP0Y4Fb17xzHSHVYKU/NXamn0bicEiHUr9Hh4H3X5iVtsdYOBb8C+Zk+7Yhudat2
 XkXy8+8/+4rpSeFLFuEjJ8QT6MSEMLgyqd6R2kSq3CBsfbV4vCdh7T4jUCful3dtRYTLN8lQnauz/
 /eSx2+SkSoqqbSg4E8PwcFVGxnd8OqALijjugsiRSIhq1M35yg82nX70edND2Dmvk89tWSx16BXKt
 eKOkWLGWoLolyEbMwwSevRl4N7JfRfi++2vx9fAt+nwgakLUXwCI+6+7xRrQOXL4lcKl0d4PuATcA
 B7WZYMbg==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpLq-003l7u-90
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 07:20:16 +0000
Received: by mail-qk1-x72f.google.com with SMTP id 76so5815650qkn.13
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JggnRH2z+C5c6q5fwkNF9u7IZivIlxcnTgChvJQFvSA=;
 b=csBKU8aJUh6TfQKqWkRRJuwzqfCx/gxbV1DQ6d4id1eoGXBhg76xsbhY2fA34UDX22
 sZhPa7vaekhSABqSq3q7znGNkTGTxRXlf8Kiac//bM/Z3oVYKoZXXB9zyWWTH7tsAue2
 1B3yweWVmqGH2oSfzokpJ9flNMRRfs9Ch/TZUvIWlFbtChX6zJmSSKrgWOdoAyamxI4t
 MWCSaYfX4b6HMUDdhbJ98JhjtDEInNQGjQWG3kd5N5U5xZzC2NZbKSwi8I2ED9rQfmrz
 7UAGrCn8PAB1iTBuS+TzkQAplICSN9l3apNNyz3X/NdhP+azrqtYr3WMCOS/YtBXCUbQ
 fB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JggnRH2z+C5c6q5fwkNF9u7IZivIlxcnTgChvJQFvSA=;
 b=SLhj/jxXbbZj4PY/H9S4ulUiaFiF9ySnxUx4odEF3VxOkKsolS1XIBhYdSG4D2mR61
 gXm9gYEu9Ekld0ApwhjbE8N2dy5QRMn6kdSw/GO+E2ORGt/bi8Dq8vGRhY1qsvsNX6WR
 yR1dyYiRWom5uzMk/BGNIPeSyozI8Yz/rvQ5eNf2Gk8u0lC02kav0qVGmYGDvXTIXIS5
 op7P+1S6+9+ZcrdzEulTTWOTWSTVVLESxlpa9ipl7MkOuIO9DNc201hGkfgNvWElL9zf
 UpNqyPEqv7JiUhVmDcDHpT6uw+D1Zmq0sZ4taHS2Sfv4ajC3x55zfS7UEjFMIXQuNZyH
 Qp6Q==
X-Gm-Message-State: AOAM530gCoDKB+tJq9hs3nTyA40S8dInlEIVulooFB1YG8ZMThX+XBaG
 bgTrNHu00O/BLM0CjX92B22AMw+8we+8R4rOaZWUsw==
X-Google-Smtp-Source: ABdhPJwSV0cJLUMNNy0lL94PwJnsWKOoPmVIkjaGTOqFfwKqrXom5YgkvcZWXnSt5nztkk0zIFsVQOCkdjO4/mVSk1Q=
X-Received: by 2002:a05:620a:29c4:: with SMTP id
 s4mr20672337qkp.401.1620112812489; 
 Tue, 04 May 2021 00:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210503164023.GA919777@bjorn-Precision-5520>
In-Reply-To: <20210503164023.GA919777@bjorn-Precision-5520>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 4 May 2021 15:20:00 +0800
Message-ID: <CAHCEeh+cMrEnHNG3W3ZNzdgT-m7BMorDawF6D8qkFYGg=RJMOw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 alex.dewar90@gmail.com, khilman@baylibre.com, hayashi.kunihiko@socionext.com, 
 vidyas@nvidia.com, jh80.chung@samsung.com, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_002014_369509_3A9AB1A5 
X-CRM114-Status: GOOD (  27.71  )
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

Qmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDXmnIg05pelIOmA
seS6jCDkuIrljYgxMjo0MOWvq+mBk++8mgo+Cj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDU6
MjY6MjhQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCBpbmNs
dWRlcyBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyLiBXZSBhbHNvCj4g
PiBhZGQgcGNpZV9hdXggY2xvY2sgYW5kIHBjaWVfcG93ZXJfb25fcmVzZXQgY29udHJvbGxlciB0
byBwcmNpIGRyaXZlciBmb3IKPiA+IFBDSWUgZHJpdmVyIHRvIHVzZSBpdC4KPgo+IEkgZHJvcHBl
ZCB0aGlzIHNlcmllcyBiZWNhdXNlIG9mIHRoZSBidWlsZCBwcm9ibGVtIEkgbWVudGlvbmVkIFsx
XS4KPiBJdCB3aWxsIG5vdCBiZSBpbmNsdWRlZCBpbiB2NS4xMyB1bmxlc3MgdGhlIGJ1aWxkIHBy
b2JsZW0gaXMgZml4ZWQKPiBBU0FQLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyMTA0MjgxOTQ3MTMuR0EzMTQ5NzVAYmpvcm4tUHJlY2lzaW9uLTU1MjAKPgoKSGkgYWxsLAoK
VGhpcyBidWlsZCBmYWlsZWQgaW4geDg2XzY0IGlzIGJlY2F1c2UgQ09ORklHX0dQSU9MSUIgaXMg
ZGlzYWJsZWQgaW4KdGhlIHRlc3RpbmcgY29uZmlnLgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL0tjb25maWcKYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29u
ZmlnCmluZGV4IDBhMzdkMjFlZDY0ZS4uNTZiNjZlMWZlZDUzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL0tjb25maWcKQEAgLTMyMyw2ICszMjMsNyBAQCBjb25maWcgUENJRV9GVTc0MAogICAgICAg
IGRlcGVuZHMgb24gUENJX01TSV9JUlFfRE9NQUlOCiAgICAgICAgZGVwZW5kcyBvbiBTT0NfU0lG
SVZFIHx8IENPTVBJTEVfVEVTVAogICAgICAgIHNlbGVjdCBQQ0lFX0RXX0hPU1QKKyAgICAgICBz
ZWxlY3QgR1BJT0xJQgogICAgICAgIGhlbHAKICAgICAgICAgIFNheSBZIGhlcmUgaWYgeW91IHdh
bnQgUENJZSBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHRoZSBTaUZpdmUKICAgICAgICAgIEZVNzQw
LgoKQWZ0ZXIgYXBwbHlpbmcgdGhpcyBjaGFuZ2UsIGl0IGNhbiBidWlsZCBwYXNzLgoKPiA+IFRo
aXMgaXMgdGVzdGVkIHdpdGggZTEwMDBlOiBJbnRlbChSKSBQUk8vMTAwMCBOZXR3b3JrIENhcmQs
IEFNRCBSYWRlb24gUjUKPiA+IDIzMCBncmFwaGljcyBjYXJkIGFuZCBTUCBNLjIgUENJZSBHZW4g
MyBTU0QgaW4gU2lGaXZlIFVubWF0Y2hlZCBiYXNlZCBvbgo+ID4gdjUuMTEgTGludXgga2VybmVs
Lgo+ID4KPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAgLSBGaXggdHlwbyBpbiBjb21tZW50cwo+ID4g
IC0gS2VlcCBjb21tZW50cyBzdHlsZSBjb25zaXN0ZW50Cj4gPiAgLSBSZWZpbmUgc29tZSBlcnJv
ciBoYW5kbGluZyBjb2Rlcwo+ID4gIC0gUmVtb3ZlIHVubmVlZGVkIGhlYWRlciBmaWxlIGluY2x1
ZGluZwo+ID4gIC0gTWVyZ2UgZnU3NDBfcGNpZV9sdHNzbV9lbmFibGUgaW1wbGVtZW50YXRpb24g
dG8gZnU3NDBfcGNpZV9zdGFydF9saW5rCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ICAtIEZp
eCBXdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyBpbiBwcmNpIGRyaXZlcgo+ID4KPiA+
IENoYW5nZXMgaW4gdjM6Cj4gPiAgLSBSZW1vdmUgaXRlbXMgdGhhdCBoYXMgYmVlbiBkZWZpbmVk
Cj4gPiAgLSBSZWZpbmUgZm9ybWF0IG9mIHNpZml2ZSxmdTc0MC1wY2llLnlhbWwKPiA+ICAtIFJl
cGxhY2UgcGVyc3RuLWdwaW9zIHdpdGggdGhlIGNvbW1vbiBvbmUKPiA+ICAtIENoYW5nZSBEQkkg
bWFwcGluZyBzcGFjZSB0byAyR0IgZnJvbSA0R0IKPiA+ICAtIFJlZmluZSBkcml2ZXJzL3Jlc2V0
L0tjb25maWcKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gIC0gUmVmaW5lIGNvZGVzIGJhc2Vk
IG9uIHJldmlld2VycycgZmVlZGJhY2sKPiA+ICAtIFJlbW92ZSBkZWZpbmUgYW5kIHVzZSB0aGUg
Y29tbW9uIG9uZQo+ID4gIC0gUmVwbGFjZSBfX3Jhd193cml0ZWwgd2l0aCB3cml0ZWxfcmVsYXhl
ZAo+ID4gIC0gU3BsaXQgZnU3NDBfcGh5cmVncmVhZHdyaXRlIHRvIHdyaXRlIGZ1bmN0aW9uCj4g
PiAgLSBVc2UgcmVhZGxfcG9sbF90aW1lb3V0IGluIHN0ZWFkIG9mIHdoaWxlIGxvb3AgY2hlY2tp
bmcKPiA+ICAtIFVzZSBkd2MgY29tbW9uIGNvZGVzCj4gPiAgLSBVc2UgZ3BpbyBkZXNjcmlwdG9y
cyBhbmQgdGhlIGdwaW9kXyogYXBpLgo+ID4gIC0gUmVwbGFjZSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2Ugd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lCj4gPiAgLSBSZXBs
YWNlIGRldm1fcmVzZXRfY29udHJvbF9nZXQgd2l0aCBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4
Y2x1c2l2ZQo+ID4gIC0gQWRkIG1vcmUgY29tbWVudHMgZm9yIGRlbGF5IGFuZCBzbGVlcAo+ID4g
IC0gUmVtb3ZlICJwaHkgPyB4IDogeSIgZXhwcmVzc2lvbnMKPiA+ICAtIFJlZmluZSBjb2RlIGxv
Z2ljIHRvIHJlbW92ZSBwb3NzaWJsZSBpbmZpbml0ZSBsb29wCj4gPiAgLSBSZXBsYWNlIG1hZ2lj
IG51bWJlciB3aXRoIG1lYW5pbmdmdWwgZGVmaW5lCj4gPiAgLSBSZW1vdmUgZnU3NDBfcGNpZV9w
bV9vcHMKPiA+ICAtIFVzZSBidWlsdGluX3BsYXRmb3JtX2RyaXZlcgo+ID4KPiA+IEdyZWVudGlt
ZSBIdSAoNSk6Cj4gPiAgIGNsazogc2lmaXZlOiBBZGQgcGNpZV9hdXggY2xvY2sgaW4gcHJjaSBk
cml2ZXIgZm9yIFBDSWUgZHJpdmVyCj4gPiAgIGNsazogc2lmaXZlOiBVc2UgcmVzZXQtc2ltcGxl
IGluIHByY2kgZHJpdmVyIGZvciBQQ0llIGRyaXZlcgo+ID4gICBNQUlOVEFJTkVSUzogQWRkIG1h
aW50YWluZXJzIGZvciBTaUZpdmUgRlU3NDAgUENJZSBkcml2ZXIKPiA+ICAgZHQtYmluZGluZ3M6
IFBDSTogQWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlcgo+ID4gICByaXNjdjog
ZHRzOiBBZGQgUENJZSBzdXBwb3J0IGZvciB0aGUgU2lGaXZlIEZVNzQwLUMwMDAgU29DCj4gPgo+
ID4gUGF1bCBXYWxtc2xleSAoMSk6Cj4gPiAgIFBDSTogZnU3NDA6IEFkZCBTaUZpdmUgRlU3NDAg
UENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyCj4gPgo+ID4gIC4uLi9iaW5kaW5ncy9wY2kvc2lm
aXZlLGZ1NzQwLXBjaWUueWFtbCAgICAgICB8IDExMyArKysrKysrCj4gPiAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsKPiA+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NpZml2ZS9mdTc0MC1jMDAwLmR0c2kgICAgfCAgMzMgKysKPiA+ICBkcml2ZXJz
L2Nsay9zaWZpdmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ID4gIGRyaXZl
cnMvY2xrL3NpZml2ZS9mdTc0MC1wcmNpLmMgICAgICAgICAgICAgICB8ICAxMSArCj4gPiAgZHJp
dmVycy9jbGsvc2lmaXZlL2Z1NzQwLXByY2kuaCAgICAgICAgICAgICAgIHwgICAyICstCj4gPiAg
ZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMgICAgICAgICAgICAgIHwgIDU0ICsrKwo+
ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5oICAgICAgICAgICAgICB8ICAxMyAr
Cj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZyAgICAgICAgICAgIHwgICA5
ICsKPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9NYWtlZmlsZSAgICAgICAgICAgfCAg
IDEgKwo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYyAgICAgICB8
IDMwOCArKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL3Jlc2V0L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
c2lmaXZlLWZ1NzQwLXByY2kuaCB8ICAgMSArCj4gPiAgMTMgZmlsZXMgY2hhbmdlZCwgNTU1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3NDAtcGNpZS55YW1sCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3
NDAuYwo+ID4KPiA+IC0tCj4gPiAyLjMwLjIKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
