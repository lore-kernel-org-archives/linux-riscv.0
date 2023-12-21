Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E3C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0db9uscXvL0HHYNsCnkQSIX0+X5vx1nhHfF3NfUrgI=; b=rW12bVkzPqAxuo
	xBgKqkcVbql4V+0DIJ02ANUQ2CAzz2raKwB2G9sRa+q1tK+yKl9eSysI8cOtiGPeGFqrJ3UZHiRt2
	JCFG2VDnMb6lPfuXaCDpJyXbV+BfTkWht/VAmC9JALzxGyu5YpL27VZGRskV7139O8AxXSKHRpAgU
	v+QITgmh60V33J+tABp3nNNMSoNOwQSIkWpNDqXy3uqDYcq9GKeKkDDGhyXEbfF8v6DgV9DdPVAwd
	yV0RkQTj6qwWlRPGKrH/OF90NtES+tt1oQmjm07leOfRsikJqcVL7WOBRbAPnXxhCcwITUwX1t9VJ
	E/hq97k9yYdOnaztFlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJMF-0032LP-39;
	Thu, 21 Dec 2023 13:45:03 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJMA-0032GS-0b
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:45:01 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dbd38c6598fso575141276.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703166296; x=1703771096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeP4kNdvACJ5LqYxE4fXGpJZwNtLXE/FAa7f+Vu66/c=;
        b=Xbaf05MkgR+RSDHTlCZHBEqUtMalCu3oMvmD4AMZ5rdLlI6BeppwngNpaPzZkF52Wc
         OefKZt5snGHPkQR8XzY0MOm237pVVtMSWPsj6N1Sg71X3CjTSI6KcPJBQdXPpgE5RzTS
         0uOKdCZyfx7GmGe6Nz8w6nJPMa+gmTaEBmSmIqZ93vh6oqaDhIdd0W3lOKy1/e+X/LvU
         21QvBYZzjKT04k/vQRtCMMN91/q91qNbcoo0Vck1GP4dp8nd+Ek8RTRhQ01hHYCflTzg
         reatYLCHMslR/AKuSYk4Cv7PZXqqgpYxFAPk3Q+JKQPWnC+SthMxluGqC5i602ptsaSt
         3YrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166296; x=1703771096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeP4kNdvACJ5LqYxE4fXGpJZwNtLXE/FAa7f+Vu66/c=;
        b=XVKKd3dxrJ3HbC9pwLhdnhdUzd3UfX/zOwbapRFylfeVaYcDeAjKiLoriJXbA30xLc
         fwMBEQeV7ynsQhW2us4TGih1qo/7u51kR/56TUzjbPSBp6Txhi3FJ1nDnaS339pOrNmv
         WO7BkIdHyrNdvjQbMjOzM3UKCDV2yJNku8Pb6DCc8E1UdAuo48e9cnrQlcNGWi2MwrRh
         7qjj0/+AhULs+OKogMTgFZnRFUbE9eVyt1Vx0ocpiSQ/uLxRKdizCGW5xTvhDv++53U+
         0tNDJmJ32RhNFWrALfpQ3jNZJGYSt0W63xV0ZitbJRYB1ODLCh6vb1H6+UFCsBlG+xlH
         RfFA==
X-Gm-Message-State: AOJu0Ywu/zPJV3nVo9Lujaepg8FeJUk4KHp10/I8jkqnztKdVO+zcp/R
	/uIruzW4ndz/bElVQqr0SGKgDsg1rYY0KAGajKiH1QpycrAOsERt
X-Google-Smtp-Source: AGHT+IFxNXE+jS35HnUO8ZrCIK4+Br5wJL3Ray/yXu7HV4UVOSnWmkmQQIZtfNhSkhxjGhC4KfG1Asd4QPb2AdIfEKs=
X-Received: by 2002:a25:b08f:0:b0:dbd:5253:c3af with SMTP id
 f15-20020a25b08f000000b00dbd5253c3afmr812295ybj.1.1703166296433; Thu, 21 Dec
 2023 05:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
 <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com> <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com>
In-Reply-To: <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Dec 2023 14:44:44 +0100
Message-ID: <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054458_290781_6E758F26 
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMToyOOKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPiBMaW51cyBXYWxsZWlq
IHdyb3RlOgo+ID4gT24gU2F0LCBEZWMgMTYsIDIwMjMgYXQgMjo1N+KAr1BNIEVtaWwgUmVubmVy
IEJlcnRoaW5nCj4gPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gPiA+ID4gKyAgICAgICAgICB0aGVhZCxzdHJvbmctcHVsbC11cDoKPiA+ID4gPiA+
ICsgICAgICAgICAgICBvbmVPZjoKPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gdHlwZTogYm9v
bGVhbgo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgZW51bTogWyAw
LCAyMTAwIF0KPiA+ID4gPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIG9yIGRp
c2FibGUgc3Ryb25nIDIuMWtPaG0gcHVsbC11cC4KPiA+ID4gPgo+ID4gPiA+IGJpYXMtcHVsbC11
cCBjYW4gYWxyZWFkeSBzcGVjaWZ5IHRoZSBzdHJlbmd0aCBpbiBPaG1zLgo+ID4gPgo+ID4gPiBU
aGUgc3Ryb25nIHB1bGwgdXAgaXMgYSBzZXBhcmF0ZSBiaXQgdGhhdCBjYW4gYmUgZW5hYmxlZCBp
bmRlcGVuZGVudGx5IGZyb20gdGhlCj4gPiA+IHJlZ3VsYXIgcHVsbC11cC9kb3duLCBzbyBpbiB0
aGVvcnkgeW91IGNvdWxkIGVuYWJsZSBib3RoIHRoZSByZWd1bGFyIHB1bGwtdXAKPiA+ID4gYW5k
IHRoZSBzdHJvbmcgcHVsbC11cCBhdCB0aGUgc2FtZSB0aW1lLCBvciBldmVuIHRoZSByZWd1bGFy
IHBvbGwtZG93biBhbmQgdGhlCj4gPiA+IHN0cm9uZyBwdWxsLXVwIHdoaWNoIGlzIHByb2JhYmx5
IG5vdCBhZHZpc2VkLgo+ID4KPiA+IGJpYXMtcHVsbC11cDsgPC0gSnVzdCByZWd1bGFyIHB1bGxp
bmcgdXAgdGhlIG9yZGluYXJ5Cj4gPiBiaWFzLXB1bGwtdXAgPSA8MTAwPjsgPC0gU2FtZSB0aGlu
ZyBpZiB0aGUgb3JkaW5hcnkgaXMgMTAwIE9obSAoZmlndXJlIG91dCB3aGF0Cj4gPiAgIHJlc2lz
dGFuY2UgaXQgYWN0dWFsbHkgaXMuLi4uKQo+ID4gYmlhcy1wdWxsLXVwID0gPDIxMDAwMDAwPjsg
PC0gc3Ryb25nIHB1bGwgdXAKPiA+IGJpYXMtcHVsbC11cCA9IDwyMTAwMDEwMD47IDwtIGJvdGgg
YXQgdGhlIHNhbWUgdGltZQo+Cj4gSG1tLi4gdGhlIHR3byBwdWxsLXVwcyBjb21iaW5lZCB3b3Vs
ZCBiZSBhIHN0cm9uZ2VyIHB1bGwtdXAsIGVnLiBsb3dlcgo+IHJlc2lzdGFuY2UsIHJpZ2h0PyBT
byB5b3UnZCBuZWVkIHRvIGNhbGN1bGF0ZSBpdCB1c2luZwo+IGh0dHBzOi8vZW4ud2lraXBlZGlh
Lm9yZy93aWtpL1Nlcmllc19hbmRfcGFyYWxsZWxfY2lyY3VpdHMjUmVzaXN0YW5jZV91bml0c18y
CgpZZWFoIGhlaGUgZWxlbWVudGFyeSBlbGVjdHJvbmljcyBiZWF0cyBtZSwgb2YgY291cnNlIGl0
IGlzIGluIHBhcmFsbGVsLgoKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBkb2N1bWVudGF0aW9u
IGRvZXNuJ3QgYWN0dWFsbHkgbWVudGlvbiB3aGF0IHdpbGwgaGFwcGVuCj4gaWYgeW91IGNvbWJp
bmUgdGhlIHN0cm9uZyBwdWxsLXVwIHdpdGggdGhlIHJlZ3VsYXIgYmlhcy4KClNvIHdoeSBldmVu
IGFsbG93IGl0IHRoZW4/CgpEbyB0aGUgcGVvcGxlIGRlc2lnbmluZyBib2FyZHMgdXNpbmcgdGhp
cyBoYXZlIGJldHRlciBkb2N1bWVudGF0aW9uIHRoYW4gd2hhdAp5b3UgaGF2ZT8gVGhlbiBlaXRo
ZXIgZ2V0IHRoYXQgZG9jdW1lbnRhdGlvbiBvciBqdXN0IGRvbid0IGdpdmUgdGhlbQp0b28gbXVj
aCByb3BlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
