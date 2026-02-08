Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D95AEF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cECZf0koTjeSkZ3is5TkER3t3XAG+2rMMc+4wX8AHmo=; b=vgo1MT1fGzirTf
	joyz8jVAxEhuscCdoy2LYvidD9fwtj3yyq7JfoTWvXQQ+7wDQ0Dc2H7NR4EAHmV8LH/V6TH2ndeUt
	Zy6qf9+kgNDFSTisb0GqtOaT9z57rlBcZ380OoCtkj18W5/cSQN5UAJJ78+UyezU1wAwa4XBGbHi5
	KXQ8WcRvSFjSI7NJESpcdKjce1VyhyzeXDcQ1wUxt7Y4D9f2w/28XF3sJTx+xmtRGj9jDfWYbjuv8
	7/5c88wNF5tI+R+Fv8N4QfNFRHh1BSH7lPzsgIAwnBgUt02yqa9S5qQONp61Z7rkOST2JKibMOOMY
	3IOJopO7Hvt6GuC8+1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp2jB-0000000DFLe-42Fr;
	Sun, 08 Feb 2026 11:13:22 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp2j8-0000000DFLI-2IzV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 11:13:20 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b72b154883so94643eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 03:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770549197; cv=none;
        d=google.com; s=arc-20240605;
        b=E1u5pEDBO8ZswKXI8tS05/TspPijUpB9AaNCmeteRcMsWbWrDLgNbXHWswgwfUpTS4
         Uvh1UHGpiGcpqx7agcD1lhtWeM5TEvRZv9Xljo/TaVRDWkwM+PJN2jMBHFrSFj6PVwkn
         BC3u9S9zU0imIsj/FEBuqcz6H1Aj29I3IY6ulOp1o75AfkdM0sUpsocB+UFHTS2UQv60
         9uH1X1rxRodipdJeu8IVLy9SWakOXEWPLMiyaoTSH6a89wagekMw+sbTyd5xG5qnVeMa
         A7jXlKSRanvakfm8WIEusTGo26JqNFTCL6Wj4lQZr3F0UUKSJNjPGvYzJc/1Y4HuUG59
         A43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        fh=n/iI2pCuNskGwObhteA5FztlIkkf4WwE3usuvqN5MEY=;
        b=Npdeu2msUhQNSdtriWaQhsgcIqMhlhmymQMnNGGzwzaiMt1ulNVfamANhJ2Xjro8bP
         vRh4F7RRUUVnkm1VTpm5tUyrO9pb/bmU5FABxdxV3EPRrk5b3/ouV7bu9Njk9CUkB7BR
         xUg+Nx8mk0uxMsfgPHK5YzGdvj9+bx5dc1kXJ7408Y3s4wqOBnTOHangTgFue+Hre1S2
         m1TG0ne95x4x/OzDoxN4wpWClArFbTuQR/uMhCg6tIPPDn4ZdZBUC+paKMJ60CMINART
         vjtiLmq1HDTCWLpnEBw1DuBeHxZmMmiSI/pvt6EZjd2oDG/4FtUXJD2Wef363zV3JoB0
         ON8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770549197; x=1771153997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        b=R690hDDT0XkbjZSBecXjrgNTHyCY2lqDiRYtLNDvlkBUBG1ianeLIGZU++ccGZZVO3
         CIcJSde3CiZBjL00yIzfA0zJHcNGQRZOGrCjzLIWBFFc1p839QtZQefhgw/BPq/bOd3r
         v1Fabw9QPOs19H4LIoIs0U7fRyTBYf10gBB86iUHqsQ0zUZOCINSSK2tZoZsGXRZ19oS
         f/8OydCnmxgW+jesIy9qlovQo7svbzq35NVomYeq3SMkksTry8TqMpjWtAWOx8IDYPb7
         NKtDAHwp13rsJ6MKZbaxzYk0FjzMlf+V/nH96xHRSh0VWN0L/U9bFG6XywTGLnfSh1ce
         vseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770549197; x=1771153997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lusxgIyHsqL2VssGqd2bQqPX3H3isWm6id7LVqrFB0s=;
        b=b7IbGxkb7IBT6hjN9ScEtN4HvKDdYZzew+h/gIhUSkayf3t6oCNoXL5AYjStIfzItu
         F5iclwoThaV/CoPjecIMOoSNGyNFFAM20W/+9DQa6ahwQ0y1OTlBuR9pFAVaEQOZvXxH
         aEIbBpkahMK/cv6Tq4u0zwbRd0vxreFQbL3Zn3EYXzZlLEf/sXAdXC29KEoIUmozLGle
         Rumwqbowo5S4J2jndakcz8ZPchskgRIZAhhJmE1R1z+aB9gVMDH8T1QGBX0PkZY71vw4
         8XIc6BKs5FBlGCG5g//IHeQVP+Vsy6aFbjiHpWvyBcwzq1svCzV0WAy1nTWMGrp6ZWTw
         FnSg==
X-Forwarded-Encrypted: i=1; AJvYcCWUWBCH4yruBfCz5rYzCWebl0dEYdKNaDdkfcxMaNIfCw52PcvK0QdjAr+2wVPrQd7/58JhTKj6GQaeTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA0kGDlKMmGybUfgTiar99piErxNmik/ne0jsU9p6LjQfenaXm
	xTg39LL8ywaN0fQhFFlS7Iv6Xu7s8xPX1LCDZct/+jL/qIW2QFDCk3btOCRUyprvvf18mThBKnM
	b0dmuCEEVuhFVGYibLYWDV7IMmmsJPcI=
X-Gm-Gg: AZuq6aJ3EBseQgPfgxb/pEk5EwlEwcRO1BXoegnAox2hQllbdixrDNTfxypeat27wHV
	l+bftSF8tC/+O+ThvGTGaZtseNmm/ufgrTpz1oPH5Dgsj4CIcGLmCeyMRjuWQBgnfM2QUMIb9U6
	w6CVekKEnV0yP+j4w2n2NLcQ1pUyI5tRNKU7477KvXJEe+Afr8yAlJogYWyMrVxGScxyqS1tgUz
	wv+ALnIx48l2igc7VcknTaizy+uBY/f+s/EOGtAZJasqtOGmYm66bG3xbZJKZItA28EPK9iVjYU
	pQUdVd4oVVHY3Me8RMWuZXQcg5lbWMfVmiHOuStjdrz010TFWcSKRS7NQFJF2Khhmfeubg7BLz+
	64F+ARqf3EJ8a
X-Received: by 2002:a05:693c:3117:b0:2b7:2f29:64a7 with SMTP id
 5a478bee46e88-2b856400b99mr1820149eec.2.1770549196977; Sun, 08 Feb 2026
 03:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org>
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 12:13:03 +0100
X-Gm-Features: AZwV_Qhuy65TaUeSv9KkNVGrPf0KNHqDONqd5x0zvd51P_7nd1tMK7wVtHr8VgU
Message-ID: <CANiq72=Nd7S2HXOpUeW+EyY4G1E-1a5-bAuD6TYa_6fONt6F+Q@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_031318_612318_6E553DFA 
X-CRM114-Status: GOOD (  10.71  )
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

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgNzozN+KAr1BNIE1pZ3VlbCBPamVkYSA8b2plZGFAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgUnVzdCBrZXJuZWwgY29kZSBzaG91bGQgYmUga2VwdCBg
Q0xJUFBZPTFgLWNsZWFuIFsxXS4KPgo+IENsaXBweSByZXBvcnRzOgo+Cj4gICAgIGVycm9yOiB0
aGlzIHBhdHRlcm4gcmVpbXBsZW1lbnRzIGBPcHRpb246OnVud3JhcF9vcmAKPiAgICAgICAtLT4g
ZHJpdmVycy9wd20vcHdtX3RoMTUyMC5yczo2NDo1Cj4gICAgICAgIHwKPiAgICAgNjQgfCAvICAg
ICAobWF0Y2ggbnMuY2hlY2tlZF9tdWwocmF0ZV9oeikgewo+ICAgICA2NSB8IHwgICAgICAgICBT
b21lKHByb2R1Y3QpID0+IHByb2R1Y3QsCj4gICAgIDY2IHwgfCAgICAgICAgIE5vbmUgPT4gdTY0
OjpNQVgsCj4gICAgIDY3IHwgfCAgICAgfSkgLyBOU0VDX1BFUl9TRUNfVTY0Cj4gICAgICAgIHwg
fF9fX19fX14gaGVscDogcmVwbGFjZSB3aXRoOiBgbnMuY2hlY2tlZF9tdWwocmF0ZV9oeikudW53
cmFwX29yKHU2NDo6TUFYKWAKPiAgICAgICAgfAo+ICAgICAgICA9IGhlbHA6IGZvciBmdXJ0aGVy
IGluZm9ybWF0aW9uIHZpc2l0IGh0dHBzOi8vcnVzdC1sYW5nLmdpdGh1Yi5pby9ydXN0LWNsaXBw
eS9ydXN0LTEuOTIuMC9pbmRleC5odG1sI21hbnVhbF91bndyYXBfb3IKPiAgICAgICAgPSBub3Rl
OiBgLUQgY2xpcHB5OjptYW51YWwtdW53cmFwLW9yYCBpbXBsaWVkIGJ5IGAtRCB3YXJuaW5nc2AK
PiAgICAgICAgPSBoZWxwOiB0byBvdmVycmlkZSBgLUQgd2FybmluZ3NgIGFkZCBgI1thbGxvdyhj
bGlwcHk6Om1hbnVhbF91bndyYXBfb3IpXWAKPgo+IEFwcGx5aW5nIHRoZSBzdWdnZXN0aW9uIHRo
ZW4gdHJpZ2dlcnM6Cj4KPiAgICAgZXJyb3I6IG1hbnVhbCBzYXR1cmF0aW5nIGFyaXRobWV0aWMK
PiAgICAgICAtLT4gZHJpdmVycy9wd20vcHdtX3RoMTUyMC5yczo2NDo1Cj4gICAgICAgIHwKPiAg
ICAgNjQgfCAgICAgbnMuY2hlY2tlZF9tdWwocmF0ZV9oeikudW53cmFwX29yKHU2NDo6TUFYKSAv
IE5TRUNfUEVSX1NFQ19VNjQKPiAgICAgICAgfCAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXiBoZWxwOiBjb25zaWRlciB1c2luZyBgc2F0dXJhdGluZ19tdWxg
OiBgbnMuc2F0dXJhdGluZ19tdWwocmF0ZV9oeilgCj4gICAgICAgIHwKPiAgICAgICAgPSBoZWxw
OiBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiB2aXNpdCBodHRwczovL3J1c3QtbGFuZy5naXRodWIu
aW8vcnVzdC1jbGlwcHkvcnVzdC0xLjkyLjAvaW5kZXguaHRtbCNtYW51YWxfc2F0dXJhdGluZ19h
cml0aG1ldGljCj4gICAgICAgID0gbm90ZTogYC1EIGNsaXBweTo6bWFudWFsLXNhdHVyYXRpbmct
YXJpdGhtZXRpY2AgaW1wbGllZCBieSBgLUQgd2FybmluZ3NgCj4gICAgICAgID0gaGVscDogdG8g
b3ZlcnJpZGUgYC1EIHdhcm5pbmdzYCBhZGQgYCNbYWxsb3coY2xpcHB5OjptYW51YWxfc2F0dXJh
dGluZ19hcml0aG1ldGljKV1gCj4KPiBUaHVzIGZpeCBpdCBieSB1c2luZyBzYXR1cmF0aW5nIGFy
aXRobWF0aWMsIHdoaWNoIHNpbXBsaWZpZXMgdGhlIGNvZGUKPiBhcyB3ZWxsLgo+Cj4gTGluazog
aHR0cHM6Ly9ydXN0LWZvci1saW51eC5jb20vY29udHJpYnV0aW5nI3N1Ym1pdC1jaGVja2xpc3Qt
YWRkZW5kdW0gWzFdCj4gRml4ZXM6IGUwMzcyNGFhYzc1OCAoInB3bTogQWRkIFJ1c3QgZHJpdmVy
IGZvciBULUhFQUQgVEgxNTIwIFNvQyIpCj4gU2lnbmVkLW9mZi1ieTogTWlndWVsIE9qZWRhIDxv
amVkYUBrZXJuZWwub3JnPgoKUGluZ2luZyBhYm91dCB0aGlzLi4uCgpBZGRpbmcgTWljaGFsIGFu
ZCBVd2UgdG8gQ2MgaW4gY2FzZSBpdCBoZWxwcyAodGhlIGRyaXZlciBpcyB1bmRlcgoiUklTQy1W
IFRIRUFEIFNvQyBTVVBQT1JUIiBzbyB0aGV5IGRvbid0IGdldCBwYWdlZCkuCgpUaGFua3MhCgpD
aGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
