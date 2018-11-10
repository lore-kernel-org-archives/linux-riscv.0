Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A352C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B59F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8/Fe1vu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HC0ZIXb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B59F20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bezlvwTylaKYXIHreothY4WBJzz7fzAYiIKWi8tBjqo=; b=T8/Fe1vu1cjJcxuUcFMP40KkQ
	N0r4yiPR4GkOR0ZugnRg6E+mAU980kfB1dbUR6XK+Sg0fWtO5BtfVMRv6huLUOMtl030KL82UzXHS
	LZ8VDzq4BWvUK4I53nEcAnmi7Ezjiz2M5WpP9ybE6XsiRpGOjnkJNV8NYLs70OV7CZcjtvrFYemdx
	ydP9caXgjg9qqWWkOykxHNCJxg1ji+hLXn7FGyrWYESS7FMuRuDq4q8UiR/2z2vqimCXT0CRjy8SP
	tHUGN3PzvE7ZwokGTuWS0ZaobCmdix1Mw7E5AZ/RX0ZJKLKlpFWJdgJpIPEMZa/144ScDHY7mLwJ0
	eQBld5tNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXYM-0004av-FN; Sat, 10 Nov 2018 18:00:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXYK-0004aj-US
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 18:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVCspZLlmZetMtu0oyL3yZ8L30IS3+/bdG5mZP5xX6Q=; b=HC0ZIXb7ihBRak+CfoAL7zi6aX
 +KbBhFvh9BOSKVNdLNNXMW656SB1NyGBLwNOz6o7puo8IESI0zDU3amm+R0dbM/GYOLYjSaD/pGnp
 yf++MNyxaL+oZlRpuGOW6rn2iKCQcGe/UYKPxOHB/ImjE8AXogA0koTyl31ZhGGmUBP78ljVxQjFM
 ZClrWJMRh7iVumnhvHkB2iPkz9Ah/ALkM5DwGJgwQ52wt18vSC0lhh6Bmm3GWD6chL7qKv4dfNoej
 vg8ejENFOvV9cOoj/GK32YnahXfM0uIzZ0NrjqhbJvutQn1/N48IL939ZEv25RbXf/BYrDQ9xFzh4
 KlLBxfeg==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXYI-0001n0-0a
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 18:00:11 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAAHxjo7053371; Sat, 10 Nov 2018 19:59:47 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-c5-5be71c8e45cd
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 3A.CD.03682.E8C17EB5; Sat, 10 Nov 2018 19:59:43 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAAHxgvf005289; Sat, 10 Nov 2018 19:59:42 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 10 Nov 2018 19:59:42 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Message-ID: <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsXSHc2orDtB5nm0wclrOhYPe+4wWZy48o/R
 YtuS1awWO3e/YLXYcjvGouXDO1aLRSu+s1i0tn9jsjg9YRGTxbbPLWwWp98sYLJYev0ik0Xz
 u3PsFju77rBanLr+mc1i84QFrBZts/gtNh1Ms9j+op/N4vnKXjYHEY89p2cxe6yZt4bRY+rv
 MyweO2fdZfeY+eohk8euXY3sHg83XWLy2LxCy2PzknqPKyeaWD3eX//N5nGp+Tq7x+bT1R7t
 B7qZAviiuGxSUnMyy1KL9O0SuDL2NR5hKZjKXXHl6kb2BsYPHF2MHBwSAiYSD194djFycQgJ
 HGaUWLb3ODuEc4hR4tS1tcxdjJxARaYSs/d2MoLYvAKCEidnPmEBsZkFLCSmXtnPCGHLSzRv
 nQ1WzyKgKrFz1SQmEJtNQFNi/qWDLCDLRAQMJLqfB4LMZxZ4wSLRtG4JO0iNsIC+xJTPh1hB
 bH4BYYlPdy+C2ZwCgRKH5jYyQxx0g1li2e4lzBBHuEjc+AfRLCGgIvHh9wMwW1RAWeLFiems
 ExiFZiG5dRaSW2chuXUBI/MqRoHEMmO9zORivbT8opIMvfSiTYzg+J7ru4Px3AL7Q4wCHIxK
 PLw/lj+NFmJNLCuuzAWGDAezkgiv7BagEG9KYmVValF+fFFpTmrxIUZpDhYlcd7DL8KDhATS
 E0tSs1NTC1KLYLJMHJxSDYzLJj1kc/7S/3nl+RSzFKkNtn9b9VkTpZfdlX3Yb3hvz+XJoe9W
 OZW55PPP+nz09+oYjny9NV1SCo0Xt3EV/rrdvaerVVN1K9v/v//m3t4940Z1v/tvQVXpjatr
 ZxRIM5jnWAt4/3GOme/Rqh041fl96j8Op5eiJsXv3yhOV/2/8OD+01+VD2QpsRRnJBpqMRcV
 JwIAd/DBUesCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_180010_198939_1B5790F8 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, mick@ics.forth.gr,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com,
 Olof Johansson <olof@lixom.net>, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175942.N7vFF_Tny_1mbas0aVq-Hk0k127vjKdsqb54gfxV3lA@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAxOTo0NywgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDO
rc6zz4HOsc+IzrU6Cj4gT24gU2F0LCBOb3YgMTAsIDIwMTggYXQgNTo0MiBQTSBPbG9mIEpvaGFu
c3NvbiA8b2xvZkBsaXhvbS5uZXQ+IHdyb3RlOgo+IAo+PiBUaGUgY2FzZSBvZiBjb25zb2xlIGlz
IGluIHRoaXMgY2FzZSBwcmV0dHkgc2ltcGxlOiBJdCdzIGludGVuZGVkIGZvcgo+PiBlYXJseSBi
b290IGZvciB2ZXJ5IHNpbXBsaXN0aWMgZW52aXJvbm1lbnRzIChiZWZvcmUgdGhlIHJlc3Qgb2Yg
dGhlCj4+IGtlcm5lbCBpcyB1cCwgZXRjKS4gS2VlcGluZyB0aGUgU0JJIGNvbnNvbGUgYXJvdW5k
IGJleW9uZCBlYXJseSBib290LAo+PiBhbmQgc29tZWhvdyB0cnlpbmcgdG8gb3B0aW1pemUgZm9y
IGl0IGZvciB0aG9zZSB1c2UgY2FzZXMgaXMgYQo+PiBtaXNkaXJlY3RlZCBlZmZvcnQ7IHRoYXQn
cyB3aGF0IG5hdGl2ZSBkcml2ZXJzIGFyZSBmb3IuCj4gCj4gIHNwaWtlICh3aGljaCBpcyBvbmx5
IGFyb3VuZCA3LDAwMCBsaW5lcyBvZiBjb2RlKSBkb2Vzbid0IGhhdmUgbmF0aXZlCj4gZHJpdmVy
cywgYW5kIHFlbXUgaXMgdG9vIGhlYXZ5LWR1dHkgdG8gY29uc2lkZXIgYWRkaW5nIGN1c3RvbQo+
IGV4dGVuc2lvbnMgYW5kIGV4cGVyaW1lbnRhbCByZXNlYXJjaCBvbnRvLgo+IAo+ICB3aXRoIG5v
dGhpbmcgaW4gc3Bpa2UgKm90aGVyKiB0aGFuIHRoZSBzZXJpYWwgY29uc29sZSwgaXQncyB0aGUg
b25seQo+IHdheSBpbiBhbmQgb3V0Lgo+IAo+ICBsLgoKQW55dGhpbmcgbW9yZSB0aGFuIGEgbWFp
bi9kZWJ1ZyBjb25zb2xlIGlzIHRvbyBtdWNoIGZvciB0aGUgU0JJLCBpdHMKZ29hbCBpcyB0byBi
ZSB1c2VkIGVhcmx5IG9uIGluIHRoZSBib290IHByb2Nlc3MgdW50aWwgdGhlIE9TIG9yIHRoZQpi
YXJlIG1ldGFsIGFwcCB0YWtlcyBjb250cm9sLiBIYXZpbmcgbXVsdGlwbGUgc2VyaWFsIGxpbmVz
IHRocm91Z2gKdGhlIFNCSSBmb3IgdGhpbmdzIGxpa2UgUFBQLCBVUFMsIHZpcnR1YWwgY29uc29s
ZXMgYW5kIGFsbCB0aGUgc3R1ZmYKeW91IG1lbnRpb25lZCBpcyBvdXQgb2Ygc2NvcGUuIEJvb3Qg
YW4gT1MgYW5kIHVzZSB0aGUgc3RhbmRhcmQgVUFSVApkcml2ZXJzIGZvciBhY2Nlc3NpbmcgdGhl
IHNlcmlhbCBsaW5lcy4gSWYgdGhlcmUgYXJlIG5vIGRyaXZlcnMKb3Igc3VwcG9ydCBvbiBzcGlr
ZSwgaXQncyBvcGVuIHNvdXJjZSAhIEFsc28geW91IG1heSBhbHdheXMgdXNlCnRoZSB2ZW5kb3Ig
c3BlY2lmaWMgU0JJIHRoYXQgQXRpc2ggcHJvcG9zZXMgaGVyZSBmb3IgYWRkaW5nIHRoYXQKZnVu
Y3Rpb25hbGl0eSwgaGF2aW5nIHRoaXMgb24gdGhlIGJhc2UgU0JJIGlzIG5vdCB0aGUgcmlnaHQK
YXBwcm9hY2ggSU1ITy4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
