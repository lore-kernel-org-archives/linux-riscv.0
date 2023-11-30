Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA699C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idX1ZFEuPWOgB/bQmWsSUHItqDEdQAM41IbudylVosM=; b=jefojzEb8cXojX
	hxyIUSp7d37crOxXnkdyXsGSnPNiSekcdFSFMpBQrPCWScP4NaMfSR3IQUCISdPQXIkUukyPS7DZe
	wl1xkRH0DNB0KNFNHjRBSAmYL0kiXfOIRDUQWXhq8KQVU8hQTwqkF/vPLXtMfQyq0nh64gaA2vdJm
	jbsiiL3eHZCBhsXGj5OlX6hkinOxzoWaQPPZHcnDsuitm9CLs4OLDuXy5Aea/fPsrJ45V1ZTHyy50
	Iznj2aC+qxfH/t9VEofs6lAcqs+BIqXTt6l5AzXsSC7rK47tUGYp85l/GvHvM6BWSf9nlWuriH/bM
	JW6NUQkA96F+NaxH5k5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jix-00BIoO-1f;
	Thu, 30 Nov 2023 16:17:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jiu-00BInu-0A
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:17:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso66105e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701361016; x=1701965816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WTfd9Dke/wAtrjfd7TJ0XP8He7wb5roBd0D+Jv5G+8=;
        b=ns6PQj24/JA6VYtr5Uh34Hb5fXK1qos1NBMOe95DcpHv0SA1PZv+aPgpZZ+WCT+Thl
         6hiyBLUQElfYLatF1hT8/JWHQp0XE0KTP57twd/6gWO0BHpzeIO0fjK+n98STrcXwLK9
         bDlf0//xvs3zejMz3Hq5Kyqi7OUvf0NKycE173VCDKNfyYeF6KBe0kxgw4xnTaxatqUm
         cl99HObSe08TSXeqSFVDu1sgUca5kOOObKJN8FSP3vy3rf/hthz+dCDJ0fppjfSYoXiF
         +mgNn09sraoH+hyk2oEnba+H5IWFzl3/bQEtpR0UoQfkwMFQo0JVHod2VoUQxCFQ0zkN
         j8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361016; x=1701965816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WTfd9Dke/wAtrjfd7TJ0XP8He7wb5roBd0D+Jv5G+8=;
        b=nt8M63nVj57NGumZOfGVMz1/SqLUkX7ciwK9SlZS2fmRCq21QVyXJp7U4a/oyBytKz
         UiAjJuMNXB56HgpZsMVHlPDXSVii+ZfxivzHpOEnzg4Jm86lJ3qDaH+nUFxoqvjXiZ9I
         l9UJr7b/svmSriEzDWzCLkbzKFeOPL27AqbaYpAB7Ro3SVegeSE/ksrXycj9fEX8MZq1
         0iOVteP6WjEhMCQ1F2LfSzSPE5S6AF3TrIyyD3xctNckiCAm+Sjdy9kdw0HNvzHZqW0J
         n/JKWA53bMhbjQ6/YTQDbJPPlIU9CgxCkzWhxAui8b6JkiiHTJkqbbYqK+q4VO1q2N1z
         Vg/Q==
X-Gm-Message-State: AOJu0YxC6rRdzz3IZlKcUv909cOBtg7nq+8qdWHJttLgZzBaHYE+/jeI
	FdTznG0XzJjgGcVrsndL78CzVK+DakiXG+YElDnlYw==
X-Google-Smtp-Source: AGHT+IGHXtr/E8NOLWNyZndhRTTrYhJyY0dcj6OSW4gPELV7MTjdbT3NJnNTWIYqXPZBfh1qufpPoy5lX9LAEeCBts0=
X-Received: by 2002:a05:600c:1e15:b0:40b:3483:8488 with SMTP id
 ay21-20020a05600c1e1500b0040b34838488mr135764wmb.3.1701361016285; Thu, 30 Nov
 2023 08:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org> <20231129-riscv-restrict-dwarf5-llvm-v1-2-ec0d368fb538@kernel.org>
In-Reply-To: <20231129-riscv-restrict-dwarf5-llvm-v1-2-ec0d368fb538@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Thu, 30 Nov 2023 08:16:41 -0800
Message-ID: <CAFP8O3JscgacLPX-_pc2J0uhqk=ehtxSNStzo7PwewPSuXkxiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Restrict DWARF5 when building with LLVM to
 known working versions
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_081708_118064_9620EF65 
X-CRM114-Status: GOOD (  18.99  )
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

T24gV2VkLCBOb3YgMjksIDIwMjMgYXQgMzozMOKAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBMTFZNIHByaW9yIHRvIDE4LjAuMCB3b3VsZCBnZW5l
cmF0ZSBpbmNvcnJlY3QgZGVidWcgaW5mbyBmb3IgRFdBUkY1IGR1ZQo+IHRvIGxpbmtlciByZWxh
eGF0aW9uLCB3aGljaCB3YXMgd29ya2VkIGFyb3VuZCBpbiBjbGFuZyBieSBkZWZhdWx0aW5nCj4g
UklTQy1WIHRvIERXQVJGNCBbMV0uIFVuZm9ydHVuYXRlbHksIHRoaXMgd29ya2Fyb3VuZCBkb2Vz
IG5vdCB3b3JrIGZvcgo+IHRoZSBrZXJuZWwgYmVjYXVzZSB0aGUgRFdBUkYgdmVyc2lvbiBjYW4g
YmUgaW5kZXBlbmRlbnRseSBjaGFuZ2VkIGZyb20KPiB0aGUgZGVmYXVsdCBpbiBLY29uZmlnLgo+
Cj4gRG8gbm90IGFsbG93IERXQVJGNSB0byBiZSBzZWxlY3RlZCBmb3IgUklTQy1WIHdoZW4gdXNp
bmcgbGlua2VyCj4gcmVsYXhhdGlvbiAobGQubGxkID49IDE1LjAuMCkgYW5kIGEgdmVyc2lvbiBv
ZiBMTFZNIHRoYXQgZG9lcyBub3QgaGF2ZQo+IHRoZSBmaXhlcyAodGhlIGludGVncmF0ZWQgYXNz
ZW1ibGVyIFsyXSBhbmQgbGQubGxkIFszXSA8IDE4LjAuMCkKPiBuZWNlc3NhcnkgdG8gZ2VuZXJh
dGUgdGhlIGNvcnJlY3QgZGVidWcgaW5mby4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9s
bHZtL2xsdm0tcHJvamVjdC9jb21taXQvYmJjMGY5OWYzYmM5NmYxZGIxNmY2NDlmYzIxZGQxOGU1
YjA5MThmNiBbMV0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3Qv
Y29tbWl0LzFkZjVlYTI5YjQzNjkwYjY2MjJkYjJjYWQ3Yjc0NTYwN2NhNGRlNmEgWzJdCj4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC83ZmZhYmI2MWE1
NTY5NDQ0YjVhYzkzMjJlMjJlNTQ3MWNjNWU0YTc3IFszXQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhh
biBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29u
ZmlnIHwgOSArKysrKysrKysKPiAgbGliL0tjb25maWcuZGVidWcgIHwgMSArCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDcyYmUxZDgxMjJhMy4uODFiNDczY2I0
N2IwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+IEBAIC0xODYsNiArMTg2LDE1IEBAIGNvbmZpZyBSSVNDVl9VU0VfTElOS0VSX1JF
TEFYQVRJT04KPiAgICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0
L2NvbW1pdC82NjExZDU4ZjViYmNiZWM3NzI2MmQzOTJlMjkyM2UxZDY4MGY2OTg1Cj4gICAgICAg
ICBkZXBlbmRzIG9uICFMRF9JU19MTEQgfHwgTExEX1ZFUlNJT04gPj0gMTUwMDAwCj4KPiArIyBo
dHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvY29tbWl0L2JiYzBmOTlmM2JjOTZm
MWRiMTZmNjQ5ZmMyMWRkMThlNWIwOTE4ZjYKPiArY29uZmlnIEFSQ0hfSEFTX0JST0tFTl9EV0FS
RjUKPiArICAgICAgIGRlZl9ib29sIHkKPiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfVVNFX0xJ
TktFUl9SRUxBWEFUSU9OCj4gKyAgICAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0t
cHJvamVjdC9jb21taXQvMWRmNWVhMjliNDM2OTBiNjYyMmRiMmNhZDdiNzQ1NjA3Y2E0ZGU2YQo+
ICsgICAgICAgZGVwZW5kcyBvbiBBU19JU19MTFZNICYmIEFTX1ZFUlNJT04gPCAxODAwMDAKPiAr
ICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC83ZmZh
YmI2MWE1NTY5NDQ0YjVhYzkzMjJlMjJlNTQ3MWNjNWU0YTc3Cj4gKyAgICAgICBkZXBlbmRzIG9u
IExEX0lTX0xMRCAmJiBMTERfVkVSU0lPTiA8IDE4MDAwMAo+ICsKPiAgY29uZmlnIEFSQ0hfTU1B
UF9STkRfQklUU19NSU4KPiAgICAgICAgIGRlZmF1bHQgMTggaWYgNjRCSVQKPiAgICAgICAgIGRl
ZmF1bHQgOAo+IGRpZmYgLS1naXQgYS9saWIvS2NvbmZpZy5kZWJ1ZyBiL2xpYi9LY29uZmlnLmRl
YnVnCj4gaW5kZXggY2M3ZDUzZDlkYzAxLi5hMGViY2UwNWEzNjggMTAwNjQ0Cj4gLS0tIGEvbGli
L0tjb25maWcuZGVidWcKPiArKysgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+IEBAIC0yODIsNiArMjgy
LDcgQEAgY29uZmlnIERFQlVHX0lORk9fRFdBUkY0Cj4gIGNvbmZpZyBERUJVR19JTkZPX0RXQVJG
NQo+ICAgICAgICAgYm9vbCAiR2VuZXJhdGUgRFdBUkYgVmVyc2lvbiA1IGRlYnVnaW5mbyIKPiAg
ICAgICAgIHNlbGVjdCBERUJVR19JTkZPCj4gKyAgICAgICBkZXBlbmRzIG9uICFBUkNIX0hBU19C
Uk9LRU5fRFdBUkY1Cj4gICAgICAgICBkZXBlbmRzIG9uICFDQ19JU19DTEFORyB8fCBBU19JU19M
TFZNIHx8IChBU19JU19HTlUgJiYgQVNfVkVSU0lPTiA+PSAyMzUwMiAmJiBBU19IQVNfTk9OX0NP
TlNUX0xFQjEyOCkKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgR2VuZXJhdGUgRFdBUkYgdjUg
ZGVidWcgaW5mby4gUmVxdWlyZXMgYmludXRpbHMgMi4zNS4yLCBnY2MgNS4wKyAoZ2NjCj4KPiAt
LQo+IDIuNDMuMAo+CgpBIGNvbW1lbnQgYW5kICJkZXBlbmRzIG9uIiBjb25kaXRpb24gaW50cm9k
dWNlZCBieSBjb21taXQKMGE2ZGU3OGNmZjYwMGNiOTkxZjJhMWI3ZWQzNzY5MzU4NzE3OTZhMCAi
bGliL0tjb25maWcuZGVidWc6IEFkZCBjaGVjawpmb3Igbm9uLWNvbnN0YW50IC57cyx1fWxlYjEy
OCBzdXBwb3J0IHRvIERXQVJGNSIKY2FuIG5vdyBiZSByZWZpbmVkLgoKPiBpYi9LY29uZmlnLmRl
YnVnCj4gKEFTX0lTX0dOVSAmJiBBU19WRVJTSU9OID49IDIzNTAyICYmIEFTX0hBU19OT05fQ09O
U1RfTEVCMTI4KQoKQVNfVkVSU0lPTiBjYW4gbm93IGJlIDI0MTAwLgoKVGhhbmtzIGZvciB0aGUg
Y29tbWVudC4gSSBqdXN0IG1hcmtlZApodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3No
b3dfYnVnLmNnaT9pZD0yNzIxNSAoIiBhczogRXJyb3I6Cm5vbi1jb25zdGFudCAudWxlYjEyOCBp
cyBub3Qgc3VwcG9ydGVkIG9uIHJpc2N2NjQiKSBhcyByZXNvbHZlZCA6KQoKPiArIyBDbGFuZyBp
cyBrbm93biB0byBnZW5lcmF0ZSAue3MsdX1sZWIxMjggd2l0aCBzeW1ib2wgZGVsdGFzIHdpdGgg
RFdBUkY1LCB3aGljaAo+ICsjIHNvbWUgdGFyZ2V0cyBtYXkgbm90IHN1cHBvcnQ6IGh0dHBzOi8v
c291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTI3MjE1CgpUaGlzIGNvbW1l
bnQgY2FuIGJlIHVwZGF0ZWQ6KQoKCi0tIArlrovmlrnnnb8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
