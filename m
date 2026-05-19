Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95972CD4F57
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUCs/YkovP9qeZcXXr7kxxfCXbop9jAHeXZpTOYfBto=; b=u29h0/h6WWULSr
	UvjIL8hA9dAWgJXayFTIACJR8M0cUbEi1vmE2CGv0ZmtGA8+g2VttfiE8Gv5XmH/KhNCN7griPgkp
	xdnnBTdeJTqAGk/875jFfvWtD96uRUJ7+N2fqX4wfJFeXFM2pZjcksj01jKnL6WmsyzQFvDLGuCi/
	c+qNFYOYrugkD1fM2mtxfPnEeCoKi+HoC36BdqVudfE20imfTXJf2/XBjyCSYXxA/VET9sBqX9YyU
	IruehdrJDFS0T+2ILd+SZfGipE9Kv/MjdA/NFw4ZxnzUnKpbhzU8lM7U1idoUlLo9Ma3JzMtqp5UW
	fAYgVt5R0JrzNlTUwQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGcb-00000000tUD-0p4u;
	Tue, 19 May 2026 09:20:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGcZ-00000000tTV-0Yab
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:20:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bd11a3729e8so559601666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 02:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779182413; cv=none;
        d=google.com; s=arc-20240605;
        b=PkRoeTC2CKTbcUqfIN3ysylWQT1wA6lwAlBH+CAg05Z8l+ZfeKPA0EdxwJJ6lPw5Tl
         GO09V2guoajlLQQBEwff6LZqnj+NzRKZIz3eBxPZusXJswz2EgTkmRReEbj4150qXWTh
         R6BLOeHCouIdk1EIuO2R46uT7c1Tjb7+5I3T+wou/5xZIQiI6ij5HFqSPX5Rj5xwDxL+
         jsuq70laZob8SjHvy+/Y3yE0V8wOGmTd01+8Q3LcP82secKnDXXOSORUFnFhrPsItpBe
         T2NsleEf0LhPHWg2kq5W7uBlrmd3o59YbrCV97/oUDAuh/mm0GNZxTIQwiqnNxByB03Q
         zoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfWu/8vKto9CQAtt349R8n3C/VWlID9Bb/Ku/VCBeHI=;
        fh=TTEW2Se0RDtJBu9UHA7IKsw47RYbz9iP7jnFk9MdTLU=;
        b=f+qMN8F2wTqwQ80DI+xg+CkaHelGkwjnHacOmzhPP0lsJ3HKIvY9IFlFVd6zClVXhV
         Mpeb1yQmboFPaYbH1aVyICJ124rl9azkbL0WqktRYwRG1i9Gulaai7VS/fiSLibb06XT
         MFJiMYW3pOXzHesC5GVKVSfinkaSQ4vPolqZreX0XxsK205gXN/VQNtfjRkowA6pnlCF
         XyDY0+CklKK//hQ1ma6q2ODoW/pt8YmlNxRXlIQRerKNLpP22ZT1UmTaWsNcKkKwpJAu
         hI5wmeTB8FX4BhymsAOTsMAhmeQW/mNHnvWnhDXFt4jIkWDhLwjobF2qO1m65Ya50Wbf
         Pv+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779182413; x=1779787213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfWu/8vKto9CQAtt349R8n3C/VWlID9Bb/Ku/VCBeHI=;
        b=MXMXWBJUdC0psUEB9JL9twCFSsulKp6iRhdQ6+0b5jyTP6w91/oT9SybYzOGFsfd50
         ywfAAOuMZ8D4jupYZ+NKApdjxrxCwbduLGARwmMmAWoGc1E1xtXQ86YItP79KH1hl43U
         pN3SFpsWMDUW3MFR0jrfo9+U90rjCn3koRCJdC0M8Uuw3bt+JuNWgzI4GfR8HipY1USi
         J3k//lzrHFbhmiVxUpdk1ONQlAs5AovJZh39ketdWco8jjf/lpvRR+FbGpne0ogGqTn0
         eiYOO2+3cAcLqO3uTF7FrDOjMuNH7pXSTXSH+liQ2pSywZWwxYCEAFw7FHIP5Rl+ggcf
         51sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182413; x=1779787213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfWu/8vKto9CQAtt349R8n3C/VWlID9Bb/Ku/VCBeHI=;
        b=X3VGLRnTl/NBETSr77LxfZTR0MzbkXkzBphFp4rfsLWkEi6xVcFMVEn+JaVoe1dj/l
         l/mjm4fRCzapfuIv0NjJBQKyWRrdanWUxV1oBM/wKpbWv979X5ArSLh3Ee2vEvMX7tcg
         h1r+CQoeKWyYlK77VA6KPPIjUCuYktrHlSsCo5CzKig9jgBm5MUbPjZnmWMB/Ck+tJb0
         xCwB1RjpE9Jysosnf/AdTMF4RtEDkzjlfxUww8oRggw5dVr3TMzlbauUuvYYZyQY1kqC
         Y9w553Ta88ukLv/+y4tiBVY+Kncd1kopF4kZzS1hH7v1MxOdfvuCC0Vqo5jp31x7EMa0
         Pykg==
X-Forwarded-Encrypted: i=1; AFNElJ9uoHA1qu/CH92gchbHsCO67skuovrEYeBVC/Y+DFPs0Pcb204Fd5nca7CObYmQ959X5ZOvvk8SKntNbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQr5SDcgsOLDDRhC7HF7EfAa2RBSWHoIj6++aziogpz538HC5D
	3e/G4VgKx3Mn2AcMFz/Jx7Mtlm99+vhDfPitn8rH5EcNKGz7poi6EJqeRZ8WcHadENAcw5Mq5z3
	XRK6ZXeSM65bjR/TNlmQ0P6cmca6OwKI4/sNhvOsy5A==
X-Gm-Gg: Acq92OGF8iNtviAmJe8OhGqWhNvl94AKz5RpNeWDDv9X9mzuHW/TgIA7L+TI9GLLiuX
	hQC6mjMeOuLGFXn/2SmVEc0M1xynPqOCgxJ7HDtcNasG13C8SIzsYA6pqrynE1ebqUBPnzboVDv
	Nk3rahVgJ3UhFzSwNyXSHdvCuNozugogW7ocOjvQVM0djhPAPAyXpoROq/fcKMvCiubipyfxQtO
	0Mp64Rq55ROk4ebkqO0Anc2MJw1C9K4BR3uyElmB3TmbwHkrNewuSx8YVe69B2OGhh8tuu+ok0G
	L4CRg7PQevv3MhonCmV6
X-Received: by 2002:a17:907:d06:b0:bd3:c295:d76c with SMTP id
 a640c23a62f3a-bd5177afe53mr1150389266b.1.1779182413155; Tue, 19 May 2026
 02:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260519071809.3823470-1-zong.li@sifive.com> <ccfe25b8-df25-49b6-a40e-d86630cbc407@w6rz.net>
In-Reply-To: <ccfe25b8-df25-49b6-a40e-d86630cbc407@w6rz.net>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 19 May 2026 17:20:01 +0800
X-Gm-Features: AVHnY4LCj398HbecTnHOwODoKQ71KDZNFHkcN29xiK1Udm33Iv6v8Z1lxdIwsIc
Message-ID: <CANXhq0rH+_FN+HcqK1_PwkgYfhN5KmcTRnk7pt8GzEhfiT4fpQ@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: cif: reduce shadow stack size limit from 4GB to 512MB
To: Ron Economos <re@w6rz.net>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_022015_202921_2905C5F4 
X-CRM114-Status: GOOD (  29.77  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNDoyOOKAr1BNIFJvbiBFY29ub21vcyA8cmVAdzZyei5u
ZXQ+IHdyb3RlOgo+Cj4gT24gNS8xOS8yNiAwMDoxOCwgWm9uZyBMaSB3cm90ZToKPiA+IFJhdGlv
bmFsZToKPiA+Cj4gPiAxLiBTaGFkb3cgc3RhY2tzIG9ubHkgc3RvcmUgcmV0dXJuIGFkZHJlc3Nl
cyAoOCBieXRlcyBwZXIgZW50cnkpLCBub3QKPiA+ICAgICBsb2NhbCB2YXJpYWJsZXMsIGZ1bmN0
aW9uIHBhcmFtZXRlcnMsIG9yIHNhdmVkIHJlZ2lzdGVycy4gQSA1MTJNQgo+ID4gICAgIHNoYWRv
dyBzdGFjayBpcyBmYXIgbW9yZSB0aGFuIHN1ZmZpY2llbnQgZm9yIGFueSBwcmFjdGljYWwKPiA+
ICAgICBhcHBsaWNhdGlvbiwgZXZlbiB3aXRoIGV4dHJlbWVseSBkZWVwIHJlY3Vyc2lvbi4gVGhp
cyBzaXplCj4gPiAgICAgbWFpbnRhaW5zIGFkZXF1YXRlIHdoaWxlIGJlaW5nIG1vcmUgcmVzb3Vy
Y2UtZWZmaWNpZW50IG1hcmdpbgo+ID4KPiA+IDIuIE9uIG1lbW9yeS1jb25zdHJhaW5lZCBzeXN0
ZW1zIChlLmcuLCBwbGF0Zm9ybXMgd2l0aCBvbmx5IDRHQiBvZgo+ID4gICAgIHBoeXNpY2FsIG1l
bW9yeSwgd2hpY2ggaXMgYSBjb21tb24gY29uZmlndXJhdGlvbiksIGFsbG9jYXRpbmcgNEdCCj4g
PiAgICAgb2YgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvciBzaGFkb3cgc3RhY2sgcGVyIHByb2Nl
c3MvdGhyZWFkIGNhbgo+ID4gICAgIGxlYWQgdG8gdmlydHVhbCBtZW1vcnkgYWxsb2NhdGlvbiBm
YWlsdXJlcyB3aGVuIHRoZSBvdmVyY29tbWl0IG1vZGUKPiA+ICAgICBpcyBzZXQgdG8gT1ZFUkNP
TU1JVF9HVUVTUyBvciBPVkVSQ09NTUlUX05FVkVSOgo+ID4gICAgIEVycm9yOiAiX192bV9lbm91
Z2hfbWVtb3J5OiBub3QgZW5vdWdoIG1lbW9yeSBmb3IgdGhlIGFsbG9jYXRpb24iCj4gPgo+ID4g
U3VnZ2VzdGVkLWJ5OiBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0K
PiA+Cj4gPiBDaGFuZ2VkIGluIHY0Ogo+ID4gLSBGaXggd3Jvbmcgc3ViamVjdC4gSXQgaXMgNTEy
TUIgaW5zdGVhZCBvZiAyR0IKPiA+Cj4gPiBDaGFuZ2VkIGluIHYzOgo+ID4gLSBSZW1vdmUgbWF4
KCkuIFBBR0VfQUxJR04oKSBhbHJlYWR5IHJvdW5kcyB1cAo+ID4gLSBDaGFuZ2Ugc3RhY2sgc2l6
ZSB0byBSTElNSVRfU1RBQ0svOCB3aXRoIFNaXzUxMk0gY2FwLiBTdWdnZXN0ZWQgYnkgRGF2aWQg
TGFpZ2h0Cj4gPgo+ID4gQ2hhbmdlZCBpbiB2MjoKPiA+IC0gQWRkIG1heCgpIGluIGNhc2UgUkxJ
TUlUX1NUQUNLIGlzIHNtYWxsZXIgdGhhbiBQQUdFX1NJWkUuIFN1Z2dlc3RlZCBieQo+ID4gICAg
UGF1bCBXYWxtc2xleSBhbmQgU2FzaGlrbwo+ID4KPiA+IENoYW5nZWQgaW4gdjE6Cj4gPiAtIFVz
ZSBtaW4oKSBpbnN0ZWFkIG9mIG1pbl90KCkuIFN1Z2dlc3RlZCBieSBEYXZpZCBMYWlnaHQKPiA+
Cj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyB8IDYgKysrLS0tCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Vz
ZXJjZmkuYwo+ID4gaW5kZXggNmVhYTBkOTRmZGZlLi4yMDM2OTE4YTc3ZGIgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3VzZXJjZmkuYwo+ID4gQEAgLTEwOSwxNSArMTA5LDE1IEBAIHZvaWQgc2V0X2luZGlyX2xw
X2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGxvY2spCj4gPiAgICAgICB0YXNr
LT50aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZS51ZmNmaV9sb2NrZWQgPSBsb2NrOwo+ID4gICB9
Cj4gPiAgIC8qCj4gPiAtICogSWYgc2l6ZSBpcyAwLCB0aGVuIHRvIGJlIGNvbXBhdGlibGUgd2l0
aCByZWd1bGFyIHN0YWNrIHdlIHdhbnQgaXQgdG8gYmUgYXMgYmlnIGFzCj4gPiAtICogcmVndWxh
ciBzdGFjay4gRWxzZSBQQUdFX0FMSUdOIGl0IGFuZCByZXR1cm4gYmFjawo+ID4gKyAqIFRoZSBz
aGFkb3cgc3RhY2sgb25seSBzdG9yZXMgdGhlIHJldHVybiBhZGRyZXNzIGFuZCBub3QgYW55IHZh
cmlhYmxlcwo+ID4gKyAqIDUxMk0gc2hvdWxkIGJlIG1vcmUgdGhhbiBzdWZmaWNpZW50IGZvciBt
b3N0IGFwcGxpY2F0aW9ucy4KPiA+ICAgICovCj4gPiAgIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNh
bGNfc2hzdGtfc2l6ZSh1bnNpZ25lZCBsb25nIHNpemUpCj4gPiAgIHsKPiA+ICAgICAgIGlmIChz
aXplKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gUEFHRV9BTElHTihzaXplKTsKPiA+Cj4gPiAt
ICAgICByZXR1cm4gUEFHRV9BTElHTihtaW5fdCh1bnNpZ25lZCBsb25nIGxvbmcsIHJsaW1pdChS
TElNSVRfU1RBQ0spLCBTWl80RykpOwo+ID4gKyAgICAgcmV0dXJuIFBBR0VfQUxJR04obWluKHJs
aW1pdChSTElNSVRfU1RBQ0spIC8gOCwgU1pfNTEyTSkpOwo+ID4gICB9Cj4gPgo+ID4gICAvKgo+
Cj4gSnVzdCBGWUksIHlvdXIgVjIgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIHdhcyBtZXJnZWQgaW4g
TGludXggNy4xLXJjNCAoY29tbWl0IDZjNzY3NGI1YjdhZTUxM2NlY2FlMjJhYTlkY2RjZjUzMzg2
MmNmNWMpLiBZb3UgbmVlZCB0bwo+IHJlYmFzZSwgb3RoZXJ3aXNlIHRoaXMgcGF0Y2ggd29uJ3Qg
YXBwbHkuCgpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBQZXJoYXBzIGxldCdzIGRy
b3AgdGhpcyBzZXJpZXMgYW5kCnNlbmQgYSBuZXcgb25lIHRvIGV4cGxhaW4gd2h5IHdlIHdhbnQg
dG8gcmVkdWNlIHRoZSBzaXplIHRvIDUxMk1CCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
