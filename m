Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11409C02182
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+uPahv2GfCa0MjCjHBRQOcJeoqLT+hujbXcooxBH2A=; b=pjfiMqD1gIclaH
	rgrqXdVNdvGGq/mpOSXEDZfMMTLN1ET8Iiu86aLQuiZ+AuDbUkkTRqk3XkwRNT81mAa93/wfjp0fR
	ucyajuVu10cL1ets+CeOPL5d8/J/0AzNCjgHx8hatr6YipSv/vgXUis86RfdSCN9WGdjG8kAoRrFT
	V4mkWxkaRbhkL38QmKk1T7HNaPukM1YXkddte+0UcWedVRdeHubb40+QUrFkdfGqT7oLRc4kiuMT2
	JMD7ast78k0bFepmIlC9MaQ+axduCoghTtyy2tN9XEb5jfWsWAfIvsux1g/XQevTF4hBtAZWjHKAZ
	Q7iT8LxlugV7ZFfz/OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuV7-00000005yuk-17kn;
	Mon, 20 Jan 2025 16:19:45 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuV5-00000005yuP-1O28
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:19:44 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5fa2685c5c0so2089471eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737389982; x=1737994782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T/dIQ467Pa8ZD5wlg+bKAWEAxn3LDzHlpZLZ1k1N6w=;
        b=PK/Vxhq3fidBYhi1p8N3PypUfQVFPzEXeu/ly4vTc2w8dhb8mLC5diciR7wvpZ3I/9
         pDzwRrvWd7i3gGgu16fxLev2bYa+DR/AnQtvbw6lyZX/BhGM4T/UpYQHgXwVFOQSWvpo
         3TPjVSxvz/xfMVZgyMUbv1r0PQLmnADkxtc1tYQxLG9VNZIDThuURrnwn2NdUJultWep
         3sNv6U3GtM+8ll5nnkfeW+3ZuBUFQ+z7/Zu2XWn05uZpB5XMOmVT4w5kSIiwTp3RS+K3
         M6+obPPxsuUDC1kA1dyJDqTqcKWRRKSpmiZjHzBWY9637UnjPXZna/p90KJeNsAsbBCr
         uoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737389982; x=1737994782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T/dIQ467Pa8ZD5wlg+bKAWEAxn3LDzHlpZLZ1k1N6w=;
        b=qmYGLiRXAWgnanQFcQtUIZ8Hq9kNwqI8/16VyIW+FfsR57+hzeSSXgJIOHyIRFdI2P
         Cv7dZ3gol9xw+Z4LszyWLcVrqXpPDKEVTGFzYvQmeccDAMcVos86FKQxNJ4qoXh2Snhb
         y4MYZBT5a3IR+xSBOKkVcohJ7a8EpPX7j+8E1sKl6YEeoG1z8vbaGCxMP4H41OyiTlvI
         WRXenNDtmUF0Oo6nyRDhLAraTYtLx5mAHPskLYA2GMLm+Cc53oNF/cAQ3JsxdFKJbtTq
         gmwscC8IVStpw3jrVeIB3dQBj5Zz6ikBZJYoH+nx7SJSMxFXcvkojQeSKizbR1gDqMoX
         lR/w==
X-Forwarded-Encrypted: i=1; AJvYcCWNFtL/dwAU/tahFnwoxWxZOzzXdUAlLhM2XRAvtnNXv+orUe/v12Q9IGznHyCWyk/oAMSAGqHgvVWm6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8Ll0V55mXbGfA9+oOO/lcsXOJHu7W+Rn/oWfJvBxQ9R9xGcq
	wDdQavE6w7r/XC6hYqbejV/zVcgd59/2eyG73gbMpO6BWrnh31uo2qJkKlaXqMcvHgDO9FLP+er
	txSoYhE4a8l4Ds3vW+e+TezaH0MLIkamF
X-Gm-Gg: ASbGnctYpQ/9BtTCQa3Tp8/IlzYwdNlUEJhZE3/P/n+z6ydu7rh3OlRf/a5ivKYxw2z
	CUGKvqUAeV52ExAVJRSWi9YaBJ6HUlvDx7cWFwKrGgBLqnS2v0i4M
X-Google-Smtp-Source: AGHT+IHnTLKJ1iOMm82p/HqF4s1+0fn4hSD8bTysYRk+SmjK8L03MIUhxh/1RPy0nrzKuIVkAqZW1U4p7MaKhWJ4pH4=
X-Received: by 2002:a05:6871:2281:b0:29e:34dc:b0 with SMTP id
 586e51a60fabf-2b1c0c541e8mr6969151fac.25.1737389981709; Mon, 20 Jan 2025
 08:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com> <20250120121955.GA3525889@ax162>
In-Reply-To: <20250120121955.GA3525889@ax162>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 20 Jan 2025 10:19:30 -0600
X-Gm-Features: AbW1kvZJgYzNR41b1_Dbh5-5hRR8Qhmy3g3DVfFUVOvzlrzH8EQEW5RnW27gQHM
Message-ID: <CABb+yY0jbBzhgGEo2wTczF14ndOa2=Bcs6FE8BjLt4icWcxAmw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com, 
	conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_081943_367646_F87450AE 
X-CRM114-Status: GOOD (  19.74  )
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

T24gTW9uLCBKYW4gMjAsIDIwMjUgYXQgNjoyMOKAr0FNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBKYXNzaSwKPgo+IE9uIFR1ZSwgRGVjIDE3LCAy
MDI0IGF0IDExOjMxOjMwQU0gKzAwMDAsIFZhbGVudGluYSBGZXJuYW5kZXogd3JvdGU6Cj4gLi4u
Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNaWNyb2NoaXAgSW50ZXItUHJv
Y2Vzc29yIENvbW11bmljYXRpb24KPiA+IChJUEMpIG1haWxib3ggZHJpdmVyLgo+IC4uLgo+ID4g
VmFsZW50aW5hIEZlcm5hbmRleiAoNCk6Cj4gPiAgIHJpc2N2OiBzYmk6IHZlbmRvcmlkX2xpc3Q6
IEFkZCBNaWNyb2NoaXAgVGVjaG5vbG9neSB0byB0aGUgdmVuZG9yIGxpc3QKPiA+ICAgcmlzY3Y6
IGV4cG9ydCBfX2NwdWlkX3RvX2hhcnRpZF9tYXAKPiA+ICAgZHQtYmluZGluZ3M6IG1haWxib3g6
IGFkZCBiaW5kaW5nIGZvciBNaWNyb2NoaXAgSVBDIG1haWxib3ggY29udHJvbGxlcgo+ID4gICBt
YWlsYm94OiBhZGQgTWljcm9jaGlwIElQQyBzdXBwb3J0Cj4KPiBJIHNlZSB0aGlzIHNlcmllcyBp
cyBub3cgaW4gbmV4dC0yMDI1MDEyMCBidXQgeW91IG9ubHkgYXBwbGllZCBwYXRjaGVzIDMKPiBh
bmQgNCwgc28gdGhlIGJ1aWxkIGlzIGJyb2tlbjoKPgo+ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1jaHAtaXBjLXNiaS5jOjIyOgo+ICAgZHJpdmVycy9t
YWlsYm94L21haWxib3gtbWNocC1pcGMtc2JpLmM6IEluIGZ1bmN0aW9uICdtY2hwX2lwY19zYmlf
Y2hhbl9zZW5kJzoKPiAgIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1jaHAtaXBjLXNiaS5jOjI5
OjQyOiBlcnJvcjogJ01JQ1JPQ0hJUF9WRU5ET1JfSUQnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQo+ICAgICAgMjkgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE1JQ1JPQ0hJUF9WRU5ET1JfSUQpCj4gICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaDo0MzY6NTY6IG5vdGU6IGluIGRlZmluaXRpb24gb2Yg
bWFjcm8gJ3NiaV9lY2FsbCcKPiAgICAgNDM2IHwgICAgICAgICAgICAgICAgIF9fc2JpX2VjYWxs
KGEwLCBhMSwgYTIsIGEzLCBhNCwgYTUsIGYsIGUpCj4gICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICBkcml2ZXJzL21h
aWxib3gvbWFpbGJveC1tY2hwLWlwYy1zYmkuYzoxMjE6MjU6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyAnU0JJX0VYVF9NSUNST0NISVBfVEVDSE5PTE9HWScKPiAgICAgMTIxIHwgICAgICAg
ICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9NSUNST0NISVBfVEVDSE5PTE9HWSwgY29tbWFuZCwg
Y2hhbm5lbCwKPiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+ICAgZHJpdmVycy9tYWlsYm94L21haWxib3gtbWNocC1pcGMtc2Jp
LmM6Mjk6NDI6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9u
bHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gICAgICAyOSB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUlDUk9DSElQX1ZFTkRPUl9JRCkK
PiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+Cj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oOjQzNjo1Njog
bm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyAnc2JpX2VjYWxsJwo+ICAgICA0MzYgfCAgICAg
ICAgICAgICAgICAgX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgYTMsIGE0LCBhNSwgZiwgZSkKPiAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPiAgIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1jaHAtaXBjLXNiaS5jOjEyMToy
NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdTQklfRVhUX01JQ1JPQ0hJUF9URUNITk9M
T0dZJwo+ICAgICAxMjEgfCAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX01JQ1JPQ0hJ
UF9URUNITk9MT0dZLCBjb21tYW5kLCBjaGFubmVsLAo+ICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICBkcml2ZXJzL21haWxi
b3gvbWFpbGJveC1tY2hwLWlwYy1zYmkuYzogSW4gZnVuY3Rpb24gJ21jaHBfaXBjX3NiaV9zZW5k
JzoKPiAgIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1jaHAtaXBjLXNiaS5jOjI5OjQyOiBlcnJv
cjogJ01JQ1JPQ0hJUF9WRU5ET1JfSUQnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKQo+ICAgICAgMjkgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE1JQ1JPQ0hJUF9WRU5ET1JfSUQpCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaDo0MzY6NTY6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ3Ni
aV9lY2FsbCcKPiAgICAgNDM2IHwgICAgICAgICAgICAgICAgIF9fc2JpX2VjYWxsKGEwLCBhMSwg
YTIsIGEzLCBhNCwgYTUsIGYsIGUpCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICBkcml2ZXJzL21haWxib3gvbWFp
bGJveC1tY2hwLWlwYy1zYmkuYzoxMzQ6MjU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAn
U0JJX0VYVF9NSUNST0NISVBfVEVDSE5PTE9HWScKPiAgICAgMTM0IHwgICAgICAgICByZXQgPSBz
YmlfZWNhbGwoU0JJX0VYVF9NSUNST0NISVBfVEVDSE5PTE9HWSwgY29tbWFuZCwgYWRkcmVzcywK
PiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+ICAgZHJpdmVycy9tYWlsYm94L21haWxib3gtbWNocC1pcGMtc2JpLmM6IEluIGZ1
bmN0aW9uICdtY2hwX2lwY19wcm9iZSc6Cj4gICBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tY2hw
LWlwYy1zYmkuYzoyOTo0MjogZXJyb3I6ICdNSUNST0NISVBfVkVORE9SX0lEJyB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiAgICAgIDI5IHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNSUNST0NISVBfVkVORE9SX0lEKQo+ICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAgIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1jaHAtaXBjLXNiaS5jOjQyMDozNTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdTQklfRVhUX01JQ1JPQ0hJUF9URUNITk9MT0dZ
Jwo+ICAgICA0MjAgfCAgICAgICAgIHJldCA9IHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9N
SUNST0NISVBfVEVDSE5PTE9HWSk7Cj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBDYW4geW91IHBsZWFz
ZSBmaXggdGhpcz8gSXQgaXMgYSBsaXR0bGUgZnJ1c3RyYXRpbmcgdGhpcyBpcyBoYXBwZW5pbmcK
PiBqdXN0IGFzIHRoZSBtZXJnZSB3aW5kb3cgb3BlbnMuLi4KPgpVc3VhbGx5IHRoZSBwbGF0Zm9y
bSBzcGVjaWZpYyBzdHVmZiBnb2VzIHZpYSB0aGUgcGxhdGZvcm0gdHJlZSwgZm9yCmV4YW1wbGUg
dGhlcmUgaXNuJ3QgYW55dGhpbmcgJ21haWxib3gnIGFib3V0IE1JQ1JPQ0hJUF9WRU5ET1JfSUQg
YW5kCl9fY3B1aWRfdG9faGFydGlkX21hcC4KSSBwaWNrIG9ubHkgbWFpbGJveCBwYXRjaGVzIHVu
bGVzcyB0aGUgbWFpbnRhaW5lciBhY2tzIGFuZCB3YW50cyBtZSB0bwpwaWNrIHBsYXRmb3JtIG9u
ZXMuIFRob3VnaCBJIHNob3VsZCBoYXZlIG5vdGVkIHRoYXQgSSBhbSBwaWNraW5nIG9ubHkKbWFp
bGJveCBzdHVmZiwgYnV0IG9rIEkgd2lsbCBxdWV1ZSB0aGVtIG5vdy4KVGhueAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
