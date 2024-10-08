Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C84CEFC39
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLT6vLX5j9FBz1HvQvsSReOeTyfXeVN1I0obRIoni+o=; b=461Tb9u3cKu62H
	MRrRrzm04O8/wodDfWvNBRmw1tVYJW/YtTfrwcHlWgmpWBlWNKmUfKDmgwxYiMQcI4C9Fb7cwk7o2
	TjhLI1pc5V+8741ut6DbSbS1+9Oi6fjThGAQMEFwlSBT1EvTjLMavIRdszT6FfEh6JyUzI4MTeQJ7
	2EkILOWR8XqnhnplWNSrwtDiyHJVdg0INAGs7DV2fkp0U1XC2tXNpNY218RAUnrmmuLcaqMEQOkS5
	+x9y3IgscD+JXMJLXr5y/yoKCdEiVroDPgb/agSaRCRg2wcW5VCM+6rd6NJkCNqxnSsfSupIlbFB9
	UzsQ8RAjB73NefPxWMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syEZx-00000006k3E-1EFs;
	Tue, 08 Oct 2024 18:05:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEYd-00000006jf7-2FkF
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 18:03:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cae4ead5bso27345e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728410616; x=1729015416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THVJVpm9CroTXgxx7CCtrvcQtkVmkvNvwfBVgRAIWbg=;
        b=WF1B+wYIH53zYNBtPNMlvLpwbNxdeclozhjHAGgGRbLFvEJMHP4RdoOzbWoMCw7kzP
         v24hK/mONQyTAorNjukXjfNsFoqu60a8V/Nq3xgiNsQ43Mq1Xupzduqi2++18Dja9z0s
         bo8eJWOjg+3MCCXqtDuW//zY6hmDgnIBbYn6BuzTW+royzQb6iw/s6a8wQVpVybJhdf7
         BCLvQyv21z+9D/GsfaEYVacvSXcHgieRJhsjj0d1AH50rprO1eIHRpF98E++kHbc/M8I
         FdC+J7RrRZpYdIE2svrHzOECIEgD5IwmikINw1B47umcnbXxNVOOta8h+cafAX2WEqQ+
         8xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728410616; x=1729015416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THVJVpm9CroTXgxx7CCtrvcQtkVmkvNvwfBVgRAIWbg=;
        b=Ys5EFGCIlwX/Zk9n5QS1hkeVFJvXuZ96GPoR3ljO0NdJ+PdFKl/q87HQYC14SuUyN1
         babSP4S2qXYqGoOMB2f0Pf+NUexGES+ZYyee6s4yjG8dEgwWgerfoVs4lL41I6l3dl+q
         EbNIRg41RCfwUEU+n0iao93Rrb8dEG5rIat5wSS41hWTKynH5HobdWEi1C973T+1kxzv
         EsnOkCIELnKLbLcRclL3YmhSPl81+acc2YOcsjbPvPtnGIXn6IPUMAmZyv4ulIpdpRBf
         5XHIfrlaL2AvVPwUNGwCcClhxcPFw9zi/wS9wNSU1jEB39pp6KY/B165OZxIltrNEMx8
         jtCg==
X-Forwarded-Encrypted: i=1; AJvYcCUlMzSWmNQmadKpJqNBygc1KzW1/ANShaoQ8WpxS8Mn0yTlxEzBGGHN3UIuCtgSl1XCu8JbjaZ529GbRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyulAp3f+c1P1DdT+rPlGa0VWhELzH69GM+YfgJ3l8LHA2AyYFl
	69QhYnp5LRucMICb4f7zdAWAiwGDJu+vgWPP9AnfyYkm0Uj2nfDJKqZD/C5KtAj5te36ztHTdTL
	i0MxptoHVFBs38MVfIksDTKGLvA3XPn41PYCr
X-Google-Smtp-Source: AGHT+IGLPWiBhNaGWxzJa35MIEUtbEoBbJvrKEtwGkm5uJvBWdhv96ZlqUkMFTdq2dojXV6d5nhx/HwjG/P7bBbmQJc=
X-Received: by 2002:a05:600c:a00c:b0:426:6edd:61a7 with SMTP id
 5b1f17b1804b1-43058e04e51mr112205e9.7.1728410616124; Tue, 08 Oct 2024
 11:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 11:03:23 -0700
Message-ID: <CAGSQo013VE060aiHyQBonyRn8-sAMs-H751JfYiTMSRH23Me6A@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_110339_584704_47265946 
X-CRM114-Status: GOOD (  23.04  )
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

UmV2aWV3ZWQtQnk6IE1hdHRoZXcgTWF1cmVyIDxtbWF1cmVyQGdvb2dsZS5jb20+CgoKT24gVHVl
LCBPY3QgOCwgMjAyNCBhdCAxMDozN+KAr0FNIEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUu
Y29tPiB3cm90ZToKPgo+IFRoZSBLQ0ZJIHNhbml0aXplciBzdG9yZXMgdGhlIENGSSB0YWcgb2Yg
YSBmdW5jdGlvbiBqdXN0IGJlZm9yZSBpdHMKPiBtYWNoaW5lIGNvZGUuIEhvd2V2ZXIsIHRoZSBw
YXRjaGFibGUtZnVuY3Rpb24tZW50cnkgZmxhZyBjYW4gYmUgdXNlZCB0bwo+IGludHJvZHVjZSBh
ZGRpdGlvbmFsIG5vcCBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSBtYWNoaW5lIGNvZGUsIHRha2lu
ZyB1cAo+IHRoZSBzcGFjZSB0aGF0IG5vcm1hbGx5IGhvbGRzIHRoZSBDRkkgdGFnLiBJbiB0aGlz
IGNhc2UsIGEgYmFja3dhcmRzCj4gb2Zmc2V0IGlzIGFwcGxpZWQgdG8gdGhlIENGSSB0YWcgdG8g
bW92ZSB0aGVtIG91dCBvZiB0aGUgd2F5IG9mIHRoZSBub3AKPiBpbnN0cnVjdGlvbnMuIFRvIGVu
c3VyZSB0aGF0IEMgYW5kIFJ1c3QgYWdyZWUgb24gdGhlIG9mZnNldCB1c2VkIGJ5IENGSQo+IHRh
Z3MsIHBhc3MgdGhlIC1acGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IHRvIHJ1c3RjIHdoZW5ldmVy
IGl0IGlzIHBhc3NlZAo+IHRvIHRoZSBDIGNvbXBpbGVyLgo+Cj4gVGhlIHJlcXVpcmVkIHJ1c3Rj
IHZlcnNpb24gaXMgYnVtcGVkIHRvIDEuODEuMCB0byBlbnN1cmUgdGhhdCB0aGUKPiAtWnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeSBmbGFnIGlzIGF2YWlsYWJsZSB3aGVuIENGSSBpcyB1c2VkLgo+
Cj4gRml4ZXM6IGNhNjI3ZTYzNjU1MSAoInJ1c3Q6IGNmaTogYWRkIHN1cHBvcnQgZm9yIENGSV9D
TEFORyB3aXRoIFJ1c3QiKQo+IFNpZ25lZC1vZmYtYnk6IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBn
b29nbGUuY29tPgo+IC0tLQo+IE5vdGUgdGhhdCB0aGlzIGZpeCB1c2VzIHJ1c3RjLW9wdGlvbiB3
aGljaCBoYXMgYSBwZW5kaW5nIGZpeDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDEwMDgtcnVzdGMtb3B0aW9uLWJvb3RzdHJhcC12Mi0xLWU2ZTE1NWI4ZjlmM0Bnb29nbGUuY29t
Lwo+IC0tLQo+ICBhcmNoL2FybTY0L01ha2VmaWxlICAgICB8IDIgKysKPiAgYXJjaC9sb29uZ2Fy
Y2gvTWFrZWZpbGUgfCAxICsKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgfCAyICsrCj4gIGlu
aXQvS2NvbmZpZyAgICAgICAgICAgIHwgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvTWFrZWZp
bGUgYi9hcmNoL2FybTY0L01ha2VmaWxlCj4gaW5kZXggOWVmZDNmMzdjMmZkLi5kN2VjMGJiMDlm
YzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvYXJtNjQv
TWFrZWZpbGUKPiBAQCAtMTQzLDkgKzE0MywxMSBAQCBDSEVDS0ZMQUdTICs9IC1EX19hYXJjaDY0
X18KPiAgaWZlcSAoJChDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUykseSkKPiAg
ICBLQlVJTERfQ1BQRkxBR1MgKz0gLURDQ19VU0lOR19QQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkK
PiAgICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9NCwyCj4g
KyAgS0JVSUxEX1JVU1RGTEFHUyArPSAkKGNhbGwgcnVzdGMtb3B0aW9uLC1acGF0Y2hhYmxlLWZ1
bmN0aW9uLWVudHJ5PTQkKGNvbW1hKTIpCj4gIGVsc2UgaWZlcSAoJChDT05GSUdfRFlOQU1JQ19G
VFJBQ0VfV0lUSF9BUkdTKSx5KQo+ICAgIEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BB
VENIQUJMRV9GVU5DVElPTl9FTlRSWQo+ICAgIENDX0ZMQUdTX0ZUUkFDRSA6PSAtZnBhdGNoYWJs
ZS1mdW5jdGlvbi1lbnRyeT0yCj4gKyAgS0JVSUxEX1JVU1RGTEFHUyArPSAkKGNhbGwgcnVzdGMt
b3B0aW9uLC1acGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTIpCj4gIGVuZGlmCj4KPiAgaWZlcSAo
JChDT05GSUdfS0FTQU5fU1dfVEFHUyksIHkpCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNo
L01ha2VmaWxlIGIvYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUKPiBpbmRleCBhZTNmODA2MjJmNGMu
LmY5Y2VmMzFkMWYwZSAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+ICsr
KyBiL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxlCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgZW5kaWYKPiAg
aWZkZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFCj4gIEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VT
SU5HX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWQo+ICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRj
aGFibGUtZnVuY3Rpb24tZW50cnk9Mgo+ICtLQlVJTERfUlVTVEZMQUdTICs9ICQoY2FsbCBydXN0
Yy1vcHRpb24sLVpwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9MikKPiAgZW5kaWYKPgo+ICBpZmRl
ZiBDT05GSUdfNjRCSVQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gv
cmlzY3YvTWFrZWZpbGUKPiBpbmRleCBkNDY5ZGI5ZjQ2ZjQuLjY1ZDRkY2JhMzA5YSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+
IEBAIC0xNiw4ICsxNiwxMCBAQCBpZmVxICgkKENPTkZJR19EWU5BTUlDX0ZUUkFDRSkseSkKPiAg
ICAgICAgIEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BBVENIQUJMRV9GVU5DVElPTl9F
TlRSWQo+ICBpZmVxICgkKENPTkZJR19SSVNDVl9JU0FfQykseSkKPiAgICAgICAgIENDX0ZMQUdT
X0ZUUkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00Cj4gKyAgICAgICBLQlVJTERf
UlVTVEZMQUdTICs9ICQoY2FsbCBydXN0Yy1vcHRpb24sLVpwYXRjaGFibGUtZnVuY3Rpb24tZW50
cnk9NCkKPiAgZWxzZQo+ICAgICAgICAgQ0NfRkxBR1NfRlRSQUNFIDo9IC1mcGF0Y2hhYmxlLWZ1
bmN0aW9uLWVudHJ5PTIKPiArICAgICAgIEtCVUlMRF9SVVNURkxBR1MgKz0gJChjYWxsIHJ1c3Rj
LW9wdGlvbiwtWnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0yKQo+ICBlbmRpZgo+ICBlbmRpZgo+
Cj4gZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZpZyBiL2luaXQvS2NvbmZpZwo+IGluZGV4IDUzMGEz
ODJlZTBmZS4uNDM0MzRiNjgxYzNmIDEwMDY0NAo+IC0tLSBhL2luaXQvS2NvbmZpZwo+ICsrKyBi
L2luaXQvS2NvbmZpZwo+IEBAIC0xOTQ2LDcgKzE5NDYsNyBAQCBjb25maWcgUlVTVAo+ICAgICAg
ICAgZGVwZW5kcyBvbiAhR0NDX1BMVUdJTl9SQU5EU1RSVUNUCj4gICAgICAgICBkZXBlbmRzIG9u
ICFSQU5EU1RSVUNUCj4gICAgICAgICBkZXBlbmRzIG9uICFERUJVR19JTkZPX0JURiB8fCBQQUhP
TEVfSEFTX0xBTkdfRVhDTFVERQo+IC0gICAgICAgZGVwZW5kcyBvbiAhQ0ZJX0NMQU5HIHx8IFJV
U1RDX1ZFUlNJT04gPj0gMTA3OTAwICYmIEhBVkVfQ0ZJX0lDQUxMX05PUk1BTElaRV9JTlRFR0VS
Uwo+ICsgICAgICAgZGVwZW5kcyBvbiAhQ0ZJX0NMQU5HIHx8IFJVU1RDX1ZFUlNJT04gPj0gMTA4
MTAwICYmIEhBVkVfQ0ZJX0lDQUxMX05PUk1BTElaRV9JTlRFR0VSUwo+ICAgICAgICAgc2VsZWN0
IENGSV9JQ0FMTF9OT1JNQUxJWkVfSU5URUdFUlMgaWYgQ0ZJX0NMQU5HCj4gICAgICAgICBkZXBl
bmRzIG9uICFDQUxMX1BBRERJTkcgfHwgUlVTVENfVkVSU0lPTiA+PSAxMDgxMDAKPiAgICAgICAg
IGRlcGVuZHMgb24gIUtBU0FOX1NXX1RBR1MKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiA0YTMzNWY5
MjBiYzc4ZTUxYjFkN2QyMTZkMTFmMmVjYmI2ZGQ5NDlmCj4gY2hhbmdlLWlkOiAyMDI0MTAwOC1j
ZmktcGF0Y2hhYmxlLWFsbC1kZGQ2Mjc1ZWFmNGYKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEFs
aWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
