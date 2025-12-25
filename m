Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0926E7AD74
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 23:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj8bQSzl0eL3fC+PRZH6RAAyE9vvOHBOtmURd1fqc4U=; b=J6ItAzHVd2DA3X
	zZvcstLTs/ecTBhVdMCRR0cchkt+ReQdcwOGdungR4pHPbROoaF9s4wp4jTYL/mpX4Qv4zdWdS11e
	sdJX0E9M7G+aaHEyGn4Wu7AkNQdNEasKoSO+xmvWcZQ4/gaCK/XPUmYoSb/Pi+XOkqTDMPqIDEZT4
	Eu4aTt2cxP/AoqLo93/iPAZTTCJJxwFdyPt9xAdzgqOnigzpXfYWyd7XXqQ+mrCsGK8e3oXFnsAQ2
	toxQc4WwBOwPrRVPgqWa8O/GV/qMzc1Ix8lhqfLahOFgwXRUDg6NrbWzB4eqng9XL+pbk8Kp3/PUL
	nNOHSbus5fVeRFmPA7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYuuk-00000000lAe-1Vcb;
	Thu, 25 Dec 2025 23:38:38 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYuug-00000000lAH-45d3
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 23:38:36 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6455a60c11fso5448859d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766705913; x=1767310713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=W9uvh8/HcBx6ZiDTj5ktBrrzwWPkQys3TRxAD3y3ES8gCGHUccwzIOHAcAsIXBlo6l
         21AKc0mL0w00r9lSbkSWu8fyfFaJzoyyhAzlcawA/pKMMnhgeIan/NxPbOVOKY23RTwA
         2aM5d+pdO4123Sb/x6oNWYNuvtbHmA+2nzrm1Go9+vu7IGWzYjY3QIj/5YcIv0zTf5WR
         WBKw83a+UHcClypxGffncdeoh8zK28gg8zpXPcKcasWTmnhBc5hB9ZLNvCXGtzKDlvWO
         dBb3sbYNS4hVq44CX+a06OXqUqezYLKxPdhZZp6oxEgnDI42iQyRfPoOUwBINlQdbeMm
         ihQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766705913; x=1767310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=pQEC5sJuueTrcLz9oq56IOunfMciDTY6ZMdvFZbZKEXuae+LHCMprpiSqk0p/UKGX2
         DCatMyGtw4/HyzJK88XrJdqqSSNpDtWkjgQWbGQPdfWK01MwwwPq95iXnYQ6ZSTTvc62
         mfDy7RL9sYACaclwMsnRhF+PYz5GKDjRGeZZ8NiyBgjx0sWtoqXU9L3Kom7qR10qAxLf
         LrZUBTtdZYI/d3VnWVmX2AyMqK63WazXt/Bbo29XVo3n1rLpm4ZtaW4z1mLt1sVWQaor
         xXG4eSqFA+PvC0GKn9DTCm0O93qVY796NpRQSkLsj113QBXiiojY5pS+HlYK3kb8fWYY
         Og1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2ZNZ230E9xCIrhKfCLGLu8Zv4h0dfUjmKLKmZp4dDLzq4CoRF0XsBqpK6j0XI1ev0QKs6w2BVo555NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnzP1tjfhkJQr67IZM/opOMZjpkNYClhvMbZ+751fv3cTAgzme
	GSbPdOs/++23H0eA7z4hg24/XXx8IBswnl3aga67TJfKvOWL7ICslqL/5sIZXRRauqbWqiFaJOg
	zqTYt5i+ycc9vfr60bdXCRA9GvF2+T554mKinModM0A==
X-Gm-Gg: AY/fxX7upN7xKbO5g80xXe9gy8Ih44Q/1UvKND3r9R7piaGUISxFqnZ1aj37STMYYFl
	PMpAqPHE7xCRUbAuEQrgqFXAaUINI9XtnpONWAKc9ENarYoF6Gv8mriDdMk9JL5G4vQddD86Clb
	LdSAxIjOjBivL97Y2mPlqgO6+qIu+G01oFcbPceruQjzj2l7jDY6arbBv7onIFGiWSzBnZ4SALS
	WR2yUt4HrYy1h0ThkMu9f+kDr1MD9v4AahDyrMHm48Hu/LfNqmpip8DBIVyWS+79axT+pREK8wq
	SyDoWi5nPdGX8A3OJXZqVn6k5DkCBj7P/C49uz63
X-Google-Smtp-Source: AGHT+IEqsYbbjwXLehn9TCJIOLfPJOIm/LDNAeoiYZx4u6S31/Kpcix2Mq3YrFQJu4uTOl2wq4xpYsyoxIEJ6tMxyHM=
X-Received: by 2002:a05:690e:1517:b0:645:5811:fb30 with SMTP id
 956f58d0204a3-6466a843f55mr16899140d50.11.1766705913510; Thu, 25 Dec 2025
 15:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com> <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
In-Reply-To: <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 26 Dec 2025 07:38:22 +0800
X-Gm-Features: AQt7F2psMc2LHbqeHhwPYOjN4t7xqZys30Ti3iWo_ZH1lUjqY_uTazP9ZogzLZM
Message-ID: <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_153835_255900_FB1BEA6A 
X-CRM114-Status: GOOD (  10.04  )
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

SGksIEFuZGkKCk9uIEZyaSwgRGVjIDI2LCAyMDI1IGF0IDU6MDHigK9BTSBBbmRpIFNoeXRpIDxh
bmRpLnNoeXRpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgRW5jcm93LAo+Cj4gLi4uCj4KPiA+
ICsgICAgIHJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlX2Rl
YXNzZXJ0ZWQoZGV2LCBOVUxMKTsKPiA+ICsgICAgIGlmIChJU19FUlIocnN0KSkKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJzdCksCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gYWNxdWlyZSBkZWFzc2Vy
dGVkIHJlc2V0XG4iKTsKPgo+IElmIHRoaXMgaXMgb3B0aW9uYWwsIHdoeSBhcmUgd2UgcmV0dXJu
aW5nIHdpdGggZXJyb3I/Cj4KCkFjY29yZGluZyB0byBpbmNsdWRlL2xpbnV4L3Jlc2V0LmgsIGlm
IHRoZSByZXF1ZXN0ZWQgcmVzZXQgaXMgbm90CnNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUs
IHRoaXMgZnVuY3Rpb24gcmV0dXJucyBOVUxMIGluc3RlYWQgb2YKYW4gZXJyb3IuIFRoZXJlZm9y
ZSwgSVNfRVJSKHJzdCkgd2lsbCBvbmx5IGJlIHRydWUgZm9yIGFjdHVhbAplcnJvcnMgKGUuZyBw
cm9iZSBkZWZlcnJhbCkuCgpCUiwKR3VvZG9uZwoKPiBUaGFua3MsCj4gQW5kaQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
