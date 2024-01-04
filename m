Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F24C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GrCUlXiJrRt+8I4K0o0RGj2fWvFWD97dM7Myud5czU=; b=aVnE0XdSSqvDI1
	3OnRskYbHSyIqz/PQVSbEuxcAATDzUbcCzeMZRJATZRZv0EpvjI1jc+GauESmoDbss+Oj8VPLIjwS
	M/4Wlw0wGizgLRdvje9clUUtaxxdlmlmhSCRPJbU5JWvPfMwpI7WQHtRZhhOtCuOCzinrS/JReyRD
	pW3KK9Mq08PavJYxEE1d/0SUtFq9HBkzXo0H8Q2QWW/Ka4sPIaKrEKiMnCOApbxMWOJfXIx9HCq7o
	ZX3oNWqFtEX1jI5AQerACZS3UxnVFeGU0gCkxdkgNJ7drWFWU+T6HzPMH77nCVWyrs0W3xr9JxBJv
	9ryx72ZDrtdBc6Ni8A+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMN4-00Dtxl-0k;
	Thu, 04 Jan 2024 11:58:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMN1-00Dtx0-0W
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 11:58:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a28cd136f03so48418266b.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704369521; x=1704974321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biEC4RdBheGrNbgmPXjbRT8tBxezcZaF2c5NyP81mLc=;
        b=TmKmpYaETdQgLtoA3dZgltmKAQEQSdirv2qsr2ufJzTexm89LRYvFxLdqrierVaqQP
         m2EjIqxBgnIl0zerp1t9cPPYvUVWz34bqGN8YrSZnOwMDicVw0KyYaqaUImNpCoyBfn1
         AIaILvDv6CeGmWbMUtrEOgjNR9rN1ZFoD0qIUQvGPj9K0gY80vDTl/8bZ1MOGwogegwO
         1/Pp06B3FVOUK8WeVFLKfZmz96gh/ydMuL7nlVyD4AWJi7sCMLK5SBvPs4uIvP74Ip5L
         5e5AHZ80gGCaJWpNGtAKSE7cdiqWTYnCNE0pbWy33qYMza5CUi7x+6Nx+lG5Er1cfqSw
         XzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369521; x=1704974321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biEC4RdBheGrNbgmPXjbRT8tBxezcZaF2c5NyP81mLc=;
        b=khfHIX1BTAvpJveT/id3+Ej/2YSs2vf0fEISJrJjJ9/mK/BU9/2SdP4E0e+ylz8qkE
         X4Xlcb2M5lKMhY1YGUE0rEgbH0N9/KDL3LaRFoSD51LplqrSLS96NmkLtyA1TyMLSmDj
         2/ofkjmZWyKasYqggThAUWOMgL1oR/O9bV4Rvu0ZmEHitufSB5eHWSry8SL54vhb+GhY
         V4wRFitcB8XAtD9lMuwUP0abVp1q+tRVLMnH2I52UguhnRGupgQzJ3NOyduM1F1Ab7gq
         xKxdrmy+7ewSF8gL6WzSisvK79v2Wn5GSVcpcvyzkFGyFGVeOW3idyqYUY21ONCAbuyI
         b3uQ==
X-Gm-Message-State: AOJu0YwiCaum9Rujfj0nz4IRJ2IgE2O6Qq1ZVrYhwCBdHMGJRokiMDLj
	T3uvIgyzOAuywi2Q2acGEUg3yHIYHnGQYRTMS67qMfXMSEIZTW2ozWkxaPRQ
X-Google-Smtp-Source: AGHT+IH9leLmV7SjLOc/Li9cgWIvDV0khEwPnd3n91ththizegEoLyva2lAScUcn+idPmK2OepoE4yqrYtFzFpwYVN0=
X-Received: by 2002:a17:907:1b25:b0:a24:8deb:3524 with SMTP id
 mp37-20020a1709071b2500b00a248deb3524mr374427ejc.54.1704369521084; Thu, 04
 Jan 2024 03:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-2-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-2-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 12:58:30 +0100
Message-ID: <CAHVXubidnfCKwSBwD-U6NzBU2PE9Etz1n367swrcZvA2=a_FTg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] riscv: Flush the instruction cache during SMP bringup
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_035844_206999_D10D0487 
X-CRM114-Status: GOOD (  17.91  )
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

SGkgU2FtdWVsLAoKT24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEluc3RydWN0aW9uIGNh
Y2hlIGZsdXNoIElQSXMgYXJlIHNlbnQgb25seSB0byBDUFVzIGluIGNwdV9vbmxpbmVfbWFzaywK
PiBzbyB0aGV5IHdpbGwgbm90IHRhcmdldCBhIENQVSB1bnRpbCBpdCBjYWxscyBzZXRfY3B1X29u
bGluZSgpIGVhcmxpZXIgaW4KPiBzbXBfY2FsbGluKCkuIEFzIGEgcmVzdWx0LCBpZiBpbnN0cnVj
dGlvbiBtZW1vcnkgaXMgbW9kaWZpZWQgYmV0d2VlbiB0aGUKPiBDUFUgY29taW5nIG91dCBvZiBy
ZXNldCBhbmQgdGhhdCBwb2ludCwgdGhlbiBpdHMgaW5zdHJ1Y3Rpb24gY2FjaGUgbWF5Cj4gY29u
dGFpbiBzdGFsZSBkYXRhLiBUaGVyZWZvcmUsIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSBtdXN0IGJl
IGZsdXNoZWQKPiBhZnRlciB0aGUgc2V0X2NwdV9vbmxpbmUoKSBzeW5jaHJvbml6YXRpb24gcG9p
bnQuCj4KPiBGaXhlczogMDhmMDUxZWRhMzNiICgiUklTQy1WOiBGbHVzaCBJJCB3aGVuIG1ha2lu
ZyBhIGRpcnR5IHBhZ2UgZXhlY3V0YWJsZSIpCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY0Ogo+
ICAtIE5ldyBwYXRjaCBmb3IgdjQKPgo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCA3
ICsrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMKPiBpbmRleCBkMTYyYmYzMzliZWIuLjQ4YWY1YmQzZWMzMCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMKPiBAQCAtMjYsNyArMjYsNyBAQAo+ICAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFza19zdGFjay5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPgo+
IC0jaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPiArI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNo
Lmg+Cj4gICNpbmNsdWRlIDxhc20vY3B1X29wcy5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1
cmUuaD4KPiAgI2luY2x1ZGUgPGFzbS9pcnEuaD4KPiBAQCAtMjU3LDkgKzI1NywxMCBAQCBhc21s
aW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiAgICAgICAgIHJpc2N2X3Vz
ZXJfaXNhX2VuYWJsZSgpOwo+Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogUmVtb3RlIFRMQiBm
bHVzaGVzIGFyZSBpZ25vcmVkIHdoaWxlIHRoZSBDUFUgaXMgb2ZmbGluZSwgc28gZW1pdAo+IC0g
ICAgICAgICogYSBsb2NhbCBUTEIgZmx1c2ggcmlnaHQgbm93IGp1c3QgaW4gY2FzZS4KPiArICAg
ICAgICAqIFJlbW90ZSBjYWNoZSBhbmQgVExCIGZsdXNoZXMgYXJlIGlnbm9yZWQgd2hpbGUgdGhl
IENQVSBpcyBvZmZsaW5lLAo+ICsgICAgICAgICogc28gZmx1c2ggdGhlbSBib3RoIHJpZ2h0IG5v
dyBqdXN0IGluIGNhc2UuCj4gICAgICAgICAgKi8KPiArICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNo
ZV9hbGwoKTsKPiAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAgICAgICAgIGNvbXBs
ZXRlKCZjcHVfcnVubmluZyk7Cj4gICAgICAgICAvKgo+IC0tCj4gMi40Mi4wCj4KClRoaXMgbG9v
a3MgZ29vZCB0byBtZSwgc28geW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
