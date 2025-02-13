Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F225FC0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rwTlhG+uqDS/v4MG1eUap3TWWsD/0tdImZuaKLQ8nk=; b=PX3j7wPIRxJMTU
	pnMg7T9BJbrCeNjKCMqNm6JWFkJhKhdHa0liRyLGnUTkkNuOUqMflRSI5kXvkQCXfWg93ih/MTjWg
	eEQxu4p5arZTpGAeY0IRpKTM8IOxM9qKyisT2Or1yq3nWibQoqTqKAulip1VWiMQjwA14rwjYfI2u
	6pNmFoK9VLucYAtSrsB/B85yut9g76nK9yxhojrQi+T25NjhuHJRy7b8j7fC/J3njmpuZtV/L3so8
	6U6Lryf3oy8kdWWf2D6Cm3BGMNH49uP/lyzVe8bY79slvSKCHwq9FZs/FuyqImOiBDR3aTSMNprwJ
	gZScSAq45k8JfvB8jf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWUY-0000000Afy6-1Acf;
	Thu, 13 Feb 2025 10:30:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGj-0000000AcxH-0TXY
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 10:16:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dd91c313bso344802f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=W6jcUaL4tLcP3DB3ly4cT5HhvhTGOIPotbWrNH9sV8eg4MjkD4TzmuaMRhzd9sn7GB
         QfZDcDMQuSSZ8wv9D8tRGZKLcqrcKKt6q5w13pbHAGCAbelvb5YgmFoAvRO4hnJcTOLt
         lYp22zGkp6ioPShW+GrwpDkfF/ES9YbVCrJMwz2jPnjosyTZ5dJKtqEKeIaOtUHPsF5o
         j/gTWr0lJIKiivDeHKbD1ZmjIuXyPmqyYRvIXtjSz425Ueaw/LE3/EavCblAmfNznGD0
         Y2D0pvJ0Xe7EXsOVMWskpYRrAoDx/BT5/5F2Y3Yv7ukAnA7yfZ2Ys8mPHMkQkVxdZBbO
         7AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441787; x=1740046587;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=F2WP4qOAoX8ntTZPzOpMzFspZj8KX9ck9Y4CR+8eg0eS7CoThyjtfZQ3ZVo23H4l7G
         FqIO1S5z7LOZ0NVw+5Jy2A44jHlPs8ztR64apjI47QPM8k3noj5rwvXQLK75x0Zk8ViY
         wcWDsOPpdyGE+rMgQrsLFPdkIjUbwqt4mLKdT6AaZNaV2GHe5tx7JSorN1UBR7FK3rgD
         YgXVcWvTj6G09jjnbWTVVtmzLUNafDLmVd3B7MhreRBZfwsrfrTbrVBeTyVZQJXw4cZ2
         H7T8re9tu56DeFhrfe73bXJVDCBc/IDEP0sQ7O2V5NMRli7h7uK1ArxtSsQbKKcAHUUf
         S2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVl3BCzKSkjNnxTqv3DpLgokWVMucNjGqhkML75di0BZJSBjGS6wrOOFC+7sF1hu50B1bSbi8ermGk2tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFQKaiHE9E2W6hzbRPQQmWFQAIEr2+6C9QrZD/pOGa58PbdmYx
	ttKaVgLo+pRZpoTZv/vRFDUZO/PXO6LbhBaCTIyu1evg2KtlS3BcjrEDoV+q2+s=
X-Gm-Gg: ASbGncvpVSl5jHX/FuXZfDRnwPiu2r8mjOMCXjM9yIHQFtpudJmnZa24B6FPCHDV+uh
	r8YA3LwAtv7PXXGtT10FdoQtI9ISECW3PIJI6dLtrbOsKEiITq6tRaHwJoH7TmtlPBE7Q2XsNX/
	n9d2jmFSZ9N/xvf5iK/0CLVMb40fCt/sSS7dQCerIkyvB/NYiYQZqeUUvq3y4Jt2uRsNpe9qws5
	EuafgdWvGjC9PVpLh1Os4m4pcTaaMgneD4i/oZcE5IJWAuoQU411Csgy7yZxXWiwSyO0ZODrPAR
	KPqZEOZB6MbKrQ==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185;
        Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
	of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021629_172298_AC6F9E63 
X-CRM114-Status: UNSURE (   6.75  )
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

T24gV2VkIDEyIEZlYiAyMDI1IGF0IDE1OjUzLCBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJv
b3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gSmVyb21lLAo+Cj4gV2h5IHRoZSAiIC0gdGFrZSAy
IiBpbiB0aGUgY29tbWl0IGZpcnN0IGxpbmU/CgpCZWNhdXNlLCBhdCB0aGUgb3JpZ2luIG9mIHRo
ZSBkaWN1c3Npb24gZm9yIHRoaXMgcGF0Y2hldCwgdGhlcmUgd2FzCmFub3RoZXIgY2hhbmdlIGRv
aW5nIHRoZSBzYW1lIHRoaW5nIFsxXS4gVGhlIGNoYW5nZSB3YXMgcmV2ZXJ0ZWQgZG8KcGVyZm9y
bSBzb21lIHJld29yayBhbmQgbm93IGl0IGlzIGJhY2suIEl0IHdhcyBhbm90aGVyIHNlcmllcyBl
bnRpcmVseQpzbyB2MiwgdjMsIGV0YyAuLi4gZGlkIG5vdCByZWFsbHkgYXBwbHkgd2VsbC4KCkp1
c3QgZ2l2aW5nIGEgY2hhbmdlIHRvIHBlb3BsZSB1c2luZyBnb29nbGUgb3IgbG9yZSB0byBkaXN0
aW5ndWlzaCB0aGUKdHdvLCB0aGF0J3MgYWxsLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sL2Y5ZmM4MjQ3LTMzMWUtNGNkYi05OTJlLWJjMmYxOTZhYTEyY0BsaW5hcm8ub3JnL1Qv
I205YWIzNWI1NDFhMzFiMjViZGQ4MTIwODJlZDcwZjlkYWMwODcwOTZlCgo+Cj4gVGhhbmtzLAoK
LS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
