Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D11CAC5B0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 22:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgl28HKWLjmloCWx/fcknO/rBfqFp8PCnMxXTnrY10o=; b=cLF2DtaOy1qLH3
	SVlKbtZ1trXAqY0TacbkkAlwe1CZXldSlIhXMuSx/zjU2hd3xDjixCdU+DTdxBvN55tMmJkL067Xn
	F9cZp7GGULoiXS+OjM6HyRUBqPfRYQLdSnuayAYZuGkQ8A1/cXxRGMYRcXqW266bFow0s5iMohDVL
	OwBiSLm0ovnNJFP6kgB/Pg4ldLfguXRaJqUOQrLD38KK6FthkV1V4UnHjlcO+fbUIWS0fFjdbroOT
	UFU0rQWtHgEgsefVEcU5auRCA3nw69iCnP/DUzZfXOVdIsYqnB9lY9FeUJNinBOAE2owxVkt6Q3pF
	TWTO8JiJ6Z9H6N6Y5zdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Mmh-00000003adL-1WHc;
	Mon, 29 Sep 2025 22:55:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Mme-00000003abY-361A
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 22:55:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-780292fcf62so4023386b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 15:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759186547; x=1759791347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwi2YKfcBmpXzN2h2HKSfYkQo0+gXnuV1TKOkK9JPg=;
        b=BxjdYvDcgqGF0NPXRPYsUtW1GiIaPa6CA/rpLDy3Q0jQP5lgFnK86rmbw8zOkApAuA
         WBkxjpQEr5/0l6FaXEj0fq+nz1OGDcgrw90QBGD8lerYrRnZwNObGOZqkKkGEPUEM8Y9
         /8jV99nRLz57FnwwNcFXKdPAs3Hp/afw7w1SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759186547; x=1759791347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWwi2YKfcBmpXzN2h2HKSfYkQo0+gXnuV1TKOkK9JPg=;
        b=BzWGF5apXIbqqeriY1/og4SsBFuHo7OzRmWGFKZ5cdkXJbIWZov038RSmmZ5mgrjG9
         l6hbvjbrisi63oIxfk1KpDKcl0rSF28yprjLkCEcMHZQOc7bBjfP6EL8DhQFSVM0uowB
         KaTduZXJRUI2Xg8j2Z/GsBf/HprMQdHm6nmB8lryd62O2g4ep03QB2gS1rT0RyRIzCz2
         1R7lFOaGI77CW8zk3KK6U9DmNg0Vhg59nyriMXm9kAMV1Z0BZuVt5BEmku0uzBCbLza3
         IcAef7LnNoL/zRH3/3/Cj0Rd5ZE1Jo+fOIFrX8qexEBf9BRuNZPz0jkb9ggu3MUsfkXL
         f5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtNRSKjAANkpqEMbIS+GtY8H7c8U6AURMWoljcAy1dx0rfDP2gP4ahU3tMpjs10G2Yi07JYgwcPCyQbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7kzdUYgGkk3YDiFkqbDL25HQFHz07/m6BpPGvPC8KMjIHePMb
	iTKOASZZDs8doie/FJXVIe7PM6lpY1fVg4SukBoxqKHue1xkiUqv8vEfdDATYtYcdW66fof+g+v
	+b6I=
X-Gm-Gg: ASbGncsjPCqZ2PlxDpP5aR3NLpsIwuMX2Uy+kF6zK3vkF7o5hNvsZRdzNat/L1aA8wO
	OquSr7wA701Z83mkq1iu2aN3B65rQvlM+EwvGJqh0eWmTRDKARPK2aY4wyHn+4vwQgZzHpr7FoW
	Q1HcqhY6fEJGONnC955Ey8FqKU0SOOKAI5o9W9+XTk9jLRXHE7ZV8UqYPmWs54LpbpnjPZnV4bb
	vnZbJI8sXZt6/Qx3dpkjBvYUf1YXJkXh5j91ix44g/vAMU94bD8sN9mxuUieapve2+vkun5DtGB
	g+nZDEKQnzoW4JLUjjup68pzkGvQLgNwYEliNp8MEsvrIg62+JIKS4f/ixmECLRUVp3XaPxCB/T
	NzhrVNppgIhoEHXqkanIb5jLDNmRThhq6j+iFdiw/1NTjFuJQSdMiM0zUuWFrb+8bVw==
X-Google-Smtp-Source: AGHT+IFmPoU9grfTe83lrQ6bnHfZOYSOqEah+UYuHeKZjoUvWS7V9jpLE2MHvbMs9sOxhYM7B9Ihog==
X-Received: by 2002:a05:6a21:a8a:b0:2fa:52a0:e838 with SMTP id adf61e73a8af0-2fa52a0e86bmr14690626637.36.1759186546702;
        Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-783ad5e988csm4788732b3a.18.2025.09.29.15.55.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d2c35c459so42225855ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMFnYTjwPkqpo+Cx/cEZKZ/7pLeJ3ZKtm4NQN7iAaGssckHDYcIizB5sfRfSCI68JroxnM6eyiapkFUg==@lists.infradead.org
X-Received: by 2002:a17:903:2291:b0:27e:dc53:d222 with SMTP id
 d9443c01a7336-27edc53d5ddmr177688785ad.44.1759186545584; Mon, 29 Sep 2025
 15:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com> <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
In-Reply-To: <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 15:55:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
X-Gm-Features: AS18NWAnKZZMEtwxIM0YbV4Mazpr4rnQGlLmvr3-cqjcbEOsSH_1wE2lEHBVzYs
Message-ID: <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_155552_781860_5A5EF079 
X-CRM114-Status: GOOD (  39.91  )
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

SGksCgpPbiBTYXQsIFNlcCAyNywgMjAyNSBhdCA3OjM44oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgRG91ZywKPgo+IE9uIFNhdCwgU2VwIDI3
LCAyMDI1IGF0IDQ6NTjigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDI6Mzfi
gK9BTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEhpIERvdWcsCj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDQ6MDDigK9B
TSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gSGksCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCAxOjQ44oCv
QU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Nw
dV9wbS5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ID4gPiA+ICAj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L25taS5o
Pgo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9wZXJmL2FybV9wbXUuaD4KPiA+ID4gPiA+ICAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC9j
bG9jay5oPgo+ID4gPiA+ID4gQEAgLTY5NiwxMCArNjk3LDEyIEBAIHN0YXRpYyBpbnQgYXJtcG11
X2dldF9jcHVfaXJxKHN0cnVjdCBhcm1fcG11ICpwbXUsIGludCBjcHUpCj4gPiA+ID4gPiAgICAg
ICAgIHJldHVybiBwZXJfY3B1KGh3X2V2ZW50cy0+aXJxLCBjcHUpOwo+ID4gPiA+ID4gIH0KPiA+
ID4gPiA+Cj4gPiA+ID4gPiAtYm9vbCBhcm1fcG11X2lycV9pc19ubWkodm9pZCkKPiA+ID4gPiA+
ICsjaWZkZWYgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRgo+ID4gPiA+ID4gK2Jvb2wg
YXJjaF9wZXJmX25taV9pc19hdmFpbGFibGUodm9pZCkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAg
ICAgICAgIHJldHVybiBoYXNfbm1pOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ICsjZW5kaWYKPiA+
ID4gPgo+ID4gPiA+IFNob3VsZCB0aGUgcHJldmlvdXMgY29tbWVudCBtb3ZlIGhlcmUsIEFLQToK
PiA+ID4gPgo+ID4gPiA+IC8qCj4gPiA+ID4gICogaGFyZGxvY2t1cF9kZXRlY3Rvcl9wZXJmX2lu
aXQoKSB3aWxsIHN1Y2Nlc3MgZXZlbiBpZiBQc2V1ZG8tTk1JIHR1cm5zIG9mZiwKPiA+ID4KPiA+
ID4gT2theSwgd2UgYWxzbyBuZWVkIHRvIGNoYW5nZSBpdCB0byDigJx3YXRjaGRvZ19oYXJkbG9j
a3VwX3Byb2JlKCnigJ0KPiA+ID4KPiA+ID4gPiAgKiBob3dldmVyLCB0aGUgcG11IGludGVycnVw
dHMgd2lsbCBhY3QgbGlrZSBhIG5vcm1hbCBpbnRlcnJ1cHQgaW5zdGVhZCBvZgo+ID4gPiA+ICAq
IE5NSSBhbmQgdGhlIGhhcmRsb2NrdXAgZGV0ZWN0b3Igd291bGQgYmUgYnJva2VuLgo+ID4gPiA+
ICovCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IGluaXRfd2F0
Y2hkb2dfZnJlcV9ub3RpZmllcih2b2lkKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgICAg
cmV0dXJuIGNwdWZyZXFfcmVnaXN0ZXJfbm90aWZpZXIoJndhdGNoZG9nX2ZyZXFfbm90aWZpZXIs
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVUZS
RVFfUE9MSUNZX05PVElGSUVSKTsKPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgeW91IG5lZWQgdG8g
ZG8gc29tZXRoaW5nIHRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZyBvbiBhbnkKPiA+ID4g
PiBwbGF0Zm9ybXMgdGhhdCBvdmVycmlkZSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSwgcmln
aHQ/IFRoZXNlCj4gPiA+ID4gY3B1ZnJlcSBub3RpZmllcnMgd2lsbCBiZSB1c2VsZXNzIGluIHRo
YXQgY2FzZS4uLgo+ID4gPgo+ID4gPiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBub3QgYSBwcm9ibGVt
LiB3YXRjaGRvZ19wZXJmIHVzZXMKPiA+ID4gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTLCB3aGlj
aCBtZWFucyBpdCBpcyBpbmhlcmVudGx5IGxpbWl0ZWQgYnkgdGhlCj4gPiA+IENQVSdzIG1haW4g
ZnJlcXVlbmN5LiBBZnRlciB3ZSBtYWtlIHN1Y2ggYSBjaGFuZ2UsIGEgbGFyZ2VyIHZhbHVlIG1h
eQo+ID4gPiBiZSB1c2VkIGFzIHRoZSBwZXJpb2QsIHNvIHRoZSBOTUkgcGVyaW9kIHdpbGwgYmVj
b21lIGxvbmdlciwgYnV0IHRoaXMKPiA+ID4gdmFsdWUgd2lsbCBub3QgY2hhbmdlIGFmdGVyIHRo
ZSBzeXN0ZW0gc3RhcnRzLgo+ID4KPiA+IEknbSBub3Qgc3VyZSBJIGZvbGxvdy4gT24geDg2LCBo
d19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSBpczoKPiA+Cj4gPiB1NjQgaHdfbm1pX2dldF9zYW1w
bGVfcGVyaW9kKGludCB3YXRjaGRvZ190aHJlc2gpCj4gPiB7Cj4gPiAgIHJldHVybiAodTY0KShj
cHVfa2h6KSAqIDEwMDAgKiB3YXRjaGRvZ190aHJlc2g7Cj4gPiB9Cj4KPiBJIGhhdmUgYWRkZWQg
dGhlIG1haW50YWluZXJzIGZvciBhcmNoL3g4Ni4KPgo+IDEuIGNwdV9raHogY2FuIGJlIHVuZGVy
c3Rvb2QgYXMgcmV0dXJuaW5nIHRoZSBiYXNlIG9wZXJhdGluZyBmcmVxdWVuY3kKPiBvZiBhIENQ
VSwgc3VjaCBhcyAyLjNHSHouIEluIHByYWN0aWNlLCB0aGUgQ1BVJ3MgY29yZSBmcmVxdWVuY3kg
bWF5Cj4gZG93bmNsb2NrIHRvIDgwME1IeiB1bmRlciBsb3cgbG9hZCBhbmQgb3ZlcmNsb2NrIHRv
IDQuNEdIeiB1bmRlciBoaWdoCj4gbG9hZC4KPgo+IDIuIEJlY2F1c2UgdGhlIGV2ZW50IHByb3Zp
ZGVkIHRvIHRoZSBQTVUgaGFzIHRoZQo+IFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUyBhdHRyaWJ1
dGUsIGFuZCB0aGUgY291bnRlcidzIHZhbHVlIGlzIGJhc2VkCj4gb24gMi4zR0h6LCB0aGUgZXhl
Y3V0aW9uIGN5Y2xlIG9mIHdhdGNoZG9nX292ZXJmbG93X2NhbGxiYWNrKCkgaXMgbm90Cj4gZml4
ZWQ7IGl0IHZhcmllcyB3aXRoIHRoZSBDUFUncyBjb3JlIGZyZXF1ZW5jeS4gV2hlbiB0aGUgQ1BV
IHJ1bnMgYXQgYQo+IGZyZXF1ZW5jeSBoaWdoZXIgdGhhbiAyLjNHSHosIHRoZSBOTUkgY3ljbGUg
d2lsbCBzaG9ydGVuOyBvdGhlcndpc2UsCj4gaXQgd2lsbCBsZW5ndGhlbi4KPgo+IDMuIEFmdGVy
IG91ciBtb2RpZmljYXRpb24sIGlmIHRoZSBhcmNoaXRlY3R1cmUgaXMgbm90IGludGVncmF0ZWQg
d2l0aAo+IGNwdWZyZXEsIGl0IHJldHVybnMgMCBhbmQgd2lsbCBub3QgdXBkYXRlIHRoZSBjeWNs
ZS4gSWYgaW50ZWdyYXRlZAo+IHdpdGggY3B1ZnJlcSwgaXQgcmV0dXJucyB0aGUgbWF4aW11bSBm
cmVxdWVuY3kgc3VwcG9ydGVkIGJ5IHRoZSBDUFUsCj4gc28gdGhlIE5NSSBjeWNsZSBpcyBvbmx5
IHNsaWdodGx5IGxlbmd0aGVuZWQsIHdpdGggbm8gaW1wYWN0IG9uIHRoZQo+IGFjdHVhbCBoYXJk
bG9ja3VwIGRldGVjdGlvbiBmdW5jdGlvbi4KPgo+IDQuIEkgaGF2ZSBhbHNvIGNvbmR1Y3RlZCB0
ZXN0czoKPiBzdHJlc3MtbmcgLS1jcHUgMSAtLXRhc2tzZXQgMSAtLWNwdS1sb2FkIDgwCj4gZWNo
byA4MDAwMDAgPiBzY2FsaW5nX21heF9mcmVxCj4gdHVyYm9zdGF0IHNob3dzIHRoYXQgQnp5X01I
eiBhbmQgVFNDX01IeiBhcmUgODAwIGFuZCAyMzAwIHJlc3BlY3RpdmVseS4KPiBBbmQgdGhlIE5N
SSBjeWNsZSBiZWNhbWUgYXBwcm94aW1hdGVseSAzMCBzZWNvbmRzOgo+IFsgMjMwOS40NDI3NDNd
IE5NSSB3YXRjaGRvZzogLS0tLS0tIHdhdGNoZG9nIG92ZXJmbG93IGNhbGxiYWNrLCBjcHUgPSAx
Cj4gWyAyMzQxLjUyNjAzMl0gTk1JIHdhdGNoZG9nOiAtLS0tLS0gd2F0Y2hkb2cgb3ZlcmZsb3cg
Y2FsbGJhY2ssIGNwdSA9IDEKCldoZXRoZXIgb3Igbm90IGhhdmluZyB4ODYgYW5kIHBvd2VycGMg
c3RhcnQgbG9va2luZyBhdCBjcHVmcmVxIGlzIGFuCmltcHJvdmVtZW50LCBjZXJ0YWlubHkgaXQg
aXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3IsIHJpZ2h0PyBJZiB3ZSdyZQpyZWFsbHkgY2hhbmdpbmcg
dGhlIGJlaGF2aW9yIGhlcmUgdGhlbiB0aGUgY29tbWl0IHN1YmplY3QgYW5kIGNvbW1pdAptZXNz
YWdlIG5lZWQgdG8gbWVudGlvbiB0aGlzLiBSaWdodCBub3cgdGhpcyBpcyBiaWxsZWQgYXMgYSBz
aW1wbGUKcmVuYW1lLi4uCgpJIGRvbid0IHBlcnNvbmFsbHkgaGF2ZSBsb3RzIG9mIGV4cGVyaWVu
Y2Ugd2l0aCB4ODYgY3B1ZnJlcSBidXQgSSBkbwprbm93IGl0IGRvZXNuJ3Qgd29yayBxdWl0ZSB0
aGUgc2FtZSBhcyBob3cgaXQgZG9lcyBvbiBhcm0uIEl0IHdvdWxkCmRlZmluaXRlbHkgYmUgZ29v
ZCB0byBnZXQgc29tZW9uZSBvbiB4ODYgLyBwb3dlcnBjIHRvIG1ha2Ugc3VyZSB0aGF0CnRoZXkg
YXJlIGhhcHB5IHdpdGggdGhpcy4gLi4ub3IgeW91IGp1c3Qga2VlcCBtYWtpbmcgaXQgd29yayB0
aGUgd2F5Cml0IGRpZCBiZWZvcmUgYW5kIHRoZW4geW91IGRvbid0IGhhdmUgdG8gd29ycnkgYWJv
dXQgZ2V0dGluZyBhbnkKYnV5LWluIGZyb20geDg2IC8gcG93ZXJwYyBmb2xrcy4gVXAgdG8geW91
LCBJIGd1ZXNzLgoKTm90ZSB0aGF0IGZvbGtzIG9uIHg4NiBoYXZlIGRlZmluaXRlbHkgaGFkIHRv
IGRlYWwgd2l0aCB0dXJibyBtb2RlCmJlZm9yZS4gIFNlZSBjb21taXQgN2VkYWViNjg0MWRmICgi
a2VybmVsL3dhdGNoZG9nOiBQcmV2ZW50IGZhbHNlCnBvc2l0aXZlcyB3aXRoIHR1cmJvIG1vZGVz
IikuCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
