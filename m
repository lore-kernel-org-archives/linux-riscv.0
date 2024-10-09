Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC9CEE347
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cueTf8nSss5Li9/3RzCW5F/dJkQWUKBMYj/zEHB7UEE=; b=bB8Tnw+XQImOR4
	LNlKEjDDQpJju6KX3PsR6sCFwHqKS4XoxXsJidG+LQvZd0dENKWsymjf0QHJ/wj28vuqI6Utr5aTe
	1/ZpLPyqDTDSaWqlnExxzGVu1cBCQx8yfI4E6XDF8tTrOte8W39VDSilws9gih1oFksV/WE/5tAbY
	JLa64pAWviqKvsik4KCXIaTeH7yL2uBy4ei4p8WG5Qdea9rC19i7C9S9LXqpwER7bhl3MG8V3Nh+f
	Ywewc+XLEfw/H2r4yKLs3z803A6AYGyXK1ICLW3w+T0J9ekCvxi0iDNKifFeqoUgiglam8Ni9UT47
	V+IWtCQ+ibAOGLnug+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sydOW-0000000AdxG-1xN5;
	Wed, 09 Oct 2024 20:34:52 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sydNB-0000000Adpr-0Fpa
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 20:33:30 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4601a471aecso20811cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728506007; x=1729110807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Z6xVqchyvePEhyFbcGCbGYDr+RxMXxMhTkzYEJUwc=;
        b=1TeFPYLwkcBGFJUOwaIPdT1s9JXXZRUn9siu7T6fogWhPlZdI5W4yYR6fV1tYg2o09
         fMleLd7/z5BX22Mca6DRiVHUqP1U04w01BsFl11x8K0NbZP4OJIIwWc4i8+Uz/TQR0m6
         PTBPS1YkvyijND6Y1WOShJlZuivDAa3Gm19OJI+bv/3Vm4FSNuPIf+mjDGbbL+Y5Mt1e
         rMyZRu5kwuakdu9t4ehcH2zlsfVEIQpyGZgscg3kkdaoo7zJblXlScFFkK8WVFYaSdzF
         VO6994yoJv+Fm1+YqUYIaeTVKYuKcfz5w2rBJ4wy2fAboRif/I/HrxvWMFtkUW/mxNz1
         6xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506007; x=1729110807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3Z6xVqchyvePEhyFbcGCbGYDr+RxMXxMhTkzYEJUwc=;
        b=EKydtIWM3de7BEpUkv4/LSu0vnfGsG2ibQ68XK6UERyVr7BFCQirtLZDbYZieTp5CH
         fF+IWr23wJQ9OkXj9bTYF1rUhSbTM2f2TQ5LKg561BSghTeoE8aZBkL4FbeDeP9dGkJp
         cbval9WIEIVmWhCfYfXqNIpmhVKypfkLWlFz4psgDvJUKh5MApKn/ONRHCv2BmLz0NfI
         T9Z7RXJrITx4Br/+nTD+bOZsFj/drqJrT8AdLaCpnDLUQtPuZsxME1qoDRHYCAua435E
         Kq+zzJI5tU4VugHYgs1pmekgf5ry3N2izzUAHSt81CHzSqtIp3BJNuU/pGQDP6bahnUc
         /E+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcoKz1m6nUYxNF6u1hLuC+BYQMpzYAi4bBj6VeiFG3jH6LvLkHYsImzeTk1PsRmeBMh0I9CNLkUr2Yww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk5Gof093zhG4P0VVPaC5L5FODwFdLrpA0s2I1CvJCuflgEHYE
	zlwwXytPX8Sv4Vc7empu62Pgz8tlBGYH1e0xkf0ykj28zntVCr/OSqyqE29yr9tlkKDhGloNCI6
	MNqyE2vtq7uajsl7gAlYf7j9yzUBOPjMoQHZI
X-Google-Smtp-Source: AGHT+IH2eHhPIlYCkvIKDRvl0HccBxY6IuEQCiXmalbJ952EMdFHDlwr+M0C26/wqu6RWinAzZSETQFZjxJu8xv+JI0=
X-Received: by 2002:a05:622a:5497:b0:447:dbac:facd with SMTP id
 d75a77b69052e-46040469e85mr751951cf.24.1728506007151; Wed, 09 Oct 2024
 13:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
In-Reply-To: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 20:32:50 +0000
Message-ID: <CABCJKuej95SJjJuCuzwFpPUJG+iprc=gFgnZmuAE_MU5yMAppg@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
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
X-CRM114-CacheID: sfid-20241009_133329_161564_231185FE 
X-CRM114-Status: GOOD (  28.30  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCA4OjE14oCvUE0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgOSwgMjAyNCBhdCA3OjQz4oCvUE0gTWFy
ayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlcmUncyBh
biBleGlzdGluZyBpbmNvbXBhdGliaWxpdHkgYmV0d2VlbiBDRkkgYW5kIHByZS1mdW5jdGlvbiBO
T1BzCj4gPiBmb3IgQyBjb2RlLCBiZWNhdXNlIHdlIG92ZXJyaWRlIC1mcGF0Y2hhYmxlLWZ1bmN0
aW9uLWVudHJ5IG9uIGEKPiA+IHBlci1mdW5jdGlvbiBiYXNpcyAoZS5nLiBmb3Igbm9pbnN0ciBh
bmQgbm90cmFjZSksIGFuZCB3ZSBkb24ndAo+ID4gY3VycmVudGx5IGhhdmUgYSBtZWNoYW5pc20g
dG8gZW5zdXJlIHRoZSBDRkkgdGFnIGlzIGluIHRoZSBzYW1lIHBsYWNlCj4gPiByZWdhcmRsZXNz
LiBUaGlzIGlzIHdoeSBhcm02NCBoYXMgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9P
UFMKPiA+IGRlcGVuZCBvbiAhQ0ZJLgo+ID4KPiA+IEZvciBDIGNvZGUgYXQgbGVhc3QsIGp1c3Qg
dXNpbmcgcmVndWxhciAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT1NIG9yCj4gPiAtZnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeT1NLDAgc2hvdWxkbid0IGNoYW5nZSB0aGUgbG9jYXRpb24gb2Yg
dGhlIENGSQo+ID4gdGFnIHJlbGF0aXZlIHRvIHRoZSBmdW5jdGlvbiBlbnRyeXBvaW50LCBhbmQg
c28gc2hvdWxkIGhhdmUgbm8gYWR2ZXJzZQo+ID4gZWZmZWN0IG9uIENGSS4KPiA+Cj4gPiBJcyBS
dXN0IGFueSBkaWZmZXJlbnQgaGVyZT8KPgo+IEFoLCBubyBpdCBzaG91bGRuJ3QgYmUuIFNhbWkg
Y2FuIHlvdSBjb25maXJtPwoKS0NGSSBpcyBpbXBsZW1lbnRlZCBpbiB0aGUgTExWTSBiYWNrLWVu
ZCwgc28gdGhlIGJlaGF2aW9yIGlzIGV4YWN0bHkKdGhlIHNhbWUgZm9yIGJvdGggQyBhbmQgUnVz
dC4KCj4gPiBBcyBhYm92ZSwgSSBzdXNwZWN0IHRoaXMgaXNuJ3QgbmVjZXNzYXJ5IHRvIG1ha2Ug
Q0ZJIHdvcmssIGZvciBhbnkgY2FzZQo+ID4gdGhhdCB3b3JrcyB3aXRoIEMgdG9kYXksIGR1ZSB0
byAtZnBhdGNoYWJsZS1mdW50aW9uLWVudHJ5IGJlaW5nCj4gPiBvdmVycmlkZGVuIG9uIGEgcGVy
LWZ1bmN0aW9uIGJhc2lzLiBBcmUgeW91IHNlZWluZyBhIHByb2JsZW0gaW4KPiA+IHByYWN0aWNl
LCBvciB3YXMgdGhpcyBmb3VuZCBieSBpbnNwZWN0aW9uPwo+ID4KWy4uXQo+IFdlbGwsIEkgd2Fz
IHRvbGQgdGhhdCBpdCdzIGEgcHJvYmxlbSBhbmQgd2FzIGFibGUgdG8gdHJpZ2dlciBhIGZhaWx1
cmUKPiBvbiB4ODYuIEkgZGlkbid0IG1hbmFnZSB0byB0cmlnZ2VyIG9uZSBvbiBhcm02NCwgYnV0
IEkgd2Fzbid0IHN1cmUKPiB3aGV0aGVyIHRoYXQgd2FzIG1lIGRvaW5nIHNvbWV0aGluZyB3cm9u
Zywgb3Igd2hldGhlciB0aGUgcHJvYmxlbSBvbmx5Cj4gZXhpc3RzIG9uIHg4Ni4gV2UgYWxyZWFk
eSBoYXZlIHRoZSBmbGFnIG9uIHg4NiBmb3IgRklORUlCVCwgYnV0IEkKPiB0aG91Z2h0IG9uIHRo
ZSBvZmYgY2hhbmNlIHRoYXQgaXQncyBub3QgYSBwcm9ibGVtIGluIHByYWN0aWNlIG9uIGFybSwK
PiBpdCBzdGlsbCBkb2Vzbid0IGh1cnQgdG8gYWRkIHRoZSBmbGFnLgoKVGhpcyBvbmx5IGltcGFj
dHMgS0NGSSBvbiB4ODYgYXQgdGhlIG1vbWVudC4gSG93ZXZlciwgd2Ugc2hvdWxkCm5ldmVydGhl
bGVzcyBwYXNzIHRoZSBzYW1lIHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBmbGFncyB0byBib3Ro
CmNvbXBpbGVycyBvbiBvdGhlciBhcmNoaXRlY3R1cmVzIHRvby4KCj4gUmVnYXJkaW5nIHRoZSBB
QVBDUzY0IGNhbGxpbmcgY29udmVudGlvbiB0aGluZyAuLi4gcnVzdGMgdXNlcyB0aGUgUnVzdAo+
IGNhbGxpbmcgY29udmVudGlvbiBmb3IgZnVuY3Rpb25zIGludGVybmFsbHkgaW4gUnVzdCBjb2Rl
IGFuZCBJIGRvbid0Cj4ga25vdyB3aGV0aGVyIHRoYXQgY2hhbmdlcyBhbnl0aGluZyByZWxldmFu
dCBmb3Igd2hhdCB5b3UgbWVudGlvbi4KPiBNYXR0aGV3L1NhbWkgZG8geW91IGtub3c/CgpBRkFJ
SyB0aGlzIHNob3VsZG4ndCBiZSBhIHByb2JsZW0sIGJ1dCBNYXR0IGtub3dzIHRoaXMgbXVjaCBi
ZXR0ZXIsIHNvCkknbGwgbGV0IGhpbSBleHBsYWluLgoKU2FtaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
