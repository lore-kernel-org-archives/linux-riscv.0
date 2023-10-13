Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466E5CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1J0wnRppOXHG/kX+ZcW0MXqEFj2W3yGCHu9fw1vMejU=; b=I5NbKk4iocqCdS
	QYdXdKLwNA7pBy9yH8TNd52pdNpt3N0MkoU/rA/DCOq4iBGWyw4FvQRmKUW6+YSDgtWSxk4578gEP
	yLAve/9/KMvlYuJhfkYB/w5TzhqrsFtgr+K3A4K4FGeS8sEEyPVB+uHReaJmIDRG0zgseZ4GQIAHY
	EvikdvbMU9gVkSEtMnWtbNGaACw2KleH7Wyz4D8SGRMmttIqBZJUBX74f1288uti+WWn/9eKWGi2w
	T41aCpvzHMTYya0Yxe24e5qWajJe+lUBVOMtb3RtvvmVNK+Qz8dPWSsADOLANVQEUI6m9tts3VABD
	p2iYsQ9QNC5X9dGtNb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrK47-003fz9-07;
	Fri, 13 Oct 2023 15:27:03 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrK43-003fyj-1R
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 15:27:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bffc55af02so26587541fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697210815; x=1697815615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVJo6QC/TVwhbmxkRzSaC6qmFUL0H7BcuxMtCeQMIrE=;
        b=GR/Pc2tN6WvNhWywTBz7PbP2I75EeLD6lVpVwYEZuiVvCsl0781kss9RF3MsrU4zA7
         6egM6mfWM6EyQDk2r1A8i872Q9hp6hUwoGZqnKuEIpQglot3cZxkgzE7t5SXgbKiuLR8
         F8RIEBZgEo8qdE1MkOi59KSa80zVX4VZTSWiwXqrmAtE5vNU4eLXf9GKg91OiI+8YAfs
         rzS8eXp7QZB8n+CSHNSEdYpMErFtmTk2ecg0WIhKGffCfyaqxqUMAp7pLNooCi+D7fRr
         A/h91TPUJ0ST9DK++zRy77Mv/2ZbYUCTAjs88Cd/nB2oUf8f1RP1LcQZLxSDaqXcKQLT
         vbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697210815; x=1697815615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVJo6QC/TVwhbmxkRzSaC6qmFUL0H7BcuxMtCeQMIrE=;
        b=McP+M1Ev6wDh6RHUQqQYk0n9YvtnMnNf5tR2vHwdjmhjHwKx47bNxgRoH3dw+cSU+1
         NKNGNddsC7o6cKMNle6O4wM0HGY6yn8TZDRYOJ2397W32Hcza2e+DYJlKPIXYkgH5mqw
         nUu2uX3NtdZwMKblaJ2mLY7Cg3Dl1nwh7WnekgVv2o+1uP0VrM8goq92l4blLzmQq08v
         WIGMfK0s4zbzYk/YlAvk3bua+XjOjPl6ePBhPpSizJ+XMlnc+fa7ykg1oWUACsBjl6Jw
         q0+5Qr+BqBDrknv3HHQZeJfgImSK6C4KGx91R3KmMbRwyp/Co04+Z30PVLMfDdo5RYH+
         s4Ew==
X-Gm-Message-State: AOJu0YzXkrmB0uuHuINkZgYdHFE0IjY3/fJu2eKkaq5Pg3jhwhkVw3Zp
	q/H6jg07hFn4bZz458HvRzPGtyHjv46TuIcn564/IGwyrzpeapYo
X-Google-Smtp-Source: AGHT+IFYsWyTUX+5t5cwS+vwyVoFNesTkH3J4FzOe/C5uxbfzK1KkeWcK4xnEgE1hecdePCOa1p+qDNj6Gaw6SzJ/X8=
X-Received: by 2002:a05:651c:1a27:b0:2c5:d75:2b4c with SMTP id
 by39-20020a05651c1a2700b002c50d752b4cmr753023ljb.53.1697210815143; Fri, 13
 Oct 2023 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com> <20231012-geologist-ramp-71c76a4305c7@spud>
 <20231012-3dc2e811d6a57ffe90719d2a@orel> <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
 <20231012-unflawed-unison-cdb6921776c6@spud> <20231013-2f7672ff84aafb4b32143314@orel>
 <20231013-reattach-acre-0f878a04b80f@spud>
In-Reply-To: <20231013-reattach-acre-0f878a04b80f@spud>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 13 Oct 2023 08:26:19 -0700
Message-ID: <CALs-HsvSpuDu=3iSuuh993yqbKyq9Sv7FOcrJYyTjSMLeUB_Kw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_082659_670533_F35C4AB4 
X-CRM114-Status: GOOD (  33.37  )
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

T24gRnJpLCBPY3QgMTMsIDIwMjMgYXQgMTI6MznigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMTMsIDIwMjMgYXQgMDg6NDU6MzlBTSAr
MDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDY6
MDI6MzhQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxMiwg
MjAyMyBhdCAwOTo0MjozOUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiA+IE9uIFRo
dSwgT2N0IDEyLCAyMDIzIGF0IDk6MTHigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUsIE9jdCAxMiwgMjAy
MyBhdCAwMjo0NToxNFBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IE9u
IFdlZCwgT2N0IDExLCAyMDIzIGF0IDAzOjU2OjEzUE0gKzAyMDAsIEFuZHJldyBKb25lcyB3cm90
ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCj4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSwyNzYgQEAKPiA+ID4gPiA+ID4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gPiA+ID4gPiA+ICsv
Kgo+ID4gPiA+ID4gPiA+ICsgKiBUaGUgaHdwcm9iZSBpbnRlcmZhY2UsIGZvciBhbGxvd2luZyB1
c2Vyc3BhY2UgdG8gcHJvYmUgdG8gc2VlIHdoaWNoIGZlYXR1cmVzCj4gPiA+ID4gPiA+ID4gKyAq
IGFyZSBzdXBwb3J0ZWQgYnkgdGhlIGhhcmR3YXJlLiAgU2VlIERvY3VtZW50YXRpb24vcmlzY3Yv
aHdwcm9iZS5yc3QgZm9yIG1vcmUKPiA+ID4gPiA+ID4gPiArICogZGV0YWlscy4KPiA+ID4gPiA+
ID4gPiArICoKPiA+ID4gPiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDEyIFJlZ2VudHMgb2Yg
dGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ID4gPiA+ID4gPiA+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTQgRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNvbT4KPiA+ID4gPiA+ID4gPiAr
ICogQ29weXJpZ2h0IChDKSAyMDE3IFNpRml2ZQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTbyB1
aCwgdGhpcyBpcyBhbGwgbmV3KGlzaCkgY29kZSwgb3JpZ2luYWxseSB3cml0dGVuIGxhc3QgU2Vw
dGVtYmVyLAo+ID4gPiA+ID4gPiB0aGF0IGlzIGJlaW5nIG1vdmVkLCByaWdodD8KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBZZWFoLCBJIGp1c3QgcHVsbGVkIHRoZSBDb3B5cmlnaHRzIG92ZXIgYnkgc3Rh
bmRhcmQgcHJhY3RpY2Ugb2YgY29kZQo+ID4gPiA+ID4gbW92ZW1lbnQsIGJ1dCBJIGFncmVlIHRo
ZXkgZG9uJ3QgbWFrZSBtdWNoIHNlbnNlIGZvciB0aGUgY29kZSBJIG1vdmVkLgo+ID4gPiA+ID4g
SSBzdWNrIGF0IGNvcHlyaWdodCBtYW5hZ2VtZW50IGFuZCB3b3VsZCBiZSBoYXBweSBmb3Igc3Vn
Z2VzdGlvbnMgaGVyZS4KPiA+ID4gPiA+IElmIFJpdm9zIHdvdWxkIGxpa2UgdG8gcHV0IG9uZSBo
ZXJlIGZvciB0aGUgd29yayBFdmFuIGRpZCwgdGhlbiBJJ2xsIGJlCj4gPiA+ID4gPiBoYXBweSB0
byBhZGQgaXQuIE9yLCBpZiBwZW9wbGUgcHJlZmVyLCBJIGNvdWxkIGFkZCBhIFZlbnRhbmEgY29w
eXJpZ2h0Lgo+ID4gPiA+Cj4gPiA+ID4gSSBwcm9iYWJseSB3b3VsZCBoYXZlIHN0dWNrIGEgUml2
b3MgYmFubmVyIG9uIGl0IGlmIEkgaGFkIHdyaXR0ZW4gaXQKPiA+ID4gPiBhcyBhIG5ldyBmaWxl
IG15c2VsZiwgYXMgSSB0aGluayB0aGV5ICJvd24iIHRoZSB3b3JrIEkgZG8uIEJ1dCBpdCBhbGwg
ZmVlbHMKPiA+ID4gPiBhIGJpdCBsaWtlIHZhbml0eSBsaWNlbnNlIHBsYXRlcyBnaXZlbiBpdCdz
IEdQTCwgc28gSSBpbWFnaW5lIHdoYXRldmVyCj4gPiA+ID4geW91IGRvIHdpbGwgZ2V0IG5vIHJl
YWwgY29tcGxhaW50cy4KPiA+ID4KPiA+ID4gQXllLCB0aGF0J3MgaG93IEkgc2VlIGl0IHRvby4g
SSd2ZSBub3QgYm90aGVyZWQgYWRkaW5nIHRoYXQgc3R1ZmYgd2hlcmUKPiA+ID4gSSBjb3VsZCBo
ZWxwIGl0LiBUaGUgZ2l0IGhpc3Rvcnkgc2hvd3Mgd2hvIG1hZGUgY29weXJpZ2h0YWJsZSBjaGFu
Z2VzIHRvCj4gPiA+IHRoZSBmaWxlIGFueXdheSwgYnV0IG9idi4gSSBhbSBubyBsYXd5ZXIuCj4g
PiA+IEp1c3QgaW4gdGhpcyBjYXNlLCBzaW5jZSBhcyBmYXIgYXMgSSBjb3VsZCB0ZWxsIHRoaXMg
Y29kZSB3YXMgd3JpdHRlbgo+ID4gPiBmcm9tIExQQyBvbndhcmRzLCBpdCBtYWRlIGxpdHRsZSBz
ZW5zZSB0byBjb3B5IG92ZXIgc29tZSAyMDEyIGVyYQo+ID4gPiBjb3B5cmlnaHQgaW5mb3JtYXRp
b24uCj4gPiA+Cj4gPgo+ID4gU28gd2hhdCdzIHRoZSBmaW5hbCBwbGFuPyBJIGZlZWwgYSBiaXQg
c3RyYW5nZSBhZGRpbmcgYSBSaXZvcyBjb3B5cmlnaHQKPiA+IHdoaWxlIGNvcHlpbmcgdGhlIFJp
dm9zIGNvZGUgb3ZlciBzaW5jZSBJIGRvbid0IGNvbnNpZGVyIG15c2VsZgo+ID4gImF1dGhvcml6
ZWQiIHRvIGRvIHNvLgo+Cj4gVGhleSBkaWRuJ3QgYWRkIG9uZSB3aGVuIHRoZXkgbWFkZSB0aGUg
Y2hhbmdlcywgc28gSSB3b3VsZG4ndC4KPgo+ID4gSSBhbHNvIGRvbid0IHdhbnQgdG8gYWRkIGEg
VmVudGFuYSBvbmUgZm9yIGp1c3QKPiA+IGNvZGUgbW92ZW1lbnQuIERvIHdlIG5lZWQgYSBjb3B5
cmlnaHQgb24gdGhpcyBmaWxlIGF0IGFsbD8gU2hvdWxkIEkgbW92ZQo+ID4gaXQgd2l0aG91dCBh
bnl0aGluZyBhbmQgdGhlbiBhZGQgYSBWZW50YW5hIGNvcHlyaWdodCB3aGVuIGFkZGluZyB0aGUK
PiA+IHdoaWNoLWNwdXMgc3R1ZmY/Cj4KPiBJIHdvdWxkIG1vdmUgaXQgd2l0aG91dCBhbnl0aGlu
Zy4KPiBBcG9sb2dpZXMgZm9yIGRlcmFpbGluZyB0aGluZ3Mgd2l0aCBjb3B5cmlnaHQgbm90aWNl
IGNyYXAgOi8KCldvcmtzIGZvciBtZSwgdG9vLgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
