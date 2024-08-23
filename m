Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C1EC531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXYfPhbKRTcTokorCyIjocZcMgSMszMvsbOpXDm2iW8=; b=euWDmC2MgNg/hX
	m1V3fG7d2lbVppIZ0+YQGmKM9wWhgEetMZAUU25ClfwYBqRw1EYNpUnPF8WpOAhl+WeH+gBpgK/1f
	7vKTGyk5NZKHzYDNARn0S4Ad3WiF7kHLka0bhrgCHUwKYsuQT/BCvHl5Yl5P9s4vVz/ImeLPw0Mda
	j944q3wyI1Xf6GEY5TqanL30HFLysRzrw78PnqexnPHQdT62l8CwWJeTgT8wXis0Zr4NZ5O6qCBz/
	O2nzWCgfS0bvq0kqZ8RTLVuzInPC/5pLfJlSrAtwpBD1IJBgM0A2u0EnMUkw1809WSAO4+fGnQmYp
	JuVAd/lErrXbdFLVjkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shREq-0000000GFdb-2esm;
	Fri, 23 Aug 2024 10:09:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRDP-0000000GFAQ-2F2F
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 10:08:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5343617fdddso2014753e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724407697; x=1725012497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NARmN2GiXY8LTcOyNPM866kw97k4mEELSTIS0ZQtQIk=;
        b=kYgzvJlbLyA8pX0dsrNUTI0qri9k4zD3jQaLqdLbKM2pXSTO1hMCDsqFGSiZE43KYS
         TulO3bGXUiaoC7fog7ec6Nk58BBCDVB6elhDlHR6s6Z3QWUOHag2YcCrR6vSv558Wow0
         vjCfLlhWuhXnKE8/yVQFZrPXSx//2nVdnrThTkRMesxhiZuQOcZXU/ztE7vUKgRaG/xX
         gTWJh4XejMOjXdbOgySLmQ9LJke8ts0B94qL79oLjkX3f2NpyzOsmPOQiFsEGgPyMNrH
         dqfyz30lw/u8/x2Ccyxn275pmCnhXgugII6dJaNoTzW7Ml4dh5wX2YpoONsgKxuK8OcP
         Sq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724407697; x=1725012497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NARmN2GiXY8LTcOyNPM866kw97k4mEELSTIS0ZQtQIk=;
        b=Y5QyajK0uycWbeLYQ/rsXVIQaxv4vUqWCh5KRzFgHn30lDI89zLxemCifevIPw+31B
         w97xm0+2on6CjLzhSNjKu6vrgQGfAr+dSR68Hb9f+bY7N07yfo7oKgmBcz7XpoOl9lhe
         veaZfFKBshcVu0u3w5sciOVdpF9gN0M9QNR2zN51l09xLfrQeKiYgmIrqBfsItOvhNrn
         wge+KNI0wzKE4v/gB9NlBW6JXNDQtVgRxoRqs0xXT+8cm5jzv/FEERhi5IQl5YTG+BY6
         N1I76BruZbmPX0x6AQV2nzzvXN57Lt8q3lcBVjblxxXNmtyadTohBX090sUkbPIGEuSX
         CJrw==
X-Forwarded-Encrypted: i=1; AJvYcCW4POB2SgCsVP+Zg5GyT566Vsw0R5amBbrs8BOJSJ5jf9ObQgqmhFDf8VaR3kZGJ8ypjmT9cZ1hSFvAsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjtimuQR0+NUYwNc6NnYLjtATrPSFrhCJyEz3uZOVSDJyhiU9a
	0gY8bTe71C2xZPsJdzyEJxs/dbL/RySrE807BeyYas3bz/6rcqCs7lSMQx0+7PsHwApZWGxfeQ4
	eMeLfKAn9JzWSoIXFQ7a4J15wczro6lh1u70LxbpST3v/iulzsow=
X-Google-Smtp-Source: AGHT+IEBtfR88qDkOmd2wkNuaL7z8PoTGRY9kVq7D2jV1sLwSB619L14XkO6A4bV78DRvRYnHYtkDMWBXrrjGUIVDPk=
X-Received: by 2002:a05:6512:3e24:b0:533:407f:5cbd with SMTP id
 2adb3069b0e04-5343883d669mr1650370e87.7.1724407696596; Fri, 23 Aug 2024
 03:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
In-Reply-To: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 23 Aug 2024 15:38:03 +0530
Message-ID: <CAK9=C2XXkZTEsfLPGjDeT-jrYt7f8VN6Pxqo4OCjnpmJ+Mr9ZA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, samuel.holland@sifive.com, evan@rivosinc.com, 
	tglx@linutronix.de, andy.chiu@sifive.com, cleger@rivosinc.com, 
	ajones@ventanamicro.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_030819_609792_25A57CB2 
X-CRM114-Status: GOOD (  18.76  )
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

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMjo0NOKAr1BNIFpoZSBRaWFvIDxxaWFvemhlQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IEluIHRoZSBvZl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkgZnVuY3Rp
b24sIHdoZW4gdGhlIF9fY3B1aWRfdG9faGFydGlkX21hcFtdCj4gYXJyYXkgcmVjb3JkcyB0aGUg
Q1BVIGhhcmR3YXJlIElELCBpZiB0aGUgc2FtZSBDUFUgaGFyZHdhcmUgYXR0cmlidXRlIGhhcwo+
IGJlZW4gcmVjb3JkZWQsIGFuIGVycm9yIHJlcG9ydCBpcyBpc3N1ZWQsIHRoZXJlYnkgZW5zdXJp
bmcgdGhlIHVuaXF1ZW5lc3MKPiBvZiB0aGUgQ1BVIGhhcmR3YXJlIElEIHJlY29yZGVkIGluIHRo
ZSBfX2NwdWlkX3RvX2hhcnRpZF9tYXBbXSBhcnJheS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpoZSBR
aWFvIDxxaWFvemhlQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBi
b290LmMgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gaW5kZXggMGY4ZjFjOTVhYzM4Li42OThmOWZlNzkx
ZjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gQEAgLTExOCw2ICsxMTgsMTYgQEAgc3RhdGljIHZv
aWQgX19pbml0IGFjcGlfcGFyc2VfYW5kX2luaXRfY3B1cyh2b2lkKQo+ICAjZGVmaW5lIGFjcGlf
cGFyc2VfYW5kX2luaXRfY3B1cyguLi4pICBkbyB7IH0gd2hpbGUgKDApCj4gICNlbmRpZgo+Cj4g
K3N0YXRpYyBib29sIF9faW5pdCBpc19tcGlkcl9kdXBsaWNhdGUodW5zaWduZWQgaW50IGNwdWlk
LCB1NjQgaGFydCkKClRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcgYXMgbXBpZHIgaW4gdGhlIFJJU0Mt
ViB3b3JsZC4KCnMvbXBpZHIvaGFydGlkLwoKCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGludCBp
Owo+ICsKPiArICAgICAgIGZvciAoaSA9IDE7IChpIDwgY3B1aWQpICYmIChpIDwgTlJfQ1BVUyk7
IGkrKykKPiArICAgICAgICAgICAgICAgaWYgKGNwdWlkX3RvX2hhcnRpZF9tYXAoaSkgPT0gaGFy
dCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAgICAgIHJldHVy
biBmYWxzZTsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgX19pbml0IG9mX3BhcnNlX2FuZF9pbml0
X2NwdXModm9pZCkKPiAgewo+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpkbjsKPiBAQCAt
MTMxLDYgKzE0MSwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgb2ZfcGFyc2VfYW5kX2luaXRfY3B1
cyh2b2lkKQo+ICAgICAgICAgICAgICAgICBpZiAocmMgPCAwKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+Cj4gKyAgICAgICAgICAgICAgIGlmIChpc19tcGlkcl9kdXBsaWNh
dGUoY3B1aWQsIGhhcnQpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCIlcE9G
OiBkdXBsaWNhdGUgY3B1IHJlZyBwcm9wZXJ0aWVzIGluIHRoZSBEVFxuIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRuKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKGhhcnQg
PT0gY3B1aWRfdG9faGFydGlkX21hcCgwKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIEJV
R19PTihmb3VuZF9ib290X2NwdSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZm91bmRfYm9v
dF9jcHUgPSAxOwo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
