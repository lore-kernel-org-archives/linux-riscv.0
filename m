Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A330C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9I/xzkgVugETWeV7lmZ9APcXn57mZaOl2dJbp+k5KM=; b=huaY64HjVDyHXa
	ez2iqFzI2iCg+oLyDTk7E0p0nCb2/MmTmtfw2z+iy0ys2OskhCQxJhhhJrAO9he2GEG+/IFiYTMSa
	Y0oJOfFbxWgPbXe1NMW7WqUPKSHQ0Q11F2PVbsbJjTl1rNHdmYAbeeunJuqOctE05vCVYDZ9Vom5A
	r5lX8wo+mM+ceXbHDcTz+57/AYO11pfQXoMnSuXQRTy1sLWE0PeI3xdJOVt0sxTX5f7MQ+oJJny0z
	b42sPopigYcS4HGpyWpNsRG6ezf9BeIAB9hhM0sdrdUI40J/ZA2ssK1DJj6SIpnnFHbWKPFMr58v9
	c288h9AHj8Blj2edltKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NGf-000000026mV-21n0;
	Mon, 29 Apr 2024 09:25:49 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NGd-000000026lG-1FiZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 09:25:48 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5ac61cf3fffso2553146eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714382744; x=1714987544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbWYzCSEoyxumsvR08bPig+519NlxGiw91GX3ABWAmI=;
        b=Ci/rywI4P/XQjw6yd7qyvrsRHlO4YHyX3oWmOiUD3o579vqh2W95JXMYHneCtt3xmp
         2rD3hfwF7IXPoXfErLqzEYu0THQ7K4AjmxYvlUKGowgyuVW3B7Jy/v2i6lMn2zMJe8Al
         OHURqORwa0ad/nzoaCpxESw6vp7qskXJVujSe5xq3nezteZ4tM18QkvZNpjjBkDuI7Bj
         6RSgckf2waJ3jwl2pHvmhBOlJgjIfGv4mJPGrwVvHUkY8xSpBVeeVoLSSDvYtlgCI/md
         5lFPSnCKWLzTMdr6HpoSS2eUQagnHF6GtKsnATQQhgg63h3NV8LhqoM4TIh7XEmBpnBr
         867w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714382744; x=1714987544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbWYzCSEoyxumsvR08bPig+519NlxGiw91GX3ABWAmI=;
        b=LsgPHbjoM5AXst0ptCgW8+xdAvWIywH9+cx1e+gjCWX3+jYL7iDQ8Qv9ksZ6y6wjWU
         0NLyhxoFqBF/7gXy2B2mtk90wVSn2W3DlJ1LJGDvz3CNNRFNg3PaSsq13jc0MLp18cE0
         CzpVI4AVrYcssY7mnOiUvJI793Ic6mk3ManrnH1ZpbByMXxJugMdw5FEEUVOYcG/guaI
         2a4ZBrZdMyTjLERav/+4JqZGeD9Rf/rtp7YvYI/TZxQ/xw+NTyzQlfgWbfn/eONnnqDn
         c8VbDyMZ+/b/lG+tvpn0tl8PVUwV7wy2WYWJv5u6Iw9sLijf7xtN9uYihLvfrsTY9b9Z
         2sqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2URhN25tVzM/lcM5JGwgBm6OWGFg90k2TGeiMzrFCBiqWke+2IxU07XiswiFUfjl7XEe+lrwfGZzAekCvOZaZyE69YaTR2Z9bcj9fOSjl
X-Gm-Message-State: AOJu0YxK0PjnhWbkM0vCO6/WmimaWYi+bAnCLhGtsp7+SUGxAYnyDslk
	x+DpbCJlCBFGd1VND65EIJ7rIBC3FVPuSVWBklCOnNf1g5EEdakzTRv2yfOwQIy+gI0sveZbHAH
	7PueTqWkg8gHOBAqbeOqxFD34vMQ=
X-Google-Smtp-Source: AGHT+IFYt5gw9zhGrhOiSzSqMiit+DxbvdfCvNpQBl3bbGxw562cT0dhGTU+x1sG3KWCX8QEEWIDzPg+gk6CXCaiFjg=
X-Received: by 2002:a4a:347:0:b0:5aa:3b8a:b491 with SMTP id
 68-20020a4a0347000000b005aa3b8ab491mr12049732ooi.4.1714382743967; Mon, 29 Apr
 2024 02:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
 <20240427075426.662671-2-qiujingbao.dlmu@gmail.com> <40eee0ca-fb15-40c7-80be-a1198f37663d@linaro.org>
 <CAJRtX8RztQfeoBhGjdAZZBW5h9PQT_pYhyKCRsbXwx83SbCExA@mail.gmail.com> <1bc01cc9-313d-4433-9995-49a5738adeca@linaro.org>
In-Reply-To: <1bc01cc9-313d-4433-9995-49a5738adeca@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 29 Apr 2024 17:25:33 +0800
Message-ID: <CAJRtX8Q0RYFBrecSwWsDHQi8YaZ0hFAND8qj011j_p+uCjRHpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	dlan@gentoo.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_022547_449670_01AB30D2 
X-CRM114-Status: UNSURE (   9.05  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMjo0M+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyOS8wNC8yMDI0IDA4
OjQxLCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+Cj4gPj4KPiA+Pj4gKwo+ID4+PiArICByZWc6Cj4g
Pj4+ICsgICAgbWF4SXRlbXM6IDEKPiA+Pgo+ID4+IE5vIGNsb2Nrcz8gTm8gaW50ZXJydXB0cz8g
VGhpcyBsb29rcyBpbmNvbXBsZXRlLgo+ID4KPiA+IElmIG5lY2Vzc2FyeSwgSSB3aWxsIGFkZCBj
bG9ja3MgYW5kIGludGVycnVwdHMuCj4KPiBEb2VzIHlvdXIgaGFyZHdhcmUgaGFzIHRoZW0/IEJp
bmRpbmcgc2hvdWxkIGJlIGNvbXBsZXRlLCBzbyBmdWxseQo+IGRlc2NyaWJlIHlvdXIgaGFyZHdh
cmUuCj4KCkkgd2lsbCBwcm92aWRlIGEgY29tcGxldGUgZGVzY3JpcHRpb24gb2YgdGhlIGhhcmR3
YXJlLgoKQmVzdCByZWdhcmRzLApKaW5nYmFvIFFJdQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
