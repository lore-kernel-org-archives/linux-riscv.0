Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18ECD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODHN9EUMRaK0sPwN0OvchzF/x8K4cw1fS2qPZKuhOZU=; b=DdlwX94+OdU1i7
	GklGH30P5sW09+SNrelEo+X/AH48e4VCgQOIQnHYBapY7A7h7jn8DVZwxfuY3qUqtsDKLVvuLyd+j
	eFerW+PmczC9LDzBc50YgiEoq8PYyRS2wcHIR/kBoGNSwe3Hv0gipZ+zi9q6VC1VzwRgBsq9Zr1ck
	EBQk+ykYJ6ohpPSZBvahsf+zsIXifV+ZNJsDdEK5jStjjDeYDSwlVxvigUWz8CtVjmtXWTnPktzfw
	Pp0XLyAFMjfx1ZCSyQ8fee0ZvRWLzu6KyxOlQz2O/Pm3+1W4zapQmKoP4TIjCbFdbOYT+afxIvZar
	UvYzY4AS4rmpF7oOgibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsRCr-00000003hqg-44lG;
	Thu, 04 Apr 2024 17:48:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsRCo-00000003hlE-3Fkz
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 17:48:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1037842a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 10:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712252920; x=1712857720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI4MrMdOzvU45Up4bUbJqH4cKKBdKrNwuFYQDyoAvgA=;
        b=L2FlN4/m9+a/Uc16eL8rIDI9/QNECZivmBoT5/ij+JXgu/wdynpLRYrDMAf3Sip4Ut
         HexfAw7OaurZ9qG6ySl2lPYL13wBqzvfb5MIFUfF9soFKxZmhOD69HL/B0cyG7guwQUR
         bEOICMEb+aAOyLUWyyCBP74MTb/UmykPjOCSfNlwVN1dBwhAC+/ZmQe8ezFInRfx4uOh
         HmwV5yv2ZRRZ7k5rELUD7bSJsGbroU/UKLUj/2rGMfNpBZCxGqDuuBfF3F/qVu7bTFOd
         MnHgR8DGQMmQNfIC1Dgea/q/UjZ+TupdZZ2jKtGuym9dF9ZiGrau4f/yoF2+aCsSSV29
         eOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712252920; x=1712857720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vI4MrMdOzvU45Up4bUbJqH4cKKBdKrNwuFYQDyoAvgA=;
        b=SmcYvlYC3u+glvDxJviifgaSMDXvhKIif7bfzCqaD4dK7LaA6ga0UngC9PNaNvaraq
         +11IP1zur5YjCYCIZKnE2JumrGgACO4UtnMyyv0gEkYu5Kj/ZonqFIjq8ig1x7Ekx51E
         4sTcSFi0ezKt/f0qWlnJ2atGlPM9gNVyMCpaYfbec/ys3jEMx+9IKJC22vVPx/afDhMH
         Dll+KWNJL322ELFSRjA0SQBl+BxrBwZ/aODqRfyaLbe0sWNuKdvOcE//EOecbbuELRMW
         8niXGPSzGszUEW4GGX0EcW4klzOJgWuy2c1mMMJFSoEQpj5rbrRlSqrA3cyTLV2BrU0w
         6EaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKUEw06CKGgK/ibw8wOZTmeaJsyra4Xv7DYHcZuydp2LVZyaHP53dr2Ut8VqIfEzN0FhouNmKcb/rh15DjIWCSGPiPCsO0AvatcqZ4b9gM
X-Gm-Message-State: AOJu0YwH1AmhmcEMcFI4ezL/aN/MR4MX8xbTUusfff+RXcBSDwiblF/E
	D7OjrHbzxKvk+tvG/pzmlKK5g7i7+tG9F8QrUr3GtfZ+RG0Dg3/Oo+U348YGvr04Vo9qwy7rZXn
	wp9UBfrB/BYwtguljh7/GreIsNv0=
X-Google-Smtp-Source: AGHT+IHlscXTFbzvBDaANjdzeyYIU2Bzi1Z2mFW5dyNypC3v8GETs6/WUkm6FkEiMiVsMdRl7+HJ3JxRl5EHvirEJQY=
X-Received: by 2002:a17:90a:e604:b0:2a2:ba9:ba61 with SMTP id
 j4-20020a17090ae60400b002a20ba9ba61mr3674127pjy.34.1712252919635; Thu, 04 Apr
 2024 10:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com> <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
In-Reply-To: <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 19:47:57 +0200
Message-ID: <CANiq72k2HQHesGNaU3_yFZ7j8SKtWfZDAWdfoCDxo_bOEyn2ew@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Matthew Maurer <mmaurer@google.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_104854_833733_0707E863 
X-CRM114-Status: GOOD (  12.48  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCA1OjI14oCvUE0gTWF0dGhldyBNYXVyZXIgPG1tYXVyZXJA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGlzIGZpbmUgYnkgbWUgLSB0aGUgbGFz
dCBwYXRjaCBuZWVkZWQgZm9yIEtDRkkgdG8gYmUKPiBmdW5jdGlvbmFsIGluIFJ1c3QganVzdCBs
YW5kZWQgdXBzdHJlYW0gbGFzdCBuaWdodCwgc28gd2Ugc2hvdWxkCj4gcmV2aXNpdCB0aGlzIChp
biB0aGUgZm9ybSBvZiBlbmFibGluZyBpdCkgb25jZSB3ZSBtb3ZlIHRvCj4gYHJ1c3RjLTEuNzku
MGAgb3IgbGF0ZXIuIEluIGNhc2UgYW55b25lIHdhbnRzIGl0IGZvciBsb2NhbAo+IGV4cGVyaW1l
bnRhdGlvbiwgSSBoYXZlIGEgYmFja3BvcnQgYnJhbmNoIFsxXSB3aGljaCBhcHBsaWVzIHRoZXNl
IHRvCj4gdGhlIDEuNzMuMCBjb21waWxlciBhbmQgZW5hYmxlcyBpdCBpbiB0aGUga2VybmVsIFsy
XSAobm90IHVwc3RyZWFtZWQKPiBiZWNhdXNlIHRoZSBmZWF0dXJlIGlzbid0IHlldCBpbiBrZXJu
ZWwncyBgcnVzdGNgKSwgd2hpY2ggQW5kcm9pZCB3aWxsCj4gYmUgdXNpbmcgZm9yIHRoZSBSdXN0
IGJpbmRlciBkcml2ZXIuIFRoaXMgcGF0Y2ggd2lsbCByZXF1aXJlIGEgcmVjZW50Cj4gKGxhc3Qg
eWVhciBvciBzbykgY2xhbmcsIGFzIGl0IHJlbGllcyBvbgo+IGAtZnNhbml0aXplLWNmaS1pY2Fs
bC1leHBlcmltZW50YWwtbm9ybWFsaXplLWludGVnZXJzYC4KPgo+IFsxXTogaHR0cHM6Ly9naXRo
dWIuY29tL21hdXJlci9ydXN0L3RyZWUvMS43My4wJTJCY2ZpCj4gWzJdOiBodHRwczovL2FuZHJv
aWQtcmV2aWV3LmdpdC5jb3JwLmdvb2dsZS5jb20vYy9rZXJuZWwvY29tbW9uLysvMjkzMDYxNgoK
VGhhbmtzIGZvciB0aGUgdXBkYXRlLCBNYXR0aGV3IQoKSSBndWVzcyB0aGUgcHVibGljIGxpbmsg
aXM6Cmh0dHBzOi8vYW5kcm9pZC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2tlcm5lbC9jb21t
b24vKy8yOTMwNjE2CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
