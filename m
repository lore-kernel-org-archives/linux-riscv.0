Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E59CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdBxTZVezr4WlYCTvUZgMDjthhUHA0zfrLKZcef6T0k=; b=mq3GKfuWiApo/z
	Q+Aeqq9mqPvFOqI70//zVWTRQkVBvDNBIxtbSuH6NJV15BBfk/pKNK3P4GKjMT6xEeobr3Y2RoQQ9
	QQleBaqlpGMCziWS9uswVCXXq4svTI5QL1Hd60h0hXyye98OrgqRDKqvwqAkHhp4t3Ja6j4SlhDgP
	eIHAKwxfLvKrEOHbPOhLBVmQDEFulsoA4ueUjbQrOw0ypoX1tJKK8cZ7oSp4vk3VkBPffURCCLABb
	Rf2Fzo7KaLJxGeNraAhhS46Ss7qVDic8wqbeP+8Vv55aLxycRytRSOnColbO7Vq0ZKfeewhD8oyGQ
	VmxmwAJjlaT0jOEi37dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxbb-0000000FQ3u-3NGY;
	Wed, 03 Apr 2024 10:12:31 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxbX-0000000FQ0I-32Bq
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 10:12:30 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso5781386276.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712139145; x=1712743945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DM3MruV8xgndrXUKi0XabWvgomlzzo6Hs77lj1LmAyw=;
        b=aOVFcLBpE53GvqZKgXKhg8q9cS8aq87RRwRk5HftS3iA9m6tCEao6Nb64cGCFyzucv
         EcJ1imaq03j8q+t4dBBr2SBnb9G2BIuMOp2VnmDlmQx2EwQsasa1vzDvHqd44w2p/10g
         B48yGl/WRJyB6F8iX0HggIJ7o1ojY/IJGdyB5vdTLNKJNeFnFjl2jkryqYus55qPTKPh
         uUlrpnzi143ozsLFCJDHE4iLA1wteJjrr42bVJBmu4m/4Gyu89X2wAN/lUVCEmMWqlay
         nC7yOhvcKSL+qUv9SYtLbEhDe4xXFcfSGNeRPpmx2DhAqZzze99kgEBDVGbAR/AqpGQC
         BWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139145; x=1712743945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DM3MruV8xgndrXUKi0XabWvgomlzzo6Hs77lj1LmAyw=;
        b=hYo8AH+7h6jQCPVxQ+y/7GJHGcsdVGwU+UUcSe9Eq8jLbRKKbk4zA8QTqwDi6TS1zK
         6R9giD79Ra6NhEh+Rz5aLc8YbJF2JjT4MDJqO3X4oqRNUnFsP9jFRz5Ju7bFNTqmVzDI
         42W6F9uVCGrPe3/+tw+WA3lYKHbJGgamFCWVsNU7kkj0jRzVsvZCe/7yx+l6bYrpfEr0
         pM1UBWg9vzaloGI3G7UPEoTReX0R0A6B39RdbHOumBKndtFK46vkLjrxczeurcfiBRR1
         +I4hmKA7vDm5Fz0WHf1jN7fTVVRv9CbR3mqSM8DCgV0UTXUzOD53qpqIOGkvxGw/jMHC
         2Rcg==
X-Forwarded-Encrypted: i=1; AJvYcCUEtgF0ViqXLhrBVs7fiRBXRNCVBmNxTBJ2CIpFP7mxFAyJavjAqVTGAuJ/T/aAeJityZOvRfQjiB64JoneT8jV26+Ao807HCtyHK5EA0Dy
X-Gm-Message-State: AOJu0YxYDszqaMJ3xWykGqF3a94oKesrvwqlWf9ogOyHFT8dZ6SUbH5F
	VQJT1uw/YzC0zgRHj/m0ylK+lIsWeVcpnab4+bM6jPeAl5kUZE3G1ylW2IINUe/yPmMsPIM44fF
	sb+NRgIyYuGj70J0XO5MdA4Uys6ZhfywKdSkeBQ==
X-Google-Smtp-Source: AGHT+IHjMnzB/WfOcWlU9Kk+q09w4kesr+xOTOdAJk4LZekAm9xMRBJgYqj2I5+13o+rL07Q+TszRqGktSr54zyAjuM=
X-Received: by 2002:a25:870e:0:b0:dd1:3909:bdd with SMTP id
 a14-20020a25870e000000b00dd139090bddmr11067625ybl.65.1712139145217; Wed, 03
 Apr 2024 03:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240403072638.567446-1-bjorn@kernel.org>
In-Reply-To: <20240403072638.567446-1-bjorn@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 3 Apr 2024 18:12:14 +0800
Message-ID: <CABgGipVsoMi7uZ3o5nTLNBODCjworrppezE0CxfMsZfN0p07tQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix vector state restore in rt_sigreturn()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
	Vincent Chen <vincent.chen@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Greentime Hu <greentime.hu@sifive.com>, Haorong Lu <ancientmodern4@gmail.com>, 
	Jerry Shih <jerry.shih@sifive.com>, Nick Knight <nick.knight@sifive.com>, 
	linux-kernel@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Vineet Gupta <vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_031228_036732_70F3D491 
X-CRM114-Status: GOOD (  29.37  )
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

T24gV2VkLCBBcHIgMywgMjAyNCBhdCAzOjI34oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Cj4KPiBUaGUgUklTQy1WIFZlY3RvciBzcGVjaWZpY2F0aW9uIHN0YXRlcyBpbiAiQXBwZW5k
aXggRDogQ2FsbGluZwo+IENvbnZlbnRpb24gZm9yIFZlY3RvciBTdGF0ZSIgWzFdIHRoYXQgIkV4
ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcwo+IGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJl
Z2lzdGVycyAodjAtdjMxLCB2bCwgdnR5cGUpIGFuZCB2c3RhcnQgdG8KPiBiZWNvbWUgdW5zcGVj
aWZpZWQuIi4gSW4gdGhlIFJJU0MtViBrZXJuZWwgdGhpcyBpcyBjYWxsZWQgImRpc2NhcmRpbmcK
PiB0aGUgdnN0YXRlIi4KPgo+IFJldHVybmluZyBmcm9tIGEgc2lnbmFsIGhhbmRsZXIgdmlhIHRo
ZSBydF9zaWdyZXR1cm4oKSBzeXNjYWxsLCB2ZWN0b3IKPiBkaXNjYXJkIGlzIGFsc28gcGVyZm9y
bWVkLiBIb3dldmVyLCB0aGlzIGlzIG5vdCBhbiBpc3N1ZSBzaW5jZSB0aGUKPiB2ZWN0b3Igc3Rh
dGUgc2hvdWxkIGJlIHJlc3RvcmVkIGZyb20gdGhlIHNpZ2NvbnRleHQsIGFuZCB0aGVyZWZvcmUg
bm90Cj4gY2FyZSBhYm91dCB0aGUgdmVjdG9yIGRpc2NhcmQuCj4KPiBUaGUgImxpdmUgc3RhdGUi
IGlzIHRoZSBhY3R1YWwgdmVjdG9yIHJlZ2lzdGVyIGluIHRoZSBydW5uaW5nIGNvbnRleHQsCj4g
YW5kIHRoZSAidnN0YXRlIiBpcyB0aGUgdmVjdG9yIHN0YXRlIG9mIHRoZSB0YXNrLiBBIGRpcnR5
IGxpdmUgc3RhdGUsCj4gbWVhbnMgdGhhdCB0aGUgdnN0YXRlIGFuZCBsaXZlIHN0YXRlIGFyZSBu
b3QgaW4gc3luY2guCj4KPiBXaGVuIHZlY3Rvcml6ZWQgdXNlcl9mcm9tX2NvcHkoKSB3YXMgaW50
cm9kdWNlZCwgYW4gYnVnIHNuZWFrZWQgaW4gYXQKPiB0aGUgcmVzdG9yYXRpb24gY29kZSwgcmVs
YXRlZCB0byB0aGUgZGlzY2FyZCBvZiB0aGUgbGl2ZSBzdGF0ZS4KPgo+IEFuIGV4YW1wbGUgd2hl
biB0aGlzIGdvIHdyb25nOgo+Cj4gICAxLiBBIHVzZXJsYW5kIGFwcGxpY2F0aW9uIGlzIGV4ZWN1
dGluZyB2ZWN0b3IgY29kZQo+ICAgMi4gVGhlIGFwcGxpY2F0aW9uIHJlY2VpdmVzIGEgc2lnbmFs
LCBhbmQgdGhlIHNpZ25hbCBoYW5kbGVyIGlzCj4gICAgICBlbnRlcmVkLgo+ICAgMy4gVGhlIGFw
cGxpY2F0aW9uIHJldHVybnMgZnJvbSB0aGUgc2lnbmFsIGhhbmRsZXIsIHVzaW5nIHRoZQo+ICAg
ICAgcnRfc2lncmV0dXJuKCkgc3lzY2FsbC4KPiAgIDQuIFRoZSBsaXZlIHZlY3RvciBzdGF0ZSBp
cyBkaXNjYXJkZWQgdXBvbiBlbnRlcmluZyB0aGUKPiAgICAgIHJ0X3NpZ3JldHVybigpLCBhbmQg
dGhlIGxpdmUgc3RhdGUgaXMgbWFya2VkIGFzICJkaXJ0eSIsIGluZGljYXRpbmcKPiAgICAgIHRo
YXQgdGhlIGxpdmUgc3RhdGUgbmVlZCB0byBiZSBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgY3VycmVu
dAo+ICAgICAgdnN0YXRlLgo+ICAgNS4gcnRfc2lncmV0dXJuKCkgcmVzdG9yZXMgdGhlIHZzdGF0
ZSwgZXhjZXB0IHRoZSBWZWN0b3IgcmVnaXN0ZXJzLAo+ICAgICAgZnJvbSB0aGUgc2lnY29udGV4
dAo+ICAgNi4gcnRfc2lncmV0dXJuKCkgcmVzdG9yZXMgdGhlIFZlY3RvciByZWdpc3RlcnMsIGZy
b20gdGhlIHNpZ2NvbnRleHQsCj4gICAgICBhbmQgbm93IHRoZSB2ZWN0b3JpemVkIHVzZXJfZnJv
bV9jb3B5KCkgaXMgdXNlZC4gVGhlIGRpcnR5IGxpdmUKPiAgICAgIHN0YXRlIGZyb20gdGhlIGRp
c2NhcmQgaXMgc2F2ZWQgdG8gdGhlIHZzdGF0ZSwgbWFraW5nIHRoZSB2c3RhdGUKPiAgICAgIGNv
cnJ1cHQuCj4gICA3LiBydF9zaWdyZXR1cm4oKSByZXR1cm5zIHRvIHRoZSBhcHBsaWNhdGlvbiwg
d2hpY2ggY3Jhc2hlcyBkdWUgdG8KPiAgICAgIGNvcnJ1cHRlZCB2c3RhdGUuCj4KPiBOb3RlIHRo
YXQgdGhlIHZlY3Rvcml6ZWQgdXNlcl9mcm9tX2NvcHkoKSBpcyBpbnZva2VkIGRlcGVuZGluZyBv
biB0aGUKPiB2YWx1ZSBvZiBDT05GSUdfUklTQ1ZfSVNBX1ZfVUNPUFlfVEhSRVNIT0xELiBEZWZh
dWx0IGlzIDc2OCwgd2hpY2gKPiBtZWFucyB0aGF0IHZsZW4gaGFzIHRvIGJlIGxhcmdlciB0aGFu
IDEyOGIgZm9yIHRoaXMgYnVnIHRvIHRyaWdnZXIuCj4KPiBUaGUgZml4IGlzIHNpbXBseSB0byBt
YXJrIHRoZSBsaXZlIHN0YXRlIGFzIG5vbi1kaXJ0eS9jbGVhbiBwcmlvcgo+IHBlcmZvcm1pbmcg
dGhlIHZzdGF0ZSByZXN0b3JlLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jp
c2N2LWlzYS1tYW51YWwvcmVsZWFzZXMvZG93bmxvYWQvcmlzY3YtaXNhLXJlbGVhc2UtOGFiZGI0
MS0yMDI0LTAzLTI2L3VucHJpdi1pc2EtYXNjaWlkb2MucGRmICMgWzFdCj4gUmVwb3J0ZWQtYnk6
IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gUmVwb3J0ZWQtYnk6IFZp
bmVldCBHdXB0YSA8dmd1cHRhQGtlcm5lbC5vcmc+Cj4gRml4ZXM6IGMyYTY1OGQ0MTkyNCAoInJp
c2N2OiBsaWI6IHZlY3Rvcml6ZSBjb3B5X3RvX3VzZXIvY29weV9mcm9tX3VzZXIiKQo+IFNpZ25l
ZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KClRoYW5rcyBmb3Ig
dGhlIGZpbmRpbmdzIQoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5j
b20+Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyB8IDE1ICsrKysrKysrLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2lnbmFsLmMKPiBpbmRleCA1MDFlNjZkZWJmNjkuLjVhMmVkZDdmMDI3ZSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NpZ25hbC5jCj4gQEAgLTExOSw2ICsxMTksMTMgQEAgc3RhdGljIGxvbmcgX19yZXN0b3Jl
X3Zfc3RhdGUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHZvaWQgX191c2VyICpzY192ZWMpCj4gICAg
ICAgICBzdHJ1Y3QgX19zY19yaXNjdl92X3N0YXRlIF9fdXNlciAqc3RhdGUgPSBzY192ZWM7Cj4g
ICAgICAgICB2b2lkIF9fdXNlciAqZGF0YXA7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBN
YXJrIHRoZSB2c3RhdGUgYXMgY2xlYW4gcHJpb3IgcGVyZm9ybWluZyB0aGUgYWN0dWFsIGNvcHks
Cj4gKyAgICAgICAgKiB0byBhdm9pZCBnZXR0aW5nIHRoZSB2c3RhdGUgaW5jb3JyZWN0bHkgY2xv
YmJlcmVkIGJ5IHRoZQo+ICsgICAgICAgICogIGRpc2NhcmRlZCB2ZWN0b3Igc3RhdGUuCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIHJpc2N2X3ZfdnN0YXRlX3NldF9yZXN0b3JlKGN1cnJlbnQsIHJl
Z3MpOwo+ICsKPiAgICAgICAgIC8qIENvcHkgZXZlcnl0aGluZyBvZiBfX3NjX3Jpc2N2X3Zfc3Rh
dGUgZXhjZXB0IGRhdGFwLiAqLwo+ICAgICAgICAgZXJyID0gX19jb3B5X2Zyb21fdXNlcigmY3Vy
cmVudC0+dGhyZWFkLnZzdGF0ZSwgJnN0YXRlLT52X3N0YXRlLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSwgZGF0YXAp
KTsKPiBAQCAtMTMzLDEzICsxNDAsNyBAQCBzdGF0aWMgbG9uZyBfX3Jlc3RvcmVfdl9zdGF0ZShz
dHJ1Y3QgcHRfcmVncyAqcmVncywgdm9pZCBfX3VzZXIgKnNjX3ZlYykKPiAgICAgICAgICAqIENv
cHkgdGhlIHdob2xlIHZlY3RvciBjb250ZW50IGZyb20gdXNlciBzcGFjZSBkYXRhcC4gVXNlCj4g
ICAgICAgICAgKiBjb3B5X2Zyb21fdXNlciB0byBwcmV2ZW50IGluZm9ybWF0aW9uIGxlYWsuCj4g
ICAgICAgICAgKi8KPiAtICAgICAgIGVyciA9IGNvcHlfZnJvbV91c2VyKGN1cnJlbnQtPnRocmVh
ZC52c3RhdGUuZGF0YXAsIGRhdGFwLCByaXNjdl92X3ZzaXplKTsKPiAtICAgICAgIGlmICh1bmxp
a2VseShlcnIpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+IC0KPiAtICAgICAgIHJp
c2N2X3ZfdnN0YXRlX3NldF9yZXN0b3JlKGN1cnJlbnQsIHJlZ3MpOwo+IC0KPiAtICAgICAgIHJl
dHVybiBlcnI7Cj4gKyAgICAgICByZXR1cm4gY29weV9mcm9tX3VzZXIoY3VycmVudC0+dGhyZWFk
LnZzdGF0ZS5kYXRhcCwgZGF0YXAsIHJpc2N2X3ZfdnNpemUpOwo+ICB9Cj4gICNlbHNlCj4gICNk
ZWZpbmUgc2F2ZV92X3N0YXRlKHRhc2ssIHJlZ3MpICgwKQo+Cj4gYmFzZS1jb21taXQ6IDcxMTVm
ZjRhOGJmZWQzYjkyOTRiYWQyZTExMTc0NGU2YWJlYWRmMWEKPiAtLQo+IDIuNDAuMQo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
