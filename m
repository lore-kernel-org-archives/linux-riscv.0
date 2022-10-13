Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 01:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qq42cn5NeTJ7Fj09kmA8o8Cqfuk8PZBVONbCw3gjikA=; b=j986FdPUJgXlYSSeZ+vYC3RgwV
	2KS2trffuMIF17QdiasZrKFx5gaFQ6TaeRWM4nsuhNErhdBk7YUMjTx8WfO2If3ZKwNRt9nxUFMex
	tRCRlyTI3mhmA3NzSuvbsdgdQ7503eO/u9OD9bGqthY9L9mtK5piGWJkPtSBA5kOlX0OGoVegyFhl
	R9ZZmsWoP+KxRCClqp2FPBoWblVpjEVdQvxo6U4szcwXPEFS9rytbFVtX+LdMhMr4Nt/W6+eUeujA
	oq1aiWrGDIXKpgPjBivK99i87L15ql8aHH9cUuI9yzWcVvlGMYxOlDN2EMRnepL/oX37UiamZrJam
	96Ib/0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oimnM-00A6xN-O1; Thu, 13 Oct 2022 01:13:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oimnJ-00A6wU-2l
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 01:13:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so611566pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 18:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RKd777MIYoIIVQ6XhfShwD3+v+U8DMLyhNzrtcTaEg=;
        b=Z0zSNWAUoNLiqMue3mKOufe5ScyxUMjDjumVNdmVuM/Na0ixjQkJkiqNfZonBYVxyU
         DK2YMQs+dcgm7db2Mo/AbT7fgazGzQKzw5Go0KFHUAO4sR/xufjCewyWb46bgC/GLyli
         /BD1NbDd9xFgTtYl/f9d6prl9h78u5XQE002/YGowA8nTCY6sQT5soJ1yxjPZt//GE/U
         iMv5l3zKsaMcr+Wb0G9kNDeb9Z7FAokkzbHMlokg6pNjDJP2l3eszaYFv3k3FXmEUvcR
         Wh6gXSx4yyiVKFTI1XjwkU0AZqgGfeMZqL/n9dtA6ed5pYM+yUaAri5wD/qG2fUS31tX
         SLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RKd777MIYoIIVQ6XhfShwD3+v+U8DMLyhNzrtcTaEg=;
        b=lWnB5aTJIesjFDDwLb6O5CryVwnyBmZQy0bsU7JYvbkAh71V78TBwVLdmLapv0WdPu
         aELcjAfiiCTa43eftR/kEe8wB1NKedyv1H/ubqb2vCrsCnrsRpRwL6yXa3qRf9C0k4BN
         ZEFfn+I3feUZfYXdL9eIECJhJRab8qtHomg1K+KhUnX2ZmXTODAv0L1oWH0JcGCYh/UJ
         PJsItcLOq0NyzNUPucIAva/qrzzdcBbEWIS3u40B/Vd2z4qb7PKM+H3ZO//SDvV1A/ZM
         Gr37qPa6dS8/8ByiqbG8b4WaRxnRzeK1VCinJ0zZBg2rQWabIunh4oNfLaaXvasegRjY
         foIw==
X-Gm-Message-State: ACrzQf1UW5ibYmWtLzV5ee7SW6MLgL/ZieORL4lrOxamqnDFrxbe0l6h
	yZf/cMtJySR5dcNgEtpLel3d0EG6526HYQ==
X-Google-Smtp-Source: AMsMyM6ciDKco6zjkdt0IPDad9ZVxhrdbjuNdAApplmG0UVmdCNi7m2Lgz4kFmzMCV5uqHh8lyGapA==
X-Received: by 2002:a17:90b:1b4f:b0:20d:6ddd:9ef6 with SMTP id nv15-20020a17090b1b4f00b0020d6ddd9ef6mr8068873pjb.200.1665623631020;
        Wed, 12 Oct 2022 18:13:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b0018157b415dbsm8601358pln.63.2022.10.12.18.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 18:13:50 -0700 (PDT)
Date: Wed, 12 Oct 2022 18:13:50 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 16:45:01 PDT (-0700)
Subject: Re: [PATCH] riscv: enable software resend of irqs
In-Reply-To: <87czaz7wl9.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
CC: conor.dooley@microchip.com, aou@eecs.berkeley.edu,
  Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
  samuel@sholland.org, dfustini@baylibre.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org, Marc Zyngier <maz@kernel.org>, tglx@linutronix.de
Message-ID: <mhng-92f4a77e-550d-47b9-8b09-4bceee203b60@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_181353_364150_B8A3EF6C 
X-CRM114-Status: GOOD (  14.05  )
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

T24gTW9uLCAxMCBPY3QgMjAyMiAwNDoyMTozOCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cml0
ZXM6Cj4KPj4gVGhlIFBMSUMgc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBkZXNjcmliZSB0aGUgaW50
ZXJydXB0IHBlbmRpbmdzIGJpdHMgYXMKPj4gcmVhZC13cml0ZSwgb25seSB0aGF0IHRoZXkgImNh
biBiZSByZWFkIi4gVG8gYWxsb3cgZm9yIHJldHJpZ2dlcmluZyBvZgo+PiBpbnRlcnJ1cHRzIChh
bmQgdGhlIHVzZSBvZiB0aGUgaXJxIGRlYnVnZnMgaW50ZXJmYWNlKSBlbmFibGUKPj4gSEFSRElS
UVNfU1dfUkVTRU5EIGZvciBSSVNDLVYuCj4+Cj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi9yaXNjdi1wbGljLXNwZWMvYmxvYi9tYXN0ZXIvcmlzY3YtcGxpYy5hZG9jI2ludGVycnVw
dC1wZW5kaW5nLWJpdHMKPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KPgo+IFdha2luZyB1cCBhbiBvbGQgdGhyZWFkLiBGV0lXLAo+Cj4g
UmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpUaGFua3MuICBU
aGlzIGxvb2sgcmVhc29uYWJsZSB0byBtZSwgbm90IHN1cmUgaWYgdGhlIGlycWNoaXAgZm9sa3Mg
aGF2ZSAKYW4gb3BpbmlvbiB0aG91Z2g/CgpJbiB0aGVvcnkgdGhlIFBMSUMgaXNuJ3QgdGhlIG9u
bHkgaW50ZXJydXB0IGNvbnRyb2xsZXIgKGFuZCB0aGF0IHNwZWMgCnByZWRhdGVzIG1vc3Qgb2Yg
dGhlIGltcGxlbWVudGF0aW9ucyksIGJ1dCB0aGUgU2lGaXZlIFBMSUMgZGVyaXZlZCAKaW50ZXJy
dXB0IGNvbnRyb2xsZXJzIGhhdmUgYmVjb21lIGEgZGVmYWN0byBzdGFuZGFyZCBhbmQgSUlSQyB0
aGV5J3JlIAp0aGUgb25seSB0aGluZyBzaGlwcGluZyByaWdodCBub3cgc28gSSB0aGluayBpdCdz
IE9LIHRvIGp1c3Qgc3RpY2sgdGhpcyAKaW4gYXJjaCBjb2RlLiAgV2UgY291bGQgbWFyayBpdCBh
cyAiaWYgU0lGSVZFX1BMSUMiIG9yIHNvbWV0aGluZywgYnV0IEkgCmRvbid0IGtub3cgaWYgdGhh
dCdzIHdvcnRoIGRvaW5nLgoKRWl0aGVyIHdheSwgdGhpcyBpc24ndCByZWFsbHkgbXkgdGhpbmcu
ICBIYXBweSB0byB0YWtlIGl0IHZpYSB0aGUgUklTQy1WIAp0cmVlLCBidXQgCgpBY2tlZC1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ClRlc3RlZC1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ICMgb24gUUVNVQoKaWYgeW91IHdhbnQgaXQgdmlh
IHRoZSBpcnFjaGlwIHRyZWUuICBJIHB1dCBpdCBvdmVyIGF0IApwYWxtZXIvcmlzY3YtaXJxX3N3
X3Jlc2VuZCBpbiBjYXNlIHlvdSB3YW50IHRvIGRvIGEgc2hhcmVkIHRyZWUgb3IgCnNvbWV0aGlu
ZywgYnV0IHRoYXQgc2VlbXMgcHJldHR5IG92ZXJraWxsIHRvIG1lIGhlcmUuICBJdCdzIHBhc3Np
bmcgCmFsbCBteSB0ZXN0cywgYnV0IHRoYXQncyBqdXN0IFFFTVUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
