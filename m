Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC1C47DAF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbCvK0brUYDJ3QXh1SOKbiT8AU3WpylU1mTaV+RJLwQ=; b=umW9/bVHk18fit
	zQ7c44vaae65jMh62vhyUy3YM+jRhsl7pCVYUEcWs9qb3enJkbPy0/zt6BbShfzpj3VnWN1/OYuz6
	io0fIriaHx4OPmpaGcyaGc7UzG8/oGYbUFtkNnXgYZtZaTTIVf5us/O01LeDCyNAW+bbOvJ0eRkzW
	V9QQoxRnwQ4UvG5RIMaFmxISUMstYd3Pp7usITNTaEAZQBrp9wANNqUQHNkUtcINeYIGykynYr1CI
	0ZyLonB6gsnEZLNinijC+CbLGyDBv4ZUAmYg4q/rEzC60s1ajtpVc31Lbilj13SzFhLTu7jUhjDNS
	KO5JksPU64KCb5JYyL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUym-003Cnt-03;
	Thu, 18 Jan 2024 16:10:56 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUyj-003CnU-0c
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 16:10:54 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dc36e501e1so8956261a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 08:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705594192; x=1706198992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sat5XVJBaEElPICy/YsSs9yFT4hHkFR3P2GPDCmg8WA=;
        b=a/f1SyvXSd3S6iJ9pXmwdlHH9vhoZA9FZInch/xmB1OuTqzrOn1GPhLyqBLjeGu3gV
         wgLsCMWjXGgxiyxLumqpNUgPZrTB2X81DjE05KojNCaZutRPGMc9zuwUpqNKbPf47RIE
         +h86OYOdws4iBQYphHmpiG1CAlC8m73cks3jbOzviEdKQSc5qzNjxKaIiN5vTMUV/lj7
         ukaNvdpkMOMOKiLMJGy3POSWoP9gaQTUqtJ5fUj7o9ANWP/BCkt/wlhZixpoRTBaJYp8
         gkyWqfQb7WxN3M8e32QX0t3rVGPnLG3TSZwIp/HiJe/zuTWiGF0kOvnYbjOEbt2MF9mE
         32lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705594192; x=1706198992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sat5XVJBaEElPICy/YsSs9yFT4hHkFR3P2GPDCmg8WA=;
        b=ZWX7NINs545RG7w7W91Vvh8+Vvnwo+NivboWs7+i+8Ol/ao8raKhIzxCAN5FDRAgAQ
         Q1f6wT+4mKnXXQbe4Bi8f1+dG2jt1H7rbgbreBDjbNBwi9qTHZzUpdKmTYK0HgKIP9gP
         B/PlDlc/W5lI7aZfZMSU5jR0rQatfb/4rHHj2SxWAsXZ9PwDoEtC4571/6VYjIpzJbAZ
         AUl6wM/McwoCLf271RUj/0F415QRkXSWusqFj35y18Uh3ABXPY+u0/0OjEKEzF3GtPMT
         CTVmd1ZbR1dVl8tVD1L0+Y+9io17/yoqjN2xKpDwjgqmEwoExnriMvtUuwTvoQKeWH3V
         mRkw==
X-Gm-Message-State: AOJu0YylSzkSJ/A8Bx1vYPmG2+EEvE2WqsmItJbTRoiLVRwN4b8hcFHh
	GllMeXRnB6VUy3SgHoCjZgefrcVVGDRJWFmlcvEpcwS5bXT1HZ4hjImoNUxxxV1TJ9qlislmWmE
	eWl/oTYsqY99dVQ5DyIe0iCbqgft4YT629DYgijHH
X-Google-Smtp-Source: AGHT+IE8BxWk8xSUOVo/9OK4svfp7Z2O77w7n+F5xbpJMja3d2YxFrdU7cRXJ7Wmp+b8zwZAJyZxdCAh53nVnb00V48=
X-Received: by 2002:a05:6830:1e38:b0:6dd:eb6c:8c7 with SMTP id
 t24-20020a0568301e3800b006ddeb6c08c7mr1066678otr.40.1705594192185; Thu, 18
 Jan 2024 08:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com> <20240118-implode-delirium-eefdd86e170e@spud>
In-Reply-To: <20240118-implode-delirium-eefdd86e170e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jan 2024 17:09:40 +0100
Message-ID: <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081053_229785_4DF3012F 
X-CRM114-Status: GOOD (  11.16  )
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

T24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgNDo0OeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgYml0IHRoYXQgd29ycmllcyBtZSBtb3N0IGlzIGJpbmRn
ZW4sIGFuZCBpbiBwYXJ0aWN1bGFyIGRldGVjdGluZyB0aGUKPiB2ZXJzaW9uIG9mIGxpYmNsYW5n
IHVzZWQuIEkgbWVudGlvbmVkIHRvIE5hdGhhbiBvciBOaWNrIGFib3V0IG5lZWRpbmcgYQo+IGJ1
aWxkdGltZSB0ZXN0IGZvciB0aGUgdmVyc2lvbiBvZiBMSUJDTEFORyBiZWluZyB1c2VkLgo+IEkn
bSBsZXNzIHdvcnJpZWQgYWJvdXQgdGhpcyBmb3IgTExWTT0xIGJ1aWxkcywgc2luY2Ugd2hpbGUg
SSB0aGluayBpdCBpcwo+IHBvc3NpYmxlIHRvIHByb3ZpZGUgYSBMSUJDTEFORyBwYXRoIHRvIHRo
ZSBidWlsZCBzeXN0ZW0sIEkgc3VzcGVjdCB0aGF0Cj4gZm9yIExMVk09MSBidWlsZHMgaXQncyBh
bG1vc3QgYWx3YXlzIGdvaW5nIHRvIG1hdGNoIHRoZSBMTFZNIHRvb2xjaGFpbgo+IGluIHVzZS4K
CmBzY3JpcHRzL3J1c3RfaXNfYXZhaWxhYmxlLnNoYCB0ZXN0cyB3aGV0aGVyIGBsaWJjbGFuZ2Ag
aXMgYXQgbGVhc3QKdGhlIG1pbmltdW0gTExWTSBzdXBwb3J0ZWQgdmVyc2lvbjsgYW5kIHVuZGVy
IGBMTFZNPTFgIGJ1aWxkcywgaXQgYWxzbwp0ZXN0cyB3aGV0aGVyIHRoZSBgYmluZGdlbmAgZm91
bmQgb25lIG1hdGNoZXMgdGhlIEMgY29tcGlsZXIuIERvIHlvdQptZWFuIHNvbWV0aGluZyBsaWtl
IHRoYXQ/CgpGb3IgYGJpbmRnZW5gIHVuZGVyIEdDQyBidWlsZHMsIHdlIHdpbGwgZXZlbnR1YWxs
eSB3YW50IGEgInByb3BlciIgd2F5CnRvIHVzZSBHQ0MgaW5zdGVhZCAob3IgcG9zc2libHkgb3Ro
ZXIgYXBwcm9hY2hlcyBsaWtlIHF1ZXJ5aW5nIHRoZQppbmZvcm1hdGlvbik6IGh0dHBzOi8vZ2l0
aHViLmNvbS9ydXN0LWxhbmcvcnVzdC1iaW5kZ2VuL2lzc3Vlcy8xOTQ5LgpSZWNlbnRseSwgdGhl
cmUgaGFzIGJlZW4gYSB0aHJlYWQgaW4gb3VyIFp1bGlwIGFuZCBhIGNvdXBsZSBwZW9wbGUgYXJl
CmV4cGVyaW1lbnRpbmc6IGh0dHBzOi8vcnVzdC1mb3ItbGludXguenVsaXBjaGF0LmNvbS8jbmFy
cm93L3N0cmVhbS8yODgwODktR2VuZXJhbC90b3BpYy9CaW5kZ2VuLjIwLS0uMjBHQ0MuMjBiYWNr
ZW5kLjIwcG9ydAoKPiBJJ2xsIGRvIGFub3RoZXIgcmViYXNlIGFuZCByZXNlbmQgYWZ0ZXIgdGhl
IG1lcmdlIHdpbmRvdyBjbG9zZXMgSQo+IHN1cHBvc2UgOikKClRoYW5rcyEKCkNoZWVycywKTWln
dWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
