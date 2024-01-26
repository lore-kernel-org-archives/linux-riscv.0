Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F4C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6XnbSKPMQejdMSlBluMnViPjYg+XEc9hqD2SMX0shE=; b=my+lS9TnjD4sTX
	eJGl8VACCBpiH7a+jdnzKsDWOpigsX5eYcIFeiVg8UxetZurq2HLohah6zS2nyH7uubsw+/wtDRow
	2TwMyezs/CVu/u/iejvNqLiAso4g6fIZ7m0JWf+wQNBqLDCl4qzo24tIKE1yzodlUw4FMsRy1lPTY
	HRWWbCxRDcvX0aAUcxGKZWUUVcAn3QOWvStEXPTsSgswqo19g7PtKF/K7j2xfbsiD14mFB6SRuGfO
	5MZLvgV6pS7J2Xe6+9KC+FMYLd+5L0u2SpK7lM3gLHuuTChObjL6HEwg9bZPlRuyTh8noOhfd8dXY
	p4uUjyu8GdQ8Ws7TLLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTTJC-00000005Pc0-0OpC;
	Fri, 26 Jan 2024 21:00:18 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTTJ9-00000005Pbd-1V3c
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 21:00:16 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-602cd92a75bso8745147b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jan 2024 13:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706302814; x=1706907614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R94U1LlE76uq+NvyE4ngyd9FxAhVaSUa06WGeHuHhIU=;
        b=ea2ZrLs+g7E3hDrUHI5u8C0F1la/Jq6r1X4bNrKgFzSnQl+TQ3cgzfzoED0Mt2zvMx
         yKtZ6eEJDyhX5ksSwckUuRBErjZzhog7xgLEqoyM1SZLvBPXuj9lQg13zbUu28eDgW4f
         YwWb7Nu8m3nehTkYY5ZhQ41RX6zlRwl69NO8oKAr/dtkLDiL2ifK2BuBep6te6OpbTDv
         yGdbUyBxTAcwts73o64m25Gj8WTxYf4N3mJOahYd+Bhh9rCG7XfqfFnjpcQiD5QasNf0
         WKPVhglLKwwFWB38fkyrqiLiDurjqvwYOFpAveArINDi1lnLWwW/jZYCLeGThOr3WGe+
         tqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706302814; x=1706907614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R94U1LlE76uq+NvyE4ngyd9FxAhVaSUa06WGeHuHhIU=;
        b=eqHvkfjE5I5Eg4bFJYtZosUU2O6w0LxwebtDu3DcISjGoUCfFoIVy8BHXhPmMM1I8w
         ybZGdxesWAAyWNsc7G+3ADU+AEDqiYKbHQM0jTdZUB3tyuRRQNdReQJ3aqiOK2D+CFW7
         o8BbeendM6N9R1dHmF8zucyPXB+AmnMwrIRaCqVomBGKucaRH6gV+VWBCWoIzuWtKBLG
         Ztqd9dyPq25cuPW8Bqbmh2rtIDtdKof83dadAXG+hY0dELEE6dary58iuoDv7pgLNK8P
         o/p64DUKcJqwkVRwL/fsy1H12rgo7P/ESya4gbTaSoFmaDhaTbD03nqWWXdQ88toS2Fy
         YMBw==
X-Gm-Message-State: AOJu0YyMwv1IsyfoJFbs8Coi3QvNkWjyUxR9OyU4euLXEt2g4a98Pvak
	crMJUJ0gxTmvlcjpGp9JuDKG+m/2wjkx4AkeRWF4PvSA4FVy1Hnsx30Nh0GE5U7+Cje4ELOw9p0
	EMgsLXYSwA4+dLIqvX4EIbdLPkNE=
X-Google-Smtp-Source: AGHT+IHGZFwCjim0Tth1g39N/v/n0KJf4BjgENizS8dPUFq5HPMaf0iymy6drZ65jUMDqf5c20SiR8drFVpMUdT6duo=
X-Received: by 2002:a81:de05:0:b0:5d7:1941:2c18 with SMTP id
 k5-20020a81de05000000b005d719412c18mr410434ywj.69.1706302813724; Fri, 26 Jan
 2024 13:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy>
In-Reply-To: <20240125-lazy-thrower-744aacc6632a@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Jan 2024 22:00:02 +0100
Message-ID: <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_130015_446631_DD607465 
X-CRM114-Status: GOOD (  25.06  )
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

T24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgMjo0NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gQWgsIHRoYW5rcyBmb3IgdGhlIGRpcmVjdCBs
aW5rIDopCgpNeSBwbGVhc3VyZSEKCj4gQWN0dWFsbHksIHRoaW5raW5nIGFib3V0IGl0IGZvciBh
IG1vbWVudCAtIGlmIG9ubHkgYSBzaW5nbGUgY29tcGlsZXIKPiB2ZXJzaW9uIGlzIHN1cHBvcnRl
ZCAodGhlIG1pbmltdW0sIHJpZ2h0PykgdGhlbiB5b3UgY291bGQganVzdCBhZGQgdGhlCgpZZWFo
LCB0aGUgbWluaW11bSBsaXN0ZWQgaW4gYHNjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaGAgYW5k
IGluCmBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY2hhbmdlcy5yc3RgLiBJdCBhbHNvIGhhcHBlbnMg
dG8gYmUgdGhlIG1heGltdW0KdG9vLCB1bnRpbCB3ZSBjYW4gcmVsYXggdGhhdC4KCj4gLVpzYW5p
dGl6ZXI9a2NmaSBmbGFnIHdoZW5ldmVyIENGSV9DTEFORyBhbmQgUlVTVCBhcmUgYm90aCBzZXQu
CgpTaW5jZSB0aGUgZmxhZyBnb2VzIHRvIHRoZSBSdXN0IGNvbXBpbGVyLCBgUlVTVGAgd291bGQg
YmUgYWx3YXlzCmVuYWJsZWQsIHNvIHRoZSBmbGFnIHdvdWxkIG9ubHkgbmVlZCB0byBiZSBhZGRl
ZCB3aGVuIGBDRklfQ0xBTkc9eWAsCm5vPyBPciB3aGF0IGRvIHlvdSBtZWFuPwoKPiBJJ20gbm90
IHN1cmUgaWYgdGhhdCBpcyBhIGJldHRlciBvcHRpb24gdGhvdWdoLiBJdCdzIGEgY2hvaWNlIGJl
dHdlZW4KPiBDRklfQ0xBTkcgYmVpbmcgZGlzYWJsZWQgaWYgdGhlIGNoZWNrIGlzIG5vdCB1cGRh
dGVkIHdoZW4gdGhlIHRvb2xjaGFpbgo+IGlzIGJ1bXBlZCB2ZXJzdXMgYmVpbmcgZW5hYmxlZCBm
b3IgQyBhbmQgbm90IGZvciBSVVNULiBJIHRoaW5rIEkgcHJlZmVyCj4gdGhlIGZvcm1lciB0aG91
Z2gsIHRyYWNraW5nIGRvd24gdGhlIGNhdXNlIG9mIHRoZSBsYXR0ZXIgSSB3b3VsZCByYXRoZXIK
PiBub3Qgd2lzaCBvbiBhIHVzZXIuCj4KPiBJIHZvdGUgZm9yIGhhdmluZyB0aGUgY2hlY2ssIGV2
ZW4gaWYgaXQgY2FuIG9ubHkgZXZlciBiZSB0cnVlIGF0IHRoZQo+IG1vbWVudC4KClNpbmNlIHdl
IG9ubHkgc3VwcG9ydCBhIHNpbmdsZSB2ZXJzaW9uLCB3ZSBkb24ndCBuZWVkIGByYy1vcHRpb25g
CnRlc3RzIHVudGlsIHdlIHN0YXJ0IHN1cHBvcnRpbmcgc2V2ZXJhbCB2ZXJzaW9ucyAod2hpY2gg
aXMgd2h5IG90aGVyCnRlc3RzIGxpa2UgdGhhdCBkbyBub3QgZXhpc3Qgc28gZmFyKS4KCkluIG15
IHByZXZpb3VzIG1lc3NhZ2UgSSB0aG91Z2h0IHlvdSBtZWFudCB1c2luZyB0aGUgZmxhZyB0byB0
ZXN0IGZvcgphcmNoL3RhcmdldCBzdXBwb3J0IG9yIHNpbWlsYXIuIFRoYXQgd291bGQgYmUgZmlu
ZSwgYnV0IHdlIGNhbiBhbHNvIGRvCnRoZSB1c3VhbCBgQVJDSF9TVVBQT1JUU19DRklfUlVTVGAg
aGVyZSwgSSB3b3VsZCBhc3N1bWUuCgpOb3csIGR1cmluZyB0aGUgdmVyc2lvbiBidW1wIHRvIGEg
c3RhYmxlIGZsYWcsIGlmIHdlIGhhcHBlbiB0byBmb3JnZXQKdG8gdXBkYXRlIHRoZSBmbGFnIG5h
bWUsIGl0IHdvdWxkIGJlIGEgYnVpbGQgZXJyb3IsIHNvIGl0IHNob3VsZCBiZQplYXNpbHkgc3Bv
dHRlZCBhbmQgZml4ZWQuIEFuZCBpZiB3ZSBkaWQgdXNlIGFuIGByYy1vcHRpb25gIGZvciB0aGUK
YXJjaC90YXJnZXQgc3VwcG9ydCBpZGVhLCBpdCB3b3VsZCBiZSB0aGUgZmlyc3QgY2FzZSB5b3Ug
bWVudGlvbiwgc28KaXQgaXMgYWxsIGdvb2QuCgpXaGF0IHdlIG1heSB3YW50IHRvIGFkZCwgdGhv
dWdoLCB0byBhdm9pZCB0aGUgY29uZnVzaW9uIHlvdSBtZW50aW9uCm1lYW53aGlsZSwgaXMganVz
dCBhIGBkZXBlbmRzIG9uICFDRklfQ0xBTkdgIGZvciBgUlVTVGAsIGxpa2UgZm9yIHRoZQpvdGhl
ciByZXF1aXJlbWVudHMgd2UgaGF2ZSB0aGVyZSAod2hpY2ggYXJlIHRoaW5ncyB0aGF0IHNob3Vs
ZApldmVudHVhbGx5IGdvIGF3YXkpLiBUaGVuIHRoZXkgY2FuIHJlbW92ZSB0aGF0IHdoZW4gdGhl
IGAtWmAgZmxhZyBpcwpkZWVtZWQgcmVhZHkgdG8gYmUgdXNlZC4gQnV0IHBlcmhhcHMgbGV0J3Mg
c2VlIHdoYXQgUmFtb24gZXQgYWwuIHNheS4KCkluIG90aGVyIHdvcmRzLCB0aGUgZmxhZyB3YXMg
YWRkZWQgYmFjayBpbiAxLjY4LjAgdG8gYHJ1c3RjYCwgYnV0IGl0CndhcyBub3QgcmVhZHksIHNv
IHdlIG5lZWQgdG8gc3RvcmUgdGhlICJyZWFkeSIgYml0IGluIG91ciBzaWRlCm1lYW53aGlsZSwg
aS5lLiB3ZSBjYW4ndCBrbm93IHRoYXQganVzdCBieSB0ZXN0aW5nIHRoZSBmbGFnIGl0c2VsZi4K
CkJ5IHRoZSB3YXksIGNvbmNlcm5pbmcgdGhlIHRyYWNraW5nIGlzc3VlLCBzaW5jZSB5b3UgbWVu
dGlvbmVkIGl0OiBpdApoYXMgYSBsaXN0IG9mIFBScywgYnV0IG5vdCBmaXhlcywgdGhlcmUgaXMg
YSAia25vd24gaXNzdWVzIiBsaW5rCnRoZXJlLiBPbiB0b3Agb2YgdGhhdCwgd2UgYXJlICJzaGlm
dGVkIGluIHRpbWUiIHcuci50LiB0aGUgbGF0ZXN0CnN0YXR1cyBpbiB0aGUgY29tcGlsZXIsIHNp
bmNlIHdlIHVzZSBzdGFibGUgdmVyc2lvbnMgb2YgdGhlIGNvbXBpbGVyLgoKQ2hlZXJzLApNaWd1
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
