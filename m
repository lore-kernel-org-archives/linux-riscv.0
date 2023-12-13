Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6635C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXi36JAJVTYTV4nUcfIhNRziRElXHhk7YddlrHW0FVc=; b=2H+O1+nFoWkxhh
	VzMDUYynPdwGUjaUCUOxHwkE6hhrrsxeZ+GTryGEGgRW/s3CLm1MZbEJVlyg2CaiG91odN9Q2SC4t
	0oygmE46T92skXkwxugoGS/gTPgsTuji+aEhs/TCglLKPpk+/TpdyhXsHiULhdgXix7cK6+ENJLpo
	S5m1meZqazTxlvcSmtR5OGJJdV1ffnJLQvPewRiS5Ez0ErIG37dyX7vV1HRyzlAmMO3evTS+4Jd65
	Dk4X2oqP7c0n+xCYJGJBQJvQyERsogwqz6DSZsuF5g2v1HVEANWaKM23HasQ/y0lzS29eEc9qHYco
	aDiA1wruNkn6+C/VVGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRTS-00FKsi-37;
	Wed, 13 Dec 2023 15:48:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRTO-00FKoI-2w
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:48:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28afca4b321so182375a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702482511; x=1703087311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJQOr6G595liPThx9YQFt7iREStykDelnicH4b+uNfM=;
        b=nddqvV9+/WD9WDmAcViFkJx/8wKIYyZ+p0ZVyxI3ndM05GqW1huxa5mMaC5BLikILy
         Kvx0jjmA/xNji3BoKUakOCMxTGjL7go95OPzHsvpsPyhV7hgeaqeTlWU4IYIZC43iz75
         UJgQeyeUFeAR6V2rwY2NDlmEheJgMuQqWRIKZjnGBqnmHErGMqRLaHz1GeqQTw+cde7f
         /4TO9EUi4CvDc0jng9kZvnh1QjWhutgbscxDmIPpWrtsIkSTPIZ3M5v8LyaOKwipWcI+
         j8B20ufqf7iqqo6McECImhk8InHDmN9hzgHqP++PicK+A0V09UtLg81BFREwquVaYd10
         yPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482511; x=1703087311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJQOr6G595liPThx9YQFt7iREStykDelnicH4b+uNfM=;
        b=cVwosQDonI8jPFQl4kCho2k+5TYMIHb8MjKaSC0NqN0iVsrVvT9sl2ZzI9y4rLRjCO
         arGAQEMi2LJ9sX1NBIb+3OPxmwjEAfjT9t3UOBURa0GzXDD01UkXkJkE6xI/dp47aouY
         GtmibX2bFFtGUcr7MrP1zhV8CV0eo+PGzGFVlhaRrBxwobSXddzVGIUi/Tc+X2VlrE90
         K2LBQXjBEO3acX+/35p0EX2Zhtr10/Xs73z/Lb4Jj97ZfTmpu4CbdcEKtb2pbV1Nugy8
         lZd25gJENgBoldeSULL3pW5NxbtfaqyYUonl91f7A7ER44FyO8+DrmGF+Ak/w2lOfcoI
         KoKA==
X-Gm-Message-State: AOJu0YyGKxt2DTD7FrT3YrkkFNXfjRG+T+SXlaNOzXp6kiM4HTCT7wC6
	MI5F5vnszwlf70oqm2rv3LrAGi8x5LpMaC4x+poR1g==
X-Google-Smtp-Source: AGHT+IGETEWIybG8Cj7o1mZXeX0Cpwd1y0htevZPrsabRyIPn8kV57YkKN614sbxd8+A0O5Bt1rDcCLjsD/w7J5obHk=
X-Received: by 2002:a17:90a:1049:b0:286:e125:1a3f with SMTP id
 y9-20020a17090a104900b00286e1251a3fmr3741967pjd.5.1702482511032; Wed, 13 Dec
 2023 07:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-4-peterlin@andestech.com> <CAK9=C2WC2i7XkjDgbjccVn03BYfnE_YS4YiA6ZWMj6GDyTjJKA@mail.gmail.com>
 <ZXnRcfuvQBo6UDCx@APC323>
In-Reply-To: <ZXnRcfuvQBo6UDCx@APC323>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 21:18:19 +0530
Message-ID: <CAAhSdy3t-zAyxikkSOsdLZvHC=uo1E2o35guYnZVuWHKUYH-Pg@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
To: Yu-Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_074834_952483_8CA6AE34 
X-CRM114-Status: GOOD (  29.23  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, Anup Patel <apatel@ventanamicro.com>, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgOToxNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAw
ODoxNToyOFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gV2VkLCBEZWMgMTMsIDIw
MjMgYXQgMTI6MzXigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPiA+IDxwZXRlcmxpbkBhbmRlc3Rl
Y2guY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBbmRlcyBoYXJ0
LWxldmVsIGludGVycnVwdCBjb250cm9sbGVyLiBUaGlzCj4gPiA+IGNvbnRyb2xsZXIgcHJvdmlk
ZXMgaW50ZXJydXB0IG1hc2svdW5tYXNrIGZ1bmN0aW9ucyB0byBhY2Nlc3MgdGhlCj4gPiA+IGN1
c3RvbSByZWdpc3RlciAoU0xJRSkgd2hlcmUgdGhlIG5vbi1zdGFuZGFyZCBTLW1vZGUgbG9jYWwg
aW50ZXJydXB0Cj4gPiA+IGVuYWJsZSBiaXRzIGFyZSBsb2NhdGVkLgo+ID4gPgo+ID4gPiBUbyBz
aGFyZSB0aGUgcmlzY3ZfaW50Y19kb21haW5fbWFwKCkgd2l0aCB0aGUgZ2VuZXJpYyBSSVNDLVYg
SU5UQyBhbmQKPiA+ID4gQUNQSSwgYWRkIGEgY2hpcCBwYXJhbWV0ZXIgdG8gcmlzY3ZfaW50Y19p
bml0X2NvbW1vbigpLCBzbyBpdCBjYW4gYmUKPiA+ID4gcGFzc2VkIHRvIHRoZSBpcnFfZG9tYWlu
X3NldF9pbmZvKCkgYXMgcHJpdmF0ZSBkYXRhLgo+ID4gPgo+ID4gPiBBbmRlcyBoYXJ0LWxldmVs
IGludGVycnVwdCBjb250cm9sbGVyIHJlcXVpcmVzIHRoZSAiYW5kZXN0ZWNoLGNwdS1pbnRjIgo+
ID4gPiBjb21wYXRpYmxlIHN0cmluZyB0byBiZSBwcmVzZW50IGluIGludGVycnVwdC1jb250cm9s
bGVyIG9mIGNwdSBub2RlLgo+ID4gPiBlLmcuLAo+ID4gPgo+ID4gPiAgIGNwdTA6IGNwdUAwIHsK
PiA+ID4gICAgICAgY29tcGF0aWJsZSA9ICJhbmRlc3RlY2gsYXg0NW1wIiwgInJpc2N2IjsKPiA+
ID4gICAgICAgLi4uCj4gPiA+ICAgICAgIGNwdTAtaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIg
ewo+ID4gPiAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwweDAxPjsKPiA+ID4gICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGNwdS1pbnRjIiwgInJpc2N2LGNwdS1pbnRjIjsK
PiA+ID4gICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4gPiAgICAgICB9Owo+ID4g
PiAgIH07Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IENoYXJsZXMgQ2ktSnl1biBX
dSA8ZG1pbnVzQGFuZGVzdGVjaC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBMZW8gWXUtQ2hpIExp
YW5nIDx5Y2xpYW5nQGFuZGVzdGVjaC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIHYxIC0+
IHYyOgo+ID4gPiAgIC0gTmV3IHBhdGNoCj4gPiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4gPiA+ICAg
LSBSZXR1cm4gLUVOWElPIGlmIG5vIHZhbGlkIGNvbXBhdGlibGUgSU5UQyBmb3VuZAo+ID4gPiAg
IC0gQWxsb3cgZmFsbGluZyBiYWNrIHRvIGdlbmVyaWMgUklTQy1WIElOVEMKPiA+ID4gQ2hhbmdl
cyB2MyAtPiB2NDogKFN1Z2dlc3RlZCBieSBUaG9tYXMgWzFdKQo+ID4gPiAgIC0gQWRkIGNvbW1l
bnQgdG8gYW5kZXMgaXJxIGNoaXAgZnVuY3Rpb24KPiA+ID4gICAtIFJlZmluZSBjb2RlIGZsb3cg
dG8gc2hhcmUgd2l0aCBnZW5lcmljIFJJU0MtViBJTlRDIGFuZCBBQ1BJCj4gPiA+ICAgLSBNb3Zl
IEFuZGVzIHNwZWNpZmljIGRlZmluaXRpb25zIHRvIGluY2x1ZGUvbGludXgvc29jL2FuZGVzL2ly
cS5oCj4gPiA+IENoYW5nZXMgdjQgLT4gdjU6IChTdWdnZXN0ZWQgYnkgVGhvbWFzKQo+ID4gPiAg
IC0gRml4IGNvbW1pdCBtZXNzYWdlCj4gPiA+ICAgLSBTdWJ0cmFjdCBBTkRFU19TTElfQ0FVU0Vf
QkFTRSBmcm9tIGQtPmh3aXJxIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUgb2YgbWFzawo+ID4gPiAg
IC0gRG8gbm90IHNldCBjaGlwX2RhdGEgdG8gdGhlIGNoaXAgaXRzZWxmIHdpdGggaXJxX2RvbWFp
bl9zZXRfaW5mbygpCj4gPiA+ICAgLSBGb2xsb3cgcmV2ZXJzZSBmaXIgdHJlZSBvcmRlciB2YXJp
YWJsZSBkZWNsYXJhdGlvbnMKPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMTAxOTEzNTcyMy4zNjU3MTU2LTEt
cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbS8KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4g
PiA+ICBpbmNsdWRlL2xpbnV4L3NvYy9hbmRlcy9pcnEuaCAgICB8IDE3ICsrKysrKysrKysKPiA+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3NvYy9hbmRlcy9pcnEuaAo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gPiBpbmRleCAyZmRkNDBmMmE3OTEu
LjBiNmJmM2ZiMWRiYSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbnRjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiA+
ID4gQEAgLTE3LDYgKzE3LDcgQEAKPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+
ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+
ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NvYy9hbmRlcy9pcnEuaD4KPiA+ID4KPiA+ID4gIHN0YXRp
YyBzdHJ1Y3QgaXJxX2RvbWFpbiAqaW50Y19kb21haW47Cj4gPiA+Cj4gPiA+IEBAIC00Niw2ICs0
NywzMSBAQCBzdGF0aWMgdm9pZCByaXNjdl9pbnRjX2lycV91bm1hc2soc3RydWN0IGlycV9kYXRh
ICpkKQo+ID4gPiAgICAgICAgIGNzcl9zZXQoQ1NSX0lFLCBCSVQoZC0+aHdpcnEpKTsKPiA+ID4g
IH0KPiA+ID4KPiA+ID4gK3N0YXRpYyB2b2lkIGFuZGVzX2ludGNfaXJxX21hc2soc3RydWN0IGly
cV9kYXRhICpkKQo+ID4gPiArewo+ID4gPiArICAgICAgIC8qCj4gPiA+ICsgICAgICAgICogQW5k
ZXMgc3BlY2lmaWMgUy1tb2RlIGxvY2FsIGludGVycnVwdCBjYXVzZXMgKGh3aXJxKQo+ID4gPiAr
ICAgICAgICAqIGFyZSBkZWZpbmVkIGFzICgyNTYgKyBuKSBhbmQgY29udHJvbGxlZCBieSBuLXRo
IGJpdAo+ID4gPiArICAgICAgICAqIG9mIFNMSUUuCj4gPiA+ICsgICAgICAgICovCj4gPiA+ICsg
ICAgICAgdW5zaWduZWQgaW50IG1hc2sgPSBCSVQoZC0+aHdpcnEgLSBBTkRFU19TTElfQ0FVU0Vf
QkFTRSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoZC0+aHdpcnEgPCBBTkRFU19TTElfQ0FV
U0VfQkFTRSkKPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl9jbGVhcihDU1JfSUUsIG1hc2spOwo+
ID4gPiArICAgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl9jbGVhcihBTkRFU19D
U1JfU0xJRSwgbWFzayk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIGFuZGVz
X2ludGNfaXJxX3VubWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gPiA+ICt7Cj4gPiA+ICsgICAg
ICAgdW5zaWduZWQgaW50IG1hc2sgPSBCSVQoZC0+aHdpcnEgLSBBTkRFU19TTElfQ0FVU0VfQkFT
RSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoZC0+aHdpcnEgPCBBTkRFU19TTElfQ0FVU0Vf
QkFTRSkKPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX0lFLCBtYXNrKTsKPiA+ID4g
KyAgICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KEFOREVTX0NTUl9TTElF
LCBtYXNrKTsKPiA+Cj4gPiBDbGVhcmx5LCBBbmRlcyBkb2VzIG5vdCBoYXZlIGFueSBDU1IgZm9y
Ogo+ID4gWExFTiA8PSBsb2NhbCBpbnRlcnJ1cHQgPEFOREVTX1NMSV9DQVVTRV9CQVNFCj4gPiBh
bmQKPiA+IEFOREVTX1NMSV9DQVVTRV9CQVNFICsgWExFTiA8PSBsb2NhbCBpbnRlcnJ1cHQKPgo+
IEFoLCB3aGF0IGFtIEkgZG9pbmcgaGVyZS4KPiBzb3JyeSBmb3IgdGhhdCBzaWxseSBwYXRjaC4K
ClRoaXMgcGF0Y2ggaXMgb2theSBvbmx5IGlmIHdlIGNhbiBndWFyYW50ZWUgdGhhdApod2lycSBp
cyB3aXRoaW4gYWNjZXB0ZWQgcmFuZ2UuCgpGb3IgZXhhbXBsZSwgcmlzY3ZfaW50Y19kb21haW5f
YWxsb2MoKSBjYW4gZGVueQppbnZhbGlkIGxvY2FsIGludGVycnVwdHMuCgpSZWdhcmRzLApBbnVw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
