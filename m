Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5137DC369A1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJBhv/la8/p2wO3zmzWM+/XMshGDpIx05GxZzb9Dx2o=; b=HzJxS3rxAfHPnp
	WnpC6px7ARBnAQ9XOZl5/UcdhMrbRQVe2ck0dR9Tc46VuwEk/qAPfOSrK6PzD28a1ZPmekpQSLeCy
	0eZuXSo25RJmxig29h7TURvSMjadBs0IP//JgIGRhHumk2NYXCuNVR5UQfutdwA/59FAvlUe6s/EX
	IyrVgZuuBbKpBFtsPbv5Lu+AX9+F4a2lPb/jmRSZo2rJOokzfMb+oBT8HGL4CCS+QEBzVyTNmc0o8
	DBv1f9+BPBeR2uSlKCzJ0jwoQvFxd7MZotE1004BR8fpECO0Pcn+CuqK25k7wsvAeGLGUSqRZSktr
	yl5g9LjtWgYm3f17bwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dfq-000000056mo-1Tfy;
	Tue, 08 Apr 2025 18:27:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CIM-00000004tUu-3IZ8
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 16:59:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549b116321aso6630223e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131569; x=1744736369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=t/uFo2ye0ZI3zbfxHErTLQy+feg/Qjs4pMRvr87ntN0t3Ryp9iUTwKMDDhOKXjozdq
         vwVPgvbWOSIrI/sTTGle3GfdcvIiwZJz+qtNV6e6rvz42o4x3AUjRT3eJdj0nowTK9vi
         84rtpYZap+pweLvxSOEN++dqFW4mqSLnX9lxHkdnFDooxI74Nl8Uj5z2GfDB8ihM8clI
         ok114fQ/VPSn/D5eHJ2m2qAIi4TtWvCl5qEMa36mzIQdpNOqbV8r3s42tcUrzf4CvAof
         zW3dDicb/i+xmk9FNNZSzRIK8KkwoY/muoGqdqoCtNAJdOvINZj2Ql/yYAV5Vi3HdW3k
         rTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131569; x=1744736369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=TWXT3K5vr0qZEoejOMcqyllHrPBhrgsU4DAvpxBIQO6IdLmMXzvMveDbPoqLuHdxv1
         OKWfTVXcSD4M8IJess8VBqZzvhiPysK23QZtBDsSxg/KtPm47ElQ/z816tzp54s2X97X
         FuhOTzcF5mC5dCODRM1EqHZuA8ArqRqf2IfQAMrv899FGsXAU2noCSfMqTczBpIWd6QN
         fdoVFTNkzBXkEiJ9DI9pJdgOyFdD7TAqADGAGETeazjuB+y9Fm2rGLeY3giuZ/3XYGi/
         9QyPzGVrmT7z8814HavHDwYdMkl/pdDkNS9hyEfUVj5euQh1fkjtz1tPIpdXQfDzZLvz
         ZNQw==
X-Forwarded-Encrypted: i=1; AJvYcCVmCPggrClCFp/Ww3NeOo9QeeCAaoWEZHOmMsAXqVBB61wv26n1+JdE55b0c+WASED+lRvKN+e5BFIFSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNNcGiDKUAM4VkGKthqYGEP67O2PpeBcktcIlAaM+2QbQ/7L1T
	wHdeNOQ3gKVGHoJNmivLm1xhWEPGieLnI0SCjiZqED2eSUS4SCe8QSAh1WEv2s8hPIbc2igrSUW
	eCny9LPY10DjdkRQT3l2204M3eQc5DLBlP4N68Q==
X-Gm-Gg: ASbGncuJORxLZsGmzQd9YzF0HXJctp6jieueMWjwBijgeGAceNtPWNpfl3O5onXSzs3
	e+Ode2e7+S9xK9MHIsfrbAGR1Br51Q3TVwo6XpQKxtvOEFE6mIsKC6yZbYAOd2ImealJsUdbSRw
	Q1A8R5xBbpQxgP61bEhc99B9JUveANX0IphoTK5es17du9zPQk34QopKNhZQ==
X-Google-Smtp-Source: AGHT+IFf+rKu3T7g4RXnGFAVwKLGYMFo6Zqu68CucFmhU42UIICJdAnEONryqtNi8mj8oclBDQsJoWOTWw94ILqOE3w=
X-Received: by 2002:a05:6512:33d2:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54c22767d83mr4780246e87.12.1744131568769; Tue, 08 Apr 2025
 09:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org> <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
In-Reply-To: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 18:59:15 +0200
X-Gm-Features: ATxdqUFebT_4pyoTiD_cVWGxoRBkYoQNT5n1rg0F0zfP1Dh_NRC8OHcIuixy1l8
Message-ID: <CAMRc=MeEQi0rnr-mA1bsvAZu-NxqKp2Rjg9x9HYaSbuWY1seiQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_095930_825316_FF1133BB 
X-CRM114-Status: GOOD (  18.05  )
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

T24gVHVlLCBBcHIgOCwgMjAyNSBhdCA2OjA14oCvUE0gQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0
YXIuY29tPiB3cm90ZToKPgo+IE9uIDQvOC8yNSAxMDoxMSBBTSwgWWl4dW4gTGFuIHdyb3RlOgo+
ID4gZ3BpbyBpcnEgd2hpY2ggdXNpbmcgdGhyZWUtY2VsbCBzY2hlbWUgc2hvdWxkIGFsd2F5cyBj
YWxsCj4gPiBpbnN0YW5jZV9tYXRjaCgpIGZ1bmN0aW9uIHRvIGZpbmQgdGhlIGNvcnJlY3QgaXJx
ZG9tYWluLgo+ID4KPiA+IFRoZSBzZWxlY3QoKSBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCB3aXRo
ICFET01BSU5fQlVTX0FOWSwKPiA+IHNvIGZvciBzcGVjaWZpYyBncGlvIGlycSBkcml2ZXIsIGl0
IG5lZWQgdG8gc2V0IGJ1cyB0b2tlbgo+ID4gZXhwbGljaXRseSwgc29tZXRoaW5nIGxpa2U6Cj4g
PiAgICBpcnFfZG9tYWluX3VwZGF0ZV9idXNfdG9rZW4oZ2lycS0+ZG9tYWluLCBET01BSU5fQlVT
X1dJUkVEKTsKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9y
Zz4KPiA+IC0tLQo+ID4gSW4gdGhpcyBwYXRjaCBbMV0sIHRoZSBHUElPIGNvbnRyb2xsZXIgYWRk
IHN1cHBvcnQgZm9yIGRlc2NyaWJpbmcKPiA+IGhhcmR3YXJlIHdpdGggYSB0aHJlZS1jZWxsIHNj
aGVtZToKPiA+Cj4gPiAgICAgIGdwaW9zID0gPCZncGlvIGluc3RhbmNlIG9mZnNldCBmbGFncz47
Cj4gPgo+ID4gSXQgYWxzbyByZXN1bHQgZGVzY3JpYmluZyBpbnRlcnJ1cHRzIGluIHRocmVlLWNl
bGwgYXMgdGhpcyBpbiBEVDoKPiA+Cj4gPiAgICAgIG5vZGUgewo+ID4gICAgICAgICAgICAgIGlu
dGVycnVwdC1wYXJlbnQgPSA8JmdwaW8+Owo+ID4gICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
aW5zdGFuY2UgaHdpcnEgaXJxZmxhZz47Cj4gPiAgICAgIH0KPiA+Cj4gPiBUaGlzIHNlcmllcyB0
cnkgdG8gZXh0ZW5kIGRlc2NyaWJpbmcgaW50ZXJydXB0cyB3aXRoIHRocmVlLWNlbGwgc2NoZW1l
Lgo+ID4KPiA+IFRoZSBmaXJzdCBwYXRjaCB3aWxsIGFkZCBjYXBhYmlsaXR5IGZvciBwYXJzaW5n
IGlycSBudW1iZXIgYW5kIGZsYWcKPiA+IGZyb20gbGFzdCB0d28gY2VsbHMgd2hpY2ggZXZlbnR1
YWxseSB3aWxsIHN1cHBvcnQgdGhlIHRocmVlLWNlbGxzCj4gPiBpbnRlcnJ1cHQsIHRoZSBzZWNv
bmQgcGF0Y2ggc3VwcG9ydCBmaW5kaW5nIGlycWRvbWFpbiBhY2NvcmRpbmcgdG8KPiA+IGludGVy
cnVwdCBpbnN0YW5jZSBpbmRleC4KPgo+IERpZCB5b3UgaW50ZW5kIHRvIHNlbmQgbW9yZSB0aGFu
IGp1c3Qgb25lIHBhdGNoPyAgICAgICAgLUFsZXgKPgoKVGhhdCdzIGFscmlnaHQsIHRoZSBvcmln
aW5hbCBzZXJpZXMgd2FzIDIgcGF0Y2hlcywgVGhvbWFzIHBpY2tlZCB1cAp0aGUgZmlyc3QgYW5k
IG5vdyBJJ20gdGFraW5nIHRoZSBzZWNvbmQgdGhyb3VnaCB0aGUgR1BJTyB0cmVlLgoKQmFydAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
