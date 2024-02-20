Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110E9C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/feoxh3VUpsKVZH8jDnh11faReX/5Xl5GaZZWYjdc8=; b=L5K3cNUiOQ+21Z
	EubHrbNOhe9WGfIkaUVlwmKC8ZDDA9qVLFR550o7ep6mQpp+qQpcY93sq1M5P0pP0v6tLeCCU/Y0h
	1X2+E294MwIZnRIhqwgqu0Jv2Vj8txFxJH0mWD7DcN6j9nKXVCbT4VHjC+/vDGvDoi6Msp5205N+c
	eXeTqHX87Snp9VLnrHvZ04sNsmDo0jUcgCxhT7IJRS1wDPeXuFLnS8Exnt92nRloRLg0dvFx2Qjit
	8I/iWUs+Zfz5UU48MVVz8P31Wu65AJDD2DVn0YdSDnN1GZ2yBGWz5t+RkX4AiM7QtJC/m3ZAoRMW0
	qFidk78pn5CQiCBAs6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcToN-0000000FckM-28jI;
	Tue, 20 Feb 2024 17:21:43 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcToK-0000000FciO-1O9n
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 17:21:41 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d1080cba75so54752591fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708449698; x=1709054498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rihM8gZY5Rpoa6nRB67kPe66RFi61qM4N0eC2eheyvM=;
        b=BYBhyfHgZDDYVOhqKgXufrw2Vhyvn7HiGQxvPMHLH3+J59jCiz+agrSIYCHqxkOtHv
         atiyFSA+WXb7oL+6dhdhe916SZnhiHTBkxrLHGCsMzVnIUkc5r3W2esCTdLH8sBeBdCY
         RKZWRMmVyiKUjyujKAoNjH7eq9QXa93uav+e9K3UThYIaGUBiyGSpl9cSla7lkECSIQk
         ccExHHvbrGhwth91FcDOzwFCzaV/JdxmU/kw/eEjq+5ac26EWlFaxr3OkkZhAQ06q6BA
         zwdLYm/ZbmubKL5RBZ6AfHL6Jcej75RbKbMjEfm9hAue3SSnkjpehP0kDuorEcRs9TdN
         sgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708449698; x=1709054498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rihM8gZY5Rpoa6nRB67kPe66RFi61qM4N0eC2eheyvM=;
        b=AwwfF2PyPn6Bbkf1e4XUvpVHFWQlmzNA62KZ4GMXf+X1rEOW4KoliCDlu5jU9fRKoZ
         uzBYlqiM0FTg3Pwt8PRDw5NO0vByrBrjCjg51yMbqKvQiZxxQrmrgXYzC5Rwz7HphSMC
         gEnD2bNGS0Kxav4XTlaCU6UJPwSt5aax24DQ/0W0LzAs+KeesXu1pQ2cQzc54PPl/ZIZ
         SnUgW1kzyMQ466ZirG0SGE8sHP6EiZ8Og0T/h6NLbFCqtA/n5JgKXO1pP7kFa1uhuzM6
         AgTtZPsy+UX3xO0+hgpVDzpHoZ3iXFV+Euvq68gpOZ6lrXKOSZkYnrTuSyO3hZVqWhJw
         lvnA==
X-Forwarded-Encrypted: i=1; AJvYcCUzgjZyzgrjAU2RrrGcbXfJGSXTsh4WOD9qyGup1yxcT6ABe7YunUmqQ+zhwJPzET+sR1jpgMfYJn6vpRF3YTJGwPmuqU/Q0mqn0aOIu3P0
X-Gm-Message-State: AOJu0Yxu5TTTX38pwaZ7YE0NR83Bn181aN1DO1zTf9BQyRa3LyGHFKaq
	+yF5aLCmBvUGWxlMCqFXcnCXuuiVmE/z1OjO9rtDoWNfPfBEiyZ/DEpzrYb84zjnH1MHjYosDao
	47j3d6gAq8sjwUleZrWHl3vGFvYwz7xc4Fu+C9g==
X-Google-Smtp-Source: AGHT+IEkrb47fFTpwdC/omRvJj22/7b8TTe73nmNk7AtrgajHxsJNK/IAgqz0F7H8+syKUfz++fFCnpUoSe/FJZH4UU=
X-Received: by 2002:a2e:95c5:0:b0:2d2:33cc:7483 with SMTP id
 y5-20020a2e95c5000000b002d233cc7483mr2732678ljh.4.1708449698204; Tue, 20 Feb
 2024 09:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-9-apatel@ventanamicro.com> <8734tni7h3.ffs@tglx>
In-Reply-To: <8734tni7h3.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 22:51:26 +0530
Message-ID: <CAK9=C2UgYpVtjFZ4NLzOCP6f3LQ=Fx7kPMywwQyFiNMcKmPyLw@mail.gmail.com>
Subject: Re: [PATCH v13 08/13] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_092140_397466_69550CD8 
X-CRM114-Status: GOOD (  10.48  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNzowNeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiAgc3RhdGljIGJvb2wgaW1zaWNfaW5pdF9kZXZfbXNpX2luZm8o
c3RydWN0IGRldmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKnJlYWxfcGFyZW50LAo+ID4gQEAgLTIxOCw2ICsy
NDEsNyBAQCBzdGF0aWMgYm9vbCBpbXNpY19pbml0X2Rldl9tc2lfaW5mbyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPgo+ID4gICAgICAgLyogTVNJIHBhcmVudCBkb21haW4gc3BlY2lmaWMgc2V0dGlu
Z3MgKi8KPiA+ICAgICAgIHN3aXRjaCAocmVhbF9wYXJlbnQtPmJ1c190b2tlbikgewo+ID4gKyAg
ICAgY2FzZSBET01BSU5fQlVTX1BDSV9NU0k6Cj4KPiAgICAgICAgIGNhc2UgRE9NQUlOX0JVU19Q
Q0lfREVWSUNFX01TSVg6Cj4KPiA/CgpBY3R1YWxseSwgdGhlIERPTUFJTl9CVVNfUENJX01TSSBp
cyBub3QgbmVlZGVkIGJlY2F1c2UKdGhlIHJlYWwgcGFyZW50IGRvbWFpbiBpcyBhbHdheXMgdGhl
IElNU0lDIGJhc2UgaXJxX2RvbWFpbgpzbyBET01BSU5fQlVTX05FWFVTIGlzIHN1ZmZpY2llbnQu
CgpCZXR0ZXIgdG8ganVzdCBkcm9wIERPTUFJTl9CVVNfUENJX01TSSBmcm9tIHRoaXMgc3dpdGNo
IGNhc2UgPwoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
