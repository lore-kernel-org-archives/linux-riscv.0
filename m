Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CBDC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXM8o7jfyDZNhoQaYfdR2T3CwPWRFDzbuGLSeBefnVQ=; b=S5QRl1LtgD6g/h
	BmVETjHfrY+KsPVSBW2SIAlAoG/N7d+eSexY6EYDRT65E1BGZLM3+HONzDCBefci8RB8DP8s9cOSB
	O3WnmhqurUbTGOW8YAscXOKeIYpbBGvJux5/swrVhGEldPVRwSu0NeM4MYZsMtMk1oinFfM4AAy1/
	ZATeeWNX2ZyryobZmqCYZ55JBDh+XK+F8juLyXotIAZvIfHQ4ZHVUBR12Z/0Vi4i7SpEQbuleZDF9
	iOe0zeiwr0+IOOdt7STzzvW0ZjZyNP8Qavd9Yk4ZaLbevKMMhYMc6EgUIHLSAwInC0rkRmX5oP4mZ
	cpl25XBfr9PgPQ2qtFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1AG-00GeDs-0z;
	Wed, 22 Mar 2023 16:18:16 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1AD-00GeCV-1p
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 16:18:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id h25so12454134lfv.6
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679501891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91NUsnI2JWzfZ4bANRRwcZ4orsUryFhVkgWXPdVK98g=;
        b=G2s79NLcITgAksd3/kq8VJtWspJVsPtOCodre7wqiFjOGu3tfqxEGcHiiTKs9xXS8g
         nwTXUK9QA5CbXOAbXfd+kxBIrw8HMUUewNAP0B71MjIkc5fHVCIv6eXxUxjmLljY1lMy
         nkE30ypFZwFDgsjEIjrBSqFee//emPM2Ig3TP9YTWrXf9yzM6JbK4GM1eeXEQybU/PUb
         GETetZGN2DggKxOYhw1jwg4XprUTKPaWloeltxSiG5FYNJUzkEDTjEIvspbM1dRSvjGN
         H9OPDl7W4ebTwMXIsaEPtjILjg0BbMztfI898jPtHg9QT/tZViD2dRCgwc9pBKe78T3J
         uMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91NUsnI2JWzfZ4bANRRwcZ4orsUryFhVkgWXPdVK98g=;
        b=bbdCGFxo52aO7OLFtPakrau6LqO4VWlW095iU7tceX0V7+uSnQsC3zD8nGfWx36wQi
         j+JBb+rv34NnjtPxAlGvMLSj4ahiK0V0cAAwZXguBvYRRTqeX3j8s8pmU3f5uuaQhTYM
         gDPz70SuM7SuFaTF9mb1YTwblyRclNnaF7gvDknZ7VNSP24BruT3xUtS/2aJGIhTgNGt
         ArDlh3fQj3rn7vhefWo8eLG5ZvbFv/tmSeLC0kK4bKkcCrx/V0P6Cf0XKRJmH94pE41r
         mtbSokWun7cj2u5+EmZ1uZSob7MtxNZ9uVaWSZZ09U+Mh5DAh/jklMVId8So1EAnv7S5
         oF+Q==
X-Gm-Message-State: AO0yUKXeJ1Y6V6guvCyzMBCO0siOzdqLEf9kIK+gY0vDUNTNBWB1U+DI
	UrPEOcpufKJs5zq9x5NhxxseD2bAbHJHBeQ08mVfSA==
X-Google-Smtp-Source: AK7set9Y6w1sy23dklqHJdPn+k27VHykRl6SZ39SZtwN0MftCWxQu9UvUwQzQP7Nv3+x+O3Su2kEKylKZtHjHnLlD3Q=
X-Received: by 2002:ac2:41c6:0:b0:4d5:ca43:704a with SMTP id
 d6-20020ac241c6000000b004d5ca43704amr2061085lfi.13.1679501890831; Wed, 22 Mar
 2023 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183220.513101-1-evan@rivosinc.com> <20230314183220.513101-4-evan@rivosinc.com>
 <3351107.e9J7NaK4W3@diego>
In-Reply-To: <3351107.e9J7NaK4W3@diego>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 22 Mar 2023 09:17:34 -0700
Message-ID: <CALs-HsuCejsEtS65pH=SBp74V2gw2d2WmkL44muWr6+VSocO5w@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com, 
	Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com, 
	Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Bresticker <abrestic@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_091813_625922_806A4886 
X-CRM114-Status: GOOD (  26.59  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgOTo0MeKAr0FNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+Cj4gSGkgRXZhbiwKPgo+IEFtIERpZW5zdGFnLCAxNC4gTcOkcnog
MjAyMywgMTk6MzI6MTcgQ0VUIHNjaHJpZWIgRXZhbiBHcmVlbjoKPiA+IFdlIGhhdmUgYW4gaW1w
bGljaXQgc2V0IG9mIGJhc2UgYmVoYXZpb3JzIHRoYXQgdXNlcnNwYWNlIGRlcGVuZHMgb24sCj4g
PiB3aGljaCBhcmUgbW9zdGx5IGRlZmluZWQgaW4gdmFyaW91cyBJU0Egc3BlY2lmaWNhdGlvbnMu
Cj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAgLSBNb3JlIG5ld2xpbmVzIGluIEJB
U0VfQkVIQVZJT1JfSU1BIGRvY3VtZW50YXRpb24gKENvbm9yKQo+ID4KPiA+IENoYW5nZXMgaW4g
djM6Cj4gPiAgLSBSZWZhY3RvcmVkIGJhc2UgSVNBIGJlaGF2aW9yIHByb2JlIHRvIGFsbG93IGtl
cm5lbCBwcm9iaW5nIGFzIHdlbGwsCj4gPiAgICBpbiBwcmVwIGZvciB2RFNPIGRhdGEgaW5pdGlh
bGl6YXRpb24uCj4gPiAgLSBGaXhlZCBkb2Mgd2FybmluZ3MgaW4gSU1BIHRleHQgbGlzdCwgdXNl
IDpjOm1hY3JvOi4KPiA+Cj4gPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAg
ICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdwcm9iZS5oICAgICAgfCAgMiArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmggfCAgNSArKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5j
ICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
NTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2Jl
LnJzdAo+ID4gaW5kZXggMjExODI4ZjcwNmUzLi45NDVkNDQ2ODNjNDAgMTAwNjQ0Cj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiBAQCAtMzksMyArMzksMjcgQEAgVGhlIGZvbGxvd2luZyBr
ZXlzIGFyZSBkZWZpbmVkOgo+ID4KPiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9N
SU1QTElEYDogQ29udGFpbnMgdGhlIHZhbHVlIG9mIGBgbWltcGxpZGBgLCBhcwo+ID4gICAgZGVm
aW5lZCBieSB0aGUgUklTQy1WIHByaXZpbGVnZWQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb24u
Cj4gPiArCj4gPiArKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQkFTRV9CRUhBVklPUmA6
IEEgYml0bWFzayBjb250YWluaW5nIHRoZSBiYXNlCj4gPiArICB1c2VyLXZpc2libGUgYmVoYXZp
b3IgdGhhdCB0aGlzIGtlcm5lbCBzdXBwb3J0cy4gIFRoZSBmb2xsb3dpbmcgYmFzZSB1c2VyIEFC
SXMKPiA+ICsgIGFyZSBkZWZpbmVkOgo+ID4gKwo+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9CQVNFX0JFSEFWSU9SX0lNQWA6IFN1cHBvcnQgZm9yIHJ2MzJpbWEgb3IKPiA+ICsgICAg
cnY2NGltYSwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDIuMiBvZiB0aGUgdXNlciBJU0EgYW5kIHZl
cnNpb24gMS4xMCBvZiB0aGUKPiA+ICsgICAgcHJpdmlsZWdlZCBJU0EsIHdpdGggdGhlIGZvbGxv
d2luZyBrbm93biBleGNlcHRpb25zIChtb3JlIGV4Y2VwdGlvbnMgbWF5IGJlCj4gPiArICAgIGFk
ZGVkLCBidXQgb25seSBpZiBpdCBjYW4gYmUgZGVtb25zdHJhdGVkIHRoYXQgdGhlIHVzZXIgQUJJ
IGlzIG5vdCBicm9rZW4pOgo+ID4gKwo+ID4gKyAgICAqIFRoZSA6ZmVuY2UuaTogaW5zdHJ1Y3Rp
b24gY2Fubm90IGJlIGRpcmVjdGx5IGV4ZWN1dGVkIGJ5IHVzZXJzcGFjZQo+ID4gKyAgICAgIHBy
b2dyYW1zIChpdCBtYXkgc3RpbGwgYmUgZXhlY3V0ZWQgaW4gdXNlcnNwYWNlIHZpYSBhCj4gPiAr
ICAgICAga2VybmVsLWNvbnRyb2xsZWQgbWVjaGFuaXNtIHN1Y2ggYXMgdGhlIHZEU08pLgo+ID4g
Kwo+ID4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMGA6IEEgYml0bWFz
ayBjb250YWluaW5nIHRoZSBleHRlbnNpb25zCj4gPiArICB0aGF0IGFyZSBjb21wYXRpYmxlIHdp
dGggdGhlIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfSU1BYDoKPiA+ICsg
IGJhc2Ugc3lzdGVtIGJlaGF2aW9yLgo+ID4gKwo+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9JTUFfRkRgOiBUaGUgRiBhbmQgRCBleHRlbnNpb25zIGFyZSBzdXBwb3J0ZWQsIGFzCj4g
PiArICAgIGRlZmluZWQgYnkgY29tbWl0IGNkMjBjZWUgKCJGTUlOL0ZNQVggbm93IGltcGxlbWVu
dAo+ID4gKyAgICBtaW5pbXVtTnVtYmVyL21heGltdW1OdW1iZXIsIG5vdCBtaW5OdW0vbWF4TnVt
Iikgb2YgdGhlIFJJU0MtViBJU0EgbWFudWFsLgo+ID4gKwo+ID4gKyAgKiA6YzptYWNybzpgUklT
Q1ZfSFdQUk9CRV9JTUFfQ2A6IFRoZSBDIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmlu
ZWQKPiA+ICsgICAgYnkgdmVyc2lvbiAyLjIgb2YgdGhlIFJJU0MtViBJU0EgbWFudWFsLgo+Cj4g
anVzdCB3b25kZXJpbmcsIGlzIHRoZXJlIGEgcGxhbiBvbiBob3cgZnVydGhlciBleHRlbnNpb25z
IHNob3VsZCBiZSBhZGRlZCB0aGlzIHRoaXM/Cj4gW2FzIHdlIGhhdmUgdGhpcyBiaWcgcGxldGhv
cmEgb2YgdGhlbSA6LSkgXQo+Cj4gQWthIHRoaW5ncyBsaWtlIFpiYiBhbmQgZnJpZW5kcyB3aWxs
IHByb2JhYmx5IGFsc28gYmUgcmVsZXZhbnQgdG8gdXNlcnNwYWNlLCBzbyBqdXN0Cj4gZmlsbCB1
cCBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzAgd2l0aCBtb3JlIGVsZW1lbnRzIGFuZCBvbmNl
IGZ1bGwgc3dpdGNoIHRvCj4gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8xICwgUklTQ1ZfSFdQ
Uk9CRV9LRVlfSU1BX0VYVF8yLCBldGM/Cj4KPiBPciBkbyB3ZSBoYXZlIHNvbWUgbW9yZSBlbGFi
b3JhdGUgc29ydGluZyBtZWNoYW5pc20/CgpUaGF0IHNvdW5kcyByZWFzb25hYmxlIHRvIG1lLiBJ
IHRyaWVkIHRvIHRoaW5rIGFib3V0IGEgY291cGxlIG9mCnBvc3NpYmxlIHNvcnRpbmcgcGF0dGVy
bnMsIGJ1dCB3aGVuIEkgcGxheWVkIHRoZW0gb3V0IG1lbnRhbGx5IHRoZXkKd2VyZSBvbmx5IGV2
ZXIgYWVzdGhldGljYWxseSBwbGVhc2luZyB3aXRoIG5vIHRlY2huaWNhbCBiZW5lZml0LCBhbmQK
cG9zc2libHkgYWRkZWQgdGVjaG5pY2FsIGRlYnQuCi1FdmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
