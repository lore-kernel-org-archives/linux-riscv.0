Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8077C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4Tht8++ebz8i4nrXmy9UG3PB5lKI4kEvMXlMSpYvJE=; b=iql/0YVw/+j0me
	5heokqNbLnFshvtOn0DPS11GuYBrJaP68ift7yiYLQNN/WK5zsShKA9Cv50pcOVcoE5gniqct0mAB
	lRT+hUYaOkv32AcCEQCBFKgnZk/J6mWlIAFxH9eDg4iE/ZLiL7cAZEKgTeDBhuROY1JV7sYnEbsHl
	GQgnVtvEzZizN9gBnnhg+4r7exFgvcXWLWtMiFbkEt+LCQAbWugfVBUp5912bYDHyHV/FGLocLQgx
	RoIG03BgGcgI7v8wmyxYFttUgTLFX7FVf2vWX5Jvaficuj0n8DHt5enrk/IGy3gy8O9iZRLuqwV0U
	8jSVrLU8VbL5sXQjKT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayud-00000002YWE-2Gzv;
	Fri, 16 Feb 2024 14:09:59 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayua-00000002YUJ-25XT
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:09:58 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-216f774c827so1075069fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092594; x=1708697394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NDNaKP8xamgaizNNdZPhlOVzBU3MaVOfz2oJHdMsAk=;
        b=JQ42fnl8lYF2et0y7oj0jbnprmHnF1CgwM1/VtcePhhtN+1SQg5IlN9RSlqI41RGnh
         uPy3LSzuXxe2yZm0fKVPCDO1aNZQ814q/1dx2v41aN+u916BBHtMQy/OsfY8SVU4+NZz
         5l99HIppI1HtUO7HtI3jKtz/gIgxOw40ZlR2HF9dnA2/CzJrX8Iy86HHTnzAE1ZwrtfO
         aSwTDuXDCaOJHOtggyShPi4bodYlpQymFPgzfs2tNPVZkPwGFVdxtKq5YDzUdAIYCyz4
         DRtKgQy2iC898ztmIw+dtPNKjjB2ni6hauVy0mUbJhaNhAI2q9YPUu9QCZ0W8Bsxuffo
         hCrw==
X-Forwarded-Encrypted: i=1; AJvYcCXFZEAzVMH/jfy1wI23vq8Mi+p+28Q5vTJY693DBx3syWOjZbPuslqdXZjucZC2G0mxdo2Ds1LyXYFuJHjOpHHqDs5HArlqfHF4JEF/7CVc
X-Gm-Message-State: AOJu0YwjTm+BxG58g/sdx71IYKCk0eJzE+UvX9es8flpvLTzVkXWDu78
	ve86W3/YDDgTGxOuJTqu4vjSIaWmK3iXhpDw0g+ju6KziFz4hvTT90mMuOYni44=
X-Google-Smtp-Source: AGHT+IH+aoofnKilphv+QVl+qIgzyWJvU1HScinfqLi2u3DGUUgQAQ3ZviMWdVm8l6AQ3X5qK+El0Q==
X-Received: by 2002:a05:6871:283:b0:219:bca1:280e with SMTP id i3-20020a056871028300b00219bca1280emr5532091oae.50.1708092593918;
        Fri, 16 Feb 2024 06:09:53 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id ny5-20020a056871750500b0021e598d1d44sm5753oac.10.2024.02.16.06.09.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:09:53 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59cb1e24e91so758620eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtDLbcBVkaIVv7Rtl7J7i1a7EZAwmNDE5tT4JO5OHAgaXoh7MiEujnDKTu/pWfwaATLU9Xo3TQH+jmNKpaoK+npwBTJ4mbE1SI/emm2ca1
X-Received: by 2002:a05:6358:5927:b0:17a:a774:93a3 with SMTP id
 g39-20020a056358592700b0017aa77493a3mr3591024rwf.15.1708092593037; Fri, 16
 Feb 2024 06:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:09:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCyax=mfuTAnvh6LOXJSSdiy8N-wH8f+zTb+y_Fnxe_A@mail.gmail.com>
Message-ID: <CAMuHMdXCyax=mfuTAnvh6LOXJSSdiy8N-wH8f+zTb+y_Fnxe_A@mail.gmail.com>
Subject: Re: [PATCH 09/17] clk: renesas: r9a07g044: Add initial support for
 power domains
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060956_556304_4D04F871 
X-CRM114-Status: GOOD (  14.67  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gSW5zdGFudGlhdGUgYWx3YXlzLW9u
IHBvd2VyIGRvbWFpbiBmb3IgUjlBMDdHMDQ0IFNvQy4gQXQgdGhlIG1vbWVudCwgYWxsCj4gdGhl
IElQcyBhcmUgcGFydCBvZiB0aGlzIGRvbWFpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KCkFzIG5vdCBhbGwgSVBz
IGFyZSBwYXJ0IG9mIHRoZSBhbHdheXMtb24gZG9tYWluLCBJJ2QgcmF0aGVyIGRlZmVyIHRoaXMK
dW50aWwgYWxsIGRvbWFpbnMgYXJlIGhhbmRsZWQgaW4gdGhlIGRyaXZlci4KCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
