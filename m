Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F96C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9e3W6BcQcTRMVdboLzIEitEAoOxKm0IXqbcM5iWbPM=; b=Y/21WHsjYOWHZo
	PgUAlAsEPXW+atYx4/jcix0ctxBnGNPjafm9hnIoWrq9qBIJDm0TQ7yaAZpI2f3ZPfCpSKg4Kk4c5
	XOoobEqAvILflw2I6TD8lhsyPLFXnxR84Y/x2TK/tmmw5ieJMwwsD7JHERayCazW8X/+r5A8mvSi1
	Igz0aA0Qsv8mYkwYJUm4zeNylPEGirZEJ0RCBrhnDfmvSqDbZIH6nOp89NbouahURb93gdoeu+XHk
	l3RNZCjQnFGREekH2rCK2LhARHVw8wTzxZYVgBbJXDPikNA5zqWNrvV91RPcM+lNHWUmVn/pbbbY6
	XAYWpfHjhIreqTrATapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMV0L-00000007UFj-3P37;
	Wed, 26 Jun 2024 15:56:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMV0I-00000007UEg-37eP
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:56:16 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a6fe118805dso484677966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719417369; x=1720022169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJzGfxQQUmV1cJDBl9Qeuz6ppTrU+XJClw05Gu9e910=;
        b=05u+yRQvpSnkb1Oi1YgM8WDMO59bNpMuFP/aKE8gxVd37e5NsW0c3CHY8PwJ/FtU6u
         iAmKsXnQHBttfLj4hjeFluzJxkOADA+DMWYOksX3PQBKAeaIDJ7Ric3Ydn7Gsl7iS3EM
         jRAeoo0tqBKLlK+urSTWI8cBqOgdD8Krn1tch/VGb7FebU5DvQ+ec9GKEKjZMMhLSX2u
         jh2ki1xKNKtb8sNUc2/rykeLQGubuSrXSIN3Un6wZ+CwXPvWM53vGSJGLX6N3tL5nfAp
         IazAkO5KxDrdoGo2Cm0zq/XBb580lLFdDV7RTWiIXDcR8N5+VTnASLyfrGFqGUnmNyGa
         DtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417369; x=1720022169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJzGfxQQUmV1cJDBl9Qeuz6ppTrU+XJClw05Gu9e910=;
        b=XqsWrGIaofMNDjgprpd55saFSR8OogTPAzJhuJ/C696trDQeVK9/V21fKGXROnjGhB
         euABNGSMollxuCsVbNI7YVGxXHOn1dFE2+qW4eMrmIqx/XMvDdaVZVMBVmCXKqhVPgZ4
         6Jxn7XwrW8NW9NCz5c1l0Y5KKINs3napxpykLnkgJRYzTS8nwMqlXx/qezpROgV3xtBW
         0HcYpG/+uyvJH+S5gHWaYPACKfrrGCY5SGYRAZc2BwJp8u9nzJRrbmteyN04TSFz7Is5
         zq8DpWZMbKZ/93LrIFHmPQ8a/3Bz+RCRXJwdHbxfrILAH2qD8gZs2MLfRbidA98YtvbC
         siAA==
X-Forwarded-Encrypted: i=1; AJvYcCUIh270MpyNEEESuCYA6y0gVnWMFGc5l7dkf8fH/Fl9qAuC74sybpjE4+fWq2dur2F858euM4SysfB3s86bJIpgBEnbPEODLNV2JaHf65Qk
X-Gm-Message-State: AOJu0YyaVm051hKUkyQvmvDTNTx34Rc//gHEOL1RyVbBhRxXelric6ox
	FOgjp/ntvE3LfoYWaiVdnuHKynqJ4UYHWXEKE539fiWfuhIz3siU42a/GEdmKAN8USDMXEE6wAZ
	4rVXtfu9I9efpPje7eL5QE6kYpbM58IQPWJP4jw==
X-Google-Smtp-Source: AGHT+IHV5OR/jF6Sb4EqdHVZVXS9SBH/7cVzyA+lDTuRIhiKeb383eE7FGjwbumV9J607Cyivknt59ndYLxj0bf/em4=
X-Received: by 2002:a17:907:8e93:b0:a6e:f62d:bd02 with SMTP id
 a640c23a62f3a-a7245c84f2emr828709066b.7.1719417369598; Wed, 26 Jun 2024
 08:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-2-evan@rivosinc.com>
 <20240626-aide-nickname-1ef5fef000fb@spud>
In-Reply-To: <20240626-aide-nickname-1ef5fef000fb@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 26 Jun 2024 08:55:33 -0700
Message-ID: <CALs-HsuKHpKanjXm3HQ3JVd6e5Qm4V1+QjBJ38ttxBT1iCw-KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_085614_925395_07923289 
X-CRM114-Status: GOOD (  24.24  )
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgNzozNuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCAwOTo1MToyMEFNIC0w
NzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wIHdh
cyBtaXN0YWtlbmx5IGZsYWdnZWQgYXMgYSBiaXRtYXNrIGluCj4gPiBod3Byb2JlX2tleV9pc19i
aXRtYXNrKCksIHdoZW4gaW4gcmVhbGl0eSBpdCB3YXMgYW4gZW51bSB2YWx1ZS4gVGhpcwo+ID4g
Y2F1c2VzIHByb2JsZW1zIHdoZW4gdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIFJJU0NWX0hXUFJP
QkVfV0hJQ0hfQ1BVUywKPiA+IHNpbmNlIFNMT1csIEZBU1QsIGFuZCBFTVVMQVRFRCBoYXZlIHZh
bHVlcyB3aG9zZSBiaXRzIG92ZXJsYXAgd2l0aAo+ID4gZWFjaCBvdGhlci4gSWYgdGhlIGNhbGxl
ciBhc2tlZCBmb3IgdGhlIHNldCBvZiBDUFVzIHRoYXQgd2FzIFNMT1cgb3IKPiA+IEVNVUxBVEVE
LCB0aGUgcmV0dXJuZWQgc2V0IHdvdWxkIGFsc28gaW5jbHVkZSBDUFVzIHRoYXQgd2VyZSBGQVNU
Lgo+ID4KPiA+IEludHJvZHVjZSBhIG5ldyBod3Byb2JlIGtleSwgUklTQ1ZfSFdQUk9CRV9LRVlf
TUlTQUxJR05FRF9QRVJGLCB3aGljaAo+ID4gcmV0dXJucyB0aGUgc2FtZSB2YWx1ZXMgaW4gcmVz
cG9uc2UgdG8gYSBkaXJlY3QgcXVlcnkgKHdpdGggbm8gZmxhZ3MpLAo+ID4gYnV0IGlzIHByb3Bl
cmx5IGhhbmRsZWQgYXMgYW4gZW51bWVyYXRlZCB2YWx1ZS4gQXMgYSByZXN1bHQsIFNMT1csCj4g
PiBGQVNULCBhbmQgRU1VTEFURUQgYXJlIGFsbCBjb3JyZWN0bHkgdHJlYXRlZCBhcyBkaXN0aW5j
dCB2YWx1ZXMgdW5kZXIKPiA+IHRoZSBuZXcga2V5IHdoZW4gcXVlcmllZCB3aXRoIHRoZSBXSElD
SF9DUFVTIGZsYWcuCj4gPgo+ID4gTGVhdmUgdGhlIG9sZCBrZXkgaW4gcGxhY2UgdG8gYXZvaWQg
ZGlzdHVyYmluZyBhcHBsaWNhdGlvbnMgd2hpY2ggbWF5Cj4gPiBoYXZlIGFscmVhZHkgY29tZSB0
byByZWx5IG9uIHRoZSBrZXksIHdpdGggb3Igd2l0aG91dCBpdHMgYnJva2VuCj4gPiBiZWhhdmlv
ciB3aXRoIHJlc3BlY3QgdG8gdGhlIFdISUNIX0NQVVMgZmxhZy4KPiA+Cj4gPiBGaXhlczogZTE3
OGJmMTQ2ZTRiICgiUklTQy1WOiBod3Byb2JlOiBJbnRyb2R1Y2Ugd2hpY2gtY3B1cyBmbGFnIikK
PiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+Cj4gPiAt
LS0KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gIC0gQ2xhcmlmaWVkIHRoZSBkaXN0aW5jdGlv
biBvZiBzbG93IGFuZCBmYXN0IHJlZmVycyB0byBtaXNhbGlnbmVkIHdvcmQKPiA+ICAgIGFjY2Vz
c2VzLiBQcmV2aW91c2x5IGl0IGp1c3Qgc2FpZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBsZWF2aW5n
IGl0Cj4gPiAgICBhbWJpZ3VvdXMgYXMgdG8gd2hpY2ggdHlwZSBvZiBhY2Nlc3Mgd2FzIG1lYXN1
cmVkLgo+Cj4gSSB0aGluayBpZiB3ZSBhcmUgZ29ubmEgYmUgc3BlY2lmaWMsIHdlIHNob3VsZCBi
ZSBleGFjdGx5IHNwZWNpZmljIGFzIHRvCj4gd2hhdCB3ZSBoYXZlIHRlc3RlZCBhbmQgc2F5IDMy
LWJpdCBpZiB0aGF0J3Mgd2hhdCB3ZSdyZSBwcm9iaW5nL3Rlc3RpbmcKPiB3aXRoLiBUaGF0J2Qg
YmUgY29uc2lzdGVudCB3aXRoIGplc3NlJ3MgcHJvcG9zZWQgd29yZGluZyBmb3IgdmVjdG9yLgoK
U3VyZS4gSW4gdGhpcyBjYXNlIGl0J3MgcmVhbGx5IG5hdGl2ZSB3b3JkIHNpemVkIGFjY2Vzc2Vz
LiBTbyBzb21ldGhpbmcgbGlrZToKCiogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX01JU0FM
SUdORURfU0NBTEFSX1BFUkZgOiBBbiBlbnVtIHZhbHVlIGRlc2NyaWJpbmcKdGhlIHBlcmZvcm1h
bmNlIG9mIG1pc2FsaWduZWQgc2NhbGFyIG5hdGl2ZSB3b3JkIGFjY2Vzc2VzIG9uIHRoZSBzZWxl
Y3RlZCBzZXQKb2YgcHJvY2Vzc29ycy4KCi4uLgoKKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX1NDQUxBUl9TTE9XYDogTWlzYWxpZ25lZCBuYXRpdmUgd29yZApzaXplZCBhY2Nl
c3NlcyBhcmUgc2xvd2VyIHRoYW4gdGhlIGVxdWl2YWxlbnQgcXVhbnRpdHkgb2YgYnl0ZSBhY2Nl
c3Nlcy4KTWlzYWxpZ25lZCBhY2Nlc3NlcyBtYXkgYmUgc3VwcG9ydGVkIGRpcmVjdGx5IGluIGhh
cmR3YXJlLCBvciB0cmFwcGVkIGFuZAplbXVsYXRlZCBieSBzb2Z0d2FyZS4KCiogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRkFTVGA6IE1pc2FsaWduZWQgbmF0aXZl
IHdvcmQKc2l6ZWQgYWNjZXNzZXMgYXJlIGZhc3RlciB0aGFuIHRoZSBlcXVpdmFsZW50IHF1YW50
aXR5IG9mIGJ5dGUgYWNjZXNzZXMuCgpJJ20gcGxhbm5pbmcgdG8gbGVhdmUgdGhlIHF1YWxpZmll
cnMgb2ZmIG9mIFVOS05PV04sIEVNVUxBVEVELCBhbmQKVU5TVVBQT1JURUQsIGFzIHRob3NlIGxp
a2VseSBhcHBseSB0byBtaXNhbGlnbmVkIGFjY2Vzc2VzIG9mIGFueSBzaXplLgpMZXQgbWUga25v
dyBpZiB5b3UgdGhpbmsgd2Ugc2hvdWxkIHR3ZWFrIGl0IGZ1cnRoZXIuCi1FdmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
