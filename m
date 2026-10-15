Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F11CC6B39
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDTa3Ns7h7kS1CZGK2NuGSA1RchDhwoEN+dGVMHIWhs=; b=r20tREIW+/jzWz
	4iWHN0OU/m4WWQYznhNNn6ELBaQCZGkgC0Gt7ezeCOiAkj2S70aIIix+7ByUFbmQ9c1Xm2MrZDoh2
	C+7FZ5zNrVspxUuNWOkDYuwTWTZtdIXvmreolMPGNLqt0cBPXZXSa92oVLoacVI/2zG09gz9oqw8R
	tv1U2RVLyZ0menFGRBfdsS/PpGDjstT+PdTBvBYtqwwbrrdGYb7unaHwb634MbWWUrZyKOnoH8KhC
	CJXTqvlCgXYwaXhgQkjXBDOb1nIc270sz/jDr1dYCutPYOnOLWIzn2QAtizUHcfw5Lt30yw2N0z84
	PUfTrqLKatbn4Y9a1auA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOvG-00000000wJw-0J3M;
	Thu, 15 Oct 2026 17:07:18 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOvD-00000000wJ8-1I9m
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 17:07:16 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6767d92cde6so5737046d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 10:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084034; cv=none;
        d=google.com; s=arc-20260327;
        b=rVipXpy6s6FPH9Ny1NPPR6HrgWcpei1RvTb/FY7F3iJvai4A91yYiVgKyIF76t/1X7
         /pAdYSMMS0blqDeVI/cfX9Dyi8E32z4irKoOQJ+uKfnWL4UiFfpHRTeTxxDwAglvAbi6
         184yxEIXYHWndbM1OdR+YxHqxITh5+To+3hYiSemlk0a3Wqd4WlYmZ/DwySNb0Qrk2j/
         gv+F7sdrIg9U6AN+qieL6Vi7EQSRcWc7djfSsd4gn22q1PifA02m4DI5KU//CG50W/QW
         QBuLx7o24IXdi1P5tfWYqxSX+yjNMwVeP39w0zy7VPw+r5Bcvjpvx/IJljfKgEQpkrQq
         2/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        fh=yA4qPa+J8JuE7AdHrujMhx+3QuOMXO1LZbeRMPBXzrI=;
        b=K9Za0UjYjjE0sceeJVEmx+hc0utUclOBfJX3jRC2zKqClv8kMY7eYVz2T6bGMfIVUP
         Nx+2cYoaQPw2ZNWnD0JV6o8nT17IbQ+K31X/ZjHwuG9rKEdbf2XF5VejnrbuzNUYKcTk
         iXimwqDQTgxm4mB/xGmzrCcfPhUVc+x1rIKbzbHyMKC6vyHGHqUokRkhKFpJip9sr/Wv
         S1FCuO1p10Rl/D7NH8otGTldM7L73h0kh8n1etQZUSS7Mknxhg46ILXulq1vpSSt0iPK
         8yG3p+CLwu9wvRNdiuazrJnjD1TURru4NF2OJpt1zYg7DY0ezSsccc4DzO4LGepmOtHa
         9UVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084034; x=1792688834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=jZvYewx2jkq6q38vgyqSRsmpIv8XOjDQ2CIgv++Nk9yzjSriT5F8UkdYtV/4mP7FUY
         tB98xhtZPT/p32F4q53r1SA4aPCvYv01PZ6UqgasRcZ8ZJEUP50NiK9Aaybz/jxkeVJD
         PhJFeN0q0aMNL6FHgKK+UtUOocUkKPltnQY87cHnpY/n52bQMVgIPa57KWj3BQBaHB0d
         k5dgmUQzClHbYrfqXJbr0ymDUrvPOB64U7dG0I1Q6Wuu9hqvgGmaE/FNKfqLEfqtUCOo
         vdAUQ8QlwoMD4EyVCUOW5zoLyJ+l7mxGZbX6mJDtd3UbDoqcfzwpNnvgMJvtYEi3AJTC
         P7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084034; x=1792688834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=ClLlwOGxDLcgNVOuMF6Q9c0yU7e1CXjwOg6FSHZ59yotlgCEhAOZfof9/wofPm5jph
         GmaNzFgTB/B6ZwhRx8tXI7jaVCO7DZjNmBjtxDBzJ5V29vThaa2k1TYvWr6oyaeNtaSq
         JlABrmnqgUMFNmszXF0Zyw529vNe5sywKl86jv+WM6ppSjLV+lIMNU1LaXbAOdEZ3qpS
         flKG2JDcy1OJHvBkSSs1CzlsFudBXxG2xRrzY4C4V4laPlahpozh44hi20yrzCCC3qvi
         TmwYrBtV+DfAkamAq5ByEOosPYUbdu2E8MeD8ra/uaASRJ6twX4KUn7Xu9R0CDy4VYFH
         YkJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7PvVQprDTOqNb2wgGJgRSZmxTcbDDxLfqw1mIsFb/anPvxvpp7wsqnQFhm08O4qOD89GTiq7+J/fXzw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwpVjlDtF7O+IpKEK0C/Bbw0UTj73mecvMPHBW7oyjwxsZ+izy
	aEWqO7mfhu/8TRKEEI7LuXB2SeUNNavoAp3p9PybvkfNZgn9c3w4bP9TX/jaHCvrJMkXUWF0Iwb
	e4WA1VJWROgC0x7GRbdV0AVOw5SsXltb5WseY
X-Gm-Gg: AYBFou3vEbfbff2twa4JoYAaSiKOKSo01pYnnMwDvQRfiZDieny51oqmav41OSiA1wj
	97eaLnu7SqYmr/UxSiF2L9yaRpj4LCNc2sf+Ds67r/FE3ew+WndzaIVWhFWV7EbekOkR2ttgSDY
	PpiWj69x8ksNA4YH+k2sOLDuDLeL5JGlJArS1dTFfcgheC4WD8LtzXTaSQCLeZuN1G1QcEvv+hd
	2/XuoA2kLv+49G2M7XkV2Tz7rYvOASAehVX6HxAzKhzyj9bGgUrL4TO+J0y4mF9nDXMXbOxBCz2
	sI4fycQWNxawBCfIpSpxq/Xmu9ZuZcPRK1146WcdjPHJOD0JuTfEFb+3
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id
 956f58d0204a3-6798da62973mr1956198d50.98.1792084033716; Thu, 15 Oct 2026
 10:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org> <20261008-df80c21d73b287d09b6baa78@squawk>
 <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
In-Reply-To: <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:06:00 +0200
X-Gm-Features: AclHuK8t02_cYn6UunMFOXXUfkheTlCkH2rjdH9KDS5vlihve2Jh2xK0A1qMWCU
Message-ID: <CABdCQ=MQ5soNSRQ97aOytYCjtKpqZJ0frP3mqh+mL2Dsw+A7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_100715_379198_F1872C87 
X-CRM114-Status: GOOD (  19.03  )
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

T24gVGh1LCBPY3QgMDgsIDIwMjYgYXQgMDM6NDQ6MjlBTSArMDAwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEFkZCBpbml0aWFsIHBvd2VyIGRvbWFpbiBkcml2ZXIgc3VwcG9ydCBmb3IgU3BhY2VtaVQg
SzEvSzMgU29DLCBUaGUgUG93ZXIKPiBEb21haW4gQ29udHJvbGxlciBpcyBTb0MgaW50ZXJuYWwg
bW9kdWxlIHdoaWNoIGlzIHBhcnQgb2YgQVBNVSAoQWR2YW5jZWQKPiBQb3dlciBNYW5hZ2VtZW50
IFVuaXQpLCBpdCBpcyByZXNwb25zaWJsZSBmb3IgbWFuYWdpbmcgcG93ZXIgYWNyb3NzIG11bHRp
Cj4gcG93ZXIgZG9tYWlucywgd2hpY2ggaW5jbHVkZXMgcG93ZXIgb24vb2ZmLCBpc29sYXRpb24s
IHBvd2VyLW9uIHNlcXVlbmNlLgoKVGVzdGVkIG9uIGFuIE9yYW5nZVBpIFJWMiBhcyBwYXJ0IG9m
IGJhc2ljIGVuYWJsZW1lbnQgZm9yIHRoZSBQb3dlclZSCkdQVS4gQW4gUkZDIHNlcmllcyBmb3Ig
YmFzaWMgR1BVIHN1cHBvcnQgd2lsbCBidWlsZCBvbiB0aGlzLgoKVGVzdGVkLWJ5OiBJa2VyIFBl
ZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBJa2VyIFBlZHJvc2Eg
PGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+CgpFbCBqdWUsIDggb2N0IDIwMjYgYSBsYXMgMTI6MzEs
IEljZW5vd3kgWmhlbmcgKDx1d3VAaWNlbm93eS5tZT4pIGVzY3JpYmnDszoKPgo+IOWcqCAyMDI2
LTEwLTA45Zub55qEIDA4OjI3ICswMTAw77yMQ29ub3IgRG9vbGV55YaZ6YGT77yaCj4gPiBPbiBU
aHUsIE9jdCAwOCwgMjAyNiBhdCAwMzo0NDoyOUFNICswMDAwLCBZaXh1biBMYW4gd3JvdGU6Cj4g
PiA+IEFkZCBpbml0aWFsIHBvd2VyIGRvbWFpbiBkcml2ZXIgc3VwcG9ydCBmb3IgU3BhY2VtaVQg
SzEvSzMgU29DLCBUaGUKPiA+ID4gUG93ZXIKPiA+ID4gRG9tYWluIENvbnRyb2xsZXIgaXMgU29D
IGludGVybmFsIG1vZHVsZSB3aGljaCBpcyBwYXJ0IG9mIEFQTVUKPiA+ID4gKEFkdmFuY2VkCj4g
PiA+IFBvd2VyIE1hbmFnZW1lbnQgVW5pdCksIGl0IGlzIHJlc3BvbnNpYmxlIGZvciBtYW5hZ2lu
ZyBwb3dlciBhY3Jvc3MKPiA+ID4gbXVsdGkKPiA+ID4gcG93ZXIgZG9tYWlucywgd2hpY2ggaW5j
bHVkZXMgcG93ZXIgb24vb2ZmLCBpc29sYXRpb24sIHBvd2VyLW9uCj4gPiA+IHNlcXVlbmNlLgo+
ID4KPiA+IFlvdSBzaG91bGQgcHJvYiBtZW50aW9uIHRoYXQgdGhpcyBBUE1VIGlzIGFscmVhZHkg
ZG9jdW1lbnRlZAo+ID4gZWxzZXdoZXJlLgo+Cj4gTWF5YmUgaXQncyBhbHNvIG1lYW5pbmdmdWwg
dG8gbWVudGlvbiB0aGF0IEFQTVUgYWxyZWFkeSBoYXMgI3Bvd2VyLQo+IGRvbWFpbi1jZWxscyBw
cm9wZXJ0eSwgYmVjYXVzZSB0aGUgZmlyc3QgcmVhY3Rpb24gb2YgbWUgaXMgdG8gYWRkIHN1Y2gK
PiBhIHByb3BlcnR5IChhbmQgdGhlbiBmb3VuZCBpdCBhbHJlYWR5IHRoZXJlKS4KPgo+IFRoYW5r
cywKPiBJY2Vub3d5Cj4KPiA+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+ID4gcHctYm90OiBub3QtYXBwbGljYWJsZQo+ID4KPiA+IFRoYW5rcywK
PiA+IENvbm9yLgo+ID4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFu
QGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9z
cGFjZW1pdCxrMS1wb3dlci5oIHwgMTQgKysrKysrKysrKysrKysKPiA+ID4gIGluY2x1ZGUvZHQt
YmluZGluZ3MvcG93ZXIvc3BhY2VtaXQsazMtcG93ZXIuaCB8IDEyICsrKysrKysrKysrKwo+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3NwYWNlbWl0LGsxLXBvd2VyLmgKPiA+ID4g
Yi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3NwYWNlbWl0LGsxLXBvd2VyLmgKPiA+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40MWVmNTQwYjVjNDQK
PiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2Vy
L3NwYWNlbWl0LGsxLXBvd2VyLmgKPiA+ID4gQEAgLTAsMCArMSwxNCBAQAo+ID4gPiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+
ID4gPiArCj4gPiA+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19TUEFDRU1JVF9LMV9QT1dFUl9IXwo+
ID4gPiArI2RlZmluZSBfRFRfQklORElOR1NfU1BBQ0VNSVRfSzFfUE9XRVJfSF8KPiA+ID4gKwo+
ID4gPiArI2RlZmluZSBLMV9QTURPTUFJTl9WUFUgICAgICAgICAgICAwCj4gPiA+ICsjZGVmaW5l
IEsxX1BNRE9NQUlOX0dQVSAgICAgICAgICAgIDEKPiA+ID4gKyNkZWZpbmUgSzFfUE1ET01BSU5f
TENEICAgICAgICAgICAgMgo+ID4gPiArI2RlZmluZSBLMV9QTURPTUFJTl9JU1AgICAgICAgICAg
ICAzCj4gPiA+ICsjZGVmaW5lIEsxX1BNRE9NQUlOX0FVRElPICA0Cj4gPiA+ICsjZGVmaW5lIEsx
X1BNRE9NQUlOX0dOU1MgICA1Cj4gPiA+ICsjZGVmaW5lIEsxX1BNRE9NQUlOX0hETUkgICA2Cj4g
PiA+ICsKPiA+ID4gKyNlbmRpZgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5n
cy9wb3dlci9zcGFjZW1pdCxrMy1wb3dlci5oCj4gPiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9w
b3dlci9zcGFjZW1pdCxrMy1wb3dlci5oCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNTE5ZmJmOTQ2MzEyCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+
ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9zcGFjZW1pdCxrMy1wb3dlci5oCj4g
PiA+IEBAIC0wLDAgKzEsMTIgQEAKPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8KPiA+ID4gKwo+ID4gPiArI2lmbmRlZiBf
RFRfQklORElOR1NfU1BBQ0VNSVRfSzNfUE9XRVJfSF8KPiA+ID4gKyNkZWZpbmUgX0RUX0JJTkRJ
TkdTX1NQQUNFTUlUX0szX1BPV0VSX0hfCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgSzNfUE1ET01B
SU5fVlBVICAgICAgICAgICAgMAo+ID4gPiArI2RlZmluZSBLM19QTURPTUFJTl9HUFUgICAgICAg
ICAgICAxCj4gPiA+ICsjZGVmaW5lIEszX1BNRE9NQUlOX0FVRElPICAyCj4gPiA+ICsjZGVmaW5l
IEszX1BNRE9NQUlOX0xDRDAgICAzCj4gPiA+ICsjZGVmaW5lIEszX1BNRE9NQUlOX0xDRDEgICA0
Cj4gPiA+ICsKPiA+ID4gKyNlbmRpZgo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjU2LjAKPiA+ID4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
