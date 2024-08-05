Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70822C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=745pqFk/RNWco8ETDwN4v4RVWWGrDhORbY1OAc9WMoQ=; b=d0957ig6hTDaoJ
	csJmOH13u9D9CPmlAIcJen2OS1mbsKjEHI6CHfm6apn7jxs15xmgM26OBjmNeJNYum6cNAzuEMXZX
	/oEDVh0YQdeeDF4AO3+Hk+pjzyLJvxMTlUiAqrrML6YgSuoetZG+siq5HVf+6EJfaYuzhDl0XN0mJ
	Ko5rEbmUsjWvd2ZhG0faXCMFsHYP7vqZPrVSj3wM8LhJPfF/lO24WvKMY4wT2sG0C2p+LqcDIzkMe
	YqKq1ORh3cIvjtcisXFDmGR304HbPDbUEVnZaDVn/ieySzF4dmRX+YCwVRKnEeUOUvvtch245KPRA
	S4NNQFY4kQkppcK4I79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasoU-0000000F4hx-3Xn6;
	Mon, 05 Aug 2024 08:11:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasoN-0000000F4ge-0Ax1
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 08:11:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52efa9500e0so11911700e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845481; x=1723450281; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGaVx+qMhZ0b7otpK3O02Kw7IL7OQu7ghb0iUPKBQPk=;
        b=kJcZH/P3OZdgzKoB/23hoYg6q1JSvdigKW8JYBc/jLzLf42x8xZ+uVT7//UvEsE9Fj
         1IAAtPJbtqG+IwSrhYN0KNQaxfBcVPz074i3LtQHga3TWAmXOLqiMgVzU+VO5VLJHLDX
         W2hOHbr2FM0USdbHHpEUt/H9bua7GjjLQ1jn2Kj60a0BmEeLzg3PXHp+c5fqTc4di/M+
         4OUg4QW0MCZc1rMsM5aozgEOHvLZpkJ/HGRwqPkN/dSdjuHesaJfTv1cqdu//cug6VSP
         9cI1CVXyoxqfaOdNfO1si6Q6EPWPIL839yRwjNUCjz+mlXdLRtvNZPewu2n/It6Gqabp
         D16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845481; x=1723450281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGaVx+qMhZ0b7otpK3O02Kw7IL7OQu7ghb0iUPKBQPk=;
        b=f5zn7OSFmXVFzf4yZg7P3JLIJJgqYAbGXAYyBKq69yH6uRbMVazT3Zz6bM/qjRVsOu
         65V6Ge++F2FJGq+rZDQQmZdPqBgIzajLpOpc0m5xZT+G+eKgJGGkJdwCpJsgI5ZNro2J
         GmVGERdndjGtm4GfQ0c7uWwQm/x+68okvT8Ig1Dec65/fpCBhY5Thcr3ezzhL4Duirfx
         xYRKn7MxO8e7S4v8YTrY9HQuC1ZLSvG2ugEg/dXObNGpDcJ+s7N6SD11/R0Iuo73lrQF
         yiIxozQW6QW9zwmrxWJxRqzXnTg5GE5rvVhpp8Pd0poyqPMoMPE3zPUpVGSmm90JGieM
         dwlw==
X-Forwarded-Encrypted: i=1; AJvYcCUrPTgkUfDlBH5GgyHi3QjYM2R9PkWTe86Bu3GWDEMY/XUT1rmAAz4vI2j8i820sNYQlYFoj8uPZ/wNnhazjvQdZ49clQJvBsrImZxFVOIY
X-Gm-Message-State: AOJu0Yz90biynsxewVcSF2MP9KXK17fOtSAhLJKhklNDE9FqtE2UGxsD
	Hf1WDSCmydpF/gikrIUlp5cahUR8lzUQr4pSNj+j5JUkZHsqAIQ0DWp+3xHdyznFghRh+0gOSr7
	/RLz0mbfthg4eaM0XKw9UugBaai1wXctm0EM1Bg==
X-Google-Smtp-Source: AGHT+IEexVYi+TyR4tI+GJL56PCbzdQ1IM0K1XkXHiZ4BaBgjJiBD9SkZedwISuAdeYS+5aa+vlh1tFok3PdTds2jiQ=
X-Received: by 2002:a05:6512:32c5:b0:52e:95dd:a8ed with SMTP id
 2adb3069b0e04-530bb385320mr8050795e87.35.1722845480886; Mon, 05 Aug 2024
 01:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-handoff-race-33160609553f@wendy>
In-Reply-To: <20240723-handoff-race-33160609553f@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:11:09 +0200
Message-ID: <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>
Subject: Re: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, conor@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_011123_114344_DFC9D394 
X-CRM114-Status: GOOD (  10.89  )
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

SGkgQ29ub3IsCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBUdWUsIEp1bCAyMywgMjAyNCBh
dCAxOjI44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6Cgo+IFNpbmNlIHRoZSBpbnRlcnJ1cHQgbXV4IGlzIGdvaW5nIHRvIHByb3ZpZGUgdXMgYSAx
OjEgbWFwcGluZyBmb3IKPiBpbnRlcnJ1cHRzLCBhbmQgaXQgaXMgbm8gbG9uZ2VyIGNvcnJlY3Qg
dG8gaGl0IGFsbCBvZiB0aGUgc2V0IGJpdHMgaW4KPiB0aGUgaW50ZXJydXB0IGhhbmRsZXIsIHN0
b3JlIHRoZSBHUElPIHRoYXQgIm93bnMiIGFuIGludGVycnVwdCBpbiBpdHMKPiBkYXRhIHBvaW50
ZXIsIHNvIHRoYXQgd2UgY2FuIGRldGVybWluZSB3aGljaCBiaXQgdG8gY2xlYXIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKSSBk
b24ndCBxdWl0ZSBnZXQgdGhpcywgdGhlIGlycWNoaXAgb2YgdGhlIEdQSU8gaXMgY2xlYXJseSBo
YXJkLWNvZGVkCmhpZXJhcmNoaWNhbCwgdGhlbiB3aHkgZG9uJ3QgeW91OgoKc2VsZWN0IElSUV9E
T01BSU5fSElFUkFSQ0hZCgpBbmQgdXNlIGUuZy4gZ2lycS0+Y2hpbGRfdG9fcGFyZW50X2h3aXJx
KCkgdG8gaGFuZGxlIHRoZQpoaWVyYXJjaHk/CgpTZWUgZHJpdmVycy9ncGlvL2dwaW8taXhwNHh4
LmMgZm9yIGEgc2ltcGxlIGV4YW1wbGUgb2YgYSBoaWVyYXJjaGljYWwKR1BJTyBpbnRlcnJ1cHQg
Y29udHJvbGxlci4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
