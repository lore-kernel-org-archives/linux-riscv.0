Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFEEC25B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUCzqcmCjM4geuTkNDEIU96HScEJHe3hArrqrPaMkYM=; b=LT+g8thF5EzIhO
	y/pJ1tsPj7LaMuNGmgmKLTmiEIUnKTelTv7IA5vBULstWYsKte2V9rV4cc2eJwYBZUQRRf/5e0+OI
	eDku0JAgDjfZ1CQ382nb4tnSl6ynpjgDdXO+G/B2FAm1cnUCbBZUrSuZJ0zbZ9VSjZUGczo8iU7Ex
	xL5MuYbAFsncc7Qsc+5iFYwbqir3+ybniEmuaGVkkihtW65xtSPnEkPezgsn5ebxdlpCbVj5kEzh5
	ySsJiX7sIZR1JRU+31oLuXKkBN68VGv9Wl5HvNHTJJHrLqilr7Tqn476dBxh60IbAX/Oy/t1phjCM
	Bix2ibtnR9lMS9bAjvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIcG-00FyPa-1C;
	Fri, 27 Oct 2023 08:54:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIcD-00FyOu-11
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:54:51 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7789a4c01ddso137322985a.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698396886; x=1699001686; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdaenGl9X0PEqjSYbPqn12MNPqtdvNAV8Oju3UsrrJ0=;
        b=JdTutLXzWuOzpXf07Jo2XzVJaZ71xAkK5wKsyeecdAxpx3R0W9aalHo3dWL7GAPsX6
         uefKEDfFLUhWfQ7mc0O3KU5Jo0++rUC4wxbEDJp0fc7ku8sLUlNLjSaRzQiiQDEaZYEj
         4DC/P5t9SaOWrgkbtEygBq8iZhN4NmHGPs7YG6uXOSct2oOYvqcNowE3+YGitHLueZul
         JDtMByVmF63jBIWFCCo1caXbWc/Phno15A7nT8kLIf6FNvujzkH+CI5KALWGfLW++KWD
         dU+J5VkLX7Vz8vLbg4fo574uoukBnKmLY6FtEzdNERCH27nnYDBHIthpGm2Drdu7bDp8
         e5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396886; x=1699001686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdaenGl9X0PEqjSYbPqn12MNPqtdvNAV8Oju3UsrrJ0=;
        b=rV2IUTi5ASCi+dvqzS9QWmRNkzTD7RVlSM9NXKaKJyVHdjJcM5xh0xmQ66GdKBJmG2
         OKHPGWJubbK9mA2yJpzVgC2EOB6wFmeCsU7TMj7JTLQrQwp7TaK/Lk3pcqM0dDg/SK+c
         ziMOKhVSWGFK5VjzCYB3INIhEqeIu27mc5LLbLhp1lWJRpUkPZFYB6OMvCuhHufogQg4
         W2ixfDuAU3PusUkouEjlrWbtoXo4oC/lgdmYHApf9w6oci+AHHmQU5Fo88400IY9EyvZ
         v6P02v9h+tZYvvvTSH+rE9KwKKFA6lA37N+FJzGoWaRQwtLx9NdkZf8kDy2ZOkkSpPqY
         B5Nw==
X-Gm-Message-State: AOJu0YzfUKaPTXrDTY83G51txoHA8w3qEbQ9Qsb0LQ3OKc/07eyxMv7B
	aUCT1PAcME0nyZxQE3JccJqkxYJiEnsELDwq7+YOew==
X-Google-Smtp-Source: AGHT+IEeCm4aK9bpRM+LcIhgy8a9j/Ju0WiTVSP3A9XTCbcW3Gefp3T6ONYgGWcMpDzNEJEHYxXa/UkgFynZJD761IY=
X-Received: by 2002:ae9:c114:0:b0:777:2792:4a2d with SMTP id
 z20-20020ae9c114000000b0077727924a2dmr1687510qki.65.1698396886165; Fri, 27
 Oct 2023 01:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231024101902.6689-1-nylon.chen@sifive.com> <20231024101902.6689-2-nylon.chen@sifive.com>
 <20231024-yin-coliseum-11f5e06fec14@spud> <CAHh=Yk_h_1r7ZG+yLK=SoK9AgPkestuQDH-CK621mz=X-PA+cQ@mail.gmail.com>
 <20231025-utmost-enforcer-eda125f636ac@spud>
In-Reply-To: <20231025-utmost-enforcer-eda125f636ac@spud>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 27 Oct 2023 16:54:35 +0800
Message-ID: <CAHh=Yk_MfFowjzUypgZ7DEc2nNN2Pd7MAFCk6W=5P4Asd20T_A@mail.gmail.com>
Subject: Re: [v5 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	emil.renner.berthing@canonical.com, vincent.chen@sifive.com, 
	greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_015449_394311_CDD99FF3 
X-CRM114-Status: GOOD (  14.25  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDmlrwgMjAyM+W5tDEw5pyIMjXml6Ug6YCx
5LiJIOS4i+WNiDEwOjE05a+r6YGT77yaCj4KPiBPbiBXZWQsIE9jdCAyNSwgMjAyMyBhdCAwNToz
MjoyMVBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gSGkgQ29ub3IsCj4gPgo+ID4gQ29u
b3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDmlrwgMjAyM+W5tDEw5pyIMjTml6Ug6YCx5LqM
IOS4i+WNiDEwOjU15a+r6YGT77yaCj4gPiA+Cj4gPiA+IEhleSwKPiA+ID4KPiA+ID4gT24gVHVl
LCBPY3QgMjQsIDIwMjMgYXQgMDY6MTk6MDFQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+
ID4gPiBUaGlzIHJlbW92ZXMgdGhlIGFjdGl2ZS1sb3cgcHJvcGVydGllcyBvZiB0aGUgUFdNLWNv
bnRyb2xsZWQgTEVEcyBpbgo+ID4gPiA+IHRoZSBIaUZpdmUgVW5tYXRjaGVkIGRldmljZSB0cmVl
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHJlZmVyZW5jZSBpcyBoaWZpdmUtdW5sZWFzaGVkLWEwMC5w
ZGZbMF0gYW5kIGhpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMV0uCj4gPiA+ID4K
PiA+ID4gPiBMaW5rOiBodHRwczovL3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvYzUyYThl
MzItMDVjZS00YWFmLTk1YzgtN2JmODQ1M2Y4Njk4X2hpZml2ZS11bmxlYXNoZWQtYTAwLXNjaGVt
YXRpY3MtMS5wZGYgWzBdCj4gPiA+ID4gTGluazogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMu
aW8vc2lmaXZlLzZhMDZkNmMwLTZlNjYtNDliNS04ZTllLWU2OGNlNzZmNDE5Ml9oaWZpdmUtdW5t
YXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmIFsxXQo+ID4gPgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRo
aXMgYmxhbmsgbGluZSBzaG91bGQgYmUgcmVtb3ZlZCBpZiB0aGVyZSBpcyBhIGZvbGxvdy11cC4K
PiA+IHRoYW5rcywgSSBnb3QgaXQuCj4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+ID4KPiA+ID4gV2hhdCBkaWQgVmlu
Y2VudCBjb250cmlidXRlIHRvIHRoaXMgcGF0Y2g/IEFyZSB5b3UgbWlzc2luZyBhCj4gPiA+IGNv
LWRldmVsb3BlZC1ieSB0YWcsIHBlcmhhcHM/Cj4gPiBZZXMsIFZpbmNlbnQgd2FzIHRoZSBmaXJz
dCBwZXJzb24gdG8gZmluZCB0aGUgUFdNIGRyaXZlciBwcm9ibGVtLCBhbmQKPgo+IFRoYXQgc291
bmRzIGxpa2Ugcy9TaWduZWQtb2ZmLWJ5L1JlcG9ydGVkLWJ5LyB0aGVuLgpUaGFua3MsIEkgZ290
IGl0Lgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
