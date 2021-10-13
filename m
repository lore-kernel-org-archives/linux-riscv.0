Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AF0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1B460ED4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD1B460ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olLf2LhdvUE6YJZ+KFUuTXMRlQ6gXbhDtt3dBZXiu3E=; b=2MK2W71nbDmAeg
	HT1erho0IjPTHgwa/aJR19ekGogtLIPfRU6ZRVPwACgh2o52EMFVt2a8QdalfewJSWQh6JrymyuqJ
	36aVRiQI35Gg42adz0zIW4XD7UFGjHISYf+pTCwwbK3bzHGZqs7tpcyxJsEedEyMvWne205Zwq6A2
	FoTCIvFBtxSY7YNqEju7zSxPILF7eGgggfcabcLcUu/3UPi/xqmTxz3+gb++Fk4BsUF8sqwX3kq3j
	txSjAy7XHMWa69BQWYqTR56Wx7J4QoHJ4ctcLbvoyMppTBgHF/gO61b+BLyZ4rtEqtcr8G9mfz/Ia
	2PTnw7KWn4n7TqqabyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mac1b-00GAH1-Hz; Wed, 13 Oct 2021 11:02:19 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZyL-00FeLr-Gk; Wed, 13 Oct 2021 08:50:51 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M58zc-1mZTVa2t0u-00182b; Wed, 13 Oct 2021 10:50:46 +0200
Received: by mail-wr1-f46.google.com with SMTP id y3so5815110wrl.1;
 Wed, 13 Oct 2021 01:50:46 -0700 (PDT)
X-Gm-Message-State: AOAM531woS1HPihZyXk3LKTplRhUP7g15FSm3c+gIuxNSPahIb22t1pd
 LTE6Aq14MmGT+Qy0tIU/PVDw4f0ZH9+siKxB/wg=
X-Google-Smtp-Source: ABdhPJy4ax2DOEenbhpvRSkuJ9CRdYTu4grvvOPn7yMQSLzLP/3xJn1PX15gLIrH87BwseWRBSVj7ZpEfl6RXEtn7Q0=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr8654190wmq.82.1634115035568; 
 Wed, 13 Oct 2021 01:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211013005532.700190-1-sashal@kernel.org>
 <20211013005532.700190-11-sashal@kernel.org>
 <YWZ1om+pLmV3atTd@kroah.com>
 <CAK8P3a2AC9-ogoxi1q+NQyBqMwrFqSZtHvZVdJ9HF+OLB3O62g@mail.gmail.com>
 <20211013084538.vitv6u5ahds7arpw@pengutronix.de>
In-Reply-To: <20211013084538.vitv6u5ahds7arpw@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Oct 2021 10:50:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HVJ6B8Mu8xS5FTvKncKyvz0bzR_NSdhGYp=syuORmCA@mail.gmail.com>
Message-ID: <CAK8P3a0HVJ6B8Mu8xS5FTvKncKyvz0bzR_NSdhGYp=syuORmCA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 11/11] firmware: include
 drivers/firmware/Kconfig unconditionally
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, 
 Sasha Levin <sashal@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Sergei Trofimovich <slyfox@gentoo.org>, Jens Axboe <axboe@kernel.dk>,
 ben.widawsky@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-ia64@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:9fDk0bFWC3zd1H/PdzN1N7FGPYtt3RpTmbQUFRyXJc8lkFA+J+k
 JZ727xBbGyDFUJj1uLqMox+BaE/obfciyzl/np5g5N+inD+fHVfN0RWAZzrwuhnzPvpatPo
 uKd4cD5YGGJXlnfjlJaIm8wwVKzfgJ9YbeIQZZvg1S5UJBDta6GXRAKK38UymaA1ZnrG+1Y
 /dkFUzECtzvPN1bfCPRWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nBz20j+wQ4U=:mp0DogiYv8MxswY5Plvifl
 Z7wajBeYwuxYnEblbfYsk47/ia5Ebacxxw3vh+opxhZLX6w9CzeVVRhqLafI3ZWVYSgidYS/A
 5HqSFD181864bHxLMyad8qGQ86tKXrvkh9i8+8mY5NGKO1z585TkNfZabNtal9curNRl8wCqZ
 PqwBOJyGhOqNUFSA9f9l0eJbhNo4RPu2lgZELltbd39uPLSdkI52AR3V5Gjg7A4wggWgWNAiA
 eMSz+Ichtc7mKHyxI3s53c2NI1xp2WdwlnPL2ftQrHKhedIzePTwOr8KMRYNWPw0CbHxLjPmE
 4puu/gddEPwyP0t/w33t+wWQ+0hllbiPQ33qxBnKaKadNb0bW00e2wZ03NmFtOSocyQfBRawE
 NE6xFP5rc+t78WZdupu/Ij8AoZKxMSNrQ3oQYDJsXsbiGfxPowEdJfZVPRLsKJOITKTedh6cS
 OC2svuU66Z2x7pr7vGBMu3Fvlxhk7XplMrwNtDDyauN+pJ1pDElnC/JeJ1WuF9w9wyDpGGtKO
 Mh6QL87JpmHReg46mrMG0+gRLv1hvkXrXhyGWuz/E+OI9eIsrSraRiDZ9IHQVYHgh7Ja/uB4e
 3mQGCS1/gPuVJ7u921we5nDQDuOsfNktE3lACZiRXmbDVIkaHiQQiqPaNiyEwZtavIszcFwOO
 3aoaEdB4dVo5a8waW0H0cB7F+A6fF+C0hFBhjAYeYGkzPPbx3beP9Q3evPJA8eC3biJEaAP8w
 AvbPv96PtyIJkvIwr/NSM1qWYfW/43fJh60YNu+Z4NjhTGlFLbSnu/KPaG0W4QMYjEDnBLDHw
 JCBrNnQuTwlowqbk//ebXFNdDiMmI0vtcq9sUZ6qOl2HtJ8H0ETwa31CriCl4a4QOYlUHeqZF
 IecaMDnDap7eaw5QSgsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_015049_875998_C6CA9DAD 
X-CRM114-Status: GOOD (  19.55  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgMTA6NDUgQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTMsIDIwMjEg
YXQgMTA6Mzg6MDFBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE9uIFdlZCwgT2N0
IDEzLCAyMDIxIGF0IDc6NTggQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAxMiwgMjAyMSBhdCAwODo1NTozMVBNIC0wNDAwLCBT
YXNoYSBMZXZpbiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBpc24ndCBmb3Igc3RhYmxlIGtlcm5l
bHMsIGl0IHNob3VsZCBiZSBkcm9wcGVkIGZyb20gYWxsIG9mIHlvdXIKPiA+ID4gQVVUT1NFTCBx
dWV1ZXMuCj4gPgo+ID4gQWdyZWVkLiBUaGUgc2Vjb25kIHBhdGNoIHRoYXQgZGVwZW5kcyBvbiB0
aGlzIGRvZXMgZml4IGEgKHJhbmRjb25maWcpCj4gPiBidWlsZCBpc3N1ZSBpbiBzdGFibGUga2Vy
bmVscyBhcyB3ZWxsLCBidXQgdGhhdCBwYXRjaCBpcyBjdXJyZW50bHkgYnJva2VuLAo+Cj4gRml4
aW5nIHJhbmRjb25maWcgaXNzdWVzIGlzbid0IGltcG9ydGFudCBmb3Igc3RhYmxlLCBpcyBpdD8g
VGhlIHRhcmdldAo+IGF1ZGllbmNlIGZvciA1LjEwLjc0IGFyZSBwZW9wbGUgcnVubmluZyBhIGtl
cm5lbCBiZXR3ZWVuIDUuMTAgYW5kCj4gNS4xMC43MywgYW5kIHRob3NlIGRvbid0IHN1ZmZlciBm
cm9tIHRoaXMgdHlwZSBvZiBidWlsZCBwcm9ibGVtLCByaWdodD8KCkluIGdlbmVyYWwsIEkgdGhp
bmsgcmFuZGNvbmZpZyBidWlsZCB0ZXN0aW5nIGlzIHVzZWZ1bCBmb3IgdmFsaWRhdGluZyBzdGFi
bGUKa2VybmVscywgdG8gaGVscCBhdm9pZCByZWdyZXNzaW9ucywgYnV0IHRoZXJlIGFyZSBhIG51
bWJlciBvZiBrbm93bgpyYW5kY29uZmlnIHByb2JsZW1zIHRoYXQgeW91IGhpdCBtdWNoIG1vcmUg
ZnJlcXVlbnRseSB0aGFuIHRoaXMgb25lLAp3aGljaCBvbmx5IGJyZWFrcyBvbmNlIGV2ZXJ5IGZl
dyBodW5kcmVkIGtlcm5lbCBidWlsZHMuCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
