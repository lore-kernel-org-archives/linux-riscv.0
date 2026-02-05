Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16E3E9128C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh+rlGlve5Fag4euMZckYVCjm2pT4mfHVuDDOREQfHs=; b=DGiNIT8FVMxpoC
	SRQjDfwdNHPFy/Z+ul++IG5qEpno/VSVvcDCFnqjwRKR9wAv7dHwydmDMyR8BmVjrGW59BiIQCbLN
	v0kqPGHLAd77sQtdauFsVjql9YYLJVT4h8hirgsl3VIddGxNz0qmq42Jt97XS83SOJ60IerqPyPdo
	KydZ1DTibXI3aekobGYGX2Vo9KrrFQgFYm8B3owlRlkmbbvlStf01YPaYpx6sNP+1IDGI9kHd1Wtj
	EHuqGbfuXOz2eI0VNH6hymp/O3RHVY57ro8YmY4ztmrIiDJ3E7CuZl2AnwcDxWajK3IoIaw4EiD8A
	7sdkGqXMAnpxzUaNB5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu0G-00000009ZVq-3wea;
	Thu, 05 Feb 2026 07:42:16 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu0D-00000009ZUY-3QVE
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 07:42:16 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-794c2db2ee5so6665617b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 23:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770277332; cv=none;
        d=google.com; s=arc-20240605;
        b=jtWe4s880a2HkoYHtczQQL1i0DiKDMpCVnky0WPO1ox5Np85kKtcFEQ8ttFeX8UCWj
         EJKw8/saOVebLd87Tv4uPXV98RAn//dIn+7Djna1y5ZmgFoY1lfeQGFNcwpHG7rFimo3
         XyHa4+pE7KCqEZU9BPoKjJygTw7qMcl7SFUyk9KGgg1cyN2neZUdQ/fHUT+1S2aNZznH
         6VfNSKIsWVgxsAAcJ9+R6jjAQ+tZquL/YOMAhaG0bg0iZqZOPGg/bk7r1tqijtQty0YF
         KY9ZqzVuidrEyDD77LBC8fLaoAge3aDxf8lQtj8czK2ap8/0u9B6d2ukEMBJ/hwJPy/a
         sdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        fh=24ECI9n9GCCPUfOUhxkUbYr5f+xLOAhW5nz1Gw0lelI=;
        b=KYleu1aVPpf19z9ywE/nh3tv+lfkYr6NsRXOyTdKvKU64EAz2DxQxApvgQpysT8YX0
         s/MN6qvc2u9qJFn0+JHYb8K0Hx92U9y1NF6LTFJDAWEky+onRkxwFnkZevWA99DxnorZ
         QbKEB8Zo9En+exraKe9GgY3TbcKhCR9noCs3yKYTT66XAy/6+K6bUJGibGhOHXLiK66G
         Wa7o0S4hqPYLrcZ4L9XUegKBG3rcPMXwDG/RkM88xWVPuD6KwXM3+BIC7yXqDFyRZ5xp
         +LmY3jetbyHvlCwE9FBlyBCRCQ5cV1z2DKBGWuFFAuxJjbWOmStnrRMhATxwi8p4zwJK
         clFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770277332; x=1770882132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        b=yRG1FFQy/me21vVTzWO/KxArfbzN3K+IwAurCqBNPu57dgaSE7A5DalsMGhn3h3+FW
         5rQ1LL17nrxoLEeo1Pz8hz5E7x2/XH/bWCqteZs9p9/8iA+1Nr10lf3cmBI3RLGxUsD3
         GJWRAqlbr1CBVnb0ahVwGQSFz/Q7LM/iOojBW8qMPC4YmErS6A5T2hzWEZ9Ls6mUaRDP
         I2+w8ueYBPGlE4MaLWxqIiiCPeXPPTLNtW1FTJwk//oM39muKQClNrRjRStFkRKvGVRx
         5/XWJHpfNArXKNZQwu7GO1h5cTfoH3JIZehLIGE4TM2Ec8xpXRPG3v4ElOMJhw7ce8+R
         E+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770277332; x=1770882132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCsVndFzrtL2hxIQjBbohAaFr2ETBAeGKs4H5l+MANM=;
        b=Nvm4sjusHyUu39t7f2RqCw3vxV/hs0UNetJnP8ouD/Dge0H6feVl0s0ZYZ4/1D3IZE
         Lddrw7ff0NYDVC9fQ/UQCEhMz09P+4uPoZxIk5mrV2zmsVeC+WecxfXx4v3lrueuyyCC
         99rYmMpeyxlgznmnm9QxMoVKx3aKOn08tr4pjh8STG0phEqb/dkKcZxncfXb9wQ1gzTP
         pqNHaI9ZJcdU+MTOSnGK115BR96Ilb6pqh/LK8u+n/f+/cT1OrcgXj1N5Z2ZWq+/jSwr
         DNc3vr6CaqR3q8KietvO49gcjGbWadiwIy1piisL2Di6PqrWwNeKsdiY5DMG4wL1aD6i
         wiPA==
X-Forwarded-Encrypted: i=1; AJvYcCVU/8VVZWbd3PxVHpJcejzoxUBmBhp8uX/L8qVTfZAh9YCz6JUH/SSmmx736sNa8fZq6qwt0Avd55uo6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv+ajGRvJp1E3VJhWTiuxzQo7UHaQOD40tvX8XKnbLVYe0oaHG
	64E5boexhoo4moTK7ezIlvDZqe7vMPE94Y1eES3sK+llknzySuY9qkDBvicKkOgz1kYdKQfnWbx
	o/kx3pYy05IQ43UwwrErL9UrbzDA+c55gj7TKEgZUEQ==
X-Gm-Gg: AZuq6aLOdJjkO/IFQF+stY1Ga/i2VbuFyGtQ8VCPGjT+Hh9XWK2XybANXHTyDhw3RYQ
	Txv+T2Jn51uN2Bo3mwzNIh5WF8fIFsTgUxf2fuPIpFgfhHrziaoT90vSf7G0vVfNiQUUGGjUuuf
	9AqQUP0YlWgmnBX6IiSuf8/28zpCZEDVI7wOxN6H5HqADkLyoCiBmqSlE8sfp4AOMXcUCM0Sc3O
	elHHg6k2TVKladVqRWS0uWvI8APnXBVna+M4Q5XKvLAkHtpj3N2ru/ioWglIpiauEQXq+RZ85LF
	URp1CDP3uXhz6Ovwt291ZIaKHyiOIWP7x8eJj3V8kdLi
X-Received: by 2002:a05:690c:39b:b0:794:fe8f:ad8b with SMTP id
 00721157ae682-794fe8fae16mr55216627b3.29.1770277332375; Wed, 04 Feb 2026
 23:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
 <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com> <20260204-unlucky-raven-1ca0ed8f3392@spud>
In-Reply-To: <20260204-unlucky-raven-1ca0ed8f3392@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 5 Feb 2026 15:42:01 +0800
X-Gm-Features: AZwV_QheG0gYs892iDNFuUkxDWoz1fptgEI2peyofeZxhFHIoYa7PK0YeWnUmlw
Message-ID: <CAH1PCMZ9S95JHzuZc1hG0hwxjVmCg9RezZ6rNjt_xQ25FokQOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_234214_607632_F4535BB7 
X-CRM114-Status: GOOD (  17.32  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAyOjA34oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA5OjIzOjAxUE0gKzA4
MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBBZGQgc3VwcGx5IHByb3BlcnRpZXMgdGhhdCBtYXRj
aCB0aGUgUDEgUE1JQydzIGFjdHVhbCBoYXJkd2FyZSB0b3BvbG9neQo+ID4gd2hlcmUgZWFjaCBi
dWNrIGNvbnZlcnRlciBoYXMgaXRzIG93biBWSU4gcGluIGFuZCBMRE8gZ3JvdXBzIHNoYXJlCj4g
PiBjb21tb24gaW5wdXQgcGlucy4gU3VwcGx5IG5hbWVzIGFyZSBkZWZpbmVkIGFjY29yZGluZyB0
byB0aGUgcGlub3V0Cj4gPiBuYW1lcyBpbiB0aGUgUDEgZGF0YXNoZWV0Lgo+ID4KPiA+IFRoZSBl
eGlzdGluZyAidmluLXN1cHBseSIgaXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQgdG8gYXZvaWQgd2Fy
bmluZ3MKPiA+IGFzIGR0cyBhbmQgZHQtYmluZGluZ3MgZ28gdmlhIGRpZmZlcmVudCB0cmVlcy4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4K
PiA+IC0tLQo+ID4gdjM6IE1hcmsgdmluLXN1cHBseSBhcyBkZXByZWNhdGVkLgo+ID4gdjI6IFJl
bW92ZSBwcm92aWRlcnMgZnJvbSB0aGUgZHRzIGV4YW1wbGUuCj4gPiAgICAgUGFzcyB0aGUgJ21h
a2UgZHRfYmluZGluZ19jaGVjaycgdGVzdC4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9zcGFjZW1pdCxwMS55YW1sICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysr
KysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvc3BhY2VtaXQscDEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvc3BhY2VtaXQscDEueWFtbAo+ID4gaW5kZXggYzY1OTNhYzZlZjZhLi40MWY3ODQ0MDhlMjkg
MTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3Nw
YWNlbWl0LHAxLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvc3BhY2VtaXQscDEueWFtbAo+ID4gQEAgLTI4LDcgKzI4LDQ2IEBAIHByb3BlcnRpZXM6
Cj4gPiAgICAgIG1heEl0ZW1zOiAxCj4gPgo+ID4gICAgdmluLXN1cHBseToKPiA+IC0gICAgZGVz
Y3JpcHRpb246IElucHV0IHN1cHBseSBwaGFuZGxlLgo+ID4gKyAgICBkZXByZWNhdGVkOiB0cnVl
Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIE1haW4gcG93ZXIgaW5wdXQgKGRlcHJl
Y2F0ZWQpLiBVc2UgaW5kaXZpZHVhbCB2aW4xLTYsIGFsZG9pbiwKPiA+ICsgICAgICBkbGRvaW4x
LCBhbmQgZGxkb2luMiBzdXBwbHkgcHJvcGVydGllcyBpbnN0ZWFkLgo+Cj4gV2hhdCdzIHRoZSBw
b2ludCBkb2N1bWVudGluZyB0aGUgZGVwcmVjYXRlZCB2ZXJzaW9uIGlmIGl0IGRvZXNuJ3Qgd29y
awo+IGFueW1vcmU/CgpLZWVwaW5nICJ2aW4tc3VwcGx5IiBpbiB0aGUgYmluZGluZyB3aXRoICJk
ZXByZWNhdGVkOiB0cnVlIiBhdm9pZHMgYSBjcm9zcy10cmVlCndhcm5pbmcuIFNpbmNlIGR0cyBh
bmQgZHQtYmluZGluZ3MgZ28gdmlhIGRpZmZlcmVudCB0cmVlcywgdGhlIG5ldyBiaW5kaW5nICsK
b2xkIGR0cyB0cmlnZ2VyczoKCnBtaWNANDEgKHNwYWNlbWl0LHAxKTogVW5ldmFsdWF0ZWQgcHJv
cGVydGllcyBhcmUgbm90IGFsbG93ZWQKKCd2aW4tc3VwcGx5JyB3YXMgdW5leHBlY3RlZCkKClJv
YiBmbGFnZ2VkIHRoaXMgaW4gWzFdIGFzICdpbnRlcm1pdHRlbnQgd2FybmluZ3MnLgoKSSdtIG9w
ZW4gdG8gZHJvcHBpbmcgdGhlIGRlcHJlY2F0ZWQgbWFya3VwLCBtYXliZSBqdXN0IGFjY2VwdGlu
ZyB0aGUKdHJhbnNpZW50IHdhcm5pbmcgaXMgZmluZT8KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDEyOTE4MTYwNC5HQTEzOTg5OTctcm9iaEBrZXJuZWwub3JnLyBbMV0K
CkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
