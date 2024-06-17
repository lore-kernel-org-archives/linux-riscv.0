Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785B3C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JBTvxcrrBAmJ4WyScLDcA5ijreuuOIHPQJWw0TuWek=; b=za9Xniz2gR4HWE
	APyGqQVz0Qs8jMDnztlJ7bh+wVCOxlOjXV2MkcOjWdeXj3h4pPjJajkn+DN2I3U6Sl3WFpLCyFenO
	J27+oDRbwvqCYU2G0h6dlUA/cSXE+2c7AvdQtRiIFlgJZ5+GDi7q7hXJ530OdEBgFYeQMZExOeM/8
	yOrbNmPoJ7sy1UiDqMat+ANAGn8fX+9rn2dzGALU97mCdeAoBWcAY3aqOR2fzDMZ4zzQGPsEiTkO8
	8Ikpy3LrkYDMxYxR9uQzIuL7hPsSc8lyLQVFkqwRS/qRy/MU+D2cjt6Wvz1stMoKzNMuy3T8zqBpI
	kVeHae8TARQOlJ1CzqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2H0-00000008spX-3OBU;
	Mon, 17 Jun 2024 02:39:10 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2Gx-00000008son-36jB
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:39:09 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dfef5980a69so4374427276.3
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718591946; x=1719196746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvWKRG4G4uh/VafRKr+dQcPE/37QW82H6MxcQ22NpJs=;
        b=MV4ggoflK3Ss84YH5VqOT7Rq9sTLaUgMoiX8372xvxJC1vwZfnJjhloGgNmwAU13kC
         so27MVat8wfr8Kmo3QT3O3k+tV+1L71csWlEkcv1XkBYVD/2ph7hpypgF5IYM4A94DQY
         nZoX3lUKzEZqIVUkwQ80f0QU19LF1vE8jR/SoKEUMSAdYeuo9BryNTg0hobtU6Gj5H2z
         blZ4xldAQn9/Q6bNGzggUOBSN3jbsD/eoJ+ZE9IRxjpbe/xHX6y3CXoMwzWyYU1e3mfr
         EeyWly32MZt+ZyOfMF5tvlXP6sWxJH8SqfhgCx8I9HRXNZjNHOMKGbQ0JDy+/LytriVe
         6ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718591946; x=1719196746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvWKRG4G4uh/VafRKr+dQcPE/37QW82H6MxcQ22NpJs=;
        b=tEzr+STeWfiNxuYoH0izb7vdP3oDYBrwBhzlxOkuBfWpUL2hxxof3UpFwTLj0Oqy+L
         BwHiVVW5T5AjWApX2bxaQWp2NuW46l126CuFQLOed+ZNKrigxqL/fAt4O6r/BeZw5Erq
         l5h9Vmas6D0inXOEsoTcVegPq4DsUQssKI0Y4zB2609ILAGjNG5FVkcwIkDzAaQO94nl
         jF4pJOmE5G4URr5InBVoZtv+DI8QUp7MAEX7LFfZGae88qwSoF24G5WHvmjsIL3PP+qZ
         k3G+y2aG3we3K9ngnoYyQ4cj9C4dhGY1aeUC2HLCiTemEs/J6n3byWJ8aEmfM17QQItc
         ucDg==
X-Forwarded-Encrypted: i=1; AJvYcCUQmLj4rMqNJgKTYdvL4uvGzCdGlmQFFR2Sl/hVkLgpx9CgyjWOi96uEKjWEke1xfeqfOSomWOb+298Odfm4LGz7SaNuDUqwOnLGP6XLtB+
X-Gm-Message-State: AOJu0Ywx6s/5TTGVecBQUE5kW61Kmx5V2cZ6CMYvxnbmHhx17FbNyAue
	LAT1ygE+46whbvDkCJuZl1+LNlm+hjmidM32+0VDY6KpYKUeSfcO625vGKBDxku1VWQFOBy4Frd
	IrA0a6BaTDUb3VzJzI7EUznzPo+wXIhJSfoEzCA==
X-Google-Smtp-Source: AGHT+IGx5gyoe+gPzQWT+v+p8579+Wzzy0Rc6gNG/13H/HestUrQLJhhbdrIOQVQ4ELHkFaMdUbQlF19+HnvPT5nnBA=
X-Received: by 2002:a25:b19b:0:b0:dfe:5a00:df5c with SMTP id
 3f1490d57ef6-dff153a6620mr8483209276.18.1718591946340; Sun, 16 Jun 2024
 19:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com> <20240613190920.GB1272931@thelio-3990X>
In-Reply-To: <20240613190920.GB1272931@thelio-3990X>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 10:38:55 +0800
Message-ID: <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
Subject: Re: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte boundary
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_193907_829842_63C33A5D 
X-CRM114-Status: GOOD (  27.03  )
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMzowOeKAr0FNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBBbmR5LAo+Cj4gT24gVGh1LCBKdW4gMTMsIDIw
MjQgYXQgMDM6MTE6MDlQTSArMDgwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gV2UgYXJlIGNoYW5n
aW5nIGZ0cmFjZSBjb2RlIHBhdGNoaW5nIGluIG9yZGVyIHRvIHJlbW92ZSBkZXBlbmRlbmN5IGZy
b20KPiA+IHN0b3BfbWFjaGluZSgpIGFuZCBlbmFibGUga2VybmVsIHByZWVtcHRpb24uIFRoaXMg
cmVxdWlyZXMgdXMgdG8gYWxpZ24KPiA+IGZ1bmN0aW9ucyBlbnRyeSBhdCBhIDQtQiBhbGlnbiBh
ZGRyZXNzLgo+ID4KPiA+IEhvd2V2ZXIsIC1mYWxpZ24tZnVuY3Rpb25zIG9uIG9sZGVyIHZlcnNp
b25zIG9mIEdDQyBhbG9uZSB3YXMgbm90IHN0cm9uZwo+ID4gZW5vdW5naCB0byBhbGlnbiBhbGwg
ZnVuY3Rpb25zLiBJbiBmYWN0LCBjb2xkIGZ1bmN0aW9ucyBhcmUgbm90IGFsaWduZWQKPiA+IGFm
dGVyIHR1cm5pbmcgb24gb3B0aW1pemF0aW9ucy4gV2UgY29uc2lkZXIgdGhpcyBpcyBhIGJ1ZyBp
biBHQ0MgYW5kCj4gPiB0dXJuIG9mZiBndWVzcy1icmFuY2gtcHJvYmlsaXR5IGFzIGEgd29ya2Fy
b3VuZCB0byBhbGlnbiBhbGwgZnVuY3Rpb25zLgo+ID4KPiA+IEdDQyBidWcgaWQ6IGh0dHBzOi8v
Z2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTg4MzQ1Cj4gPgo+ID4gVGhlIG9w
dGlvbiAtZm1pbi1mdW5jdGlvbi1hbGlnbm1lbnQgaXMgYWJsZSB0byBhbGlnbiBhbGwgZnVuY3Rp
b25zCj4gPiBwcm9wZXJseSBvbiBuZXdlciB2ZXJzaW9ucyBvZiBnY2MuIFNvLCB3ZSBhZGQgYSBj
Yy1vcHRpb24gdG8gdGVzdCBpZgo+ID4gdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyBpdC4KPiA+Cj4g
PiBTdWdnZXN0ZWQtYnk6IEV2Z2VuaWkgU2hhdG9raGluIDxlLnNoYXRva2hpbkB5YWRyby5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICB8IDEgKwo+ID4gIGFyY2gvcmlzY3YvTWFrZWZp
bGUgfCA3ICsrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGI5NDE3NmUyNWJlMS4uODBiOGQ0OGUxZTQ2IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+IEBAIC0yMDMsNiArMjAzLDcgQEAgY29uZmlnIENMQU5HX1NVUFBPUlRTX0RZTkFNSUNf
RlRSQUNFCj4gPiAgY29uZmlnIEdDQ19TVVBQT1JUU19EWU5BTUlDX0ZUUkFDRQo+ID4gICAgICAg
ZGVmX2Jvb2wgQ0NfSVNfR0NDCj4gPiAgICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1mcGF0
Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPiArICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9u
LC1mbWluLWZ1bmN0aW9uLWFsaWdubWVudD00KSB8fCAhUklTQ1ZfSVNBX0MKPgo+IFBsZWFzZSB1
c2UgQ0NfSEFTX01JTl9GVU5DVElPTl9BTElHTk1FTlQgKGZyb20gYXJjaC9LY29uZmlnKSwgd2hp
Y2gKPiBhbHJlYWR5IGNoZWNrcyBmb3Igc3VwcG9ydCBmb3IgdGhpcyBvcHRpb24uCgpUaGFua3Mg
Zm9yIHRoZSBzdWdnZXN0aW9uIQoKPgo+ID4gIGNvbmZpZyBIQVZFX1NIQURPV19DQUxMX1NUQUNL
Cj4gPiAgICAgICBkZWZfYm9vbCAkKGNjLW9wdGlvbiwtZnNhbml0aXplPXNoYWRvdy1jYWxsLXN0
YWNrKQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01h
a2VmaWxlCj4gPiBpbmRleCAwNmRlOWQzNjUwODguLjc0NjI4YWQ4ZGNmOCAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+
IEBAIC0xNCw4ICsxNCwxMyBAQCBlbmRpZgo+ID4gIGlmZXEgKCQoQ09ORklHX0RZTkFNSUNfRlRS
QUNFKSx5KQo+ID4gICAgICAgTERGTEFHU192bWxpbnV4ICs9IC0tbm8tcmVsYXgKPiA+ICAgICAg
IEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWQo+
ID4gK2lmZXEgKCQoQ09ORklHX0NDX0lTX0NMQU5HKSx5KQo+Cj4gU2FtZSBoZXJlLCBwbGVhc2Ug
aW52ZXJ0IHRoaXMgYW5kIHVzZQo+Cj4gICBpZmRlZiBDT05GSUdfQ0NfSEFTX01JTl9GVU5DVElP
Tl9BTElHTk1FTlQKPgo+IGxpa2UgdGhlIG1haW4gTWFrZWZpbGUgZG9lcy4KCkhvcGUgdGhpcyBt
YWtlcyBzZW5zZSB0byB5b3UuIEkgYW0gZ29pbmcgdG8gYWRkIHRoZSBmb2xsb3dpbmcgaW4gcmlz
Y3YgS2NvbmlnOgoKc2VsZWN0IEZVTkNUSU9OX0FMSUdOTUVOVF80QiBpZiBEWU5BTUlDX0ZUUkFD
RSAmJiAhUklTQ1ZfSVNBX0MKClNvIHdlIHdpbGwgbm90IG5lZWQgYW55IG9mIHRoZXNlCgo+Cj4g
PiArICAgICBjZmxhZ3NfZnRyYWNlX2FsaWduIDo9IC1mYWxpZ24tZnVuY3Rpb25zPTQKPiA+ICtl
bHNlCj4gPiArICAgICBjZmxhZ3NfZnRyYWNlX2FsaWduIDo9IC1mbWluLWZ1bmN0aW9uLWFsaWdu
bWVudD00Cj4gPiArZW5kaWYKPiA+ICBpZmVxICgkKENPTkZJR19SSVNDVl9JU0FfQykseSkKPiA+
IC0gICAgIENDX0ZMQUdTX0ZUUkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00Cj4g
PiArICAgICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9NCAk
KGNmbGFnc19mdHJhY2VfYWxpZ24pCj4gPiAgZWxzZQo+ID4gICAgICAgQ0NfRkxBR1NfRlRSQUNF
IDo9IC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIKPiA+ICBlbmRpZgo+ID4KPiA+IC0tCj4g
PiAyLjQzLjAKPiA+Cj4gPgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
