Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7AFC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 09:42:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4826128A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 09:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4826128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6p8+qBulKLEhXJL1RYFCloeLgLNzD04IIk/PKaYAOhM=; b=exhHs5RTXWRWHACosJMTC9vhi
	+FSj4AVzvTFcakR1GS1qoMQlEQDWPsYaLmAwHpxgYfTb8DNaOu7TGeYXgF1HQ31KUgYfQQvyBDmLj
	a14UpnM+zJ1gbsqTp7UqS3AMRru0rMQAWAWZc0gTLWOecOW6TKWy5jWhKRmQrPm+UBRZS/A0eGDP2
	sfdna4gUYJ+TAT8rvZqQxCGE2MaUFdQbo0y4SsE7+Y4rvVCABiR8BzgL6Pznmjqpu//ZXTfC78WB2
	Vrq1lOro42AQ/1DdphorZn3szt2jjNLqKEJlmWHR1mUEaN00N+W/yPdsW2U2D5Pc21FFa040JmPZX
	UZz9Dezyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZsJm-001C5J-Qd; Fri, 23 Apr 2021 09:41:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZsHb-001Bwk-TO
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 09:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IvIk1+H3zzfHI9/TCeKm80xJQiTPiFJ5lQRTc0R5E2o=; b=vdrBXJ8mqX5vcRC4cmh3s/pInj
 EwZrPd0JprnOlD5KGGeIlvISOfAYUYz20QjUCE4UQ7Pq8uIHkszJnVVcwl6Z1oRnyVq8YrbaLQ8RT
 mv6DNlPvcAVuTRnxeJ5Hs2JjEOQQtyqtamh6jOi5gj9f8dz6/vo+KVyg1fNjWq3k/8mUgseEHXYJz
 1pWf+sk9lSBCFMe5sin2IG9/j82btHk0l1M17LVrZjbROnY3grig+D7rg7PieXEIMkV4acjAxSn06
 FbFXFRw0vqED/Lop1sDFR/aMQ/TpnenlV+PIFnSFChI1280sE/MzhEbFPjzV2vinEweuQD/9Tz8y7
 b61XW1oQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lZsHY-00EI7i-EY
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 09:39:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9640111D4;
 Fri, 23 Apr 2021 02:39:22 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29A73F774;
 Fri, 23 Apr 2021 02:39:19 -0700 (PDT)
Date: Fri, 23 Apr 2021 10:39:15 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jh80.chung@samsung.com,
 Zong Li <zong.li@sifive.com>, robh+dt@kernel.org, vidyas@nvidia.com,
 alex.dewar90@gmail.com, Erik Danie <erik.danie@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>,
 hayashi.kunihiko@socionext.com, hes@sifive.com,
 khilman@baylibre.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <helgaas@kernel.org>, devicetree@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
Message-ID: <20210423093915.GA7784@lpieralisi>
References: <mhng-f3dd2202-8d2b-4e17-9067-c4521aac8125@palmerdabbelt-glaptop>
 <mhng-41850660-4a95-462a-9b1e-33dfc67815a4@palmerdabbelt-glaptop>
 <CAHCEehJHZGEUy2TO6fPg1WyAbQCoVee=AcRrkZE4Zhw+ibYKqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCEehJHZGEUy2TO6fPg1WyAbQCoVee=AcRrkZE4Zhw+ibYKqQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_023928_611627_E3B68FAB 
X-CRM114-Status: GOOD (  30.68  )
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

T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDI6MDA6NDZQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdy
b3RlOgo+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IOaWvCAyMDIx5bm0NOac
iDIz5pelIOmAseS6lCDkuIvljYgxOjEw5a+r6YGT77yaCj4gPgo+ID4gT24gVGh1LCAyMiBBcHIg
MjAyMSAyMTo0MzowMyBQRFQgKC0wNzAwKSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiA+IE9u
IFN1biwgMTEgQXByIDIwMjEgMTk6Mzc6NTAgUERUICgtMDcwMCksIGdyZWVudGltZS5odUBzaWZp
dmUuY29tIHdyb3RlOgo+ID4gPj4gTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNp
QGFybS5jb20+IOaWvCAyMDIx5bm0NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NTTlr6vpgZPvvJoK
PiA+ID4+Pgo+ID4gPj4+IE9uIFR1ZSwgNiBBcHIgMjAyMSAxNzoyNjoyOCArMDgwMCwgR3JlZW50
aW1lIEh1IHdyb3RlOgo+ID4gPj4+ID4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBTaUZpdmUgRlU3
NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyLiBXZSBhbHNvCj4gPiA+Pj4gPiBhZGQgcGNp
ZV9hdXggY2xvY2sgYW5kIHBjaWVfcG93ZXJfb25fcmVzZXQgY29udHJvbGxlciB0byBwcmNpIGRy
aXZlciBmb3IKPiA+ID4+PiA+IFBDSWUgZHJpdmVyIHRvIHVzZSBpdC4KPiA+ID4+PiA+Cj4gPiA+
Pj4gPiBUaGlzIGlzIHRlc3RlZCB3aXRoIGUxMDAwZTogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29y
ayBDYXJkLCBBTUQgUmFkZW9uIFI1Cj4gPiA+Pj4gPiAyMzAgZ3JhcGhpY3MgY2FyZCBhbmQgU1Ag
TS4yIFBDSWUgR2VuIDMgU1NEIGluIFNpRml2ZSBVbm1hdGNoZWQgYmFzZWQgb24KPiA+ID4+PiA+
IHY1LjExIExpbnV4IGtlcm5lbC4KPiA+ID4+PiA+Cj4gPiA+Pj4gPiBbLi4uXQo+ID4gPj4+Cj4g
PiA+Pj4gQXBwbGllZCB0byBwY2kvZHdjIFtkcm9wcGVkIHBhdGNoIDZdLCB0aGFua3MhCj4gPiA+
Pj4KPiA+ID4+PiBbMS82XSBjbGs6IHNpZml2ZTogQWRkIHBjaWVfYXV4IGNsb2NrIGluIHByY2kg
ZHJpdmVyIGZvciBQQ0llIGRyaXZlcgo+ID4gPj4+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvbHBpZXJhbGlzaS9wY2kvYy9mM2NlNTkzYjFhCj4gPiA+Pj4gWzIvNl0gY2xrOiBzaWZpdmU6
IFVzZSByZXNldC1zaW1wbGUgaW4gcHJjaSBkcml2ZXIgZm9yIFBDSWUgZHJpdmVyCj4gPiA+Pj4g
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzBhNzhmY2ZkM2QK
PiA+ID4+PiBbMy82XSBNQUlOVEFJTkVSUzogQWRkIG1haW50YWluZXJzIGZvciBTaUZpdmUgRlU3
NDAgUENJZSBkcml2ZXIKPiA+ID4+PiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2xwaWVy
YWxpc2kvcGNpL2MvOGJiMWM2NmE5MAo+ID4gPj4+IFs0LzZdIGR0LWJpbmRpbmdzOiBQQ0k6IEFk
ZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIKPiA+ID4+PiAgICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL2xwaWVyYWxpc2kvcGNpL2MvYjg2ZDU1YzEwNwo+ID4gPj4+IFs1LzZd
IFBDSTogZnU3NDA6IEFkZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVy
Cj4gPiA+Pj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzMy
N2MzMzNhNzkKPiA+ID4+Pgo+ID4gPj4+IFRoYW5rcywKPiA+ID4+PiBMb3JlbnpvCj4gPiA+Pgo+
ID4gPj4gSGkgUGFsbWVyLAo+ID4gPj4KPiA+ID4+IFNpbmNlIHRoZSBQQ0lFIGRyaXZlciBoYXMg
YmVlbiBhcHBsaWVkLCB3b3VsZCB5b3UgcGxlYXNlIHBpY2sgcGF0Y2ggNgo+ID4gPj4gdG8gUklT
Qy1WIGZvci1uZXh0IHRyZWU/Cj4gPiA+PiBUaGFuayB5b3UuIDopCj4gPiA+Cj4gPiA+IFNvcnJ5
LCBJIGdvdCB0aGlzIGNvbmZ1c2VkIGJldHdlZW4gdGhlIExpbnV4IHBhdGNoIHNldCBhbmQgdGhl
IHUtYm9vdAo+ID4gPiBwYXRjaCBzZXQgc28gSSB0aG91Z2h0IG1vcmUgdmVyc2lvbnMgb2YgdGhp
cyBoYWQga2VwdCBjb21taW5nLiAgVGhlIERUCj4gPiA+IGlzIG9uIGZvci1uZXh0IG5vdy4KPiA+
Cj4gPiBJIHNwb2tlIHRvbyBzb29uOiB0aGlzIGFjdHVhbGx5IGRvc24ndCBldmVuIGJ1aWxkIGZv
ciBtZS4gIEl0J3MgdGhlCj4gPiAiY2xvY2tzID0gPCZwcmNpIFBSQ0lfQ0xLX1BDSUVfQVVYPjsi
IGxpbmUKPiA+Cj4gPiAgICAgRXJyb3I6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQw
LWMwMDAuZHRzaTozMTkuMjAtMjEgc3ludGF4IGVycm9yCj4gPiAgICAgRkFUQUwgRVJST1I6IFVu
YWJsZSB0byBwYXJzZSBpbnB1dCB0cmVlCj4gPiAgICAgbWFrZVsyXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmxpYjozMzY6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNo
ZWQtYTAwLmR0Yl0gRXJyb3IgMQo+ID4gICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDo1MTQ6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlXSBFcnJvciAyCj4gPiAgICAg
bWFrZTogKioqIFtNYWtlZmlsZToxMzg4OiBkdGJzXSBFcnJvciAyCj4gPiAgICAgbWFrZTogKioq
IFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgd2hh
dCB0aGUgaXNzdWUgaXMsIEkgc2VlIGFuIGFuY2hvciBmb3IgInByY2kiLiAgRG8geW91IG1pbmQK
PiA+IHNlbmRpbmcgYWxvbmcgYSBuZXcgdmVyc2lvbiB0aGF0IGNvbXBpbGVzIG9uIHRvcCBvZiBm
b3ItbmV4dD8gIElmIEkgbmVlZAo+ID4gdGhlIGRlZmluaXRvbiBvZiBQUkNJX0NMS19QQ0lFX0FV
WCBmcm9tIGEgUENJZSB0cmVlIHRoZW4gaXQncyBwcm9iYWJseQo+ID4gYmVzdCB0byBqdXN0IGtl
ZXAgdGhlIERUUyBhbG9uZyB3aXRoIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzLiAgSUlSQyBJCj4g
PiBhbHJlZHkgQWNrZWQgaXQsIGJ1dCBqdXN0IHRvIGJlIGNsZWFyCj4gPgo+ID4gQWNrZWQtYnk6
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gPgo+ID4gVGhhbmtz
IQo+IAo+IFRoYW5rIHlvdSwgUGFsbWVyLgo+IEl0IGlzIGRlZmluZWQgaW4gdGhlIGZpcnN0IGNv
bW1pdCBvZiB0aGlzIHBhdGNoc2V0LiAiY2xrOiBzaWZpdmU6IEFkZAo+IHBjaWVfYXV4IGNsb2Nr
IGluIHByY2kgZHJpdmVyIGZvciBQQ0llIGRyaXZlciIKPiBZb3UgY2FuIHNlbGVjdCB0aGVzZSB3
aG9sZSA2IHBhdGNoZXMgdG8gbWFrZSBzdXJlIGl0IGNhbiBiZSBidWlsdC4KPiAKPiBIaSBMb3Jl
bnpvLAo+IFdvdWxkIHlvdSBtaW5kIHRvIHBpY2sgdGhlIDZ0aCBwYXRjaCBhbG9uZyB3aXRoIHRo
ZSBvdGhlciA1IHBhdGNoZXM/Cj4gVGhhbmsgeW91LgoKRG9uZSwgb24gbXkgcGNpL2R3YyBicmFu
Y2guCgpUaGFua3MsCkxvcmVuem8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
