Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC50FC9830C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6KY//YhMCaPEE8H9uNZfguPoGv1iaViFyLaCSs8EmI=; b=z0fFYdXrA2omsV
	dukp10El9n4eOIa65Wxs3epR/DSFBSLMmBvo6CDZ4ac892Z6isFGDtHaLoGer1hVhWeclZ7tb5L5h
	rI0InGV73/e0UYhwFpmutkJT0lF0fhyO/yj+fs4Z1nqBBlm5WQcY86SH6xiXK6p0GtYBOLA+VAJE+
	RnIbm48ItbpGD+BNhsYBp6zqwn5brI8dUNpC+KWdPAH/JejT58RaAu8ag7x1OewKx/ZkXIsAWQLNk
	7RyOmxZR2BwesuV0z+opwPU5eAzxoC9qEkgHrsYmiPYchXHl+aLlf+z3xvbD9SspgejXZ7i15uwcJ
	hBQftnk8sTbjme89RFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZlU-00000000xZk-3Z4p;
	Sun, 18 Jan 2026 20:52:52 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZlT-00000000xZ1-1Kln
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 20:52:52 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-45c7f550f46so2262762b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 12:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768769570; cv=none;
        d=google.com; s=arc-20240605;
        b=IMjEBoAmUNQA3rKhKDfohCDGm1kZT8Nkvb6AX4lEHP7KfV8hSvb5Q6QzPFFSGie2IG
         14EFlugJ10CAwvTyfaB98cFxMYP4mSRiJWwB+N1GmhmDaqMCQ1BjOIJV5jwj/0JfLMI7
         Ii+3ev5mdLcrV16GZKGoUnMj+/C4He2KWcFrZcgKDMSWuQL59RXE5i/AIaYLOd7ez0a5
         o1tEEzf/ASDUrP7mKBqiquui5SawsEI9G1AtdrwZ4FhAAVRASVI3CBSTPERQg910SA0n
         8tch8sf6EEiprqhlDu2X3alPC3owf4P1khHsVXyYHYQUiYbLhdSvc7wAefGhG8M2EI5m
         EasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6GDOo4olJtep1CXvZE/j5AlZG5vZI9PVs4PP/nilek=;
        fh=iSqdC0lGAiiBi8cuJvqZurJKkySNGGXGO8eQ6eFd6rA=;
        b=L+/HE2AMvnlMGjyUX/BIMJjNpxrn8eCH5IOCOglt4H3M9F6ETZJ0Tuyx/ul0eY8LVT
         grirVfdI0N3lIdkQgX3l+Ffj/S1TaxothBTQnR3u0g7e3cRA1Zu5Kf8mrJHw5NXz/u5+
         UWMa/jPjwL0kOL9px/44cT5pRoeVEKytthxjFXzskmwCIM8Hhn68om9ZRTYLnhnr9iux
         qASibv/ZMd0byzmjvjue625Cd+jgh7JyupaRfUv8mzI2tHb9OBBSGrl/dB6EWGnXvl+7
         57bc8ObM85E7L2q89D5hgG24rZIUO6JCCt1WWSJYGHQmuQlkLtRQKhvrcZ0vamI+NaCg
         czbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769570; x=1769374370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6GDOo4olJtep1CXvZE/j5AlZG5vZI9PVs4PP/nilek=;
        b=iCKMWR5J0xOMuyraZwZVnAlr7ybPJr17vvv6ANhg75A27eaouWaCP8sdgIXf83WaIC
         bzMlGmvN1ZZB5fOB/1OE4L+kvzURaZCdS+sxzJo8HP76rsTmQ9RBoNw49IzO+WHpS6ji
         HsScX5ZMxUHsIU9sfs85BLyZXC1yGrW3SRBSnBN+34+WNb++5Ze2v1mrM8roM0KlY4Z5
         Tp1OpzCBI/kCEc10u1udBajVh4+vBng2egY1Eoadu7TkaFR/kTcf8lOCC/yAvJp8pyXw
         6HdQDHdUQu+Ih5ujAsoGtkV9uL91g73/488UVMRJNML8SXxv3GoTZekjBplZFin0Ky85
         wgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769570; x=1769374370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6GDOo4olJtep1CXvZE/j5AlZG5vZI9PVs4PP/nilek=;
        b=D+ZyUzzqEp1E7IKfx5Z4IEEJdj4bIUzC85Hy5+9NGXHFEvWHoiwtHjwgZ9giqQi13b
         B1w+9WvHH31fUMbgyyxfxgA33uyTrGHK2Q5U1fP7/k72QqixNmvNQ/aFSbi6P4elqth9
         p7XEw+8r1Th7BjkNRetFBSyh6GQWpLy56WJ307mFWyKSFLg9SFbN0Rrh8QIccOKD6ORU
         ykd2HhikoeuQZdyfl060bJYRensimhQ+8GosO8WhspTw/5EDrAgO1HHGPmslI50j5iBz
         dIBrAN0HOWPHFxAEWkPnQAUi0dPZEBEwHuoAoLBve7KruFRJnStOb6MQumv7y2hcryZl
         vl1w==
X-Forwarded-Encrypted: i=1; AJvYcCWh8zoF3qgd+Hn2dGN/su45A1Fh8DeQmkzRVz3VONQX20D50zU6oCYVDagcLB8dviqkvIpXFGoljxjPxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgALpldIL4u/wcrXYIexVKEc5fSf79wiKHUXov/Hz/LikNDHKh
	lijrEj4Fg+5mMYKZvAtcLboacOz5MabfuDO5PLsCXpT4/vayvZ4hoNTFfKfanfT5b5GwgPM4CE7
	wXCN8GnNW+N5/qHJ0UbOlM6qWJ/5FOSp01v2D19E=
X-Gm-Gg: AY/fxX6bjf587Wqov5laskAdBk/kTKrcC23kftAD5CwqzrVoZYMvZeL4Y2+oRfck9q5
	bsoRa8bN1rsetAfAxYp4wAAj7g5TeZ/P19vZWaWImhItIR4UhqbiAXze8NavkMdCxBwz0b3SLS0
	Ezp57zd+lZL8WXyC4R9YPLZFyyKn09eNLo54pyNE+U/lY4NL8ghH7fq5ZGDH9cA5l06ZkCk8+FS
	4wNXlqMpUhEMt3CW2V6SNCRM+8IG9qxfRhE+FLAGcz6TOgP4EVTqsEDqMCAU4njr4fe0xqU
X-Received: by 2002:a05:6808:191e:b0:450:bc7e:85f4 with SMTP id
 5614622812f47-45c9beba633mr4220067b6e.5.1768769570221; Sun, 18 Jan 2026
 12:52:50 -0800 (PST)
MIME-Version: 1.0
References: <056a7d9af85a20633e54602b2c4d2c3bbbaadd78.1768486684.git.geert+renesas@glider.be>
In-Reply-To: <056a7d9af85a20633e54602b2c4d2c3bbbaadd78.1768486684.git.geert+renesas@glider.be>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:52:39 -0600
X-Gm-Features: AZwV_Qhk9LJkpwmpDlXTg4ssV9wx0H5kCcdCsUmIZZADl_6e-ooo8o3MLrQq5Qo
Message-ID: <CABb+yY32DQdZ1qzYOZffS-6aBgnd0_CaLgpULkY-xA-mj3JtQA@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: Improve RISCV_SBI_MPXY_MBOX guidance
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Anup Patel <apatel@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125251_359502_924DAB3A 
X-CRM114-Status: GOOD (  19.25  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODoxOeKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5
IChNUFhZKSBNYWlsYm94IHN1cHBvcnQgZGVmYXVsdHMgdG8gZW5hYmxlZCwgYnV0Cj4gdGhlIGhl
bHAgdGV4dCBzdGF0ZXMgIklmIHVuc3VyZSBzYXkgTiIuCj4KPiBSZWNvbW1lbmQgZW5hYmxpbmcg
dGhpcyBkcml2ZXIsIGFzIGl0IGlzIGEgdmVyeSBjcml0aWNhbCBSSVNDLVYgZHJpdmVyCj4gcHJv
dmlkaW5nIG1haWxib3ggY2hhbm5lbHMgdG8gb3RoZXIgZHJpdmVycyBzdWNoIGFzIGNsb2NrLCBz
eXN0ZW0gTVNJcywKPiBldGMuCj4KPiBGaXhlczogYmYzMDIyYTRlYjExOWM2YiAoIm1haWxib3g6
IEFkZCBSSVNDLVYgU0JJIG1lc3NhZ2UgcHJveHkgKE1QWFkpIGJhc2VkIG1haWxib3ggZHJpdmVy
IikKPiBTdWdnZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
PiAtLS0KPiBUaGlzIGlzIHYyIG9mICJbUEFUQ0hdIG1haWxib3g6IFJJU0NWX1NCSV9NUFhZX01C
T1ggc2hvdWxkIGJlIGRpc2FibGVkCj4gYnkgZGVmYXVsdCIuCj4KPiB2MjoKPiAgIC0gQ2hhbmdl
IHRoZSBjb25maWcgZGVzY3JpcHRpb24gaW5zdGVhZCBvZiBjaGFuZ2luZyB0byBub3QgZW5hYmxl
ZCBieQo+ICAgICBkZWZhdWx0LCBhcyByZXF1ZXN0ZWQgYnkgQW51cC4KPiAtLS0KPiAgZHJpdmVy
cy9tYWlsYm94L0tjb25maWcgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvS2Nv
bmZpZyBiL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gaW5kZXggZTQ3Y2I2ODk4OTI2Nzg4MS4u
YzI3YzEwOTdkYjIxYmUyNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21haWxib3gvS2NvbmZpZwo+
ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gQEAgLTM4Nyw3ICszODcsNyBAQCBjb25m
aWcgUklTQ1ZfU0JJX01QWFlfTUJPWAo+ICAgICAgICAgICBNYWlsYm94IGRyaXZlciBpbXBsZW1l
bnRhdGlvbiBmb3IgUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKQo+ICAgICAgICAgICBl
eHRlbnNpb24uIFRoaXMgbWFpbGJveCBkcml2ZXIgaXMgdXNlZCB0byBzZW5kIG1lc3NhZ2VzIHRv
IHRoZQo+ICAgICAgICAgICByZW1vdGUgcHJvY2Vzc29yIHRocm91Z2ggdGhlIFNCSSBpbXBsZW1l
bnRhdGlvbiAoTS1tb2RlIGZpcm13YXJlCj4gLSAgICAgICAgIG9yIEhTLW1vZGUgaHlwZXJ2aXNv
cikuIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gaGF2ZSB0aGlzIHN1cHBvcnQuCj4gLSAgICAg
ICAgIElmIHVuc3VyZSBzYXkgTi4KPiArICAgICAgICAgb3IgSFMtbW9kZSBoeXBlcnZpc29yKS4g
U2F5IFkgaGVyZSwgdW5sZXNzIHlvdSBhcmUgc3VyZSB5b3UgZG8gbm90Cj4gKyAgICAgICAgIG5l
ZWQgdGhpcy4KPgo+ICBlbmRpZgo+IC0tCj4gMi40My4wCj4KQXBwbGllZCB0byBtYWlsYm94L2Zv
ci1uZXh0LgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
