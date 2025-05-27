Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6658C54FB3
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 02:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PoOREAO0foe2aFf2+ZvuGDhvlMYm8hhv8sA2WTZOqM=; b=K3yPTqpOWmwNFX
	83JG3/XltvUSyJQ+aGH36pk7z4HUwomBn/41LhEUiYV6jHZuBYMUVJ5bGVTzQn25DGsRdqRivldrt
	NTeHQtmQpU5sDBsXbNUC7uMfWihon2X+5knuc7v3iOUYxO8jBgEzxYAXgLND5L0HLccV1IvQUcfhe
	9h7LCH30lhi0nFM3mtmQmqwofrlb5IthnAvQRFh5neZea++Q9K6DPgHQs0mQX621fL2+1GGED1mIO
	tJCClmB3CkTmrJSYAjarAm8HP84lpoqrAwPvXaQ9+tZspLbbYWRNG5j2IeMFD/lDsbCxRp3XlgnzN
	sUHC8k3XxfOLpgtJVOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkG8-00000009mHZ-1Q4p;
	Tue, 27 May 2025 02:41:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkG5-00000009mGS-34lv
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 02:41:43 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so565974166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748313699; x=1748918499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=RvD9KaG2ewwOHl41Er/jtgf7H7t02JAcG8gYYBAcMnhzC+2PWWCi8VC49honiSQ6ox
         8pMATpXZYH2PjlgX78cNexaNI7g7QJGdi0ZWeY30K9Y4pEfnnNHlnd+oE2SgqWqxKLC/
         SfNSQp9Zi8bTL6MdjOBxfEJT8WXj5HbTQs8QGlHLipu2S0jiNZLY7D62mJjJlkiyDqXg
         vQ39dIaUlx0uq9JNYZS8wWGt4kWkTzcVfIu2/80yF75RJZTnGQvZdxYQn8kkNsMuMHB2
         oBqtv86+nJnlRR0boUtmC5qH75ogYge9O2Ti/YKr4Xlqsrx9gAKKAkhpkabdqEyzv4E+
         JlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748313699; x=1748918499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=vch/J33tA8iolOE2H2T9Zk8bo8shBOcw5AlEYqFJ8zPH7NFdqKooFCHScbo7aPIKLe
         Am3PEZsMz1efMhiC9Tu9lp2HNmTkrhSMBCKYP+PwJXXdV4Ij6HVoyzACVuRuKIm+xjIS
         k2FuHGvDjfyN4u5j6HHL8I4cZOybqUpX88lY6TNejbvBJXBnf/7rGKapCNveDRzOl9nY
         1SnXqzB+7jZWJ8yZ6tY1J+BiypSKIrHRYRA870zWfCGEW0FrUR0YBcBpomz15tvPg2cE
         5prclScTB7XTVd6n8iweRgfDdUQ3Eh4dq0UG+cVwhU6Iyi3RdPk9Py81R3p+J4B0TWz0
         M7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0D+n4lI7n0+ELNlIFvdGbjmJBxs0vNZFFiOhyG+x6Mpd0iC8FiVUPgk9Sgbjuro7elCKMbm7HdD3cew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyReVKe/TPxEmUSgve4pSVrgR6wHMybduyGdvx/UPOrK1wY3BLK
	r3JrNOTNVYQ2vjQz04CjqS2gd+CZEBmpZGZDImyWU2lccb53fyKTyS2MkZfN7KS/o3FXwXUeATP
	0XRbrQVln3WCKB3tWnmmhMqphZ2l2I8auXxIiekC5VQ==
X-Gm-Gg: ASbGncs2WX9loXWBnx1wyfzzuavnWj6J8uXKUYsndYrBItqpJBQtBeGnj6J4XLAKTRq
	kcL/WqGiRahQQcZIX4eZz/bi0ROHg6LP9wcxaE7lClL1qgHwwmUPh1WxaqXhN6E86S2ggjEqiUR
	JSHHHQNxubO276Vp50zH7vWXdO2fI/Qmim/Q==
X-Google-Smtp-Source: AGHT+IEwDBoO6fPNQbhz18OXkU1emYXVf9ol8i2RRW8+CYwMWPShuzxk64vRiGzkPz9segng6DJBOqMGPdvXU6MevTk=
X-Received: by 2002:a17:907:3ea9:b0:ad2:2fdb:b0ab with SMTP id
 a640c23a62f3a-ad859b5436emr1083211866b.29.1748313699251; Mon, 26 May 2025
 19:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com> <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
In-Reply-To: <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:41:20 +0800
X-Gm-Features: AX0GCFtJk0m16OgxkbmqVbr299LwditdBcOLPf3TQyBjUg1Ado6GD-l3Ru51kO0
Message-ID: <CAH1PCMZBBmDibwSLUAhDAyjAORgpS+D-U5_kfLJkbZ2r=XpFDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_194142_034915_6CFFF87E 
X-CRM114-Status: GOOD (  29.18  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMToyMuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gVHVlLCBBcHIgMjksIDIw
MjUgYXQgMDQ6NTA6NDJQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IFRoaXMgcGF0Y2hz
ZXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgU3BhY2VtaVQgSzEgU29DIGluIHRoZSBQV01fUFhBIGRy
aXZlcgo+ID4gYW5kIHVwZGF0ZXMgcmVsYXRlZCBkZXZpY2UgdHJlZSBiaW5kaW5ncy4gVGhlIGNo
YW5nZXMgZW5hYmxlIFBXTQo+ID4gZnVuY3Rpb25hbGl0eSBvbiB0aGUgSzEgcGxhdGZvcm0gdGhy
b3VnaCBkcml2ZXIgZW5oYW5jZW1lbnRzLAo+ID4gY29uZmlndXJhdGlvbiB1cGRhdGVzLCBhbmQg
ZGV2aWNlIHRyZWUgYWRkaXRpb25zLgo+ID4KPiA+IEZ1bmN0aW9uYWxpdHkgaGFzIGJlZW4gdmVy
aWZpZWQgb24gdGhlIEJhbmFuYSBQaSBCUEktRjMgYm9hcmQgdXNpbmcgUFdNMTQsCj4gPiBjb25m
aWd1cmVkIGFzIGEgcHdtLWJhY2tsaWdodC4gUGVyIGNvbW11bml0eSBmZWVkYmFjaywgdGhlIGFj
dHVhbAo+ID4gcHdtLWJhY2tsaWdodCBub2RlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGlzIHBhdGNo
c2V0IGJ1dCBjYW4gYmUgZm91bmQgaW4KPiA+IHBhdGNoIDcgb2YgdGhlIHYxIHNlcmllcywgd2l0
aCBtb2RpZmljYXRpb24gb2YgcHdtcyBwcm9wZXJ0eSB0byA0LWNlbGwKPiA+IGZvcm1hdCB0byBt
YXRjaCB1cGRhdGVkIGJpbmRpbmcgKCNwd20tY2VsbHMgPSA8Mz4pIHNpbmNlIHYzLgo+ID4KPiA+
ICsgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMTQgMCAyMDAwIDA+Owo+ID4KPiA+IFRoaXMgcGF0
Y2hzZXQgaXMgYmFzZWQgb24gW3NwYWNlbWl0L2Zvci1uZXh0XQo+ID4gICBiYXNlOiBodHRwczov
L2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4IGZvci1uZXh0Cj4gPgo+ID4gUGx1cyB0aGUg
Zm9sbG93aW5nIGRlcGVuZGVuY2llczoKPiA+IDEuIENsb2NrIGNvbnRyb2xsZXIgZHJpdmVyLCBw
b3N0ZWQgYnkgSGV5bGVuIENodSAodjgpLCB3aXRoIG1vc3Qgb2YgaXQgaGFzCj4gPiAgICBiZWVu
IGFjY2VwdGVkOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDE2MTM1NDA2
LjE2Mjg0LTEtaGV5bGVuYXlANGQyLm9yZy8KPiA+IDIuIFJlc2V0IGNvbnRyb2xsZXIgZHJpdmVy
LCBwb3N0ZWQgYnkgQWxleCBFbGRlciAodjUpOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjUwNDE4MTQ1NDAxLjI2MDM2NDgtMS1lbGRlckByaXNjc3Rhci5jb20vCj4KPiBJdCdz
IG5vdCBjbGVhciB0byBtZSBpZiBJIGhhdmUgdG8gbG9vayBpbnRvIHRoaXMgZ2l0aHViIHRyZWUg
YW5kIHRoZQo+IGxpc3RlZCBkZXBlbmRlbmNpZXMuIE15IGltcHJlc3Npb24gaXMgdGhhdCBpdCBj
YW4gZ28gaW4gb24gd2l0aG91dCB0aGVzZQo+IGNoYW5nZXMuIE1heWJlIGl0IG9ubHkgc3RhcnRz
IHdvcmtpbmcgd2hlbiB0aGVzZSBhcmUgYWxzbyBhcHBsaWVkLCBidXQKPiB0aGF0IHNob3VsZG4n
dCBzdG9wIG1lIGFwcGx5aW5nIHRoaXMgc2VyaWVzLCByaWdodD8KPgoKVGhhbmtzIFV3ZSBmb3Ig
dGhlIHJldmlldy4KClRoZSBkZXBlbmRlbmN5IGlzIGluIHBhdGNoIDMsIHdoZXJlIEkgYWRkZWQg
dGhlIFBXTSBub2RlcyAocHdtMC1wd20xOSkgdG8KazEuZHRzaS4gVGhlc2Ugbm9kZXMgcmVmZXJl
bmNlIFJFU0VUX1BXTTAgdG8gUkVTRVRfUFdNMTksIHdoaWNoIGFyZSBvbmx5CmRlZmluZWQgYWZ0
ZXIgYXBwbHlpbmcgdGhlIHNwYWNlbWl0IHJlc2V0IHBhdGNoc2V0IChQYXRjaCAxLzYpLAphdmFp
bGFibGUgaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDUxMzIxNTM0NS4z
NjMxNTkzLTItZWxkZXJAcmlzY3N0YXIuY29tLwoKWW91J3JlIHJpZ2h0IHRoYXQgcGF0Y2hlcyAx
LCAyLCBhbmQgNSBkbyBub3QgZGVwZW5kIG9uIHRoYXQgcmVzZXQgc2VyaWVzCmFuZCBjYW4gYmUg
YXBwbGllZCBpbmRlcGVuZGVudGx5LgoKPiBUaGVyZSBpcyBhIHBhdGNoIGluIHB3bS9mb3ItNi4x
Ni1yYzEgKG5hbWVseSBjb21taXQgZGYwOGZmZjhhZGQyICgicHdtOgo+IHB4YTogSW1wcm92ZSB1
c2luZyBkZXZfZXJyX3Byb2JlKCkiKSkgdGhhdCBjb25mbGljdHMgd2l0aCB0aGlzIHNlcmllcy4K
PiBJIGFwcGxpZWQgcGF0Y2hlcyAxLCAyIGFuZCA1IG9uIHRvcCBvZiBteSBwd20vZm9yLW5leHh0
IGJyYW5jaCByZXNvbHZpbmcKPiB0aGF0IGNvbmZsaWN0IGFuZCByZXdvcmRpbmcgdGhlIGNvbW1p
dCBsb2cgb2YgcGF0Y2ggNS4gVGhlIHJlc3VsdCB3YXMKPiBwdXNoZWQgdG8KPgo+ICAgICAgICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdWtsZWluZWsv
bGludXguZ2l0IHB3bS9weGEtc3BhY2VtaXQKPgoKSSd2ZSByZXZpZXdlZCB0aGUgdGhyZWUgcGF0
Y2hlcyBpbiBwd20vcHhhLXNwYWNlbWl0LCBhbmQgdGhleSBsb29rIGdvb2QKdG8gbWUuCgpUaGFu
a3MgYWdhaW4gZm9yIGhhbmRsaW5nIHRoZSBjb25mbGljdCBhbmQgcmV3b3JkaW5nIHRoZSBjb21t
aXQgbG9nLgoKPiAuIElmIHlvdSBjb25maXJtIHRoYXQgeW91J3JlIGhhcHB5IHdpdGggbXkgbW9k
aWZpY2F0aW9ucyBhbmQgaXQncwo+IGNvcnJlY3QgdG8gYXBwbHkgdGhlbSB3aXRob3V0IHRoZSBs
aXN0ZWQgZGVwZW5kZW5jaWVzIEkgd2lsbCBhZGQgdGhlCj4gcGF0Y2hlcyB0byBteSBxdWV1ZSBm
b3IgNi4xNy1yYzEuCj4KClllYWguIEFuZCBJIGNvbmZpcm0gdGhhdCB0aGV5IGNhbiBiZSBhcHBs
aWVkIHdpdGhvdXQgdGhlIHJlc2V0CmRlcGVuZGVuY2llcy4KClRoYW5rcy4KCkJSLApHdW9kb25n
Cgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
