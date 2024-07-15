Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E029C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAEVmPGbWdZuTJiYpXVKbJiZkd+yy/KgoAoQV24e6nY=; b=iNYAj428Dh14/W
	Ryleg6czAr/RJKn4+AV/asg3DlZxDnx04YlrKIAnYTTZKr070Nf3AMaC3ukOhZt/vuq8mrkP5cr0v
	W9hWlQPgsm394TmRlwsf46Xqt1QGGQHD5wRtV4Es8C6qCTmaQrxHIJbp6fqJYDUTh04NwnVtsQbDj
	NlNHUe81OYL017v3jsfB3VNwcOpnsE7hQgZ2J+OmzxN+MJKPOfpeOaTTMcVJDJmfEfdFMvYtuReLX
	wZgu5SvaR/5Pai6yD88vLsM6oH3Swacsk7kh45kLSJu8fV+UJ8zB3xaZlmoGO+otHipG0UzlFOsUZ
	57H0lx3K4Pyr3ikkf2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTGp3-00000006HNd-49t9;
	Mon, 15 Jul 2024 08:12:38 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTGp0-00000006HMs-10Rm
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 08:12:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a797c62565aso418937566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721031152; x=1721635952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03jWWWCVzc5/LJdqyioI99prKjte6wH3TiKjV7DS5tM=;
        b=Adm7++hUJbghJAd6YGjBTFk9UKo8/E3I7Bn+u9eDkLmQeNSem8pJ3OdEYveTAjXDoQ
         z9gnjwkIqv2M9Pcv8W+D3cC2cfT/iZLKYm50F5ooRjiZ5cXFX0j90wcRqAbU/bAu5ls2
         MqM6xhQkZ2lXnuehNa7lR2nLDHl0JPjnAeSLDh140HSoEfCEBpLua1AOAdBK+Kl5bNc6
         ao7Ihs/WSrCCAc4cSMXq4/N21flDQ1znLKQxHIG/W1S9/X7ebTRCxH5lU1hMpcYPG9BZ
         yyw+VssbAYhLSCMY38sBGnPzsUuC/xpMV2spIRQ2QiGELdAWZ7FjcIV3U6PdQyATRFQJ
         u7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031152; x=1721635952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03jWWWCVzc5/LJdqyioI99prKjte6wH3TiKjV7DS5tM=;
        b=tUUAAYgvMS1PI/RvPzH1YnWheO63EJoE1Q7zyj9gl4318VHM2z28g74azY7Rq9vNGe
         sDFHZMypx+XaXbJN5RAD+njm9qpYd58RHkW3J6gg4zr8GNEpU+53QPV5HHrXWIclRxqx
         kCKztWGgZr1ABw1nb8z0LFXUdZHs7HjasnBWbxSQO7Gly3ElFD9u5QiqisZ5jE4X82HX
         X7vfTRVCHsZepDVBxQxnoL9nz6xqJfGBrWC+aL+iu6TKL4iqKYn/eLq/6YEKsaVwYr/T
         Nf5yD5rDpfzkkPpT6Zq9M7ZA0iqGd2hHUApBwZgLgXA8dK0I68F5hCpMWTDEzJj9K3ok
         JnCA==
X-Forwarded-Encrypted: i=1; AJvYcCXwtBla0JeemVmu8uJBoVlogKJ1I4+nK9Jolx+Wz4In2rDep0wCAxCwsJnU3v2sE2gQ3grhzPXr5SGzp6AnCM50yjag+tG3kAzMEq5Zxjer
X-Gm-Message-State: AOJu0YzKJZz5CJSKxSR3J9ttfKIHD/9HnsFe0Ok/a4X/MpgfzFBbQs60
	kkaW+ndOXw7BRgg00N4u1VtXtEuj/8EWsRH6kZnkbCkQ4YudZrWTl9plkKR1Zasf8refwb9obNY
	0uB6CT5yfWkMHKaPWWGsLB3K3MMoxzeskLo5wsw==
X-Google-Smtp-Source: AGHT+IFAM/JbPKSHGtXJzUtImNJqPcsuIujR27+IbnzngqO96PYEia8kBR8MYr6ACsxPM+BKbwLFE6qk68WRrNEudhw=
X-Received: by 2002:a17:906:66c9:b0:a77:cf9d:f497 with SMTP id
 a640c23a62f3a-a780b70513emr1187421166b.40.1721031152552; Mon, 15 Jul 2024
 01:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240624082141.153871-1-alexghiti@rivosinc.com> <CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com>
In-Reply-To: <CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 15 Jul 2024 10:12:21 +0200
Message-ID: <CAHVXubicJ=g_vXWUh+uGbv00X0gnn24J3SCaU4PhRD-1ZReY8g@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after
 patching to avoid illegal insns
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_011234_302678_F25F339D 
X-CRM114-Status: GOOD (  25.76  )
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

SGkgR2VlcnQsCgpPbiBUdWUsIEp1bCA5LCAyMDI0IGF0IDEwOjEz4oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBBbGV4YW5kcmUsCj4K
PiBPbiBNb24sIEp1biAyNCwgMjAyNCBhdCAxMDoyM+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiBXZSBjYW5ub3QgZGVsYXkgdGhlIGljYWNo
ZSBmbHVzaCBhZnRlciBwYXRjaGluZyBzb21lIGZ1bmN0aW9ucyBhcyB3ZSBtYXkKPiA+IGhhdmUg
cGF0Y2hlZCBhIGZ1bmN0aW9uIHRoYXQgd2lsbCBnZXQgY2FsbGVkIGJlZm9yZSB0aGUgaWNhY2hl
IGZsdXNoLgo+ID4KPiA+IFRoZSBvbmx5IHdheSB0byBjb21wbGV0ZWx5IGF2b2lkIHN1Y2ggc2Nl
bmFyaW8gaXMgYnkgZmx1c2hpbmcgdGhlIGljYWNoZQo+ID4gYXMgc29vbiBhcyB3ZSBwYXRjaCBh
IGZ1bmN0aW9uLiBUaGlzIHdpbGwgcHJvYmFibHkgYmUgY29zdGx5IGFzIHdlIGRvbid0Cj4gPiBi
YXRjaCB0aGUgaWNhY2hlIG1haW50ZW5hbmNlIGFueW1vcmUuCj4gPgo+ID4gRml4ZXM6IDZjYTQ0
NWQ4YWYwZSAoInJpc2N2OiBGaXggZWFybHkgZnRyYWNlIG5vcCBwYXRjaGluZyIpCj4gPiBSZXBv
cnRlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA2MTMtbHVicmlj
YW50LWJyZWF0aC0wNjExOTJhOTQ4OWFAd2VuZHkvCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgZWRmMmQ1NDZiZmQ2ZjVjNCAoInJpc2N2Ogo+IHBhdGNo
OiBGbHVzaCB0aGUgaWNhY2hlIHJpZ2h0IGFmdGVyIHBhdGNoaW5nIHRvIGF2b2lkIGlsbGVnYWwK
PiBpbnNucyIpIGluIHY2LjEwLXJjNi4KPgo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0
Y2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4gQEAgLTE4OSw5ICsy
MDUsNiBAQCBpbnQgcGF0Y2hfdGV4dF9zZXRfbm9zeW5jKHZvaWQgKmFkZHIsIHU4IGMsIHNpemVf
dCBsZW4pCj4gPgo+ID4gICAgICAgICByZXQgPSBwYXRjaF9pbnNuX3NldCh0cCwgYywgbGVuKTsK
PiA+Cj4gPiAtICAgICAgIGlmICghcmV0KQo+ID4gLSAgICAgICAgICAgICAgIGZsdXNoX2ljYWNo
ZV9yYW5nZSgodWludHB0cl90KXRwLCAodWludHB0cl90KXRwICsgbGVuKTsKPiA+IC0KPiA+ICAg
ICAgICAgcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiAgTk9LUFJPQkVfU1lNQk9MKHBhdGNoX3RleHRf
c2V0X25vc3luYyk7Cj4KPiBwYXRjaF90ZXh0X3NldF9ub3N5bmMoKSBpcyBub3cgaWRlbnRpY2Fs
IHRvIChzdGF0aWMpIHBhdGNoX2luc25fc2V0KCksCj4gYW5kIHRoZSBsYXR0ZXIgaGFzIG5vIG90
aGVyIGNhbGxlcnMuCj4KPiA+IEBAIC0yMjQsOSArMjM3LDYgQEAgaW50IHBhdGNoX3RleHRfbm9z
eW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQo+ID4KPiA+ICAg
ICAgICAgcmV0ID0gcGF0Y2hfaW5zbl93cml0ZSh0cCwgaW5zbnMsIGxlbik7Cj4gPgo+ID4gLSAg
ICAgICBpZiAoIXJldCkKPiA+IC0gICAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfcmFuZ2UoKHVp
bnRwdHJfdCkgdHAsICh1aW50cHRyX3QpIHRwICsgbGVuKTsKPiA+IC0KPiA+ICAgICAgICAgcmV0
dXJuIHJldDsKPiA+ICB9Cj4gPiAgTk9LUFJPQkVfU1lNQk9MKHBhdGNoX3RleHRfbm9zeW5jKTsK
Pgo+IHBhdGNoX3RleHRfbm9zeW5jKCkgaXMgbm93IGlkZW50aWNhbCB0byBwYXRjaF9pbnNuX3dy
aXRlKCksIGFuZCBib3RoCj4gZnVuY3Rpb25zIGFyZSBjYWxsZWQgZnJvbSBvdXRzaWRlIHRoaXMg
ZmlsZS4KPgoKSSdsbCBkbyBzb21ldGhpbmcgYWJvdXQgdGhhdCwgdGhhbmtzLgoKQWxleAoKPiBH
cntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KPiAt
LQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPgo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
