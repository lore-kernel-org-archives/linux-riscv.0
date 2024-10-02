Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AF5CF31B9
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIz/97io3jAuvRkA8hDpTEKZH1aWtMi3DlOq6+JkljI=; b=p0dT7hZ+7Si4pr
	O7x9D+XyuohM4gznXHzr5LiyJcfjrmSUakHyAhvlEp4o+U9SPsRBFWScfV2sLfzZDlmF+w2RLQKjg
	ZN1XQmyB0OItYu8kNUgy7jwMpYNoVra38u2OYB4fl46xs+vjaRIaffW/4R9k7UGpf9Z5uSMF1f6bz
	haO7DFJ5FYKB9Omma4NqjV80s1zH1936V3eaChjxiqwNRvqvBjMy7sLwEu599fB40X94OZCgRrXKo
	68409gi+A0dQGa2xCCMLgqHXEEG4WdKbff05Uh+FeLo0lhLS0bY/pb4ricF9IFdICSPZ/DnF4SprV
	+53S759sQCodnkZdOO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6FP-00000007Qy5-3O9K;
	Wed, 02 Oct 2024 20:46:59 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6FM-00000007QxE-2QXg
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 20:46:58 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2faccada15bso2542201fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727902014; x=1728506814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5jMYwKmB8W72lN6W7VZKsy2T+c6dYOH/2CyYO3mAiU=;
        b=CunXuL2A/aixQ6x2tILiFy9JsWX891FJbK7jLYxNH7BzcRgBFrPDvjV56TLCvoZ9Ve
         BhP0exU5S60QOVOa8NInVMvpkbXUUbJ45I1tx+bXOEis3HYhShhEFBt53p1h15q/9DsI
         gLrGvaqOEvv3zuvuqDcxFPAtO8ilGluDvQoTpW8Icd34nSxkfCxI6tyAIe7m+QQi+GxG
         HdpHyl0/ZD8sIFhgoFXvPwUefgBYhkBM/LbdiF3Vbw/D1DXGhPGsJIiF/1lSdnOUJiSD
         8kXpWoEkxesAKFaH48jeTF49R2g7Vz0hK2iEOm3NkNvmCv5U3Y8Rsqn2PKfs5lSTYv7y
         BRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727902014; x=1728506814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5jMYwKmB8W72lN6W7VZKsy2T+c6dYOH/2CyYO3mAiU=;
        b=eIREFND9qBxoegoGg4TbJEL7A+VASGPi7wiRY5cptiNSPfQ5vvHV+FGY3FI8LdAZvJ
         8Fo27EfZ62ESSzKUrTFZc9zh8sNnVp2Yhc8OFRm36f0IHR8Iv2daPYHJj6luEtVJSJGH
         kWtV75ZQ4fCz35WVzfLa4MvY5g6gCZ4Ki0hgiK3dotavwsrSl/+xek0C2HTxiqQId97X
         aSJHFFXsvRrZaIyieOwz676a8yvgDMVh1M7tb4MkKblKUfTpyu77lLjA6nclt/lvqTpt
         v2qywpAL/vCKv5WYa/VaMOvLD2MrSS8m9Ye6c+JhcwNwCh0OI2C6U4BLflctQ1LzZfXp
         xT1g==
X-Forwarded-Encrypted: i=1; AJvYcCXIn25xhvU8q0FcNPItgOk7zqcQZ1gj6csUqM/xnDc5fWLW6koHfKW3B8UDMJaJQH+9s0S31RieF+MwZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqIXKWp7F7rFaeZ8vrrkVJ6F26i0HWEv0qfzJjD+le5z4E2e00
	sksTyHbFkF4UDzoV8hhqNKMrWTwBnYUA8YJBJdxoPH0s3T6SCk0M+cwSTw3JhFPvtWTqeNao/Qn
	OcEmR+SZHKz0x5DH6fkRBZHA0iqEQsve74O0vZQ==
X-Google-Smtp-Source: AGHT+IGaqhCOQr1G9HU8iZ6II2tGNhnTjzBxP/KS5MJN/yVHuuSAlXhMx8i3hI3s+b5zUczFp8Dm6bqf+ETUQcD6z7U=
X-Received: by 2002:a05:651c:210e:b0:2fa:d386:c8a4 with SMTP id
 38308e7fff4ca-2fae103c83emr28985081fa.12.1727902013866; Wed, 02 Oct 2024
 13:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com> <Zv2SUVv2PUYqwOzh@x1>
In-Reply-To: <Zv2SUVv2PUYqwOzh@x1>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 22:46:41 +0200
Message-ID: <CACRpkdZRg+k=N42EA3+3c4Er=DHf2Q1aVzzCM0OQuEx7xWMAvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_134656_667179_53C1FF8C 
X-CRM114-Status: GOOD (  14.08  )
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

T24gV2VkLCBPY3QgMiwgMjAyNCBhdCA4OjM14oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0
ZW5zdG9ycmVudC5jb20+IHdyb3RlOgoKPiA+IFRoZW4gSSBtZXJnZWQgdGhhdCBpbnRvIG15ICJk
ZXZlbCIgYnJhbmNoIGZvciB2Ni4xMy4KPgo+IFRoYW5rcyBmb3IgdGFraW5nIHRoaXMuIFdpbGwg
dGhhdCBhbHNvIGVuZCB1cCBpbiBsaW51eC1uZXh0IGV2ZW50dWFsbHk/CgpZZXMgbmV4dCAtbmV4
dC4KCj4gSSdtIHdvcmtpbmcgb24gYSBUSDE1MjAgRXRoZXJuZXQgZHJpdmVyIHdoaWNoIGRlcGVu
ZHMgb24gdGhlIHBpbmN0cmwKPiBkcml2ZXIuIEFuZHJldyBMdW5uIHJlcGxpZWQgdG8gbWUgdGhh
dCBhbGwgdGhlIGRlcGVuZGVuY2llcyBuZWVkIHRvIGJlCj4gaW4gbGludXgtbmV4dCBbMV0uCgpX
ZWxsIGNvbXBpbGUtdGltZSBkZXBlbmRlbmNpZXMgZm9yIHN1cmUsIHJ1bi10aW1lIGRlcGVuZGVu
Y2llcwp3ZSBhcmUgdXN1YWxseSBhIGJpdCBsYXggd2l0aCBhcyBsb25nIGFzIHdlIGtub3cgdGhl
eSB3aWxsCmdldCB0aGVyZSBldmVudHVhbGx5LgoKPiA+IEkgdGhpbmsgSSdsbCBtYWtlIGEgc3Rh
YiBhdCB1c2luZyBndWFyZGVkIG11dGV4ZXMgZXRjIGFuZCBzZWUgd2hhdAo+ID4geW91IHRoaW5r
IGFib3V0IGl0IQo+Cj4gRG8geW91IG1lYW4gdXNpbmcgc2NvcGVkX2d1YXJkKCkgZm9yIHRocC0+
bXV0ZXggaW4KPiB0aDE1MjBfcGluY3RybF9kdF9ub2RlX3RvX21hcCgpPwoKRm9yIGFsbCBtdXRl
eCBhbmQgc3BpbmxvY2tzIGluIHRoZSBkcml2ZXIuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
