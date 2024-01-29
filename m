Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B686C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P81wuuVFYydnnhABoXE2CWSpr/tTqJ079XNgCXfr250=; b=dOmYJ+hKLPRsYM
	UeqAAs9ns7fTZRuqP4dK1qUfjC3AjXgsjZ6l0LlbQL+bslX5G9yoxsPivW/cUvq8twXXO2oPvb6Yn
	RSlHLbmPMNZDnK/o+iKxqawp8sqiqbU9dxxvXYvgvGV6YK2p4rTpe/tC3b5RGuJ+2HBImDb3LYZ+X
	cpSMTKdTBvFEsmZs2omcN4S3KgBX4UW/F33VHBzM1nmnJeXDZYRaFenxUsE8ygKRR1gUkh6LpHKEC
	QbA77+LQ0fEm0oHjoexw0/1oaO/RsYwVgBiaIUsH5mmvwlEgJRRSMNKKQwqZw+DX41r140O/0eqej
	NOVgsGqDr3mHCWG7WsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTCy-0000000DBuf-1xAV;
	Mon, 29 Jan 2024 15:06:00 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTCv-0000000DBta-1yj1;
	Mon, 29 Jan 2024 15:05:58 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5958d3f2d8aso366387eaf.1;
        Mon, 29 Jan 2024 07:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706540754; x=1707145554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkpAjVvacpcOYBIZJzTULHFzBo21BcPnaUhokGVxGPM=;
        b=hFTxtv/SNfuud+FQNuYD8n5XPYPkYSo2gpjatitYbPobEMIzgDHyi39pJ+BGKydaXB
         t6JwS1zeUIAGQ2SJScrkoa3Hwpl+c7iRs+gpifJaFR6UewRVq1zwvyU2VoflEBdmbql0
         UKVXfp27yoQ6TkzE40d16Bp6GafecBkGQ3h7q7YX41XepiwWATetIFbcPY3uuUmN085D
         uEnnaG6AFpjnLIzBMGaoYFgoWY5BOu8muEqfUxLsnoK+S76QhGB3Ui6+9ySv4wo2R1Y0
         goTmrftDWusM8BMjaxJrhrdWKAh0TT8xYieDhN1DDMZTIut1UKYGipGxLWoL4szF8rqI
         sIyw==
X-Gm-Message-State: AOJu0YyzMyDlfH1hYz56+dm0ZE4xfXLAFYPvM/txyeOkJDPVz8m5Nc56
	1hH4XdFyGdZ3IsoXjeggWP9QCHQi2T/VJw734c7E9Pw5VLUZkLxLXvOdLYWh5WWRuFYS9yvPGoz
	6lvPV18oapzY07TNqrMh74/Yjsn4=
X-Google-Smtp-Source: AGHT+IEoV4wd4p7kTQOJWXxXpqTUH+qihI2/dlN0Po7tPQqbaCmtMIoU00Uv7+V2Gh58aCyndi1c4Fekk9NhHFrJKEg=
X-Received: by 2002:a4a:c48a:0:b0:599:fbcc:1c75 with SMTP id
 f10-20020a4ac48a000000b00599fbcc1c75mr6541388ooq.0.1706540754026; Mon, 29 Jan
 2024 07:05:54 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
 <20231215161539.00000940@Huawei.com> <5760569.DvuYhMxLoT@kreacher>
 <20240102143925.00004361@Huawei.com> <20240111101949.000075dc@Huawei.com>
 <ZZ/CR/6Voec066DR@shell.armlinux.org.uk> <20240112115205.000043b0@Huawei.com> <Zbe8WQRASx6D6RaG@shell.armlinux.org.uk>
In-Reply-To: <Zbe8WQRASx6D6RaG@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Jan 2024 16:05:42 +0100
Message-ID: <CAJZ5v0iba93EhQB2k3LMdb2YczndbRmF5WGRYHhnqCHq6TQJ0A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or functional) devices
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_070557_515659_27C9C5FD 
X-CRM114-Status: GOOD (  22.57  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMzo1NeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEhpIEpvbmF0aGFuLAo+Cj4gT24gRnJp
LCBKYW4gMTIsIDIwMjQgYXQgMTE6NTI6MDVBTSArMDAwMCwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90
ZToKPiA+IE9uIFRodSwgMTEgSmFuIDIwMjQgMTA6MjY6MTUgKzAwMDAKPiA+ICJSdXNzZWxsIEtp
bmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiBAQCAtMjM4
MSwxNiArMjM4OCwzOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChhY3BpX2Rldl9jbGVhcl9kZXBlbmRl
bmNpZXMpOwo+ID4gPiAgICogYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9uIC0gQ2hlY2sg
aWYgdGhlIEFDUEkgZGV2aWNlIGlzIHJlYWR5IGZvciBlbnVtZXJhdGlvbgo+ID4gPiAgICogQGRl
dmljZTogUG9pbnRlciB0byB0aGUgJnN0cnVjdCBhY3BpX2RldmljZSB0byBjaGVjawo+ID4gPiAg
ICoKPiA+ID4gLSAqIENoZWNrIGlmIHRoZSBkZXZpY2UgaXMgcHJlc2VudCBhbmQgaGFzIG5vIHVu
bWV0IGRlcGVuZGVuY2llcy4KPiA+ID4gKyAqIENoZWNrIGlmIHRoZSBkZXZpY2UgaXMgZnVuY3Rp
b25hbCBvciBlbmFibGVkIGFuZCBoYXMgbm8gdW5tZXQgZGVwZW5kZW5jaWVzLgo+ID4gPiAgICoK
PiA+ID4gLSAqIFJldHVybiB0cnVlIGlmIHRoZSBkZXZpY2UgaXMgcmVhZHkgZm9yIGVudW1lcmF0
aW5vLiBPdGhlcndpc2UsIHJldHVybiBmYWxzZS4KPiA+ID4gKyAqIFJldHVybiB0cnVlIGlmIHRo
ZSBkZXZpY2UgaXMgcmVhZHkgZm9yIGVudW1lcmF0aW9uLiBPdGhlcndpc2UsIHJldHVybiBmYWxz
ZS4KPiA+ID4gICAqLwo+ID4gPiAgYm9vbCBhY3BpX2Rldl9yZWFkeV9mb3JfZW51bWVyYXRpb24o
Y29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UpCj4gPiA+ICB7Cj4gPiA+ICAgICBpZiAo
ZGV2aWNlLT5mbGFncy5ob25vcl9kZXBzICYmIGRldmljZS0+ZGVwX3VubWV0KQo+ID4gPiAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+Cj4gPiA+IC0gICByZXR1cm4gYWNwaV9kZXZpY2Vf
aXNfcHJlc2VudChkZXZpY2UpOwo+ID4gPiArICAgLyoKPiA+ID4gKyAgICAqIEFDUEkgNi41J3Mg
Ni4zLjcgIl9TVEEgKERldmljZSBTdGF0dXMpIiBhbGxvd3MgZmlybXdhcmUgdG8gcmV0dXJuCj4g
PiA+ICsgICAgKiAoIXByZXNlbnQgJiYgZnVuY3Rpb25hbCkgZm9yIGNlcnRhaW4gdHlwZXMgb2Yg
ZGV2aWNlcyB0aGF0IHNob3VsZCBiZQo+ID4gPiArICAgICogZW51bWVyYXRlZC4gTm90ZSB0aGF0
IHRoZSBlbmFibGVkIGJpdCBzaG91bGQgbm90IGJlIHNldCB1bmxlc3MgdGhlCj4gPiA+ICsgICAg
KiBwcmVzZW50IGJpdCBpcyBzZXQuCj4gPiA+ICsgICAgKgo+ID4gPiArICAgICogSG93ZXZlciwg
bGltaXQgdGhpcyBvbmx5IHRvIHByb2Nlc3NvciBkZXZpY2VzIHRvIHJlZHVjZSBwb3NzaWJsZQo+
ID4gPiArICAgICogcmVncmVzc2lvbnMgd2l0aCBmaXJtd2FyZS4KPiA+ID4gKyAgICAqLwo+ID4g
PiArICAgaWYgKGRldmljZS0+c3RhdHVzLmZ1bmN0aW9uYWwpCj4gPiA+ICsgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+Cj4gSSBoYXZlIGEgcmVwb3J0IGZyb20gd2l0aGluIE9yYWNsZSB0aGF0IHRo
aXMgY2F1c2VzIHRlc3RpbmcgZmFpbHVyZXMKPiB3aXRoIFFFTVUgdXNpbmcgLXNtcCBjcHVzPTIs
bWF4Y3B1cz00LiBJIHRoaW5rIGl0IG5lZWRzIHRvIGJlOgo+Cj4gICAgICAgICBpZiAoIWRldmlj
ZS0+c3RhdHVzLnByZXNlbnQpCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZpY2UtPnN0YXR1
cy5mdW5jdGlvbmFsOwo+Cj4gICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4KPiAgICAgICAgIHJldHVybiAhYWNwaV9kZXZp
Y2VfaXNfcHJvY2Vzc29yKGRldmljZSk7CgpUaGUgYWJvdmUgaXMgZmluZSBieSBtZS4KCj4gU28g
d2UgY2FuIGJldHRlciB1bmRlcnN0YW5kIHRoZSBoaXN0b3J5IGhlcmUsIGxldCdzIGxpc3QgaXQg
YXMgYQo+IHRydXRoIHRhYmxlLiBQPXByZXNlbnQsIEY9ZnVuY3Rpb25hbCwgRT1lbmFibGVkLCBP
cmlnPWhvdyB0aGUgY29kZQo+IGlzIGluIG1haW5saW5lLCBKYW1lcz1KYW1lcycgb3JpZ2luYWwg
cHJvcG9zYWwsIFJhZmFlbD10aGUgcHJvcG9zZWQKPiByZXBsYWNlbWVudCBidXQgc2VlbXMgdG8g
YmUgYnVnZ3ksIFJtaz10aGUgZml4ZWQgdmVyc2lvbiB0aGF0IHBhc3Nlcwo+IHRlc3RzOgo+Cj4g
UCBGIEUgICBPcmlnICAgIEphbWVzICAgUmFmYWVsICAgICAgICAgIFJtawo+IDAgMCAwICAgMCAg
ICAgICAwICAgICAgIDAgICAgICAgICAgICAgICAwCj4gMCAwIDEgICAwICAgICAgIDAgICAgICAg
MCAgICAgICAgICAgICAgIDAKPiAwIDEgMCAgIDEgICAgICAgMSAgICAgICAxICAgICAgICAgICAg
ICAgMQo+IDAgMSAxICAgMSAgICAgICAwICAgICAgIDEgICAgICAgICAgICAgICAxCj4gMSAwIDAg
ICAxICAgICAgIDAgICAgICAgIXByb2Nlc3NvciAgICAgICFwcm9jZXNzb3IKPiAxIDAgMSAgIDEg
ICAgICAgMSAgICAgICAxICAgICAgICAgICAgICAgMQo+IDEgMSAwICAgMSAgICAgICAwICAgICAg
IDEgICAgICAgICAgICAgICAhcHJvY2Vzc29yCj4gMSAxIDEgICAxICAgICAgIDEgICAgICAgMSAg
ICAgICAgICAgICAgIDEKPgo+IEFueSBvYmplY3Rpb25zIHRvIHRoaXM/CgpTbyBBRkFJQUMgaXQg
Y2FuIHJldHVybiBmYWxzZSBpZiBub3QgZW5hYmxlZCwgYnV0IHByZXNlbnQgYW5kCmZ1bmN0aW9u
YWwuICBbU2lkZSBub3RlOiBJJ20gd29uZGVyaW5nIHdoYXQgImZ1bmN0aW9uYWwiIG1lYW5zIHRo
ZW4sCmJ1dCB3aGF0ZXZlci5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
