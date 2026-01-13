Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AC3D29DCB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 05:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oe/HR7/8GTiIAN2VLYEsYVJ2L8zajJSsI5xwd/mH0Yg=; b=phRFUQ2ycV970/
	l8jLG6Q+FNr5b+KQaexN+TvQfXrJWOIelfFtXIhMEJAwLsSrWSXqGDOVf6IygD/rKsxU0xMv6ZRAN
	JaREnHH+F5zyIoBm7gWJN+lv/vkRgcnDCKT1Oe4W4xKbQLsz7AZI8mfoyR+xxlK2LrzQs+Ut9q9Gc
	ZfbUIbMdXruiwbkDScGE3BDo2jjF/LDdXbFdHRWA+HfkzaQ5BemG/kApKf0V+dzs8c6I2S7DaCZ3l
	jmO6Vx1AeWBe9Lz+Fr5Ww52RZqEfASYbQ5t7YZPpUFCRDCk/R0Lncn6+opZ5il37iByYyMFtIllS/
	sP8Ju3bIq/+y/lAsR/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfX0k-00000006YKn-2jQz;
	Tue, 13 Jan 2026 05:32:10 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfX0i-00000006YKS-0Fb1
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 05:32:09 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7926d5dbdf7so27525487b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 21:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1768282327; x=1768887127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy4LMdldTGwISdglwEP/iBB5uJvH/fDPeL6tN/GI50Q=;
        b=B9HYtpcZnI80TD4RR3IQYElU3S9wBkmPo4OxAhbaEsAXn0abBazfa2NSsLU2ek7pc7
         igJQyqPnmlVUrqUt1mDNZZyqlsacGFlscZMO8fgIWyNiNdCCmBp34nZ/HJq6w8dQbSe0
         yttUOwK1bjfIzTMOKQygS6cdhtYNIRS6XZf5dlbSczylGvqTRZX8yq1A4xKahCiTr1Nq
         eZLoI8Op6S28Jh4QHX793rUXR+txHy+eiO1SBEPFDXaA/y9MMyxaqz03N5L4FedAMvcJ
         jDlJzZcsJHWGmPdOaDz1Hl23HK5Oxi3OhKw/0g78csIx/jdlPr0z2VPfko7UgCwQ1y+u
         s6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768282327; x=1768887127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy4LMdldTGwISdglwEP/iBB5uJvH/fDPeL6tN/GI50Q=;
        b=cm/Haz3OfFejkRbKf7kTbrcUBnrZOeQcjURXeq+fmeyQsBxXcnJPbXaB29uvvCnSsI
         HPNTLPTv5+ueKKPJ657KYDKIQjiGhfPUyKTbSFHiGC1hy+NjotllL5Wj03OzjuCp0TAS
         FCOkmmNVO1XJy5+kQzFj1g9bopwuwv4RsWgeCScR5ene/+gOrRqYFk8+JvLqvjq2+i21
         2HhjrRj0k2JkxxzmVGKaPdKWCYAkdahX0h54vwqlTqmfcWu2603f4Am/4sd0JGBjYYr0
         7UTHJQRK6PPhzlHgjm91SHsJdsWaUFRim5FPa4DboxtCAyZbSVOVAOClQb65WWuXg+fh
         yHSw==
X-Forwarded-Encrypted: i=1; AJvYcCUw3mutAwiYJ9nI8BH0vYEJwKYOlzhTWzfMMKPWa8mfFEMi+TzDs8STlyqvaQZxkOm6vgN6IWhEst1gyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6AxQZ8kTSvEOS7OI/igt5iWWnaQO6+DthwhTtMBD0aBZIo2mr
	KTN1jRpc+RygRrv/+lfYaRG4QL18+RLVSEN+zwFEiiHMbwTHrLg7nPgcdvlyqwPIvypWU2YHxt6
	4ft3UP+m2IqkRlwmJtFmmYWxLzql0DmH487Ry26F787s=
X-Gm-Gg: AY/fxX6Zcz5zhYjzsY3SZr8Pf6lo5avmMbj5DhzXXB6Zz13dP2fG+VMlSmHk9rHeWgr
	CtDwrCFjf/L/VsFffKcwtZdkmtU6x3baeIhyAg8utgTXbDsYNovlTzlR8hSXdAZwJgYghbQUPF1
	om2UN81MiVLWQOD9saDjqbd+1qe4QdhY+wnsrOi9hu8Q3a5Z+n+zcvqI7/Gn7c/iFPxj8dh7vPv
	Ez9S6i8K+XB3wJzGmfKzjTlQbm4c4uxW/8pZATeF4TcFebIkSslpiXwFpess8doUvRpXD5mHg==
X-Google-Smtp-Source: AGHT+IExqIdWS0cjfIxtkM38Mzck94Xq9kYShJuru8AXTnzNUNT6kOmvzgIPXGX80q+0JKl1Y4AKJl2QiWpSOmYRDGI=
X-Received: by 2002:a05:690e:120f:b0:641:f5bc:696c with SMTP id
 956f58d0204a3-64716c60119mr16680207d50.72.1768282326574; Mon, 12 Jan 2026
 21:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-5-joshua.yeong@starfivetech.com> <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
 <SH0PR01MB0841EF813268269C2AE59372F98E2@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <SH0PR01MB0841EF813268269C2AE59372F98E2@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
From: Rahul Pathak <rahul@summations.net>
Date: Tue, 13 Jan 2026 11:01:55 +0530
X-Gm-Features: AZwV_QjboB7fQnipHJLOjXWMnr27h-8kUlIUc9Twa974XLrlL36DjBouoLomDys
Message-ID: <CABdD5x=T0pXWCSHL+An2Nwsaz-kbYnGga5vt0OfdCwm-o493Dw@mail.gmail.com>
Subject: Re: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: "anup@brainfault.org" <anup@brainfault.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "rafael@kernel.org" <rafael@kernel.org>, 
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"jms@oss.tenstorrent.com" <jms@oss.tenstorrent.com>, 
	"darshan.prajapati@einfochips.com" <darshan.prajapati@einfochips.com>, 
	"charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"dfustini@oss.tenstorrent.com" <dfustini@oss.tenstorrent.com>, 
	"michal.simek@amd.com" <michal.simek@amd.com>, "cyy@cyyself.name" <cyy@cyyself.name>, 
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_213208_378568_D4DCE62E 
X-CRM114-Status: GOOD (  16.60  )
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgODowNeKAr0FNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uZGF5LCBKYW51YXJ5IDEyLCAy
MDI2IDY6NDcgUE0sIFJhaHVsIFBhdGhhayA8cmFodWxAc3VtbWF0aW9ucy5uZXQ+IHdyb3RlOgo+
Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgcnBtaV9jcHVmcmVxX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpIHsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Owo+ID4gPiArICAgICAgIHN0cnVjdCBycG1pX3BlcmYgKm1weHlfcGVyZjsKPiA+
ID4gKyAgICAgICBzdHJ1Y3QgcnBtaV9jdHggKm1weHlfY3R4Owo+ID4gPiArICAgICAgIGludCBu
dW1fZG9tYWlucyA9IDA7Cj4gPiA+ICsgICAgICAgaW50IHJldCwgaTsKPiA+ID4gKwo+ID4gPiAr
ICAgICAgIG1weHlfY3R4ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqbXB4eV9j
dHgpLCBHRlBfS0VSTkVMKTsKPiA+ID4gKyAgICAgICBpZiAoIW1weHlfY3R4KQo+ID4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAvKiBTZXR1
cCBtYWlsYm94IGNsaWVudCAqLwo+ID4gPiArICAgICAgIG1weHlfY3R4LT5jbGllbnQuZGV2ICAg
ICAgICAgICAgPSBkZXY7Cj4gPiA+ICsgICAgICAgbXB4eV9jdHgtPmNsaWVudC5yeF9jYWxsYmFj
ayAgICA9IE5VTEw7Cj4gPiA+ICsgICAgICAgbXB4eV9jdHgtPmNsaWVudC50eF9ibG9jayAgICAg
ICA9IGZhbHNlOwo+ID4gPiArICAgICAgIG1weHlfY3R4LT5jbGllbnQua25vd3NfdHhkb25lICAg
PSB0cnVlOwo+ID4gPiArICAgICAgIG1weHlfY3R4LT5jbGllbnQudHhfdG91dCAgICAgICAgPSAw
Owo+ID4gPiArCj4gPiA+ICsgICAgICAgLyogUmVxdWVzdCBtYWlsYm94IGNoYW5uZWwgKi8KPiA+
ID4gKyAgICAgICBtcHh5X2N0eC0+Y2hhbiA9IG1ib3hfcmVxdWVzdF9jaGFubmVsKCZtcHh5X2N0
eC0+Y2xpZW50LCAwKTsKPiA+ID4gKyAgICAgICBpZiAoSVNfRVJSKG1weHlfY3R4LT5jaGFuKSkK
PiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKG1weHlfY3R4LT5jaGFuKTsKPiA+
ID4gKwo+ID4gPiArICAgICAgIHJldCA9IHJwbWlfY3B1ZnJlcV9hdHRyX3NldHVwKGRldiwgbXB4
eV9jdHgpOwo+ID4gPiArICAgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiZmFpbGVkIHRvIHZlcmlmeSBSUE1JIGF0dHJpYnV0ZSAtIGVycjolZFxuIiwg
cmV0KTsKPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZmFpbF9mcmVlX2NoYW5uZWw7Cj4gPiA+
ICsgICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgICAgLyogR2V0IG51bWJlciBvZiBwZXJmb3Jt
YW5jZSBkb21haW4gKi8KPiA+ID4gKyAgICAgICByZXQgPSBycG1pX3BlcmZfZ2V0X251bV9kb21h
aW5zKG1weHlfY3R4LCAmbnVtX2RvbWFpbnMpOwo+ID4gPiArICAgICAgIGlmIChyZXQpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiaW52YWxpZCBudW1iZXIgb2YgcGVyZiBk
b21haW5zIC0gZXJyOiVkXG4iLCByZXQpOwo+ID4gPiArICAgICAgICAgICAgICAgZ290byBmYWls
X2ZyZWVfY2hhbm5lbDsKPiA+ID4gKyAgICAgICB9Cj4gPgo+ID4gVGhlIGRvbWFpbiBzcGFjZSBp
biBSUE1JIHBlcmZvcm1hbmNlIGZvciBDUFUgYW5kIERldmljZSBpcyBub3Qgc2VwYXJhdGUgYW5k
IGEgZG9tYWluIGNhbiBiZSBlaXRoZXIgQ1BVIG9yIGEgRGV2aWNlLgo+ID4gSG93IHRoZSBkcml2
ZXIgd2lsbCBtYWtlIHN1cmUgdGhhdCB0aGUgZG9tYWlucyB3aGljaCBhcmUgcmV0dXJuZWQgYXJl
IENQVSBvbmx5IGFuZCBub3QgdGhlIGRldmljZS4KPgo+IEkgdGhpbmsgd2UgbmVlZCB0byBlbmhh
bmNlIHRoZSBSUE1JIHNwZWMgdG8gaW5jbHVkZSBpbmZvcm1hdGlvbiBmb3IgdHlwZXMgb2YgZGV2
aWNlLgo+IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4gPgoKWWVzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
