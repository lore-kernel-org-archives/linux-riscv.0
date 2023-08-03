Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7718FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 04:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3B9VIxtbOwIN6yLOvikL7gtHGoLprH2XOgdZ3PDwj0=; b=TlQQPVsIDRXwkc
	Bac5rc/t1esnu39PehhX/tq1mXoI0GmVlpWILVRep3DHzYh4jfOKN+nmTzC/l39lellXl0fMhDfik
	zvq6GolxtqBK3oniVM10TLK5YSiL8TotPPsq9blOmK6uXnmHcM9mImmVKWoUy0twDZRdXKpaxlD6/
	56FIag4lYibV5S7O6YrxUbVhlEgUysqFLh2Y8pSau6GSYdiB1akeUgf5GVKR1cCYbaJLx5HlkPc9s
	I2Q7aCspa9BYR0KE44nEf2ZJKWhRzLnljjj8gWW/sMIPAEhu1Q8Nj+cH85ze17wqUH0C3WR86nYCN
	Zn6pOkvl+ZU6Q0VjlLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQ3g-006dE4-2h;
	Thu, 03 Aug 2023 04:35:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQ3d-006dDG-1O
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 04:35:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977e0fbd742so64981566b.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 21:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691037324; x=1691642124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr6MNDVhgEvRAnXNj84to/nh4ypRKkg1CDzy7x9Q7fA=;
        b=0Pr70O6uN52tYzz4OSDLnSJn+VV5q/W+cvIMtDbYW04msr5UU+AE7vH8anl5DrdbEs
         TzfpDy36OKA2M0cC6KVoqgR2TVPem8wNvhsul9ubo4w9tj/wbYFvUdRox2gnwaxyzirB
         JDbLgfRV5+VrqXVIsHhaB4Xmzvu/xBi8/5qMbe/pVnQr6If7z251daGdQTFBTSo9Voqh
         IC/Yri0MqVAmfuImDCgULppJGyyairsk/V+JruinRpqBtXK862yuqbMEzFmoQzK6IWCp
         4nHDtQmSdqTFhOzf1xRYMK71rfJyb+ZX3p9Z6UEIE8YrCPcxTHjLFKR1QwbBxTwn3W37
         rmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691037324; x=1691642124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr6MNDVhgEvRAnXNj84to/nh4ypRKkg1CDzy7x9Q7fA=;
        b=OZErWhX8jm0USvbBfT9E0Viwtjt+4dYNNyBq48e/rk+CX+7h8JjzC5Id30B378TLsw
         SQ60ezNjn4pBwek+FeuQUAaaCn7zus78Yr1fmeuVtfP6a6UKYhqPLWKG7ioDKjA8H6S+
         YpgfvNlCVhm2dIlc3OKsBebcr3dVV07SnDwlybrFk69h+aMvI0OxRca3p4oN3LtYFLnn
         4JS8FevFhnZdXk1X36epbydI7esJ664RtaqPHF9hQp9gKDozVstMwVE6ok1uhQYuyiRG
         zeIXf0QXbBTVrN8o0tB0QfyLlf4tiRqjXItwNM5HRgAboGt9tcKzbg/NAOAtjkCpLX71
         qY3Q==
X-Gm-Message-State: ABy/qLbiRp87Uf2kSOFJgEdLVkgadHSxScanKUj5n1wBFCN1hYTf3mMb
	bnAAmUHObrzovNLoRj9kiQw+aL3bEfIcoENB7hUhdg==
X-Google-Smtp-Source: APBJJlGZT2a4IIAjkkcSEhL6E4SzgR5Ue5FpgKLD2cz/AP+7iHLTSUwKqbhsi7I/7DuDzkmAIzbrz6Xo1VXwTk9rk/o=
X-Received: by 2002:a17:906:3f5b:b0:99b:5abb:8caf with SMTP id
 f27-20020a1709063f5b00b0099b5abb8cafmr5849495ejj.44.1691037324159; Wed, 02
 Aug 2023 21:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-2-apatel@ventanamicro.com> <20230802-deviancy-vengeful-cbecf4350526@spud>
In-Reply-To: <20230802-deviancy-vengeful-cbecf4350526@spud>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 3 Aug 2023 10:05:12 +0530
Message-ID: <CAAhSdy1K-Bh80_h1b9OiSMEjZmw+ghL27EY-Dx_4-Jbq27sLow@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] RISC-V: Add riscv_get_intc_hartid() function
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_213529_689922_6206EE48 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAxMDo1MeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwMiwgMjAyMyBhdCAwODozMDowNFBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Cj4gPiArLyogRmluZCBoYXJ0IElEIG9mIHRoZSBJTlRD
IGZ3bm9kZS4gKi8KPiA+ICtpbnQgcmlzY3ZfZ2V0X2ludGNfaGFydGlkKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpCj4gPiArewo+ID4gKyAgICAgaW50
IHJjOwo+ID4gKyAgICAgdTY0IHRlbXA7Cj4gPiArCj4gPiArICAgICBpZiAoIWlzX29mX25vZGUo
bm9kZSkpIHsKPiA+ICsgICAgICAgICAgICAgcmMgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91NjRf
YXJyYXkobm9kZSwgImhhcnRpZCIsICZ0ZW1wLCAxKTsKPiA+ICsgICAgICAgICAgICAgaWYgKCFy
YykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAqaGFydGlkID0gdGVtcDsKPiA+ICsgICAgIH0g
ZWxzZQo+ID4gKyAgICAgICAgICAgICByYyA9IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQodG9fb2Zf
bm9kZShub2RlKSwgaGFydGlkKTsKPgo+IFRoaXMgYnJhbmNoIG5lZWRzIHRvIGJlIGVuY2xvc2Vk
IGluIGJyYWNlcyB0b28uCgpPa2F5LCBJIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHJldmlzaW9u
LgoKPgo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJjOwo+ID4gK30KPiA+ICsKPiA+ICBERUZJTkVf
UEVSX0NQVShzdHJ1Y3QgcmlzY3ZfY3B1aW5mbywgcmlzY3ZfY3B1aW5mbyk7Cj4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
