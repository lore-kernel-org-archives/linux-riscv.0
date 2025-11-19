Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2848CF397E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDDj0oCcdL6139xj/48Ubzi8nUiQMOgXDFAqsoqYy+Y=; b=WKq6ZtY6hzczgQ
	7TkzBShvVa3EpPF/a5mp0RhbBGiZ0qzUecu9vyaibqyZwhbD65sq0d9zCDMnA/jonmjGTiqrmYZWZ
	rX2pp1/q3gRUyKNyoVSqaCyTQtWM5BYF3z+joLWV2TmzpU6/NRlA1ykD2XnhwC/nnp+EFYop77jtC
	VGiIzTROy8WCvwMS69BtVKGg3NA3ZxQq0FXCnsKGZG6SpDIlNuG12hXjzq00Ujeu8YdbVitScXqYe
	kqNLYqFZI00eVKvDJBhe7oCM1D1X6dYo+Y12uyOEglNk9OmNqDt/bHeFiTu60BeZfigTszIVTW0P9
	WFkmBinHLId9RZV+w15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlz7-0000000463u-2Mwm;
	Wed, 19 Nov 2025 17:28:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlz4-0000000462L-3hjS
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 17:28:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-594285c6509so7389714e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 09:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763573325; x=1764178125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrbKGzArFBmY9INk5u4nwH7jIv6jIRd92L2Bdtw77Do=;
        b=Z6GqH8LjnwHR+mk41BfSSKkkApkA3Z7cvrH6MqFktgIwd3Hhs3AVgMeh9rFgz52RED
         N4LuXPnnDSRTxAuaLNhp3i5rB4xUAEYrG3DgJ1xgTwshygwLz68v5lzWNlEeRCYk2Wwi
         l35TMy7R6vjinIQnYzlAKUXdZgxZykk+nilLQdWb0Iijd9G+pEQbaM1bqWjzmuovrUpk
         TLMpao0jNyRQ9YbdFYT8Tsn+KrR0QAgS29Qgp2o57E6Y1GxJG2XoAmrw+QIOsiQnC4CS
         TEYdWYlXNxqlNzlCJho0fE0aqMuqZPoR0sLRUHLtcZ0tcKbhK/Ql8t8n4CAtQvurHRsu
         ukUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573325; x=1764178125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrbKGzArFBmY9INk5u4nwH7jIv6jIRd92L2Bdtw77Do=;
        b=AvlsWSlTx3EVglw4ELM0RdC5e7yHxOy7JyAv2kYPGodyeuoo0meCuRT6cjVs+jjmjT
         /e6jnyBTt2/i99x3fk2Xcw3qzeHxCk2jC3fV9iuPS+bobDTu1Ks6v7jGVZoZbQF0kKAb
         GMky2Bey3j0YE0WzPLu30/KW0/oLO6wgsa7l2riYKe7+UNAhSlhIlE87UYVd9bFQ5BLN
         PPEGe8+kdc52OB/0qC+iDQ3E+4fSQexAmSI1eieDLI5i+02fCpVE2WyNJJi5knqlNMzl
         WPpbQxAoFa7HqjDCYDrIJ4es5OTGfPgFlWAjM+LUUgr46p/318VIVYWHf2mcFGo3pdoL
         xpIA==
X-Forwarded-Encrypted: i=1; AJvYcCVwztutehhQlpkJAFfaq2tVdMZMFJMd+ZGDwGq8WS6GB3nvUiPVHUMAwrc+RQuGjnEv/579UESuoQw/VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7842pFiSlExNBA2y3SxjyeYIso6Zec+VNsx9QzvogenPn5bre
	Y7lY2I543JhzAk+HvSI3x7fdKaT43tlMLYyE+Weu+/Q3bW2+2VcqmpFmUdUcvrewfjOQGBBHKBX
	9d4OOrBgr8Nvb4lWI7e3XBFr+iph6YxME96GvBdnXraA9+Z1Fi4Vq5dk=
X-Gm-Gg: ASbGncsSIxISvSAqkEW55tR0Z6OAjtbg/43Mk3cq0hhn646vYdaXne+kSYm570zjC+j
	Itupkwh948bbOjlYhkqV23hFJ48iAm3UshPFJgaBNitYpmYKuhBK+dmhdNmx/FF2A3TuUXiQ1eW
	7WDBRihlNMnLQTRdhcpmpMPxlo0jajLdcKmQRZX3a1F+Hv01yC/3VNB22aKdytJSnBzumYf7U0j
	WgnFM44Gq2pL9pFRMC5tCwadbbsgC2cxfhtjoGewFFuUV3zvZO7bX3ql8eD5SmbUlOgmVU=
X-Google-Smtp-Source: AGHT+IGBPH9sWGm2/6SPGrBct7rTorDaj7JCMd9MXliK/GrbLKKFAgWubSD/DP9XjnVDDd8sS5kYV0tauVoknOBKs04=
X-Received: by 2002:a05:6512:3d1e:b0:594:490b:4498 with SMTP id
 2adb3069b0e04-5958419f6ecmr7416667e87.11.1763573324566; Wed, 19 Nov 2025
 09:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20251119150049.13537-1-jszhang@kernel.org>
In-Reply-To: <20251119150049.13537-1-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 18:28:33 +0100
X-Gm-Features: AWmQ_bkLv8V8xcifQi6NXER9l5eRFmMkfr2Ql7HUyYLDXi19l-f8bZUrL9K_p5c
Message-ID: <CACRpkda=vNOq+QUZT71VwkTy6qz6yhu7zA3hYWTfc2GkptXFMw@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_092846_947889_E153C76F 
X-CRM114-Status: GOOD (  12.07  )
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgNDoxOOKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZvbGQgZHdhcGJfY29udGV4dCBpbnRvIHN0cnVjdCBkd2Fw
Yl9ncGlvX3BvcnQgdG8gZnVydGhlciBzaW1wbGlmeQo+IHRoZSBjb2RlLiBTdXJlIHRoaXMgYnJp
bmdzIGEgdGlueSAzNiBieXRlcyBkYXRhIG92ZXJoZWFkIGZvcgo+ICFQTV9TTEVFUC4gQWZ0ZXIg
Z3JlcHBpbmcgdGhlIGFybS9hcm02NC9yaXNjdiBkdHMgZGlyLCB0aGUgbWF4IGR3YXBiCj4gZ3Bp
byBwb3J0IG51bWJlciBpcyA2KHRoZSBiZXJsaW4ycSBzb2MgZmFtaWx5KSwgc28gdGhpcyBtZWFu
cyB3ZSB3aWxsCj4gd2FzdGUgMjE2IGJ5dGVzIG1lbW9yeSBpbiB0b3RhbCB3aGljaCBpcyB0cml2
aWFsIGNvbXBhcmVkIHRvIHRoZQo+IHN5c3RlbSBtZW1vcnkuCj4KPiBGcm9tIGFub3RoZXIgc2lk
ZSwgYXMgTWljaGFlbCBtZW50aW9uZWQ6Cj4gIlRoZSBkcml2ZXIgY3VycmVudGx5IGFsbG9jYXRl
cyB0aGUgc3RydWN0IHdpdGgga3phbGxvYyBhbmQgc3RvcmVzIGEKPiBwb2ludGVyIHRvIGl0IGlu
IGNhc2Ugb2YgUE09eS4KPiBTbyB0aGlzIHByb2JhYmx5IGhhcyBhbiBvdmVyaGVhZCBpbiB0aGUg
c2FtZSBvcmRlciBvZiBtYWduaXR1ZGUKPiAocG9pbnRlciArIG1hbGxvYyBvdmVyaGVhZC9hbGln
bm1lbnQvZnJhZ21lbnRhdGlvbikgaW4gY2FzZSBvZiBQTT15Cj4gbm93LiIKPgo+IFNvIGxldCdz
IEZvbGQgZHdhcGJfY29udGV4dCBpbnRvIHN0cnVjdCBkd2FwYl9ncGlvX3BvcnQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gQ0M6IE1pY2hh
ZWwgQsO8c2NoIDxtYkBidWVzLmNoPgoKTmVhdC4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
