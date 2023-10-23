Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FA3C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkZQKKPahdzAByvyM8Fgmi+NL9xUwFAah2vW+iRomCI=; b=E3zLs/osckeBh/
	qlPsNrKRrQaZ6X7o/naFb+fvx75IViEX9lSc8PQnrCPlSnU2mnq81TANDxyHAfWo/QVp1NXoWWInY
	c89bBSvbqaRc81rh1oamsX4INE1gZ7NqMsborKD5jU8CR1OjbqZn3GmBAYqEz8oBQARxcgbQlU9MX
	tyqiMdOVmqE9OkzQ1kN7/omWnJGCEOLnlVxAe8fsAnT0W8uXpN0ZSxVMKKaeQMqbcYJrWN3tMKRbm
	C1bwXz4w4FLcXB1zQDxKnHBhfQUN3TFkFdVhHm6+CMgWio4121K2gMhucqD7OmgvYTEjAHeP2JVJV
	J2VZ2tiJZ7QQK6ZUJbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxdp-007oJq-2N;
	Mon, 23 Oct 2023 16:18:57 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxdl-007oIy-2q
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 16:18:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c51f5a1ecdso51245901fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698077931; x=1698682731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRXdY69ZBlfM0xKWt8N1W/8lTqIPJNkG639XQiTfSsI=;
        b=bw7zaa6eeYAVRYzamvRhbqHIGtDzfy4S5UyOwrFNiLQNn8brzzYzUS8S9RBKg7jxAP
         K45UT8mWqzRjienATaQN9zjdewUfG+XvL+0LN4ZvBJ9uU3jEIxYkWRhjOW43jYh1P96O
         zVj8QXZrf5e2kkjUhiT15MsBrExku6XfEK62JCzPIIteIkU0Jx7RJG0l2HBd4ODxhtih
         /1aPkDJVmxxOcXNJ89N+IVez/SBIzFux/RGWnNpDPPSwZMPRzLMCLnNOj6shTX//J+63
         IeJBn2VWLyT0a4USBiHHIvHObyjnmXk1foJjNSV4g0LiqyIDG7O3gFBYtnA3l4wPrSI0
         yaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698077931; x=1698682731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRXdY69ZBlfM0xKWt8N1W/8lTqIPJNkG639XQiTfSsI=;
        b=ZE1J287+1V43Nbtu98PFeBphiu9WHDQ7icaUJs+awR42UuTlDGvcODpoLIMouusT7g
         qZdTj0tU2tmebx8S0O94BgCt4sJKE5cyfqIFR0u0pa3c81Q7o7UHTZuwGZQYMKyyurKz
         D9uzJ8uAPrR3c3ioLQo6KNS/MThxpP9MfK1XW34Wh1mSilfQ8aQFK3ySgnYmvE6MjlkR
         21cKaZGsKlfBWDqhli4x16N0Pw9PpRudfbyIt2BXgY6FmBEUDwyLb1acBeW6/Vi9ryxM
         FpPGT/ZkBGA4PDAeo8xHgoxRt6pUQRCsqNX1ityBfL1tyw+Yu03urTUwJ5pGztOpmMCg
         ZrHA==
X-Gm-Message-State: AOJu0Yxebx16qmvO/Sx5j/yy6hIbZEP3F8irflnTHVAmki/raHfGzVGC
	6F21sPTabZ3lRG83Top1kvVVF8zaOcyLluLnSVu5hw==
X-Google-Smtp-Source: AGHT+IEQR4YyAihsj0DrI81eI6lmsjNopJ/6ZLCkXxPzRN7txe0u78/wppiLGpoIGQM4MFyMzlNW6OWJW9jSotoMnbY=
X-Received: by 2002:a2e:7e03:0:b0:2c4:fdfa:41c with SMTP id
 z3-20020a2e7e03000000b002c4fdfa041cmr4091293ljc.0.1698077930651; Mon, 23 Oct
 2023 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com> <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com> <20231019-nuclear-vista-ef3e0b9bef71@spud>
 <CALs-HssWZyhnbo=ErH+LEfMi4m04i39Cw3PGXP1WhCFfSP8G=A@mail.gmail.com> <3f383b96-87ae-4580-a23d-0196bbd8ec91@rivosinc.com>
In-Reply-To: <3f383b96-87ae-4580-a23d-0196bbd8ec91@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 23 Oct 2023 09:18:14 -0700
Message-ID: <CALs-Hst8NLeD649+-Za=U7Awx+=SuELz--rSGqyqHpn8gzAQrg@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Jerry Shih <jerry.shih@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_091854_139864_8C4CD5F5 
X-CRM114-Status: GOOD (  39.89  )
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

T24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMTI6MjTigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDE5LzEwLzIwMjMgMTg6MTksIEV2YW4g
R3JlZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCA4OjMz4oCvQU0gQ29ub3Ig
RG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFRodSwgT2N0IDE5
LCAyMDIzIGF0IDExOjM1OjU5QU0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiA+Pj4K
PiA+Pj4KPiA+Pj4gT24gMTgvMTAvMjAyMyAxOToyNiwgRXZhbiBHcmVlbiB3cm90ZToKPiA+Pj4+
IE9uIFdlZCwgT2N0IDE4LCAyMDIzIGF0IDU6NTPigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IE9u
IDE4LzEwLzIwMjMgMDM6NDUsIEplcnJ5IFNoaWggd3JvdGU6Cj4gPj4+Pj4+IE9uIE9jdCAxNywg
MjAyMywgYXQgMjE6MTQsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4gPj4+Pj4+PiBAQCAtMjIxLDYgKzI2MSwyMiBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNh
X2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+Pj4+Pj4+ICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemt0LCBSSVNDVl9JU0FfRVhUX1pLVCksCj4gPj4+Pj4+PiAgICAgIF9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHprc2VkLCBSSVNDVl9JU0FfRVhUX1pLU0VEKSwKPiA+Pj4+Pj4+ICAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1ZfSVNBX0VYVF9aS1NIKSwKPiA+Pj4+Pj4+
ICsgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCKSwKPiA+
Pj4+Pj4+ICsgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJD
KSwKPiA+Pj4+Pj4+ICsgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VY
VF9aVktCKSwKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhlIGBadmtiYCBpcyB0aGUgc3Vic2V0IG9mIGBa
dmJiYFsxXS4gU28sIHRoZSBgWnZrYmAgc2hvdWxkIGJlIGJ1bmRsZWQgd2l0aCBgWnZiYmAuCj4g
Pj4+Pj4KPiA+Pj4+PiBIaSBKZXJyeSwKPiA+Pj4+Pgo+ID4+Pj4+IFRoYW5rcyBmb3IgY2F0Y2hp
bmcgdGhpcywgSSB0aGluayBzb21lIG90aGVyIGV4dGVuc2lvbnMgd2lsbCBmYWxsIGluCj4gPj4+
Pj4gdGhpcyBjYXRlZ29yeSBhcyB3ZWxsIHRoZW4gKFp2a25oYS9admtuaGIpLiBJIHdpbGwgdmVy
aWZ5IHRoYXQuCj4gPj4+Pgo+ID4+Pj4gVGhlIGJ1bmRsaW5nIG1lY2hhbmlzbSB3b3JrcyB3ZWxs
IHdoZW4gYW4gZXh0ZW5zaW9uIGlzIGEgcHVyZSBsYXNzbwo+ID4+Pj4gYXJvdW5kIG90aGVyIGV4
dGVuc2lvbnMuIFdlJ2QgaGF2ZSB0byB0d2VhayB0aGF0IGNvZGUgaWYgd2Ugd2FudGVkIHRvCj4g
Pj4+PiBzdXBwb3J0IGNhc2VzIGxpa2UgdGhpcywgd2hlcmUgdGhlIGV4dGVuc2lvbiBpcyBhIHN1
cGVyc2V0IG9mIG90aGVycywKPiA+Pj4+IGJ1dCBhbHNvIGNvbnRhaW5zIGxvb3NlIGNoYW5nZSBu
b3QgcHJlc2VudCBhbnl3aGVyZSBlbHNlIChhbmQKPiA+Pj4+IHRoZXJlZm9yZSBhbHNvIG5lZWRz
IHRvIHN0YW5kIGFzIGEgc2VwYXJhdGUgYml0KS4KPiA+Pj4KPiA+Pj4gRm9yIFp2YmIgYW5kIFp2
a25oYiwgSSB1c2VkIHRoZSBmb2xsb3dpbmcgY29kZToKPiA+Pj4KPiA+Pj4gc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGludCByaXNjdl96dmJiX2J1bmRsZWRfZXh0c1tdID0gewo+ID4+PiAgICAgICBS
SVNDVl9JU0FfRVhUX1pWS0IsCj4gPj4+ICAgICAgIFJJU0NWX0lTQV9FWFRfWlZCQgo+ID4+PiB9
Owo+ID4+Pgo+ID4+PiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25oYl9idW5k
bGVkX2V4dHNbXSA9IHsKPiA+Pj4gICAgICAgUklTQ1ZfSVNBX0VYVF9aVktOSEEsCj4gPj4+ICAg
ICAgIFJJU0NWX0lTQV9FWFRfWlZLTkhCCj4gPj4+IH07Cj4gPj4+Cj4gPj4+IFdoaWNoIGNvcnJl
Y3RseSByZXN1bHRzIGluIGJvdGggZXh0ZW5zaW9uIChzdXBlcnNldCArIGJhc2Ugc2V0KSBiZWlu
Zwo+ID4+PiBlbmFibGVkIHdoZW4gb25seSBvbmUgaXMgc2V0LiBJcyB0aGVyZSBzb21ldGhpbmcg
dGhhdCBJJ20gbWlzc2luZyA/Cj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gSU1PLCBkZWNvbXBvc2luZyAi
cHVyZSIgYnVuZGxlcyBtYWtlcyBzZW5zZSBzaW5jZSBvdGhlcndpc2UgdXNlcm1vZGUKPiA+Pj4+
IHdvdWxkIGhhdmUgdG8gcXVlcnkgbXVsdGlwbGUgZGlzdGluY3QgYml0bWFwcyB0aGF0IG1lYW50
IHRoZSBzYW1lCj4gPj4+PiB0aGluZyAoZWcgY2hlY2sgdGhlIFprIGJpdCwgb3IgbWF5YmUgY2hl
Y2sgdGhlIFprbi9aa3IvWmt0IGJpdHMsIG9yCj4gPj4+PiBtYXliZSBjaGVjayB0aGUgWmJrYi9a
YmtjLi4uIGJpdHMsIGFuZCB0aGV5J3JlIGFsbCBlcXVpdmFsZW50KS4gQnV0Cj4gPj4+PiB3aGVu
IGFuIGV4dGVuc2lvbiBpcyBhIHN1cGVyc2V0IHRoYXQgYWxzbyBjb250YWlucyBsb29zZSBjaGFu
Z2UsIHRoZXJlCj4gPj4+PiByZWFsbHkgYXJlbid0IHR3byBlcXVpdmFsZW50IGJpdG1hc2tzLCBl
YWNoIGJpdCBhZGRzIHNvbWV0aGluZyBuZXcuCj4gPj4+Cj4gPj4+IEFncmVlZCBidXQgaWYgYSBz
eXN0ZW0gb25seSByZXBvcnQgWlZCQiBmb3IgaW5zdGFuY2UgYW5kIHRoZSB1c2VyIHdhbnRzCj4g
Pj4+IFpWS0IsIHRoZW4gaXQgaXMgY2xlYXIgdGhhdCBaVktCIHNob3VsZCBiZSByZXBvcnRlZCBh
cyB3ZWxsIEkgZ3Vlc3MuIFNvCj4gPj4+IGluIHRoZSBlbmQsIGl0IHdvcmtzIG11Y2ggbGlrZSAi
YnVuZGxlIiBleHRlbnNpb24sIGp1c3QgdGhhdCB0aGUgYnVuZGxlCj4gPj4+IGlzIGFjdHVhbGx5
IGEgInJlYWwiIElTQSBleHRlbnNpb24gYnkgaXRzZWxmLgo+ID4+Pgo+ID4+PiBDbMOpbWVudAo+
ID4+Pgo+ID4+Pj4KPiA+Pj4+IFRoZXJlJ3MgYW4gYXJndW1lbnQgdG8gYmUgbWFkZSBmb3Igc3Rp
bGwgdHVybmluZyBvbiB0aGUgY29udGFpbmluZwo+ID4+Pj4gZXh0ZW5zaW9ucyB0byBjb3ZlciBm
b3Igc2lsbHkgSVNBIHN0cmluZ3MgKGVnIElTQSBzdHJpbmdzIHRoYXQKPiA+Pj4+IGFkdmVydGlz
ZSB0aGUgc3VwZXJzZXQgYnV0IGZhaWwgdG8gYWR2ZXJ0aXNlIHRoZSBjb250YWluaW5nCj4gPj4+
PiBleHRlbnNpb25zKS4gV2UgY2FuIGRlY2lkZSBpZiB3ZSB3YW50IHRvIHdvcmsgdGhhdCBoYXJk
IHRvIGNvdmVyCj4gPj4+PiBoeXBvdGhldGljYWwgYnJva2VuIElTQSBzdHJpbmdzIG5vdywgb3Ig
d2FpdCB1bnRpbCB0aGV5IHNob3cgdXAuCj4gPj4+PiBQZXJzb25hbGx5IEkgd291bGQgd2FpdCB1
bnRpbCBzb21ldGhpbmcgYnJva2VuIHNob3dzIHVwLiBCdXQgb3RoZXJzCj4gPj4+PiBtYXkgZmVl
bCBkaWZmZXJlbnRseS4KPiA+Pgo+ID4+IEknbSBub3QgcmVhbGx5IHN1cmUgdGhhdCB0aG9zZSBh
cmUgInNpbGx5IiBJU0Egc3RyaW5ncy4gUGVvcGxlIGFyZSBnb2luZwo+ID4+IHRvIGRvIGl0IHRo
YXQgd2F5IGJlY2F1c2UgaXQgaXMgbXVjaCBlYXNpZXIgdGhhbiBzcGVsbGluZyBvdXQgNSBkb3pl
bgo+ID4+IHN1Yi1jb21wb25lbnRzLCBhbmQgaXQgaXMgcHJldHR5IGluZXZpdGFibGUgdGhhdCBz
dWJzZXRzIHdpbGwgYmUKPiA+PiBpbnRyb2R1Y2VkIGluIHRoZSBmdXR1cmUgZm9yIGV4dGVuc2lv
bnMgd2UgY3VycmVudGx5IGhhdmUuCj4gPj4KPiA+PiBJTU8sIGl0J3MgcGVyZmVjdGx5IHZhbGlk
IHRvIHNheSB5b3UgaGF2ZSB0aGUgc3VwZXJzZXRzIGFuZCBub3Qgc3BlbGwKPiA+PiBvdXQgYWxs
IHRoZSBzdWJjb21wb25lbnRzLgo+ID4KPiA+IEhtLCBvay4gSWYgSVNBIHN0cmluZ3MgYXJlIGxp
a2VseSB0byBiZSB3cml0dGVuIHRoYXQgd2F5LCB0aGVuIEkgYWdyZWUKPiA+IGhhdmluZyB0aGUg
a2VybmVsIGZsaXAgb24gYWxsIHRoZSBjb250YWluZWQgZXh0ZW5zaW9ucyBpcyBhIGdvb2QgaWRl
YS4KPiA+IFdlIGNhbiB0d2VhayBwYXRjaCAyIHRvIHN1cHBvcnQgdGhlIHBhcnNpbmcgb2Ygc3Ry
dWN0Cj4gPiByaXNjdl9pc2FfZXh0X2RhdGEgd2l0aCBib3RoIC5pZCBhbmQgLmJ1bmRsZV9zaXpl
IHNldCAoaW5zdGVhZCBvZiBvbmx5Cj4gPiBvbmUgb3IgdGhlIG90aGVyIGFzIGl0IGlzIG5vdyku
IExvb2tpbmcgYmFjayBhdCB0aGF0IHBhdGNoLCBpdCBsb29rcwo+ID4gcXVpdGUgZG9hYmxlLiBB
bHJpZ2h0IQo+Cj4gSGV5IEV2YW4sCj4KPiBkbyB5b3UgaGF2ZSBhbnl0aGluZyBhZ2FpbnN0IHVz
aW5nIHRoaXMgY29kZToKPgo+IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9i
dW5kbGVkX2V4dHNbXSA9IHsKPiAgICAgICAgIFJJU0NWX0lTQV9FWFRfWlZLQiwKPiAgICAgICAg
IFJJU0NWX0lTQV9FWFRfWlZCQgo+IH07Cj4KPiAuLi4KPgo+IFRoZW4gZGVjbGFyaW5nIHp2YmIg
bGlrZSB0aGF0Ogo+Cj4gX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmJiLCByaXNjdl96dmJiX2J1
bmRsZWRfZXh0cyksCj4KPiBJIGFncmVlIHRoYXQgaXQgaXMgKm5vdCogYSBidW5kbGVkIGV4dGVu
c2lvbiBidXQgaXQgYWN0dWFsbHkgYWxyZWFkeQo+IHdvcmtzIHdpdGggQ29ub3IncyBjb2RlLiBO
b3Qgc3VyZSB0aGF0IGFkZGluZyBtb3JlIGNvZGUgaXMgbmVlZGVkIHRvCj4gaGFuZGxlIHRoYXQg
Y2FzZS4KCkFoLCBJIGhhZCBtaXNzZWQgdGhhdCBadmJiIHdhcyBpbiBadmJiJ3Mgb3duIGJ1bmRs
ZS4gSSBzZWUgbm93IHRoYXQgaXQKd29ya3MsIGJ1dCBpdCBhbHNvIGZlZWxzIGEgYml0IGxpa2Ug
d2UncmUgd29ya2luZyBhcm91bmQgb3VyIG93biBjb2RlLgoKQW4gYWx0ZXJuYXRlIHdheSwgd2hp
Y2ggeW91IGNhbiBkZWNpZGUgaWYgeW91IGxpa2UgYmV0dGVyLCB3b3VsZCBiZSBhCm5ldyBtYWNy
byAoc29tZXRoaW5nIGxpa2UgX19SSVNDVl9JU0FfRVhUX0RBVEFfQlVORExFKCksIGJ1dCBiZXR0
ZXIKbmFtZXMgd2VsY29tZSkgdGhhdCBhbGxvd3Mgc2V0dGluZyBib3RoIC5pZCBhbmQgLmJ1bmRs
ZV9zaXplLiBUaGVuIHRoZQplbHNlLWlmIGluIG1hdGNoX2lzYV9leHQoKSBjb3VsZCBqdXN0IHR1
cm4gaW50byB0d28gaW5kZXBlbmRlbnQgaWZzLgpZb3UnZCBoYXZlIHRvIGRlZmluZSBhbiAiaW52
YWxpZCIgdmFsdWUgZm9yIC5pZCwgc2luY2UgMCBpcyAnYScsIGJ1dAp0aGF0IHNob3VsZCBiZSBz
dHJhaWdodGZvcndhcmQuIE9yIG1heWJlIGppZ2dsZSB0aGluZ3MgYXJvdW5kIGEgYml0IHNvCjAg
aXMgaW52YWxpZCBhbmQgJ2EnIGlzIDEuCgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
