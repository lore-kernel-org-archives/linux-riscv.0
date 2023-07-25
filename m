Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76EFC001DE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFmaGMSav3uppiiU18Q2l1RL4VUhvP2c+qiv/al84r0=; b=gSrFB1DA1rPqOl
	UdhANTrY2TF2K7m2zR0K+7Q90e9QytnoD2nhWJrG+Tzg98o/+8lRfRn3bN3fc5SwSgT750FW5Ue8l
	IzJnhbJJxXQIXvQfnnGfe2FIJTrsExONbkkTT59K3Qe27SCdfilbS0aqOqakrNJJkXaucjDFO/0Wi
	8eSUnJ+smI5ZleAs2rRVMnlCkD11V28beVPg5oEVPEX7VySQUptw8L57cCNRO9MgqTCT0EUYi9LqW
	phyggoCZKiKUVVlA5GPw/O9fdp7pLD0Mv7zEPpiJ0028ATdKcqYjvcTkHiXICKB2DJtAIM0M0a1Um
	45JtIePB+nH/+OqxDGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEra-0071tR-0c;
	Tue, 25 Jul 2023 10:01:54 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOErX-0071s8-2p
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 10:01:53 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4468a772490so1835007137.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690279309; x=1690884109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmRaQGQO/ykEbUOXzwvpBNx/v0912ojC9mEjp/4/XZ4=;
        b=Qi1lkQH/Eqrd09mX1PkGfF3B0qgBle4ZBvZNUyuUe2JjHQJPcDbJ9lu5ln/f/JGoIq
         moKwi5gKq4lv06CVL6JEv9YcwR/0bqhm3CUoO02eaEsqoUaqxvtoTgbc+HnM6AjvUtW1
         cprXi6hpeDl7hCD5RlRStLp5PdYBzZH/rp3ysgSWc+fHfHgWdX+Tf5kYpfQLxt7XmLJT
         3WF95FbJ1Ic9P4S7JumdBNwiYqMr1yRf5BE4836KQgWrtbHkCLkdoge5gtaH/HEIieup
         uBV9x8qqK9gsvuoTtzt11iUguXSoA10uex/RzVMYHPHnsiU4jaZPQuMI+zduFqwa727e
         82rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279309; x=1690884109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmRaQGQO/ykEbUOXzwvpBNx/v0912ojC9mEjp/4/XZ4=;
        b=lDirM+Wo3EajzmBy9zNJecKb1qvM9gaJHmUbbi0FHImQb9AXxKrEvlgXqEBynlPVQW
         4lQ/e0jvadCZ5p684m782Q7NF8IFhkum42u5heF6TVFEhymX5IGOX2AhZEGRaTt3o6Y1
         TxS4j8MSF3/AXfhGJstbHJ5WXr7JaxWpEjTOrkBXqE31FPKtJJxvU+YYn3jfAZ30uJDM
         mEhV20SOTJFytUBQvB+5RHqN3X596gafm9xiZAA5rxT/QKDOXtN1HNmokRS4YBucISox
         ZoED1A0ZToUt4X0cwhzW9/2AGWt5DrMLFqohjheVoGBSyrKNVYGqod3Whq4PnRlbo+ui
         vBLw==
X-Gm-Message-State: ABy/qLZOqWywJWS+oMbcrkH+Seel6hpxyXPyVr0SX+RshCRZa2ZEeQGC
	Hcx63bIG/ZvuEZN+eBsirA65xNSQu3FS19jWOlZuyw==
X-Google-Smtp-Source: APBJJlHW1OwS6bmpdk3IDFk8ozP39xVf4zgwhLTIAqpi+TPkfHN2o4MSO14iy4i5baBENqc3v7BetZBOVlgclD6dKAc=
X-Received: by 2002:a67:fa46:0:b0:443:7a85:8fbd with SMTP id
 j6-20020a67fa46000000b004437a858fbdmr3926469vsq.32.1690279309555; Tue, 25 Jul
 2023 03:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230725004043.381573-1-samuel.holland@sifive.com>
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jul 2023 12:01:38 +0200
Message-ID: <CAMRc=MeCM3iJ4wT6p3h7cxX5_2Kg-xgZUgyGLSscLa+jzH=8Ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: sifive: Module support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_030151_935232_BFE23E56 
X-CRM114-Status: GOOD (  15.52  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMjo0MOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdpdGggdGhlIGNhbGwgdG8gb2ZfaXJxX2Nv
dW50KCkgcmVtb3ZlZCwgdGhlIFNpRml2ZSBHUElPIGRyaXZlciBjYW4gYmUKPiBidWlsdCBhcyBh
IG1vZHVsZS4gVGhpcyBoZWxwcyB0byBtaW5pbWl6ZSB0aGUgc2l6ZSBvZiBhIG11bHRpcGxhdGZv
cm0KPiBrZXJuZWwsIGFuZCBpcyByZXF1aXJlZCBieSBzb21lIGRvd25zdHJlYW0gZGlzdHJpYnV0
aW9ucyAoQW5kcm9pZCBHS0kpLgo+Cj4gVGhpcyBzZXJpZXMgcmVtb3ZlcyB0aGUgcmVzdCBvZiB0
aGUgb2ZfKiBBUEkgdXNhZ2UgaW4gdGhlIHByb2Nlc3MuCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAt
IFVzZSBkZXZfZndub2RlKCkgaW5zdGVhZCBvZiBtZW1iZXIgYWNjZXNzCj4gIC0gTWVudGlvbiB0
aGUgU0lGSVZFX0dQSU9fTUFYIGNoZWNrIGluIHRoZSBjb21taXQgbWVzc2FnZQo+ICAtIEtlZXAg
dGhlIHZhcmlhYmxlIGZvciB0aGUgcGFyZW50IElSUSBkb21haW4KPiAgLSBBZGQgYSBjb21tZW50
IGV4cGxhaW5pbmcgd2h5IHRoZSBJUlEgZGF0YSBsb29rdXAgd2lsbCBzdWNjZWVkCj4KPiBDaGFu
Z2VzIGluIHYyOgo+ICAtIEFkZCAzIG5ldyBwYXRjaGVzIHJlbW92aW5nIG9mXyogQVBJIHVzYWdl
Cj4gIC0gQWRkIE1PRFVMRV9BVVRIT1IgYW5kIE1PRFVMRV9ERVNDUklQVElPTgo+Cj4gU2FtdWVs
IEhvbGxhbmQgKDQpOgo+ICAgZ3Bpbzogc2lmaXZlOiBEaXJlY3RseSB1c2UgdGhlIGRldmljZSdz
IGZ3bm9kZQo+ICAgZ3Bpbzogc2lmaXZlOiBMb29rIHVwIElSUXMgb25seSBvbmNlIGR1cmluZyBw
cm9iZQo+ICAgZ3Bpbzogc2lmaXZlOiBHZXQgdGhlIHBhcmVudCBJUlEncyBkb21haW4gZnJvbSBp
dHMgaXJxX2RhdGEKPiAgIGdwaW86IHNpZml2ZTogQWxsb3cgYnVpbGRpbmcgdGhlIGRyaXZlciBh
cyBhIG1vZHVsZQo+Cj4gIGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgfCA0NyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDI4IGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjQwLjEKPgoKQXBwbGllZCwgdGhhbmtzIQoKQmFydG9zegoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
