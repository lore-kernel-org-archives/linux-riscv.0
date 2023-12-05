Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3EAC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 23:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlDD5mbEmgMLBYxhr+LVdVLvicS4rKJpH4myiy29gG0=; b=ptNpegC9GkD9LE
	wS4zcttgI5D4Pm8+3O9QhVCu+tWeou4zHB6P5239jxrVDEFOTF+eiJI+YIKQ4ssWZkrDhVxDXZuDB
	fopUlG3FlYBY7bj9s5IJG+zRrcA+fTtem7wFRYOk4CrmwZEZ+S+B/OmcOMB5XAyWnKskNM30yYryn
	BX9FkzQSmKPXEODfe5sz6mCHq649HQ7HGTp4pwk/UjZGJX8SiGagXCLOFWjgEEHLSOCeG7vyrZQeC
	TlXLf7bYrgOIn0vzqhqNly0yxx9NNE/J79Q35h18hySLtY4NuYPRpxYHSlgZ0gfyzeK6FA1f3umVm
	txxYJ1nDX1i7fKPfLYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAf1G-008e6D-1x;
	Tue, 05 Dec 2023 23:40:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAf1D-008e5T-20
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 23:40:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b35199f94so25945e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701819593; x=1702424393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSWCSu+uiAqROdUkMO1B316jZcgb431g6mYLbAjqo80=;
        b=B/7ClpaDJmx484O9d9IybyrNkxDiSIEM4I9/O1NPuz9WOigIuR7VARWBDteZg7UEYl
         ZKC7FMrKCyn/+lQ02WNkNZGIX6ZCgAYK7f/TK4TEiiTppZrdaHqzJOBTwANGLtTLBpkn
         O+e1Z+SFSa0t1DuCGV54/OZtJjta7VfKiTlG6i4YWeoILapTJkE+4oBC5hIG3K8E8LDz
         WMLEurwWbwAFT6ENmy0ZSW62B1/0XIBBoFHbnTxlpvWuh110pETxh1/J+r4vnB0tBYzN
         aK2B8jK//AEp9GMblfoX5dq7I7mjRnZwyoFO8vK1HnsJeCZ+9fEOmLJi54Ui/GB5C6+W
         TKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701819593; x=1702424393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSWCSu+uiAqROdUkMO1B316jZcgb431g6mYLbAjqo80=;
        b=cPeueqmIwl1sHh5vDi05uhQsoqOmpZOwFW5Ablhb+juqZ/8Bv9kYT81JC+e4jN+GyR
         sUqtX/Ix3On+KE+3G8YAkMq/v1FYWmub0RYYl1glwkE3R0/UIcyJ10BsOS1TF925wnWI
         Y3TImibTcsL1jmgXH2oEoMBp2BBu+j72vIFOIXZt++POGpP4/udDKrDhAKp9kAZjU7+2
         u0TRK/5fK6c09hGOqAwlfZMNatFBJj/Ff05mnGv8Fi/fHAGgpRpOTjqopSHi7rbbtXZ0
         zePEc6Df+C4Wt3+vw/WpbsuyR45G9PyWdlwcB2LYjCAffJCVqH0muql81k6DkOG/NLh4
         Y+4w==
X-Gm-Message-State: AOJu0YzEM82+ZYE9ICGSskcBQN6C8A9LLfom6fom6w0QOvuTEzgiGLlM
	a1LOSia/Ogk9JWT2OyTGUZPztkZxYoZeHSrgIVzuBA==
X-Google-Smtp-Source: AGHT+IF8mDldPOjjvLBVwxyoBmhqdFoqGknCkdePsEll3+maAHtLGMnd7XmU96mZreg/qdTS7mVk+MDJmUNb3enDW1M=
X-Received: by 2002:a05:600c:3b22:b0:40b:4355:a04b with SMTP id
 m34-20020a05600c3b2200b0040b4355a04bmr32914wms.6.1701819592988; Tue, 05 Dec
 2023 15:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
 <20231129-riscv-restrict-dwarf5-llvm-v1-2-ec0d368fb538@kernel.org>
 <CAFP8O3JscgacLPX-_pc2J0uhqk=ehtxSNStzo7PwewPSuXkxiw@mail.gmail.com>
 <20231201194858.GA290910@dev-arch.thelio-3990X> <CAFP8O3+uta+GQO7dpeNLe0OMFnX-tdEyvHREEu1ThjA3nFtTkQ@mail.gmail.com>
 <20231201215021.GA2579712@dev-arch.thelio-3990X> <CAFP8O3LJPqPVxcRzi_Qxvu_w8w76BXmfWv8YnsK+bMvqXb701Q@mail.gmail.com>
 <20231204231155.GA3560411@dev-arch.thelio-3990X>
In-Reply-To: <20231204231155.GA3560411@dev-arch.thelio-3990X>
From: Fangrui Song <maskray@google.com>
Date: Tue, 5 Dec 2023 15:39:39 -0800
Message-ID: <CAFP8O3Kgzt=fdOLH+TG1vDTfNzY_-YebhsdAgPJ7XJ+x7qO1ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Restrict DWARF5 when building with LLVM to
 known working versions
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_153959_657316_44A875F5 
X-CRM114-Status: GOOD (  22.62  )
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCAzOjEy4oCvUE0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDAxLCAyMDIzIGF0IDA4OjMxOjEy
UE0gLTA4MDAsIEZhbmdydWkgU29uZyB3cm90ZToKPiA+IFBlcmhhcHM6IENsYW5nIGdlbmVyYXRl
cyAudWxlYjEyOCB3aXRoIGxhYmVsIGRpZmZlcmVuY2VzIGZvciBEV0FSRiB2NSwKPiA+IGEgZmVh
dHVyZSB0aGF0IG9sZGVyIGJpbnV0aWxzIHBvcnRzLCB1dGlsaXppbmcgUklTQy1WIHN0eWxlIGxp
bmtlcgo+ID4gcmVsYXhhdGlvbiwgZG8gbm90IHN1cHBvcnQuCj4gPgo+ID4gKFNpZ25lZCBMRUIx
MjggaXMgdXNlZCBieSBEV0FSRiBhcyB3ZWxsLCBidXQgaXQgaXMgZW5jb2RlZCBkaXJlY3RseQo+
ID4gaW50byBEV19PUF9mYnJlZy9EV19MTlNfYWR2YW5jZV9saW5lL2V0YywgYW5kIGV4cGxpY2l0
IC5zbGViMTI4Cj4gPiBkaXJlY3RpdmVzIGFyZSBub3QgZW1pdHRlZCkKPiA+IChJbiBhc3NlbWJs
ZXJzLCAibGFiZWwgZGlmZmVyZW5jZSIgaXMgYSBtb3JlIGNvbW1vbiB0ZXJtLikKPiA+IChQZW9w
bGUgd29ya2luZyBvbiBEV0FSRiB0ZW5kIHRvIHByZWZlciBEV0FSRiB2NSB0byBEV0FSRjUsIHdo
ZW4gdGhlCj4gPiBmdWxsICJEV0FSRiB2ZXJzaW9uIDUiIGZlZWxzIHRvbyB2ZXJib3NlLikKPgo+
IFRoYW5rcywgZG9lcyB0aGlzIGRpZmYgc2VlbSByZWFzb25hYmxlIHRvIHlvdT8gSSdkIGxpa2Ug
dG8ga2VlcCB0aGUKPiBpc3N1ZSBsaW5rIGFzIGEgcGFwZXIgdHJhaWwgYW5kIEkgZmlndXJlZCB0
aGF0IHdlIG1pZ2h0IGFzIHdlbGwgbWFrZSB0aGUKPiBjb25maWd1cmF0aW9uIG5hbWUgc2xpZ2h0
bHkgbW9yZSBhY2N1cmF0ZSB3aXRoIHRoYXQgYWRkaXRpb25hbAo+IGluZm9ybWF0aW9uLiBJIHdp
bGwgc2VuZCBpdCBhcyBhIHNlcGFyYXRlIHBhdGNoIGluIHYyIHRvbW9ycm93IGlmIHNvIGluCj4g
b3JkZXIgdG8gZ2l2ZSBwZW9wbGUgYSBjaGFuY2UgdG8gZnVydGhlciBjaGltZSBpbiBvbiB0aGUg
c2VyaWVzLgo+Cj4gQ2hlZXJzLAo+IE5hdGhhbgo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmln
LmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKPiBpbmRleCBhMGViY2UwNWEzNjguLjc2YzJjYzY5
NzU3MyAxMDA2NDQKPiAtLS0gYS9saWIvS2NvbmZpZy5kZWJ1Zwo+ICsrKyBiL2xpYi9LY29uZmln
LmRlYnVnCj4gQEAgLTIzMSw5ICsyMzEsMTAgQEAgY29uZmlnIERFQlVHX0lORk8KPiAgICAgICAg
ICAgaW4gdGhlICJEZWJ1ZyBpbmZvcm1hdGlvbiIgY2hvaWNlIGJlbG93LCBpbmRpY2F0aW5nIHRo
YXQgZGVidWcKPiAgICAgICAgICAgaW5mb3JtYXRpb24gd2lsbCBiZSBnZW5lcmF0ZWQgZm9yIGJ1
aWxkIHRhcmdldHMuCj4KPiAtIyBDbGFuZyBpcyBrbm93biB0byBnZW5lcmF0ZSAue3MsdX1sZWIx
Mjggd2l0aCBzeW1ib2wgZGVsdGFzIHdpdGggRFdBUkY1LCB3aGljaAo+IC0jIHNvbWUgdGFyZ2V0
cyBtYXkgbm90IHN1cHBvcnQ6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19i
dWcuY2dpP2lkPTI3MjE1Cj4gLWNvbmZpZyBBU19IQVNfTk9OX0NPTlNUX0xFQjEyOAo+ICsjIENs
YW5nIGdlbmVyYXRlcyAudWxlYjEyOCB3aXRoIGxhYmVsIGRpZmZlcmVuY2VzIGZvciBEV0FSRiB2
NSwgYSBmZWF0dXJlIHRoYXQKPiArIyBvbGRlciBiaW51dGlscyBwb3J0cyBkbyBub3Qgc3VwcG9y
dCB3aGVuIHV0aWxpemluZyBSSVNDLVYgc3R5bGUgbGlua2VyCj4gKyMgcmVsYXhhdGlvbjogaHR0
cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MjcyMTUKPiArY29u
ZmlnIEFTX0hBU19OT05fQ09OU1RfVUxFQjEyOAo+ICAgICAgICAgZGVmX2Jvb2wgJChhcy1pbnN0
ciwudWxlYjEyOCAuTGV4cHJfZW5kNCAtIC5MZXhwcl9zdGFydDNcbi5MZXhwcl9zdGFydDM6XG4u
TGV4cHJfZW5kNDopCj4KPiAgY2hvaWNlCj4gQEAgLTI1OCw3ICsyNTksNyBAQCBjb25maWcgREVC
VUdfSU5GT19OT05FCj4gIGNvbmZpZyBERUJVR19JTkZPX0RXQVJGX1RPT0xDSEFJTl9ERUZBVUxU
Cj4gICAgICAgICBib29sICJSZWx5IG9uIHRoZSB0b29sY2hhaW4ncyBpbXBsaWNpdCBkZWZhdWx0
IERXQVJGIHZlcnNpb24iCj4gICAgICAgICBzZWxlY3QgREVCVUdfSU5GTwo+IC0gICAgICAgZGVw
ZW5kcyBvbiAhQ0NfSVNfQ0xBTkcgfHwgQVNfSVNfTExWTSB8fCBDTEFOR19WRVJTSU9OIDwgMTQw
MDAwIHx8IChBU19JU19HTlUgJiYgQVNfVkVSU0lPTiA+PSAyMzUwMiAmJiBBU19IQVNfTk9OX0NP
TlNUX0xFQjEyOCkKPiArICAgICAgIGRlcGVuZHMgb24gIUNDX0lTX0NMQU5HIHx8IEFTX0lTX0xM
Vk0gfHwgQ0xBTkdfVkVSU0lPTiA8IDE0MDAwMCB8fCAoQVNfSVNfR05VICYmIEFTX1ZFUlNJT04g
Pj0gMjM1MDIgJiYgQVNfSEFTX05PTl9DT05TVF9VTEVCMTI4KQo+ICAgICAgICAgaGVscAo+ICAg
ICAgICAgICBUaGUgaW1wbGljaXQgZGVmYXVsdCB2ZXJzaW9uIG9mIERXQVJGIGRlYnVnIGluZm8g
cHJvZHVjZWQgYnkgYQo+ICAgICAgICAgICB0b29sY2hhaW4gY2hhbmdlcyBvdmVyIHRpbWUuCj4g
QEAgLTI4Myw3ICsyODQsNyBAQCBjb25maWcgREVCVUdfSU5GT19EV0FSRjUKPiAgICAgICAgIGJv
b2wgIkdlbmVyYXRlIERXQVJGIFZlcnNpb24gNSBkZWJ1Z2luZm8iCj4gICAgICAgICBzZWxlY3Qg
REVCVUdfSU5GTwo+ICAgICAgICAgZGVwZW5kcyBvbiAhQVJDSF9IQVNfQlJPS0VOX0RXQVJGNQo+
IC0gICAgICAgZGVwZW5kcyBvbiAhQ0NfSVNfQ0xBTkcgfHwgQVNfSVNfTExWTSB8fCAoQVNfSVNf
R05VICYmIEFTX1ZFUlNJT04gPj0gMjM1MDIgJiYgQVNfSEFTX05PTl9DT05TVF9MRUIxMjgpCj4g
KyAgICAgICBkZXBlbmRzIG9uICFDQ19JU19DTEFORyB8fCBBU19JU19MTFZNIHx8IChBU19JU19H
TlUgJiYgQVNfVkVSU0lPTiA+PSAyMzUwMiAmJiBBU19IQVNfTk9OX0NPTlNUX1VMRUIxMjgpCj4g
ICAgICAgICBoZWxwCj4gICAgICAgICAgIEdlbmVyYXRlIERXQVJGIHY1IGRlYnVnIGluZm8uIFJl
cXVpcmVzIGJpbnV0aWxzIDIuMzUuMiwgZ2NjIDUuMCsgKGdjYwo+ICAgICAgICAgICA1LjArIGFj
Y2VwdHMgdGhlIC1nZHdhcmYtNSBmbGFnIGJ1dCBvbmx5IGhhZCBwYXJ0aWFsIHN1cHBvcnQgZm9y
IHNvbWUKClRoaXMgZGlmZiBsb29rcyBnb29kIHRvIG1lLgoKCi0tIArlrovmlrnnnb8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
