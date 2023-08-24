Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E9C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS1H/QcpGxAe4SE1wHf3T4MPAuaB1TjIAjLRxbfmJps=; b=xhrfJYMGVOUMy7
	QbLm6VZmSJPoD/QLOKxEubEUxd8ZoM5rdrqMM3pvEDxGIfZMEsB2UTVFXDwptlAu7nYPeDwPcQ1C7
	FSnEgswIy+2AUhKC1cm4FWYcBuRqXcVzgh1DnmNp96f1hmXGGne1cxUELDeqFepwesVOvk2Y9ysHB
	dCqXqU66Ja2lRMpxMV8BT8jpfZCRcJQIqOrprK3NzRmq0DrVhbLXHdj0nSQTBM72FO22e4M6cz/wH
	3gOZspuNuwv1qXKCparO/byMGmD05alBDkq98DniI7NXJIsPWTUsemdBmX31cpYtGSxHSUGge1yd6
	SJT04Tuzstw1HKm4uGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZD34-003RPa-24;
	Thu, 24 Aug 2023 16:19:06 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZD31-003RNc-13
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 16:19:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso10724018e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692893933; x=1693498733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcpmQIaJ3WGITlP80o7lHc82w8Vh9jMV1bqtDZL9154=;
        b=EXC13LqUOvbmnTJi9XvsU0ESFZpGRpEMW2KS6mmLkv4VGq3dGCVVWm62daPHEtxbhF
         Yk3fnUdtvTNpUJFHCg5dJDJY8qbDEpBiUDyuZ4ApwIuAJWGOCJ68pK5c5L7JY/WUQLlA
         S6qGHoMSvGwzwibAIpi5/Ma9NlIV0a3aaoYkhr82KOX4WO9tTTgGxXdZj4m96CCxIgdP
         DA4hS3gYlE/8wuKGA5Z1ZMuWdu5eXpnJQDu8Gu88MnmA0tnbXkv1/XaXMJoRQfhGAzqp
         i7JuHAKICWjJMNpf9Ia+itwQZU1MdidAyging9RnU9E267f7yRNndGIfIlLyaxIRf0G1
         iNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692893933; x=1693498733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcpmQIaJ3WGITlP80o7lHc82w8Vh9jMV1bqtDZL9154=;
        b=NscSgrxZZZZCF+wgDJuGS/No/1A+tk7CFxL90WEg5BLtQmgPuxhr55o8LgkgWJadJJ
         72E3qh2Mf6o/H33wgbGgkXzuuPlXviu45fdC7howL/HGIIGWNRFteG4GDSOlYliQtScI
         EqQQ/hPO+cmbQzp9J929j3IP+WnUlcWe/v/vKq3COpbFGOZDHKaH8alxFFSDN3+LcetJ
         eOXaxpNpZxbjeNVj/IvZGraCReIGFfizAp2w9wcP6P4UFp2ode0jeljKixx2MPC2M58O
         wOoabGi9eo4Zg6d+hQTqJnlPnmFylOlXtlw84o31RB1UEVUlwEISOTluZSPHXxsjVhYr
         HOMA==
X-Gm-Message-State: AOJu0YzFCmsB35izmDMyq1NUamA02M68WOMArm+u8qZ/3GmBAJvSOdFW
	jw46TZyI7AijOuyaAN2hzIJx+SbrGauhBGr/IJ6M5g==
X-Google-Smtp-Source: AGHT+IFXb5yl9r0LvHVcSGU9TSK5ahTYdOzq873cOHNvKn7t08c6orKmlryauqOU6ndYqyidDX00WvT7bPnvGMaG1A4=
X-Received: by 2002:a19:5f19:0:b0:4ff:9a75:2106 with SMTP id
 t25-20020a195f19000000b004ff9a752106mr10946461lfb.39.1692893932613; Thu, 24
 Aug 2023 09:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230824-factual-jawed-2dddd2cf2bdd@wendy>
In-Reply-To: <20230824-factual-jawed-2dddd2cf2bdd@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 24 Aug 2023 09:18:16 -0700
Message-ID: <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_091903_602663_C3D6F8AE 
X-CRM114-Status: GOOD (  30.51  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNToyMOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMDE6
MTg6MzBQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IEluIC9wcm9jL2NwdWluZm8sIG1v
c3Qgb2YgdGhlIGluZm9ybWF0aW9uIHdlIHNob3cgZm9yIGVhY2ggcHJvY2Vzc29yIGlzCj4gPiBz
cGVjaWZpYyB0byB0aGF0IGhhcnQ6IG1hcmNoaWQsIG12ZW5kb3JpZCwgbWltcGlkLCBwcm9jZXNz
b3IsIGhhcnQsCj4gPiBjb21wYXRpYmxlLCBhbmQgdGhlIG1tdSBzaXplLiBCdXQgdGhlIElTQSBz
dHJpbmcgZ2V0cyBmaWx0ZXJlZCB0aHJvdWdoIGEKPiA+IGxvd2VzdCBjb21tb24gZGVub21pbmF0
b3IgbWFzaywgc28gdGhhdCBpZiBvbmUgQ1BVIGlzIG1pc3NpbmcgYW4gSVNBCj4gPiBleHRlbnNp
b24sIG5vIENQVXMgd2lsbCBzaG93IGl0Lgo+ID4KPiA+IE5vdyB0aGF0IHdlIHRyYWNrIHRoZSBJ
U0EgZXh0ZW5zaW9ucyBmb3IgZWFjaCBoYXJ0LCBsZXQncyByZXBvcnQgSVNBCj4gPiBleHRlbnNp
b24gaW5mbyBhY2N1cmF0ZWx5IHBlci1oYXJ0IGluIC9wcm9jL2NwdWluZm8uIFdlIGNhbm5vdCBj
aGFuZ2UKPiA+IHRoZSAiaXNhOiIgbGluZSwgYXMgdXNlcm1vZGUgbWF5IGJlIHJlbHlpbmcgb24g
dGhhdCBsaW5lIHRvIHNob3cgb25seQo+ID4gdGhlIGNvbW1vbiBzZXQgb2YgZXh0ZW5zaW9ucyBz
dXBwb3J0ZWQgYWNyb3NzIGFsbCBoYXJ0cy4gQWRkIGEgbmV3ICJoYXJ0Cj4gPiBpc2EiIGxpbmUg
aW5zdGVhZCwgd2hpY2ggcmVwb3J0cyB0aGUgdHJ1ZSBzZXQgb2YgZXh0ZW5zaW9ucyBmb3IgdGhh
dAo+ID4gaGFydC4gVGhpcyBtYXRjaGVzIHdoYXQgaXMgcmV0dXJuZWQgaW4gcmlzY3ZfaHdwcm9i
ZSgpIHdoZW4gcXVlcnlpbmcgYQo+ID4gZ2l2ZW4gaGFydC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPgo+ID4gLS0tCj4gPgo+ID4gQ2hh
bmdlcyBpbiB2NDoKPiA+ICAtIERvY3VtZW50YXRpb246IE1hZGUgdGhlIHVuZGVybGluZSBtYXRj
aCB0aGUgdGV4dCBsaW5lIChDb25vcikKPiA+ICAtIERvY3VtZW50YXRpb246IGhhbmdlZCAiaW4g
cXVlc3Rpb24iIHRvICJiZWluZyBkZXNjcmliZWQiIChBbmRyZXcpCj4gPgo+ID4gQ2hhbmdlcyBp
biB2MzoKPiA+ICAtIEFkZCBzb21lIGRvY3VtZW50YXRpb24gKENvbm9yKQo+ID4KPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiAgLSBBZGRlZCBuZXcgImhhcnQgaXNhIiBsaW5lIHJhdGhlciB0aGFuIGFs
dGVyaW5nIGJlaGF2aW9yIG9mIGV4aXN0aW5nCj4gPiAgICAiaXNhIiBsaW5lIChDb25vciwgUGFs
bWVyKQo+ID4KPiA+Cj4gPiBJIGJhc2VkIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBDb25vcidzIHJp
c2N2LWV4dGVuc2lvbnMtc3RyaW5ncyBicmFuY2gKPiA+IGZyb20gSnVseSAzcmQsIHNpbmNlIG90
aGVyd2lzZSB0aGlzIGNoYW5nZSBnZXRzIGhvcGVsZXNzbHkgZW50YW5nbGVkCj4gPiB3aXRoIHRo
YXQgc2VyaWVzLgo+ID4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvdWFiaS5yc3Qg
fCAxMCArKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICB8IDIyICsr
KysrKysrKysrKysrKysrKy0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlz
Y3YvdWFiaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3VhYmkucnN0Cj4gPiBpbmRleCA4OTYw
ZmFjNDJjNDAuLmFmZGRhNTgwZTVhMiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vcmlz
Y3YvdWFiaS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvdWFiaS5yc3QKPiA+IEBA
IC00Miw2ICs0MiwxNiBAQCBBbiBleGFtcGxlIHN0cmluZyBmb2xsb3dpbmcgdGhlIG9yZGVyIGlz
OjoKPiA+Cj4gPiAgICAgcnY2NGltYWRjX3ppZm9vX3ppZ29vX3phZm9vX3NiYXJfc2Nhcl96eG1i
YXpfeHF1eF94cnV4Cj4gPgo+ID4gKyJpc2EiIHZzICJoYXJ0IGlzYSIgbGluZXMgaW4gL3Byb2Mv
Y3B1aW5mbwo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gKwo+ID4gK1RoZSAiaXNhIiBsaW5lIGluIC9wcm9jL2NwdWluZm8gZGVzY3JpYmVzIHRoZSBs
b3dlc3QgY29tbW9uIGRlbm9taW5hdG9yIG9mCj4gPiArUklTQy1WIElTQSBleHRlbnNpb25zIHVu
ZGVyc3Rvb2QgYnkgdGhlIGtlcm5lbCBhbmQgaW1wbGVtZW50ZWQgb24gYWxsIGhhcnRzLiBUaGUK
PiA+ICsiaGFydCBpc2EiIGxpbmUsIGluIGNvbnRyYXN0LCBkZXNjcmliZXMgdGhlIHNldCBvZiBl
eHRlbnNpb25zIHVuZGVyc3Rvb2QgYnkgdGhlCj4gPiAra2VybmVsIG9uIHRoZSBwYXJ0aWN1bGFy
IGhhcnQgYmVpbmcgZGVzY3JpYmVkLCBldmVuIGlmIHRob3NlIGV4dGVuc2lvbnMgbWF5IG5vdAo+
ID4gK2JlIHByZXNlbnQgb24gYWxsIGhhcnRzIGluIHRoZSBzeXN0ZW0uIFRoZSAiaGFydCBpc2Ei
IGxpbmUgaXMgY29uc2lzdGVudCB3aXRoCj4gPiArd2hhdCdzIHJldHVybmVkIGJ5IF9fcmlzY3Zf
aHdwcm9iZSgpIHdoZW4gcXVlcnlpbmcgZm9yIHRoYXQgc3BlY2lmaWMgQ1BVLgo+Cj4gVGhpbmtp
bmcgYWJvdXQgdGhpcyBhZ2FpbiwgSSBkb24ndCB0aGluayB0aGlzIGlzIHRydWUuIGh3cHJvYmUg
dXNlcwo+IGhhc19mcHUoKSwgaGFzX3ZlY3RvcigpIGV0YyB0aGF0IGludGVyYWN0IHdpdGggS2Nv
bmZpZyBvcHRpb25zIGJ1dCB0aGUKPiBwZXJjcHUgaXNhIGJpdG1hcCBpc24ndCBhZmZlY3RlZCBi
eSB0aGVzZS4KClVnaCB5ZWFoIGl0J3Mga2luZCBvZiBhIG1pc2htYXNoIGlzbid0IGl0LiBod3By
b2JlX2lzYV9leHQwKCkgdXNlcyB0aGUKbG93ZXN0IGNvbW1vbiBkZW5vbWluYXRvciBmb3IgRkQs
IEMsIFYsIGJ1dCBwZXItaGFydCBpbmZvIGZvcgpaYmEsWmJiLFpicy4gR2l2ZW4gdGhlIGludGVy
ZmFjZSwgcGVyLWhhcnQgaW5mbyBzZWVtcyBsaWtlIHdoYXQgd2UKc2hvdWxkIGhhdmUgZG9uZSB0
aGVyZSwgYW5kIHRoZSBGRCwgQywgYW5kIFYgd2VyZSBteSBiYWQuIFRoZSBnb29kCm5ld3MgaXMg
d2UgY2FuIGRlZmluZSBuZXcgYml0cyB0aGF0IGRvIHRoZSByaWdodCB0aGluZywgdGhvdWdoIG1h
eWJlCndlIHNob3VsZCB3YWl0IHVudGlsIHNvbWVvbmUgYWN0dWFsbHkgd2FudHMgdGhlbS4gRm9y
IHRoaXMgcGF0Y2ggd2UKc2hvdWxkIGp1c3QgcmVtb3ZlIHRoaXMgc2VudGVuY2UuIFdlIGNhbiBh
bHNvIGNvcnJlY3QgdGhlCmRvY3VtZW50YXRpb24gaW4gaHdwcm9iZSB0byBtZW50aW9uIHRoZSBz
aG9ydGNvbWluZyBpbiBGRCxDLFYuCgpQYWxtZXIsIGRvIHlvdSB3YW50IGEgc3BpbiBvZiB0aGlz
IHBhdGNoIG9yIGEgZm9sbG93dXAgb24gdG9wIHRvCnJlbW92ZSB0aGUgYWJvdmUgc2VudGVuY2U/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
