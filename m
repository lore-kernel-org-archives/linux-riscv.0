Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51267C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AAC61009
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21AAC61009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZVg1gHIZuRSQq5c5doUq6q1xlZ+3K3oDq8A3gC0SQE=; b=qdHTLmezjoHMxjGajqdpmzCwV1
	rLe9O8VqzTpMbgLjT86jEUV8YExeX7uCH6WjUB1umm+Q6DZl/VUE3rzoWQYpgu9vay6FnxMup1JXX
	jHuuqXuG0CSMmdP41m2snarLmHreJkZmJz39Yz5yfgEl2DnHCLTf4e096Qc8ca0X4hdAizBStYofv
	vXsTh2ll7THyo0A8v/3Sb423JY0O0DrML507Exf08ZixG7ArsSY6bQuDCVkVD4IdKVBuRhBWGslj4
	rUFjh9t2oMeK5S83cFBE2mRw+EPljSf9kl2Aj78VoY3PkFCbHW9jvDK4pMtdFQCBDX9yzOjYy/gb9
	MGP8JGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIjq-003x1q-NU; Tue, 15 Jun 2021 23:44:58 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltIUp-003rss-8g
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 23:29:29 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15FNTP56058466
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 02:29:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623799760; x=1626391760;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ysvqs1/K9ONe++S7r+yMb/Oe/Rgd4xGI6L/tmzqZrik=;
 b=BmPCIklcetMBqB07S7nUkB/zCCNdq6q9TT74SEG8aIJj+UwPy9eCcJj5j48XMZiX
 AYKr30lgIDymdSumCyZ85PIJUDc/Y3tQI1bHMrr/iPbkwX/LmXPDqJtkIi4dvrlD
 10Xh9i838pmKVpkoFQjM8oFdUoQMUxfqqOiYMnNzP13ihKCvt5jvAHTJ6EPuy0wr
 Qp0ZI3vPRfeTSTTYar9tooQMlO38NGFafmuE6Ol+055P8bF/0203SBPSYc+acNBq
 KM3xu+gSiKziOkAbwhz8JfhgJOXitxt1iO2iAABE+gdQCptk5gfNaBJKnmuvx4uP
 doxY+aS3kJdLj9yvNF/ffQ==;
X-AuditID: 8b5b014d-962f1700000067b6-5b-60c937d07ad1
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 5D.05.26550.0D739C06; Wed, 16 Jun 2021 02:29:20 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 16 Jun 2021 02:29:19 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Nick Kossifidis
 <mick@ics.forth.gr>, linux-riscv <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
Organization: FORTH
In-Reply-To: <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
 <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
 <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
 <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
Message-ID: <a488d802940f7fc2ae34a4fe583ec187@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsXSHT1dWfeC+ckEg+NnRCzmHznHavHs1l4m
 i8u75rBZbPvcwmbR/O4cu8XLyz3MFm2z+C1a9x5hd+DwePPyJYvHw02XmDw2repk8zh0uIPR
 Y/OSeo9LzdfZPT5vkgtgj+KySUnNySxLLdK3S+DKaLzxkq3gM2/Fzj+t7A2MT7m6GDk5JARM
 JM6+vc7SxcjFISRwlFGia9kaFoiEqcTsvZ2MIDavgKDEyZlPwOLMAhYSU6/sZ4Sw5SWat85m
 BrFZBFQlrmzbDVbDJqApMf/SQTBbREBFYsPzW8wgC5gFFjJLbGqcwgqSEBawkbi14AhYEb+A
 sMSnuxfB4pwCgRJ90/aBLRAS+Mwk0b5TCOIIF4npbz4zQRynIvHh9wP2LkYODlEge/NcpQmM
 grOQnDoLyamzkJy6gJF5FaNAYpmxXmZysV5aflFJhl560SZGcDQw+u5gvL35rd4hRiYOxkOM
 EhzMSiK8usUnEoR4UxIrq1KL8uOLSnNSiw8xSnOwKInz8upNiBcSSE8sSc1OTS1ILYLJMnFw
 SjUwWZtYB72fs+ZY+caL2j/vh7Nka6TyvfXnO3dqQkXNtQSxMrXJxTzthqcfvX0s2dicWjLn
 kepi3mXWV9VTpkxSurBKatf6/Wa8BulXNX7MXdoWHd37V4X9+4f62yyKuf8PejTuyT54dNfM
 0+H3Nz3OWubd+SetYbH7/wKujAXf7QpmlZwuubN3/96GG32MoUI/zQp76z/GNaan9zH8z2v8
 PmVu/Ytjjf57j0RNenPi++m5f04rzujpcufRW/bg/uKc/PCt7/c95Steu9Yl9ZaAzp05xYm6
 RS3rbCIYyg7P8E5ymbBJ5JbRkv138+ey/XRYfLaWNffj1SVHkw9ucRQoLLC+Xvl0p9f2htAT
 QY7MU5RYijMSDbWYi4oTAWVGe4v1AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_162927_751344_F92C1784 
X-CRM114-Status: GOOD (  20.89  )
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

zqPPhM65z4IgMjAyMS0wNi0xNSAyMjoyMSwgUm9iIEhlcnJpbmcgzq3Os8+BzrHPiM61Ogo+IE9u
IFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDEyOjQ4IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+IDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+IAo+PiBIaSBOaWNrLAo+PiAKPj4gT24gVHVlLCBK
dW4gMTUsIDIwMjEgYXQgODoyOSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdy
PiAKPj4gd3JvdGU6Cj4+ID4gzqPPhM65z4IgMjAyMS0wNi0xNSAxNjoxOSwgR2VlcnQgVXl0dGVy
aG9ldmVuIM6tzrPPgc6xz4jOtToKPj4gPiA+IFRoaXMgZG9lcyBub3QgbWF0Y2gKPj4gPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYXN0ZXIvc2No
ZW1hcy9jaG9zZW4ueWFtbCNMNzc6Cj4+ID4gPgo+PiA+ID4gICAgICRyZWY6IHR5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQ2NC1hcnJheQo+PiA+ID4gICAgIG1heEl0ZW1zOiAyCj4+ID4gPiAg
ICAgZGVzY3JpcHRpb246Cj4+ID4gPiAgICAgICBUaGlzIHByb3BlcnR5IChjdXJyZW50bHkgdXNl
ZCBvbmx5IG9uIGFybTY0KSBob2xkcyB0aGUgbWVtb3J5Cj4+ID4gPiByYW5nZSwKPj4gPiA+ICAg
ICAgIHRoZSBhZGRyZXNzIGFuZCB0aGUgc2l6ZSwgb2YgdGhlIGVsZiBjb3JlIGhlYWRlciB3aGlj
aCBtYWlubHkKPj4gPiA+IGRlc2NyaWJlcwo+PiA+ID4gICAgICAgdGhlIHBhbmlja2VkIGtlcm5l
bFwncyBtZW1vcnkgbGF5b3V0IGFzIFBUX0xPQUQgc2VnbWVudHMgb2YgZWxmCj4+ID4gPiBmb3Jt
YXQuCj4+ID4gPgo+PiA+ID4gSGVuY2UgImxpbnV4LGVsZmNvcmVoZHIiIHNob3VsZCBiZSBhIHBy
b3BlcnR5IG9mIHRoZSAvY2hvc2VuIG5vZGUsCj4+ID4gPiBpbnN0ZWFkIG9mIGEgbWVtb3J5IG5v
ZGUgd2l0aCBhIGNvbXBhdGlibGUgdmFsdWUgb2YgImxpbnV4LGVsZmNvcmVoZHIiLgo+PiA+ID4K
Pj4gPgo+PiA+IFRoYXQncyBhIGJpbmRpbmcgZm9yIGEgcHJvcGVydHkgb24gdGhlIC9jaG9zZW4g
bm9kZSwgdGhhdCBhcyB0aGUgdGV4dAo+PiA+IHNheXMgaXQncyBkZWZpbmVkIGZvciBhcm02NCBv
bmx5IGFuZCB0aGUgY29kZSB0aGF0IGhhbmRsZWQgaXQgd2FzIGFsc28KPj4gCj4+IFRoYXQgZG9l
c24ndCBtZWFuIGl0IG11c3Qgbm90IGJlIHVzZWQgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyA7LSkK
Pj4gQXJtNjQgd2FzIGp1c3QgdGhlIGZpcnN0IG9uZSB0byB1c2UgaXQuLi4KPiAKPiBJdCBpcyB1
c2VkIG9uIGFybTY0IGJlY2F1c2UgbWVtb3J5IGlzIG9mdGVuIHBhc3NlZCBieSBVRUZJIHRhYmxl
cyBhbmQKPiBub3Qgd2l0aCAvbWVtb3J5IG5vZGUuIEFzIHJpc2N2IGlzIGFsc28gc3VwcG9ydGlu
ZyBFRkksIEknZCB0aGluayB0aGV5Cj4gd291bGQgZG8gdGhlIHNhbWUuCj4gCgpXZSd2ZSBoYWQg
dGhpcyBkaXNjdXNzaW9uIGJlZm9yZSwgcmlzY3YgdXNlcyAvbWVtb3J5IGZvciBub3cgYW5kIGV2
ZW4gaWYgCndlIHN3aXRjaGVkIHRvIGdldHRpbmcgbWVtb3J5IGZyb20gQUNQSS9VRUZJIHRhYmxl
cywgdGhlIGVsZiBjb3JlIGhlYWRlciAKaXMgcGFzc2VkIGZyb20gdGhlIGNyYXNoZWQga2VybmVs
IHRvIHRoZSBrZHVtcCBrZXJuZWwsIGl0IGhhcyBub3RoaW5nIHRvIApkbyB3aXRoIFVFRkkgc2lu
Y2UgdGhlIGJvb3Rsb2FkZXIgaXMgdGhlIGtlcm5lbCBpdHNlbGYuIEFtIEkgbWlzc2luZyAKc29t
ZXRoaW5nID8KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
