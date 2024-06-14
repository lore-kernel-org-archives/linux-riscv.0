Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A38CC27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKGOlE7Tf2rV28sSc9+RAOg6Hj/FysLQzSFA5qCf/DQ=; b=Z7r2uqFDDPWTrv
	gwOV8Is4vC3Q+03RR0RaHYHThvG2hOxrCQrHI5fOowEUHt/skXGlr7cnnAXYHmQliPXM+mHqujB7c
	XqKLbcmGro1Qc6AKc8JdSpTxhypM0hXLRZDV1nWKuNiKhd81+YHVZnl0jPwuSnb3OadqYlM5daMUI
	qioRPfU+559nODv65gKIlA//YezJ92EnfCIPdTMGDYLigY1BdBPjNoWok5jJFEXZ5TzmAfyWUFciJ
	WMMp1dANWWbC6gmyH/E/jdv1t72nN8OmpJrm3WQ1bFvgc5z872LItg/jlVEqjON0ys/BCywoULGsE
	/6/hsnh7rPcMEw7wo60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9rU-00000003RIJ-39JA;
	Fri, 14 Jun 2024 16:33:12 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9rR-00000003RGZ-0fcP
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 16:33:10 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso1987882a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1718382786; x=1718987586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmANL2aAdKz6zDNX67dUWd/cwt7M50wQJ2zAXtthGTw=;
        b=PnqYUU3oqKonknQGfddlnpHED2jTY6bM0Ypc0jyHCWd2TrQQAE1CpTN5OQTbVg324K
         N8NbRp43YzNsndcqp6dQGJsWmLxfFqWdSOdtt7f9smOdN8hJpqOiFTTPU0TscZ89q2UO
         mePDOcwJ5RqRFIOfiq8e6z87B/UX4zLnF9Raxs3dYw8V/UslYx8yfuOb/hjVuByw7lZl
         EwQ9DUd0I6fUeY+oA0RPgcfHzcXj/W8XdNDuiPmUiWEtgzhqiPVQX7GS5ZS92lvBE2m0
         qaaoEPW+f+38bRPloyKES8/Eh22ieoZEiBrrxhcSykdGgqnK1dNa2weC0P0Ry1waPZfE
         Y9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382786; x=1718987586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmANL2aAdKz6zDNX67dUWd/cwt7M50wQJ2zAXtthGTw=;
        b=ljW8qjPV/2JtWX0tYCZ4G0cSFtf+1ujEjqsw0C+b4JfFmREbxDHzJueSAPbpMwcrCt
         OM1P8grR9hzf8MfeNf2uoNRIZnMXSXnvxYpneyVl47vLLfVXQpi1cD3m6l3H0bGggn0I
         ozW7IXr8E2RSLspITtcF4N/YOpltRKk8X5VQ8GVugitfy8uu2lpIc0qYI3KoTtxItvj7
         fcavuTemYyXSxLb9fZSZvw5x86eUJ1CVzhBBwffkh6/M0BNYIAEP+lf8la0K7dBYUMLe
         KAzXmKYMyJHE0KgIRuUrlZov64mBJkSoieg3D3hUaVHNhHYgCT4lQISspZ2DlHYLoHo7
         Ig9A==
X-Forwarded-Encrypted: i=1; AJvYcCU92IgXIaEmWbadu2jPABUAuKsgffa7kASTBKWbH2mKfDAGLt4ujq2pMG8S8VPyuwgWerFsfpAYl7myOHGWtrFtGnqnJ3KSBZa8aTPnrSlk
X-Gm-Message-State: AOJu0Yw8tqpAmfmC29RBX94RQAUlpapuC+qBaoBSAuuQs9ON0FJ7tnEo
	kas8SZQDVe4rbENxDlyPlqtg1vSvx+5k/ptpSK+/Hj9zLPkePxufli1q9dzONFXwdxILBLx+U/Y
	czlLPRO/hPLRuwn9F0jrWaIZuhDxIKEC30Fb/Qw==
X-Google-Smtp-Source: AGHT+IEsB3qM/Oj0kPu1JXFIcCWyvaMDZToK1L7g/QZz8kOHLrMykq6jJMeOHC666aJoGrouLk9SPQrV4Ei7lkVn1oc=
X-Received: by 2002:a17:90a:af90:b0:2c3:195b:dc36 with SMTP id
 98e67ed59e1d1-2c4db12bb3fmr3373710a91.10.1718382786244; Fri, 14 Jun 2024
 09:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240614151955.1949-1-jszhang@kernel.org>
In-Reply-To: <20240614151955.1949-1-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jun 2024 22:02:54 +0530
Message-ID: <CAAhSdy0b16f8JAZ3r=drSuRA+hmWfGgAcX_scnH+=OOaaUh+dw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Remove asmlinkage
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_093309_500146_E369DF88 
X-CRM114-Status: GOOD (  19.13  )
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgOTowM+KAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgdHdvIGZ1bmN0aW9ucyByaXNjdl9pbnRjX2FpYV9p
cnEoKSBhbmQgcmlzY3ZfaW50Y19pcnEoKQo+IGFyZSBvbmx5IGNhbGxlZCBieSBDIGZ1bmN0aW9u
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
PiAtLS0KPgo+IEhpIHJpc2N2IG1haW50YWluZXJzIGFuZCBhbGwsCj4KPiBSZWxhdGVkIHF1ZXN0
aW9uOgo+Cj4gSSBiZWxpZXZlIHRoZSBhc21saW5rYWdlIGluIHJpc2N2IGlzIGEgbm9wLCBpcyBp
dCBPSyB0bwo+IHJlbW92ZSBhc21saW5rYWdlIGZyb20gYWxsIHJpc2N2IGNvZGU/Cj4KPiBBbnl3
YXksIG5vIG1hdHRlciB3aGF0IHdpbGwgYmUgdGhlIGRlY2lzaW9uLCBpdCdzIGNvcnJlY3QgdG8K
PiByZW1vdmUgYXNtbGlua2FnZSBpbiByaXNjdiBpbnRjIGRyaXZlciBhcyB0aGlzIHBhdGNoIGRv
ZXMuCj4KPiB0aGFua3MKPgo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBpbmRleCA0ZjNhMTIzODNhMWUuLjQ3ZjMyMDA0
NzZkYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ICsr
KyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gQEAgLTI2LDcgKzI2LDcgQEAg
c3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX25yX2lycXMgX19yb19hZnRlcl9pbml0ID0g
QklUU19QRVJfTE9ORzsKPiAgc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX2N1c3RvbV9i
YXNlIF9fcm9fYWZ0ZXJfaW5pdCA9IEJJVFNfUEVSX0xPTkc7Cj4gIHN0YXRpYyB1bnNpZ25lZCBp
bnQgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcyBfX3JvX2FmdGVyX2luaXQ7Cj4KPiAtc3RhdGlj
IGFzbWxpbmthZ2Ugdm9pZCByaXNjdl9pbnRjX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAr
c3RhdGljIHZvaWQgcmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxB
RzsKPgo+IEBAIC0zNCw3ICszNCw3IEBAIHN0YXRpYyBhc21saW5rYWdlIHZvaWQgcmlzY3ZfaW50
Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgICAgICAgIHByX3dhcm5fcmF0
ZWxpbWl0ZWQoIkZhaWxlZCB0byBoYW5kbGUgaW50ZXJydXB0IChjYXVzZTogJWxkKVxuIiwgY2F1
c2UpOwo+ICB9Cj4KPiAtc3RhdGljIGFzbWxpbmthZ2Ugdm9pZCByaXNjdl9pbnRjX2FpYV9pcnEo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gK3N0YXRpYyB2b2lkIHJpc2N2X2ludGNfYWlhX2lycShz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0b3BpOwo+
Cj4gLS0KPiAyLjQzLjAKPgoKWWVzLCB0aGVzZSBhc21saW5rYWdlIGNhbiBiZSByZW1vdmVkLgoK
UHJldmlvdXNseSwgd2UgdXNlZCB0byBjYWxsIHRoZXNlIGhhbmRsZXJzIGZyb20gbG93LWxldmVs
IHRyYXAgaGFuZGxlcnMKd2hpY2ggaXMgbm90IHRydWUgYW55bW9yZS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
