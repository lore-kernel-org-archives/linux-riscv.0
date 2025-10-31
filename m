Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3714CCFA02
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgxhnVwsGpjb9M4Nf9xBIVWxUMvgY9sv63qvWAzy6Uk=; b=aOhRYUPMhsCen5
	Em81ukxaH+FIgsv3XSvpmKiZgsKLWKGQr2XCQ2XBrl2sFwlFoRWMNlZEPkGZbuBZ5F5RrmeoA6qHd
	IGsEnI6KZmbar9OQwS+TYzAfpaOa1nmeTSkETNKhzmFd/J7d0cQf/51mYdk/i87ib/lgGNl3WerSx
	RB7uH9/ur+sWJBfphePh8FOMx3ateiaSBqpvWEeeQRkEMKvvNdpvknNI7/u7PzJMfYjZ1p+9DMN3a
	GzxXDEB0SidDyDhtZ1AZy9Yc+acB2U54wkWpzbCLcV3WnO9HLvRAfrNrNw5Idhn2WFkTxWvC9FPd9
	DePprsglr/LEvKYZgwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuUK-00000006frL-0ieP;
	Fri, 31 Oct 2025 19:08:40 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuUG-00000006fqy-3N62
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 19:08:38 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-430b6a0eaeaso24928185ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761937716; x=1762542516; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUiTd5oYFTdTZi4ZMjUtAbpcyMgZsOPHWTDrblXZvK0=;
        b=hsuNdlrjX/W2AEcriYyeo8tuHh0p2HMsYNEhnFu41UQKlFSiKKoBPoPUpSSccrb90d
         s8eagaIOPukiwor1hkVuPLNi8eYqtnuskNTolIrt+TO4sbObCah6kklfaPN64D4oWLEJ
         HNodggNH7SEqw/T54HMGkrJNYROG3bM0DspYh7sL6BVTZlT026Z5B+8lXKst3WW+Q+AF
         9p4UHhGDG3NU9lGXKXKerYBDxYHPVo/RdV1v3115nQ4a5JqUmnW1rXj7ji0n+rDEyXeF
         sXS2RXWFacD0E65q3SCEO89GR1/zdB0HYlwncoMyWflPaHDxhKYXaW4PDUTCLODulEem
         azhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761937716; x=1762542516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUiTd5oYFTdTZi4ZMjUtAbpcyMgZsOPHWTDrblXZvK0=;
        b=wjcSUyO5UnsccsXe/Xv42/yiXp9IAtSGTjfKknIieZFmNJ4jYAR/Ri/tfFymSNZR1H
         JBMXApGYinaDEfVD1T6kx8stpvAzxg7GsNUcg6LNcOT9AMwZi/GuH/KmHKH3/O3tFNpI
         EyJRcBEVAoJ+BCMj9qWMQkCraPgMEI1Fk9SVSiD7kS8zKjga1ktrNlX/mruuItZi4MDA
         HtbDVKqr0vV7j1pax+sTOTkAE8Zw9k/9jn26Pwz/VN9XZPSAqtTfk0NO0dtEYjIQgu7U
         /lbLQVof12mGgisW7ZfhEDFB7AUQifhdhDCAU/m6qSLyLGRy7AXC+LeeX/GUeEeghnLj
         63TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIzvxUF8bFv8LBTNm5wboPVPPIwHeqar7r4SKNUcRfC7s7xnWTPC19UkSGuiGQbSFe78n+XshszDmEJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMnI438Liorj2cSVyCpNvKvKNmbIPb8orx6KICfLGxDd3bFkI
	ZLUV79oq2xAEzDAH5GVXbe5sA45rD5/TNhjnNoJQ+bN6jqQLk2XdjcQ1VngaWv3DIvE=
X-Gm-Gg: ASbGncu3Qku/WQgFjUy9khAqlV4V6mCE2keskkSOcQI2gkf6Pl6+FbTZBI3SqUKSn4y
	fmGA6XdKklkqOwvs4+KKRvcRE6mX2sD2GmuMLpSyRE5gxo94S89HSi5/tKEdpbx8FEyz/B+tu9T
	YI8WBeBQ3HcELqq40d1YUoc43qhXatfnhRVXwjNXVYYCGLfGpnUv+LtXfLNIcccGEF0kK1K7iHF
	xKIOscHdo+g8Nw4UjHLfD4Az80GPlopu6zAaR+5ezBG3Ap84+5Velbw+/QrwM9iB93gP1EOG3zf
	sJ0b53o1P61SL8Z+2TzE1dJ9NIsbtsB26QYMY5TsqFAMDt3hf8jX4m/CZ8/jagpKlLitaBrkwC9
	YbPW21bGLYTiVxRwEhP43zP02crmvkmOA0hI9hTSrBYjwwV+gS3HpAFXXgbPMRSDB4/Z+UVb1lg
	36oQ==
X-Google-Smtp-Source: AGHT+IG12OkWytoKJ0lilVQc1G1GrblRvYfqFLJdeK962UdWkeKTi98DdmcNF39JDE3rYGA0RKjFrg==
X-Received: by 2002:a05:6e02:3f03:b0:42d:8acf:a6e2 with SMTP id e9e14a558f8ab-4330d1b7574mr72833545ab.15.1761937715809;
        Fri, 31 Oct 2025 12:08:35 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43310322d02sm9087875ab.19.2025.10.31.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 12:08:35 -0700 (PDT)
Date: Fri, 31 Oct 2025 14:08:33 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, macro@orcam.me.uk
Subject: Re: [PATCH v3] riscv: asm: use .insn for making custom instructions
Message-ID: <20251031-980f37fdcb94d15b02945fce@orel>
References: <20251024171640.65232-1-ben.dooks@codethink.co.uk>
 <20251031031009.GA2891125@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031031009.GA2891125@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_120836_894373_5C46E226 
X-CRM114-Status: GOOD (  28.99  )
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

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMTE6MTA6MDlQTSAtMDQwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gSGV5IEJlbiwKPiAKPiBPbiBGcmksIE9jdCAyNCwgMjAyNSBhdCAwNjoxNjo0
MFBNICswMTAwLCBCZW4gRG9va3Mgd3JvdGU6Cj4gPiBUaGUgYXNzZW1ibGVyIGhhcyAuaW5zbiBm
b3IgYnVpbGRpbmcgY3VzdG9tIGluc3RydWN0aW9ucwo+ID4gbm93LCBzbyBjaGFuZ2UgdGhlIC40
Ynl0ZSB0byAuaW5zbi4gVGhpcyBlbnN1cmVzIHRoZSBvdXRwdXQKPiA+IGlzIG1hcmtlZCBhcyBh
biBpbnN0cnVjdGlvbiBhbmQgbm90IGFzIGRhdGEgd2hpY2ggbWF5Cj4gPiBjb25mdXNlIGJvdGgg
ZGVidWdnZXJzIGFuZCBhbnl0aGluZyBlbHNlIHRoYXQgcmVsaWVzIG9uCj4gPiB0aGlzIHNvcnQg
b2YgbWFya2luZy4KPiA+IAo+ID4gQWRkIGFuIEFTTV9JTlNOX0koKSB3cmFwcGVyIGluIGFzbS5o
IHRvIGFsbG93IHRoZSBzZWxlY3RpbmcKPiA+IG9mIGhvdyB0aGlzIGlzIG91dHB1dCBzbyBvbGRl
ciBhc3NlbWJsZXJzIGFyZSBzdGlsbCBnb29kLgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJlbiBE
b29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPiA+IC0tLQo+ID4gdjI6Cj4gPiAgIC0g
Zml4ZWQgI2lmbmRlZiB2ICNpZmRlZgo+ID4gICAtIGFkZGVkIGN1c3RvbSBNSVBTIGluc3RydWN0
aW9ucyB0b28KPiA+ICAgLSBuZXcgcGF0Y2ggZGVzY3JpcHRpb24KPiA+IHYzOgo+ID4gICAtIGZp
eGVkIHR5cG8gbWlzc2VkIGluIGNvbXBpbGUgdGVzdCBvZiBOT1A0Cj4gPiAgIC0gZml4ZWQgaW5j
b3JyZWN0IE1JUFMgY2hhbmdlcwo+ID4gICAtIHJlLXdvcmVkIHNsaWdodGx5IHRvIHNob3J0ZW4g
c2VudGVuY2VzIGFuZCByZW1vdmUgdHlwb3MKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLmggICAgICAgICAgICAgICAgICAgIHwgNiArKysrKysKPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2luc24tZGVmLmggICAgICAgICAgICAgICB8IDggKysrKy0tLS0KPiA+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9leHRlbnNpb25zL21pcHMuaCB8IDYgKysrLS0t
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKPiA+IGluZGV4IDhiZDJhMTEzODJhMy4uMmQ5NzQzNjk5
OWNhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+ID4gQEAgLTEyLDYgKzEyLDEyIEBACj4g
PiAgI2RlZmluZSBfX0FTTV9TVFIoeCkJI3gKPiA+ICAjZW5kaWYKPiA+ICAKPiA+ICsjaWZkZWYg
Q09ORklHX0FTX0hBU19JTlNOCj4gCj4gVGhlIGN1cnJlbnQgQVNfSEFTX0lOU04gY2hlY2sgaW4g
S2NvbmZpZyBpcyBub3Qgc3VmZmljaWVudCBmb3IgdGhpcwo+IHVzYWdlLiBXaXRoIExMVk0gcHJp
b3IgdG8gWzFdIChpLmUuLCBvbGRlciB0aGFuIDE5KSBvciBHTlUgYmludXRpbHMKPiBwcmlvciB0
byBbMl0gKGkuZS4sIG9sZGVyIHRoYW4gMi4zOCksIHRoZSBidWlsZCBicmVha3M6Cj4gCj4gICBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gPGJ1aWx0LWluPjo0Ogo+ICAgSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGxpYi92ZHNvL2dldHRpbWVvZmRheS5jOjY6Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
aW5jbHVkZS92ZHNvL2RhdGFwYWdlLmg6MjE6Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5j
bHVkZS92ZHNvL3Byb2Nlc3Nvci5oOjEwOgo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L3Byb2Nlc3Nvci5oOjIzOjI6IGVycm9yOiBleHBlY3RlZCBpbnN0cnVjdGlvbiBmb3JtYXQKPiAg
ICAgIDIzIHwgICAgICAgICBBTFRfUklTQ1ZfUEFVU0UoKTsKPiAgICAgICAgIHwgICAgICAgICBe
Cj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0Lmg6NDc6Mzogbm90ZTogZXhw
YW5kZWQgZnJvbSBtYWNybyAnQUxUX1JJU0NWX1BBVVNFJwo+ICAgICAgNDcgfCAgICAgICAgICAg
ICAgICAgUklTQ1ZfUEFVU0UsIC8qIE9yaWdpbmFsIFJJU0PigJFWIHBhdXNlIGluc24gKi8gXAo+
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgXgo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
bnNuLWRlZi5oOjI1OToyMTogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnUklTQ1ZfUEFVU0Un
Cj4gICAgIDI1OSB8ICNkZWZpbmUgUklTQ1ZfUEFVU0UgICAgIEFTTV9JTlNOX0koIjB4MTAwMDAw
ZiIpCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAgIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYXNtLmg6MTY6MjY6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0FTTV9J
TlNOX0knCj4gICAgICAxNiB8ICNkZWZpbmUgQVNNX0lOU05fSShfX3gpICIuaW5zbiAiIF9feAo+
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgPGlubGluZSBhc20+OjU6
Nzogbm90ZTogaW5zdGFudGlhdGVkIGludG8gYXNzZW1ibHkgaGVyZQo+ICAgICAgIDUgfCAuaW5z
biAweDEwMDAwMGYKPiAgICAgICAgIHwgICAgICAgXgo+IAo+ICAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZHNvL3Byb2Nlc3Nvci5oOiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4gICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bj
b2RlIGAweDEwMDAwMGYnCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29y
Lmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGAweDEwMDAwMGYnCj4gICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQg
b3Bjb2RlIGAweDEwMDAwMGYnCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGAweDEwMDAwMGYnCj4gICBtYWtl
WzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg3OiBhcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL3ZnZXR0aW1lb2ZkYXkub10gRXJyb3IgMQo+IAo+IE1heWJlIHRoaXMgd2FudHMgYSBuZXcg
c3ltYm9sIGxpa2UgQ09ORklHX0FTX0hBU19JTlNOX0VYVCB0aGF0IGNoZWNrcwo+IGZvciB0aGlz
IHN1cHBvcnQ/Cj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3Qv
Y29tbWl0LzJhMDg2ZGNlNjkxZTNjYzM0YTJmYzI3ZjRmYjI1NWJiMmNiYmZhYzkKPiBbMl06IGh0
dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXQ7aD1h
MjYyYjgyZmRiZjRjZGEzYjA2NDhiMWFkYzMyMjQ1Y2EzZjc4YjdhCgpPciB3ZSBjYW4gY2hhbmdl
IHRoZSB0ZXN0IGluICdjb25maWcgQVNfSEFTX0lOU04nIHRvIHVzZSB0aGUgaGV4IGVuY29kZWQK
aW5wdXQuIFdlJ2QgY29tcGxldGVseSBzdG9wIHVzaW5nIC5pbnNuIGZvciBMTFZNIG9sZGVyIHRo
YW4gMTkgYW5kIEdOVQpiaW51dGlscyBvbGRlciB0aGFuIDIuMzgsIGJ1dCB0aGF0J3MgcHJvYmFi
bHkgYmV0dGVyIHRoYW4gYWRkaW5nIHlldAphbm90aGVyIGNvbmZpZy4KClRoYW5rcywKZHJldwoK
PiAKPiBDaGVlcnMsCj4gTmF0aGFuCj4gCj4gPiArI2RlZmluZSBBU01fSU5TTl9JKF9feCkgIi5p
bnNuICIgX194Cj4gPiArI2Vsc2UKPiA+ICsjZGVmaW5lIEFTTV9JTlNOX0koX194KSAiLjRieXRl
ICIgX194Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4g
ICNkZWZpbmUgX19SRUdfU0VMKGEsIGIpCV9fQVNNX1NUUihhKQo+ID4gICNlbGlmIF9fcmlzY3Zf
eGxlbiA9PSAzMgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1k
ZWYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaAo+ID4gaW5kZXggYzljZmNl
YTUyY2JiLi5kMjlkYTZjY2QzZGQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24tZGVmLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYu
aAo+ID4gQEAgLTI1NiwxMCArMjU2LDEwIEBACj4gPiAgCUlOU05fUyhPUENPREVfT1BfSU1NLCBG
VU5DMyg2KSwgX19SUzIoMyksCQlcCj4gPiAgCSAgICAgICBTSU1NMTIoKG9mZnNldCkgJiAweGZl
MCksIFJTMShiYXNlKSkKPiA+ICAKPiA+IC0jZGVmaW5lIFJJU0NWX1BBVVNFCSIuNGJ5dGUgMHgx
MDAwMDBmIgo+ID4gLSNkZWZpbmUgWkFXUlNfV1JTX05UTwkiLjRieXRlIDB4MDBkMDAwNzMiCj4g
PiAtI2RlZmluZSBaQVdSU19XUlNfU1RPCSIuNGJ5dGUgMHgwMWQwMDA3MyIKPiA+IC0jZGVmaW5l
IFJJU0NWX05PUDQJIi40Ynl0ZSAweDAwMDAwMDEzIgo+ID4gKyNkZWZpbmUgUklTQ1ZfUEFVU0UJ
QVNNX0lOU05fSSgiMHgxMDAwMDBmIikKPiA+ICsjZGVmaW5lIFpBV1JTX1dSU19OVE8JQVNNX0lO
U05fSSgiMHgwMGQwMDA3MyIpCj4gPiArI2RlZmluZSBaQVdSU19XUlNfU1RPCUFTTV9JTlNOX0ko
IjB4MDFkMDAwNzMiKQo+ID4gKyNkZWZpbmUgUklTQ1ZfTk9QNAlBU01fSU5TTl9JKCIweDAwMDAw
MDEzIikKPiA+ICAKPiA+ICAjZGVmaW5lIFJJU0NWX0lOU05fTk9QNAlfQUMoMHgwMDAwMDAxMywg
VSkKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9l
eHRlbnNpb25zL21pcHMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yX2V4dGVuc2lv
bnMvbWlwcy5oCj4gPiBpbmRleCBlYThjYTc0N2Q2OTEuLmZmZWIxMmRjMTdhMyAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yX2V4dGVuc2lvbnMvbWlwcy5oCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9leHRlbnNpb25zL21pcHMuaAo+
ID4gQEAgLTMwLDggKzMwLDggQEAgZXh0ZXJuIHN0cnVjdCByaXNjdl9pc2FfdmVuZG9yX2V4dF9k
YXRhX2xpc3QgcmlzY3ZfaXNhX3ZlbmRvcl9leHRfbGlzdF9taXBzOwo+ID4gICAqIGFsbG93aW5n
IGFueSBzdWJzZXF1ZW50IGluc3RydWN0aW9ucyB0byBmZXRjaC4KPiA+ICAgKi8KPiA+ICAKPiA+
IC0jZGVmaW5lIE1JUFNfUEFVU0UJIi40Ynl0ZSAweDAwNTAxMDEzXG5cdCIKPiA+IC0jZGVmaW5l
IE1JUFNfRUhCCSIuNGJ5dGUgMHgwMDMwMTAxM1xuXHQiCj4gPiAtI2RlZmluZSBNSVBTX0lIQgki
LjRieXRlIDB4MDAxMDEwMTNcblx0Igo+ID4gKyNkZWZpbmUgTUlQU19QQVVTRQlBU01fSU5TTl9J
KCIweDAwNTAxMDEzXG5cdCIpCj4gPiArI2RlZmluZSBNSVBTX0VIQglBU01fSU5TTl9JKCIweDAw
MzAxMDEzXG5cdCIpCj4gPiArI2RlZmluZSBNSVBTX0lIQglBU01fSU5TTl9JKCIweDAwMTAxMDEz
XG5cdCIpCj4gPiAgCj4gPiAgI2VuZGlmIC8vIF9BU01fUklTQ1ZfVkVORE9SX0VYVEVOU0lPTlNf
TUlQU19ICj4gPiAtLSAKPiA+IDIuMzcuMi4zNTIuZzNjNDQ0Mzc2NDMKPiA+IAo+ID4gCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
