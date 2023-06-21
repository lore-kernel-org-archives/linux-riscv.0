Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B9EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saBp1G2+Mdi9UCxRm/xIRo86wdqjucYMNizG7X6n4bA=; b=rAP70r3TR8zcNd
	ash6uy5c/uNnx9C1CDuX6cFomuTljN413iu29LeU4UKQXIQWmPBBe4vyYf4xU11oqvffTfMR8toJW
	hGJQJHcwBvrzXsHQafoge9Lo9Mq33WyQUa+srRZ2fSvO9K2OBmtCLa6FlrZ6aid+Vc5X0wvWr17JK
	h7HnPEyqHUILFrOeQbdHWtW8xk0TPf52ADvWYS4dKy+VALc+1tbO7GaF0jcYY+892smpVlYIFNbBv
	vJv1/lwGnYTrpCcA2/edb8m/4N5GxwgieUhcxkhAf1B9kCqaHkH8CpvhsJ1jJG0CP9/fiMGIF9Cm3
	QNRmSEyd6LI8pPX0xUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsI7-00DYKm-0e;
	Wed, 21 Jun 2023 07:30:11 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsI2-00DYIS-2p
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 07:30:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98cd280cf94so30409866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687332604; x=1689924604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZmyDfnK9tJh8eswYvjmWTei7tQJVIfXBxXoVL4SG7R8=;
        b=AErp9BkT1HOnQXLDaZG2ZhhgiFqoujRXuDRZ6mNMc66uo4iADPH8ND6vVT11LgrTTL
         AylPEuDYLAbzHcWd6s9RIjOsgstMtxC5b9BLtSsAOyK2HGqgHC3fff3Y4oZ7Y6VrxRlb
         xSE2jauM8NDE34EUg1l7tNFFj85RKWqV6X4jlUmegTW9fKm1MGIzqBLlvT7Dk2psnP4Y
         8HbScXfthtVm8E5V+taPq0gF55iLE02AnUSQSRYRIhOz37xoTjciAU4olKLgmAwzKjUw
         VAxO82NHkTCDWNCuSI/RyrXR9+cfwhF5scfDxoKd+zT2dCML+89Tp+fKPi19rwUbwudh
         B7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332604; x=1689924604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmyDfnK9tJh8eswYvjmWTei7tQJVIfXBxXoVL4SG7R8=;
        b=HUnXrH0LhYfh1dmxU+sYC1ZFQ9SuY/GphSDrGfehWNRbyXhtnbWxRUtIin956Gcxkh
         Rk28EVMYmNcntlX2y3qNbGJ+Z7WjpfMa3OvEY0QT1Irj6nmCMysD6lbRUpzZA8Y8mcix
         eLhcFLrKWxwewpX0+YVucMmy05FHyh2wPpxcpUsfDKw2gE6v5SXeQS+V8fVWeg+EYlGT
         Y/D3bKdVOHI16ye95xJRP8GNifL7ux591FAmp6wF/KFQHe5QWyDut5iAX4FlUV1PPiDf
         UXiaUrUdRp4U5PjpZoyMMEN/+AMCcdQ5tWLrplDki6YowISMbEzygxiY3WrPrsBVa22k
         dTHw==
X-Gm-Message-State: AC+VfDxIt7ay/uoUkYqY8/AwYwThULk2yqzC+DdSX2XDrFrJmcHalzVM
	hb4VBS006WCdZgDw90rF+IDWOA==
X-Google-Smtp-Source: ACHHUZ71iRvfbRckg3Spoocjgf5Ljr6HcH7QnRCM6WqfLPyHhFnJWAR3zMooBAb60KO2iMTWfdWlMw==
X-Received: by 2002:a17:906:9b88:b0:988:8fed:8ae9 with SMTP id dd8-20020a1709069b8800b009888fed8ae9mr7743704ejc.37.1687332604526;
        Wed, 21 Jun 2023 00:30:04 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n17-20020a17090625d100b00988c6ac6b86sm2631710ejb.186.2023.06.21.00.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:30:03 -0700 (PDT)
Date: Wed, 21 Jun 2023 09:30:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
Message-ID: <20230621-37ea9461250036cc2ec8c544@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com>
 <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel>
 <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
 <20230620-95ce8ab70956a72b9da3a31a@orel>
 <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_003006_939239_15059860 
X-CRM114-Status: GOOD (  33.13  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDk6NTU6MTNBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNjo0NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0
IDA2OjA1OjU5UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiBPbiBGcmksIEp1biA5LCAy
MDIzIGF0IDk6MzXigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3
cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgSnVuIDA5LCAyMDIzIGF0IDEwOjEyOjE4QU0g
KzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgdmNwdV9yZWdf
bGlzdCBhaWFfY29uZmlnID0gewo+ID4gPiA+ID4gKyAgICAgLnN1Ymxpc3RzID0gewo+ID4gPiA+
ID4gKyAgICAgQkFTRV9TVUJMSVNULAo+ID4gPiA+ID4gKyAgICAgQUlBX1JFR1NfU1VCTElTVCwK
PiA+ID4gPiA+ICsgICAgIHswfSwKPiA+ID4gPiA+ICsgICAgIH0sCj4gPiA+ID4gPiArfTsKPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IHZjcHVfcmVnX2xpc3QgZnBfZl9kX2Nv
bmZpZyA9IHsKPiA+ID4gPiA+ICsgICAgIC5zdWJsaXN0cyA9IHsKPiA+ID4gPiA+ICsgICAgIEJB
U0VfU1VCTElTVCwKPiA+ID4gPiA+ICsgICAgIEZQX0ZfUkVHU19TVUJMSVNULAo+ID4gPiA+ID4g
KyAgICAgRlBfRF9SRUdTX1NVQkxJU1QsCj4gPiA+ID4gPiArICAgICB7MH0sCj4gPiA+ID4gPiAr
ICAgICB9LAo+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RydWN0IHZjcHVf
cmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ID4gPiA+ID4gKyAgICAgJnppY2JvX2NvbmZp
ZywKPiA+ID4gPiA+ICsgICAgICZhaWFfY29uZmlnLAo+ID4gPiA+ID4gKyAgICAgJmZwX2ZfZF9j
b25maWcsCj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICtpbnQgdmNwdV9jb25maWdzX24gPSBBUlJB
WV9TSVpFKHZjcHVfY29uZmlncyk7Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi4zNC4xCj4gPiA+
ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSSBzZWUgd2UgaGF2ZSBhIGJpdCBvZiBhIHByb2JsZW0gd2l0
aCB0aGUgY29uZmlncyBmb3IgcmlzY3YuIFNpbmNlIHdlCj4gPiA+ID4gZG9uJ3QgZGlzYWJsZSBh
bnl0aGluZyB3ZSdyZSBub3QgdGVzdGluZywgdGhlbiBmb3IgYW55IHRlc3QgdGhhdCBpcwo+ID4g
PiA+IG1pc3NpbmcsIGZvciBleGFtcGxlLCB0aGUgZiBhbmQgZCByZWdpc3RlcnMsIHdlJ2xsIGdl
dCBvdXRwdXQgbGlrZQo+ID4gPiA+ICJUaGVyZSBhcmUgNjYgbmV3IHJlZ2lzdGVycy4gQ29uc2lk
ZXIgYWRkaW5nIHRoZW0gdG8gdGhlIGJsZXNzZWQgcmVnCj4gPiA+ID4gbGlzdCB3aXRoIHRoZSBm
b2xsb3dpbmcgbGluZXM6IiBhbmQgdGhlbiBhIGR1bXAgb2YgYWxsIHRoZSBmIGFuZCBkCj4gPiA+
ID4gcmVnaXN0ZXJzLiBUaGUgdGVzdCBkb2Vzbid0IGZhaWwsIGJ1dCBpdCdzIG1lc3N5IGFuZCBj
b25mdXNpbmcuIElkZWFsbHkKPiA+ID4gPiB3ZSdkIGRpc2FibGUgYWxsIHJlZ2lzdGVycyBvZiBh
bGwgc3VibGlzdHMgbm90IGluIHRoZSBjb25maWcsIHByb2JhYmx5Cj4gPiA+ID4gYnkgc3RhcnRp
bmcgYnkgZGlzYWJsaW5nIGV2ZXJ5dGhpbmcgYW5kIHRoZW4gb25seSByZWVuYWJsaW5nIHRoZSBv
bmVzCj4gPiA+ID4gaW4gdGhlIGNvbmZpZy4KPiA+ID4gPgo+ID4gPiA+IEFueXRoaW5nIHRoYXQg
Y2FuJ3QgYmUgZGlzYWJsZWQgaXMgZWl0aGVyIGEgS1ZNIGJ1ZywgaS5lLiB3ZSBzaG91bGQKPiA+
ID4gPiBiZSBhYmxlIHRvIGRpc2FibGUgaXQsIGJlY2F1c2Ugd2UgY2FuJ3QgZXhwZWN0IGV2ZXJ5
IGhvc3QgdG8gaGF2ZSBpdCwKPiA+ID4gPiBvciBpdCBuZWVkcyB0byBiZSBpbiB0aGUgYmFzZSBy
ZWdpc3RlciBzdWJsaXN0IChtZWFuaW5nIGV2ZXJ5IGhvc3QKPiA+ID4gPiB3aWxsIGFsd2F5cyBo
YXZlIGl0KS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBISSBBbmRyZXcsCj4gPiA+Cj4gPiA+IEkgZm91
bmQgc2V2ZXJhbCBtdWx0aS1sZXR0ZXJzIElTQSBFWFQoQUlBL1NTVEMgZXRjKSB3ZXJlIG5vdCBh
bGxvd2VkCj4gPiA+IHRvIGJlIGRpc2FibGVkLgo+ID4gPiBJcyBpdCBhIGJ1Zz8gc2hhbGwgd2Ug
Zml4IGl077yfCj4gPgo+ID4gRXh0ZW5zaW9ucyB0aGF0IGEgZ3Vlc3QgY291bGQgdXNlIChyZWdh
cmRsZXNzIG9mIHdoZXRoZXIgb3Igbm90IHRoZSBob3N0Cj4gPiBkZXNjcmliZWQgaXQgaW4gdGhl
IGd1ZXN0J3MgaXNhIHN0cmluZyksIGJlY2F1c2UgdGhlIGluc3RydWN0aW9ucyBvciBDU1IKPiA+
IGFjY2Vzc2VzIGRvbid0IHRyYXAsIGNhbid0IHRydWx5IGJlIGRpc2FibGVkLiBTbywgaXQncyBu
b3QgYSBidWcgdG8KPiA+IHByb2hpYml0IGRpc2FibGluZyB0aGVtIGFuZCBpbmRlZWQgdGhlIHRl
c3QgY2FzZXMgc2hvdWxkIGFjdHVhbGx5IGVuc3VyZQo+ID4gZGlzYWJsaW5nIHRoZW0gZmFpbHMu
Cj4gPgo+IAo+IFNvIHRoZXNlIGtpbmRzIG9mIElTQV9FWFRfKiByZWdzIHNob3VsZCBiZSBpbiB0
aGUgYmFzZSByZWcgbGlzdCwgcmlnaHQ/Cj4KCkFoLCB0aGlzIGlzIGdldHRpbmcgYSBiaXQgbWVz
c3kuIFdlIGRvbid0IHdhbnQgYWxsIHRoZXNlIGV4dGVuc2lvbnMgaW4gYQoiYmFzZSIsIHdoaWNo
IHJlcHJlc2VudHMgZXh0ZW5zaW9ucyBmb3IgYWxsIHBvc3NpYmxlIGhvc3RzLCBiZWNhdXNlIHRo
ZQpleHRlbnNpb25zIGFyZSBvcHRpb25hbCwgYnV0LCB3ZSBjYW4ndCByZW1vdmUgdGhlbSBmcm9t
IGdldC1yZWctbGlzdApvdXRwdXQgYnkgZGlzYWJsaW5nIHRoZW0sIHNpbmNlIHRoZXkgY2FuJ3Qg
YmUgZGlzYWJsZWQuIEl0IHNlZW1zIHdlCm5lZWQgdGhlIGNvbmNlcHQgb2YgImJhc2UiLCB3aGlj
aCBpcyB0aGUgY29tbW9uIHNldCBleHBlY3RlZCBvbiBhbGwgaG9zdHMsCmFuZCBhbHNvIHRoZSBj
b25jZXB0IG9mICJ0aGlzIGhvc3QncyBiYXNlIi4gSSdtIHN0cnVnZ2xpbmcgdG8gdGhpbmsgb2YK
YSBuaWNlIHdheSB0byBkZWFsIHdpdGggdGhhdC4gQSBmaXJzdCB0aG91Z2h0IGlzIHRvIGJvdGgg
YWRkIHRoZXNlIHR5cGVzCm9mIHJlZ2lzdGVycyB0byB0aGVpciBvd24gZXh0ZW5zaW9uLXNwZWNp
ZmljIHN1Ymxpc3RzIGFuZCB0byBmaWx0ZXJfcmVnKCkuCkkgdGhpbmsgdGhhdCB3aWxsIGtlZXAg
dGhlbSBmcm9tIGJlaW5nIHJlcG9ydGVkIGFzIG5ldyByZWdpc3RlcnMgaW4gZXZlcnkKdGVzdCwg
YnV0IGFsc28gYWxsb3cgZGV0ZWN0aW9uIG9mIHRoZW0gZ29pbmcgbWlzc2luZyB3aGVuIHRoZXkn
cmUKZXh0ZW5zaW9uIGlzIHByZXNlbnQuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
