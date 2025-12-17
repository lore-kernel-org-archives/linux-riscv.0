Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A1DD609D5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 01:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Xo+lgyX455l1WzjT6cTo0PK/EPDHnho3mKo8LgTScM=; b=PZho8bK5wvvcru
	uyjCBqTEqpMedVdkGndH5wC/ceavK4PHXXVoMoaitXIgPvczgYEp6KaJVf+InLZTwBlOXNoPyPw0s
	yS0Dyj87rx1TBnnGmkETvVQ7BQIBQQF5eRJKf0VvL8IrE2W4cSHbxHzSm5NF4sdI8wqDR40YymSfv
	3ZMRnXNgExI9Eb52h/oyZY+26mo/7iTzYe4Wml/FknTHCQJbP6cMiRGy/L5sLwelcGHz7XyXzaGzP
	p7yJma8wS2fweau93cfb1hxQhbWgBgrwPKOmR5oo8u61ObNRqNKjH6i8yXZ22lLBYgc933W/6xKY7
	PYXgbvuReM8okHM1dxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgG8-000000061JV-2Z8R;
	Wed, 17 Dec 2025 01:23:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgG5-000000061J0-0eE2
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 01:23:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-78c696717dbso48876417b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 17:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765934596; x=1766539396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20u+Yo9zixTpysc9eprKHwVlPvXZQniYnu0FOsSjV+s=;
        b=3bsL6xeXcOZ5rykpc2DqbFIimK3zOt5om/wR/hQd6G8JZMK9NHWIvnuLzuBpengG2d
         ML/ULeDpDc1te/FxyZkjtF21yoORKKKzuMC+iocKhLf1XIyjuKkECKIFutg/k9udeoC3
         cUeFHqCFHLWQNHo8JgQ3XJiNsLTy6lbPYt68NkXJVSO+BL0RcweFxi6Jb6dKAV+Qhjs+
         wIJxnouqXOCLdrKDgULe3I+mt4TzFJAKGFYo3DZHYt5UJnbClTHo0wmX2gnCyf6JjQgB
         lrYKJtKHMXpO99Q9ATlqVS7wnQE0XfQ+u+WeZm+7IaUxKWBABkhbxQurouE2cjQczv8I
         xQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765934596; x=1766539396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20u+Yo9zixTpysc9eprKHwVlPvXZQniYnu0FOsSjV+s=;
        b=WC5qFCKDKRCP3k7L+2b0L+1J5CVvqzqr9PKcwoCrGZr9BqgNccVgOVvgPSJmPnLk6k
         xp7bvaUz/fh3xs/Yskn2HH5dlPe6uAFQYexpUIvIa0YtgLzwAaU+M2ZVcBpBTdm/8fI4
         a6fCnowQ7l9KyPF760Pk6duAEYq7OdgBKIxkAXq4RiwTbyyhs3l4VC9H8pEEBR7bOAkn
         0YUcXteK8p9piWWT/BwUu36QsQV6Sxk7njRVyJZotA0/kBkGTISpkTXQuXy3i3oljBQC
         1OSxSopvBTOOqW2k5d+rE6oNnhqfr2GuQFS9vrqILDkcFPj0d6LEJfhSJhI53pZ1R6vX
         Yxog==
X-Forwarded-Encrypted: i=1; AJvYcCUq55ipa6u2W8xZrozP9RbUmpLOGnWSoDpV40BSOCZlSttSTx85upSnnHD+WqXop09kgyVpnF2fOJqvVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwYx3l5xMfLL4kfWqUZWE2msj4MqV/0KpEe8RQWUYn1RIiwJP4
	4e0ak9B7tPB9GfqTFGXTA2y0e46Gi/neYfPnonM4ATwxtP0PREj/DPZiZXuA5l+hMNUMLkd8KYA
	RPavLlyy2BezNL9mwjFllnnM0DuOAi1CJMdKOotSZgA==
X-Gm-Gg: AY/fxX51Ps+wPMo9/MunCsATfh3sQ6jU2D0sEFGV+rOvHN34oEzJFIV8iz+OUkPUTLp
	oQR28o8lSiXdt/AXLc2eG5MjJ3mNMoNmDcPF4wF+xfpH1w9QRWoh2VmmkcaGzYAu/yExGMMoHJN
	py1ureWwztoH3V2W7fbGB7D6wv3PANXs2o9KCRmBsnmW1vbsLD3WAqvfEkAmCa+WAtp96OrrLD+
	J0RrpmvHhghsNwJXyHPoOW8dzTV+zDa2aoQ3B2lHiaczdLrlgBy22Uu5A5LYuWxoGUVIqZjPr+M
	yiwaQ8YP2F3Md7nCctbrp1n9Ydqf8Bm8fxbP8uM7/ZiG
X-Google-Smtp-Source: AGHT+IFO05qMq19SSBI4gVmifTjzTpnb7vNwVZXOZr/LC4PrjB13iviO83n7Ke+Aymi58gBSK3b0Bq+DG4yndiKAVvo=
X-Received: by 2002:a05:690e:191d:b0:641:f5bc:6961 with SMTP id
 956f58d0204a3-64555664287mr10955876d50.77.1765934595707; Tue, 16 Dec 2025
 17:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com> <20251216150530-GYD1903981@gentoo.org>
 <20251216-wing-squander-2fed378d3035@spud>
In-Reply-To: <20251216-wing-squander-2fed378d3035@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 09:23:03 +0800
X-Gm-Features: AQt7F2pscWPGj2PRq6RScSaqgPax4HcbFJUbL6PI8fgs-Pvj3uUzlMNApnCVER8
Message-ID: <CAH1PCMb+Y6zUCpUNdMYfB3trKuEUsSKQ3kCn+wjoj2UA4o_CPw@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_172317_312533_2266890D 
X-CRM114-Status: GOOD (  14.68  )
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

T24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMTI6MzPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MDU6MzBQTSAr
MDgwMCwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gSGkgR3VvZG9uZywKPiA+Cj4gPiBPbiAyMTozMiBU
dWUgMTYgRGVjICAgICAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+IEFkZCBEVCBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gZm9yIHRoZSBTcGFjZW1pVCBLMyBTb0MgYW5kIHRoZSBib2FyZCBQaWNvLUlU
WAo+ID4gPiB3aGljaCBpcyBhIDIuNS1pbmNoIHNpbmdsZS1ib2FyZCBjb21wdXRlci4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Nw
YWNlbWl0LnlhbWwgfCA2ICsrKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAo+ID4gPiBpbmRleCA5YzQ5
NDgyMDAyZjc2OGNkMGNjNTliZTZkYjAyNjU5YTQzZmEzMWNlLi4wMDNiMGJjMTUzOWI2MjFlMzkx
NzJhMDU2NWRmZWExMjc0Y2JjOGI4IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbAo+ID4gPiBAQCAt
OCw3ICs4LDggQEAgdGl0bGU6IFNwYWNlbWlUIFNvQy1iYXNlZCBib2FyZHMKPiA+ID4KPiA+ID4g
IG1haW50YWluZXJzOgo+ID4gPiAgICAtIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+
ID4gPiAtICAtIFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4gPiArICAtIFlpeHVuIExh
biAgIDxkbGFuQGdlbnRvby5vcmc+Cj4gPiA+ICsgIC0gR3VvZG9uZyBYdSAgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPgo+ID4gcGxlYXNlIHNpbXBseSB1c2UgIm9uZSBibGFuayBzcGFjZSIgaGVyZSwg
aXQncyBtb3JlIGNvbnNpc3RlbnQsCj4gPiB0cnlpbmcgdG8gYWxpZ24gdGhlbSBsaWtlIHRoaXMg
d291bGQgcmVzdWx0IGluIGV2ZW4gd29yc2Ugc2l0dWF0aW9uLi4KPiA+Cj4gPiAtIG9ubHkgZW1h
aWwgYWRkcmVzc2VzIGdvdCBhbGlnbmVkIHdoaWxlIG5vdCB1c2VyIG5hbWVzIChmaXJzdCwgc2Vj
b25kCj4gPiAgIG5hbWU/KQo+ID4gLSBhZGRpbmcgYW5vdGhlciBtYWludGFpbmVyIGluIGZ1dHVy
ZSBtYXkgYnJlYWsgdGhlIGFsaWdubWVudCAoaWYgbG9uZwo+ID4gICBuYW1lKQo+Cj4gWWVhaCwg
dGhlc2UgYXJlIG5ldmVyIGFsaWduZWQuIEp1c3QgZG8gb25lIHNwYWNlIGdhcC4KClRoYW5rcyBZ
aXh1biwgQ29ub3IuIEkgd2lsbCBmaXggdGhhdC4KCi1HdW9kb25nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
