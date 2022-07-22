Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB86C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 21:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qel+zr2yE+1FC5Au5SERg19xS9NPQHJzLqQ0wUASRvk=; b=jGD3Fbs0v8K0XI
	Xf+Grr8c4UPuptIcD4u/E0Ytd0ioS9+WSkr/gEGRKzRDWzVpyQfnjqS7QQn/Z52BoifhwaaHfPfyP
	Bz1YOgvW+M7X/IxWe9dyTm+Wr/iExsWWO1JuVJwx6LqBqcF0tdUXPuKpcuSG62LP7+PCkTJGXPhDu
	hXuSuxPUvUrc5BBxs8ELMjW8waxxAMIzcZ4CFIttKnt71IZ3fBV0nu3t3pTt4oclitofFRb4tk4Vg
	1tfUFs9lIWCECHJtaO88DkyXAsqG4s/n2+p9BhsZjlYZmjzCcX8YH2hyBA+cKB0asZYGqCgjnPC5P
	bkIFtLndmcTDvJlQ0VxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Mw-00BZ0z-U4; Fri, 22 Jul 2022 21:39:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Mk-00BYra-QJ
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 21:39:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id l15so4093250wro.11
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=FxcKHw+KeNRqCkk5qROt/9GMubXJxUVMHKA1De+QJz8=;
        b=P4rzv0+8JfcWUKy1JivKJYMUetypR5ZiNXPA/6TSTJ0YOhLtsMWwVXnQAHjl5ygmW9
         dSBVgFFBSsuonWbdOk8Ky+8qccZi6wfbk6zGgOEGk0PVttqaVNlAyBadARwj1Y//JgTT
         wL6bVCh2M0D2piZA9vHUlRbbhnt5btt+pxUjCwafnt83Hj6JsO3UAIXiah1okFR8mkjn
         XW3LXj5OrIDz9y0dGYXXNmg2sdZwG8rkxjOyqFkSkwPRULwu5FrrylKP4IeJIMyTOz30
         OH0e6tl4+7ksBnlFP1VAGBJQezXleYMqd17bvJr97uuUoAOxjo7DEfiyq52KAf/qLNWt
         Shew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=FxcKHw+KeNRqCkk5qROt/9GMubXJxUVMHKA1De+QJz8=;
        b=Ju3StRVKUGZRrGfLQDUpW6VXwfSX5F1UItEMSUk+tniMIBuPOM1BoNee5fRCQ5Yas8
         d+0Vs27Xkpc3gf0rJ2gKK91GgHLHYBBXYvWGBbUep0+tbvunAwYgyagn54u3xvsAUoI+
         URRQVt05W3npAOojoGCL9gq3nD1BGI1rXSh6LtKCNfX6Hx4xdupxW7iudDSyETUlU3N9
         E+c3fYRwsI9IKS5qHztbLfkl/ekgXUyRkugJXTTRoq3uYC7fglSpF32jUWdIOt0fdG1D
         nHv4y8U+OINLjc1MyZA3aLnIIrsTErAV33c0ar3ar+Vob0bdcCneNaB/KoZxbqIZKvQ1
         L3UA==
X-Gm-Message-State: AJIora+No/dc0HfQIs3z7kIc2mG+r8zDXB9CQICVZQtbugo4KnY6X5rM
	283JJ1IinKvIL0o+0tpvwiVWtQ==
X-Google-Smtp-Source: AGRyM1tPVIVZfV6qM8vhMpTbxX0oe2mvWjKidKhJrKbIkCzM/uzQTakUQbNW/CotdHpNthpStjOk6Q==
X-Received: by 2002:a5d:6285:0:b0:21e:6554:5e31 with SMTP id k5-20020a5d6285000000b0021e65545e31mr1109911wru.21.1658525959500;
        Fri, 22 Jul 2022 14:39:19 -0700 (PDT)
Received: from smtpclient.apple (global-5-142.n-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b003a2d6c623f3sm10104785wmb.19.2022.07.22.14.39.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jul 2022 14:39:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
Date: Fri, 22 Jul 2022 22:39:18 +0100
Cc: Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Stafford Horne <shorne@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-csky@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>,
 PCI <linux-pci@vger.kernel.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Message-Id: <41B9AC54-DCFE-4055-B950-265B3CBDD842@jrtc27.com>
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
 <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014>
 <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com>
 <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_143922_888376_90ACBF49 
X-CRM114-Status: GOOD (  20.27  )
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

T24gMjIgSnVsIDIwMjIsIGF0IDIwOjU1LCBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPiAKPiBPbiBGcmksIEp1bCAyMiwgMjAyMiBhdCA2OjM2IFBNIFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBPbiBGcmksIEp1bCAyMiwgMjAyMiBhdCA5OjI3IEFN
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+PiAKPj4gRnJvbSBm
dTc0MDoKPj4gICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwweDgxMDAwMDAwICAweDAg
MHg2MDA4MDAwMCAgMHgwCj4+IDB4NjAwODAwMDAgMHgwIDB4MTAwMDA+LCAgICAgIC8qIEkvTyAq
Lwo+IC4uLgo+PiBTbyBhZ2FpbiwgaG93IGRvZXMgb25lIGdldCBhIDAgYWRkcmVzcyBoYW5kZWQg
b3V0IHdoZW4gdGhhdCdzIG5vdCBldmVuCj4+IGEgdmFsaWQgcmVnaW9uIGFjY29yZGluZyB0byBE
VD8gSXMgdGhlcmUgc29tZSBsZWdhY3kgc3R1ZmYgdGhhdAo+PiBpZ25vcmVzIHRoZSBicmlkZ2Ug
d2luZG93cz8KPiAKPiBUaGUgUENJLXNpZGUgcG9ydCBudW1iZXIgMHg2MDA4MDAwMCBnZXRzIHR1
cm5lZCBpbnRvIExpbnV4IEkvTyByZXNvdXJjZSAwLAo+IHdoaWNoIEkgdGhpbmsgaXMgd2hhdCBf
X3BjaV9hc3NpZ25fcmVzb3VyY2Ugb3BlcmF0ZXMgb24uCj4gCj4gVGhlIG90aGVyIHF1ZXN0aW9u
IGlzIHdoeSB0aGUgcGxhdGZvcm0gd291bGQgd2FudCB0byBjb25maWd1cmUgdGhlCj4gUENJIGJ1
cyB0byBoYXZlIGEgUENJIEkvTyBzcGFjZSB3aW5kb3cgb2Ygc2l6ZSAweDEwMDAwIGF0IHRoZSBh
ZGRyZXNzCj4gaXQncyBtYXBwZWQgaW50bywgcmF0aGVyIHRoYW4gcHV0dGluZyBpdCBhdCBhZGRy
ZXNzIHplcm8uIElzIHRoaXMgYSBoYXJkd2FyZQo+IGJ1ZywgYSBib290bG9hZGVyIGJ1Zywgb3Ig
anVzdCBiYWRseSBzZXQgdXAgaW4gdGhlIERUPwo+IAo+IFB1dHRpbmcgdGhlIFBDSSBhZGRyZXNz
IG9mIHRoZSBJL08gc3BhY2Ugd2luZG93IGF0IHBvcnQgMCBpcyB1c3VhbGx5Cj4gYmV0dGVyIGJl
Y2F1c2UgaXQgd29ya3Mgd2l0aCBQQ0kgZGV2aWNlcyBhbmQgZHJpdmVycyB0aGF0IGFzc3VtZSB0
aGF0Cj4gcG9ydCBudW1iZXJzIGFyZSBiZWxvdyAweGZmZmZmLCBhbmQgbWFrZXMgdGhlIFBDSSBw
b3J0IG51bWJlciBtYXRjaAo+IHRoZSBMaW51eCBwb3J0IG51bWJlci4KClBvc3NpYmx5IHJlbGF0
ZWQgaXMgdGhlIChoYXJtbGVzcykgd2FybmluZyBzcGV3IHNlZW4gZHVyaW5nIGJvb3Qgb24KRnJl
ZUJTRC4gVGhlIGJyaWRnZSwgYW5kIGFsbCBkb3duc3RyZWFtIG9uZXMsIHJlc2V0IHRvIGhhdmlu
ZyBJL08Kd2luZG93IDB4MC0weGZmZiBhbmQgbWVtb3J5L3ByZWZldGNoIHdpbmRvdyAweDAtMHhm
ZmZmZiAod2hpY2ggRnJlZUJTRAp0cmllcyB0byBhbGxvY2F0ZSwgZmFpbHMgYmVjYXVzZSB0aGF0
4oCZcyBvdXRzaWRlIHRoZSB2YWxpZCByYW5nZXMgYWJvdmUsCnNvIGl0IHRoZW4ganVzdCBwYXZl
cyBvdmVyIHdpdGggYSBzYW5lIGZyZXNoIGNvbmZpZykuIExpbnV4IHJlc2V0cyB0aGUKY29udHJv
bGxlciBvbiBwcm9iZSBzbyB0aGlzIGlzIHRoZSBpbml0aWFsIHN0YXRlIHdoZW4gZW51bWVyYXRp
bmcsIGFuZApwZXJoYXBzIHRoYXTigJlzIG5vdCBoYW5kbGVkIHNvIGdyYWNlZnVsbHkgYXMgb24g
RnJlZUJTRCAod2hpY2ggYWxzbwpyZXNldHMgaW4gZGV2aWNlX2F0dGFjaCwgdGhlIHNlY29uZCBo
YWxmIG9mIHdoYXQgTGludXggY2FsbHMgcHJvYmUpPwoKSmVzcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
