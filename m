Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48637C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQE0yRzu6JWMmiKxGJbmhY+bzzO1Za+vnpUjM7qZAKg=; b=xmR75M6Fk5G+bk
	wNxB9hQYTGEc9EIHEcptc0ARGoK2/o3SXyC16/vIAzyplEmUexOeBVqdlSd0CXtwBNiIGCmmEXZeH
	PwVPmzTCRFQdnjMhpcyNaSF5HrMKseuB7MK4MdHfWD4PHTeWWiDCHinzHvcsKDhLOCN0qwcseAjgY
	z1S9wdf9ymN2S+G7ADxc2HtevFnh8FTI04Q9bh1I8eLsY0hKcix6u8NtLSHyrueYCCqSOFKFm1HZ5
	6rTyIQn3p5OmYjDw/Pl1IpJg7gL+XHknOobxLUp85TvBA/4dEu1ZWnDJrxlaEzBRhJR/YHuzJYEy3
	p4v9GmfCI4l0labrIt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvupA-00HRaI-1Y;
	Mon, 08 May 2023 06:58:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvup7-00HRZd-1G
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:58:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEBFD61F42
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AE4C433A7
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683529095;
	bh=3NvGzGZUDejWf2Tsc/ruVQPX/c2lUYLZP2mcCabAqpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NXE7z5SvCZ/k3TCIBRogKFdMhzfn0wpJbvPqtyXIAyoSti38t5Ep2rO3WqDfUkUW+
	 bwzb6RlFG6+pPCquLjxl0Ch/Rgj699XEnKTCwLKJS3pbRLhiBILtp2ALPR7wYAVcBk
	 /Yb7dLOLcZ8qiRavKbYNrnDsGSbCmfalUyBRXHjG671oGchEFI9RNKwR756GnA0VFM
	 dq9TWjCJWKAGyo/055cMy1R3rso1RqSSB/hyKdPpyVVnYkpb+lYtPig2u7BlJeTdsu
	 lBRCKks+Pz76u1WU5tEb9aM4V6FHEsz8AWjAFKLW/2xDoj9p6czkGMRZUIyF8JkhJN
	 s1HsirNbBRpEg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965cc5170bdso561484566b.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:58:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDyYoCVLdXcMw+9wWORYuK3GlMOGuLnou3UQQfwQXN22V0kJwSkh
	d2bBqy7PY7zkI6Z6ET28b6VWDu6/94S7/8uVn5M=
X-Google-Smtp-Source: ACHHUZ4eTiPCDomhQD8cUrrT/3bGwzPZ7F4C644pKdOt1JjzD5ZlEtq5hNlN2UT0wNlBk1g+j/KrEa+J7Swd/5aMHM4=
X-Received: by 2002:a17:906:7304:b0:94c:ea3b:27a with SMTP id
 di4-20020a170906730400b0094cea3b027amr9183323ejc.16.1683529093952; Sun, 07
 May 2023 23:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-3-jszhang@kernel.org>
 <20230507-sleeve-tacky-21e817e31fb2@spud> <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
 <20230508-splashed-voicing-bc6e91aeb053@wendy>
In-Reply-To: <20230508-splashed-voicing-bc6e91aeb053@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:58:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSZmjScBERVxxsEJ-q-HdXn+daT5-H-QvGt2iWxPCaT3g@mail.gmail.com>
Message-ID: <CAJF2gTSZmjScBERVxxsEJ-q-HdXn+daT5-H-QvGt2iWxPCaT3g@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add the T-HEAD SoC family Kconfig option
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_235817_516694_D1999B84 
X-CRM114-Status: GOOD (  25.41  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAyOjUz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAwOCwgMjAyMyBhdCAwMjo0
MjoxMFBNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgOCwgMjAyMyBhdCA1
OjIy4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDI6MjM6MDFBTSArMDgwMCwgSmlzaGVuZyBaaGFu
ZyB3cm90ZToKPiA+ID4gPiBUaGUgZmlyc3QgU29DIGluIHRoZSBULUhFQUQgc2VyaWVzIGlzIGxp
Z2h0KGEuay5hIHRoMTUyMCksIGNvbnRhaW5pbmcKPiA+ID4gPiBxdWFkIFQtSEVBRCBDOTEwIGNv
cmVzLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFu
Z0BrZXJuZWwub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcuc29j
cyB8IDYgKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+
ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gv
cmlzY3YvS2NvbmZpZy5zb2NzCj4gPiA+ID4gaW5kZXggMWNmNjlmOTU4ZjEwLi5jZTEwYTM4ZGZm
MzcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+ID4gPiA+IEBAIC00MSw2ICs0MSwxMiBAQCBj
b25maWcgQVJDSF9TVU5YSQo+ID4gPiA+ICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9y
IEFsbHdpbm5lciBzdW4yMGkgcGxhdGZvcm0gaGFyZHdhcmUsCj4gPiA+ID4gICAgICAgICBpbmNs
dWRpbmcgYm9hcmRzIGJhc2VkIG9uIHRoZSBEMSBhbmQgRDFzIFNvQ3MuCj4gPiA+ID4KPiA+ID4g
PiArY29uZmlnIEFSQ0hfVEhFQUQKPiA+ID4KPiA+ID4gQ291bGQgeW91IHBsZWFzZSBhZGQgYSBk
ZWZjb25maWcgcGF0Y2gsIGFkZGluZyB0aGlzIG9wdGlvbiwgc28gdGhhdCB3ZQo+ID4gPiBidWls
ZCBzdXBwb3J0IGZvciB0aGlzIHBsYXRmb3JtIGJ5IGRlZmF1bHQ/Cj4KPiA+IFllcywgYnV0IGl0
J3MgYW5vdGhlciBwYXRjaCwgc2VlOiAnY29tbWl0IGViMjBlN2NiOTFiYSAoInJpc2N2Ogo+ID4g
ZGVmY29uZmlnOiBFbmFibGUgdGhlIEFsbHdpbm5lciBEMSBwbGF0Zm9ybSBhbmQgZHJpdmVycyIp
Jwo+Cj4gQnV0IHRoYXQncyBBUkNIX1NVTlhJIGZvciB0aGUgQWxsd2lubmVyIEQxLiBJZiB0aGUg
VEgxNTIwIGlzIGEKPiBmaXJzdC1wYXJ0eSBTb0MsIGFuZCBub3QgYW4gQWxsd2lubmVyIHByb2R1
Y3QsIGl0IG5lZWRzIGEgbmV3IEtjb25maWcKPiBlbnRyeSBldGMuCj4gSWYgaXQgaXMgYW4gQWxs
d2lubmVyLCB0aGVuIHRoZSBkdHMgZXRjIHNob3VsZCBiZSBpbiB0aGUgQWxsd2lubmVyCj4gZGly
ZWN0b3J5IHRvby4KRG8geW91IG1lYW4/CmNvbmZpZyBBUkNIX1RIRUFECiAgICAgICAgZGVmX2Jv
b2wgU09DX1RIRUFECgpjb25maWcgU09DX1RIRUFECiAgICAgICAgYm9vbCAiVC1IRUFEIFNvQ3Mi
CgpJbiBkZWZjb25maWc6CitDT05GSUdfU09DX1RIRUFEPXkKCj4KPiBDaGVlcnMsCj4gQ29ub3Iu
CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
