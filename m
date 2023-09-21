Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6835FE71096
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt02xsLWNiTsYNzuJnGcupzqSQnLy77yT0yxVlbUSRw=; b=wgJh9556qha4qW
	ni4vQaNxHxEE+eACxpeTZK2aUIDzPraOk8X4XCcLgOE4kDz8GQhib0ZShRL6xwxsLsCi8SNlD38FI
	o+J222C655jzkR8CwtpwAHBAKTjuvsK3bxEGVFvmGQppDVmORrLipW9CbvzfKIppFaIXQrvcZxyhz
	I3sWh4LVlDmxvyK4Nv+7s9VqAVkgXYDvjzuCrTBEAjf+R74t+Bp/LW2aOy3X5HOPTsXNuwTwO1ueL
	AiLDvu7LONY5vMrJamKetTYCdNjzD25kib83NKKi4xWYbKvQl2KWfna6jxkL9dYa3e3RiQAN7bHcd
	xuzwbV2uyyHJDXT/NFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMo9-006Y01-0i;
	Thu, 21 Sep 2023 16:45:41 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMo6-006Xzc-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 16:45:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso20307421fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695314736; x=1695919536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFcwkCsyNvb3+F2dBflUU/e2F/txYXL9uZkq7j4g1FI=;
        b=2HKbpyDojqN7K4+rQXl+MRMGLvs2aus3D9qXRxDcfapFVHEYS0zFymtaKW5TMo2K+F
         aYIG97zoigDtKAkZ8anXZVDPMfssmvauw/TEbzkBPt5k9ZJoKonXFWFXlkBrjSINfNOk
         HjcEhZgWN31vEdC7Qh8vQOHtVNLayooiYvYXBdlA1/LhjhbqkYGXeiUJgo6zOfyrT3Yu
         ynnLnr0x10MV5Zb6XcvTRYDNSq/jj9ZaOmAZQ9xw8egYXhFTI2nvpVX6AGIacOtYOXtZ
         /NfOAAXCWct3QxGBP8bGrS/BegQd+huKPcLSLIHqLc44CVmWlDWL60/d/YMIKBJOfbgG
         Ezsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695314736; x=1695919536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFcwkCsyNvb3+F2dBflUU/e2F/txYXL9uZkq7j4g1FI=;
        b=ZEkroVnqo60Hv5RIKkpMYZI8RbGmI59Qi9wOn2qerXqyLHiYlrPZT0PgHLXNBcasF1
         fEey9Qb3yaa9Q5FXJzG5lHZU4WQAKrtSks+OR4b+DPuyXpGo7oa0CyO2ebAZz8R8G4Oy
         yKuyV+l7rdP7wXh/4IveRvDI/We8pPEou3M9qQ9MKgaOiHrZi+2RWoAT0jbEAlzQ7i7E
         s6j5mhGlytegykXSlUlxJHblVPQyd1FXejKPdnwb+Qr+rrdCfdfGr10/WFanKJk21E+2
         jNewfMTw8GK+Anam76JZ3dpBwDzJCt/jNDR6MxtEyAKi9GpSIJfdEvtsWm07Zlxo+06p
         ZUjQ==
X-Gm-Message-State: AOJu0YxJTmkUuQh5lpjPuoXtflVg36UvemSM1l9/rkV2qef03dXLF6S8
	7jB5l+7pARcVYNOb8xbr4Ce5QLO+BY5XKtDErG+xQg==
X-Google-Smtp-Source: AGHT+IFNezL7iZrcu9U0R/PCxUbFl1VTTxffcH3c3kpwj9r61fMAUV/sWK+nSgSyoGMEtsvb1Pu8+P6qFlABdx1A6ro=
X-Received: by 2002:a2e:3306:0:b0:2bc:dfab:5dc8 with SMTP id
 d6-20020a2e3306000000b002bcdfab5dc8mr4897815ljc.37.1695314735888; Thu, 21 Sep
 2023 09:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230920193801.3035093-1-evan@rivosinc.com> <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
 <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
 <CAOnJCU+YNOzw39JMjWmJFHY5QjcRrKEwULo+d9WhPfv7TejpbQ@mail.gmail.com>
 <CALs-HsvvnMFErCtShB-30xO8LR4M03riYomZy3FnvEghRua_3g@mail.gmail.com> <a94490f6b1dd43d5985a8b14aa93bd27@AcuMS.aculab.com>
In-Reply-To: <a94490f6b1dd43d5985a8b14aa93bd27@AcuMS.aculab.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 21 Sep 2023 09:44:59 -0700
Message-ID: <CALs-Hsuuhmtg54TRSBtGFR9QGH4LWuO4TxUsg3NVzoPj3g6HzQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
To: David Laight <David.Laight@aculab.com>
Cc: Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_094538_520194_E518C763 
X-CRM114-Status: GOOD (  25.49  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMzoyMuKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gLi4uCj4gPiA+IEZvciBwcm9iaW5nIGFsaWdubWVu
dCBzcGVlZCwgeW91IGp1c3QgY2FyZSBhYm91dCBydW5uaW5nIGl0IG9uIHRoYXQKPiA+ID4gY3B1
LiBDb3JyZWN0ID8KPiA+Cj4gPiBGb3IgdGhpcyB3ZSBjYXJlIGJvdGggYWJvdXQgbm90IG1pZ3Jh
dGluZyB0byBvdGhlciBDUFVzLCBhbmQgYWxzbwo+ID4gc2Vjb25kYXJpbHkgbWluaW1pemluZyBk
aXN0dXJiYW5jZXMgd2hpbGUgdGhlIHRlc3QgaXMgYmVpbmcgcnVuLgo+ID4gVXN1YWxseSBJIGVx
dWF0ZSBwcmUtZW1wdGlvbiB3aXRoIG1pZ3JhdGlvbiwgYnV0IGluIHRoaXMgY2FzZSBJIHRoaW5r
Cj4gPiB0aGUgd29ya2VyIHRocmVhZHMgYXJlIGJvdW5kIHRvIHRoYXQgQ1BVLiBTbyBJJ2xsIGtl
ZXAgdGhlCj4gPiBwcmVlbXB0X2Rpc2FibGUvZW5hYmxlIHdoZXJlIGl0IGlzLCBzaW5jZSBpdCdz
IGhhcm1sZXNzIGZvciBDUFVzIG90aGVyCj4gPiB0aGFuIDAsIGJ1dCB1c2VmdWwgZm9yIDAuIEkg
YWxzbyBsaWtlIGl0IGZvciByZWFkYWJpbGl0eSBhcyBpdAo+ID4gaGlnaGxpZ2h0cyB0aGUgY3Jp
dGljYWwgc2VjdGlvbiAoYXMgYSByZWFkZXIsICJpcyBwcmVlbXB0aW9uIGRpc2FibGVkIgo+ID4g
d291bGQgYmUgb25lIG9mIG15IGZpcnN0IHF1ZXN0aW9ucyB3aGVuIHN0dWR5aW5nIHRoaXMpLgo+
Cj4gWW91IG5lZWQgdG8gZGlzYWJsZSBwcmUtZW1wdGlvbiB0byBnZXQgYW55IGtpbmQgb2YgbWVh
bmluZ2Z1bCBhbnN3ZXIuCj4KPiBCdXQgd2h5IGRvIHlvdSBuZWVkIHRvIHJ1biB0aGUgdGVzdCBv
biBtb3JlIHRoYW4gdGhlIGJvb3QgY3B1Pwo+IElmIHlvdSd2ZSBhIGhldGVyb2dlbm91cyBtaXgg
b2YgY3B1IGFueSBjb2RlIHRoYXQgbG9va3MgYXQgdGhlIGFuc3dlcgo+IGlzIGdvaW5nIHRvIGJl
aGF2ZSBpbmNvcnJlY3RseSB1bmxlc3MgaXQgaGFzIGFsc28gZGlzYWJsZWQgcHJlLWVtcHRpb24K
PiBvciBpcyBib3VuZCB0byBhIGNwdS4KCkkgZG9uJ3QgdGhpbmsgaXQncyBzYWZlIHRvIGFzc3Vt
ZSBtaXNhbGlnbmVkIGFjY2VzcyBzcGVlZCBpcyB0aGUgc2FtZQphY3Jvc3MgYWxsIGNvcmVzLiBJ
biBhIGJpZy5saXR0bGUgY29tYmluYXRpb24gSSBjYW4gZWFzaWx5IGltYWdpbmUgdGhlCmJpZyBj
b3JlcyBoYXZpbmcgZmFzdCBtaXNhbGlnbmVkIGFjY2VzcyBhbmQgdGhlIHNsb3cgY29yZXMgbm90
IGhhdmluZwppdCAodGhvdWdoIGhvcGVmdWxseSB0aGUgc2xvdyBjb3JlcyBkb24ndCBraWNrIGl0
IHRvIGZpcm13YXJlKS4gU2luY2UKdGhpcyBpbmZvIGlzIHByZXNlbnRlZCB0byB1c2VybW9kZSBw
ZXItY3B1LCBJJ2QgbGlrZSBpdCB0byBiZSBjb3JyZWN0LgoKPgo+IE9uZSBvYnZpb3VzIHVzZSBv
ZiB0aGUgcmVzdWx0IGlzIHRvIHNldHVwIHNvbWUgc3RhdGljIGJyYW5jaGVzLgo+IEJ1dCB0aGF0
IGFzc3VtZXMgYWxsIGNwdSBhcmUgdGhlIHNhbWUuCgpSaWdodCwgdGhpcyBjb3VsZCBiZSB1c2Vk
IHRvIHNldCB1cCBzdGF0aWMgYnJhbmNoZXMsIG9yIGluIGFuIGlmdW5jCnNlbGVjdG9yLiBUaGlz
IGlzIHdoeSB3ZSBwcm92aWRlIHByZS1jb21wdXRlZCBhbnN3ZXJzIGZvciAiYWxsIENQVXMiCmlu
IGh3cHJvYmUuIElmIHRoZSBzaXR1YXRpb24gSSBkZXNjcmliZSBhYm92ZSBkaWQgaGFwcGVuLCBj
b2RlIGFza2luZwpvbiBiZWhhbGYgb2YgYWxsIENQVXMgd291bGQgY29tZSBiYWNrICJ1bmtub3du
Iiwgd2hpY2ggaXMgdHJ1ZSAodGhvdWdoCndvdWxkIHByb2JhYmx5IGRlZmF1bHQgdG8gdGhlIGJ5
dGUtY29weSB2ZXJzaW9uKS4gTW9yZSBzcGVjaWZpYwplbnZpcm9ubWVudHMgbWlnaHQgY2hvb3Nl
IHRvIGN1cmF0ZSB0aGVpciBzY2hlZHVsaW5nIGEgYml0IG1vcmUsIGFuZAp0aGlzIGluZm8gcGVy
LWNvcmUgd291bGQgYmUgdXNlZnVsIHRoZXJlLgoKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
