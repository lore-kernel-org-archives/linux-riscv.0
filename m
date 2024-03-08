Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43130C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNryyJ2mTtnLI7BzfBkyqUKOXlJDrbsu/7accitG1Pk=; b=Tr5eedUhzfPMuG
	MFKVUP/CJV/ssJz+0uaUFEaTM6PdLNbhftqjm1fSa4Cu4pjEPxTAFO9nXOLH1URYnv0Rh8earTcOx
	KMhiK7xeHg54ig2u7wxqKC/wai0OfKHhy+r2Ni38/h/pCREDf1aI0xkZNi4MkXpy2PFtIopGTzDUI
	acJZcfVcK+R1MnbujJ7yc7MVm0MFoX47OIA7GWXzZs3+9hH3ZJ9CzyEapKHfGETrpqvCdfXpIZ5u0
	o10Pjn1C70RDyACKivUBaSK2uOM8FS1tOZFevPL+75Ldj7yMzqX9JlKoZr3nqYsUA6Dm69gUC0CtB
	YY2wxAqORhXHNrfcYgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWNE-00000008XVU-2qMV;
	Fri, 08 Mar 2024 09:18:40 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWN9-00000008XQJ-0teQ
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 09:18:39 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1370187276.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709889513; x=1710494313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQfStgoadcJZ3LxQhxglAjLjX8LE9J04xgEnWvSiGZM=;
        b=g7seDH0wJh8CytaElwc8GOCicN/8pe6zRfEzt5krIO1/qgFL28OI9gK5KomWiJ82om
         jMj6pE5Uv3hRqeeJIyvo+wSAvWzYI3QXZvOfBiRAOwzJuoMTx5oUGEC6ADUIOhfDLhxZ
         scp7eOQaXVbxoXuOR7g2qpaBhcD47YNuiN7f2ACaX3cYhLhPTYYAdh5nssL+B0MMfZ7S
         JUg5f3ouE5l33g4tgG3fbl/1rc6795Xi1Lan/ZasEybD+fJPtpagP8GOa+kK8zk9xeOj
         GeiY7QZwbJOjRhHI0iOgsfhlGj4kw/W4qM15Wqasaqps3M5PHzW50ErqSvIbldvCk4kz
         B2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709889513; x=1710494313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQfStgoadcJZ3LxQhxglAjLjX8LE9J04xgEnWvSiGZM=;
        b=NWDNONe5G3ErwISCNw+orc0MtO+TID3yN+ZYjZZ22g2gpueXivla0Z9YTolDW6qVMZ
         TloaKkj+b8sk4/lTzD/trpRLqSPhTiuvxv0808vVPtWLNyMMBdptnCa9/36rdOAGgwXq
         oGEbGcSCkUF3RiTCaODsQxczM6Te3N2v5EsS+Qo2mRvgXVtyPvRrmyjrFItAL/Fplrt1
         GBb24yda3Wgf746W/7jeO+8PWSdD/xbX4JcdCOF9pVWkLrvzbbMx3N5mBULvedcxRT4b
         VPFIdAyPfTkBnRuKrcxQYtA8EzCkzvSy2jACq1V4RdLbtavFIZ2wAbLN5kakVCy4IqoQ
         CzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpuRiGOL2L1RgfbwELwVCp0AHnh5maMaC82CORNbIN11AaEI4YmuVkprzOKQOCAX/lZnoH+ws0WNbPgpwP08vTQn5EEFwOzBdGccjeYbIQ
X-Gm-Message-State: AOJu0YwXh926sjr03QLIeZSQ4nSuqXS3oWCwb/lwNfPbvkuFAv6W3JXP
	EOSaVn/Cef+AvQnSBKdl8j8kSGAYUchO2QVWkvnHHiBKbZkxPfOE8pLiY5U87UxzHDFunVvEtwi
	RYBKpWDmWcE7agCM8/s0+zVDuXNZzrOPRsCcqmA==
X-Google-Smtp-Source: AGHT+IFOh/fbBZAoKlAXSCLWZ4Jp1GE+8bu4ic4VOQKef5vFu/0bqlMTN31Em7LyWY4axsAp+J3ERv4eJUIdxxYPPyE=
X-Received: by 2002:a25:d34d:0:b0:dc7:45d3:ffd0 with SMTP id
 e74-20020a25d34d000000b00dc745d3ffd0mr18528744ybf.1.1709889512914; Fri, 08
 Mar 2024 01:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com>
In-Reply-To: <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 8 Mar 2024 17:18:21 +0800
Message-ID: <CABgGipUJU_joVOjPi4WZ4JJM72zaSrCA1QUAaP8hob3+LXkS0g@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta <debug@rivosinc.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Song Shuai <suagrfillet@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_011835_773953_FF1CFB0E 
X-CRM114-Status: GOOD (  53.45  )
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

SGkgUHVyYW5qYXksCgpPbiBGcmksIE1hciA4LCAyMDI0IGF0IDM6NTPigK9BTSBQdXJhbmpheSBN
b2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQmrDtnJuLAo+Cj4gT24g
VGh1LCBNYXIgNywgMjAyNCBhdCA4OjI34oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gUHVyYW5qYXkhCj4gPgo+ID4gUHVyYW5qYXkgTW9oYW4gPHB1
cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cj4gPgo+ID4gPiBUaGlzIHBhdGNoIGVuYWJsZXMg
c3VwcG9ydCBmb3IgRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUyBvbiBSSVNDLVYuCj4gPiA+
IFRoaXMgYWxsb3dzIGVhY2ggZnRyYWNlIGNhbGxzaXRlIHRvIHByb3ZpZGUgYW4gZnRyYWNlX29w
cyB0byB0aGUgY29tbW9uCj4gPiA+IGZ0cmFjZSB0cmFtcG9saW5lLCBhbGxvd2luZyBlYWNoIGNh
bGxzaXRlIHRvIGludm9rZSBkaXN0aW5jdCB0cmFjZXIKPiA+ID4gZnVuY3Rpb25zIHdpdGhvdXQg
dGhlIG5lZWQgdG8gZmFsbCBiYWNrIHRvIGxpc3QgcHJvY2Vzc2luZyBvciB0bwo+ID4gPiBhbGxv
Y2F0ZSBjdXN0b20gdHJhbXBvbGluZXMgZm9yIGVhY2ggY2FsbHNpdGUuIFRoaXMgc2lnbmlmaWNh
bnRseSBzcGVlZHMKPiA+ID4gdXAgY2FzZXMgd2hlcmUgbXVsdGlwbGUgZGlzdGluY3QgdHJhY2Ug
ZnVuY3Rpb25zIGFyZSB1c2VkIGFuZCBjYWxsc2l0ZXMKPiA+ID4gYXJlIG1vc3RseSB0cmFjZWQg
YnkgYSBzaW5nbGUgdHJhY2VyLgo+ID4gPgo+ID4gPiBUaGUgaWRlYSBhbmQgbW9zdCBvZiB0aGUg
aW1wbGVtZW50YXRpb24gaXMgdGFrZW4gZnJvbSB0aGUgQVJNNjQncwo+ID4gPiBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgc2FtZSBmZWF0dXJlLiBUaGUgaWRlYSBpcyB0byBwbGFjZSBhIHBvaW50ZXIg
dG8KPiA+ID4gdGhlIGZ0cmFjZV9vcHMgYXMgYSBsaXRlcmFsIGF0IGEgZml4ZWQgb2Zmc2V0IGZy
b20gdGhlIGZ1bmN0aW9uIGVudHJ5Cj4gPiA+IHBvaW50LCB3aGljaCBjYW4gYmUgcmVjb3ZlcmVk
IGJ5IHRoZSBjb21tb24gZnRyYWNlIHRyYW1wb2xpbmUuCj4gPgo+ID4gTm90IHJlYWxseSBhIHJl
dmlldywgYnV0IHNvbWUgbW9yZSBiYWNrZ3JvdW5kOyBBbm90aGVyIHJhdGlvbmFsZSAob24tdG9w
Cj4gPiBvZiB0aGUgaW1wcm92ZWQgcGVyLWNhbGwgcGVyZm9ybWFuY2UhKSBmb3IgQ0FMTF9PUFMg
d2FzIHRvIHVzZSBpdCB0bwo+ID4gYnVpbGQgZnRyYWNlIGRpcmVjdCBjYWxsIHN1cHBvcnQgKHdo
aWNoIEJQRiB1c2VzIGEgbG90ISkuIE1hcmssIHBsZWFzZQo+ID4gY29ycmVjdCBtZSBpZiBJJ20g
bHlpbmcgaGVyZSEKPiA+Cj4gPiBPbiBBcm02NCwgQ0FMTF9PUFMgbWFrZXMgaXQgcG9zc2libGUg
dG8gaW1wbGVtZW50IGRpcmVjdCBjYWxscywgd2hpbGUKPiA+IG9ubHkgcGF0Y2hpbmcgb25lIEJM
IGluc3RydWN0aW9uIC0tIG5pY2UhCj4gPgo+ID4gT24gUklTQy1WIHdlIGNhbm5vdCB1c2UgdXNl
IHRoZSBzYW1lIGlkZWFzIGFzIEFybTY0IHN0cmFpZ2h0IG9mZiwKPiA+IGJlY2F1c2UgdGhlIHJh
bmdlIG9mIGphbCAoY29tcGFyZSB0byBCTCkgaXMgc2ltcGx5IHRvbyBzaG9ydCAoKy8tMU0pLgo+
ID4gU28sIG9uIFJJU0MtViB3ZSBuZWVkIHRvIHVzZSBhIGZ1bGwgYXVpcGMvamFsIHBhaXIgKHRo
ZSB0ZXh0IHBhdGNoaW5nCj4gPiBzdG9yeSBpcyBhbm90aGVyIGNoYXB0ZXIsIGJ1dCBsZXQncyBs
ZWF2ZSB0aGF0IGFzaWRlIGZvciBub3cpLiBTaW5jZSB3ZQo+ID4gaGF2ZSB0byBwYXRjaCBtdWx0
aXBsZSBpbnN0cnVjdGlvbnMsIHRoZSBjbW9keCBzaXR1YXRpb24gZG9lc24ndCByZWFsbHkKPiA+
IGltcHJvdmUgd2l0aCBDQUxMX09QUy4KPiA+Cj4gPiBMZXQncyBzYXkgdGhhdCB3ZSBjb250aW51
ZSBidWlsZGluZyBvbiB5b3VyIHBhdGNoIGFuZCBpbXBsZW1lbnQgZGlyZWN0Cj4gPiBjYWxscyBv
biBDQUxMX09QUyBmb3IgUklTQy1WIGFzIHdlbGwuCj4gPgo+ID4gRnJvbSBGbG9yZW50J3MgY29t
bWl0IG1lc3NhZ2UgZm9yIGRpcmVjdCBjYWxsczoKPiA+Cj4gPiAgIHwgICAgVGhlcmUgYXJlIGEg
ZmV3IGNhc2VzIHRvIGRpc3Rpbmd1aXNoOgo+ID4gICB8ICAgIC0gSWYgYSBkaXJlY3QgY2FsbCBv
cHMgaXMgdGhlIG9ubHkgb25lIHRyYWNpbmcgYSBmdW5jdGlvbjoKPiA+ICAgfCAgICAgIC0gSWYg
dGhlIGRpcmVjdCBjYWxsZWQgdHJhbXBvbGluZSBpcyB3aXRoaW4gdGhlIHJlYWNoIG9mIGEgQkwK
PiA+ICAgfCAgICAgICAgaW5zdHJ1Y3Rpb24KPiA+ICAgfCAgICAgICAgIC0+IHRoZSBmdHJhY2Ug
cGF0Y2hzaXRlIGp1bXBzIHRvIHRoZSB0cmFtcG9saW5lCj4gPiAgIHwgICAgICAtIEVsc2UKPiA+
ICAgfCAgICAgICAgIC0+IHRoZSBmdHJhY2UgcGF0Y2hzaXRlIGp1bXBzIHRvIHRoZSBmdHJhY2Vf
Y2FsbGVyIHRyYW1wb2xpbmUgd2hpY2gKPiA+ICAgfCAgICAgICAgICAgIHJlYWRzIHRoZSBvcHMg
cG9pbnRlciBpbiB0aGUgcGF0Y2hzaXRlIGFuZCBqdW1wcyB0byB0aGUgZGlyZWN0Cj4gPiAgIHwg
ICAgICAgICAgICBjYWxsIGFkZHJlc3Mgc3RvcmVkIGluIHRoZSBvcHMKPiA+ICAgfCAgICAtIEVs
c2UKPiA+ICAgfCAgICAgIC0+IHRoZSBmdHJhY2UgcGF0Y2hzaXRlIGp1bXBzIHRvIHRoZSBmdHJh
Y2VfY2FsbGVyIHRyYW1wb2xpbmUgYW5kIGl0cwo+ID4gICB8ICAgICAgICAgb3BzIGxpdGVyYWwg
cG9pbnRzIHRvIGZ0cmFjZV9saXN0X29wcyBzbyBpdCBpdGVyYXRlcyBvdmVyIGFsbAo+ID4gICB8
ICAgICAgICAgcmVnaXN0ZXJlZCBmdHJhY2Ugb3BzLCBpbmNsdWRpbmcgdGhlIGRpcmVjdCBjYWxs
IG9wcyBhbmQgY2FsbHMgaXRzCj4gPiAgIHwgICAgICAgICBjYWxsX2RpcmVjdF9mdW5jcyBoYW5k
bGVyIHdoaWNoIHN0b3JlcyB0aGUgZGlyZWN0IGNhbGxlZAo+ID4gICB8ICAgICAgICAgdHJhbXBv
bGluZSdzIGFkZHJlc3MgaW4gdGhlIGZ0cmFjZV9yZWdzIGFuZCB0aGUgZnRyYWNlX2NhbGxlcgo+
ID4gICB8ICAgICAgICAgdHJhbXBvbGluZSB3aWxsIHJldHVybiB0byB0aGF0IGFkZHJlc3MgaW5z
dGVhZCBvZiByZXR1cm5pbmcgdG8gdGhlCj4gPiAgIHwgICAgICAgICB0cmFjZWQgZnVuY3Rpb24K
PiA+Cj4gPiBPbiBSSVNDLVYsIHdoZXJlIGF1aXBjL2phbHIgaXMgdXNlZCwgdGhlIGRpcmVjdCBj
YWxsZWQgdHJhbXBvbGluZSB3b3VsZAo+ID4gYWx3YXlzIGJlIHJlYWNoYWJsZSwgYW5kIHRoZW4g
Zmlyc3QgRWxzZS1jbGF1c2Ugd291bGQgbmV2ZXIgYmUgZW50ZXJlZC4KPiA+IFRoaXMgbWVhbnMg
dGhlIHRoZSBwZXJmb3JtYW5jZSBmb3IgZGlyZWN0IGNhbGxzIHdvdWxkIGJlIHRoZSBzYW1lIGFz
IHRoZQo+ID4gb25lIHdlIGhhdmUgdG9kYXkgKGkuZS4gbm8gcmVncmVzc2lvbiEpLgo+ID4KPiA+
IFJJU0MtViBkb2VzIGxpa2UgeDg2IGRvZXMgKC1pc2gpIC0tIHBhdGNoIG11bHRpcGxlIGluc3Ry
dWN0aW9ucywgbG9uZwo+ID4gcmVhY2guCj4gPgo+ID4gQXJtNjQgdXNlcyBDQUxMX09QUyBhbmQg
cGF0Y2ggb25lIGluc3RydWN0aW9uIEJMLgo+ID4KPiA+IE5vdywgd2l0aCB0aGlzIGJhY2tncm91
bmQgaW4gbWluZCwgY29tcGFyZWQgdG8gd2hhdCB3ZSBoYXZlIHRvZGF5LAo+ID4gQ0FMTF9PUFMg
d291bGQgZ2l2ZSB1cyAoYWdhaW4gYXNzdW1pbmcgd2UncmUgdXNpbmcgaXQgZm9yIGRpcmVjdCBj
YWxscyk6Cj4gPgo+ID4gKiBCZXR0ZXIgcGVyZm9ybWFuY2UgZm9yIHRyYWNlciBwZXItY2FsbCAo
ZmFzdGVyIG9wcyBsb29rdXApIEdPT0QKPgo+IF4gdGhpcyB3YXMgdGhlIG9ubHkgbW90aXZhdGlv
biBmb3IgbWUgdG8gaW1wbGVtZW50IHRoaXMgcGF0Y2guCj4KPiBJIGRvbid0IHRoaW5rIGltcGxl
bWVudGluZyBkaXJlY3QgY2FsbHMgb3ZlciBjYWxsIG9wcyBpcyBmcnVpdGZ1bCBmb3IKPiBSSVND
LVYgYmVjYXVzZSBvbmNlCj4gdGhlIGF1aXBjL2phbHIgY2FuIGJlIHBhdGNoZWQgYXRvbWljYWxs
eSwgdGhlIGRpcmVjdCBjYWxsIHRyYW1wb2xpbmUKPiBpcyBhbHdheXMgcmVhY2hhYmxlLgoKWWVz
LCB0aGUgYXVpcGMvamFsciBpbnN0cnVjdGlvbiBwYWlyIGNhbiBiZSBwYXRjaGVkIGF0b21pY2Fs
bHkganVzdCBhcwpsb25nIGFzIHRoZWlyIHNpemUgaXMgbmF0dXJhbGx5IGFsaWduZWQgb24uIEhv
d2V2ZXIsIHdlIGNhbm5vdCBwcmV2ZW50CjIgaW5zdHJ1Y3Rpb25zIGZyb20gYmVpbmcgZmV0Y2hl
ZCBhdG9taWNhbGx5IDpQCgo+IFNvbHZpbmcgdGhlIGF0b21pYyB0ZXh0IHBhdGNoaW5nIHByb2Js
ZW0gd291bGQgYmUgZnVuISEgSSBhbSBlYWdlciB0bwo+IHNlZSBob3cgaXQgd2lsbCBiZQo+IHNv
bHZlZC4KCkkgaGF2ZSBhIHBhdGNoIHNlcmllcyB0byBzb2x2ZSB0aGUgYXRvbWljIGNvZGUgcGF0
Y2hpbmcgaXNzdWUsIHdoaWNoIEkKYW0gYWJvdXQgdG8gcmVzcGluIFsxXS4gVGhlIGlkZWEgaXMg
dG8gc29sdmUgaXQgd2l0aCB5ZXQgYW5vdGhlciBsYXllcgpvZiBpbmRpcmVjdGlvbi4gV2UgYWRk
IGEgOC1CIGFsaWduZWQgc3BhY2UgYXQgZWFjaCBmdW5jdGlvbiBlbnRyeS4gVGhlCnNwYWNlIGlz
IGEgcG9pbnRlciB0byB0aGUgZnRyYWNlIGVudHJ5LiBEdXJpbmcgYm9vdCwgZWFjaCBmdW5jdGlv
bgplbnRyeSBjb2RlIGlzIHVwZGF0ZWQgdG8gcGVyZm9ybSBhIGxvYWQgYW5kIHRoZW4gdGFrZSB0
aGUganVtcCBmcm9tCnRoZSA4LUIgc3BhY2UuIFdoZW4gZnRyYWNlIGlzIGRpc2FibGVkLCB3ZSBw
YXRjaCB0aGUgZmlyc3QgNEItYWxpZ25lZAppbnN0cnVjdGlvbiB0byBhIGp1bXAgc28gYXMgdG8g
c2tpcCB0aGUgZnRyYWNlIGVudHJ5LgoKV2UgYXJlIHN0aWxsIGRpc2N1c3Npbmcgd2l0aCBBbGV4
IHRvIHNlZSBpZiB3ZSBoYXZlIGEgYmV0dGVyIHdheSB0byBkbwppdC4gSWYgbm90IHRoZW4gSSdk
IHVwZGF0ZSB0aGUgcGF0Y2hzZXQgYW5kIHJlLXNlbmQgaXQuIFRoZXJlJ3MgYQpwZW5kaW5nIGlt
cHJvdmVtZW50IGluIHRoZSBzZXJpZXMgdG8gcmVkdWNlIGNvbXBsZXhpdHkuIFRoZSA4LUIKYWxp
Z25lZCBzcGFjZSBjYW4gYmUgYWRkZWQgYmVmb3JlIHRoZSBmdW5jdGlvbiBlbnRyeSAoanVzdCBs
aWtlIHlvdXIKcGF0Y2gpLgoKPgo+ID4gKiBMYXJnZXIgdGV4dCBzaXplIChmdW5jdGlvbiBhbGln
bm1lbnQgKyBleHRyYSBub3BzKSBCQUQKPiA+ICogU2FtZSBkaXJlY3QgY2FsbCBwZXJmb3JtYW5j
ZSBORVVUUkFMCj4gPiAqIFNhbWUgY29tcGxpY2F0ZWQgdGV4dCBwYXRjaGluZyByZXF1aXJlZCBO
RVVUUkFMCj4gPgo+ID4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8gc2VlIGhvdyB0aGUgcGVy
LWNhbGwgcGVyZm9ybWFuY2Ugd291bGQKPiA+IGltcHJvdmUgb24geDg2IHdpdGggQ0FMTF9PUFMh
IDstKQo+Cj4gSWYgSSByZW1lbWJlciBmcm9tIFN0ZXZlbidzIHRhbGssIHg4NiB1c2VzIGR5bmFt
aWNhbGx5IGFsbG9jYXRlZCB0cmFtcG9saW5lcwo+IGZvciBwZXIgY2FsbHNpdGUgdHJhY2Vycywg
d291bGQgQ0FMTF9PUFMgcHJvdmlkZSBiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbiB0aGF0Pwo+Cj4g
Pgo+ID4gSSdtIHRyeWluZyB0byB3cmFwIG15IGhlYWQgaWYgaXQgbWFrZXMgc2Vuc2UgdG8gaGF2
ZSBpdCBvbiBSSVNDLVYsIGdpdmVuCj4gPiB0aGF0IHdlJ3JlIGEgYml0IGRpZmZlcmVudCBmcm9t
IEFybTY0LiBEb2VzIHRoZSBzY2FsZSB0aXAgdG8gdGhlIEdPT0QKPiA+IHNpZGU/Cj4gPgo+ID4g
T2gsIGFuZCB3ZSByZWFsbHkgbmVlZCB0byBzZWUgcGVyZm9ybWFuY2UgbnVtYmVycyBvbiByZWFs
IEhXISBJIGhhdmUgYQo+ID4gVkYyIHRoYXQgSSBjb3VsZCB0cnkgdGhpcyBzZXJpZXMgb24uCj4K
PiBJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2FuIGRvIGl0IDpELgo+Cj4gVGhhbmtzLAo+IFB1
cmFuamF5Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgotIFsxXSBodHRwczovL3loYnQubmV0L2xvcmUvYWxsL0NBSkYyZ1RTbjNfY0RZc0Y5
RDhkdC1icjJXZl9NOHkwMkEwOXhnUnE4a1hpOTFzTjNBd0BtYWlsLmdtYWlsLmNvbS9ULwoKUmVn
YXJkcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
