Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AECC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcSLGR0q08ve8/mP8NC4ngA4dcJuRR29TorDIP8nxkE=; b=zJJVoLBXiCBbaH
	Lk0FU7dnP4VLzBsTFpCFSRZ1FV16gKBpG1gemhqeuHqn9ohkrVJJ9oNIJnNRAKwfKlFnM/uHbuwK3
	rM5Wcl/GCLap+u1mRlLpks5Im8ZwJE1QMHRgRyRDzT7/mGKcCxop4T4Oqcv5+P+pEI98xnn7e4O0B
	zm18kxAtx/rLMDQLTK9zZRrTBwcCuT2qFOyW0PtPU4d6KbZFrWLd5WJDiMSx/bhki6e+uZvPcOtYI
	awDBQycqfPuVTuy2I7p6V80MVeZP3Xeao1MwFYmhwUhDrH6E7ey3URT1tHBgx2nrTg3k2bGcsthTh
	3ArLmMkpB7fRIXbxjN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMvu-00Dyqv-0Q;
	Thu, 04 Jan 2024 12:34:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMvs-00Dyq4-07
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 062C8B817F8
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 12:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C80AC433AB
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704371680;
	bh=YBSO9bFUdjHXMmwnv8QYHsH5XLwkPyIXIcsKP+nlHj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ArQBnQlbA961osCTYyurMl4fMsEHP9rcXBySydb7H2GrfvjuFIHlcJmrFzWVwvYQ4
	 FDqdKJZuisZJoyEiZjUveLsFba4B8vpS8YHjakhXDKqmMA31tNHaYXJmb9fTXfXxEE
	 P6lo27bcB0xbjtrxh1ZtzhDeqdXx15iutxjLrQm9BwDznub4NzxoJrmulFb2/tlJze
	 TwUPmWGYyViDl0b5sAO7WFbslF4glsOwAvzBGSJEQbZl62psPo9W7X9mlcKPU6NTzN
	 YZJLLBy1N/a31rG+pr9oMMQhfjAKJXXH+ig0Wd7jHKGlSsXZfQTo11n+gwWPHoMeRW
	 QDX/bKcNlOj2g==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so587973a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:34:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzNiM13tMGiqNjfkoIc99JYgtefcvC2mv4UXuz6vUWWIX4yRJaA
	UVDfg7kqiwX8oNq/vmX7WOaS3xBiJmaJSFlto5I=
X-Google-Smtp-Source: AGHT+IEZX4CnD72tOCKP22C1SMmvToEV1jIql5GVn4NLrtmfbZ0EjB8kSHNbJsA3RjXExrEf2ifyDYezhySVRxWiSIM=
X-Received: by 2002:a17:906:7185:b0:a28:abc4:351b with SMTP id
 h5-20020a170906718500b00a28abc4351bmr178980ejk.200.1704371678660; Thu, 04 Jan
 2024 04:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20231229143627.22898-1-andy.chiu@sifive.com> <20231229143627.22898-7-andy.chiu@sifive.com>
In-Reply-To: <20231229143627.22898-7-andy.chiu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Jan 2024 20:34:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS4kSDxw4+AV2Ymu-s4QGLm5pXgKTk5H2iG97Rmpqnahw@mail.gmail.com>
Message-ID: <CAJF2gTS4kSDxw4+AV2Ymu-s4QGLm5pXgKTk5H2iG97Rmpqnahw@mail.gmail.com>
Subject: Re: [v9, 06/10] riscv: fpu: drop SR_SD bit checking
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, 
	peterz@infradead.org, tglx@linutronix.de, ebiggers@kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043444_207798_8435D140 
X-CRM114-Status: GOOD (  14.29  )
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

T24gRnJpLCBEZWMgMjksIDIwMjMgYXQgMTA6MzfigK9QTSBBbmR5IENoaXUgPGFuZHkuY2hpdUBz
aWZpdmUuY29tPiB3cm90ZToKPgo+IFNSX1NEIHN1bW1hcml6ZXMgdGhlIGRpcnR5IHN0YXR1cyBv
ZiBGUy9WUy9YUy4gSG93ZXZlciwgdGhlIGN1cnJlbnQgY29kZQo+IHN0cnVjdHVyZSBkb2VzIG5v
dCBmdWxseSB1dGlsaXplIGl0IGJlY2F1c2UgZWFjaCBleHRlbnNpb24gc3BlY2lmaWMgY29kZQo+
IGlzIGRpdmlkZWQgaW50byBhbiBpbmRpdmlkdWFsIHNlZ21lbnQuIFNvIHJlbW92ZSB0aGUgU1Jf
U0QgY2hlY2sgZm9yCj4gbm93LgpJdCBzZWVtcyBTUl9TRCBpcyB1c2VsZXNzIGluIHRoZSBzcGVj
cyBiZWNhdXNlIG9mIGl0cyBkdXBsaWNhdGUuIEZTL1ZTCmNvbnRleHRzIGFyZSBzZXBhcmF0ZS4K
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oIHwgMyArLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3N3aXRjaF90by5oCj4gaW5kZXggZjkwZDhlNDJmM2M3Li43ZWZkYjA1ODRkNDcgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiBAQCAtNTMsOCArNTMsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fZnB1KHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJldiwKPiAg
ICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzOwo+Cj4gICAgICAgICByZWdzID0gdGFza19wdF9y
ZWdzKHByZXYpOwo+IC0gICAgICAgaWYgKHVubGlrZWx5KHJlZ3MtPnN0YXR1cyAmIFNSX1NEKSkK
PiAtICAgICAgICAgICAgICAgZnN0YXRlX3NhdmUocHJldiwgcmVncyk7Cj4gKyAgICAgICBmc3Rh
dGVfc2F2ZShwcmV2LCByZWdzKTsKPiAgICAgICAgIGZzdGF0ZV9yZXN0b3JlKG5leHQsIHRhc2tf
cHRfcmVncyhuZXh0KSk7Cj4gIH0KPgo+IC0tCj4gMi4xNy4xCj4KUmV2aWV3ZWQtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
