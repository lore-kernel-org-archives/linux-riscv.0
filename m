Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA0CD5822
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 10:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KiQsQS+sr9YGiujlQvP2fbARY9XBjKNYWPpgiCmm5I=; b=CY5p6nsT4Rs/sX
	MPZFkFyyEJqVGia0hL3Swx2rSAiuEDq1gIsFgAq6Q1Bgx7ZgcohQ9CKTxIT8+Z38HXg/lr7Iji7uI
	jyrI45CDPZ6JBVMi04wLhAxzzcF4EvHfLcGV5jyP9THQFCcOiRmsojphIDWPe6sK7+25CyobTLJnw
	ZT7+HIy/Tq1XEsSJLylre/0KyUWooWEpG3eiaqSilQKJqjnmomScWwVfFPzhjYJ04nW2ey8H3BgjR
	553rjK8g18A4KXJTVZ7AR173rjhmnGLHNwV6ZqbAoy8eGPri84Nk8SD+n25pUl4OVyNKpKhWenwgM
	KfaN4aMb4dGYALYcFAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQbz-0000000EgXZ-3c7r;
	Wed, 07 Jan 2026 10:17:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQbx-0000000EgX0-2IKD
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 10:17:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1034916f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767781071; x=1768385871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCMvG6iuxDZ81zsXC7C9GnF47nzqraBg/3bYlAL4t8E=;
        b=cJwQobm7qHLs3ZZtqp/LFeok3uG7TZmuoqB8GEtbUiguUaFX1KdOhKztcQNgVhZNaB
         60/l8HjvW8XWAM/6/Tv+iLN87NU/iNeZoJsYChQwY13Ld2FweVA9Fhsd5uiYPj6GmcaV
         EizfmLUbscajbpZjPKMEnhSWW3hlkpI/cGU5iUxds9r+vYL2G0oypdIQTJ/11TsnBDsq
         YzUa6gmxN98a+U5Yrh+imU3+FCva1cVBwIRAVximEwwCvvonBfJynBd4MUYcNCFVXR4p
         Rj38mOJiG2foWl7JQDfRMKisbCRy49S9ua7EyvZoRpDz3h52tT/dp5avixRvkGKUT4mH
         h5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781071; x=1768385871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCMvG6iuxDZ81zsXC7C9GnF47nzqraBg/3bYlAL4t8E=;
        b=HoQDxhBazTY1xKMFbKBMvBG5xmfzr7PISUGoEzuHkvBQ+XsH26J/WQQxhocAUwFD4q
         NhDlv/z1CB5vAi7cP/HrSAuuSnmKMHXcRNhF7lUAcnVn3StFEGbNsJJEx11/zP9vgQws
         w0oerGmYrYW13rDj2MMBA2/thaweXgc2AEzE1NGSt4AKcuw6PDS40ePt2pqs/rJF9iB2
         3VMnnpibtKE46l03NqY5TvGzcjZydgeuZcMlaby9CZ33zw+ExofXYwUYqFhAcMAZQ+y4
         BYo0bFGubfQY9gywh/a3AUxdYR3w6fLH4mLsn/t2jxEIpbffyZS8tzHAJslcpninZprP
         gQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXkZlsSpGfduEOp95tBTmYE+fMmhvASDdkKiElRiZYRydqCKXbvf83ItkS8i4mCR/gcI3orJCAeFnT/wg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yycv+m9ERtUL1VEipf4Oj8BPcUa9ZPD6rmrBe6PYRkDAx0AIJAW
	Ud97UzRm+Y1tXuzMDSErv5aaa1zofqMmroqmFIvxXJ49ud7G5oiWq1UiX7julAySsEEWsWIsGlB
	YGK+FYjBsFHUALOQUk+80zymZgsp1vC7vD18SQZo=
X-Gm-Gg: AY/fxX48KnXyPmW0quoqLn3xkMW/VCHwM8beSrWfnLKl4S6qFAl1gKN/LFj93PcVbQ2
	MZDl6jcfmCbPPNZSxhFGaz1p+zcGELr1BzPRTAf95v/FjmGWckTzhF8574sGIprwtaWrYxa+czV
	IbzhxzMLWWN/aab5RKonI9vwn64Qx7TWL9KDcHCnPi8XprzfZFVYXF04HAVEaF7SOpT30e47esP
	f7k4gSMqdYMW7IJKMjISyWBDoqsIxrcwxXlw710LKFI+dQIg9CF49TONQxAgsnhCxf+QYqlqMvg
	Yubp86hk04pcT7kyilX+e3+1kOQViiaslzpKl/PS1XCy3ljcxEQeDrqaDdGTAQaHQTiZ
X-Google-Smtp-Source: AGHT+IG4yiqNY3j/c1o4cPI3yoDt2b8Su6tTmfqpaMAj23CwdtGJYPv5zqlb5KN1i3QUtPovBUPxYNL3qThp37faruo=
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id
 ffacd0b85a97d-432c362811cmr1899709f8f.8.1767781070728; Wed, 07 Jan 2026
 02:17:50 -0800 (PST)
MIME-Version: 1.0
References: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
In-Reply-To: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 7 Jan 2026 10:17:24 +0000
X-Gm-Features: AQt7F2oRzXoo1lvR9gZ0e5H9kwZwfeoCpSlgBeiC7opN6cHuXLQiuxIcWTPQ17Y
Message-ID: <CA+V-a8ufdEmF=Md7Ktb9L2XS7X5x=nSeAHnFZyvHPZ6sFOwRww@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent
 to top node
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_021753_636114_5E489D4C 
X-CRM114-Status: GOOD (  15.83  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA1OjE14oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cj4KPiBNb3ZlIHRoZSAiaW50ZXJydXB0LXBhcmVu
dCA9IDwmcGxpYz4iIHByb3BlcnR5IGZyb20gdGhlIHNvYyBub2RlIHRvIHRoZQo+IHRvcCBub2Rl
LCBmb3IgY29uc2lzdGVuY3kgd2l0aAo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
N2cwNDN1LmR0c2kuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IC0tLQo+IFRvIGJlIHF1ZXVlZCBpbiByZW5lc2FzLWRldmVs
IGZvciB2Ni4yMC4KPgo+IHYyOgo+ICAgLSBEcm9wIFJGQywgYXMgY29tbWl0IDFiMWYwNGQ4Mjcx
ZTdiYTcgKCJvZi9pcnE6IElnbm9yZSBpbnRlcnJ1cHQKPiAgICAgcGFyZW50IGZvciBub2RlcyB3
aXRob3V0IGludGVycnVwdHMiKSBpcyB1cHN0cmVhbSBhcyBvZiB2Ni4xOS1yYzEuCj4gLS0tCj4g
IGFyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kgfCAzICsrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KUmV2aWV3ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KVGVzdGVkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
cmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiBpbmRleCBhOGJjYjI2ZjQyNzAwNjQ0Li41NzFkZTNj
YWZhODIxNGU0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
N2cwNDNmLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQz
Zi5kdHNpCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2luY2x1ZGUgPGFybTY0L3JlbmVzYXMvcjlh
MDdnMDQzLmR0c2k+Cj4KPiAgLyB7Cj4gKyAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGlj
PjsKPiArCj4gICAgICAgICBjcHVzIHsKPiAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+IEBAIC01Miw3ICs1
NCw2IEBAICZwaW5jdHJsIHsKPgo+ICAmc29jIHsKPiAgICAgICAgIGRtYS1ub25jb2hlcmVudDsK
PiAtICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+Cj4gICAgICAgICBpcnFjOiBp
bnRlcnJ1cHQtY29udHJvbGxlckAxMTBhMDAwMCB7Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAicmVuZXNhcyxyOWEwN2cwNDNmLWlycWMiOwo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
