Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE207C636D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWr6AlT3euKfqhrzv9Mt9z9Hl1LRgOfiWCbBn127hJw=; b=ZlKmTmEL5V4BKg
	xHrBe2mCvjMcAKN3RZzKw3oDaajNbHtjMG6bisE2LxyRvKA04/jn8EPygze53U740lFL/STM6YxAN
	l6cdFssjDbLukzt8f8A8Shc1O5XgjZjPtkd4upLPxVSNhhnwoKVtv+2QO8wBrFTq3mYHQkD7xdBEo
	3JCyKvQIhDoOLliIsRvYMpxngAmwUCEKenIVVzqg3mCPdAs8H7aR7h8KBXBkniMHZtg+hyTWhxrCw
	7CX3aUTDfl/de0y8y9urZoyyDGxosIoOaa+FGspOnhws1w6SX5HEXjP8gL6mb48KdY7XjY/acGoQb
	YJKR6FsJjFjbHNrthtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8ps-00AspC-PB; Wed, 01 Feb 2023 08:51:20 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8pq-00Asoa-4S
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:51:19 +0000
Received: by mail-yb1-xb35.google.com with SMTP id p141so21387350ybg.12
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txZhuec1HH+SYuw9JbSzTWTlNG2n2FoXKoziJzOf6vQ=;
        b=TSC3Y861U85BAuKRzI3tmVJZkUSpjwhr7uBnYo2TvAvS+Rxk/nPX6DNk0rSuRCaqbH
         6We/fKDlLRTW/whljhMYtaFGaVRCxrECfyY3yUB0u0f/3DOIpF2poWrvWP6KAwVbs2LE
         oBNbER2+Uh8QqKvClsh0GqU9HwdZ8fpJ3pOcpPQPFLjeKT6tvWcBmflpZRTEZ2lTPLdo
         w1/c8aa3gWiTbl53hfadVF6mAxTek/FPhO+1bqYBIudskDF6WuwuSoYwPUMZzzQ+yQvK
         fYwbWH+7Ft90RAXNW6htl82KlXnsC2ntJ2I+JywcexsK6IPYTikNU+WhyH0mTuPXw1kG
         wLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txZhuec1HH+SYuw9JbSzTWTlNG2n2FoXKoziJzOf6vQ=;
        b=FkwX5nJqSJV13YXQ+RQ6kBthJlnc22IAA2T5kMaND2YyIeybLCkSaGykrTn5GaIlcu
         dtRjoERmr/9OiJmm05To2EyTIZXfu8/0K1+l8/suJnM8tDF6rWj+bDkdm/+8BDURX/Ye
         0+7VYa8CrbnBAnJggnCjl88x+kFzrPxAr+P0hX4uHDIAVHTRIiep0uP4Y7kT6eEkXeDt
         eEFGb/qWzJ15cLhZsBtKRaBxGg3OSNKKcDJs8facJS9yDflpv8fJD0QYGOt1nGd8q8C4
         mydp/Njt1LFINLuz5t13g+wA7SQLpP35G90ZUGY+ZEtLr1pd9lqOPqX+nsvtw7v7Uah3
         qNFg==
X-Gm-Message-State: AO0yUKWy+zeO7ZDCPFVeb7Xo/Q5C4TkksRrE/2SVQr6goavbqzGn+BYu
	q1u6IO+FGpsgvkb8KSHW9rwAduXrzqoTUuJc3zzv6A==
X-Google-Smtp-Source: AK7set+JlVg4REwrJZb0uFecBoYysZ34/mKVLbov6Y696z9p/76cZFJo08rlmmieWHt1Zh1Zubg+QiYkOwcsD15sK9o=
X-Received: by 2002:a25:8001:0:b0:7f3:de9b:de11 with SMTP id
 m1-20020a258001000000b007f3de9bde11mr254782ybk.544.1675241476162; Wed, 01 Feb
 2023 00:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <CAMuHMdXiKAyUeZvmAsNfjJ7_x9bK1zO3iUPdcQ7-60tLQOx_cg@mail.gmail.com>
In-Reply-To: <CAMuHMdXiKAyUeZvmAsNfjJ7_x9bK1zO3iUPdcQ7-60tLQOx_cg@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 1 Feb 2023 16:51:01 +0800
Message-ID: <CAHh=Yk8cnd8Gre6yK1SNC_y=mgRNc++-dA+FdLZPfSV0OzPpFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_005118_260441_D798FC44 
X-CRM114-Status: GOOD (  22.01  )
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

SGkgR2VlcnQsCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiDmlrwgMjAyM+W5tDHmnIgzMOaXpSDpgLHkuIAg5LiL5Y2INTo1
M+Wvq+mBk++8mgo+Cj4gSGkgTnlsb24sCj4KPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAxMDoz
MiBBTSBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gVGhlIGBm
cmFjYCB2YXJpYWJsZSByZXByZXNlbnRzIHRoZSBwdWxzZSBpbmFjdGl2ZSB0aW1lLCBhbmQgdGhl
IHJlc3VsdCBvZgo+ID4gdGhpcyBhbGdvcml0aG0gaXMgdGhlIHB1bHNlIGFjdGl2ZSB0aW1lLiBU
aGVyZWZvcmUsIHdlIG11c3QgcmV2ZXJzZSB0aGUKPiA+IHJlc3VsdC4KPiA+Cj4gPiBUaGUgcmVm
ZXJlbmNlIGlzIFNpRml2ZSBGVTc0MC1DMDAwIE1hbnVhbFswXS4KPiA+Cj4gPiBbMF06IGh0dHBz
Oi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS8xYTgyZTYwMC0xZjkzLTRmNDEtYjJkOC04
NmVkOGIxNmFjYmFfZnU3NDAtYzAwMC1tYW51YWwtdjFwNi5wZGYKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCj4KPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gKysrIGIv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRpYyBp
bnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20sCj4gPiAgICAgICAgIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChudW0s
IHN0YXRlLT5wZXJpb2QpOwo+ID4gICAgICAgICAvKiBUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVy
YXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCj4gPiAgICAgICAgIGZyYWMgPSBtaW4oZnJhYywgKDFV
IDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSk7Cj4gPiArICAgICAgIGZyYWMgPSAoMVUgPDwg
UFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsKPgo+IFNob3VsZG4ndCB0aGUgaW52ZXJz
aW9uIGJlIGRvbmUgYmVmb3JlIHRoZSBoYXJkd2FyZSBsaW1pdGF0aW9uIGZpeHVwPwpJIHRoaW5r
IHlvdXIgaW5mZXJlbmNlIGlzIGNvcnJlY3QsIEkgd2lsbCB1c2UgaXQuCgp0aGFua3MgYSBsb3Qu
Cj4KPiA+Cj4gPiAgICAgICAgIG11dGV4X2xvY2soJmRkYXRhLT5sb2NrKTsKPiA+ICAgICAgICAg
aWYgKHN0YXRlLT5wZXJpb2QgIT0gZGRhdGEtPmFwcHJveF9wZXJpb2QpIHsKPgo+IEdye29ldGpl
LGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+IC0tCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
