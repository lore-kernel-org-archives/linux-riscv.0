Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D8AE7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 19:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upYT8Nu5fJ73l/DEAznxcOpvcYjTtk5ZNsCfs/lfB78=; b=sTOK2d/9LR4GJl
	CnOgoVpTDdQU1gogz18dvOheJYR98AFIrou+u8llPmTmWPu8RZLcDbmhsRDUdGpgM/BXsjGLBDbi5
	5oMQqbqYWaBw6AGDVg8khKjPyjqAiRh26yNhtwAzmyASTsndbNlJ8LP8H63fJbgCaxM5CtVVUS/g8
	nxia93QDbqAWOxPg4kzu5NQ/1RhcUptSzTdruv/aqdk/SuHq36B/N6KuNQEYrMznk1qgo85vRSsEv
	KwEa/1mo4YDDb80XBy44ZaKf9cb5D/qkaYryLY62uxu4sYNWu1lOy1f/+VavqowopauZ2qsg5lPC6
	mbTWPp2GhlhUYmoPYNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyfg-00000003nLj-2nUb;
	Sun, 29 Dec 2024 19:09:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyfd-00000003nLE-4A41
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 19:09:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee74291415so8960226a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Dec 2024 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735499389; x=1736104189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLV20bromzR57IY1Unak28q6U4TXsFtoJ6LiojUAkQY=;
        b=jBm1QoxCAeV6PGANW5Q7yhWhTY7qROiy/4PUx4gC/y4+qyK8nCvooLfunwx85gSsM7
         mH+JmcSWVGuGzsED9DmSF/L9aABsbFpf9cqsJh/RAP5TcY+xx8WPAue2SZWMJ9Tnebnb
         6hnnuLQZoDdCBCGv7qqGDqk/CloBVtgXAQkN8iXtQ+DTWPE23OW5qyXnrr74pOe1Z7Kg
         mTxqXXvR9aOBqTl6gnkR4si8ODS/QDhapBXghEY9JZtTVe1i41SZWH4ci4jQIEZgbEfj
         /OlMImq8Efrd0lrO9tbJVH2IndsJZKCTQQ+8woq1x56z8/4TLDmqiTtmkU7uAuth32eq
         Z0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735499389; x=1736104189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLV20bromzR57IY1Unak28q6U4TXsFtoJ6LiojUAkQY=;
        b=h6fPMc0DqV/BCpL/NApgKH3mc8AlL1vmmdxNneIF1u1AI++fSGB9LU7jRqd5LoNFVw
         bjrxN9LOk62uyJg10ZFOd/TVH2X67wsJ3vApqUL5mY588uzUXs26InTWLKy//XAdlZbE
         MqPcj+s+B/43wONnTU3btdxPWjxDH8NGvHWMSIGI3/vEF0Qv6UK0iCZ54nqIQhbMWNtt
         5TNAx+Y6pPiOt0bteE+tt8JZ7qrKfgjHcR0b7vRnDIcxzf+QNcJ9eZkQCzfTDsbyN/0e
         2WAU5D8Ibvpr5eP0zV+EBqY34V1IJSzFRVy3npca9hxEkQ7Llgvdn7qAprvus2KXs2n4
         X2nA==
X-Forwarded-Encrypted: i=1; AJvYcCUvooYYX+2UjIFzh3LgwURRMUle/p99yeomZGRQHCljtM25QhDFGYNZ4rFiCYhgeR7NyklGqLvL7ocpvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlk4hL0+a7mu3BxA9qruer0AVpbxaXDGDRHo//BAdZGRCaypN7
	8aWzW1ZKfcg4GkM//ScfcJqjqwVebBzJTYVtPX1DtOp0uz4xwXtCjwfytUUfLQJVk07NQsMkjaM
	Zskk4U0cEibZENB4W1VC7WEJQ3v8=
X-Gm-Gg: ASbGncswJNwDqILwbxqHENaZV4Dnb9L/cazNz4dGwGq/wF6rY2UVH6AoxzUkq//us9H
	n1xQyaWL6dDIFiFL2LunGwjtUA1jbP77LA1o=
X-Google-Smtp-Source: AGHT+IE7Tm8Mby3gPyNsg+/b10UHatLbPwY4DMX0HrwWi6WxBOR1WIfuspFPxlHAL3JLR9SzCcUearx0rAjJKnBNpWA=
X-Received: by 2002:a17:90b:2d43:b0:2ee:c797:e27f with SMTP id
 98e67ed59e1d1-2f452eed977mr42563935a91.36.1735499388635; Sun, 29 Dec 2024
 11:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <87frncmkre.fsf@all.your.base.are.belong.to.us>
 <20241223221556.1f5e598f@gandalf.local.home>
In-Reply-To: <20241223221556.1f5e598f@gandalf.local.home>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 30 Dec 2024 03:08:00 +0800
Message-ID: <CAFTtA3Nb66VZGoMVfrVs6cYLorjbSX8GmThyKB1FFvfg2HknpA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: Steven Rostedt <rostedt@goodmis.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_110950_125950_232FCE3F 
X-CRM114-Status: GOOD (  46.72  )
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

U3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IOaWvCAyMDI05bm0MTLmnIgyNOaX
pSDpgLHkuowg5LiK5Y2IMTE6MTXlr6vpgZPvvJoKPgo+IE9uIFdlZCwgMjcgTm92IDIwMjQgMjI6
MjU6NTcgKzAxMDAKPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPgo+
ID4gQWRkaW5nIFN0ZXZlbi4KPgo+IEFuZCB0aGlzIGhhcyBiZWVuIGluIG15IGRyYWZ0IGZvbGRl
ciBmb3IgYWxtb3N0IGEgbW9udGggOi1wCj4KPiBJIGtlcHQgY29taW5nIHRvIHRoaXMgZW1haWws
IGJ1dCB0aGVuIGdvdCBkaXN0cmFjdGVkIGJ5IHNvbWV0aGluZyBlbHNlLgo+Cj4gPgo+ID4gQW5k
eSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+IHdyaXRlczoKPiA+Cj4gPiA+IFRoaXMgc2VyaWVz
IG1ha2VzIGF0bW9pYyBjb2RlIHBhdGNoaW5nIHBvc3NpYmxlIGluIHJpc2N2IGZ0cmFjZS4gQQo+
ID4gPiBkaXJlY3QgYmVuZWZpdCBvZiB0aGlzIGlzIHRoYXQgd2UgY2FuIGdldCByaWQgb2Ygc3Rv
cF9tYWNoaW5lKCkgd2hlbgo+ID4gPiBwYXRjaGluZyBmdW5jdGlvbiBlbnRyaWVzLiBUaGlzIGFs
c28gbWFrZXMgaXQgcG9zc2libGUgdG8gcnVuIGZ0cmFjZQo+ID4gPiB3aXRoIGZ1bGwga2VybmVs
IHByZWVtcHRpb24uIEJlZm9yZSB0aGlzIHNlcmllcywgdGhlIGtlcm5lbCBpbml0aWFsaXplcwo+
ID4gPiBwYXRjaGFibGUgZnVuY3Rpb24gZW50cmllcyB0byBOT1A0ICsgTk9QNC4gVG8gc3RhcnQg
dHJhY2luZywgaXQgdXBkYXRlcwo+ID4gPiBlbnRyaWVzIHRvIEFVSVBDICsgSkFMUiB3aGlsZSBo
b2xkaW5nIG90aGVyIGNvcmVzIGluIHN0b3BfbWFjaGluZS4KPiA+ID4gc3RvcF9tYWNoaW5lKCkg
aXMgcmVxdWlyZWQgYmVjYXVzZSBpdCBpcyBpbXBvc3NpYmxlIHRvIHVwZGF0ZSAyCj4gPiA+IGlu
c3RydWN0aW9ucywgYW5kIGJlIHNlZW4gYXRvbWljYWxseS4gQW5kIHByZWVtcHRpb24gbXVzdCBo
YXZlIHRvIGJlCj4gPiA+IHByZXZlbnRlZCwgYXMga2VybmVsIHByZWVtcHRpb24gYWxsb3dzIHBy
b2Nlc3MgdG8gYmUgc2NoZWR1bGVkIG91dCB3aGlsZQo+ID4gPiBleGVjdXRpbmcgb24gb25lIG9m
IHRoZXNlIGluc3RydWN0aW9uIHBhaXJzLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBhZGRyZXNz
ZXMgdGhlIHByb2JsZW0gYnkgaW5pdGlhbGl6aW5nIHRoZSBmaXJzdCBOT1A0IHRvCj4gPiA+IEFV
SVBDLiBTbywgYXRtb2ljIHBhdGNoaW5nIGlzIHBvc3NpYmxlIGJlY2F1c2UgdGhlIGtlcm5lbCBv
bmx5IGhhcyB0bwo+ID4gPiB1cGRhdGUgb25lIGluc3RydWN0aW9uLiBBcyBsb25nIGFzIHRoZSBp
bnN0cnVjdGlvbiBpcyBuYXR1cmFsbHkgYWxpZ25lZCwKPiA+ID4gdGhlbiBpdCBpcyBleHBlY3Rl
ZCB0byBiZSB1cGRhdGVkIGF0b21pY2FsbHkuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIHRoZSBhZGRy
ZXNzIHJhbmdlIG9mIHRoZSBmdHJhY2UgdHJhbXBvbGluZSBpcyBsaW1pdGVkIHRvICstMksKPiA+
ID4gZnJvbSBmdHJhY2VfY2FsbGVyIGFmdGVyIGFwcHBseWluZyB0aGlzIHNlcmllcy4gVGhpcyBp
c3N1ZSBpcyBleHBlY3RlZAo+ID4gPiB0byBiZSBzb2x2ZWQgYnkgUHVyYW5qYXkncyBDQUxMX09Q
Uywgd2hlcmUgaXQgYWRkcyA4QiBuYXR1cmFsbHkgYWxpZ24KPiA+ID4gZGF0YSBpbiBmcm9udCBv
ZiBwYWN0aGFibGUgZnVuY3Rpb25zIGFuZCBjYW4gIHVzZSBpdCB0byBkaXJlY3QgZXhlY3V0aW9u
Cj4gPiA+IG91dCB0byBhbnkgY3VzdG9tIHRyYW1wb2xpbmVzLgo+ID4gPgo+ID4gPiBUaGUgc2Vy
aWVzIGlzIGNvbXBvc2VkIGJ5IHRocmVlIHBhcnRzLiBUaGUgZmlyc3QgcGFydCBjbGVhbnMgdXAg
dGhlCj4gPiA+IGV4aXN0aW5nIGlzc3VlcyB3aGVuIHRoZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0
aCBjbGFuZy5UaGUgc2Vjb25kIHBhcnQKPiA+ID4gbW9kaWZpZXMgdGhlIGZ0cmFjZSBjb2RlIHBh
dGNoaW5nIG1lY2hhbmlzbSAoMi00KSBhcyBtZW50aW9uZWQgYWJvdmUuCj4gPiA+IFRoZW4gcHJl
cGFyZSBmdHJhY2UgdG8gYmUgYWJsZSB0byBydW4gd2l0aCBrZXJuZWwgcHJlZW1wdGlvbiAoNSw2
KQo+ID4gPgo+ID4gPiBBbiBvbmdvaW5nIGZpeDoKPiA+ID4KPiA+ID4gU2luY2UgdGhlcmUgaXMg
bm8gcm9vbSBmb3IgbWFya2luZyAqa2VybmVsX3RleHRfYWRkcmVzcyBhcyBub3RyYWNlWzFdIGF0
Cj4gPiA+IHNvdXJjZSBjb2RlIGxldmVsLCB0aGVyZSBpcyBhIHNpZ25pZmljYW50IHBlcmZvcm1h
bmNlIHJlZ3Jlc3Npb24gd2hlbgo+ID4gPiB1c2luZyBmdW5jdGlvbl9ncmFwaCB3aXRoIFRSQUNF
X0lSUUZMQUdTIGVuYWJsZWQuIFRoZXJlIGNhbiBiZSBhcyBtdWNoIGFzCj4gPiA+IDggZ3JhcGgg
aGFuZGxlciBiZWluZyBjYWxsZWQgaW4gZWFjaCBmdW5jdGlvbi1lbnRyeS4gVGhlIGN1cnJlbnQK
PiA+ID4gd29ya2Fyb3VuZCByZXF1aXJlcyB1cyBlY2hvICIqa2VybmVsX3RleHRfYWRkcmVzcyIg
aW50bwo+ID4gPiBzZXRfZnRyYWNlX25vdHJhY2UgYmVmb3JlIHN0YXJ0aW5nIHRoZSB0cmFjZS4g
SG93ZXZlciwgd2Ugb2JzZXJ2ZWQgdGhhdAo+ID4gPiB0aGUga2VybmVsIHN0aWxsIGVuYWJsZXMg
dGhlIHBhdGNoIHNpdGUgaW4gc29tZSBjYXNlcyBldmVuIHdpdGgKPiA+ID4gKmtlcm5lbF90ZXh0
X2FkZHJlc3MgcHJvcGVybHkgYWRkZWQgaW4gdGhlIGZpbGUgV2hpbGUgdGhlIHJvb3QgY2F1c2Ug
aXMKPiA+ID4gc3RpbGwgdW5kZXIgaW52ZXN0YWd0aW9uLCB3ZSBjb25zaWRlciB0aGF0IGl0IHNo
b3VsZCBub3QgYmUgdGhlIHJlYXNvbgo+ID4gPiBmb3IgaG9sZGluZyBiYWNrIHRoZSBjb2RlIHBh
dGNoaW5nLCBpbiBvcmRlciB0byB1bmJsb2NrIHRoZSBjYWxsX29wcwo+ID4gPiBwYXJ0Lgo+ID4K
PiA+IE1heWJlIFN0ZXZlbiBrbm93cyB0aGlzIGZyb20gdGhlIHRvcCBvZiBoaXMgaGVhZCEKPiA+
Cj4gPiBBcyBBbmR5IHBvaW50cyBvdXQsICIqa2VybmVsX3RleHRfYWRkcmVzcyIgaXMgdXNlZCBp
biB0aGUgc3RhY2sKPiA+IHVud2luZGluZyBvbiBSSVNDLVYuIFNvLCBpZiB5b3UgZG8gYSB0cmFj
aW5nIHdpdGhvdXQgZmlsdGVyaW5nICphbmQqCj4gPiBUUkFDRV9JUlFGTEFHUywgb25lIHdpbGwg
ZHJvd24gaW4gdHJhY2VzLgo+Cj4gSSB0ZXN0ZWQgc2V0X2Z0cmFjZV9ub3RyYWNlIG9uIHg4NiBh
bmQgdGhlIGZ1bmN0aW9uIGdyYXBoIHRyYWNlciBkb2VzIGhvbm9yCj4gaXQuIEkgd29uZGVyIGlm
IHRoZXJlJ3MgYSBrZXJuZWwKCkFmdGVyIGNoZWNraW5nIHRoZSBsb2cgYnVmZmVyLCBJIGNhbiBj
b25maXJtIHRoYXQgcmlzY3YgZG9lcyBhbHNvCmhvbm9yIHNldF9mdHJhY2Vfbm90cmFjZS4gSXQg
ZG9lcyBub3QgcHJpbnQgb3V0ICIqa2VybmVsX3RleHRfYWRkcmVzcyIKaW4gdGhlIHRyYWNlIGJ1
ZmZlci4gU29ycnkgZm9yIG5vdCBtYWtpbmcgdGhpcyBjbGVhci4KCkhvd2V2ZXIsIHRoZSBwcm9i
bGVtIGlzIHRoYXQgdGhlIHBhdGNoIHNpdGVzICIqa2VybmVsX3RleHRfYWRkcmVzcyIKd2VyZSBl
bmFibGVkLCBhbGxvd2luZyB0aGUgY29kZSBmbG93IGludG8gZnRyYWNlIGFuZCBwYXJ0cyBvZiBm
Z3JhcGguCkluIHBhcnRpY3VsYXIsIHdpdGggVFJBQ0VfSVJRRkxBR1MgZW5hYmxlZCwgdGhlIGZ1
bmN0aW9ucyBhcmUgY2FsbGVkCmV4dGVuc2l2ZWx5LCBjYXVzaW5nIHRoZSBzaWduaWZpY2FudCBz
bG93IGRvd24uCgpJSVVDLCBpdCBpcyByZWFzb25hYmxlIHRvIGVuYWJsZSBhIHBhdGNoIHNpdGUg
aWYgdGhlcmUgaXMgYXQgbGVhc3Qgb25lCnRyYWNpbmcgaW5zdGFuY2UgdGhhdCByZXF1ZXN0IHRo
ZSBmdW5jdGlvbi4gSG93ZXZlciwgaW4gYW5vdGhlcgpleHBlcmltZW50LCB0aGUgcGF0Y2ggc2l0
ZXMgb2YgIiprZXJuZWxfdGV4dF9hZGRyZXNzIiAgYXJlIGVuYWJsZWQKZXZlbiB3aGVuIGFsbCBp
bnN0YW5jZXMgaGF2ZSB0aGVtIGRpc2FibGVkLiBIZXJlIGlzIGEgd2F5IHRvIHJlcHJvZHVjZQpp
dDoKCmNkIC9zeXMva2VybmVsLwptb3VudCAtdCB0cmFjZWZzIHQgdHJhY2luZy8KY2QgdHJhY2lu
Zy8KbWtkaXIgaW5zdGFuY2VzLzEKbWtkaXIgaW5zdGFuY2VzLzIKY2QgaW5zdGFuY2VzLzEvCmVj
aG8gKmtlcm5lbF90ZXh0X2FkZHJlc3MgPiBzZXRfZnRyYWNlX25vdHJhY2UKZWNobyAqc2NoZWQq
ID4gc2V0X2Z0cmFjZV9maWx0ZXIgIyB0aGlzIGlzIGp1c3QgdG8gbWFrZSB0aGUga2VybmVsCm1v
cmUgcmVzcG9uc2l2ZQpjYXQgc2V0X2Z0cmFjZV9ub3RyYWNlCmVjaG8gZnVuY3Rpb25fZ3JhcGgg
PiBjdXJyZW50X3RyYWNlcgpjZCAuLi8yLwplY2hvICprZXJuZWxfdGV4dF9hZGRyZXNzID4gc2V0
X2Z0cmFjZV9ub3RyYWNlCmNhdCBzZXRfZnRyYWNlX25vdHJhY2UKZWNobyBmdW5jdGlvbl9ncmFw
aCA+IGN1cnJlbnRfdHJhY2VyCgpUbyBmaWd1cmUgb3V0IHRoaXMgcHJvYmxlbSwgaXQgaXMgcHJv
YmFibHkgd29ydGggdHJ5aW5nIHRvIHVuZGVyc3RhbmQKd2h5IHRoZSBwYXRjaCBzaXRlIGlzIGVu
YWJsZWQgYWZ0ZXIgdGhlIGFib3ZlIHNlcXVlbmNlOgoKSXQgc2VlbXMgbGlrZSB0aGUgZnRyYWNl
X29wcyBiZWluZyBwYXNzZWQgaW50bwpfX2Z0cmFjZV9oYXNoX3JlY191cGRhdGUoKSBhdCB0aGUg
c3RhcnQgb2YgdGhlIHNlY29uZCB0cmFjZXIgaGFzIGFuCmVtcHR5IG5vdHJhY2UgaGFzaC4gVGhp
cyBsZWFkcyB0byB0aGUgZXZlbnR1YWwgYWN0aXZhdGlvbiBvZiB0aGUgcGF0Y2gKc2l0ZXMuIEhv
d2V2ZXIsIGdyYXBoX29wcyBkb2VzIG5vdCBoYXZlIHRoZSBlbXB0eSBub3RyYWNlIGhhc2ggd2hl
bgp0aGUgdXNlciBzdGFydHMgdGhlIGZpcnN0IGdyYXBoIHRyYWNlci4gSSBhbSB0cnlpbmcgdG8g
dW5kZXJzdGFuZCB0aGlzCnBhcnQgb2YgdGhlIGNvZGUsIGFuZCB0aGUgcmVsYXRpb25zaGlwIGJl
dHdlZW4gZ3JhcGhfb3BzIGFuZCBvcHMgaW4KdGhlIGZncmFwaF9hcnJheS4KCj4KPiA+Cj4gPiBF
LmcuIHRoZSBmdHJhY2Ugc2VsZnRlc3Q6Cj4gPiAgIHwgJCAuL2Z0cmFjZXRlc3QgLXZ2diB0ZXN0
LmQvZnRyYWNlL2ZncmFwaC1tdWx0aS50Ywo+ID4KPiA+IHdpbGwgZ2VuZXJhdGUgYSBsb3Qgb2Yg
dHJhY2VzLgo+ID4KPiA+IE5vdywgaWYgd2UgYWRkOgo+ID4gLS04PC0tCj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC9mdHJhY2UvZmdyYXBoLW11
bHRpLnRjIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC9mdHJhY2UvZmdy
YXBoLW11bHRpLnRjCj4gPiBpbmRleCBmZjg4Zjk3ZTQxZmIuLjRmMzBhNGQ4MWQ5OSAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZnRyYWNlL2Zn
cmFwaC1tdWx0aS50Ywo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rl
c3QuZC9mdHJhY2UvZmdyYXBoLW11bHRpLnRjCj4gPiBAQCAtODQsNiArODQsNyBAQCBjZCAkSU5T
VEFOQ0UyCj4gPiAgZG9fdGVzdCAnKnJjdSonICdyY3UnCj4gPiAgY2QgJFdECj4gPiAgY2QgJElO
U1RBTkNFMwo+ID4gK2VjaG8gJyprZXJuZWxfdGV4dF9hZGRyZXNzJyA+IHNldF9mdHJhY2Vfbm90
cmFjZQo+ID4gIGVjaG8gZnVuY3Rpb25fZ3JhcGggPiBjdXJyZW50X3RyYWNlcgo+ID4KPiA+ICBz
bGVlcCAxCj4gPiAtLT44LS0KPiA+Cj4gPiBUaGUgZ3JhcGggdHJhY2VyIHdpbGwgbm90IGhvbm9y
IHRoZSAic2V0X2Z0cmFjZV9ub3RyYWNlIiBpbiAkSU5TVEFOQ0UzLAo+ID4gYnV0IHN0aWxsIGVu
YWJsZSB0aGUgKmtlcm5lbF90ZXh0X2FkZHJlc3MgdHJhY2VzLiAoTm90ZSB0aGF0IHRoZXJlIGFy
ZQo+ID4gbm8gZmlsdGVycyBpbiB0aGUgdGVzdCwgc28gKmFsbCogZnRyYWNlIHJlY3Mgd2lsbCBi
ZSBlbmFibGVkLikKPiA+Cj4gPiBBcmUgd2UgaG9sZGluZyB0aGUgZ3JhcGggdHJhY2VyIHdyb25n
Pwo+Cj4gV2hhdCBkbyB5b3UgZ2V0IHdoZW4geW91IGRvOgo+Cj4gICAjIGdyZXAga2VybmVsX3Rl
eHRfYWRkcmVzcyBhdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+Cj4gPwoKV2UgZ2V0OgprZXJu
ZWxfdGV4dF9hZGRyZXNzCl9fa2VybmVsX3RleHRfYWRkcmVzcwoKPgo+ID4KPiA+Cj4gPiBIYXBw
eSB0aGFua3NnaXZpbmchCj4gPiBCasO2cm4KPgo+IEFuZCBNZXJyeSBDaHJpc3RtYXMhCj4KPiAt
LSBTdGV2ZQo+CgpBbmQgSGFwcHkgTmV3IFllYXIhCgoKQW5keQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
