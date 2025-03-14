Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118E5C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkKOmVh25c7li1jgRT6jeFKUoqBNApVcB9hjAUhDQfQ=; b=2NXn1UQBy4SUGU
	zIsETOl//AtH4Q5NGifnzlyYWAocYpVvpeuZAv8dz+5V0r8UbiUgHAfl/59j2A+RGcfC5zTBtUn4F
	YHpZNIkQrLXCH44p4Xt3bA246gLkBf0anRiSp6HEbZwk9t4W9AsjroLmoGsgong2zHHnwbmk1dLzQ
	wiPC54/RZx1cJw43LrfB9iK+MbW8agJvhGIksXgpf7tpdTT85dgECZ+NLm7Nwrieep5qFPPHD12Ue
	r1gmPOE1Kjke4Gsfe18sAOUsK/8IsFkdaeS1M0L1sOp8LkGVA6XLVuQmExKx186jngY4ucJWKhCj5
	yMrlIf8CxTFLZ/J92NpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEfa-0000000FWtB-3R3W;
	Fri, 14 Mar 2025 23:42:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEfY-0000000FWsP-2kLp
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 23:42:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54954fa61c9so3250530e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995743; x=1742600543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=VQGEiTt7/8xRE3GKPWs5ao+vpq3TXW6/lvD8nBqYuEA1gVZ461hknr8DjV5qtFG7JX
         EHAxoLTjbs619ZZ7CBH5/aTOEJCHMoDx3Lq5E85JLWh1xVwtrPvJPx6zG5RYZA0Iww2R
         smPjcSsgfaA7Y/9q6Lnq2aOn6XIrXPnpn50KWdbu6o5sHexDzNbpTxjFfXyeSO99ii4j
         Tr5xn6Yhn02OesWfsawfdXC/kamJm67ltC36GjBHFXhqNKSf3QB5jJCC+noqUhpI7oNq
         GzMa/RF/KQ+qLwF7gjtpJyheL7ZSfxSBigcAT3/PmgnpI9dp754E0BoPzDm32BtGYLGw
         mXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995743; x=1742600543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=Ne5QzQ3/ivA7e5AE8S5OkBRZlEjO6C/BKoZtzFmhaKXOiYaxYxrE6ZxnJ0STIMt1Ct
         oHfCbfS+XLLL+rdRG1tc4q7FwiTGQkGMzwHkY54Ov3WLhYA1ix31Kp4c+XBiwOeY4eeG
         3dhBYO59i4IrrrIF8Unn/DDyR+3j8wPQdyjt7w+JfFKdg1huH1TI0fqVmJ0It/zRGVFt
         3hWGudF5ySKWVZEuE1SmjV1A9yK/2A6shmZvWlX/RFBaYp2RNZlNuN7LpB56Q2Tkb4v1
         JFlCBxvN51GLZEtAPcqKdAuOZVond8HMnANjdfrwZjrNGMSJTzCukCBGTDk7kOzvz70E
         T+0w==
X-Forwarded-Encrypted: i=1; AJvYcCXD9CmGy8og1Z8sTcB7iuA93+e+aVQ+UfWP/ewRZPUZNmSnHKjA1kkVSjtXQDcupNaLQ5g6/IVOM0Xs3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOdhC6XKtMZInTXJMWBWpZOdaueFHbNWkqFx5eNLdB80ey7ZKy
	GLayxyL80klgOQG0Hci403qpU2SKE8V0TkJTXA6pe35yhql+RBNDyWwfZ9fxopjyiy4tqnvcp7T
	7EZMSsMyvYaKhWF+433fjgBOB0h/Nhi+JEeXPLA==
X-Gm-Gg: ASbGncumiV7LOoQbqwnNcxFVh0eu9gvAmcikDJHrJJeWAAcJIu7VNk5OU3pNZqkd5ck
	rewdODgG8Yt7oqOMMrm2SFCATmPZeFtrpr24ryGAeXpvxcXdNWDnekHpwLH2zx+05oUQaIkOjBY
	8zX4jeN0ZVN0/TOVRsQ/3ttCs=
X-Google-Smtp-Source: AGHT+IH2XrsL8yYl1YnEw5KjXw8pQrBhLhYCrdne0HwB7XZwvtkUckarOcWg0mzevQ8o+qQ4EgbgVcAmMqOmghDeBpo=
X-Received: by 2002:a05:6512:39c3:b0:545:d72:95e5 with SMTP id
 2adb3069b0e04-549c38f58e0mr1469764e87.7.1741995742834; Fri, 14 Mar 2025
 16:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com> <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
In-Reply-To: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:42:12 +0100
X-Gm-Features: AQ5f1Jpu-cIvAEmPOEuCazdHtSeZTHJaPnNt4nIJ_esAuZFz_4ZvByvCeSjIFs4
Message-ID: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164224_692495_6A400EBA 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgMTI6MjDigK9BTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlh
bWFAZ21haWwuY29tPiB3cm90ZToKCj4gSSBndWVzcyB0aGlzIG1lYW5zIHdlIHNob3VsZCBjaGVj
a291dCB0aGUgYmluZGluZyBwYXRjaCBpbiBMaW51cydzIHRyZWUKPiBhbmQgbWVyZ2UgaXQgd2l0
aG91dCBvdGhlciBkcml2ZXIgcGF0Y2g/IE9yIGp1c3QgdGFrZSB0aGUgYmluZGluZyBwYXRjaAo+
IGZyb20gdGhlIHBhdGNoIHNlcmllIGFuZCBsZXQgdGhlIGdpdCBpZ25vcmUgdGhlIHNhbWUgdGhp
bmc/CgpFaXRoZXIgd2F5IHdvcmtzLCBpdCB3aWxsIG5vdCBoYXZlIHRoZSBzYW1lIGhhc2ggc28g
aXQgd2lsbCBhcHBlYXIgdHdpY2UKaW4gdGhlIGhpc3RvcnkgYnV0IGl0IHdpbGwgYmUgdGV4dHVh
bGx5IGlkZW50aWNhbCBhbmQgZ2l0IHdpbGwgc29ydCBpdCBvdXQuCgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
