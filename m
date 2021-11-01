Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61D8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 07:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C70960EB4
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 07:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C70960EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZNUdCqWnSuPk6rjB5Z82YHyREmIZKL+QXp2YFydKho=; b=1wH4o15uZs4CXX
	BysUhMMaWL895leB/7pWNROBtEtgyPv+JOeVBG080YOuDxbDPVL9zIaxVyqtxhCSKdQiUAYMyxdLx
	aaD/CT9a4DwbDBOkKIVjNOBF0rHDY2v0yMLjsTkecKI6mArRJOrYFi9LAkdfkuBWmDB7BQFtkTHDZ
	y4MPn6v5pq2imjLEBB7twrfDczZJ7pYTZifjVwh3RPy6MT/JpFwiETUDCSDf1U5zW5yfh6Ccmqzta
	QgYqxxn/dxKSLj4rNJK2oTs1X/n218k31jIe97g2UDPA8motIhreGgTXNv+TmAcRNie88XBw99PTQ
	okUXPOuISXuafBvtuFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSBS-00FbQW-B5; Mon, 01 Nov 2021 07:56:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSBP-00FbPU-2g
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 07:56:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D59161038
 for <linux-riscv@lists.infradead.org>; Mon,  1 Nov 2021 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635753402;
 bh=TBzEfh4UWc/gUlf4onT3eyLw52Cjhrz+B9wb/eT2Ekk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hNl2rukHiKsM9YW4n26JFDlaEa7C3kSeR2TfQcEzFW0TxguD3kP+yvAT5kKbAlrp1
 FsHAJ9CwtvCkejbXbYDHxQVZP1/HZPhRlnOGQs6fcRhBILwcG2IdxvbEMVDebk1z01
 ebsEe3pyDyE2zhndURAKLCVnltM/tpSA+DXxyD1oXQNSUUJQwSvfshVO9QgtPPgnFs
 uDvUGV2JWZ1Kgm1OGFQfkG29xYGyFAhf8lyI/j/nBK3a/Kb84a6qBd875+IyzdFQaX
 O40F95tGxgRvdelGHBdMc5TTjJ/SQGziopcAozxSfKyTKhQxv5/HMc2PL9K4U/uP6O
 wKpQVs0YsRNAw==
Received: by mail-ua1-f49.google.com with SMTP id b17so20229637uas.0
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 00:56:42 -0700 (PDT)
X-Gm-Message-State: AOAM530xDvJtQoPX6xcLSnN25aSks2vA7zzcRRW2CgqRhcU8cSYggX4a
 fBr/UThoYapUIhyoVhIF0bWjyZ5zyvaCY+Jy/lk=
X-Google-Smtp-Source: ABdhPJwkzeYQJNhGI/wkjlGHlXo2oAgLD7FNzJun23uvED1t+XI6+VUtKDcHjgfZW/6tz0GZHEAAMbveF0p9UiY6mNQ=
X-Received: by 2002:ab0:728e:: with SMTP id w14mr25512432uao.97.1635753401252; 
 Mon, 01 Nov 2021 00:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
 <20211028135523.5cf4b66b@redslave.neermore.group>
 <87sfwl9oxg.wl-maz@kernel.org>
 <CAJF2gTR3CqtmKZKS3fOQ9mzSLn7_oh7YoSSmWP1YM=ujB_srMw@mail.gmail.com>
 <CAAhSdy1WrxbMsiWkwOXd_76A6wNAh05C1QQ-oFXoE9U-F0akiA@mail.gmail.com>
 <CAJF2gTRwi+yH-hQ0SHKDOuUf=OOMfJxQb6Q5m6xRCPjvbYjqaQ@mail.gmail.com>
 <CAAhSdy3r2oVOq9yd+ZkOs1oCHRH-qvjLDa25Jp3qeD1tSxWEWQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3r2oVOq9yd+ZkOs1oCHRH-qvjLDa25Jp3qeD1tSxWEWQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Nov 2021 15:56:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTecsYE9HM-_XfBWFQ6sbHE0x1=6up5wD+yfX0QjXTyLA@mail.gmail.com>
Message-ID: <CAJF2gTTecsYE9HM-_XfBWFQ6sbHE0x1=6up5wD+yfX0QjXTyLA@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead, c900-plic
 request_threaded_irq with ONESHOT
To: Anup Patel <anup@brainfault.org>
Cc: Marc Zyngier <maz@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_005643_187983_1E4529F7 
X-CRM114-Status: GOOD (  48.85  )
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

T24gTW9uLCBOb3YgMSwgMjAyMSBhdCAxMjoyOCBQTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTm92IDEsIDIwMjEgYXQgOToyNyBBTSBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBOb3YgMSwgMjAyMSBh
dCAxMDo1MyBBTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gTW9uLCBOb3YgMSwgMjAyMSBhdCA3OjUwIEFNIEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgT2N0IDI4LCAyMDIxIGF0IDEw
OjU4IFBNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IE9uIFRodSwgMjggT2N0IDIwMjEgMTE6NTU6MjMgKzAxMDAsCj4gPiA+ID4gPiBOaWtp
dGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSGVsbG8gTWFyYyBhbmQgR3VvIFJlbiEKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gT24gTW9uLCAyNSBPY3QgMjAyMSAxMTo0ODozMyArMDEwMAo+ID4gPiA+ID4gPiBNYXJjIFp5
bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBP
biBTdW4sIDI0IE9jdCAyMDIxIDAyOjMzOjAzICswMTAwLAo+ID4gPiA+ID4gPiA+IGd1b3JlbkBr
ZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEZyb206IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBXaGVuIHVzaW5nICJkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCwsLCxJUlFGX09O
RVNIT1QsLCkiIGluIHRoZQo+ID4gPiA+ID4gPiA+ID4gZHJpdmVyLCBvbmx5IHRoZSBmaXJzdCBp
bnRlcnJ1cHQgY291bGQgYmUgaGFuZGxlZCwgYW5kIGNvbnRpbnVlIGlycQo+ID4gPiA+ID4gPiA+
ID4gaXMgYmxvY2tlZCBieSBody4gQmVjYXVzZSB0aGUgdGhlYWQsYzkwMC1wbGljIGNvdWxkbid0
IGNvbXBsZXRlCj4gPiA+ID4gPiA+ID4gPiBtYXNrZWQgaXJxIHNvdXJjZSB3aGljaCBoYXMgYmVl
biBkaXNhYmxlZCBpbiBlbmFibGUgcmVnaXN0ZXIuIEFkZAo+ID4gPiA+ID4gPiA+ID4gdGhlYWRf
cGxpY19jaGlwIHdoaWNoIGZpeCB1cCBjOTA2LXBsaWMgaXJxIHNvdXJjZSBjb21wbGV0aW9uCj4g
PiA+ID4gPiA+ID4gPiBwcm9ibGVtIGJ5IHVubWFzay9tYXNrIHdyYXBwZXIuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gSGVyZSBpcyB0aGUgZGVzY3JpcHRpb24gb2YgSW50ZXJydXB0
IENvbXBsZXRpb24gaW4gUExJQyBzcGVjIFsxXToKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiBUaGUgUExJQyBzaWduYWxzIGl0IGhhcyBjb21wbGV0ZWQgZXhlY3V0aW5nIGFuIGludGVy
cnVwdCBoYW5kbGVyIGJ5Cj4gPiA+ID4gPiA+ID4gPiB3cml0aW5nIHRoZSBpbnRlcnJ1cHQgSUQg
aXQgcmVjZWl2ZWQgZnJvbSB0aGUgY2xhaW0gdG8gdGhlCj4gPiA+ID4gPiA+ID4gPiBjbGFpbS9j
b21wbGV0ZSByZWdpc3Rlci4gVGhlIFBMSUMgZG9lcyBub3QgY2hlY2sgd2hldGhlciB0aGUKPiA+
ID4gPiA+ID4gPiA+IGNvbXBsZXRpb24gSUQgaXMgdGhlIHNhbWUgYXMgdGhlIGxhc3QgY2xhaW0g
SUQgZm9yIHRoYXQgdGFyZ2V0LiBJZgo+ID4gPiA+ID4gPiA+ID4gdGhlIGNvbXBsZXRpb24gSUQg
ZG9lcyBub3QgbWF0Y2ggYW4gaW50ZXJydXB0IHNvdXJjZSB0aGF0IGlzCj4gPiA+ID4gPiA+ID4g
PiBjdXJyZW50bHkgZW5hYmxlZCBmb3IgdGhlIHRhcmdldCwgdGhlIF5eIF5eXl5eXl5eXiBeXl5e
Xl5eCj4gPiA+ID4gPiA+ID4gPiBjb21wbGV0aW9uIGlzIHNpbGVudGx5IGlnbm9yZWQuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBHaXZlbiB0aGlzIGJpdCBvZiB0aGUgc3BlYy4uLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiArc3RhdGljIHZvaWQgcGxpY190aGVhZF9pcnFfZW9p
KHN0cnVjdCBpcnFfZGF0YSAqZCkKPiA+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4gPiAr
IHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIgPQo+ID4gPiA+ID4gPiA+ID4gdGhpc19jcHVf
cHRyKCZwbGljX2hhbmRsZXJzKTsgKwo+ID4gPiA+ID4gPiA+ID4gKyBpZiAoaXJxZF9pcnFfbWFz
a2VkKGQpKSB7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgcGxpY19pcnFfdW5tYXNrKGQpOwo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgIHdyaXRlbChkLT5od2lycSwgaGFuZGxlci0+aGFydF9i
YXNlICsKPiA+ID4gPiA+ID4gPiA+IENPTlRFWFRfQ0xBSU0pOwo+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgIHBsaWNfaXJxX21hc2soZCk7Cj4gPiA+ID4gPiA+ID4gPiArIH0gZWxzZSB7Cj4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgd3JpdGVsKGQtPmh3aXJxLCBoYW5kbGVyLT5oYXJ0X2Jhc2Ug
Kwo+ID4gPiA+ID4gPiA+ID4gQ09OVEVYVF9DTEFJTSk7Cj4gPiA+ID4gPiA+ID4gPiArIH0KPiA+
ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiAuLi4gaXQgaXNuJ3Qgb2J2aW91cyB0byBtZSB3aHkgdGhpcyBjYW5ub3QgaGFwcGVuIG9u
IGFuIFNpRml2ZSBQTElDLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGlzIGluZGVlZCBoYXBw
ZW5zIHdpdGggU2lGaXZlIFBMSUMuIEkgYW0gY3VycmVudGx5IHRpbmtlcmluZyB3aXRoCj4gPiA+
ID4gPiA+IGRhOTA2MyBSVEMgb24gU2lGaXZlIFVubWF0Y2hlZCwgYW5kIEFMQVJNIGlycSBmaXJl
cyBvbmx5IG9uY2UuIEhvd2V2ZXIKPiA+ID4gPiA+ID4gd2l0aCBjaGFuZ2VzIHByb3Bvc2VkIGJ5
IEd1byBSZW4gaW4gcGxpY190aGVhZF9pcnFfZW9pLCBldmVyeXRoaW5nCj4gPiA+ID4gPiA+IGJl
Z2lucyB0byB3b3JrIGZpbmUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE1heSBiZSB0aGVzZSBj
aGFuZ2Ugc2hvdWxkIGJlIHByb3BhZ2F0ZWQgdG8gcGxpY19pcnFfZW9pIGluc3RlYWQgb2YKPiA+
ID4gPiA+ID4gbWFraW5nIGEgbmV3IGZ1bmN0aW9uID8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGF0
J3MgbXkgaW1wcmVzc2lvbiB0b28uIEkgdGhpbmsgdGhlIFQtSGVhZCBkZWZlY3QgaXMgcHJldHR5
IG11Y2gKPiA+ID4gPiA+IGltbWF0ZXJpYWwgd2hlbiB5b3UgY29uc2lkZXIgaG93ICdpbnRlcmVz
dGluZycgdGhlIFBMSUMgYXJjaGl0ZWN0dXJlCj4gPiA+ID4gPiBpcy4KPiA+ID4gPiBXaGljaCBp
cyB0aGUgIlQtSGVhZCBkZWZlY3QiIHlvdSBtZW50aW9uZWQgaGVyZT8KPiA+ID4gPiAgMS4gQXV0
byBtYXNraW5nIHdpdGggY2xhaW0gKyBjb21wbGV0ZSAoSSBkb24ndCB0aGluayBpdCdzIGEgZGVm
ZWN0LAo+ID4gPiA+IHJpZ2h0PyBNYXkgSSBhZGQgYSBuZXcgcGF0Y2ggdG8gdXRpbGl6ZSB0aGUg
ZmVhdHVyZSB0byBkZWNyZWFzZSBhCj4gPiA+ID4gbGl0dGxlIGR1cGxpY2F0ZSBtYXNrL3VubWFz
ayBvcGVyYXRpb25zIGluIHRoZSBmdXR1cmU/KQo+ID4gPgo+ID4gPiBUaGlzIGlzIGRlZmluaXRl
bHkgYSBkZWZlY3QgYW5kIG5vbi1jb21wbGlhbmNlIGZvciBULUhFQUQgYmVjYXVzZQo+ID4gSSBq
dXN0IGFncmVlIHdpdGggbm9uLWNvbXBsaWFuY2UsIGJ1dCB3aGF0J3MgdGhlIGRlZmVjdCBvZgo+
ID4gYXV0by1tYXNraW5nPyBJZiBzb21lYm9keSBjb3VsZCBleHBsYWluLCBJJ20gdmVyeSBncmF0
ZWZ1bC4KPiA+Cj4gPiA+IG5vIHNhbmUgaW50ZXJydXB0IGNvbnRyb2xsZXIgd291bGQgbWFzayBp
bnRlcnJ1cHQgdXBvbiBjbGFpbSBhbmQgdGhpcwo+ID4gPiBpcyBub3Qgd2hhdCBSSVNDLVYgUExJ
QyBkZWZpbmVzLgo+ID4gPgo+ID4gPiA+ICAyLiBFT0kgZmFpbGVkIHdoZW4gbWFza2VkCj4gPiA+
Cj4gPiA+IFRoaXMgZGVmZWN0IGV4aXN0cyBmb3IgYm90aCBSSVNDLVYgUExJQyBhbmQgVC1IRUFE
IFBMSUMKPiA+ID4gYmVjYXVzZSBvZiB0aGUgd2F5IGludGVycnVwdCBjb21wbGV0aW9uIGlzIGRl
ZmluZWQuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+IENvbmZsYXRpbmcgRU9JIGFuZCBtYXNraW5n
IHJlYWxseSBpcyBhIG1pc2ZlYXR1cmUuLi4KPiA+ID4gPiBJIHRoaW5rIHRoZSBwcm9ibGVtIGlz
IHJpc2N2IFBMSUMgcmV1c2UgZW5hYmxlIGJpdCBhcyBtYXNrIGJpdC4gSQo+ID4gPiA+IHJlY29t
bWVuZCBzZXBhcmF0aW5nIHRoZW0uIFRoYXQgbWVhbnM6Cj4gPiA+Cj4gPiA+IFRoZXJlIGFyZSBu
byBwZXItaW50ZXJydXB0IG1hc2sgYml0cy4gV2Ugb25seSBoYXZlIHBlci1jb250ZXh0Cj4gPiA+
IGFuZCBwZXItaW50ZXJydXB0IGVuYWJsZSBiaXRzIHdoaWNoIGlzIHVzZWQgdG8gcHJvdmlkZSBt
YXNrL3VubWFzawo+ID4gPiBmdW5jdGlvbmFsaXR5IGV4cGVjdGVkIGJ5IHRoZSBpcnFjaGlwIGZy
YW1ld29yay4KPiA+ID4KPiA+ID4gSSBkb24ndCBzZWUgaG93IHRoaXMgaXMgYSBwcm9ibGVtIGZv
ciBSSVNDLVYgUExJQy4gVGhlIG9ubHkgcmVhbAo+ID4gPiBpc3N1ZSB3aXRoIFJJU0MtViBQTElD
IGlzIHRoZSBmYWN0IHRoZSBpbnRlcnJ1cHQgY29tcGxldGlvbiB3aWxsIGJlCj4gPiA+IGlnbm9y
ZWQgZm9yIGEgbWFza2VkIGludGVycnVwdCB3aGljaCBpcyB3aGF0IE1hcmMgaXMgcG9pbnRpbmcg
YXQuCj4gPiBTbyB5b3UgYXJlIG5vdCBjb25zaWRlcmluZyBhZGQgcGVyLWludGVycnVwdCBtYXNr
IGJpdHMgdG8gc29sdmUgdGhlCj4gPiBhYm92ZSBwcm9ibGVtLCByaWdodD8KPgo+IFRoZSBSSVND
LVYgUExJQyBoYXMgc2V2ZXJhbCBsaW1pdGF0aW9ucyBhbmQgYWxzbyBsYWNrcyBhIGxvdCBvZiBm
ZWF0dXJlcwo+IGhlbmNlIGl0J3MgbWFya2VkIGFzIGRlcHJlY2F0ZWQgaW4gUklTQy1WIHBsYXRm
b3JtIHNwZWNzIGFuZCB3aWxsIGJlCj4gcmVtb3ZlZCBldmVudHVhbGx5IGZyb20gUklTQy1WIHBs
YXRmb3JtIHNwZWNzLgo+Cj4gVGhlIFJJU0MtViBBSUEgd2lsbCB0b3RhbGx5IHJlcGxhY2UgUklT
Qy1WIFBMSUMgZ29pbmcgZm9yd2FyZC4gSW4gZmFjdCwKPiBSSVNDLVYgQUlBIEFQTElDIGFkZHJl
c3NlcyBhbGwgbGltaXRhdGlvbnMgb2YgUklTQy1WIFBMSUMgYWxvbmcgd2l0aAo+IG5ldyBmZWF0
dXJlcyBhZGRpdGlvbnMuCj4KPiA+Cj4gPiBJIGRvbid0IHRoaW5rIHlvdSB3b3VsZCBrZWVwIGJl
bG93IGNvZGVzIGluIEFJQSBlb2kuCj4gPiAgKyAgICAgICAgICAgICBwbGljX2lycV91bm1hc2so
ZCk7Cj4gPiAgKyAgICAgICAgICAgICB3cml0ZWwoZC0+aHdpcnEsIGhhbmRsZXItPmhhcnRfYmFz
ZSArIENPTlRFWFRfQ0xBSU0pOwo+ID4gICsgICAgICAgICAgICAgcGxpY19pcnFfbWFzayhkKTsK
Pgo+IExpa2UgSSBtZW50aW9uZWQgcHJldmlvdXNseSwgdGhlIEFJQSBBUExJQyBpcyB2ZXJ5IGRp
ZmZlcmVudCBmcm9tIHRoZQo+IFBMSUMgc28gd2UgZG9uJ3QgbmVlZCB0aGlzIG1hc2svdW5tYXNr
IGRhbmNlIG92ZXIgdGhlcmUuIEl0IGhhcyBnbG9iYWwKPiBwZXItaW50ZXJydXB0IGVuYWJsZSBi
aXRzIGluIEFJQSBBUExJQyB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSBQTElDLgpUaGUg4oCdZ2xv
YmFsIHBlci1pbnRlcnJ1cHQgZW5hYmxlIGJpdHPigJwgaXMgb2theS4KCj4KPiBSZWdhcmRzLAo+
IEFudXAKPgo+ID4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQW51cAo+ID4gPgo+ID4gPiA+
ICAtIEVPSSBzdGlsbCBkZXBlbmRzIG9uIGVuYWJsZSBiaXQuCj4gPiA+ID4gIC0gQWRkIG1hc2sv
dW5tYXNrIGJpdCByZWdzIHRvIGRvIHRoZSByaWdodCB0aGluZy4KPiA+ID4KPiA+ID4KPiA+ID4K
PiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgTS4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiAtLQo+ID4gPiA+ID4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3Mg
aXMgbm90IHBvc3NpYmxlLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+
ID4gQmVzdCBSZWdhcmRzCj4gPiA+ID4gIEd1byBSZW4KPiA+ID4gPgo+ID4gPiA+IE1MOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5Lwo+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IEJl
c3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KPiA+Cj4gPiBNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtY3NreS8KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
