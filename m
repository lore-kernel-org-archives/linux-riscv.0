Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC80CE7D19
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b43+GWdPmTV7yTTZ1qYh3OhPZvn1IfZhZqaGdF7ixLg=; b=gy+AFpcnmuWb/g
	ZjE0ypTEIAW6X6AJEN6KegM4iSNbw4Daivu1CX/q8gBqAU/KKC+MV7u53M/yshBtZcR1dABZ3pvrE
	mT4G+J9nvKHKe5/2kxEfWWhJSHW2cOWzsRm4Y7T1b4+S8DtY6RmyUxVzedyAI133IhHAJvaHsGaGf
	xidy64qyvExEPCIgmEbHOM4PSvRyOIDVZsyEYFDNr2yy/QMOoGZNffTX3IZSc9U5GvNtHYCALkSkf
	h7eW7/LX0FNjDR66KITc/pAjA3prCo/SbL4YOJImt8+5PmT5l/d5f812CT56jYP1KMw31gMDhtxQ0
	3uZOt1wP7jd4QiDmLFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbxT-00000002lgh-1ici;
	Tue, 01 Oct 2024 12:26:27 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbky-00000002gkf-3edR
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 12:13:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539885dd4bcso4484204e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 05:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727784811; x=1728389611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSmtCX/NXBnxPD6tdxViAr4FvJpalMjvGZn0b4FY+V4=;
        b=by2XV8RJ2FRZ/xerPH1xvGeyptA0jlhc/LmXcnJyJGHyIp6NuPd3dkUdS1ITBgQECi
         MYGzLfINZUnfwx6xfpwQRvTkJ3hVpqF6z9uGTZKRdjzGCfH57pr60qxVTtsHtCeKsJwh
         KoMgaXTpAO56yPPX5tMVQlVtEM/lszZ1nqoMvoR5Mp6aij6CCBYIr6XDZp8Ak913xZpR
         VCeEoS9LrtwrXCwqIqswFMvTu0juYTutXdeCu3bSK2+BdB153nrfZDpEelgSElhK8QTW
         iurt7UpSqv1FLfD+jHDB0eh0KJajLOhgDURy25RTphCnK3yWWtFe4jTac3EpTGe6ZThz
         dn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727784811; x=1728389611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSmtCX/NXBnxPD6tdxViAr4FvJpalMjvGZn0b4FY+V4=;
        b=HwiXbVfEjTMSq8mh2+jkf1EVsRu93V3pcDyRkHYVcy7qzleV+AkfMr84dgY3R73GxQ
         5HS/ilI4DnZPcPc/U4M3JqRXjYiYItZ2BTNbKYDom0XYZ0OnB0Fs4WpLO9Hy+VBeF5Ci
         LDh5M/rYjB0G/xA5cpadnjTkh9Bk5sAGuhYRce1lkjNaXWXissZPPgfqfpB+oS13llLO
         BkSVGxvCt3K4S4aRmJcWbKEg8gbPxST9jtC40V66WoruquKjcI3zvqzBkq/EBOdHoVjJ
         gtKkj6LryoPBKmtkuHBBQqTWErpU9/8qIEiYD/RUSGVyhMmhF3Re0kvT/hMocza0pD2v
         9c9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5J534FB8gINhUTynikR3+56PISIFEDA92tH+io4/ppkLQK7x1wasVOiWE7C6uqcQtINr5d/I2DoZ+xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrb5BvtVmHRYOFxXZDWI2js4ECAPZo9PpMTmpU3vYssiymIiFw
	9lIOYC+yngNueCmDnC5/QdaKHaYU4U/URr7t9k8lZG2JtIFFKmMkCaOO4iRjL97hKHSBUVkfm+9
	S5pNI8W2ODG5B9OaCU3Fl3WicIljsTqq3kRTpS8izwDAezFVMZwA=
X-Google-Smtp-Source: AGHT+IEX5c6pNgEkIZ+KSeqJcmc88FrIwMBPRJFBiIDtvkFGTTvq4JIs8I5dD3c76xnQBRBnqXQWDaKFo+LINH3spi4=
X-Received: by 2002:a05:6512:334e:b0:539:8d46:4746 with SMTP id
 2adb3069b0e04-5398d4647aemr3244329e87.60.1727784810881; Tue, 01 Oct 2024
 05:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 14:13:20 +0200
Message-ID: <CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_051332_934161_670E94E4 
X-CRM114-Status: GOOD (  11.15  )
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

T24gTW9uLCBTZXAgMzAsIDIwMjQgYXQgOTo1MeKAr1BNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
dGVuc3RvcnJlbnQuY29tPiB3cm90ZToKCj4gVGhpcyBhZGRzIGEgcGluIGNvbnRyb2wgZHJpdmVy
IGNyZWF0ZWQgYnkgRW1pbCBmb3IgdGhlIFQtSGVhZCBUSDE1MjAKPiBSSVNDLVYgU29DIHVzZWQg
b24gdGhlIExpY2hlZSBQaSA0QSBhbmQgQmVhZ2xlViBBaGVhZCBib2FyZHMgYW5kIHVwZGF0ZXMK
PiB0aGUgZGV2aWNlIHRyZWVzIHRvIG1ha2UgdXNlIG9mIGl0LgoKVGhhbmtzIERyZXcsIHYzIGxv
b2tzIGdvb2QuIEkndmUgbWVyZ2VkIGl0IHRvIGFuIGltbXV0YWJsZSBicmFuY2g6Cmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1waW5j
dHJsLmdpdC9sb2cvP2g9aWItdGhlYWQtdGgxNTIwCgpUaGVuIEkgbWVyZ2VkIHRoYXQgaW50byBt
eSAiZGV2ZWwiIGJyYW5jaCBmb3IgdjYuMTMuCgpZb3UgY2FuIG1lcmdlIHRoZSBEVFMvRFRTSSBm
aWxlcyB0aHJvdWdoIHRoZSBTb0MgdHJlZSwgRldJVzoKQWNrZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkkgdGhpbmsgSSdsbCBtYWtlIGEgc3RhYiBhdCB1
c2luZyBndWFyZGVkIG11dGV4ZXMgZXRjIGFuZCBzZWUgd2hhdAp5b3UgdGhpbmsgYWJvdXQgaXQh
CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
