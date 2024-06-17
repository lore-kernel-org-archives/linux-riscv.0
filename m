Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A47C2BA18
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2PvF56ZSgZBXyV3YqJN7IGgWzVSTT11YDwG6yAdmP4=; b=ssNuDnyjWK0KdC
	1jBZMxfOO8sCQYCw/j2euzUuuiSzQBjHhuMVHII+2/3hBrOjZF43RQ+Xim2VXOTj++JH0oyin3iYX
	Hi1L6tbiLN0BlV/AWGI+LAdoiIRi7qaa29ofpQhD7hKKvUafUydeUgKC55squhEpQl15H3e9D2Fwx
	sIUROuU7UwiFdRNkjaPOe2toRGzNXV6BXB6ImpIvKSp78hPqS/5jT3pXuKGpixIrmj+Gr4EEad7PJ
	HjPiqDPHbLCK6alJDEcZaoD2Pjh06WBZsZiVZwhxrC2m7qYHm74mN607bY/hOvwkq/mpnKnahR3US
	nOdk5vwlOOblKj95r7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFbH-0000000Bpvw-2R4f;
	Mon, 17 Jun 2024 16:52:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFbD-0000000Bpsu-4Aei
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 16:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3D6E61335;
	Mon, 17 Jun 2024 16:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423E1C2BD10;
	Mon, 17 Jun 2024 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718643174;
	bh=eSnhqAm2EceuPb7GR0p97myLZRdOU10MmclXVrykcQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ju/Nio2ekUQo8b14RA4d5uLq/NEoJTbtrPRR3ycrp0W1iGLafnBwKjFA8qysevzDj
	 x7qKSGBs7oZOc8NK6gLzhdGOzqjFfVQz3Y40KI0j1uBCDQaT3mQ0/9/xd8ICwa2pwQ
	 LSofAHNWiaTakNfXTxUASBja6ZNvN7KkmhX6DC383eLoNUeYxbs4zITnUD+vUiO/72
	 y3b0j9RHGovIx9OvW5LKQO1DsJNAmkmS9n9dcDrZHoQS71AmEDLI7gVeHZR8rNMsEq
	 jMWLkftptNFsk8lWXU/2Xo7Tvp0wvcFXv3NKuJznlFkgIV5prc1Luup8xxx78FJ/i1
	 Qra2f1kMDF83g==
Date: Mon, 17 Jun 2024 09:52:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Evgenii Shatokhin <e.shatokhin@yadro.com>
Subject: Re: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte
 boundary
Message-ID: <20240617165251.GA550301@thelio-3990X>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com>
 <20240613190920.GB1272931@thelio-3990X>
 <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_095256_141957_036A6273 
X-CRM114-Status: GOOD (  31.81  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTA6Mzg6NTVBTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IE9uIEZyaSwgSnVuIDE0LCAyMDI0IGF0IDM6MDnigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEFuZHksCj4gPgo+ID4gT24gVGh1
LCBKdW4gMTMsIDIwMjQgYXQgMDM6MTE6MDlQTSArMDgwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4g
PiBXZSBhcmUgY2hhbmdpbmcgZnRyYWNlIGNvZGUgcGF0Y2hpbmcgaW4gb3JkZXIgdG8gcmVtb3Zl
IGRlcGVuZGVuY3kgZnJvbQo+ID4gPiBzdG9wX21hY2hpbmUoKSBhbmQgZW5hYmxlIGtlcm5lbCBw
cmVlbXB0aW9uLiBUaGlzIHJlcXVpcmVzIHVzIHRvIGFsaWduCj4gPiA+IGZ1bmN0aW9ucyBlbnRy
eSBhdCBhIDQtQiBhbGlnbiBhZGRyZXNzLgo+ID4gPgo+ID4gPiBIb3dldmVyLCAtZmFsaWduLWZ1
bmN0aW9ucyBvbiBvbGRlciB2ZXJzaW9ucyBvZiBHQ0MgYWxvbmUgd2FzIG5vdCBzdHJvbmcKPiA+
ID4gZW5vdW5naCB0byBhbGlnbiBhbGwgZnVuY3Rpb25zLiBJbiBmYWN0LCBjb2xkIGZ1bmN0aW9u
cyBhcmUgbm90IGFsaWduZWQKPiA+ID4gYWZ0ZXIgdHVybmluZyBvbiBvcHRpbWl6YXRpb25zLiBX
ZSBjb25zaWRlciB0aGlzIGlzIGEgYnVnIGluIEdDQyBhbmQKPiA+ID4gdHVybiBvZmYgZ3Vlc3Mt
YnJhbmNoLXByb2JpbGl0eSBhcyBhIHdvcmthcm91bmQgdG8gYWxpZ24gYWxsIGZ1bmN0aW9ucy4K
PiA+ID4KPiA+ID4gR0NDIGJ1ZyBpZDogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93
X2J1Zy5jZ2k/aWQ9ODgzNDUKPiA+ID4KPiA+ID4gVGhlIG9wdGlvbiAtZm1pbi1mdW5jdGlvbi1h
bGlnbm1lbnQgaXMgYWJsZSB0byBhbGlnbiBhbGwgZnVuY3Rpb25zCj4gPiA+IHByb3Blcmx5IG9u
IG5ld2VyIHZlcnNpb25zIG9mIGdjYy4gU28sIHdlIGFkZCBhIGNjLW9wdGlvbiB0byB0ZXN0IGlm
Cj4gPiA+IHRoZSB0b29sY2hhaW4gc3VwcG9ydHMgaXQuCj4gPiA+Cj4gPiA+IFN1Z2dlc3RlZC1i
eTogRXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBhcmNoL3Jpc2N2L0tjb25maWcgIHwgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L01ha2VmaWxlIHwg
NyArKysrKystCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiA+IGluZGV4IGI5NDE3NmUyNWJlMS4uODBiOGQ0OGUxZTQ2IDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gPiA+IEBAIC0yMDMsNiArMjAzLDcgQEAgY29uZmlnIENMQU5HX1NVUFBPUlRT
X0RZTkFNSUNfRlRSQUNFCj4gPiA+ICBjb25maWcgR0NDX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNF
Cj4gPiA+ICAgICAgIGRlZl9ib29sIENDX0lTX0dDQwo+ID4gPiAgICAgICBkZXBlbmRzIG9uICQo
Y2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPiA+ICsgICAgIGRlcGVu
ZHMgb24gJChjYy1vcHRpb24sLWZtaW4tZnVuY3Rpb24tYWxpZ25tZW50PTQpIHx8ICFSSVNDVl9J
U0FfQwo+ID4KPiA+IFBsZWFzZSB1c2UgQ0NfSEFTX01JTl9GVU5DVElPTl9BTElHTk1FTlQgKGZy
b20gYXJjaC9LY29uZmlnKSwgd2hpY2gKPiA+IGFscmVhZHkgY2hlY2tzIGZvciBzdXBwb3J0IGZv
ciB0aGlzIG9wdGlvbi4KPiAKPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIQo+IAo+ID4KPiA+
ID4gIGNvbmZpZyBIQVZFX1NIQURPV19DQUxMX1NUQUNLCj4gPiA+ICAgICAgIGRlZl9ib29sICQo
Y2Mtb3B0aW9uLC1mc2FuaXRpemU9c2hhZG93LWNhbGwtc3RhY2spCj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gPiBpbmRleCAw
NmRlOWQzNjUwODguLjc0NjI4YWQ4ZGNmOCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPiA+IEBAIC0xNCw4ICsx
NCwxMyBAQCBlbmRpZgo+ID4gPiAgaWZlcSAoJChDT05GSUdfRFlOQU1JQ19GVFJBQ0UpLHkpCj4g
PiA+ICAgICAgIExERkxBR1Nfdm1saW51eCArPSAtLW5vLXJlbGF4Cj4gPiA+ICAgICAgIEtCVUlM
RF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWQo+ID4gPiAr
aWZlcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkpCj4gPgo+ID4gU2FtZSBoZXJlLCBwbGVhc2Ug
aW52ZXJ0IHRoaXMgYW5kIHVzZQo+ID4KPiA+ICAgaWZkZWYgQ09ORklHX0NDX0hBU19NSU5fRlVO
Q1RJT05fQUxJR05NRU5UCj4gPgo+ID4gbGlrZSB0aGUgbWFpbiBNYWtlZmlsZSBkb2VzLgo+IAo+
IEhvcGUgdGhpcyBtYWtlcyBzZW5zZSB0byB5b3UuIEkgYW0gZ29pbmcgdG8gYWRkIHRoZSBmb2xs
b3dpbmcgaW4gcmlzY3YgS2NvbmlnOgo+IAo+IHNlbGVjdCBGVU5DVElPTl9BTElHTk1FTlRfNEIg
aWYgRFlOQU1JQ19GVFJBQ0UgJiYgIVJJU0NWX0lTQV9DCj4gCj4gU28gd2Ugd2lsbCBub3QgbmVl
ZCBhbnkgb2YgdGhlc2UKClllcywgdGhhdCBkZWZpbml0ZWx5IG1ha2VzIHNlbnNlLCBJIGZvcmdv
dCB0aGF0IHRoaXMgaGFzIGJlZW4gYWJzdHJhY3RlZAphd2F5IHZpYSB0aGUgdXNlIG9mIHRob3Nl
IGFsaWdubWVudCBLY29uZmlnIHN5bWJvbHMgdGhhdCBjYW4gYmUgc2VsZWN0ZWQKd2hlbiBuZWVk
ZWQuIE11Y2ggYmV0dGVyIHRoYW4gbXkgc3VnZ2VzdGlvbnMsIHRoYW5rcyEKCj4gPgo+ID4gPiAr
ICAgICBjZmxhZ3NfZnRyYWNlX2FsaWduIDo9IC1mYWxpZ24tZnVuY3Rpb25zPTQKPiA+ID4gK2Vs
c2UKPiA+ID4gKyAgICAgY2ZsYWdzX2Z0cmFjZV9hbGlnbiA6PSAtZm1pbi1mdW5jdGlvbi1hbGln
bm1lbnQ9NAo+ID4gPiArZW5kaWYKPiA+ID4gIGlmZXEgKCQoQ09ORklHX1JJU0NWX0lTQV9DKSx5
KQo+ID4gPiAtICAgICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50
cnk9NAo+ID4gPiArICAgICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnk9NCAkKGNmbGFnc19mdHJhY2VfYWxpZ24pCj4gPiA+ICBlbHNlCj4gPiA+ICAgICAgIEND
X0ZMQUdTX0ZUUkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0yCj4gPiA+ICBlbmRp
Zgo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjQzLjAKPiA+ID4KPiA+ID4KPiAKPiBUaGFua3MsCj4g
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
