Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C8C83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch3URT2pEchuX5wUnXJaNR3ktL3nmU2TAalrYzUPl/g=; b=JtxCvTo8gjxx9y
	HHuFWyGSHSw4Qbx14pGMQsIvhckFSSrlllZypEBHLHQafCIoJIdIolOTkJrOx2k3ouxaDgT+g510l
	1fDn6wyJ6Jd1PErzDleZgcEed7eiZR81W9OIxAIK9IdgwHYv2OLXhBTGIiDJ9zvjw/sL3IneAfRBx
	xm77/hSyFN/vzRpZkDoqiXG8QgzrNBjZwPviSzSjAtI51pU10nieQfBDgkrOm5IqLrRjWRNjWVltX
	fVpiNyL06CePRTs5NGx68CvJ2RafQLW3V+vsA4dnciNxWYZ/ZCL35fNFWcB0l8Ec7jDlcwc41lgVS
	0X9JNA8YNcj4bNfHVDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubghJ-00000005Nne-1vaN;
	Tue, 15 Jul 2025 14:31:57 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfTm-00000005AiW-3YOy
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 13:13:55 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87f161d449dso4668961241.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752585233; x=1753190033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbDFWRsHAHLpHMVNyiplmEgMwEk7G0M5DlSwpSbUTcA=;
        b=BX/ybmeqDX10mt867aFoPvufq7KemSqLUdrdrHO7iHdmbWSSn9FNnw2uhwmsD/hZip
         oD8n8YGjfmnSg2IJ17Z9b8zUkUWbcrciLsE/KjJdmD7AnJXrXEiIM0PXdFVsqEhy27OP
         gHKLBtVRjFRELt4+4BNg+QiE5JL+Kcav9ywS12hiWY7yctHckeiiOrAggG1zmb7q2ws6
         +fXYz6vwZFnDOsCR+swWhoUGkz363AOBgMMoAnSIWxuPO0iiB9I+xlTDZeVWZYH/gP3/
         3eIH1Au+DapjjIU7AllrWCHfWvg39piLmr3hrrOPGvXCJLJ7f42aRPtYfkGGnQKtoakY
         WySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585233; x=1753190033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbDFWRsHAHLpHMVNyiplmEgMwEk7G0M5DlSwpSbUTcA=;
        b=vKSuP1hkhnulxlDkQ+T8arRQeUyRlkFXUiEHZpnflShvi0jSJ52oQfhgqbruMndU75
         AUrgn1YHPeJYir3DXigaG9suki2g9+QOnSYKjnTnmnJD63Opgm3b/Te95VpSpMXuNtOb
         j63DSy9UNCnrGGmvEoJsV0UUai2mrUeqxvGyNLTutL+3p/bqWGuZYDN6WHORFF7W/21x
         tBV1PBAATiIf61HErT+WEluGUfw+NjlB78P8ynWIGQIlUUTDNT74n0IyDUxiQCMDOq2V
         Q7IP/VWUS7DNs/bipPca7MucQhST/ETqX3oni33RkUzMXvji7oEv9aVLINd1buK8TIc2
         RteQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGUef84WWAKnDxpJhRK9WX4Mtx9j//FGoJdpnqygKev1NPS7a6bYYy+HATRuTj6/kU/o4Ejhy2HuDCkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLdKnNDTDBl6eo83cjb86qfr5Kgy8EMRnxBNUfwHUP4zc+gYB
	znP4sT45rGNaA6Y+GymzgMNJHFqvHXVml2Aa8IO1hDytkeBhBzgS11c+G0LDosGglXnnKR7m6lN
	N9YgpNJjNrVU1SVqoW7HGLsqUVEqGlEs=
X-Gm-Gg: ASbGncsgSSs+BkwLqATLVEvBKTx6ct6MsaZKukcmc7upDqpBoXe6Te8YOPsYyR93EK0
	OrYxMtI/2+fna9d7bEXdrP2AUzwP9h0Lyfq7LrJKlL1HCvqTc5nyDDu1dejJmKE1D6vWRYIkdf5
	vSs0jG7hQB/f1Kf8yIBUqo28Mi+qVLME2c9tpMgiiRQ2tR4MZj+sdyVRA68A4Z58+vS6UQVvjnD
	gBwYjzoJg==
X-Google-Smtp-Source: AGHT+IEjTGVkyeENXrb3wsoZFCXRR7teVOs9ZG3LcJDfn/6S/DX1Z0jfg4DlgDBX2ZfGx65zefSZBcoJ4xzp7NrMpE0=
X-Received: by 2002:a05:6102:38cb:b0:4e6:d7af:a7b1 with SMTP id
 ada2fe7eead31-4f642442816mr9416285137.10.1752585232734; Tue, 15 Jul 2025
 06:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250713155321.2064856-1-guoren@kernel.org> <20250713155321.2064856-2-guoren@kernel.org>
In-Reply-To: <20250713155321.2064856-2-guoren@kernel.org>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 15 Jul 2025 21:13:41 +0800
X-Gm-Features: Ac12FXxIe08JtqP4Zd45XgTPp7kGcElpp7m8ymIKWqMzCjAKN6I-WoJy-eT90kw
Message-ID: <CAAT7Ki_sa4OPkC9EPWaeDW1LryR0wfk363dDM6uexOJSbTNsLw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Move vendor errata definitions to new header
To: guoren@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, alexghiti@rivosinc.com, 
	paul.walmsley@sifive.com, bjorn@rivosinc.com, eobras@redhat.com, 
	corbet@lwn.net, peterlin@andestech.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_061354_886876_BA041B66 
X-CRM114-Status: GOOD (  13.67  )
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

T24gU3VuLCBKdWwgMTMsIDIwMjUgYXQgMTE6NTPigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gRnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBr
ZXJuZWwub3JnPgo+Cj4gTW92ZSB2ZW5kb3IgZXJyYXRhIGRlZmluaXRpb25zIGludG8gZXJyYXRh
X2xpc3RfdmVuZG9ycy5oLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiAoQWxpYmFiYSBEQU1P
IEFjYWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9lcnJhdGFfbGlzdC5oICAgICAgICAgfCAxOSArLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oIHwgMjQgKysrKysrKysrKysr
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlv
bnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRh
X2xpc3RfdmVuZG9ycy5oCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
cnJhdGFfbGlzdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gaW5k
ZXggNmU0MjZlZDc5MTlhLi4xOGM5ZjdlZTliN2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
cnJhdGFfbGlzdC5oCj4gQEAgLTEwLDI0ICsxMCw3IEBACj4gICNpbmNsdWRlIDxhc20vaW5zbi1k
ZWYuaD4KPiAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcmlk
X2xpc3QuaD4KPiAtCj4gLSNpZmRlZiBDT05GSUdfRVJSQVRBX0FOREVTCj4gLSNkZWZpbmUgRVJS
QVRBX0FOREVTX05PX0lPQ1AgMAo+IC0jZGVmaW5lIEVSUkFUQV9BTkRFU19OVU1CRVIgMQo+IC0j
ZW5kaWYKPiAtCj4gLSNpZmRlZiBDT05GSUdfRVJSQVRBX1NJRklWRQo+IC0jZGVmaW5lICAgICAg
ICBFUlJBVEFfU0lGSVZFX0NJUF80NTMgMAo+IC0jZGVmaW5lICAgICAgICBFUlJBVEFfU0lGSVZF
X0NJUF8xMjAwIDEKPiAtI2RlZmluZSAgICAgICAgRVJSQVRBX1NJRklWRV9OVU1CRVIgMgo+IC0j
ZW5kaWYKPiAtCj4gLSNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFECj4gLSNkZWZpbmUgICAgICAg
IEVSUkFUQV9USEVBRF9NQUUgMAo+IC0jZGVmaW5lICAgICAgICBFUlJBVEFfVEhFQURfUE1VIDEK
PiAtI2RlZmluZSAgICAgICAgRVJSQVRBX1RIRUFEX0dIT1NUV1JJVEUgMgo+IC0jZGVmaW5lICAg
ICAgICBFUlJBVEFfVEhFQURfTlVNQkVSIDMKPiAtI2VuZGlmCj4gKyNpbmNsdWRlIDxhc20vZXJy
YXRhX2xpc3RfdmVuZG9ycy5oPgo+Cj4gICNpZmRlZiBfX0FTU0VNQkxZX18KPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0X3ZlbmRvcnMuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmEzN2QxNTU4ZjM5Zgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0X3ZlbmRvcnMuaAo+IEBA
IC0wLDAgKzEsMjQgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLwo+ICsKPiArI2lmbmRlZiBBU01fRVJSQVRBX0xJU1RfVkVORE9SU19ICj4gKyNkZWZpbmUg
QVNNX0VSUkFUQV9MSVNUX1ZFTkRPUlNfSAo+ICsKPiArI2lmZGVmIENPTkZJR19FUlJBVEFfQU5E
RVMKPiArI2RlZmluZSBFUlJBVEFfQU5ERVNfTk9fSU9DUCAwCj4gKyNkZWZpbmUgRVJSQVRBX0FO
REVTX05VTUJFUiAxCj4gKyNlbmRpZgo+ICsKPiArI2lmZGVmIENPTkZJR19FUlJBVEFfU0lGSVZF
Cj4gKyNkZWZpbmUgICAgICAgIEVSUkFUQV9TSUZJVkVfQ0lQXzQ1MyAwCj4gKyNkZWZpbmUgICAg
ICAgIEVSUkFUQV9TSUZJVkVfQ0lQXzEyMDAgMQo+ICsjZGVmaW5lICAgICAgICBFUlJBVEFfU0lG
SVZFX05VTUJFUiAyCj4gKyNlbmRpZgo+ICsKPiArI2lmZGVmIENPTkZJR19FUlJBVEFfVEhFQUQK
PiArI2RlZmluZSAgICAgICAgRVJSQVRBX1RIRUFEX01BRSAwCj4gKyNkZWZpbmUgICAgICAgIEVS
UkFUQV9USEVBRF9QTVUgMQo+ICsjZGVmaW5lICAgICAgICBFUlJBVEFfVEhFQURfR0hPU1RXUklU
RSAyCj4gKyNkZWZpbmUgICAgICAgIEVSUkFUQV9USEVBRF9OVU1CRVIgMwo+ICsjZW5kaWYKPiAr
Cj4gKyNlbmRpZgo+IC0tCj4gMi40MC4xCj4KClRlc3RlZC1ieTogSGFuIEdhbyA8cmFiZW5kYS5j
bkBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
