Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC555C3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZjvzLCb0ffdv8kdrIZPW4Sr9NW+PS+KJ5zcIcyqJ4M=; b=gClK3mnYt8Vt8s
	GKTIakGawjq1Az6vJiDidITj7ROZxll3lb+42UDKFTQPVBUUJLBiHC+3An84yoV1vTF+k1Se32yJK
	Ut8ekOEOt63WcGGpoBjy4j/fBibJDusUzgNBIW+wo4qbfnGtwx1p/qxWveFE/9BnvvIzEPrRdd1SA
	7rYq6iUk431o8S69p6Jsa5kmegxySkJOati4X3OkwGtd7ZkC7N9GbxXp+/Jr8NMF/I7xIfjp1cCs9
	tJ82QLKqV45NTnbUoUfbCqCQ3KU5fvXAUevECbF59ZMxukvGyMBNvXIu3uwrRdwqtu1EnmqIm3hEm
	wsKLlWu+Nz9elbD2e6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u252j-00000003P5H-0PV4;
	Tue, 08 Apr 2025 09:14:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24o3-00000003M6j-37LP
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 08:59:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-548430564d9so6071022e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102782; x=1744707582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=ErKJV0YftFqUEwY83DqgZScIJQw6lnT87rBb0dJX9UGRzL9Gmfx1INEuvuCnbHAgtR
         n/SaM2rNS5TNJItKlMsut+Dj/EEWO6PIbZcAlJXrNn2d+cOBcoMGgJW4v6LVNv0w30LC
         smRtoGpj1bMpYBVDuuHWbF0zzHLSBtJSUpH+s52AqZLqu7X9bHjAhw4GRVIaGP4l5fa1
         ATVkVDwuge1aPPYhvQh0r1RB2asAsxd9YQ40HmP/5fXw7Tm6B89yRAfvpMa6Lml5BCIe
         T/dc+Ki2l2x+TVR2q4xGh67Ko46bGOcXyjfFekvNrIEyJYyrAoE8+tHGMUP3xckALt5x
         qBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102782; x=1744707582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=gCxtK86BIAKp0Q/CI9MqRR7CypPU89TQy+inNfSgb++AqJFsif19Z9TxlXoMADYq4w
         qkNHeGmLw530lzdtvIkiaOWvUi+XcYLPLiXtFj2g0agPtQJOLf/waBeQsuKGe4yWECDL
         vv12/vl/LljAWo4vawn/q11VSJX7SfqSJNBmDQqRI0QK/YNMYagaLYkSsaUMnoJZ+2vR
         nlsauYfzc+0QQCK4Oa0BxYQoSzOIeEb7gg90B6J+qUf4MQ+Ib2akgknOUtxqHa/7KSJR
         tzaGHmWCkky/eMlQZLebgDA2fy6+7jLDEva57y31j756HB5U/j8clKoMDtbHjBDBFsjC
         Tm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/kACx+kd7YSogvia6xVOT1YqmAhh/uxEXmZ9C+IXgUpteWbVyCsbRZiNWSu7vMPaiD69Dy5HC6LwKJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpM0oIq7epX9lBHwbce8fxooyuWLau+Naf2XtnDG5kY6BTFYJw
	v6TGySXj7zhahIOxh5Q8eD0MwUM7n4AJLo6LQoiEGi+y7xAW9lZmXhRnRzOPFurxWMWmBtcIZQD
	525P2Q59ebg0SBO7seZraDR2k4IMTV8zkNmpXcA==
X-Gm-Gg: ASbGncumvnpV62DK+yUZxLV4cUlU6WbJjYwF11wsfNeFDkbJKN9g/NPoxT+NuI0bxDK
	t/V/CpzmE1pXfMKDpREWl09EgHvBmLSktOr3f30OUrILiey5ulaXZP5pyJdR4usnC/jd+Rs0O66
	bWADDyb00g7BhhKjC78Ere4xdN1rWyh78HGLoEnY66RzolY9p1MKguOFUALQ==
X-Google-Smtp-Source: AGHT+IFhU+IhVBAJzBIMUxOBAo7QfFVW11UL24yOIyLgi1oINyxWjy4Dxkzmcdvr4r4k1H5XdlGKfbxf2ZKflqozVaw=
X-Received: by 2002:a05:6512:1328:b0:545:2eca:863 with SMTP id
 2adb3069b0e04-54c29836e84mr3493147e87.42.1744102781735; Tue, 08 Apr 2025
 01:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo> <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
 <87r023ujiv.ffs@tglx>
In-Reply-To: <87r023ujiv.ffs@tglx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 10:59:30 +0200
X-Gm-Features: ATxdqUFtpGaiXd9grNQP3Ib6EubxTwZJQ656Dn7NldoLYjiAufIbT8WtF0ED4JY
Message-ID: <CAMRc=MdP09b-cm2uZeqbbCP20kNjQJ8CbXTXSTxQEihdoXjGJw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_015943_785331_269215C4 
X-CRM114-Status: GOOD (  12.15  )
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

T24gVHVlLCBBcHIgOCwgMjAyNSBhdCAxMDo0N+KAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDA3IDIwMjUgYXQgMTM6MjYsIEJh
cnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciA3LCAyMDI1IGF0IDEyOjMz
4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+ID4+IE9uIDA2OjA2IFdl
ZCAyNiBNYXIgICAgICwgWWl4dW4gTGFuIHdyb3RlOgo+ID4+ICAgSSdkIGFzc3VtZSB0aGlzIHBh
dGNoIFsyLzJdIHdpbGwgZ28gdmlhIHBpbmN0cmwncyB0cmVlPwo+ID4+IGFzIHBhdGNoIFsxLzJd
IGhhcyBiZWVuIGFjY2VwdGVkIGJ5IFRob21hcyBpbnRvIHRpcCB0cmVlIFsxXS4uCj4gPj4gICBB
ZGRpdG9uYWxseSBuZWVkIHRvIHB1bGwgdGhhdCBjb21taXQgZmlyc3Q/IHNpbmNlIGl0J3MgYSBk
ZXBlbmRlbmN5Cj4gPj4KPiA+Cj4gPiBObywgdGhpcyBzaG91bGQgZ28gdGhyb3VnaCB0aGUgR1BJ
TyB0cmVlIGJ1dCBmb3IgdGhhdCBJJ2QgbmVlZCBhbgo+ID4gaW1tdXRhYmxlIHRhZyB3aXRoIHBh
dGNoIDEvMi4KPgo+IEhlcmUgeW91IGdvOgo+Cj4gICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IGlycWRvbWFpbi0wNC0wOC0yNQo+Cj4g
VGhhbmtzLAo+Cj4gICAgICAgICB0Z2x4CgpUaGFua3MsIHB1bGxlZC4KCkJhcnRvc3oKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
