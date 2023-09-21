Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29715E71094
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVwuCBw6DzkuR/TWafaGKPbjNZzAKnjZO+ZA0wykk+U=; b=nTaNK26WaI8iAt
	rt88Xr4F1t7A7cJejl/2aGFDsLOWRtULIS+MA6aDfOgjU3o8WRKE23fCsF2bZXCfqE5I0ZhNSzvUP
	qm9qzwa0G0rSCzjBM3b4GKQlTPNr3ebkqBwRlcN67lctc5PmDqM7Jhf6rfMBG0tzWOeyypd7+SaS1
	Vn5io8oJ0DC7mrmYoq+ZAOvKh9sKvlOzNnWNnK9x2tcdo3G0QFJWUYQQik1dcDvg+NKnEUZcNy9C+
	88d9BHLUjE8R4gvzIoYhxD/m9Qv08yLxVcnX0llfJ0MLA8wL/KRolajCB79sTwGM9iHHBRkTXlbmi
	l6we0w6hJPVQhd7DOCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMs3-006YUX-1l;
	Thu, 21 Sep 2023 16:49:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMs0-006YTC-2H
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 16:49:42 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso18846881fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695314978; x=1695919778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4XnljMvhHSvDOl2lNXQmHCmuwyYv06P2O8ypwL5cCw=;
        b=rOqxhEI/TDNQrSICOfyoHPPS0ouAkDY8faC8Ug+7a/p8Z7db3fYymrMJLsNlsD10zj
         aNDLD0e6QTZR5KRjSyBpmF8TSN6Wt2bFNoyNQXFw5jK8vzUWfj++nTD1B0dNeX4L8zWk
         NQbUbt1I1WgUiYqBWczup7Tump++26P9yQzA0ezG7MaPAGhlNr9BKaxWKv8lJTb7aXAk
         6dMY+C64qwfgh5uCPCpV85vA7R7HTpfvRjzFwiY49GKfa/LPj+8rvurSaVvsJEDjBzQ8
         HwWenKjaO/hxnXeFrQCo3Ii4InEdC73YcbIRzVFJ6DgU240yfMK23xA4cfCjy2xLlWHi
         lqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695314978; x=1695919778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4XnljMvhHSvDOl2lNXQmHCmuwyYv06P2O8ypwL5cCw=;
        b=Auskgh5PB5Bbzmhr01rnNOOSXX0FPDteJ7BSbhHkjeDNTJggl9bLDTL4ZzlN2B5ItG
         DgkjluhClVy+S/gNctz3WV2kPEIce5u2AUyQzYYAteHdYuy24KEUt0wYNoAxkhKJ0iPy
         n68wRFMjc5IyoYLvk3Gc/H2nFbmVS4lc62t6v0qnsH6RnOxpUckBfABIXdpPIiV6oQjZ
         IaRCPGWJ6yEATR7F80Y+JUoHHY04b8PE6kL8WuZYAp5xkrJzSDIEmVNQU040wn1h8dgG
         t2K2UdlJ++SEuI99q6VsL4ip6VUf/Kvy9xfN01dj+1Je5BqYcIxqpiHUXUwdYf2TYIL8
         4+hg==
X-Gm-Message-State: AOJu0YxDiaZXPDetq/2Fz/qSGbg+Ye3K9LPrzuJ7MMTrFGWRUpqnZ/RU
	huV2IrDieK4vt950u+TBCWbO81WF0JHEG+AM8clgew==
X-Google-Smtp-Source: AGHT+IESTkfakGFXWnCJ/VtMysL1yDXmOS36fBsROIV+3WuacHmCtVXaDl6X1Va+yd+Ft3/RcDg7ZIfby3Ha5Rd65D8=
X-Received: by 2002:a05:651c:90:b0:2bc:e882:f717 with SMTP id
 16-20020a05651c009000b002bce882f717mr5133603ljq.53.1695314978101; Thu, 21 Sep
 2023 09:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230920193801.3035093-1-evan@rivosinc.com> <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
 <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
 <CAOnJCU+YNOzw39JMjWmJFHY5QjcRrKEwULo+d9WhPfv7TejpbQ@mail.gmail.com>
 <CALs-HsvvnMFErCtShB-30xO8LR4M03riYomZy3FnvEghRua_3g@mail.gmail.com>
 <a94490f6b1dd43d5985a8b14aa93bd27@AcuMS.aculab.com> <CALs-Hsuuhmtg54TRSBtGFR9QGH4LWuO4TxUsg3NVzoPj3g6HzQ@mail.gmail.com>
In-Reply-To: <CALs-Hsuuhmtg54TRSBtGFR9QGH4LWuO4TxUsg3NVzoPj3g6HzQ@mail.gmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 21 Sep 2023 09:49:02 -0700
Message-ID: <CALs-HsuyJ41ohF3sodr5weASWLq2kCHf44Ks_bH=J0gcxKm-Ow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230921_094940_750770_2046C38C 
X-CRM114-Status: GOOD (  28.91  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgOTo0NOKAr0FNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDM6MjLigK9BTSBEYXZp
ZCBMYWlnaHQgPERhdmlkLkxhaWdodEBhY3VsYWIuY29tPiB3cm90ZToKPiA+Cj4gPiAuLi4KPiA+
ID4gPiBGb3IgcHJvYmluZyBhbGlnbm1lbnQgc3BlZWQsIHlvdSBqdXN0IGNhcmUgYWJvdXQgcnVu
bmluZyBpdCBvbiB0aGF0Cj4gPiA+ID4gY3B1LiBDb3JyZWN0ID8KPiA+ID4KPiA+ID4gRm9yIHRo
aXMgd2UgY2FyZSBib3RoIGFib3V0IG5vdCBtaWdyYXRpbmcgdG8gb3RoZXIgQ1BVcywgYW5kIGFs
c28KPiA+ID4gc2Vjb25kYXJpbHkgbWluaW1pemluZyBkaXN0dXJiYW5jZXMgd2hpbGUgdGhlIHRl
c3QgaXMgYmVpbmcgcnVuLgo+ID4gPiBVc3VhbGx5IEkgZXF1YXRlIHByZS1lbXB0aW9uIHdpdGgg
bWlncmF0aW9uLCBidXQgaW4gdGhpcyBjYXNlIEkgdGhpbmsKPiA+ID4gdGhlIHdvcmtlciB0aHJl
YWRzIGFyZSBib3VuZCB0byB0aGF0IENQVS4gU28gSSdsbCBrZWVwIHRoZQo+ID4gPiBwcmVlbXB0
X2Rpc2FibGUvZW5hYmxlIHdoZXJlIGl0IGlzLCBzaW5jZSBpdCdzIGhhcm1sZXNzIGZvciBDUFVz
IG90aGVyCj4gPiA+IHRoYW4gMCwgYnV0IHVzZWZ1bCBmb3IgMC4gSSBhbHNvIGxpa2UgaXQgZm9y
IHJlYWRhYmlsaXR5IGFzIGl0Cj4gPiA+IGhpZ2hsaWdodHMgdGhlIGNyaXRpY2FsIHNlY3Rpb24g
KGFzIGEgcmVhZGVyLCAiaXMgcHJlZW1wdGlvbiBkaXNhYmxlZCIKPiA+ID4gd291bGQgYmUgb25l
IG9mIG15IGZpcnN0IHF1ZXN0aW9ucyB3aGVuIHN0dWR5aW5nIHRoaXMpLgo+ID4KPiA+IFlvdSBu
ZWVkIHRvIGRpc2FibGUgcHJlLWVtcHRpb24gdG8gZ2V0IGFueSBraW5kIG9mIG1lYW5pbmdmdWwg
YW5zd2VyLgo+ID4KPiA+IEJ1dCB3aHkgZG8geW91IG5lZWQgdG8gcnVuIHRoZSB0ZXN0IG9uIG1v
cmUgdGhhbiB0aGUgYm9vdCBjcHU/Cj4gPiBJZiB5b3UndmUgYSBoZXRlcm9nZW5vdXMgbWl4IG9m
IGNwdSBhbnkgY29kZSB0aGF0IGxvb2tzIGF0IHRoZSBhbnN3ZXIKPiA+IGlzIGdvaW5nIHRvIGJl
aGF2ZSBpbmNvcnJlY3RseSB1bmxlc3MgaXQgaGFzIGFsc28gZGlzYWJsZWQgcHJlLWVtcHRpb24K
PiA+IG9yIGlzIGJvdW5kIHRvIGEgY3B1Lgo+Cj4gSSBkb24ndCB0aGluayBpdCdzIHNhZmUgdG8g
YXNzdW1lIG1pc2FsaWduZWQgYWNjZXNzIHNwZWVkIGlzIHRoZSBzYW1lCj4gYWNyb3NzIGFsbCBj
b3Jlcy4gSW4gYSBiaWcubGl0dGxlIGNvbWJpbmF0aW9uIEkgY2FuIGVhc2lseSBpbWFnaW5lIHRo
ZQo+IGJpZyBjb3JlcyBoYXZpbmcgZmFzdCBtaXNhbGlnbmVkIGFjY2VzcyBhbmQgdGhlIHNsb3cg
Y29yZXMgbm90IGhhdmluZwo+IGl0ICh0aG91Z2ggaG9wZWZ1bGx5IHRoZSBzbG93IGNvcmVzIGRv
bid0IGtpY2sgaXQgdG8gZmlybXdhcmUpLiBTaW5jZQo+IHRoaXMgaW5mbyBpcyBwcmVzZW50ZWQg
dG8gdXNlcm1vZGUgcGVyLWNwdSwgSSdkIGxpa2UgaXQgdG8gYmUgY29ycmVjdC4KPgo+ID4KPiA+
IE9uZSBvYnZpb3VzIHVzZSBvZiB0aGUgcmVzdWx0IGlzIHRvIHNldHVwIHNvbWUgc3RhdGljIGJy
YW5jaGVzLgo+ID4gQnV0IHRoYXQgYXNzdW1lcyBhbGwgY3B1IGFyZSB0aGUgc2FtZS4KPgo+IFJp
Z2h0LCB0aGlzIGNvdWxkIGJlIHVzZWQgdG8gc2V0IHVwIHN0YXRpYyBicmFuY2hlcywgb3IgaW4g
YW4gaWZ1bmMKPiBzZWxlY3Rvci4gVGhpcyBpcyB3aHkgd2UgcHJvdmlkZSBwcmUtY29tcHV0ZWQg
YW5zd2VycyBmb3IgImFsbCBDUFVzIgo+IGluIGh3cHJvYmUuIElmIHRoZSBzaXR1YXRpb24gSSBk
ZXNjcmliZSBhYm92ZSBkaWQgaGFwcGVuLCBjb2RlIGFza2luZwoKQ29ycmVjdGlvbjogTm90IGV4
YWN0bHkgcHJlY29tcHV0ZWQgYW5zd2VycywgYnV0IGNhY2hlZCB2RFNPIGRhdGEKY2FwYWJsZSBv
ZiBxdWlja2x5IGFuc3dlcmluZyB1c2VybW9kZSBxdWVyaWVzIGZvciBzeXN0ZW1zIHdpdGgKaG9t
b2dlbmVvdXMgQ1BVcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
