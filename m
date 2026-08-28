Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7FDC61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyPili4nwmpZVo9JS4AyUlAQpdgI0if2JtF9xjWjqz4=; b=1/nUcXMtU+7C7J
	9oTmAXjt0mpF+zojdj6JTgJnV2IhuOklAZWujiQ6Mid9dMA2FO3bdSAgsHFV6f5qJl1elq5+EUQa8
	ihtXLrGK6JgNfDcMJDTzwz+lDCettF8LhMmz125EIfl1c4wQPfUlC9ZpoUJOuPm0HMjmSFm/xu2o6
	2n4BpHdWvuEmeoKzVWF3IbYDzfXHXiOb0LC1ynVbSePIp1oH3foOKA0L+kUVN4REvze5Ryova9/+Q
	C4ECaLPiTtovBf/LUCVvZsfzXc5u1iX8LaoZ8jI5pIX3S6kDOUbPdjeUMxXTCnGce1g45Xz/ajHzG
	MQR2jsGj+LL6jE652LwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsAD-00000005Ki6-3szb;
	Fri, 28 Aug 2026 08:42:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsAA-00000005Khe-0v6n
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 08:42:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c252e703fa3so114547766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 01:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906532; cv=none;
        d=google.com; s=arc-20260327;
        b=rL71Eq/FN6sZiEENvglEhAPG0BOYQoLYUR3fl+WIAJ9VAiEPb6Ya35orVoPOaqsQ4O
         2KpFZYW4lWenc020JfikLTU9M0reNRfAJPo6cGsVhsavhNEPs7KtuTiMfRqO6Y8MDRDF
         mVYgRu2JbBxlUGdzFkx5tuvOHZ4YF8hiQjh7TgGGCK8BZqWCEc6g3zomcSEon+jjkMft
         6jQDWgrNS50AQWlOQ28306RTY3EhLAiAa3IjHVrXqMGfGr1PQcx8CIUCLgDbaL/uwD3n
         m3oFtSZJdzR+2YhBBdQ1/DDk2yHRPkyWNvz/gcw8gmOj8OlOazqJIctGgxvVx1iIgGSR
         iAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        fh=PHvAN65cPBjUmCAKEq1rzpelsPyAyTd88kIgiysLUKA=;
        b=oCyvBSz9zH7hV+jMMra9HOJgTkesXkBf7ShS4iWZDH7d9a/gDv0/vQtdoeZSOcJXNW
         yvo2FhsjPUk4gxlTG8aZdLIGcDuh1LYph4owKIN3L+HOlkhORGccVQxe5lxsGGtWYLt5
         rFphQ8JCyus3oMkNzZu15tvA2V3EW9VTpWMlw+5qZ+R1d5bV5RDRrZWc5hQyXLyosVGq
         cDib2z3gGxc9wHrCeAm/0gAl5HHjYURgnw3lpXAMeCpTIzCzoDK8Ux+0ud1lljzdXW/x
         VWYQmzw1xCkdGWn/6HULLFAJJm58e5WxJUJ4myVblT2OyzBpsAf47qtiBYJdI8+h61Gd
         cR+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787906532; x=1788511332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        b=SPBEZei7O5xUG539HSTk23kBeIZmbKo5wLsJ4lGp2U1UMt/PKrw0sB+PEbhysh916D
         SCLKd0NuKpcbGSK7+BoZhWo4oOUUoFg/iDNAj0sY92N9Ey3Iim20dAzvCVzgmIk5YIeB
         q03FlE3bmDH58LeChVM8FWXeYvUP2LojA3HAfGCU2id8/na1BcoLG+qsxpB75v46pR7O
         knfEe8xAQKPC31YY0Ha3VX3O7nBRWWTroZOYe7LsJomd7aO4sHDItl1ghD6lVhc5iLf1
         dHuQp60lj5Oc1cEp8+SBB1gyUflOUzhc+X5gR5S4ZmF3IDKe5FCSgu9Ks0R9NkjpdB1b
         NE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906532; x=1788511332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezFi05tPQzp8t++/2HJlKxh2g0ZUNbvpyQdfBqWin94=;
        b=jW6t8WH37htU37UbR5zPDpJ2AAe8DzgMTePQ2D8aYWVWSi5UQJLAdUD2uMWyLQMzbk
         hW2nTXqHtLdxow1Sfe3+1ZxiyKXgsqH///ceDuvKCsAZ0b0WY1b0RAwBeEFswG5epkMF
         iBdwc96CCSdKBpuSXJJBAtRh8CG+WR9cfMSixayOHJed8th2cxasXNliyx8pNvOuwgy9
         354g6vYtEMAKX7cRyk06EA9g08EtVse3WOCF6eAFv9Vo/e8m5uA11rpShWHcC4thfOCN
         v6L0HCdf3bsLIRLI7jr5G2Q5D+aEEKAJXcNhF252QnODVGNuB5xE6sKVmG1IIIWQ74jf
         +V2A==
X-Forwarded-Encrypted: i=1; AHgh+RodizLu47kqnYVVCteKjSLi18DYoHlplJg1FiGQXZF7yk6Yh2ik23oLZxQOemxyqSlzIE1/nPDObTYFHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lBii73TSPcdGEbIN1Ckcthw6PgSL/IWDUud+0C7aPtkdit02hv
	dPIwCqbFrc/cu3cBAUw7QsfIIWidfib7jeo3G2ZhdsmT3UsT3BR+b9zJ1MWcq9k+oBq0u5YNcwQ
	a8PsLeZIYHzG0toExOA7JyZXQotMGoNuebCHxJBWVmg==
X-Gm-Gg: AR+sD113YmcSBnMiz4xK4hMywlU4Oo5A1qJYK06QhQPdhrCoZQk0ZkejJ+aX15Uw46A
	9idab6TO/qDcTVqR4bxpIBhRS1W//HJ6nkBEF8OQStkBM2VytmBy4atzoTK9I1OlTTHJla/2NxW
	IfF60ySR+nhnnMm288uGGKO4UTn/p/0LfwZSOR0LdU1fTCMBRBADR0ci/Z4vspxHNQfTNjmW5dJ
	kBdcytwISpDg6bL23nmEkT4+r6jpDV+hBVwB8gtEZG5Y8XTXjRK/lSiyoTbou5ygU9pyHBwiTqa
	ogoiTOKRPvc0SUMw+D351n31Jx6wXDaNd5lmq9k9lBA5WK8=
X-Received: by 2002:a17:906:f596:b0:c24:c22c:6372 with SMTP id
 a640c23a62f3a-c2556bc89ddmr380599066b.5.1787906532051; Fri, 28 Aug 2026
 01:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin> <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
 <20260828085211.2c8e6b74@pumpkin>
In-Reply-To: <20260828085211.2c8e6b74@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Aug 2026 16:41:57 +0800
X-Gm-Features: AcwNN1Vs0PjxxPtn0TUC_KuzAnVZJvtJ55ltk6ptl2Y2t9swn9PGcyLQJdEC5LA
Message-ID: <CANXhq0q0pRXbL3sA9hFoFh6YGJh+M8SDUcXNhsHDA433mFb8+w@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_014214_327649_948699DD 
X-CRM114-Status: GOOD (  37.83  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgMzo1MuKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDI4IEF1ZyAyMDI2IDEwOjUy
OjA4ICswODAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gT24g
RnJpLCBKdW4gMTksIDIwMjYgYXQgMTI6MDLigK9BTSBEYXZpZCBMYWlnaHQKPiA+IDxkYXZpZC5s
YWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCAxOCBKdW4g
MjAyNiAxNzo1MTozNCArMDgwMAo+ID4gPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ID4gSGkgVml2aWFuLAo+ID4gPiA+Cj4gPiA+ID4gQXMgbm90ZWQgaW4g
dGhlIFJJU0MtViBJT01NVSBTcGVjaWZpY2F0aW9uLCBDaGFwdGVyIDY6Cj4gPiA+ID4gPiBXaGV0
aGVyIGFuIDgtYnl0ZSBhY2Nlc3MgdG8gYW4gSU9NTVUgcmVnaXN0ZXIgaXMgc2luZ2xlLWNvcHkg
YXRvbWljIGlzIFVOU1BFQ0lGSUVELCBhbmQgc3VjaCBhbiBhY2Nlc3MgbWF5IGFwcGVhciwgaW50
ZXJuYWxseSB0byB0aGUgSU9NTVUsIGFzIGlmIHR3byBzZXBhcmF0ZSA0LWJ5dGUgYWNjZXNzZXMg
4oCUIGZpcnN0IHRvIHRoZSBoaWdoIGhhbGYgYW5kIHNlY29uZCB0byB0aGUgbG93IGhhbGYg4oCU
IHdlcmUgcGVyZm9ybWVkLgo+ID4gPiA+Cj4gPiA+ID4gVGhlcmVmb3JlLCB0aGUgYXRvbWljaXR5
IG9mIDY0LWJpdCBNTUlPIGFjY2Vzc2VzIGlzIFVOU1BFQ0lGSUVEIGFuZAo+ID4gPiA+IG5vdCBj
bGVhcmx5IGRlZmluZWQgaW4gdGhlIGN1cnJlbnQgcmF0aWZpZWQgUklTQy1WIElPTU1VCj4gPiA+
ID4gc3BlY2lmaWNhdGlvbi4gVG8gaGFuZGxlIHRoaXMgY29ycmVjdGx5LCB0aGUgTGludXggUklT
Qy1WIElPTU1VIGRyaXZlcgo+ID4gPiA+IHNob3VsZCBmYWxsIGJhY2sgdG8gMzItYml0IE1NSU8g
YWNjZXNzZXMgd2hlbiByZWFkaW5nIDY0LWJpdCByZWdpc3RlcnMKPiA+ID4gPiAoZS5nLiwgcGVy
Zm9ybWFuY2UgY291bnRlcnMpLiBUaGUgYmVoYXZpb3Igb2YgMzItYml0IE1NSU8gYWNjZXNzZXMg
aXMKPiA+ID4gPiBtb3JlIHByZWNpc2VseSBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSU9NTVUgc3Bl
Y2lmaWNhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IFRodXMsIG1hbnkgaGFyZHdhcmUgdmVuZG9ycyBp
bXBsZW1lbnQgMzItYml0IE1NSU8gKHJhdGhlciB0aGFuIDY0LWJpdAo+ID4gPiA+IE1NSU8pIGJh
c2VkIG9uIHRoZSBjdXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCBh
bmQKPiA+ID4gPiB0aGlzIGRyaXZlciBkb2VzIG5vdCBhcHBlYXIgdG8gYmVuZWZpdCBmcm9tIDY0
LWJpdCBNTUlPIGFjY2VzcyBlaXRoZXIuCj4gPiA+ID4gUGVyZm9ybWFuY2UgaXMgZnVuZGFtZW50
YWxseSBjb25zdHJhaW5lZCBieSBidXMgbGF0ZW5jeTsgYXNzdW1pbmcgdGhhdAo+ID4gPiA+IHNp
bXBseSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGFjY2Vzc2VzIHdpbGwgaW1wcm92ZSBwZXJmb3Jt
YW5jZSBpcyBhbgo+ID4gPiA+IG92ZXJzaW1wbGlmaWNhdGlvbiB0aGF0IGlnbm9yZXMgdGhlIHVu
ZGVybHlpbmcgaGFyZHdhcmUKPiA+ID4gPiBjaGFyYWN0ZXJpc3RpY3MuCj4gPiA+Cj4gPiA+IElm
IHRoZSBidXMgbGF0ZW5jeSBpcyBzaWduaWZpY2FudCBpdCBpcyBhbG1vc3QgY2VydGFpbmx5IHdv
cnRoIHVzaW5nCj4gPiA+IG1lbW9yeSBhY2Nlc3NlcyB0byBhdm9pZCByZS1yZWFkaW5nIHRoZSBo
aSByZWdpc3Rlci4KPiA+ID4KPiA+ID4gU29tZXRoaW5nIGxpa2UgdGhpcyBtaWdodCB3b3JrOgo+
ID4gPgo+ID4gPiBzdGF0aWMgdm9sYXRpbGUgdTMyIGhpX3ByZXYsIGxvX3ByZXY7Cj4gPiA+Cj4g
PiA+ICAgICAgICAgdTMyIGhpID0gcmVhZF9yZWdfaGkoKTsKPiA+ID4gICAgICAgICB1MzIgbG8g
PSByZWFkX3JlZ19sbygpOwo+ID4gPgo+ID4gPiAgICAgICAgIGlmIChsbyA8PSBsb19wcmV2IHx8
IGhpICE9IGhpX3ByZXYpIHsKPiA+ID4gICAgICAgICAgICAgICAgIHUzMiBoaV90bXAgPSByZWFk
X3JlZ19oaTsKPiA+ID4gICAgICAgICAgICAgICAgIGlmIChoaV90bXAgIT0gaGkpIHsKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaGkgPSBoaV90bXA7Cj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGxvID0gMDsKPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAg
ICAgICAgIGxvX3ByZXYgPSB+MHU7Cj4gPiA+ICAgICAgICAgICAgICAgICBoaV9wcmV2ID0gaGk7
Cj4gPiA+ICAgICAgICAgfQo+ID4gPiAgICAgICAgIGxvX3ByZXYgPSBsbzsKPiA+ID4gICAgICAg
ICByZXR1cm4gKHU2NCloaSA8PCAzMiB8IGxvOwo+ID4gPgo+ID4KPiA+IEhpIERhaXZkLAo+ID4K
PiA+IEkgaW5jbHVkZWQgdGhpcyBpbiBteSB2NSBvZiB0aGUgSU9NTVUgUE1VIHNlcmllcywgYnV0
IHdlIG5vdGljZWQgdGhhdAo+ID4gc2FzaGlrby1ib3QgQUkgcmVwb3J0ZWQgdHdvIGlzc3VlczoK
Pgo+IEkgZGlkIHNheSAnc29tZXRoaW5nIGxpa2UgdGhpcycgbWlnaHQgd29yay4uLi4KPgoKR290
IGl0ISBUaGFua3MgZm9yIGNsYXJpZnlpbmcuIEp1c3QgdG8gc2hhcmUgd2l0aCB5b3UgYW5kIGV2
ZXJ5b25lCmhlcmUsIEkgd2lsbCBnbyB3aXRoIHRoZSBwcmV2aW91cyB2ZXJzaW9uLiBUaGFua3Mg
YWdhaW4hCgo+IERhdmlkCj4KPiA+Cj4gPiAxOiBUaGUgbG9fcHJldiBpcyBpbW1lZGlhdGVseSBv
dmVyd3JpdHRlbjoKPiA+IFRoZSB0cmFpbGluZyAncG11LT5sb19wcmV2W2lkeF0gPSBsbzsnIGlz
IG91dHNpZGUgdGhlIGlmIGJsb2NrIGFuZAo+ID4gcnVucyB1bmNvbmRpdGlvbmFsbHksIHNvIHRo
ZSAnbG9fcHJldiA9IH4wdScgaXMgY2xvYmJlcmVkIGJlZm9yZSB0aGUKPiA+IGZ1bmN0aW9uIGV2
ZW4gcmV0dXJucy4gSXQgbmV2ZXIgc3Vydml2ZXMgdG8gdGhlIG5leHQgY2FsbC4gbG9fcHJldgo+
ID4gZW5kcyB1cCBob2xkaW5nIHRoZSBndWVzc2VkIHZhbHVlICh0eXBpY2FsbHkgMCkgaW5zdGVh
ZCwgd2hpY2ggaXMgYQo+ID4gcGVyZmVjdGx5IG9yZGluYXJ5IHNtYWxsIG51bWJlciwgYW5kIHRo
ZSBpbnRlbmRlZCAiYWx3YXlzIHJlLXZlcmlmeQo+ID4gbmV4dCB0aW1lIiBiZWhhdmlvdXIgbmV2
ZXIgaGFwcGVucy4gVGhlIHNlbnRpbmVsIHdyaXRlIHdhcyBlZmZlY3RpdmVseQo+ID4gZGVhZCBj
b2RlLgo+ID4KPiA+IDI6IFRoZSB3cmFwIGNoZWNrIGl0c2VsZiBjYW4gbWlzcyBhIHdyYXAKPiA+
IEhlcmUgaXMgYSBjb25jcmV0ZSBzZXF1ZW5jZS4gQXNzdW1lIGEgcHJldmlvdXMgY2FsbCBsZWZ0
IGhpX3ByZXYgPSAxCj4gPiBhbmQgbG9fcHJldiA9IDUsIGkuZS4gdGhlIGNvdW50ZXIgd2FzIDB4
MV8wMDAwMDAwNS4gU29tZSB0aW1lIGxhdGVyCj4gPiB0aGUgY291bnRlciBoYXMgYWR2YW5jZWQg
Y2xvc2UgdG8gMHgxX0ZGRkZGRkZGOgo+ID4KPiA+ICAgMS4gaGkgPSByZWFkbChhZGRyICsgNCkg
IC0+IGNvdW50ZXIgaXMgMHgxX0ZGRkZGRkYwLCBzbyBoaSA9IDEKPiA+ICAgMi4gdGhlIGNvdW50
ZXIgY3Jvc3NlcyB0aGUgYm91bmRhcnkgYW5kIGJlY29tZXMgMHgyXzAwMDAwMDA4Cj4gPiAgIDMu
IGxvID0gcmVhZGwoYWRkcikgICAgICAtPiBsbyA9IDgKPiA+Cj4gPiBUaGUgY2hlY2sgdGhlbiBl
dmFsdWF0ZXM6Cj4gPgo+ID4gICBsbyAoOCkgPD0gbG9fcHJldiAoNSkgICAtPiBmYWxzZQo+ID4g
ICBoaSAoMSkgIT0gaGlfcHJldiAoMSkgICAtPiBmYWxzZQo+ID4KPiA+IEJvdGggYXJlIGZhbHNl
LCBzbyB0aGUgZmFzdCBwYXRoIGlzIHRha2VuIGFuZCAweDFfMDAwMDAwMDggaXMKPiA+IHJldHVy
bmVkLiBUaGUgdHJ1ZSB2YWx1ZSBpcyAweDJfMDAwMDAwMDgsIHNvIHRoZSByZXN1bHQgaXMgc2hv
cnQgYnkKPiA+IDJeMzIgYW5kIHRoZSB0aGlyZCByZWFkIG9mIHRoZSBoaWdoIGhhbGYgbmV2ZXIg
ZXZlbiBleGVjdXRlcy4KPiA+Cj4gPiBCb3RoIHNpdHVhdGlvbnMgc2hhcmUgdGhlIHNhbWUgcm9v
dCBjYXVzZTogSXQgcHV0cyB0aGUgcmVsaWFibGUgY2hlY2sKPiA+ICh0aGUgdGhpcmQgcmVhZCkg
aW5zaWRlIGFuIGlmIGd1YXJkZWQgYnkgdGhlIHVucmVsaWFibGUgY3Jvc3MtY2FsbAo+ID4gaGV1
cmlzdGljICdsbyA8PSBsb19wcmV2IHx8IGhpICE9IGhpX3ByZXYpJwo+ID4gQ2FzZSAxIGlzIGFu
IGlzc3VlIGluIHRoZSBib29ra2VlcGluZyB0aGF0IGhldXJpc3RpYyBkZXBlbmRzIG9uLCBhbmQK
PiA+IGNhc2UgMiBzaG93cyB0aGF0IGV2ZW4gd2l0aCBjb3JyZWN0IGJvb2trZWVwaW5nIHRoZSBo
ZXVyaXN0aWMgaXMgbm90Cj4gPiBzb3VuZC4KPiA+Cj4gPiBUbyBtYWtlIGV2ZXJ5dGhpbmcgc2lt
cGxlciwgSSB3b3VsZCB1c2UgeW91ciBmaXJzdCB2ZXJzaW9uIGZvciB0aGUKPiA+IGxhdGVzdCBJ
T01NVSBQTVUgc2VyaWVzOgo+ID4KPiA+ICAgICAgICAgaGkgPSByZWFkX2hpKCk7Cj4gPiAgICAg
ICAgIGxvID0gcmVhZF9sbygpOwo+ID4gICAgICAgICBpZiAoaGkgIT0gcmVhZF9oaSgpKSB7Cj4g
PiAgICAgICAgICAgICAgICAgLy8gUGljayBhIHZhbHVlIHRoYXQgaGFwcGVuZWQgd2hpbGUgZG9p
bmcgdGhlIHJlYWRzLgo+ID4gICAgICAgICAgICAgICAgIGhpKys7Cj4gPiAgICAgICAgICAgICAg
ICAgbG8gPSAwOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gPiBJdCBzaG91bGRuJ3QgbmVlZCBhbnkg
bG9ja2luZyBidXQgdGhlIGFjY2Vzc2VzIGRvIG5lZWQgdG8gYmUgb3JkZXJlZC4KPiA+ID4KPiA+
ID4gICAgICAgICBEYXZpZAo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
