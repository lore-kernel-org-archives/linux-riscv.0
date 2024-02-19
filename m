Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C5C48260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 04:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DcGEcNNVCeM/y8h8Yxowueb9Vgb/xvXN6OsfujR4lk=; b=4GQ1AbxlD6XrNM
	UPo5PMl6A8MEcYR0dQIKEdUTIvAyuYRFyYbs3c/PEuIvK6e3gTz+E0FRCT08/Ep/We4Gzld7BqFi7
	EDCSRbIMO53KpjGE+nDgvpnYvyGmLLPvPEOpForskc/wLhYHp4YRAMaorepjXQTOWnhPE2YS0Q8OY
	MajKupFKt7cjn6iFgMPDVzTo6FYOp8k3sL9KasJmVF/iiUfk3l82h83pnObikxTzQAy3leqHqC5o1
	ScKGW0nYuCq5Ledr4D4xm4C5DJmYuuHrHA8MkUjGtRUSLzT2zTOi+G3D+vHgQAxbvpTeVHAAtyIWU
	c5ktAA2dem/zQ3+QoSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbvTC-000000094o2-37ph;
	Mon, 19 Feb 2024 04:41:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbvT8-000000094my-3tyz
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 04:41:32 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so14725861fa.2
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 20:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708317682; x=1708922482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=970f2/ePHEzTAJOzsFgotpGi303T4B4dyp5tQNQW5ic=;
        b=GzSB3A/NategCQ0Wmu1z065QJcHZ4uFxBGwDlKbC9uT7abQoG3u+GEjH3jYL7Pnq1G
         lAJ23x8bN6Z+qxbYl+9jbAzO9uu2KYg9Up5HXq0S4ubf3FG37WbXNZTECo379fd5fYmE
         3y6uJ82zZtfcR1zGDKTvp0XlVv86f/HEJdE5ty42WAMWPFDVsHxadLNXrU3TNVrPNZxq
         Df0OvF9j42bQQj6rcMUGnhQPg63MXQ96x28PRxUej/1RU81bSySwDbYTae89w6/gCr0F
         GTzq9pXw+zTQI/W0MGF+2vzYr8CN5wSrB9lAcLZjKivqalyQrufR/uL8yf31MYq6w02T
         fMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708317682; x=1708922482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=970f2/ePHEzTAJOzsFgotpGi303T4B4dyp5tQNQW5ic=;
        b=kKafrNTIEmtriLOaxmVmON2HYwvvxM0glF7sx0ngJ3S0d/MUDgwNM8vi916WHhQpu2
         VgY9Wek+BK/8WJJ82Mqt86iwDjNOiK1emutTOygs9dyuw6UoqASPzClgleh7wjwPQtFN
         c5JEWPuHMq6XhdBsi94Bl7lsYBTU0KLEcb4JbMO9wvGTkXdJu7QZxSzvKA+GzF6AKLmV
         u8hGpRFYoeLj2w1v1eRVtC4NXHqmCMHD5QflM6DgNxZX9RhnwYW7C4yVh8X9DVG4Qy87
         0MYjUmwCQHOvZjPqt+xeS1iM7nfgMbkWZXzvN4RVv9KK2M43bWFWSYSiQQNFYa9DWnMz
         5udw==
X-Forwarded-Encrypted: i=1; AJvYcCXkpjD0H95z/PzOXD++UDdShpjRPA7ruu3zWcdCy/Malrk+jiI8o2opBVYjTLTiWLJRklgbPjqiQxvq4Wfs0NN8fAatkbBoEAD1EO9IUqgF
X-Gm-Message-State: AOJu0YzPKnmoBmPaD6VjHh+XZfAXzvexaPmcllpjuIdccnlaism24qkF
	jtivBw0Wqwc2FXKzfmDaESir6GVsDPBmQIxT0onnFpLI90/2TY0iTHe5Z8ZK+qtfSyM3idIn+Yd
	DfL62HpYw4WHZsR/HdamHh/0sktjYm5XXz2UZFw==
X-Google-Smtp-Source: AGHT+IHwZTbHuAg+JP9/Rm67wr4lAFmZwAADwZGC3to+Jiv/TLN1rLbaG+V+unxjUP+XSKzsjocLxuGb6f+9UVQ0Xxk=
X-Received: by 2002:a2e:3801:0:b0:2d2:2b77:43a8 with SMTP id
 f1-20020a2e3801000000b002d22b7743a8mr4474665lja.14.1708317682305; Sun, 18 Feb
 2024 20:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-21-apatel@ventanamicro.com> <87bk8gcgjz.ffs@tglx>
In-Reply-To: <87bk8gcgjz.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 19 Feb 2024 10:11:10 +0530
Message-ID: <CAK9=C2XUre1A0+x7VjE2DvfTb5YxXgT7EHd-wKQQwJUhOOQNdw@mail.gmail.com>
Subject: Re: [PATCH v12 20/25] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_204131_002391_2EDB27C3 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMTo0NOKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI3IDIwMjQgYXQgMjE6NDcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JTVNJQ19QQ0kKPiA+ICsK
PiA+ICtzdGF0aWMgdm9pZCBpbXNpY19wY2lfbWFza19pcnEoc3RydWN0IGlycV9kYXRhICpkKQo+
ID4gK3sKPiA+ICsgICAgIHBjaV9tc2lfbWFza19pcnEoZCk7Cj4gPiArICAgICBpcnFfY2hpcF9t
YXNrX3BhcmVudChkKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgaW1zaWNfcGNpX3Vu
bWFza19pcnEoc3RydWN0IGlycV9kYXRhICpkKQo+ID4gK3sKPiA+ICsgICAgIHBjaV9tc2lfdW5t
YXNrX2lycShkKTsKPiA+ICsgICAgIGlycV9jaGlwX3VubWFza19wYXJlbnQoZCk7Cj4KPiBUaGF0
J3MgYXN5bW1ldHJpYyB2cy4gbWFzaygpLgoKWWVzLCB0aGlzIG5lZWRzIHRvIGJlIHN5bW1ldHJp
YyB2cyBtYXNrKCkuIEkgd2lsbCB1cGRhdGUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
