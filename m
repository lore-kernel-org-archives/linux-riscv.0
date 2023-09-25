Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B8CE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkYTpClX5XcyLkLq0Xe3fJJKPQ4Saz33wfs6ttgXoyY=; b=Ng5qOf+W+NgDxU
	+WWaeWFHtrl2xjoBjmJ7zt7q1Sg/omL7mis548uyq2kK+8UpRXkzujI+UCR6YenB3UF+KEmqM4F8I
	/+4yeReBsYLYYO32XhVwPaOi0vynlspst7RuCPKaeWc+uGUHGsuon353NjGWoycXOx0HMqWbu07Z1
	CtK0Gax3JIuit0g9G9Gx5wKKWaE951SNVtmOWDjD+yOc/GlZ6LfcagSxwtdikpZmbJuF0yLKmMYg2
	eLjqCsvkuyJBjpjAlqtA3LUGLXnP+IeNNADTBZJeVbXZLuQVk3qLBVaXuVgsDmtNwFMbh57tkAZaG
	lgGuDJifwffQVv6K7J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklgD-00ELAX-1K;
	Mon, 25 Sep 2023 13:31:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklgB-00EL9l-1E
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:31:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-578a397a30dso4992537a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695648673; x=1696253473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmJTmtECk3UTpEd/PcXzUGGmidlRTD2ZKXvirZ79/Ts=;
        b=ZBHBuc5dLTtHI85Hwe+zr2HgH4LNR+3ZPMbiepkZ3vGgvze4t4T6q49iEQVRDNijZh
         rpPym3hyp9q9V48RM68kdi3nTbaVtGEXYWVbmipamGErKAJsXndmYuvRgua8KkHrX+7h
         8FN5BxF4EH4E4YAnCoTvkA+x8btaLtoMKt4GhJxxxxt9u4taF3+/MDD/E1s1iFIj5TKx
         N2NEkF89mNcVzM63z1IbCvjnVgqrDvAyOcCsXCt5eG5T/8HzJLbkWYQpISgFXQyzHqfo
         RxEvJOWtA2sbwEAxygRVzb/JnE/MuEQJ19NRCzUch4+4j6iiVPrXhbgkRPb3svRacgz4
         cwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648673; x=1696253473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmJTmtECk3UTpEd/PcXzUGGmidlRTD2ZKXvirZ79/Ts=;
        b=k3ekZLb4WcsEkPS9Ja924wkz2A/1XNCWyHXK0X/+wvFWjpFPLv0NNClOILuYBKrtlQ
         GPoMsQ+kjoMZYdKxS7KLqOwMcyocFi+gK9bPG70zO91a/aL8eRgMKDICVJJNDFexQ+MQ
         +JRCk9CgstKeIDmp03cMXcYPyp9z2tytAYhtVTME2t0QZAsMaOnxpQ7aSRuuCV70qr88
         BLl4/x33dvHc0TK4EMgaxx33bfXE383ZwLriaF6ovXgpZHIOy0ES/Ok72oLLRftdI9Jj
         5ScrOS5eWJRsYT56d6C9YsEIgDZSJCI4NvQutysX1kmsWkP9BJsoAQzFB/SKB036ujWj
         BQbQ==
X-Gm-Message-State: AOJu0YyXJa1fUD8pQHLscvuvG84PcHauJdq7ce9Q2fZwfdvqZsOSEavq
	AxknzItXPr3DPiN2/HVk6gLp7twIYz6hsPYO3kJXNQ==
X-Google-Smtp-Source: AGHT+IGGvck9YMKSdm9ezUm/4fp6J691a817X3hV3Hdc5HpIvnPCHDNYUHsrRSX8zcRkK2XQ4QU/TA/mW0tBlTBxlcw=
X-Received: by 2002:a17:90b:4a4b:b0:26d:49c8:76d8 with SMTP id
 lb11-20020a17090b4a4b00b0026d49c876d8mr5801013pjb.18.1695648673541; Mon, 25
 Sep 2023 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-3-apatel@ventanamicro.com> <20230919-3a8fcdaa86607d0ff8399132@fedora>
In-Reply-To: <20230919-3a8fcdaa86607d0ff8399132@fedora>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Sep 2023 19:01:02 +0530
Message-ID: <CAK9=C2Wgt69Tj1U-e2eyVrpC+=JaApuKYEx56JbGJRuHn3N5gQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] RISC-V: Detect Zicond from ISA string
To: Conor Dooley <conor@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063115_420713_60296DB0 
X-CRM114-Status: GOOD (  17.84  )
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

T24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMTI6NTfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMDk6MjM6MzhBTSAr
MDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoZSBSSVNDLVYgaW50ZWdlciBjb25kaXRpb25h
bCAoWmljb25kKSBvcGVyYXRpb24gZXh0ZW5zaW9uIGRlZmluZXMKPiA+IHN0YW5kYXJkIGNvbmRp
dGlvbmFsIGFyaXRobWV0aWMgYW5kIGNvbmRpdGlvbmFsLXNlbGVjdC9tb3ZlIG9wZXJhdGlvbnMK
PiA+IHdoaWNoIGFyZSBpbnNwaXJlZCBmcm9tIHRoZSBYVmVudGFuYUNvbmRPcHMgZXh0ZW5zaW9u
LiBJbiBmYWN0LCBRRU1VCj4gPiBSSVNDLVYgYWxzbyBoYXMgc3VwcG9ydCBmb3IgZW11bGF0aW5n
IFppY29uZCBleHRlbnNpb24uCj4gPgo+ID4gTGV0IHVzIGRldGVjdCBaaWNvbmQgZXh0ZW5zaW9u
IGZyb20gSVNBIHN0cmluZyBhdmFpbGFibGUgdGhyb3VnaAo+ID4gRFQgb3IgQUNQSS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPgo+
IFNhbWUgYXBwbGllcyBoZXJlIHcuci50LiBzcGxpdHRpbmcgaW4gdHdvLgoKT2theSwgSSB3aWxs
IHVwZGF0ZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBUaGFua3MsCj4gQ29ub3IuCj4KPiA+IC0tLQo+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgfCA2ICsrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IGluZGV4IGNhZDhlZjY4ZWNh
Ny4uN2VhOTBlMmRiYzViIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gQEAgLTIyNSw2ICsy
MjUsMTIgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgICByYXRpZmllZCBpbiB0aGUgMjAx
OTEyMTMgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQQo+ID4gICAgICAgICAgICAgIHNw
ZWNpZmljYXRpb24uCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDogemljb25kCj4gPiArICAgICAg
ICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaaWNvbmQgZXh0
ZW5zaW9uIGZvciBjb25kaXRpb25hbCBhcml0aG1ldGljIGFuZAo+ID4gKyAgICAgICAgICAgIGNv
bmRpdGlvbmFsLXNlbGVjdC9tb3ZlIG9wZXJhdGlvbnMgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhm
YjY2OTQKPiA+ICsgICAgICAgICAgICAoIlVwZGF0ZSBHZW1maWxlIikgb2YgcmlzY3Ytemljb25k
Lgo+ID4gKwo+ID4gICAgICAgICAgLSBjb25zdDogemljc3IKPiA+ICAgICAgICAgICAgZGVzY3Jp
cHRpb246IHwKPiA+ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmljc3IgZXh0ZW5zaW9uIGZv
ciBjb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXIKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+
IGluZGV4IGI3ZWZlOWUyZmE4OS4uMTViYWZjMDJmZmQ0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKPiA+IEBAIC02MCw2ICs2MCw3IEBACj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pJSFBNICAgICAgICAgIDQyCj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTiAg
ICAgICAgICAgICAgNDMKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWFZFTlRBTkFDT05ET1BT
ICAgICAgICA0NAo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNPTkQgICAgICAgICA0NQo+
ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYICAgICAgICAgICAgNjQKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCAzYTMxZDM0ZmU3MDkuLjQ5YjY1NTFmMzM0NyAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMTc0LDYgKzE3NCw3IEBAIGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ID4gICAg
ICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCj4gPiAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKPiA+ICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpicywgUklTQ1ZfSVNBX0VYVF9aQlMpLAo+ID4gKyAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoemljb25kLCBSSVNDVl9JU0FfRVhUX1pJQ09ORCksCj4gPiAg
ICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9TTUFJQSksCj4g
PiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01T
VEFURUVOKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0Ff
RVhUX1NTQUlBKSwKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
