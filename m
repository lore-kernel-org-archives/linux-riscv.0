Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3662C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 03:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UFjsiNCEY1nqGzZ9jcJcsYGyUHMNX5dFsXK1dsgCR4=; b=wkg8Shrb4NwZ7+
	/4BshwX8rNXAYM7Nz2DOjkaiFFt/Fy1QNJyYViDtRfHW9AsmFs7g4nm2rENsW5VYQevUZ4e4FS4kV
	bQwndjB9tG4dKhwBKzXMEtfkL9n0g2M0H2/IqFSQKhJ8mlmWzmfRaYgfnVLb3VVnW9q/n+xnO0yMt
	xEn0bbOVn3ultChUxmSH5AqM8csR900oWTqxSafpfkXqw2QSNMTGDzpp90yzoepSAYW9gNCH7Dahy
	kAwHN1VJPR9XUdsO9FD0LdrQFabtkkdYVyaSuhw6XwdBf1kLymZfEicZyKzWcG9feifhg0cbEbWDX
	5Qt8+ehftkq/I+DTqatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um26A-0000000CVlc-06da;
	Wed, 13 Aug 2025 03:24:22 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um25f-0000000CVhV-0HIy
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 03:23:52 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-433fd4aeeb8so3928604b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755055430; x=1755660230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VCV0IcKQbeDysFZNp7fgDy2mqwBozQbq8Iq9HYJ1rc=;
        b=XyP5FbRrQKP8gy/tcrCoy7147RMBUneAaLRBZVV+THpp07yIPsPcH6mg5KrKyZyKFS
         VkJWMo9pWep8FlVuKVPMd9TDYpUm/leguKbymxU6I0x1xNkkUp221lgfV46+4uEnABow
         Gu4832cDZi10c9uChnTvlS0+CMRokmKxO+LN1Aou3MBo+iW2/VXkpnSsps2QrgKCcNDh
         ePILxDuMs0RtX0vPDveMQ4+lwK1XE1pKlX4BDPk/xgQoEUtnamB6KiyOBpMIdfKRR0NY
         8aDWYeV2uyHkF4BtxHQ8m73Us2BcH6ghqRc1BY+hI6SifvxZyXntAslaHmb8elNuW3mi
         jG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755055430; x=1755660230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VCV0IcKQbeDysFZNp7fgDy2mqwBozQbq8Iq9HYJ1rc=;
        b=JKpmAxzJZvObTSb4H4Prl9qxdbWYS1/Jr7fmCOsVtf4JRbHjkInaS5ZtQi0SWLn1Es
         Ye2fuWCcnt6xuXrkE0DWHYIWf5q/po7EQYwV0psLgmtGLskpqkhc4YNLP0ZKG3khr2n+
         jycCLRNGb7NLfUFhEXWlB+JUg2tm5pleEcoW+2QUWNjbxjXNSQTQ8YYNt4a5zqZ9nFGY
         +kPs84RFMdfqAebnWfnD1zpsVWLjN6by5Xq4KXt9lzpFI2i+v87Qq1YhH22BCnNz3/C2
         HVWZP9AyFL1/O4cCdFHgPfgQHFYRu3Uvx2Ngl/g50niKKhs40FDRd+1KQL6IMWerfpYk
         mGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn2BxNxoTsxNHVkT4nSIaEtT3IBf1r4Yv6REYFtIsALZtfA9rzD33IpsB+mcsCvqWvetV71y9i3XPzng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xKnCSCObu24vXWOzJewvfc722wjgCxH8WQ9X3U9BvtfnOtWu
	Zy9ScV2awefGdaaNNaG5W/gs58LAkZE1r0eTiawQBPZmOZjS5mPKsmoqKYqWMuQbQypVyuOy3Gm
	JXSXSfIZx7espy59mWKCKU64cESToGVM52Jwjuq33Bw==
X-Gm-Gg: ASbGncsr09iXc0IFehom3sRdZZZB81wroEHeQsgGOOssujDvANF3zuS57EiLQ+fJXLv
	P/z5eGFmieii/uvG9Gx/RiFRMkXFf3CIps9VypPsX2+CyYNvang7ymC82Ct19IsDV3VYchuOzvm
	ITsgnnS3ZsFvq8iF5/u7rpiaV2g2NimL0U1Tq1PrcM3L0utOI5rTTF9tzeOZt/Xbmazh2n27OT9
	WGbripdhQN5dsGBAnaci0kt
X-Google-Smtp-Source: AGHT+IHToQLYwLq1/teWU7qsFi7+iFfC6eraS42g9mMDfypdyNKK18baY/bFJ+yAHRyJKFNY0FsEqDTEhE8C509h41k=
X-Received: by 2002:a05:6808:1889:b0:433:ef4c:6d85 with SMTP id
 5614622812f47-435d4142142mr973085b6e.14.1755055430087; Tue, 12 Aug 2025
 20:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop> <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop>
In-Reply-To: <aJtKZhvNX0p3obFw@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 13 Aug 2025 11:23:39 +0800
X-Gm-Features: Ac12FXwhM6-MmscWbyq1ralTrqKIU7ifLVg5RHi-3fR206-epo7nHbTF62cmctI
Message-ID: <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, juwenlong@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_202351_477178_AA4C0F47 
X-CRM114-Status: GOOD (  37.37  )
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

SGkgU3VuaWwsCgpPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAxMDowNuKAr1BNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDEyLCAyMDI1
IGF0IDA5OjMyOjEwUE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBTdW5pbCwKPiA+
Cj4gPgo+ID4gT24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgOToxNeKAr1BNIFN1bmlsIFYgTCA8c3Vu
aWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBBdWcgMTIs
IDIwMjUgYXQgMDc6MjU6NDRQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+ID4gPiBIaSBT
dW5pbCwKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDU6NDTigK9QTSBZ
dW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQWRkIHRoZSByZWFkIG9mIENTUl9DWUNMRSB0byBjcHBjX2ZmaF9jc3JfcmVhZCgpIHRv
IGZpeCB0aGUKPiA+ID4gPiA+IHdhcm5pbmcgbWVzc2FnZTogIkNQUEMgQ3B1ZnJlcTogY3BwY19z
Y2FsZV9mcmVxX3dva3JmbjogZmFpbGVkCj4gPiA+ID4gPiB0byByZWFkIHBlcmYgY291bnRlcnMi
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9hY3BpL3Jp
c2N2L2NwcGMuYyB8IDUgKysrKy0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gPiA+
ID4gPiBpbmRleCA0Y2RmZjM4N2RlZmY2Li5jMWFjYWViMThlYWMzIDEwMDY0NAo+ID4gPiA+ID4g
LS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9h
Y3BpL3Jpc2N2L2NwcGMuYwo+ID4gPiA+ID4gQEAgLTY5LDExICs2OSwxNCBAQCBzdGF0aWMgdm9p
ZCBjcHBjX2ZmaF9jc3JfcmVhZCh2b2lkICpyZWFkX2RhdGEpCj4gPiA+ID4gPiAgICAgICAgIHN0
cnVjdCBzYmlfY3BwY19kYXRhICpkYXRhID0gKHN0cnVjdCBzYmlfY3BwY19kYXRhICopcmVhZF9k
YXRhOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgc3dpdGNoIChkYXRhLT5yZWcpIHsKPiA+
ID4gPiA+IC0gICAgICAgLyogU3VwcG9ydCBvbmx5IFRJTUUgQ1NSIGZvciBub3cgKi8KPiA+ID4g
PiA+ICAgICAgICAgY2FzZSBDU1JfVElNRToKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBkYXRh
LT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfVElNRSk7Cj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgZGF0YS0+cmV0LmVycm9yID0gMDsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBicmVhazsK
PiA+ID4gPiA+ICsgICAgICAgY2FzZSBDU1JfQ1lDTEU6Cj4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX0NZQ0xFKTsKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4gPiA+ID4gICAgICAgICBkZWZhdWx0Ogo+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgIGRhdGEtPnJldC5lcnJvciA9IC1FSU5WQUw7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi4zOS4yCj4gPiA+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIHB1cnBvc2Ugb2YgY3BwY19mZmhfY3NyX3JlYWQoKSBpcyB0byBjYWxjdWxhdGUg
dGhlIGFjdHVhbAo+ID4gPiA+IGZyZXF1ZW5jeSBvZiB0aGUgQ1BVLCB3aGljaCBpcyBkZWx0YV9D
U1JfQ1lDTEUvZGVsdGFfQ1NSX1hYWC4KPiA+ID4gPgo+ID4gPiA+IENTUl9YWFggc2hvdWxkIGJl
IGEgcmVmZXJlbmNlIGNsb2NrIGFuZCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJCj4gPiA+ID4g
KFdhaXQgRm9yIEludGVycnVwdCkuCj4gPiA+ID4KPiA+ID4gPiBTaW1pbGFyIHNvbHV0aW9ucyBp
bmNsdWRlOiB4ODYncyBhcGVyZi9tcGVyZiwgYW5kIEFSTTY0J3MgQU1VIHdpdGgKPiA+ID4gPiBy
ZWdpc3RlcnMgU1lTX0FNRVZDTlRSMF9DT1JFX0VMMC9TWVNfQU1FVkNOVFIwX0NPTlNUX0VMMC4K
PiA+ID4gPgo+ID4gPiA+IEhvd2V2ZXIsIHdlIGtub3cgdGhhdCBDU1JfVElNRSBpbiB0aGUgY3Vy
cmVudCBjb2RlIGRvZXMgY291bnQgZHVyaW5nCj4gPiA+ID4gV0ZJLiBTbywgaXMgdGhpcyBkZXNp
Z24gdW5yZWFzb25hYmxlPwo+ID4gPiA+Cj4gPiA+ID4gU2hvdWxkIHdlIGNvbnNpZGVyIHByb3Bv
c2luZyBhbiBleHRlbnNpb24gdG8gc3VwcG9ydCBzdWNoIGEgZGVkaWNhdGVkCj4gPiA+ID4gY291
bnRlciAoYSByZWZlcmVuY2UgY2xvY2sgdGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKT8g
VGhpcyB3YXksCj4gPiA+ID4gdGhlIHZhbHVlIGNhbiBiZSBvYnRhaW5lZCBkaXJlY3RseSBpbiBT
LW1vZGUgd2l0aG91dCB0cmFwcGluZyB0bwo+ID4gPiA+IE0tbW9kZSwgZXNwZWNpYWxseSBzaW5j
ZSByZWFkaW5nIHRoaXMgY291bnRlciBpcyB2ZXJ5IGZyZXF1ZW50Lgo+ID4gPiA+Cj4gPiA+IEhp
IFl1bmh1aSwKPiA+ID4KPiA+ID4gWWVzLCBidXQgd2UgYW50aWNpcGF0ZWQgdGhhdCB2ZW5kb3Jz
IG1pZ2h0IGRlZmluZSB0aGVpciBvd24gY3VzdG9tIENTUnMuCj4gPiA+IFNvLCB3ZSBpbnRyb2R1
Y2VkIEZGSCBlbmNvZGluZyB0byBhY2NvbW1vZGF0ZSBzdWNoIGNhc2VzLgo+ID4gPgo+ID4gPiBU
aGFua3MsCj4gPiA+IFN1bmlsCj4gPgo+ID4gQXMgbWVudGlvbmVkIGVhcmxpZXIsIGl0IGlzIGJl
c3QgdG8gZGlyZWN0bHkgcmVhZCBDU1JfWFhYIChhIHJlZmVyZW5jZQo+ID4gY2xvY2sgdGhhdCBk
b2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKSBhbmQgQ1NSX0NZQ0xFIGluIFMtbW9kZSwgcmF0aGVy
Cj4gPiB0aGFuIHRyYXBwaW5nIHRvIFNCSS4KPiA+Cj4gTm8uIEkgbWVhbnQgZGlyZWN0IENTUiBh
Y2Nlc3MgaXRzZWxmIG5vdCBTQkkuIFBsZWFzZSB0YWtlIGEgbG9vayBhdAo+IFRhYmxlIDYgb2Yg
UklTQy1WIEZGSCBzcGVjLgo+Cj4gPiBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGlzIGEgZ2Vu
ZXJpYyBkcml2ZXIgdGhhdCBpcyBub3Qgc3BlY2lmaWMgdG8KPiA+IGFueSB2ZW5kb3IuIEN1cnJl
bnRseSwgdGhlIHVwc3RyZWFtIGNvZGUgYWxyZWFkeSB1c2VzIENTUl9USU1FLCBhbmQKPiA+IHRo
ZSBsb2dpYyBvZiBDU1JfVElNRSBpcyBpbmNvcnJlY3QuCj4gPgo+IENTUl9USU1FIGlzIGp1c3Qg
YW4gZXhhbXBsZS4gSXQgaXMgdXB0byB0aGUgdmVuZG9yIGhvdyBfQ1BDIG9iamVjdHMgYXJlCj4g
ZW5jb2RlZCB1c2luZyBGRkguIFRoZSBsaW51eCBjb2RlIGRvZXNuJ3QgbWVhbiBvbmUgc2hvdWxk
IHVzZSBDU1JfVElNRQo+IGFsd2F5cy4KCkZpcnN0LCB0aGUgZXhhbXBsZSBvZiBDU1JfVElNRSBp
cyBpbmNvcnJlY3QuIFdoYXQgaXMgbmVlZGVkIGlzIGEKQ1NSX1hYWCAoYSByZWZlcmVuY2UgY2xv
Y2sgdGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKS4KClNlY29uZCwgeW91IG1lbnRpb25l
ZCB0aGF0IGVhY2ggdmVuZG9yIGNhbiBjdXN0b21pemUgdGhlaXIgb3duCmltcGxlbWVudGF0aW9u
cy4gQnV0IHNob3VsZCBhbGwgdmVuZG9ycycgQ1NSX1hYWC9ZWVkvLi4uIGJlIGFkZGVkIHRvCmRy
aXZlcnMvYWNwaS9yaXNjdi9jcHBjLmM/IFNob3VsZG7igJl0IGRyaXZlcnMvYWNwaS9yaXNjdi9j
cHBjLmMgZmFsbAp1bmRlciB0aGUgc2NvcGUgZGVmaW5lZCBieSB0aGUgUklTQy1WIGFyY2hpdGVj
dHVyZT8KCj4KPiA+IEl0IHdvdWxkIGJlIGJlc3QgdG8gcHJvbW90ZSBhIHNwZWNpZmljYXRpb24g
dG8gc3VwcG9ydCBDU1JfWFhYLCBqdXN0Cj4gPiBsaWtlIHdoYXQgaGFzIGJlZW4gZG9uZSBmb3Ig
eDg2IGFuZCBhcm02NC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gPgo+IFdvdWxkbid0IGFib3ZlIHdv
cms/IEZvciBhIHN0YW5kYXJkIGV4dGVuc2lvbiwgeW91IG1heSBoYXZlIHRvIHByb3ZpZGUKPiBt
b3JlIGRhdGEgd2l0aCBhY3R1YWwgSFcuCgpUaGlzIHdvbuKAmXQgd29yay4gTWF5IEkgYXNrIGhv
dyB0aGUgY3VycmVudCB1cHN0cmVhbSBjb2RlIGNhbiBjYWxjdWxhdGUKdGhlIGFjdHVhbCBDUFUg
ZnJlcXVlbmN5IHVzaW5nIENTUl9USU1FIHdpdGhvdXQgdHJhcHBpbmcgdG8gU0JJPwpUaGlzIGlz
IGEgdGhlb3JldGljYWwgbG9naWNhbCBpc3N1ZS4gV2h5IGlzIGRhdGEgbmVlZGVkIGhlcmU/CgpD
b3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlICJBTVUgZXZlbnRzIGFuZCBldmVudCBudW1iZXJz
IiBjaGFwdGVyIGluCnRoZSBBUk02NCBtYW51YWw/CgoKPgo+IFRoYW5rcywKPiBTdW5pbAoKVGhh
bmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
