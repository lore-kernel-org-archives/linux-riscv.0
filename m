Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC2EEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbM5/RPlB8GafqmLCYxwjHbqQqtJ8Fv9LDBw5Lzstic=; b=dHLYiBsSwA8eff
	wPVIGOxxHcBh9l0YWmvZGY60fwJuFVZmvgBG/qKwXW1pu+DJoIfHeR7qFxWGISzdsj3juyM8BinmG
	Ruf+89fOyYMokXWeD6k3PVAxkOebM9HCv5bcXkYIkh0SLYRW/DYLoZV8bjj8njWPnbH7e2f/uj3kg
	hj6tAnUAQKgIa15FvPzpTN1zi1NMyHjvddsknz4ZTJXL5DFo9vcjjDlKr2mBSNE8uDBbpnwQ7B7t1
	8tdtDjQbciHTd/y2nc3V4+p//DSF6ZrERARCLnygekx5nJdJOCnK0a5M/e5SEEaFTnha/3k418O2r
	eZRVjn26ylUEsE1JcMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtT5-00Dk4D-2b;
	Wed, 21 Jun 2023 08:45:35 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtT2-00Dk2t-2R;
	Wed, 21 Jun 2023 08:45:34 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b45d7ec066so61318011fa.0;
        Wed, 21 Jun 2023 01:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687337130; x=1689929130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYIw9zUPZWZ2o+QN5fG2PRt2gO03dubW8fyBAMQKZLE=;
        b=qCW19/pbsOnWIPKRDK74psGxSYvuSBgLbZKbYaLkXRj8HGXRWFkCqN6ysyA2wMI1sJ
         M6Hu+XCvThIRolfER9vvD7qSoYNTz3tVirW3vUlmab7wwpnKgtxoVWzjEA1w75vgmdaC
         zPZiauwtpHfapncsJTrYOmxGzcTKOZaIAI7qf6hWfpPBVAjNDBCSVIswVtTQsbrFTdUl
         vFZJP+LgHa3YlMETckvBWqL7D/wG/w+eIHVRbEMh11gqKkTNQiU0QhPhQP0VVbyp7fAf
         nZLmNVSvaQsw2l3vcfsWOUqoXgQ083lQn7APLu//1YLpw8Mb+mOvlFL8bvKE3ftwMG16
         VEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337130; x=1689929130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYIw9zUPZWZ2o+QN5fG2PRt2gO03dubW8fyBAMQKZLE=;
        b=P564RF+1nubZfuXcrxE6Ms0rju3Tweq4FODK9YsMGnvBqRTwZIyPu7jRlCKJsfvb89
         TaEHePWXZ/UW/98qJ3qf8xYSnSzmSLBOu3FX7RcA/YjlTu0y1S02onWtBXe9Lxhe68L3
         /xaP1sGGLdUiCW5gHHnaerNGzQoFGtA809LCAzY4gGflOlJxWW7ggeD6d3YzDPMoRUFA
         qtOtLYPTjIZw4T9BNkmoz7ipBM7uPWTeVU0zpeGdfUge39uzJQpmOr7o+sXLXKgQrgFf
         D8Itz7TF+KlzQYbeWNMH9OAAGSjS6yRF0HDP5xFS1inDy4gnVLKkRe2p+fdUS7VlLizl
         7qdg==
X-Gm-Message-State: AC+VfDyR/VTWgodGcLg5/xPWVB4yQebP/PliYbO2BaqIPvoUk/npdD4C
	NQVTMzRUvTk3yIovepc+8vJAXuFIIx3J+mUoAqo=
X-Google-Smtp-Source: ACHHUZ4BrKigQscUYyAgK2m2X7YOR2aGI6Htk1A+97xpwtjx/lbr6R6ahZTgONsoUBJEA53I5JDdW30GyqH39ENS4FU=
X-Received: by 2002:a05:651c:10b0:b0:2b4:7910:36a3 with SMTP id
 k16-20020a05651c10b000b002b4791036a3mr3026730ljn.0.1687337129513; Wed, 21 Jun
 2023 01:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel> <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
 <20230620-95ce8ab70956a72b9da3a31a@orel> <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
 <20230621-37ea9461250036cc2ec8c544@orel>
In-Reply-To: <20230621-37ea9461250036cc2ec8c544@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 21 Jun 2023 16:45:18 +0800
Message-ID: <CAJve8omtMhHvH1huOanu+UfsJLZxGnFs6=pnuZzGvm1O1wbw+g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_014532_795736_38EFB5B5 
X-CRM114-Status: GOOD (  36.12  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMzozMOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDk6NTU6
MTNBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCA2
OjQ04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDA2OjA1OjU5UE0gKzA4MDAsIEhhaWJv
IFh1IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgSnVuIDksIDIwMjMgYXQgOTozNeKAr1BNIEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4g
PiA+IE9uIEZyaSwgSnVuIDA5LCAyMDIzIGF0IDEwOjEyOjE4QU0gKzA4MDAsIEhhaWJvIFh1IHdy
b3RlOgo+ID4gPiA+ID4gPiArc3RhdGljIHN0cnVjdCB2Y3B1X3JlZ19saXN0IGFpYV9jb25maWcg
PSB7Cj4gPiA+ID4gPiA+ICsgICAgIC5zdWJsaXN0cyA9IHsKPiA+ID4gPiA+ID4gKyAgICAgQkFT
RV9TVUJMSVNULAo+ID4gPiA+ID4gPiArICAgICBBSUFfUkVHU19TVUJMSVNULAo+ID4gPiA+ID4g
PiArICAgICB7MH0sCj4gPiA+ID4gPiA+ICsgICAgIH0sCj4gPiA+ID4gPiA+ICt9Owo+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IHZjcHVfcmVnX2xpc3QgZnBfZl9kX2Nv
bmZpZyA9IHsKPiA+ID4gPiA+ID4gKyAgICAgLnN1Ymxpc3RzID0gewo+ID4gPiA+ID4gPiArICAg
ICBCQVNFX1NVQkxJU1QsCj4gPiA+ID4gPiA+ICsgICAgIEZQX0ZfUkVHU19TVUJMSVNULAo+ID4g
PiA+ID4gPiArICAgICBGUF9EX1JFR1NfU1VCTElTVCwKPiA+ID4gPiA+ID4gKyAgICAgezB9LAo+
ID4gPiA+ID4gPiArICAgICB9LAo+ID4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gPiArc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ID4gPiA+ID4g
PiArICAgICAmemljYm9fY29uZmlnLAo+ID4gPiA+ID4gPiArICAgICAmYWlhX2NvbmZpZywKPiA+
ID4gPiA+ID4gKyAgICAgJmZwX2ZfZF9jb25maWcsCj4gPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4g
PiAraW50IHZjcHVfY29uZmlnc19uID0gQVJSQVlfU0laRSh2Y3B1X2NvbmZpZ3MpOwo+ID4gPiA+
ID4gPiAtLQo+ID4gPiA+ID4gPiAyLjM0LjEKPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJIHNlZSB3ZSBoYXZlIGEgYml0IG9mIGEgcHJvYmxlbSB3aXRoIHRoZSBjb25maWdzIGZvciBy
aXNjdi4gU2luY2Ugd2UKPiA+ID4gPiA+IGRvbid0IGRpc2FibGUgYW55dGhpbmcgd2UncmUgbm90
IHRlc3RpbmcsIHRoZW4gZm9yIGFueSB0ZXN0IHRoYXQgaXMKPiA+ID4gPiA+IG1pc3NpbmcsIGZv
ciBleGFtcGxlLCB0aGUgZiBhbmQgZCByZWdpc3RlcnMsIHdlJ2xsIGdldCBvdXRwdXQgbGlrZQo+
ID4gPiA+ID4gIlRoZXJlIGFyZSA2NiBuZXcgcmVnaXN0ZXJzLiBDb25zaWRlciBhZGRpbmcgdGhl
bSB0byB0aGUgYmxlc3NlZCByZWcKPiA+ID4gPiA+IGxpc3Qgd2l0aCB0aGUgZm9sbG93aW5nIGxp
bmVzOiIgYW5kIHRoZW4gYSBkdW1wIG9mIGFsbCB0aGUgZiBhbmQgZAo+ID4gPiA+ID4gcmVnaXN0
ZXJzLiBUaGUgdGVzdCBkb2Vzbid0IGZhaWwsIGJ1dCBpdCdzIG1lc3N5IGFuZCBjb25mdXNpbmcu
IElkZWFsbHkKPiA+ID4gPiA+IHdlJ2QgZGlzYWJsZSBhbGwgcmVnaXN0ZXJzIG9mIGFsbCBzdWJs
aXN0cyBub3QgaW4gdGhlIGNvbmZpZywgcHJvYmFibHkKPiA+ID4gPiA+IGJ5IHN0YXJ0aW5nIGJ5
IGRpc2FibGluZyBldmVyeXRoaW5nIGFuZCB0aGVuIG9ubHkgcmVlbmFibGluZyB0aGUgb25lcwo+
ID4gPiA+ID4gaW4gdGhlIGNvbmZpZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbnl0aGluZyB0aGF0
IGNhbid0IGJlIGRpc2FibGVkIGlzIGVpdGhlciBhIEtWTSBidWcsIGkuZS4gd2Ugc2hvdWxkCj4g
PiA+ID4gPiBiZSBhYmxlIHRvIGRpc2FibGUgaXQsIGJlY2F1c2Ugd2UgY2FuJ3QgZXhwZWN0IGV2
ZXJ5IGhvc3QgdG8gaGF2ZSBpdCwKPiA+ID4gPiA+IG9yIGl0IG5lZWRzIHRvIGJlIGluIHRoZSBi
YXNlIHJlZ2lzdGVyIHN1Ymxpc3QgKG1lYW5pbmcgZXZlcnkgaG9zdAo+ID4gPiA+ID4gd2lsbCBh
bHdheXMgaGF2ZSBpdCkuCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSEkgQW5kcmV3LAo+ID4g
PiA+Cj4gPiA+ID4gSSBmb3VuZCBzZXZlcmFsIG11bHRpLWxldHRlcnMgSVNBIEVYVChBSUEvU1NU
QyBldGMpIHdlcmUgbm90IGFsbG93ZWQKPiA+ID4gPiB0byBiZSBkaXNhYmxlZC4KPiA+ID4gPiBJ
cyBpdCBhIGJ1Zz8gc2hhbGwgd2UgZml4IGl077yfCj4gPiA+Cj4gPiA+IEV4dGVuc2lvbnMgdGhh
dCBhIGd1ZXN0IGNvdWxkIHVzZSAocmVnYXJkbGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB0aGUgaG9z
dAo+ID4gPiBkZXNjcmliZWQgaXQgaW4gdGhlIGd1ZXN0J3MgaXNhIHN0cmluZyksIGJlY2F1c2Ug
dGhlIGluc3RydWN0aW9ucyBvciBDU1IKPiA+ID4gYWNjZXNzZXMgZG9uJ3QgdHJhcCwgY2FuJ3Qg
dHJ1bHkgYmUgZGlzYWJsZWQuIFNvLCBpdCdzIG5vdCBhIGJ1ZyB0bwo+ID4gPiBwcm9oaWJpdCBk
aXNhYmxpbmcgdGhlbSBhbmQgaW5kZWVkIHRoZSB0ZXN0IGNhc2VzIHNob3VsZCBhY3R1YWxseSBl
bnN1cmUKPiA+ID4gZGlzYWJsaW5nIHRoZW0gZmFpbHMuCj4gPiA+Cj4gPgo+ID4gU28gdGhlc2Ug
a2luZHMgb2YgSVNBX0VYVF8qIHJlZ3Mgc2hvdWxkIGJlIGluIHRoZSBiYXNlIHJlZyBsaXN0LCBy
aWdodD8KPiA+Cj4KPiBBaCwgdGhpcyBpcyBnZXR0aW5nIGEgYml0IG1lc3N5LiBXZSBkb24ndCB3
YW50IGFsbCB0aGVzZSBleHRlbnNpb25zIGluIGEKPiAiYmFzZSIsIHdoaWNoIHJlcHJlc2VudHMg
ZXh0ZW5zaW9ucyBmb3IgYWxsIHBvc3NpYmxlIGhvc3RzLCBiZWNhdXNlIHRoZQo+IGV4dGVuc2lv
bnMgYXJlIG9wdGlvbmFsLCBidXQsIHdlIGNhbid0IHJlbW92ZSB0aGVtIGZyb20gZ2V0LXJlZy1s
aXN0Cj4gb3V0cHV0IGJ5IGRpc2FibGluZyB0aGVtLCBzaW5jZSB0aGV5IGNhbid0IGJlIGRpc2Fi
bGVkLiBJdCBzZWVtcyB3ZQo+IG5lZWQgdGhlIGNvbmNlcHQgb2YgImJhc2UiLCB3aGljaCBpcyB0
aGUgY29tbW9uIHNldCBleHBlY3RlZCBvbiBhbGwgaG9zdHMsCj4gYW5kIGFsc28gdGhlIGNvbmNl
cHQgb2YgInRoaXMgaG9zdCdzIGJhc2UiLiBJJ20gc3RydWdnbGluZyB0byB0aGluayBvZgo+IGEg
bmljZSB3YXkgdG8gZGVhbCB3aXRoIHRoYXQuIEEgZmlyc3QgdGhvdWdodCBpcyB0byBib3RoIGFk
ZCB0aGVzZSB0eXBlcwo+IG9mIHJlZ2lzdGVycyB0byB0aGVpciBvd24gZXh0ZW5zaW9uLXNwZWNp
ZmljIHN1Ymxpc3RzIGFuZCB0byBmaWx0ZXJfcmVnKCkuCj4gSSB0aGluayB0aGF0IHdpbGwga2Vl
cCB0aGVtIGZyb20gYmVpbmcgcmVwb3J0ZWQgYXMgbmV3IHJlZ2lzdGVycyBpbiBldmVyeQo+IHRl
c3QsIGJ1dCBhbHNvIGFsbG93IGRldGVjdGlvbiBvZiB0aGVtIGdvaW5nIG1pc3Npbmcgd2hlbiB0
aGV5J3JlCj4gZXh0ZW5zaW9uIGlzIHByZXNlbnQuCj4KClllcywgSSB3YXMgYWxzbyBzdHVjayB3
aXRoIHRoZSBtZXNzIQoKSSB3YXMgdHJ5aW5nIG9uZSB3YXkgdG8gb25seSBpbmNsdWRlIGBkaXNh
YmxlIG5vdCBhbGxvd2VkYCByZWdzIHRvIHRoZQpiYXNlIHJlZyBsaXN0IGFuZApvbmx5IGNoZWNr
IGVycm5vIGZvciBkaXNhYmxlKHNldCAwKSBvcGVyYXRpb24uCgpJIHdpbGwgYWxzbyB0cnkgeW91
ciBzdWdnZXN0aW9uIGFuZCBsZXQgeW91IGtub3cgdGhlIHJlc3VsdHMgc29vbiEKClRoYW5rcywK
SGFpYm8KCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
