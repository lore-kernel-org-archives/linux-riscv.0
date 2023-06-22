Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1837EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roLp/EXaEWOEbBYBY/p5xqqslqUEm9W03HB+RwNEEX0=; b=4ypoVTd+qVDnkt
	R4QP6aIB3RYPpMdOxenSJSpaXhSU8x5JtGmmPXTZyPRc6eaxHVtCyfXy+bzGCU0m++Ii2AwlP7Myy
	LxEA6gl6f7rMr8iLbgTfTlQh6/H0I23VB/LgBxbk4KpwBznHE201JGGq/EZkOj5cYtx0lwjVA9evV
	yNDS2dt6SFzRBih+E+sbbTj6UGVxOd622neDwBi/ScQiV22o6+RaF9BuR+u66CJQDtr4LafRu0jvI
	PYBZaicIJFeBGRDdTUJ19Bye241OG7OFXA9u0Pp03C85j+1Nh/+bFHIrCyRXUa7CmNblkO/tPYX+4
	tJ38y5WhBBiQdeLIo+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOXK-001OOm-0O;
	Thu, 22 Jun 2023 17:56:02 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOXG-001ONv-2G
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:56:00 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-62de5392c7bso51826706d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20221208.gappssmtp.com; s=20221208; t=1687456556; x=1690048556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evqKVHDxZVe269Q8IjFyi7APZlufQLmWyv9A9ica0X0=;
        b=4FnsJO8nFBUrK7Bi46lBU9t37xrGt2OAxxu0++Hyfk+a025ya7U9gKSnKhX5lH0qWU
         J3+IsooPyIVKfAnLcPuCFhjfYsXxphQ5qCEz6c0PbH//F7aX1pwBkI5rJf5CXF/OgYIO
         Y6we+BTlve3wn1ZygGn0PQtV3sLxgumTZT330G7Q3+EvLj7AtvJ39lGqylem8o7Yodnr
         cwVxvo3d5Rt0TbcOJSh4LnsXkRrhaCQtlzQzTxAq4CIexiFHYu4gXmrOYEE5oQjEYMZR
         sYcW3qq0/rCfgHvy4D7DfHd766z5s7sfMWKUXR7BJNcFKuWbbPo6gz4XVDQFq3RunPON
         uafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456556; x=1690048556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evqKVHDxZVe269Q8IjFyi7APZlufQLmWyv9A9ica0X0=;
        b=WOm1CEqgLr5U/xH8HeS4KUElQdF5Zo6Gz6gYa98X5fC+GQIW+omVtHJvMlxJg++0zp
         e5jkcLzbH8OiCkN4cGU2nzcdMbicP4EEfQNdhAppNYTOtcqhf1T+DQ5Aw3VUR8ZtpmkA
         Ae/rmByaWHiCgoCI+3tfCc1gxOf7IA28cjcRfPGzaI1ZYRwmxGRqaXlW+9DRpHEM5Bxz
         rIA5HxLo/XRKS9EZOdoufRLTZ4bRNbHeaO+E1bjDEVkpoKxQ/oJVgLuzZRodniexqmaM
         hy3/osinlagQKbWT3qkpfpEHRiwt2M07Fwcnvj64+/AgfIiFJJbweosAdwMwI/ccXq1r
         9lWw==
X-Gm-Message-State: AC+VfDyW8l5Eopq1iMxP0xto9jNjGX5cfTSwqNsh5ijOsQfZI5LzF8B3
	d9E13juDbExyQvXEP0VA8e8H
X-Google-Smtp-Source: ACHHUZ672wytMhHXqClrZpIjlI3Xprxy1741urngUGKi8XGsFRiYqE81j5g8t+8LEy52M3W78Cy5/g==
X-Received: by 2002:ad4:5966:0:b0:629:58a7:9a98 with SMTP id eq6-20020ad45966000000b0062958a79a98mr21498437qvb.53.1687456556289;
        Thu, 22 Jun 2023 10:55:56 -0700 (PDT)
Received: from bruce.bluespec.com ([102.129.235.90])
        by smtp.gmail.com with ESMTPSA id e4-20020a0cb444000000b00630007aa8d6sm4068379qvf.34.2023.06.22.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:55:55 -0700 (PDT)
Date: Thu, 22 Jun 2023 13:55:54 -0400
From: Darius Rad <darius@bluespec.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux@rivosinc.com, remi@remlab.net, andy.chiu@sifive.com
Subject: Re: [PATCH] riscv: Discard vector state on syscalls
Message-ID: <ZJSLKrB/4xaYB75d@bruce.bluespec.com>
Mail-Followup-To: Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux@rivosinc.com, remi@remlab.net,
	andy.chiu@sifive.com
References: <20230622173613.30722-1-bjorn@kernel.org>
 <mhng-5f8ae912-3b56-4eda-bdfa-1de31a7c93e0@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5f8ae912-3b56-4eda-bdfa-1de31a7c93e0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_105558_939468_490067D6 
X-CRM114-Status: GOOD (  34.31  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMTA6NDY6MzFBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gVGh1LCAyMiBKdW4gMjAyMyAxMDozNjoxMyBQRFQgKC0wNzAwKSwgYmpvcm5A
a2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KPiA+IAo+ID4gVGhlIFJJU0MtViB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4g
PiAgIEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNhdmVkIHZlY3Rv
ciByZWdpc3RlcnMKPiA+ICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRvIGJlY29t
ZSB1bnNwZWNpZmllZC4KPiA+IAo+ID4gVGhlIHZlY3RvciByZWdpc3RlcnMgYXJlIGNsZWFyZWQs
IHZpbGwgaXMgc2V0IChpbnZhbGlkKSwgYW5kIHRoZQo+ID4gdmVjdG9yIHN0YXR1cyBpcyBzZXQg
dG8gSW5pdGlhbC4KPiA+IAo+ID4gVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNlIGZy
b20gYWNjaWRlbnRhbGx5IHJlbHlpbmcgb24gdGhlCj4gPiBzdGF0ZWQgc2F2ZS4KPiA+IAo+ID4g
UsOpbWkgcG9pbnRlZCBvdXQgWzFdIHRoYXQgY2xlYXJpbmcgdGhlIHJlZ2lzdGVycyBtaWdodCBi
ZSBzdXBlcmZsdW91cywKPiA+IGFuZCBzZXR0aW5nIHZpbGwgaXMgc3VmZmljaWVudC4KPiA+IAo+
ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMTI3ODQzMjYuOVVQ
UEszTUFlQkBiYXNpbGUucmVtbGFiLm5ldC8gIyBbMV0KPiA+IFN1Z2dlc3RlZC1ieTogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFLDqW1pIERl
bmlzLUNvdXJtb250IDxyZW1pQHJlbWxhYi5uZXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gSSBmaWd1cmVkIEkn
ZCBzZW50IG91dCBhIHByb3BlciBwYXRjaC4gSSBsaWtlIEFuZHkncyBvcHRpbWl6YXRpb24KPiA+
IHBhdGNoLCBidXQgVEJIIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoYXQgYXMgYSBmb2xsb3cgdXAu
Cj4gPiAKPiA+IEFzIFLDqW1pIHBvaW50ZWQgb3V0LCB0aGUgY2xlYXJpbmcgbWlnaHQgYmUgb3B0
ZWQgb3V0LCBidXQgSSBsZWZ0IGl0IGluCj4gPiBoZXJlLgo+IAo+IEkgdGhpbmsgd2UncmUgZ29p
bmcgdG8gZW5kIHVwIHdpdGggYSBidW5jaCBvZiB1YXJjaC1zcGVjaWZpYyBzdHVmZiBoZXJlLCBi
dXQKPiBmb3Igbm93IGhhdmluZyB0aGUgaGVhdnkgaGFtbWVyIHNlZW1zIHNhZmVzdC4gIFRoZXJl
J3Mgbm8gViBoYXJkd2FyZSB5ZXQgc28KPiB3ZSBjYW4ndCByZWFsbHkgdGVsbCBob3cgYW55dGhp
bmcgcGVyZm9ybXMsIGF0IGxlYXN0IHRoaXMgd2F5IHdlJ3JlCj4gZGVmaW5hdGVseSBub3QgbGVh
a2luZyBhbnl0aGluZy4KPiAKPiBTbyBJJ20gT0sgd2l0aCB0aGlzLiAgSSdkIGFsc28gYmUgZmlu
ZSB3aXRoIGNsZWFyaW5nIHRvIGFsbC0xcywgSSB0aGluayBpdCdzCj4ga2luZCBvZiBzcGxpdHRp
bmcgaGFpcnMgYXQgdGhpcyBwb2ludDogdGhlIDFzIGFyZSBuaWNlIGJlY2F1c2UgdGhleSdyZSB3
aGF0Cj4gdGhlIHJlc3Qgb2YgViBkb2VzLCBidXQgc2V0dGluZyB2aWxsIHNob3VsZCBtYWtlIGV2
ZXJ5dGhpbmcgdHJhcCBhbnl3YXkgc28KPiBtYXliZSBpdCBkb2Vzbid0IG1hdHRlciAtLSBhbmQg
aXQncyBub3QgY2xlYXIgaWYgMSBvciAwIHdpbGwgYWxsb3cgaW5pdGlhbCwKPiBzbyB3aG8ga25v
d3MuCj4gCj4gRGFyaXVzOiBJJ20gY29vbCBzd2FwcGluZyBvdmVyIHRvIHRoZSAxcyBpZiB5b3Ug
ZmVlbCBzdHJvbmdseSBhYm91dCBpdC4KPiBCam9ybiBzYXlzIFN3ZWVkZW4gaXMgb24gdmFjYXRp
b24sIHNvIGp1c3QgTE1LIGFuZCBJJ2xsIHJlLXNwaW4gaXQgd2l0aCB0aGUKPiAxcy4KCkkgdGhp
bmsgYWxsIDFzIHdvdWxkIGJlIHByZWZlcnJlZCwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyBwYXJ0
aWN1bGFybHkKY3JpdGljYWwgKHNwbGl0dGluZyBoYWlycywgbGlrZSB5b3Ugc2FpZCksIHNvIEkn
bGwgbGV0IHlvdSBtYWtlIHRoZSBjYWxsLiAgCgo+IAo+IFJlZ2FyZGxlc3MgSSdkIGxpa2UgdG8g
cGljayB1cCBzb21ldGhpbmcgdGhhdCBibG93cyBhd2F5IFYgc3RhdGUgZm9yIHRoaXMKPiBtZXJn
ZSB3aW5kb3csIGFzIGl0J2xsIG1ha2Ugc3VyZSB0aGUgdUFCSSBpcyBxdWl0ZSBzdHJpY3RseSBl
bmZvcmNlZC4KPiAKPiA+IEJqw7Zybgo+ID4gCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3ZlY3Rvci5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgfCAgMiArKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+IGluZGV4
IDA0YzBiMDdiZjZjZC4uNjkyY2U1NWU0YTY5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZWN0b3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0
b3IuaAo+ID4gQEAgLTE2Myw2ICsxNjMsMzAgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNo
X3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnByZXYsCj4gPiAgdm9pZCByaXNjdl92X3Zz
dGF0ZV9jdHJsX2luaXQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spOwo+ID4gIGJvb2wgcmlzY3Zf
dl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7Cj4gPiAKPiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICt7
Cj4gPiArCXVuc2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2ludmFsID0gMVVMIDw8IChCSVRTX1BFUl9M
T05HIC0gMSk7Cj4gPiArCj4gPiArCWlmICghcmlzY3Zfdl92c3RhdGVfcXVlcnkocmVncykpCj4g
PiArCQlyZXR1cm47Cj4gPiArCj4gPiArCXJpc2N2X3ZfZW5hYmxlKCk7Cj4gPiArCWFzbSB2b2xh
dGlsZSAoCj4gPiArCQkiLm9wdGlvbiBwdXNoXG5cdCIKPiA+ICsJCSIub3B0aW9uIGFyY2gsICt2
XG5cdCIKPiA+ICsJCSJ2c2V0dmxpCSUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ID4gKwkJ
InZtdi52LmkJdjAsIDBcblx0Igo+ID4gKwkJInZtdi52LmkJdjgsIDBcblx0Igo+ID4gKwkJInZt
di52LmkJdjE2LCAwXG5cdCIKPiA+ICsJCSJ2bXYudi5pCXYyNCwgMFxuXHQiCj4gPiArCQkidnNl
dHZsCQklMCwgeDAsICUxXG5cdCIKPiA+ICsJCSIub3B0aW9uIHBvcFxuXHQiCj4gPiArCQk6ICI9
JnIiICh2bCkgOiAiciIgKHZ0eXBlX2ludmFsKSA6ICJtZW1vcnkiKTsKPiA+ICsJcmlzY3Zfdl9k
aXNhYmxlKCk7Cj4gPiArCj4gPiArCXJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwo+ID4gK30KPiA+
ICsKPiA+ICAjZWxzZSAvKiAhIENPTkZJR19SSVNDVl9JU0FfViAgKi8KPiA+IAo+ID4gIHN0cnVj
dCBwdF9yZWdzOwo+ID4gQEAgLTE3OCw2ICsyMDIsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcmlz
Y3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KPiA+
ICAjZGVmaW5lIF9fc3dpdGNoX3RvX3ZlY3RvcihfX3ByZXYsIF9fbmV4dCkJZG8ge30gd2hpbGUg
KDApCj4gPiAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgw
KQo+ID4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3aGlsZSAoMCkK
PiA+ICsjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncykJCWRvIHt9IHdoaWxlICgw
KQo+ID4gCj4gPiAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiA+IGluZGV4IDA1ZmZkY2QxNDI0ZS4uMDBjNjhiNTdmZjg4IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gQEAgLTI5NSw2ICsyOTUsOCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3Ry
YXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+
ICAJCXJlZ3MtPmVwYyArPSA0Owo+ID4gIAkJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+ID4g
Cj4gPiArCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+ID4gKwo+ID4gIAkJc3lzY2Fs
bCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4gPiAKPiA+
ICAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gPiAKPiA+IGJhc2UtY29tbWl0OiA0Njgx
ZGFjYWRlZWZhNWNhNjAxN2UwMDczNmFkYzFkN2RjOTYzYzZhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
