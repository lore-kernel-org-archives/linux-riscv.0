Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F034C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9n01wyG5NbEH6BG6mRlQ98u1KdQYPHh/6NeVovFRuY4=; b=12/wDO+BRwzgU2
	q1udtieYQ68LNizxpuwafCUgoUMG1FBKR8+mcjdsdyrXEZGiFxOGILKlz8iqyYlOYPqD/y4ZaEpMQ
	UXlDNeEN4glGvSjiOVIyYcuiBvOmYZ1RUq4McKl05TS80nE1k0igwUZxd7XIjxoEdm807EXrmox/a
	a3BQlprkakStCG/BYUHSAHWjXVZ4j5vDFfX0zc2V7xwtaq5VpxUSXypm+0IxKR1Hy89sGBOkfIoOx
	gwHNUIaRL0WOcnI6SZVmP9QrkRYxN0/qL56p4MU1IRdwPIIUtKG0EoP4XBuAwPo7eDpjEApbjlQxN
	vIcEQFijhifRtAK74OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4c3-00000002arh-1ljA;
	Tue, 25 Jun 2024 11:45:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4c0-00000002aoc-164M
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 11:45:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a725ea1a385so200281666b.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719315922; x=1719920722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMUhzznUZed7QosruqCaiTofY87z0Rh5ZDjCpva9+sA=;
        b=kmhXmNuwXzRQ5Mn1vvj3v9AhebOPhCwHjQLIpLNy1XwgZLLKCRyr4QxM7Yk65AvKar
         rQb8+wvIQ/4TcbZH2I4BEPe/0/a690iuqbPjBE2Yw+15ngx8y7xX8J7qo8rhp1H3Xhzy
         51GML0oLAWZ7Ku9CKKPX+wEcc+eYPd/D7Pg/KkLBytSkl+nqrFTTfQeaP4+PEEcDEmXU
         0hiYb2kQe5zfmtBx/5A/EZwTD5Hvo/Jdc6UzIDu2xAgXEFuZoAJmaGhbbnvqnLXZ82Hp
         lQmqTbGyy6PYzS/BeT37vMhVA9WH7MKkCkdhtdkZlrl3CrdlH+VVjmbJ7kLCVMRETrVx
         V/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719315922; x=1719920722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMUhzznUZed7QosruqCaiTofY87z0Rh5ZDjCpva9+sA=;
        b=u+7CrjiuR2TMrs5NrTWnw4gzlE8k3AA3e17+SD1AGCw3y1o4gjY6HEgi9KeM/p4q+A
         KDwLNM99cgADmtat+S1KEY02kXalH9ZnTphLf+zfClLMww+AHCgXaGD9CjSG2qAIb/q2
         Hu12dmV0FH+srN1KXTZk1jufTgtOLTqI0vbZJXwMZ7rjWKWu+c/U+7iqv1Q17R/KRsHB
         iwPlytJ10+Uc9KXR/D/yFnL9s/L6hhYe8Q9a+ljvCh4Dpw6dTxnxq4TmreRsOmPVUEzp
         r9s4HC3Gq52weVNSmREQFBRtf/rthTW7PSYzPWV+MR4hA5WPmwEy2qSKh0nTZfZidUFh
         rHxw==
X-Forwarded-Encrypted: i=1; AJvYcCWfPkpxj//eP3/XRA0dmipSIQjk3A4M+pXv5WbvwoZH0FT8FJX638bEh6mUGSH/2V0Uu8TqLStZl5joQCeCKTEW2/apXAqgpF53fiOpuqJX
X-Gm-Message-State: AOJu0YzDu3JX+5tkWP8kL+JmP+lBlXHu4s8etr86FK6h2d4UwMBH8YgL
	m74VcYFDntpE0Tb0dPmAA+RKQhe2bi72fk0i3ZuaDp3vXpUUmJmpNvxOFU2ewO1NM+Rkb1ld1ik
	GRX3+V0rdkGIH8/aGKesgExvAo2+YagiMXKwyB19bk++p2T2ewBI=
X-Google-Smtp-Source: AGHT+IH9oE5avAcWE1dPfuPWXIMdR/bUBTzCledqBKIgAA1sscmeeXwl9hobU0kHO9Oj+2sOIr59kjUvaPz1Cy6Hh38=
X-Received: by 2002:a17:907:c78e:b0:a6f:bc02:a008 with SMTP id
 a640c23a62f3a-a7242c4de49mr533457666b.4.1719315921872; Tue, 25 Jun 2024
 04:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_7721F6B72F58AA6154DFBDFF@qq.com>
In-Reply-To: <tencent_7721F6B72F58AA6154DFBDFF@qq.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Jun 2024 13:45:10 +0200
Message-ID: <CAHVXubhkrDv3Fx1KH-jjjWjo-LGKBMabvafAPsDZeSpGMEt-gg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Only flush the mm icache when setting an exec pte
To: =?UTF-8?B?5qGC5YW1?= <guibing@nucleisys.com>
Cc: aou <aou@eecs.berkeley.edu>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, palmer <palmer@dabbelt.com>, 
	"paul.walmsley" <paul.walmsley@sifive.com>, =?UTF-8?B?5pa55Y2O5ZCv?= <hqfang@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_044524_455916_5550F12A 
X-CRM114-Status: GOOD (  22.90  )
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

SGkgR3VpYmluZywKCllvdSBzZW50IHlvdXIgZW1haWwgaW4gaHRtbCwgc28gaXQgZ290IHJlamVj
dGVkIGJ5IHRoZSBNTCwgbWFrZSBzdXJlCnlvdSByZXBseSBpbiBwbGFpbiB0ZXh0IG1vZGUgOikK
Ck9uIFR1ZSwgSnVuIDI1LCAyMDI0IGF0IDEwOjQ14oCvQU0g5qGC5YW1IDxndWliaW5nQG51Y2xl
aXN5cy5jb20+IHdyb3RlOgo+Cj4gSGkgYWxleO+8jAo+Cj4gV2UgaGF2ZSBlbmNvdW50ZXJlZCBh
IHByb2JsZW0gcmVsYXRlZCB0byB0aGlzIHBhdGNoIGFuZCB3b3VsZCBsaWtlIHRvIGFzayBmb3Ig
eW91ciBhZHZpY2UsIHRoYW5rIHlvdSBpbiBhZHZhbmNlIQo+Cj4gUHJvYmxlbSBkZXNjcmlwdGlv
bjoKPiBXaGVuIHdlIHVzZSB0aGUgdjYuOSBrZXJuZWwsIHRoZXJlIGlzIGFuIGlsbGVnYWwgaW5z
dHJ1Y3Rpb24gcHJvYmxlbSB3aGVuIGV4ZWN1dGluZyBhIHN0YXRpY2FsbHkgbGlua2VkIGFwcGxp
Y2F0aW9uIG9uIGFuIFNEIGNhcmQsIGFuZCB0aGlzIHByb2JsZW0gaXMgbm90IHJlcHJvZHVjZWQg
aW4gdjYuNi92Ni4xIGtlcm5lbC4KPiBTRCBjYXJkIGRyaXZlciB1c2VzIFBJTyBtb2RlLCBhbmQg
dGhlIFNEIGNhcmQgaW50ZXJydXB0IGlzIGJvdW5kIHRvIGNvcmUwLiBJZiB0aGUgc3lzdGVtIHNj
aGVkdWxlIHRoZSBhcGxsaWNhdGlvbiB0byBleGVjdXRlIG9uIGNvcmUxLCBjb3JlMiwgb3IgY29y
ZTMsIGl0IHdpbGwgcmVwb3J0IGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24sIGFuZCBpZiBzY2hlZHVs
ZWQgdG8gZXhlY3V0ZSBvbiBjb3JlMCwgaXQgd2lsbCBiZSBleGVjdXRlZCBzdWNjZXNzZnVsbHku
CgpJcyBpdCBhIG11bHRpdGhyZWFkZWQgYXBwbGljYXRpb24/IFlvdSBtZWFuIHRoYXQgaWYgdGhl
IGFwcGxpY2F0aW9uCmFsd2F5cyBydW5zIG9uIGNvcmUxLzIvMywgeW91IGdldCBhbiBpbGxlZ2Fs
IGluc3RydWN0aW9uLCBidXQgdGhhdApkb2VzIG5vdCBoYXBwZW4gd2hlbiBydW4gb24gY29yZTA/
Cgo+Cj4gV2UgdHJhY2sgdGhlIHNvdXJjZSBjb2RlLCBmbHVzaF9pY2FjaGVfcHRlIGZ1bmN0aW9u
IHBhdGNoIGxlYWRzIHRvIHRoaXMgaXNzdWUgb24gb3VyIHJpc2N2IGhhcmR3YXJlLgo+IElmIHlv
dSBtZXJnZSB0aGlzIHBhdGNoIGludG8gdGhlIHY2LjEga2VybmVsLCB0aGUgc2FtZSBwcm9ibGVt
IGNhbiBiZSByZXByb2R1Y2VkIGluIHY2LjEga2VybmVsLgo+IElmIHVzaW5nIGZsdXNoX2ljYWNo
ZV9hbGwoKSBub3QgZmx1c2hfaWNhY2hlX21tIGluIHY2Ljkga2VybmVsIDsgdGhpcyBpc3N1ZSBj
YW4gbm90IGJlIHJlcHJvZHVjZWQgaW4gdjYuOSBrZXJuZWwuCj4KPiArdm9pZCBmbHVzaF9pY2Fj
aGVfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdGVfdCBwdGUpCj4gIHsKPiAgc3RydWN0IGZv
bGlvICpmb2xpbyA9IHBhZ2VfZm9saW8ocHRlX3BhZ2UocHRlKSk7Cj4KPiAgaWYgKCF0ZXN0X2Jp
dChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpKSB7Cj4gLeKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAgmZsdXNoX2ljYWNoZV9hbGwoKTsKPiAr4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCCZmx1c2hfaWNhY2hlX21tKG1tLCBmYWxzZSk7Cj4gIHNldF9iaXQoUEdf
ZGNhY2hlX2NsZWFuLCAmZm9saW8tPmZsYWdzKTsKPiAgfQo+ICB9CgpEaWQgeW91IGNoZWNrIGlm
IHRoZSBpbnN0cnVjdGlvbiBpbiBiYWRhZGRyIGlzIGRpZmZlcmVudCBmcm9tIHRoZQpleHBlY3Rl
ZCBpbnN0cnVjdGlvbj8gVGhlIGltYWdlIHlvdSBwcm92aWRlZCBpcyBub3QgYXZhaWxhYmxlIGhl
cmUsCmJ1dCBpdCBpbmRpY2F0ZWQgMHhmNDg2IHdoaWNoIGNvcnJlc3BvbmRzIHRvICJjLnNkc3Ag
IHJhLCAxMDQoc3ApIiwgaXMKdGhhdCBjb3JyZWN0PwoKPgo+Cj4gT3VyIHJpc2N2IGNwdSBJUCBz
dXBwb3J0cyBtdWx0aS1jb3JlIEwxIGRjYWNoZSBzeW5jaHJvbml6YXRpb24sIGJ1dCBkb2VzIG5v
dCBzdXBwb3J0IG11bHRpLWNvcmUgTDEgaWNhY2hlIHN5bmNocm9uaXphdGlvbi4gaUNhY2hlIHN5
bmNocm9uaXphdGlvbiByZXF1aXJlcyBzb2Z0d2FyZSBtYWludGVuYW5jZS4KPiBEb2VzIHRoZSBS
SVNDViBhcmNoaXRlY3R1cmUga2VybmVsIGluIGZ1dHVyZSBoYXZlIG1hbmRhdG9yeSByZXF1aXJl
bWVudHMgZm9yIG11bHRpLWNvcmUgaUNhY2hlIGhhcmR3YXJlIGNvbnNpc3RlbmN5PwoKTm8gbm8s
IHdlIHRyeSB0byBpbnRyb2R1Y2UgaWNhY2hlIGZsdXNoZXMgd2hlbmV2ZXIgaXQgaXMgbmVlZGVk
IGZvciBzdWNoIHVhcmNoLgoKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBseSEKPgo+Cj4gTGlu
a++8mltQQVRDSF0gcmlzY3Y6IE9ubHkgZmx1c2ggdGhlIG1tIGljYWNoZSB3aGVuIHNldHRpbmcg
YW4gZXhlYyBwdGUgLSBBbGV4YW5kcmUgR2hpdGkgKGtlcm5lbC5vcmcpCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IOWPkeiHquaIkeeahOS8geS4muW+ruS/oQo+Cj4KClRo
YW5rcyBmb3IgdGhlIHJlcG9ydCwKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
