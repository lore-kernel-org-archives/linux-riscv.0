Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA88C48297
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 03:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaNNDPcwPj6eM5HIAHwwBWsyIF8kUNZEl+1KfuDlQSs=; b=GghswSA8JAyq9j
	sEauh4G7EJdRQUBT30oArtpj52JrAQgZdDQU9bxELQRPCZTSSdLtydAyYnqxeM18E/ohDuAyxR9ZQ
	S23nAfZH/sI92NTyOKvW5GeTp1bFwflSa6ajyQQ++ZG8ynzpSWuJoaPYpBmBw4+xzQa5vmGQYTucd
	nBpxoUbCNb4wS/p5Wm3kqJdpIDdMK+2AwPM7GgO1MtfT3GccqbdtClSpMSr5VPTug+UXRiJ/Vp3Ua
	MGYhAkXO4r8a36+C7qmUjqhbFEzI8u8n3oMQlVJ/wI7JC9t0+7GnUkXRrQ87ai5m2f8LW27OyrjsB
	QpAmXNKd+/bkM9nmyUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYdk2-000000018Wz-1LUI;
	Sat, 10 Feb 2024 03:09:22 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYdjy-000000018WY-2Gfs
	for linux-riscv@lists.infradead.org;
	Sat, 10 Feb 2024 03:09:20 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-60498c31743so15556757b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 19:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707534556; x=1708139356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NlfPA40flIXglJdThwjDuOLYTh+YAAerXy2K72G15g=;
        b=JGWmbVnc1coXj1rWL0A2xMZrAvSJmXEsPllvTvfbXAKgGFYLSLD9qHw04Jfge0eEAs
         08i1O9kfd5648TbgQavIrDSEr7QznNQQWSPXsBFMoLlyxSXs7VKJa+RAzfrCeQtXqnty
         v+ikrXQ/cFiWohRx8hh9cpNQoyRtjNB21wTnNPtLOF14t+v9X01QzY94Vioebl7A7lON
         0Yq6nPy2K1IWrckbOJRJ+ID1UzQRuJFuXbVLt7xPxjRIq86ZUmZrQnwHSFIbw/HO4SUx
         ImjbBUEY7jhlvYi+B8Fx79SL/I0fn1taQoZSDwrimYumd8QWLOfTYsRGV/J2pKQjgNem
         wKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707534556; x=1708139356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NlfPA40flIXglJdThwjDuOLYTh+YAAerXy2K72G15g=;
        b=sVtm7hIq0ewJ26Ky3qcJAe1i8/sjhvAgQb24hxENUYttfvJWgyP7l7RTGPEY5nq/kb
         ZEyn8E/k4L3CTwqAZNG2Rbasw35Ebm10q/4ZcDBpOMYFI2i82rYL1kCwoR0y3FMtaPeu
         23uH/SUMIjowOD4FWAm+JsWccMmudeoAz/SG8TrbGbAIZUxgzY6N6frchYdM1UqIioiz
         anDhmWDhm+Oqr6ma/BywukSpLPLs8qwUGiRTrL5Vnnc+OHq8uZe7f/wEHkoC/o4iQRHg
         upzv1KWvQhfRvHJdESMfHA8n/uVGv5Tcr5H5dxwKl2cg7UX1xxLUfRQ5taFDSQ9RPsEA
         RRiQ==
X-Gm-Message-State: AOJu0YwgLIXP3cz3B6P6tgEK01JvgTE7jeE2ZHmgqYYcungbp4ChG0vE
	+q3HJthN5R67RosChFZv7jPt/2zy1ICoffyTaSZG1uoL+wL/kkvBmhLPyYx7dBX9KnomQIEnj+S
	3zi2gfqgp4tG1iVmGuymrUofjcDmmfKyxPGyjJA==
X-Google-Smtp-Source: AGHT+IHGF7ANrInFVu7kswdinwo7NjOexDcTMyg5R35Qf/nzrvatBvo9UFZi2JyE3JMFYYfCG6Zh8m3FUyKa/q0zJPA=
X-Received: by 2002:a81:a08d:0:b0:604:2c60:d5d4 with SMTP id
 x135-20020a81a08d000000b006042c60d5d4mr1199631ywg.21.1707534556540; Fri, 09
 Feb 2024 19:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20240126074045.20159-1-nylon.chen@sifive.com> <20240126074045.20159-3-nylon.chen@sifive.com>
 <4kqkazromkzyhic2mgyyjrh4jlnp6djfuotu37btdfolqp5e2o@6jkbjnahvrbo>
In-Reply-To: <4kqkazromkzyhic2mgyyjrh4jlnp6djfuotu37btdfolqp5e2o@6jkbjnahvrbo>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Sat, 10 Feb 2024 11:09:05 +0800
Message-ID: <CAHh=Yk8Zeuu7hyvF3f-27TOV+t1Pn3OpSFSQErV7maE1WQ6cqw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_190918_644964_0754FC98 
X-CRM114-Status: GOOD (  30.43  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIw
MjTlubQy5pyINuaXpSDpgLHkuowg5LiK5Y2IMjowN+Wvq+mBk++8mgo+Cj4gSGVsbG8sCkhpIFV3
ZSwgdGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgo+Cj4gUmVnYXJkaW5nIHRoZSBTdWJqZWN0OiBU
aGUgcGF0Y2ggaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBhbiBMRUQsIGhhcyBpdD8KSSB3aWxsIGNv
cnJlY3QgdGhpcy4KPgo+IE9uIEZyaSwgSmFuIDI2LCAyMDI0IGF0IDAzOjQwOjQ0UE0gKzA4MDAs
IE55bG9uIENoZW4gd3JvdGU6Cj4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhl
IHB1bHNlIGluYWN0aXZlIHRpbWUsIGFuZCB0aGUgcmVzdWx0Cj4gPiBvZiB0aGlzIGFsZ29yaXRo
bSBpcyB0aGUgcHVsc2UgYWN0aXZlIHRpbWUuIFRoZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRo
ZSByZXN1bHQuCj4KPiBQbGVhc2UgYnJlYWsgbGluZXMgYXQgNzUgY29sdW1ucyBpbiB0aGUgY29t
bWl0IGxvZy4KZ290IGl0Lgo+Cj4gPiBUaGUgcmVmZXJlbmNlIGlzIFNpRml2ZSBGVTc0MC1DMDAw
IE1hbnVhbFswXQo+ID4KPiA+IExpbms6IGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3Np
Zml2ZS8xYTgyZTYwMC0xZjkzLTRmNDEtYjJkOC04NmVkOGIxNmFjYmFfZnU3NDAtYzAwMC1tYW51
YWwtdjFwNi5wZGYgWzBdCj4KPiBJIGxvb2tlZCBhdCBGaWd1cmUgMjkgaW4gdGhpcyBkb2N1bWVu
dCAodmVyc2lvbiB2MXA2LCBwZGYgcGFnZSAxNDgpLiBOb3QKPiBzdXJlIEkgdW5kZXJzdGFuZCB0
aGF0IGNvcnJlY3RseSwgYnV0IEkgZXhwZWN0IHRoYXQgdGhlIG91dHB1dCBvZiB0aGUKPiAiPj0/
IiBub2RlIGJlbG93IHB3bWNtcDAgdG8gYmVjb21lIDEgaWYgcHdtcyBoYXMgcmVhY2hlZCBwd21j
bXAwLCBpcwo+IHRoYXQgcmlnaHQ/IEluIHRoYXQgY2FzZSB0aGlzIG91dHB1dCBpcyB6ZXJvIHdo
ZW4gcHdtY291bnQgaXMgemVybyBhbmQKPiB0aGVuIHB3bWNtcDBpcCBpcyB6ZXJvLCB0b28uIFNv
IGEgcGVyaW9kIHN0YXJ0cyB3aXRoIHRoZSBpbmFjdGl2ZSBwYXJ0Cj4gYW5kIHNvIGl0J3MgaW52
ZXJzZWQgcG9sYXJpdHkuCj4KPiBXaGF0IG1hZGUgeW91IHRoaW5rIHRoYXQgdGhlIGN1cnJlbnQg
ZHJpdmVyIGltcGxlbWVudGF0aW9uIGlzIHdyb25nPwoKVGhpcyBpcyB0aGUgcHJvY2VzcyBvZiBt
eSBzcGVjdWxhdGlvbi4KClRoaXMgaXMgYSBIaUZpdmUgVW5tYXRjaGVkL1VubGVhc2hlZCBMRUQt
UFdNIGxheW91dAoKICAgICAgICAgICAgVkRECiAgICAgICAgICAgICAgIHwKICAgICAgICAgICAg
ICAgfAogICAgICAgICAgIF9fX19fCiAgICAgICAgICAgXCAgICAgICAgLyAgIExFRAogICAgICAg
ICAgICBcICAgICAvCiAgICAgICAgICAgICAgLS0tCiAgICAgICAgICAgICAgIHwKICAgICAgICAg
ICAgICAgfAogICAgICAgICAgICAgICB8CiAgICAgICAgIF9fX19fXwogICAgICAgIHwgICAgICAg
ICAgICAgIHwKICAgICAgICAtICAgICAgICAgICAgIHwKICAgICAgICBeICAgIC0tPiAgICB8LS0t
LS0tIFBXTQogICAgICAgIHxfX198X19ffAogICAgICAgICAgICAgICB8CiAgICAgICAgICAgICAg
IHwKICAgICAgICAgICAgICBfXwogICAgICAgICAgICAgICAtCiAgICAgICAgICAgIEdORAoKLSB0
aGUgd2F2ZWZvcm0KZS5nLiBkdXR5PTMwcywgcGVyaW9kPTEwMHMsIGFjdHZpZS1oaWdoID0gMzAl
LCBhY3RpdmUtbG93ID0gNzAlCgpWCl4KfAp8IC0tLS0tLS0tLS18CnwgICAgICAgICAgICAgfAp8
ICAgICAgICAgICAgIHwKfF9fX19fXyB8X19fX19fX19fXyA+IHQKCldoZW4gVkNDIGlzIGhpZ2gs
IHRoZSBMRUQgd2lsbCBiZSBpbGx1bWluYXRlZCwgd2hpY2ggaXMgYW4gYWN0aXZlLWhpZ2gKbG9n
aWMuIFRoaXMgaXMgd2h5IEkgd2FudCB0byByZW1vdmUgImFjdGl2ZS1sb3ciLgoKRm9yIEhXLCB3
ZSBqdXN0IGZvY3VzIG9uIHB3bWNvdW50L3B3bWNtcFswLTNdCi0gcHdtY291bnQgZGVmYXVsdCBp
cyB6ZXJvLCB0aGF0IGNvdW50ZXIgMC0+MS0+MHhmZmZmCi0gRm9sbG93IHRoZSBvcmlnaW4gYWxn
b3JpdGhtIHRoZSBmcmFjPTB4MChvbikgLyAweGZmZmYob2ZmKSBhbmQgd2hlbgp0aGUgc21hbGxl
ciB0aGUgdmFsdWUgb2YgZnJhYywgdGhlIGJyaWdodGVyIHRoZSBsaWdodC4KICAgLS0gRS5nLiBw
d21jbXAgPSAweDIsIHB3bWNvdW50IDB4MC0+MHgxLT4uLi4tPjB4ZmZmZgogICAgICAgLS0tIDAt
PjB4Mj1sb3cgJiAweDMtPjB4ZmZmZj1oaWdoID0+IDk4JQogICAtLSBFLmcuIHB3bWNtcCA9IDB4
ZmZmZiwgcHdtY291bnQgMHgwLT4weDEtPi4uLi0+MHhmZmZmCiAgICAgICAtLS0gMC0+MHhmZmZm
PWxvdyA9PiAwJQotIEZvciBTVywgd2UgcmVmZXJlbmNlIHRoZSBhbGdvcml0aG0uIChEPVBXL1Qq
MTAwJSBEPWR1dHlfY3ljbGUsClQ9cGVyaW9kLCBQVz1wdWxzZSB3aWR0aCAocHVsc2UgYWN0aXZl
IHRpbWUpKQogIC0tIHdoZW4gd2UgY29uc2lkZXIgSFcgYmVoYXZpb3IKICAtLS0gRGlyZWN0IHdy
aXRpbmcgU1cgZnJhYyBpbnRvIEhXJ3MgcHdtY21wIGlzIGFjdGl2ZSBsb3csIHNvIHdoZW4Kd2Ug
d2FudCB0byBnZXQgYW4gYWN0aXZlLWhpZ2ggYmVoYXZpb3IgdGhhdCB1c2UgYSBpbnZlcnQgZnVu
Y3Rpb24uCgpJZiBteSB1bmRlcnN0YW5kaW5nIG9yIGRlZHVjdGlvbiBwcm9jZXNzIGlzIGluY29y
cmVjdCwgcGxlYXNlIGxldCBtZQprbm93LiBUaGFuayB5b3UuCj4KPiA+IENvLWRldmVsb3BlZC1i
eTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4g
PHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVu
IDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4g
PG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYyB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUu
YyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gaW5kZXggZWFiZGRiN2M3ODIwLi5iMDdj
ODU5OGJiMjEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ICsr
KyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gQEAgLTExMyw2ICsxMTMsNyBAQCBzdGF0
aWMgaW50IHB3bV9zaWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwKPiA+ICAgICAgIHUzMiBkdXR5LCB2YWw7Cj4gPgo+ID4gICAgICAg
ZHV0eSA9IHJlYWRsKGRkYXRhLT5yZWdzICsgUFdNX1NJRklWRV9QV01DTVAocHdtLT5od3B3bSkp
Owo+ID4gKyAgICAgZHV0eSA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgLSBkdXR5
Owo+Cj4gSSBmaW5kIGl0IGlycml0YXRpbmcgdGhhdCBib3RoIHZhbHVlcyBhcmUgYXNzaWduZWQg
dG8gZHV0eS4gSSdkIHNwZW5kCj4gYW5vdGhlciB2YXJpYWJsZSBhbmQgbWFrZSB0aGlzOgo+Cj4g
ICAgICAgICBpbmFjdGl2ZSA9IHJlYWRsKGRkYXRhLT5yZWdzICsgUFdNX1NJRklWRV9QV01DTVAo
cHdtLT5od3B3bSkpOwo+ICAgICAgICAgZHV0eSA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRI
KSAtIDEgLSBpbmFjdGl2ZTsKZ290IGl0Lgo+Cj4KPiA+Cj4gPiAgICAgICBzdGF0ZS0+ZW5hYmxl
ZCA9IGR1dHkgPiAwOwo+ID4KPiA+IEBAIC0xMjMsMTEgKzEyNCwxMCBAQCBzdGF0aWMgaW50IHB3
bV9zaWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKPiA+ICAgICAgIHN0YXRlLT5wZXJpb2QgPSBkZGF0YS0+cmVhbF9wZXJpb2Q7Cj4g
PiAgICAgICBzdGF0ZS0+ZHV0eV9jeWNsZSA9Cj4gPiAgICAgICAgICAgICAgICh1NjQpZHV0eSAq
IGRkYXRhLT5yZWFsX3BlcmlvZCA+PiBQV01fU0lGSVZFX0NNUFdJRFRIOwo+ID4gLSAgICAgc3Rh
dGUtPnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX0lOVkVSU0VEOwo+ID4gKyAgICAgc3RhdGUtPnBv
bGFyaXR5ID0gUFdNX1BPTEFSSVRZX05PUk1BTDsKPiA+Cj4gPiAgICAgICByZXR1cm4gMDsKPiA+
ICB9Cj4gPiAtCj4KPiBQbGVhc2Uga2VlcCB0aGlzIGVtcHR5IGxpbmUgYmV0d2VlbiBmdW5jdGlv
bnMuCmdvdCBpdC4KPgo+ID4gIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ID4gIHsKPgo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExp
bnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5k
ZS8gfAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
