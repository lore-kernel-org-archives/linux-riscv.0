Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70959FC6160
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sINuwozu1H1xGD43xwzjarPmMJdnzm2NMMKtcDEXUuA=; b=N9Aqb9sktqx75t
	0e/H98jVhdceMaLuncGH7e7sz7lZDWZ3xsuJB/D70UhNDlvyRtmYWkaXuCpOQl0CYTcHjtPEDiHTM
	gInsT/2b8W1MnVa0EXEOmtDTO2ZHsh7nIH7y3/tW9ATwola2vvKuGLaZRVfaR5eCvgsBGbsxGxwkV
	rr6Epnp72OK2/wAPtgmX/euR0+gM+o8Ru50zM8XmaoTtyd7aSVcBSeV330M5I3aR802/Wxvbh35ve
	IjmZ64FwU33f/B0FCZxeI/fxH6CvoeM+sfSuuMt/jiFHIfgoXQQpG3lxaMIDqzoXHZEvfZcLgvstm
	4+nfrLepYNcpT6FFmhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2tV-00000009PiL-2tl3;
	Sat, 03 Jan 2026 14:46:19 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2tT-00000009Phd-06kr
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 14:46:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so118375321fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767451572; x=1768056372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rNP0amHfQZI+Bt5JBFPQlAXbRaSEgN4u2DbQlN2RHg=;
        b=eHASoHJgzyILoi/y112aIBLjOCUVmPgLUJw2BqFkcA5lIX3FvsgyJcDSaDbtyFgrnP
         iXXRwRQq9MrAAcXb1WKPFjYhNcAWcUC7hHTXYfk7v8asUCakbxCxtxEcb1xeVe+nRwuA
         G+K5KIoYruyXP5K7/z64VgsZTMDhRxVSK9Xnt+iLzRAqdmlDYQL1MuT5E2ynk0i72anu
         QSowZtp27FJM7LFayxPKWIMsFSGr16OzFkH84MWI6X5YNwoDAUHm4dLQQX+dVlqt7Lya
         pUnRUOZQ7nPVNkA6ANThHtZacBxOlQnqKEcxrv69hsF4sWgp7UXZ545gneJr/BOPwTV5
         zTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767451572; x=1768056372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1rNP0amHfQZI+Bt5JBFPQlAXbRaSEgN4u2DbQlN2RHg=;
        b=Aj3DIQfSgxQU+cgaqBJ8GsvxhYU9QRccMTASqukgGDToZPofKjqahT8tevvIYQzvJj
         jhpZkYnyuGZlEc60Ugh99t1DNvASJqmL+OL3oO+mJRBLxa9mDZg3oZ0rh4ktVkioLIIS
         7AWubN5JHWkYqFIHe4Mp3Qq06F/JEQ5QRGfqZKTjujgDZlseVTKClTd0oAL9bStpg8f3
         nHhEDluALNJSfC6LPEzygAYuGLhsbiNjxB0G/Hb097CDQi+5cOgQB6WT5h1yavHKnOrn
         kj3f4hCPwuE4kyVBH/es9kQNmf7wXuCDzk5OYwMNEEQenZOgKTG+IU8SQd8wt5cPIBA8
         Sasg==
X-Forwarded-Encrypted: i=1; AJvYcCVVsmPRatI/a4hskCEaIBPXW2WgQBfBie19MDVi8QFdS+mid790itZhyZZiIRFdcGkzcom8GR59gwvUAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5EFE/B8JPOzc6ZLhN37KnYH5JsY/jInRO5apGjXj7m6t4m3B5
	Rc7KAu5uhsRIjGHjncEVKLkWP8WzjJ90VxF5mj0P/pS2TTHC7T+2nxpU1flmTSSPuV+dvwlvMhG
	oNs7IFZUqMvQ+ugbThaRmIIY4+lF8BVh0xWo9ATg66Q==
X-Gm-Gg: AY/fxX5KmmXrSUKEtg/TMl03C2+4EhCDxamT6NSY69kg4YbeHJHXwkih2zdJtEvvaLX
	E2IqZrYly4XFz8c2C2cgg8yFZviOrQRzRGhygpDzZFHjbsiH+R7TJyHJTTDTbItO6N2yljS6PLI
	W/IETqTtjy/xbOzfD0HLdfp1UiXMqUBuP3CTiY6hecMk25WUWncV3QtDVnyS4sR8XFu/3wsnkmg
	/cMUGHU4JDfUp7mFb5FtNLoCTAuoUALqujD4fD5p1P6hw9l97OwgDo3ZS9P69q4F1S1kCr49gRv
	WslGqD6tat9L7BgT6uax5M49Uw8q
X-Google-Smtp-Source: AGHT+IF7eF6cn+HX5XYXj+oXYPZdeoxSmdOgiJeCygugV4mMTsAnlrOB1uBjUgSKh5J2mzU4hEupTp4yBLk/voocWR4=
X-Received: by 2002:a2e:a883:0:b0:37b:8d78:e4bf with SMTP id
 38308e7fff4ca-381216747bemr111199151fa.43.1767451571724; Sat, 03 Jan 2026
 06:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com> <20260103094501.5625-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260103094501.5625-2-naohiko.shimizu@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Jan 2026 20:16:01 +0530
X-Gm-Features: AQt7F2r6vAqM7C6IoN6U2-LtJjI5r5Bvxkcv5JqaaOeR5ZkwLpMsZJFGBVlH8g0
Message-ID: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_064615_073159_4334166B 
X-CRM114-Status: GOOD (  11.95  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCAzOjE24oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKClBsZWFzZSBhZGQgYSBkZXRhaWxlZCBjb21taXQg
ZGVzY3JpcHRpb24gYWJvdXQgd2h5IHRoZQpuZXcgd2F5IG9mIHByb2dyYW1taW5nIHN0aW1lY21w
IGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgp3aGF0IHRoZSBjdXJyZW50IFByaXYgc3BlYyBzYXlz
IGluIHRoaXMgY29udGV4dC4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW9oaWtvIFNoaW1penUgPG5h
b2hpa28uc2hpbWl6dUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItcmlzY3YuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBpbmRleCA0ZDdjZjMz
ODgyNGEuLmNmYzRkODNjNDJjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBA
QCAtNTAsOCArNTAsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQodW5zaWdu
ZWQgbG9uZyBkZWx0YSwKPgo+ICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNj
dl9zc3RjX2F2YWlsYWJsZSkpIHsKPiAgI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+IC0gICAg
ICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZG
KTsKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgVUxPTkdfTUFYKTsK
PiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIG5leHRfdHZhbCA+PiAz
Mik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfdHZhbCAm
IDB4RkZGRkZGRkYpOwo+ICAjZWxzZQo+ICAgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NU
SU1FQ01QLCBuZXh0X3R2YWwpOwo+ICAjZW5kaWYKPiAtLQo+IDIuMzkuNQo+Cj4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
