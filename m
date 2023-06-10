Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E5C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+PctyJg0qbN9PHBo4o0HsdWKfzyBloFlPXU3Djh4c8=; b=n1hp2ovq+an2bd
	CkGfKC31Yje4iekWzzXZbcapnPXKBQRwxV1nJcnypl6Ui6urFFQNtnAHgdtxWGoAD/5ZyNg/VTg8M
	P9jfd0DT73TFVKthBg0+gkhv+XvxlY8Kl3OtWxYBfTFfQuFekcrkgzADrP43K36RDvuEvVj4sO0r/
	xPdME8dRb5mvs/FzAYdoDZ1301pG9ikKeNCB6w+Y2LdTEHqyPw/0jErlIWCYcqptnKbcfkU7Gi7zT
	eK/Mxg+SmHZ4G6zu1aMNHJ9TH3HXakhlpR8+F/713PK25h14qh4GsgAYUfs9XEiDvpezD0YOyLy6Y
	agnJ356+YuMIrkJkZyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80pM-00GUN3-0i;
	Sat, 10 Jun 2023 15:48:32 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80pI-00GULU-2X;
	Sat, 10 Jun 2023 15:48:30 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977d6aa3758so508547966b.0;
        Sat, 10 Jun 2023 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686412101; x=1689004101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+PV93m/s/NOXGrP+XMGqPRSJ4bMSqkEUav/3Sp/SUo=;
        b=Q34XAtI54cIkhZYDotBTosBNKqeEtdaBGe/lHaZqbJ89DP58Z/qRC8OTHcB46m0Kz6
         tYZDXB+eN1elN5uNcii6qfMo6QKRIew8HjOzxQnKjwfYtI8QH1TzeUvWXuWVjRKibAo5
         oVqMa4yTNjPEnNLgASQGu+aEY31Mbd917fBUDjhMO0Jmw5zvHhRIwxxFUd6iayTCvK9d
         2vdziEGtDX7yJ1vOOUw2skkhT6BdgQ8ZbyeDMLE9Qj8kL9nHchSq7AQxBYFVVRWghCFM
         YkRPhqh9GgQAtJhC/Q9VULCI/TWMOpYGFRb/+xGzdTsj4a39ByFyLMzf8KrZU7Lyb0SW
         OxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686412101; x=1689004101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+PV93m/s/NOXGrP+XMGqPRSJ4bMSqkEUav/3Sp/SUo=;
        b=KynSGy3QohLYjaYPgEJX1D4Q4/nGAane+DlV9JbmXIRKy4tm1ae0VY9tetbYUUnmur
         tZYqCx0kwtUh+rhHuZswBjZOQhTUHifMqBnlprmjDHZ2Tud4W0ZlDlnJrYiwbbGeoP3w
         tk4MzmNMWwVVQQv7I3wqdYK0cqZbgr2tE9SBM9A4DP6QbKusNecOGDDiaiFT9/pM9SAv
         C+NCsP48Mfo47lLAZCtZFBYqd+OSXpz1naE3Ji5zYU4rWplyx0H911eUAycczMP5Ld+9
         50HJ2Qcoc/a9z0ui3Mkx18SE7qCFlA3HZmzTELB8mfLH7fzze/Qy/6W/B+RfF36+eME3
         zkBg==
X-Gm-Message-State: AC+VfDwfsGernpuhpQyUb622Z0gSOs5bG/97vOBSbdpWZ4myI61Jc2p7
	/WmQgJVnlMBxRFnjTobvdm/y4NQ71hrYUuDRajI=
X-Google-Smtp-Source: ACHHUZ4+yt8TVxdmv/KLF0owdyYhjmUilZj8tEPlviShNxjxsyve8eoayZ040B9uZ/VhtH2U+1jPZUtc7w/UhVrwtao=
X-Received: by 2002:a17:907:728d:b0:96b:6fb:38d6 with SMTP id
 dt13-20020a170907728d00b0096b06fb38d6mr6295931ejc.65.1686412100664; Sat, 10
 Jun 2023 08:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-3-bigunclemax@gmail.com> <20230610-ranged-outboard-2aaa0cc36cbd@spud>
In-Reply-To: <20230610-ranged-outboard-2aaa0cc36cbd@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 18:48:08 +0300
Message-ID: <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, William Breathitt Gray <william.gray@linaro.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Haibo Chen <haibo.chen@nxp.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_084828_831543_F52C2193 
X-CRM114-Status: UNSURE (   7.54  )
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

SGV5LAoK0YHQsSwgMTAg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDE4OjA2LCBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+OgoKLi4uCgo+ID4rCj4gPisgICAgcmVxdWlyZWQ6Cj4gPisgICAg
ICAtIHJlZwo+ID4rCj4gPisgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPisKPiA+
K3JlcXVpcmVkOgo+ID4rICAtICIjaW8tY2hhbm5lbC1jZWxscyIKPiA+KyAgLSBjbG9ja3MKPiA+
KyAgLSBjb21wYXRpYmxlCj4gPisgIC0gaW50ZXJydXB0cwo+ID4rICAtIHJlZwo+ID4rICAtIHJl
c2V0cwo+ID4rCj4gPit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4KPiBIb3cgY29tZSB0
aGlzIG9uZSBjaGFuZ2VkIHRvIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2U/Cj4gV2Fzbid0
IGl0IGZvciB0aGUgQURDIHRoYXQgd2UgcHJldmlvdXNseSBkaXNjdXNzZWQgd2hldGhlcgo+IGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZSB3YXMgY29ycmVjdCBvciBub3Q/CgpIbW0sIEkgY2hh
bmdlZCBpdCB0byBgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZWAgYXMgeW91IHN1Z2dlc3Rl
ZAppbiB0aGlzIG1lc3NhZ2UKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYwNC1h
ZnRlcm5vb24tZnJpZ2h0ZW4tNDIyMjIwMTA1NTdiQHNwdWQvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
