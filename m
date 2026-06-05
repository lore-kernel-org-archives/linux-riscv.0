Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E32CD6E75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 03:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5NJRsLM0a0BswKMStQPbBc66hRqADXZdowgfcwHYoU=; b=PHFu1B3Whij379
	UMLg1DoP0pqwUSjrKUqxKhYlUx3M2ZGLZv9kg868YMo3vr0vzjaSvE6c7v4SgFsqhIT9XDFt+HvPa
	HM3p8PlexT5kZFkERnsL9srmKfkLu/Sg0tYSkQKdpOO3pYv80Mo8/+g7VLbWOV12I0GYOsheKK3Xc
	NkVwdPAQikbiavGPIm+UMuVafAJdWqCo0BEfzG5zWrzpqNuxipAw9n9dKYmeM4UzYDstmNchYRUaP
	2zpDMjUqg2hkV1WaY8iNJIbFshwfiAtJlc3xLPNkBUqMBt/ayfO9nTccKvE6D2VGaqwoVgltnyCbk
	a3EWQATNlGRu+WpfuKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVL2d-000000000wB-1I9N;
	Fri, 05 Jun 2026 03:16:15 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVL2a-000000000vf-2HQI
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 03:16:14 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7dd7818ac2aso19048597b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 20:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780629371; cv=none;
        d=google.com; s=arc-20240605;
        b=d1Uc4/W75XBeiUnkIpOI62pqtmlRElV0VF7u2g+ePbcphmOMVeb+1V0Jbho9R7drHX
         0xLNYTZukH+kyJkpRf39NQ5aYVqxi7ow06ay3Ag8FyMJSOdn/G02BTmSLb8yEumvMgSr
         m2JEgifkUu1aVuDgjdpeae6D+S2wAHUPwteJtYwQcFuWuotUd7jWBKBDDQmvuQi7l7WO
         xcpVPuCO9moaqxSwuB1d0ki4MRAmIia39NnrBFbKR8a1ruPDLF1zFnSxDEXBazt5OCw4
         +VLZNCd2c40yz1qQUetq1Zk4RrW0vUwfxgVXkrYuAsIuAlsAhDUWrWS1g93Ez2suycVw
         kDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        fh=bm/PD9l72cHo0XWIOouCsuVe4Wbxl4mS95VuZzINLcs=;
        b=CRr0PwMOFlc1yZsyYpA2+qPX/eJmvb9PlJHd0ibUkIHfYHlQ//01iLOAjQDkAP9Pz0
         qv5IwfRS+fCokXtiV7c3z6CoONckYeYdRwXOdIkiDTE+loULLWmRMrjmfZ75p2fywVCL
         kAuCufb8lfoW4SIQXYuKdl0M1DTk9rwYzNTHp1ZyPcn7LHC4un0nH4rpmcdwXWqCNJgx
         OgdjzurHmp6q/GGOdFG5/jyGFSAfgU4i8jxVo/0iI49tHhIeijhK2BSqvw2ZkbnOriWE
         riw7/YV3HkkxDO2qwYk/77rQC4aCWH6l3LPilnTlyE96WVmvFFAA0W6kcGUnyc+LScPG
         VWCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780629371; x=1781234171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        b=QvDzWwD3MTAODOFZIDzVDRzNHE0BoZV4cZ0oOlCEQUUmD4QKpiiaPxtHTi4jLoH0BZ
         U+ons7YqwAlQP/V7CbFhIsLYaUUCc5Rt4VeUv0ReHLHZXDBvZKhAVgdB3Ib4+b54gAvY
         sVwBCex91O5naHCzJy9hCgIC0x2jQ3DkxdAhag7tjK9vxCduut8/wHRJCNSvePC8LcgG
         4cT0m9VfiOzW8mKo4xqJBTpEoQBK1mHxfS0oYzMzofUGgCLkCsj+/saSk6LcPK2WHlpK
         Rze1V738PLhB3UUSjfcBcm25Vy5mCHEGVmbBTqzAPoVIuzaDIkRktiZgHS+g/LeWd8hp
         qYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780629371; x=1781234171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYRAaYwduwwMFPEJSpIv6yQaYPElDxs+NUQslYWVbos=;
        b=AhgDccsGhhXjlh3A7KeswPIe1NMUrt+d4mFL450So6M2trKLiYVGYovANYollMEWbe
         LjFAyPayHWwD1C7NG6ezgOgEmK+essJZqEYOLLQYMXVgwOxVajOWDaQTN9uEoRtcNqvV
         vLQgguzEpr7br0vIKZD7gIpdIK1PvEPNSwHOS3W7UiiAJzy0PN/w/a6NiblnE0bHO9gS
         CGsb3dYjQ3NQBg897q+NOjac/F/COCKeULrd70fNoZHwqkQI7y8B+xUVs4Xzxp6gnVxW
         ZdoUmntfob4BNJh9DZkR56qF0RYGOzBXPGGo/dPI7ZdELovnjXnOsMGryD+i9JQvQsNY
         DJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gfPPWCaUABDtgCbKlR65ewMhcOPv2BO23ukktpoP01XhGJQkeXWyZK4GPKe+DRmSpc4wybqlXsPQdrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzczFPRFrEYZ33QxbBKgw8NA4pIRk/2Vs24766y5OXLOCJzcL1O
	aMuI+mMRjMFYxB3Kc8i6XQNRJudrcGhbz28pNWQ47VBQoLogJ4tDFLId56+1Cu9IkG1WgnlNwZz
	BFU+DDft89NEjGebDYNjkiLzbHgWHH0kB+dln7wEHUU/ylblzG+5hACs=
X-Gm-Gg: Acq92OG/fuE3cv5kiIWxrleMm8VqoctHUDLA7uTSCsbvAVwTcU3o8XY9eK8QgOA7bGo
	ajWYJ00ngng1g1bf1uIhTN6jo0oBOewdZUVzj/A5NdJgn7nPOllp7Cu2yfJBOjX0DwV/StwYjgx
	crhbm1gL4+B1MJZdJUxPytRfkp+3f38UGmIg+Ma/Rbth90kI4/Na9MHftV2TDsqNRztt3QKceIe
	ojWNuAs0ykZQoAtecuk/nnwqjMJFCAPCuP2k5WczW6d8mEK7unICUPaTIhsyow9gteoaS+0WP+G
	h1DL9o5e7nF02IcvkLSaiopyhGpri8t3YPhumsFRUD1WHCFx9sdz2PsJqBqU1EQza2peMARUMG1
	68DPnKvg=
X-Received: by 2002:a05:690c:600a:b0:7c0:4f0:7bc1 with SMTP id
 00721157ae682-7ed0f825e7emr16245817b3.31.1780629371403; Thu, 04 Jun 2026
 20:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260604143957.668047-1-joel@jms.id.au> <20260604143957.668047-8-joel@jms.id.au>
In-Reply-To: <20260604143957.668047-8-joel@jms.id.au>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 4 Jun 2026 22:15:59 -0500
X-Gm-Features: AVVi8Cdt4ovc7avZtDiQZF3NkqfzmPFNT9hCzsKPZLJGyudq_YtX5OFBV7Nin_I
Message-ID: <CAEev2e-OuutFYQUo2mtzvM5z_brneR+qn_WrPbp5_DeNq-7Fmg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_201612_589254_F638039A 
X-CRM114-Status: GOOD (  12.50  )
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

T24gVGh1LCBKdW4gNCwgMjAyNiBhdCA5OjQx4oCvQU0gSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4gd3JvdGU6Cj4KPiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgVGVuc3RvcnJlbnQg
QXRsYW50aXMgcGxhdGZvcm0sIGJhc2VkIG9uIHRoZQo+IEF0bGFudGlzIFNvQyBmZWF0dXJpbmcg
OHggUlZBMjMtY29tcGxpYW50IFRlbnN0b3JyZW50IEFzY2Fsb24tWEcgY29yZXMuCj4KPiBUaGUg
ZXZiIG1hY2hpbmUgcmVwcmVzZW50cyBhbiBpbnRlcm5hbCBicmluZ3VwIHZlaGljbGUgd2l0aCBq
dXN0IHRoZQo+IGludGVycnVwdCBjb250cm9sbGVycyBhbmQgYSBVQVJULiBUaGlzIHdpbGwgYmUg
cmVwbGFjZWQgaW4gdGltZSB3aXRoIGEKPiBmdWxsIGZlYXR1cmVkIG1hY2hpbmUgb25jZSBkZXRh
aWxzIGFyZSBhdmFpbGFibGUuCj4KPiBDby1kZXZlbG9wZWQtYnk6IERyZXcgRnVzdGluaSA8ZnVz
dGluaUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
Cj4gLS0tCj4gdjI6Cj4gIC0gVXBkYXRlIG10aW1lciBjb21wYXRpYmxlCj4gIC0gQWRkIERyZXcn
cyBjby1kZXZlbG9wZWQtYnkKPiAgLSBDb3JyZWN0IGFwbGljIG51bS1zb3VyY2VzIGNvdW50Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvTWFrZWZpbGUgICAgICB8ICAg
MSArCj4gIC4uLi9ib290L2R0cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1ldmIuZHRzICAgICB8ICAz
MyArKwo+ICAuLi4vYm9vdC9kdHMvdGVuc3RvcnJlbnQvYXRsYW50aXMtc29jLmR0c2kgICAgfCA0
NzEgKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTA1IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQv
YXRsYW50aXMtZXZiLmR0cwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0
cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1zb2MuZHRzaQoKPiArCj4gKyAgICAgICAgICAgICAgIHBy
Y21fcmNwdTogY2xvY2stY29udHJvbGxlckBkMDAwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJ0ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLXJjcHUiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwIDB4ZDAwMDAwMDAgMHgwMCAweDEwMDAw
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zY18yNG0+Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNz
aWduZWQtY2xvY2tzID0gPCZwcmNtX3JjcHUgQ0xLX1JDUFVfUk9PVD4sIDwmcHJjbV9yY3B1IENM
S19OT0NDX0NMSz47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2stcGFy
ZW50cyA9IDwmcHJjbV9yY3B1IENMS19SQ1BVX1JPT1Q+LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnByY21fcmNwdSBDTEtfTk9DX1BMTD47CgpU
aGlzIHNob3VsZCBiZQphc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZwcmNtX3JjcHUgQ0xLX1JD
UFVfUExMPiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnByY21fcmNwdSBDTEtf
Tk9DX1BMTD47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
