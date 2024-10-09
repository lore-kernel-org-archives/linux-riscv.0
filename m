Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953F2CEE345
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1ZG1ssRIMIFhOItYHAELLRrYKy8tWmQK+v9n4/m6YA=; b=MJwNIU+7TRHFJE
	x/agy+S07iS2QY6dPNlDOMO1zPmLqJUnOBf5i5LhkonrA5JNkCS0W7eGpIgOXY9rZNYK4Q1718ECa
	XN/Fl9Rr8roL95hKXiY/iOcqBOISVsl9DZWCBxT+SMn7ZZ7tkwMxb0fi4+un54qneff1IAxzSJjMk
	GUDBCCIgWuHqsp8uTjYQGy/yKDqJPcuUiB41Oc6e6A9Jcvsl/UAK7O+fNvgaHuFYLMdLjd3Dp2DKz
	ozeiTUoZZ8XjQvh3XBiWPSVf2giZ7JTTO4CnSl3/UfQ0rmJenSigXOit3iydWn+gNa4XPrNWb91aJ
	dMIVKZXqOPqFaYwukhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sydAv-0000000Acah-0WTI;
	Wed, 09 Oct 2024 20:20:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syd6A-0000000AbqW-2krA
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 20:15:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d447de11dso86657f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728504948; x=1729109748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=ilI3CNpj0DpSD41+KDETa3MY63nclXhAgYiEd/1ioFcnslZRvy8lq9/Oxt9JIPKYwh
         4c5m8FsQbG8946oRmdYD1DMlemglPeipjY5NBrmyYMaPyIpJlUMJW0HRETatddLrB9YZ
         sgH8RWhTPQQBlcXh/zJFwEfBSXoQ4ltJWWrzYoe3n1GKdg+KvIU057CU1rvXpzGT0rGQ
         v+gol8+5A5kelbjOxC8NXTSPahnWCx/HzbOSJ42wHgEzi9KuD+fnh0gssXHdRRZa0lCv
         WrcmxeNLrNVENT9AV1vND5H9Z9MC2sDN/Ppb6UBF6R1cdSj2HLZIRqk6JmYLPn6xV9jh
         HZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504948; x=1729109748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=Wb5pwnKcS9iSaUlMmn5+9JaluYaFaSio2MMQx32BEwZfETeHygkL6c5VIv+Z2EzNaM
         seEhFQb3/qqLp2rNr+LStLmch7lL6x/x2EQu33gRmwKyiJRM6rIXfnC55+GA5cPnLJki
         kPmYj2tZ8OAWf7riofQt6GHizTz2YrcqI7VTY8V/xztPPY8ZROucjA1EcQDIZptxk+h1
         XhxXrm/y9gxNZjf36UNhFULPcTjeRHQIV8/h89QutElHG3LN2HIFGhr7A1KFiuJsUZSL
         eJewYjVWHNzVTMBiwWbi6B+3dOZz0K1gihCRgNfu96jiHDSuUnuo6qTT6CYTu/mur8ta
         8VhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWRq41M7tEgQEc0cbk/ICRcnYnM21FQ/EdnNvQhQ01DFO27EueR1zK2c9yPBOdbWvVHQF6p0HP8zOYFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEP3UcKFEDGw/sAQgt+X1Fw+ZNNe8+3RXU4z2obDG8iTgbdKBG
	xMy6eCBgm0eIle3qSsJFg21UAhhs/DY0nxyn91CYlK8xN3CsUFJlg4Fg5EZy4lz2UkDz2AMjala
	GJLY/er4aXycPzCkCieWJsCmJ7kxMxj8Qzr6e
X-Google-Smtp-Source: AGHT+IG4D5AOPjh6lAXMstFdrhAhrdd7L2vLhW6l3Khj2c6DWfn6O2lqOxYWrYJyoYoq7CXtYj1MgecC9kXuRRTO+64=
X-Received: by 2002:a5d:4b8c:0:b0:37c:d4f8:3f2e with SMTP id
 ffacd0b85a97d-37d3aacddcfmr2403355f8f.55.1728504947756; Wed, 09 Oct 2024
 13:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com> <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
In-Reply-To: <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 22:15:35 +0200
Message-ID: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_131554_720466_1427BC80 
X-CRM114-Status: GOOD (  31.23  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCA3OjQz4oCvUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGljZSwKPgo+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0
IGF0IDA1OjM3OjE2UE0gKzAwMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiBUaGUgS0NGSSBzYW5p
dGl6ZXIgc3RvcmVzIHRoZSBDRkkgdGFnIG9mIGEgZnVuY3Rpb24ganVzdCBiZWZvcmUgaXRzCj4g
PiBtYWNoaW5lIGNvZGUuIEhvd2V2ZXIsIHRoZSBwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgZmxh
ZyBjYW4gYmUgdXNlZCB0bwo+ID4gaW50cm9kdWNlIGFkZGl0aW9uYWwgbm9wIGluc3RydWN0aW9u
cyBiZWZvcmUgdGhlIG1hY2hpbmUgY29kZSwgdGFraW5nIHVwCj4gPiB0aGUgc3BhY2UgdGhhdCBu
b3JtYWxseSBob2xkcyB0aGUgQ0ZJIHRhZy4KPgo+IFRvIGNsYXJpZnksIHdoZW4geW91IHNheSAi
YmVmb3JlIHRoZSBtYWNoaW5lIGNvZGUiLCBkbyB5b3UgbWVhbiB3aGVuCj4gTk9QcyBhcmUgcGxh
Y2VkIGJlZm9yZSB0aGUgZnVuY3Rpb24gZW50cnkgcG9pbnQ/IGUuZy4gaWYgd2UgY29tcGlsZWQK
PiB3aXRoIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PU0sTiB3aGVyZSBOID4gMD8gSSdsbCBy
ZWZlciB0aG8gdGhpcyBhcwo+ICJwcmUtZnVuY3Rpb24gTk9QcyIgYmVsb3cuCj4KPiBUaGVyZSdz
IGFuIGV4aXN0aW5nIGluY29tcGF0aWJpbGl0eSBiZXR3ZWVuIENGSSBhbmQgcHJlLWZ1bmN0aW9u
IE5PUHMKPiBmb3IgQyBjb2RlLCBiZWNhdXNlIHdlIG92ZXJyaWRlIC1mcGF0Y2hhYmxlLWZ1bmN0
aW9uLWVudHJ5IG9uIGEKPiBwZXItZnVuY3Rpb24gYmFzaXMgKGUuZy4gZm9yIG5vaW5zdHIgYW5k
IG5vdHJhY2UpLCBhbmQgd2UgZG9uJ3QKPiBjdXJyZW50bHkgaGF2ZSBhIG1lY2hhbmlzbSB0byBl
bnN1cmUgdGhlIENGSSB0YWcgaXMgaW4gdGhlIHNhbWUgcGxhY2UKPiByZWdhcmRsZXNzLiBUaGlz
IGlzIHdoeSBhcm02NCBoYXMgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMKPiBk
ZXBlbmQgb24gIUNGSS4KPgo+IEZvciBDIGNvZGUgYXQgbGVhc3QsIGp1c3QgdXNpbmcgcmVndWxh
ciAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT1NIG9yCj4gLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnk9TSwwIHNob3VsZG4ndCBjaGFuZ2UgdGhlIGxvY2F0aW9uIG9mIHRoZSBDRkkKPiB0YWcg
cmVsYXRpdmUgdG8gdGhlIGZ1bmN0aW9uIGVudHJ5cG9pbnQsIGFuZCBzbyBzaG91bGQgaGF2ZSBu
byBhZHZlcnNlCj4gZWZmZWN0IG9uIENGSS4KPgo+IElzIFJ1c3QgYW55IGRpZmZlcmVudCBoZXJl
PwoKQWgsIG5vIGl0IHNob3VsZG4ndCBiZS4gU2FtaSBjYW4geW91IGNvbmZpcm0/Cgo+ID4gSW4g
dGhpcyBjYXNlLCBhIGJhY2t3YXJkcyBvZmZzZXQgaXMgYXBwbGllZCB0byB0aGUgQ0ZJIHRhZyB0
byBtb3ZlCj4gPiB0aGVtIG91dCBvZiB0aGUgd2F5IG9mIHRoZSBub3AgaW5zdHJ1Y3Rpb25zLiBU
byBlbnN1cmUgdGhhdCBDIGFuZCBSdXN0Cj4gPiBhZ3JlZSBvbiB0aGUgb2Zmc2V0IHVzZWQgYnkg
Q0ZJIHRhZ3MsIHBhc3MgdGhlCj4gPiAtWnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSB0byBydXN0
YyB3aGVuZXZlciBpdCBpcyBwYXNzZWQgdG8gdGhlIEMKPiA+IGNvbXBpbGVyLgo+Cj4gQXMgYWJv
dmUsIEkgc3VzcGVjdCB0aGlzIGlzbid0IG5lY2Vzc2FyeSB0byBtYWtlIENGSSB3b3JrLCBmb3Ig
YW55IGNhc2UKPiB0aGF0IHdvcmtzIHdpdGggQyB0b2RheSwgZHVlIHRvIC1mcGF0Y2hhYmxlLWZ1
bnRpb24tZW50cnkgYmVpbmcKPiBvdmVycmlkZGVuIG9uIGEgcGVyLWZ1bmN0aW9uIGJhc2lzLiBB
cmUgeW91IHNlZWluZyBhIHByb2JsZW0gaW4KPiBwcmFjdGljZSwgb3Igd2FzIHRoaXMgZm91bmQg
YnkgaW5zcGVjdGlvbj8KPgo+IEhvd2V2ZXIgSUlVQyB0aGlzIHdpbGwgYWxsb3cgcnVzdCB0byBi
ZSB0cmFjZWQgdmlhIGZ0cmFjZSAoYXNzdW1pbmcgcnVzdAo+IHJlY29yZHMgdGhlIGluc3RydW1l
bnRlZCBsb2NhdGlvbnMgYXMgZ2NjIGFuZCBjbGFuZyBkbyk7IGlzIHRoYXQgdGhlCj4gY2FzZT8g
QXNzdW1pbmcgc28sIGlzIHRoZXJlIGFueSBBQkkgZGlmZmVyZW5jZSB0aGF0IG1pZ2h0IGJpdGUg
dXM/IE9uCj4gYXJtNjQgd2UgcmVxdWlyZSB0aGF0IGFueXRoaW5nIG1hcmtlZCBpbnN0cnVtZW50
ZWQgd2l0aAo+IHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBzdHJpY3RseSBmb2xsb3dzIHRoZSBB
QVBDUzY0IGNhbGxpbmcgY29udmVudGlvbgo+IGFuZCBvdXIgZnRyYWNlIHRyYW1wb2xpbmVzIHNh
dmUvcmVzdG9yZSB0aGUgbWluaW1hbCBzZXQgb2YgbmVjZXNzYXJ5Cj4gcmVnaXN0ZXJzLCBhbmQg
SSBkb24ndCBrbm93IGhvdyBydXN0IHdoZXRoZXIgcnVzdCB3aWxsIGJlaGF2ZSB0aGUgc2FtZQo+
IG9yIGUuZy4gdXNlIHNwZWNpYWxpemVkIGNhbGxpbmcgY29udmVudGlvbnMgaW50ZXJuYWxseS4K
CldlbGwsIEkgd2FzIHRvbGQgdGhhdCBpdCdzIGEgcHJvYmxlbSBhbmQgd2FzIGFibGUgdG8gdHJp
Z2dlciBhIGZhaWx1cmUKb24geDg2LiBJIGRpZG4ndCBtYW5hZ2UgdG8gdHJpZ2dlciBvbmUgb24g
YXJtNjQsIGJ1dCBJIHdhc24ndCBzdXJlCndoZXRoZXIgdGhhdCB3YXMgbWUgZG9pbmcgc29tZXRo
aW5nIHdyb25nLCBvciB3aGV0aGVyIHRoZSBwcm9ibGVtIG9ubHkKZXhpc3RzIG9uIHg4Ni4gV2Ug
YWxyZWFkeSBoYXZlIHRoZSBmbGFnIG9uIHg4NiBmb3IgRklORUlCVCwgYnV0IEkKdGhvdWdodCBv
biB0aGUgb2ZmIGNoYW5jZSB0aGF0IGl0J3Mgbm90IGEgcHJvYmxlbSBpbiBwcmFjdGljZSBvbiBh
cm0sCml0IHN0aWxsIGRvZXNuJ3QgaHVydCB0byBhZGQgdGhlIGZsYWcuCgpSZWdhcmRpbmcgdGhl
IEFBUENTNjQgY2FsbGluZyBjb252ZW50aW9uIHRoaW5nIC4uLiBydXN0YyB1c2VzIHRoZSBSdXN0
CmNhbGxpbmcgY29udmVudGlvbiBmb3IgZnVuY3Rpb25zIGludGVybmFsbHkgaW4gUnVzdCBjb2Rl
IGFuZCBJIGRvbid0Cmtub3cgd2hldGhlciB0aGF0IGNoYW5nZXMgYW55dGhpbmcgcmVsZXZhbnQg
Zm9yIHdoYXQgeW91IG1lbnRpb24uCk1hdHRoZXcvU2FtaSBkbyB5b3Uga25vdz8KCkFsaWNlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
