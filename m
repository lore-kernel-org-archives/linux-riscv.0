Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E90D3C923
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJttP7/vB3HvLSJSWlLhLHGFFl5YsJQ1AghFVJ6jZ30=; b=DY7SKD1Kqp/48V
	1g7j43k8aRj0GvjBjiMoiidjeSAdENFCEMxDmTGkgb/L/9lFTSMWCJ9lgiFBefmK7TvkzI2E+SVAe
	6+DqUoKL8bY+7RbGv2HLoGVkMNibjrs0q0UhU38MhTGbS352Vmj+ry8ApuG7nFeUf60eclGW9WSIn
	/QGhUWPQmN/88cT2lZ3lgJZFj7dF1lDjbXTC37HLzr3XJNQe++Si57zsm1dkUAwrQYHIvAruivT7z
	rTPWmdSVSL5r1wWKujBPieraQa9SffZ9xxYOEzzyU0qvbFlCtO+S+7OjS7Nu8CsuRz2Ol60qgN2ZU
	lHa6OgAaT7zb6cmxqcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2E0X-00000003lKt-0oOg;
	Sat, 19 Oct 2024 18:16:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2E0G-00000003lIA-3uZ9
	for linux-riscv@lists.infradead.org;
	Sat, 19 Oct 2024 18:16:42 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso33345221fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 19 Oct 2024 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729361799; x=1729966599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm4/TW/XP6VyjNkR7aVNVPKpRM/+37sn/T2jS9WV0ik=;
        b=WxdOtCgRi30ByZASvE0ueirgM0fFH1iOKc4WgvZ/PIgqxhykW5HxpGsvmBzxsyKfPJ
         VtyK5t/wGzn+rVWeyX4a7Z+wUsZlj0A4/eJlbS3v84XtKv7XRpQOMeijAscs6ul1TQWn
         36/dDOI6hcE/UkOpAO7XpFuEew1oyur/48nu9hre3M3p+DKL9iGrn63MmWocutPYXP4z
         uodGA4G00qQw7js9uSthJ/fE5XsO/LScZQCbkRc+SJf8U/T4/tAzk6bkk+S+casLYaD1
         CLJ6YedFlg3pffrTNZUzVUCWnfpNRAB/Wl9dP3nzjXI3HeA3Q14gnmS0xVQM7UbyGtor
         cOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729361799; x=1729966599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm4/TW/XP6VyjNkR7aVNVPKpRM/+37sn/T2jS9WV0ik=;
        b=J78H737yRIHzvEwdtJXC1hbwuBg84CBjPycr9RUESeGUYjOAR+8YTZXLK/89StrHKj
         83i2vXsyBno1QUexoMyCShF0/Q3B/CMeCaU2GHaFsxKSTVhlztfM5RRL+9/sfaCCQSYp
         aLS4U8vGB9kcId5KlaWB9p3fSctWxkqEhn6GR5Uz6+jdmrcSwJ1n+X1LCttFcpujOGnl
         LIfNNEKMQ8MljxKSRi+TDMiW6DmOS0EZko2+8h8Ru6+c1gRaHJhV3Wb5MIcWrSwCLRlC
         /SyWD89wUmWGsVwoGqiwxTcJ95rRaDYhFiY4kMChAZlN7jENB0oYkqwsJOp7Z/jz7FZ1
         AjlA==
X-Forwarded-Encrypted: i=1; AJvYcCVBy258X8Yr5NUFxGcT3POlZpSgR4kKiTOndl8s2h7cdGR/zPheK9tPlXT0p5zO3DBgyimI2HjeiCzVBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvQIxOeOndl3C+s22tEoqu0FFf6lQ48cpGi6aVzQdKpp7Dwprz
	JjmKU5sfUMJl7rNjLSguA+tFs/ZbYOwsDCXxYbndbU3XfbupC8541sNNreKFXfeuTQ/iixXwLfo
	UnPd9rkWeipKowDsOwx/8DxRPN23nJfUc0sjWHA==
X-Google-Smtp-Source: AGHT+IGUIof/qmUxPJlydOgfWxZ3IUmvMmAPDvHqH5LTK6/M1DHw70PzZPpjH+qyF5nhY1Ls17fpniLDuexAWk7NRWk=
X-Received: by 2002:a05:6512:1582:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-53a15441e9bmr3361553e87.7.1729361798914; Sat, 19 Oct 2024
 11:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Oct 2024 20:16:28 +0200
Message-ID: <CACRpkdYnaJsKKfcdhHeMGTTp86M+wNODzZx2e=OYbxQ4Jc4Rjw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] riscv: spacemit: add pinctrl support to K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_111640_995657_2388411C 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMzowMOKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gVGhpcyBzZXJpZXMgYWRkcyBwaW5jdHJsIHN1cHBvcnQgdG8gU3BhY2Vt
aVQncyBLMSBTb0MsIHRoZSBjb250cm9sbGVyCj4gdXNlcyBhIHNpbmdsZSByZWdpc3RlciB0byBk
ZXNjcmliZSBhbGwgcGluIGZ1bmN0aW9ucywgaW5jbHVkaW5nCj4gYmlhcyBwdWxsIHVwL2Rvd24s
IGRyaXZlIHN0cmVuZ3RoLCBzY2htaXR0ZXIgdHJpZ2dlciwgc2xldyByYXRlLAo+IHN0cm9uZyBw
dWxsLXVwLCBtdXggbW9kZS4gSW4gcGF0Y2ggIzMsIHdlIGFkZCB0aGUgcGluY3RybCBwcm9wZXJ0
eSBvZgo+IHVhcnQgZGV2aWNlIGZvciB0aGUgQmFuYW5hcGktRjMgYm9hcmQuCj4KPiBZb3UgY2Fu
IGZpbmQgdGhlIHBpbmN0cmwgZG9jcyBvZiBLMSBoZXJlWzFdLCBhbmQgdGhlIG9yaWdpbmFsIHZl
bmRvcidzCj4gcGluY3RybCBkdHMgZGF0YSBoZXJlWzJdLgo+Cj4gTm90ZSwgd2UgcmV3cml0ZSB0
aGlzIHNlcmllcyBhcyBhbiBpbmRlcGVuZGVudCBwaW5jdHJsIGRyaXZlciBmb3IgSzEgU29DLAo+
IHdoaWNoIG1lYW5zIGl0IGRvZXMgbm90IHVzZSBwaW5jdHJsLXNpbmdsZSBkcml2ZXIgYXMgdGhl
IG1vZGVsIGFueW1vcmUsCj4gc2VlIHRoZSBzdWdnZXN0aW9uIGZyb20gS3J6eXN6dG9mIGF0IFsz
XS4KPgo+IExpbms6IGh0dHBzOi8vZGV2ZWxvcGVyLnNwYWNlbWl0LmNvbS9kb2N1bWVudGF0aW9u
P3Rva2VuPUFuMXZ3VHdLYWlnYVhSa1lmd21jem5UWG5lZCBbMV0KPiBMaW5rOiBodHRwczovL2dp
dGVlLmNvbS9iaWFuYnUtbGludXgvbGludXgtNi4xL2Jsb2IvYmwtdjEuMC55L2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEteF9waW5jdHJsLmR0c2kgWzJdCj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL2I3YTAxY2JhLTlmNjgtNGE2Zi05Nzk1LWI5MTAzZWU4MWQ4YkBr
ZXJuZWwub3JnLyBbM10KPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9y
Zz4KClBhdGNoZXMgMSAmIDIgYXBwbGllZCB0byB0aGUgcGluIGNvbnRyb2wgdHJlZSBmb3IgdjYu
MTMhCgpQbGVhc2UgdGFrZSBwYXRjaCAzIHRocm91Z2ggdGhlIFNvQyB0cmVlLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
