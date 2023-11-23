Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35726C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yibWA+mUIpu85kbT2GCbHbkNWfT187Yb1yUrdCL/jU=; b=lzXbJnBD5zNpxP
	9rIHW9lsb3hk1otRruIxcHZ3OThZoXR0DLUCYYWeBfkyT1XRyr4x4CDSe0g27v03gD2tIgl3JEErF
	gjSdquCCJ7vxqyNjYxj+E95K4u10n6dBHH6wGZaL16ULNpdYGJBCXtEMY696AM3sQXoAblJqspdIy
	nay7hQLC4ziYUUb40K5Ji+TxyrdkAr5qvLZGu1V/w14vTvUPyEjqdJGX2iL4cRTlmg7rINzyAbUAm
	VRV5XZnosYwmZBOPd/2m9UBKaLRT1rgD1nTg+sUzCE1WUMgiuZyNQSZ7oIr9Nn02pBqhdJ+yuyvgS
	m1GBuCOA9UIK9N6/BTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67Es-004QFt-1B;
	Thu, 23 Nov 2023 10:47:18 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67Ep-004QFP-1O
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 10:47:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5ab94fc098cso466384a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 02:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700736434; x=1701341234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pMzVl5pf9UJJ+Fo0I8VraoGZ78XJdMnoApdVbnPwyI=;
        b=DzeMbHJM4HmCpKpkcvKsOFYDlXUNRdywKwVWzid8FORD1KTvGy5Xhy2PRYioaqGZUZ
         mzgO4oHpB/JI3SzWFILdSNaTTwKzfC/vvMA7CKGxrf4K87nWR1PKnvgaRL6tADfIJJzL
         rXM2ejmWw72eqqwQv+ksMrFZkzwocTVNnCS3Hpb66TCdDbkwvO6jXhtcxaaaXCXUnkJg
         ySAQ6xOHlcQFXjv8P0/wteJKAR5v/qjA+VJzN3sLRJJ4P7ARSU3HcljD2hsNiKycUyuc
         y3P+qnI/BffzMNbn0FP58Q0+H12SPJPsfsnkgQSkwdZN0ZOgfaEXdmb5xsuKTMIcV4Gs
         GSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736434; x=1701341234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pMzVl5pf9UJJ+Fo0I8VraoGZ78XJdMnoApdVbnPwyI=;
        b=h5dVoE7d/p3eiOBJMlRzh+LR6QeV1sb35NJy88hGa+W5whRUN20RKtf0RYt6Juf2eZ
         4SYziDcw+9tZDLEPuQPtRKW/gKOJQOskILVpGP/XFomr7EOASPJv2cPeGcIy2m5SwRK1
         lgz89J3bt+bMD811o2Qz3cBhzK8xc/n2RWne50seKzhddHdOifIkYPTmIdN6kMoO0cBM
         GaAhZGcaBLSCMITamy4PEPleOCh88vjZmt7k1ic0S2hSY1L+P+ODxGxbFGTtgxqZGEXM
         sesKJHx/Vgp1/TJvgrsn+qvxlkPWx9EzPy6uF5wvnPqE+Isia2+eP3GVK9rEFSCp1att
         6Dbg==
X-Gm-Message-State: AOJu0Yy9WqmxVDZCHRy9dCNM36AT1iDfj71W5T0e09ZQI/REg8XpOUec
	Y0SeZzXp/d9yTRY736WImbsyJwu005K1CVwS/MLRUQ==
X-Google-Smtp-Source: AGHT+IENrREiF3sbwAjZt4xq30LW7CVvB2qLXvby7KV+9pgnoiYgGJgV8HcyQnZIfEDxokjnV5oOnnGUF3CBvrBWEKk=
X-Received: by 2002:a17:90a:187:b0:27d:3fa4:9d9a with SMTP id
 7-20020a17090a018700b0027d3fa49d9amr5082578pjc.29.1700736434399; Thu, 23 Nov
 2023 02:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com> <20231120-639982716fbfd33a6fc144d6@orel>
In-Reply-To: <20231120-639982716fbfd33a6fc144d6@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:17:02 +0530
Message-ID: <CAK9=C2X-cOxjJ-fBLrcvWvP+K8fD=PGucmrWN+m1ZK3j7ae_zg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_024715_475077_BD672E9F 
X-CRM114-Status: GOOD (  22.87  )
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

T24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgMTozNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3YgMTgsIDIwMjMgYXQgMDk6MDg6
NTZBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IExldCB1cyBwcm92aWRlIFNCSSBkZWJ1
ZyBjb25zb2xlIGhlbHBlciByb3V0aW5lcyB3aGljaCBjYW4gYmUKPiA+IHNoYXJlZCBieSBzZXJp
YWwvZWFybHljb24tcmlzY3Ytc2JpLmMgYW5kIGh2Yy9odmNfcmlzY3Zfc2JpLmMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgIDUgKysrKysKPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYyAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCj4gPiBpbmRleCA2NmYzOTMzYzE0ZjYuLmVlN2FlZjVmNjIzMyAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+IEBAIC0zMzQsNiArMzM0LDExIEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBzYmlfbWtfdmVyc2lvbih1bnNpZ25lZCBsb25nIG1ham9yLAo+
ID4gIH0KPiA+Cj4gPiAgaW50IHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKGludCBlcnIpOwo+ID4g
Kwo+ID4gK2V4dGVybiBib29sIHNiaV9kZWJ1Z19jb25zb2xlX2F2YWlsYWJsZTsKPiA+ICtpbnQg
c2JpX2RlYnVnX2NvbnNvbGVfd3JpdGUodW5zaWduZWQgaW50IG51bV9ieXRlcywgcGh5c19hZGRy
X3QgYmFzZV9hZGRyKTsKPiA+ICtpbnQgc2JpX2RlYnVnX2NvbnNvbGVfcmVhZCh1bnNpZ25lZCBp
bnQgbnVtX2J5dGVzLCBwaHlzX2FkZHJfdCBiYXNlX2FkZHIpOwo+ID4gKwo+ID4gICNlbHNlIC8q
IENPTkZJR19SSVNDVl9TQkkgKi8KPiA+ICBzdGF0aWMgaW5saW5lIGludCBzYmlfcmVtb3RlX2Zl
bmNlX2koY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrKSB7IHJldHVybiAtMTsgfQo+ID4g
IHN0YXRpYyBpbmxpbmUgdm9pZCBzYmlfaW5pdCh2b2lkKSB7fQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiA+IGluZGV4
IDVhNjJlZDFkYTQ1My4uNzNhOWMyMmMzOTQ1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gPiBAQCAtNTcx
LDYgKzU3MSw0NCBAQCBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQpCj4gPiAgfQo+ID4gIEVYUE9S
VF9TWU1CT0xfR1BMKHNiaV9nZXRfbWltcGlkKTsKPiA+Cj4gPiArYm9vbCBzYmlfZGVidWdfY29u
c29sZV9hdmFpbGFibGU7Cj4gPiArCj4gPiAraW50IHNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlKHVu
c2lnbmVkIGludCBudW1fYnl0ZXMsIHBoeXNfYWRkcl90IGJhc2VfYWRkcikKPiA+ICt7Cj4gPiAr
ICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPiA+ICsKPiA+ICsgICAgIGlmICghc2JpX2RlYnVnX2Nv
bnNvbGVfYXZhaWxhYmxlKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4g
PiArCj4gPiArICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ID4gKyAgICAgICAg
ICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9X
UklURSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG51bV9ieXRlcywgbG93ZXJf
MzJfYml0cyhiYXNlX2FkZHIpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBw
ZXJfMzJfYml0cyhiYXNlX2FkZHIpLCAwLCAwLCAwKTsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAg
ICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNP
TEVfV1JJVEUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBudW1fYnl0ZXMsIGJh
c2VfYWRkciwgMCwgMCwgMCwgMCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmV0LmVycm9yID8g
c2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKSA6IHJldC52YWx1ZTsKPgo+IFdlIGNh
bid0IGdldCBwZXJmZWN0IG1hcHBpbmdzLCBidXQgSSB3b25kZXIgaWYgd2UgY2FuIGRvIGJldHRl
ciB0aGFuCj4gcmV0dXJuaW5nIEVOT1RTVVBQIGZvciAiRmFpbGVkIHRvIHdyaXRlIHRoZSBieXRl
IGR1ZSB0byBJL08gZXJyb3JzLiIKPgo+IEhvdyBhYm91dAo+Cj4gIGlmIChyZXQuZXJyb3IgPT0g
U0JJX0VSUl9GQUlMVVJFKQo+ICAgICAgcmV0dXJuIC1FSU87Cj4KPiAgcmV0dXJuIHJldC5lcnJv
ciA/IHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcikgOiByZXQudmFsdWU7CgpTZWVt
cyBvdmVya2lsbCBidXQgSSB3aWxsIHVwZGF0ZSBhbnl3YXkuCgo+Cj4KPiA+ICt9Cj4gPiArCj4g
PiAraW50IHNiaV9kZWJ1Z19jb25zb2xlX3JlYWQodW5zaWduZWQgaW50IG51bV9ieXRlcywgcGh5
c19hZGRyX3QgYmFzZV9hZGRyKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+
ID4gKwo+ID4gKyAgICAgaWYgKCFzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICsKPiA+ICsgICAgIGlmIChJU19FTkFC
TEVEKENPTkZJR18zMkJJVCkpCj4gPiArICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklf
RVhUX0RCQ04sIFNCSV9FWFRfREJDTl9DT05TT0xFX1JFQUQsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBudW1fYnl0ZXMsIGxvd2VyXzMyX2JpdHMoYmFzZV9hZGRyKSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVwcGVyXzMyX2JpdHMoYmFzZV9hZGRyKSwgMCwg
MCwgMCk7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChT
QklfRVhUX0RCQ04sIFNCSV9FWFRfREJDTl9DT05TT0xFX1JFQUQsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBudW1fYnl0ZXMsIGJhc2VfYWRkciwgMCwgMCwgMCwgMCk7Cj4gPiAr
Cj4gPiArICAgICByZXR1cm4gcmV0LmVycm9yID8gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0
LmVycm9yKSA6IHJldC52YWx1ZTsKPgo+IFNhbWUgY29tbWVudCBhcyBhYm92ZS4KCk9rYXkuCgo+
Cj4gPiArfQo+ID4gKwo+ID4gIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCj4gPiAgewo+ID4g
ICAgICAgaW50IHJldDsKPiA+IEBAIC02MTIsNiArNjUwLDExIEBAIHZvaWQgX19pbml0IHNiaV9p
bml0KHZvaWQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgc2JpX3Nyc3RfcmVib290X25iLnBy
aW9yaXR5ID0gMTkyOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3Jlc3RhcnRf
aGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25iKTsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gKyAg
ICAgICAgICAgICBpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkp
ICYmCj4gPiArICAgICAgICAgICAgICAgICAoc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RC
Q04pID4gMCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl9pbmZvKCJTQkkgREJDTiBl
eHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNiaV9kZWJ1
Z19jb25zb2xlX2F2YWlsYWJsZSA9IHRydWU7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICAgICAg
IH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgIF9fc2JpX3NldF90aW1lciA9IF9fc2JpX3NldF90
aW1lcl92MDE7Cj4gPiAgICAgICAgICAgICAgIF9fc2JpX3NlbmRfaXBpICA9IF9fc2JpX3NlbmRf
aXBpX3YwMTsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBPdGhlcndpc2UsCj4KPiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPgo+IFRoYW5rcywK
PiBkcmV3CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
