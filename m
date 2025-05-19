Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48943C3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7W9YhGydu47gfnqUgExA3CReaizuI/4I5c8hDj9wywc=; b=4ljg4cn76AWORF
	a4iBWkQ7Gper8F9eX9q6p4G/vH05JHGM1vJJnk5uSkqbPjN2tdBS2U4ycRQTy8jgSFPmPnPEMYQeS
	F70AU4EC6hj1AZSHy0qTUFofZnmYP5PNy12BThoC/FjYtxI9LBKPOel+gUUtDXaJfzz6mso2YCMJS
	d9+KV6epTaeinhINMoxoVGlFGfSMg4qWH7vI1J50WhETRdcEHfA/TP2yL8MKwZge3u2jkYS5QkdPo
	NXp/GkPBT1zpcYQRzGgVuYDjzb+wVsWwAuYcYgWjlmwcaYKJnqnYBkSqB6/Z0JeutjHYbCHpmRzQJ
	tfathH2ju3OR7RbK39tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0O6-00000009GlE-3Qpq;
	Mon, 19 May 2025 13:18:38 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0GW-00000009Fdv-3IaC;
	Mon, 19 May 2025 13:10:50 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6430746e87.0;
        Mon, 19 May 2025 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660244; x=1748265044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
        b=xIcC1EqaTBJy7onp9kFm2E+inwLn3iQploLv4S+XZSixYovLf1tCw0PSlQcsnmkCD/
         tKmqLmHjYufhAN8sSBXtaE+kRhbteUFKhAPFbbszc1G9yz6S9qVpwViIVpKq8lvZMh8j
         D2BTfN1CsBNzvEB4YRfARzhb8nOo1IxwZoeC4V4q8cvURsMbHi21o+Ya+MM+AE4a6qNK
         GBCAF7JzPEKOPyxAz9jpZ5e9A92tJPEP7jdrNU0rKwyNfUH2G/4nyTqqclCIrRotI/Qy
         gwQhqei8rnvVMz4P0IGxUQ1T/sEcZsXf9eqhVtFIZdT6+nDqdvIeGvQ/vyPOb2vY6cOX
         XOMg==
X-Forwarded-Encrypted: i=1; AJvYcCVeQcEdN+h+h/tBhTWidsBgLGdPj9sytYAFsx8Y/pwj2gVmmMIK0EWRovtWm0yzVqb3L75pdzMWO7TPJJW216Et@lists.infradead.org, AJvYcCWugPv4qYEW3DBbTwmi2zAXWgr04V+6tTbJmGxm4vDWO8gPss/YCrw0exhh/dWzE8if6MAa7+iPncNai/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLymbA5j/C1DWs1R7dhTJyiBHilXAV6lUoZ5mhrXBOQaahyeU6
	NWAupvy1vKMeo50KOBrAnRUZqjidyntIOZ34GWVflC7CSnl5Qcmu6fDzoklac6+kyRo=
X-Gm-Gg: ASbGncsicm3tAqHTiTa/aFS+SAq7TEcXmWBfw336ADGEbi2PQ95sWoiikEoJcASc/VB
	K5Xk97ka+JUOn1sbLQVb/tBdjxHuVc3QObOXhfH4SGUnUpagIVYpZPxPigs1NhVQKh5bKERoXEe
	EUiA0BpHxl4LqCnTf8l/7B3BuxhsEpia6UY3hu+y7bkn82W2eyTyrCVruL54zwYeeBsqxf8n1/c
	QzlZc6YRySyEjToYF/8Hua5AJ7jF0kIV6vt2GWFTdETtBOL5S3EP5sTR0bwgHwZ15sa1Gun8y68
	JHRh7vO+cJGVDFB6QCXjN4TPVv1iXtMPtR8Lmfe39/DzXtATs5LMlblvoG7azVsTyI7zVXIJSB8
	bT//7yax8
X-Google-Smtp-Source: AGHT+IFkCZoSNCLEbvoei4RPwvmq0j8sJKQHZzyXq0M6+aYXJw3L2QqhkUeXcdPSTPUGSUrzwHlLxg==
X-Received: by 2002:a05:6512:6805:b0:54b:ed9:2d06 with SMTP id 2adb3069b0e04-550e722b18bmr3192428e87.44.1747660243452;
        Mon, 19 May 2025 06:10:43 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f89asm1834551e87.232.2025.05.19.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:10:43 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-327ff195303so36011471fa.1;
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWhlTpEqd3ZvWmM7l3N0eXXjzn8Y8HCOjbvVxJXcRmY+9yUMulfCaADrUljyoc+9xqhQATO1dgH96j27DZMW+k@lists.infradead.org, AJvYcCWLA0AQNPAOnj4T1Vrhhh+dDT0I2rrLSjc166G5cuHTAXwWqEGrMyCBcvJ14rJ+bRh9j9QaD1FVCtksxuo=@lists.infradead.org
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr32090081fa.0.1747660242500; Mon, 19 May 2025
 06:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com> <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 21:10:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
X-Gm-Features: AX0GCFsxXp0f6XTIbmnJnSjvW3P0HJFBLSxCw1t28jUvhSs6_4fuwFkzC0zig3Y
Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO
 based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_061048_826069_8992EDCC 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgODoxNeKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgc2hhbGwgbm90IGJlIGEg
Jy0nIGJlZm9yZSB0aGUgbnVtYmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3
c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KCklmIHlvdSB3YW50IHRoZSBTb0MgbWFp
bnRhaW5lcnMgdG8gdGFrZSBpdCBkaXJlY3RseSwKCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdl
bnNAY3NpZS5vcmc+CgpPciBJIGNhbiB0YWtlIGl0IGFmdGVyIHRoZSB1cGNvbWluZyBtZXJnZSB3
aW5kb3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
