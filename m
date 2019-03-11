Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A08C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87202075C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QbWjdHyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADGkCY/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87202075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB0FvE1nDCAPviK6GcGDc4St4xrt6J4QQby6J4e+VLE=; b=QbWjdHyDY7BHJa
	pYzgcYG8yZuKF8b+cx2DsyYbjBjauiiM6Vfpt+GHRMkTyTBbduY9hWK4eLHK2kWvLB1hkGI8FPpwH
	ax1hZPhipLix0yFlDlTEq0Q/gapOt0gCynLuh++lbawM4ervTLwtcVsLhPUtP/zND6VPx9WevtLRQ
	hLCiyio4KqzFTvep73piV38jyZCGDS7sV3Qf1s9zvrGhSWlQaAqb1lcS678f62rBPlbG2um0Lyp92
	kwCTz/YwTXA7IfIGxNTgQXFX6RDgIlhWZnU4AObtenwBaFJ71i/BaAGYZFFjXT/UrsuUh28QNeXJ/
	x5RMc0WJwnE0rNPiAU4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3MUZ-0003nz-2v; Mon, 11 Mar 2019 15:05:27 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3MUW-0003na-Id
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 15:05:25 +0000
Received: by mail-qt1-x835.google.com with SMTP id b3so5395066qtj.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7iXxOWg7jedOT3c1XkNVQOf52LrQ7uKyKIBVk1YF1eE=;
 b=ADGkCY/3j/sb5LY13kMzMiMRyRtgSCdigsgdN370oeVPU3hJN4L+xeLicbgsWKVQor
 6xKFhfWPPpJZJmnfi7v1QSIq9OZvah75StJ4FDBol1O+NzX0CWVeW/z4c6C1Ci47rhoe
 5XvXeKJXMo3Dmo3l4uZ6yzCoG82NoXnxq1DqKnx2SD1/RyYxi35GYMSGqVdhkutmCJ+H
 tsFghzd+CjompMobK9gDJ2PEXdfy7O1EIPTyLmD4LRMr61MLK26Bbrtuyq/pxlTWzPUO
 Znwq6iNDGPLBB0wuKsnxqgvUbvoLztQMJOGfXF+lXecMFVo90LG5+U/gSGTOE/Y9OtvI
 EONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7iXxOWg7jedOT3c1XkNVQOf52LrQ7uKyKIBVk1YF1eE=;
 b=Fy1DiK/YpIox/0oSjtWF+jokUkXpQ2q+IYZ5MhG3R7wr97ZowinEAH8TU9RTsJCW3a
 fApk3mBwKAR4UnnJuiPuqi8jxosaFav5yQvyjHW6Ggc/h0b8w0IrjKd4wJqciAoCSCVT
 stv0NbsSJfJH5JilPK6aOk1ghBJtouQl3gyZWAH4zeEBp2qVCYKuzPyVbnxp8NcFejUA
 vSMjJ84MdtHwMRTrBH2GfTctCKrsw5Ske9dyL8h/k55qarWfQD+vgzYdP+fTyYljqnRb
 D20PWrNag9leNZJ7a3opZCaDVUjgUyr6JQKrIffb6+G2/AyrgZz1uGrMr9+t1Om6rcZe
 RGtg==
X-Gm-Message-State: APjAAAW5Rp7l8lsOQx48wWQKVxQp54+2JjGzLRVZ4RBJKhG5VEYA+jFZ
 a1Vu0ggDGehxosb8B142JPCz0ldTYV61UzJHUZQ=
X-Google-Smtp-Source: APXvYqw9/JsG+t0ts1jcGWkEQgyow/VN/2iVxb4hPSdw4bA/GmQdtupwTnOBRQoMZltyQJHC/AFHkoNISFdKCmYv5/8=
X-Received: by 2002:aed:3783:: with SMTP id j3mr26589914qtb.16.1552316723076; 
 Mon, 11 Mar 2019 08:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
In-Reply-To: <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 11 Mar 2019 16:05:11 +0100
Message-ID: <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Christopher Lameter <cl@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_080524_640849_C150EF37 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBNYXIgMjAxOSBhdCAxNTo1NiwgQ2hyaXN0b3BoZXIgTGFtZXRlciA8Y2xAbGlu
dXguY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMTEgTWFyIDIwMTksIEJqw7ZybiBUw7ZwZWwgd3Jv
dGU6Cj4KPiA+ID4gVGhhbmtzIGEgYnVuY2ghICBJIGZlZWwgbGlrZSB0aGUgYmVzdCBvcHRpb24g
aGVyZSBpcyB0byBqdXN0IHVzZSB0aGUgQU1Pcwo+ID4gPiB3aXRob3V0IGRpc2FibGluZyBwcmVl
bXB0aW9uIGFuZCBlbnN1cmluZyB0aGF0IGFsbCBvdGhlciBhY2Nlc3NlcyBhcmUgYXRvbWljCj4g
PiA+ICh2aWEgQU1PcyBvciBMUi9TQykuICBUaGUgb25seSByZWFzb24gSSBjYW4gc2VlIHRoYXQg
d291bGRuJ3QgYmUgdGhlIHdheSB0byBnbwo+ID4gPiB3b3VsZCBiZSBpZiBpdCByZXF1aXJlcyBu
b24tYXJjaCBtb2RpZmljYXRpb25zLCBhcyBpZiB3ZSBnbyBkb3duIHRoYXQgcGF0aAo+ID4gPiB3
ZSdsbCBiZSBhYmxlIHRvIGhhbmRsZSB0aGUgcGVyZm9ybWFuY2UgZWRnZSBjYXNlcyBpbiB0aGUg
aW1wbGVtZW50YXRpb24uCj4gPiA+Cj4gPgo+ID4gSG1tLCB5b3UgbWVhbiBBTU8gKndpdGgqIHBy
ZWVtcHRfe2Rpcyxlbn1hYmxlLCByaWdodD8gKE5vLCBpbnRlcnJ1cHQKPiA+IGRpc2FibGUsIG9u
bHkgcHJlZW1wdGlvbi4pCj4KPiBJZiB5b3UgZGlzYWJsZSBwcmVlbXB0aW9uIHRoZW4geW91IGRv
bnQgbmVlZCBBTU8gYW55bW9yZS4gSW4gZmFjdCB0aGF0IGlzCj4gdGhlIGRlZmF1bHQgZmFsbGJh
Y2sgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4gSnVzdCBkb250IGRvIGFueXRoaW5nIGFuZCB5b3UK
PiBhbHJlYWR5IGhhdmUgdGhhdCBzb2x1dGlvbi4KCkJ1dCB0aGUgZ2VuZXJpYyBvbmUgZGlzYWJs
ZXMgaW50ZXJydXB0cywgcmlnaHQ/CgpJIGJlbGlldmUgdGhlIHJhdGlvbmFsIGZvciBSViBpcyBz
aW1pbGFyIHRvIEFSTSdzOyBBTU8rcHJlZW1wdGlvbgpkaXNhYmxlIHJlZ2lvbnMgaXMgKnNsaWdo
dGx5KiBiZXR0ZXIgdGhhbiB0aGUgZ2VuZXJpYywgYnV0IG5vdCBhcyBnb29kCmFzIHRoZSBJQSBv
bmUuIE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
