Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F117C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 01:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mK2byzXQ+IE0KWNZxd6jxNVSGeKyTITm704HxIJUNUg=; b=05FmZIdZEbdWpL
	TlzU5ZmwAbNHAZTN+J3nj2zFM6vNBhLqE8QIGC3F4ChMcEXkT2rxXj+Z0cupVLKcwaI/XUSmDisV0
	w47lqClWmJ+kclcdDxmk8iOJ5j7+AGPir9bHLEniftx5GFhxKh6lXHCC84/iGEWZzlILJkqh/iSYz
	Mc2u7O1kpwx3pnGmI0FvLtFPrOqKwQPXks+HGlOiKZqH2t6a519S/ljC0uU1obM9FGZDxTTAhhbmJ
	y7Qc4IHtWgVTwMX+NeH8ykQdi4ryV30jXqs+sAP/sVCMluHsT0NVryrcbDLVHoLHY8qAwDfKa5w6B
	KxGA/raveZe3SCtsltuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqPwa-008yVC-BP; Fri, 26 Nov 2021 01:22:28 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqPwY-008yUa-7Q
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 01:22:27 +0000
Received: by mail-oi1-x22f.google.com with SMTP id t19so15854548oij.1
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 17:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuogPhCIrdMIXK39LxLYKagPj76CP90ZaXCX1cv9amU=;
 b=FCbPn/aC74Fpmi8E4UlFo6hYpkm0KZSY8RA3nZRidNzko8tPVxlq0siNDoY/PjhMWY
 +tkvfhiTnO4S2B2PJB3cCrCWXtw0AgsvU0NlHuqL1c479BLJenUG1Mw7qm4FgovQivdd
 m5g9y1DRmy2NTUSh+6K4eqeN6DmIbiWUiv4mEhhN88forW3vYvceEYmMVGhI+5coaEYn
 RS74wwVAgrj7OahokEpJ83YtktWLU2M56wbWZL8hf3zns4rPh9aSAe5XiEleZNDuhp2T
 Bl/lYudQsKMRXq5w8VdaZLSPhZroOqLXJoQUZnf2Ub5z9JBOPRcmv0lI2hGElRvKyR00
 f+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuogPhCIrdMIXK39LxLYKagPj76CP90ZaXCX1cv9amU=;
 b=7q372aLVUwoI3qkqWked0uFfIDrw6xCBvPns59BX9f52P1HecmMUEj/qRVCUOI19q2
 UD9V8lqdo5qXG1RibRS2tIFfFdE395G5PODRzNrmLTmjcP9yWx7+m1VEOMxK1aTsbTXv
 Q0LQtbvY4UKKowAoK5Bf2rEELW0ffLvgCr9k16lQsO81S8SHuWTklhE8jgzU9qmokZjX
 XDv3Q/jVBxz7Ghd5dCHWgFGfc3DUf7mc8yF/DN2BOzl7FNtsrKMZRf7UcGiAyIm1E3qT
 +UrZ0VHCKQ5Hxq8zdiWAi4gqU0Vh8esNG76NLCs4YGk+o3BN8GGnyhfEoq+arK1FK6if
 FP/w==
X-Gm-Message-State: AOAM532IfwTVONVQBoI+I4nXoQW22XN9SobpvIpYfz/5+ozfevzhk/7P
 2x6cPFuGuXbJM+FeDlBJX0kKdQavQAGSkgulS7zGMA==
X-Google-Smtp-Source: ABdhPJzXRZ+hFzrCAc/CnvRtQFmXfAkjddGUIIxuiIQENVtM9MrI/+32qI/f5gkye0w9e+g0pyXVu7oBcPzBMoQ/S/g=
X-Received: by 2002:aca:120f:: with SMTP id 15mr19675974ois.132.1637889744184; 
 Thu, 25 Nov 2021 17:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org>
In-Reply-To: <20211125152043.162655-1-geert@linux-m68k.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Nov 2021 02:22:12 +0100
Message-ID: <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Yash Shah <yash.shah@sifive.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_172226_294560_540908FD 
X-CRM114-Status: UNSURE (   7.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> To improve human readability and enable automatic validation, the tuples
> in "interrupts" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

(...)
> -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> +                     <17>, <18>, <19>, <20>, <21>, <22>;

Tuples? Hm they look single. Like singletons?

Anyway:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
