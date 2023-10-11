Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0777FCD6E67
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jRUpDge5MuJ0VuwneEwlH4/iZfWYWAWKUQ8No09Kok=; b=yOoKT5SLJggSx5
	4wKqkicU2QP94qIxacpvSNoTAQ1tm8p7iusDtZBLFH3nCm27yn/+PGPd8GguJTyB4kujuuRHyVEsF
	5OVBzUXiKyGbwxd/bI/jSL1Wq6dwiorsDL6gDWzgQCN5iXdQdn86PCV+T/y8mGViDX8tkC2E+X7jy
	goxASfsMjahmtHtPuvXXi2daQJzOmRQYmtOvVI2OF8CsEwLplw7JPH3b/R3P3MShEhIT0TfGswRoa
	1M73glzqeUTvYDAM51q7o3kRg8Td0AHonoIPaRNtfc649K48a5wuAjxGv0r0p2IVkAhfF1zr1VSEY
	UVHAG4XUBohmIb5suIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYqj-00Fudk-2c;
	Wed, 11 Oct 2023 13:02:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYqh-00Fucm-04
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:02:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-406553f6976so17417895e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697029317; x=1697634117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwgmh6+dGvGXg4dM1TwwbyonY61p5x8aIJa99FUZaaE=;
        b=GWK8q1w8oOOjqH/kXcp8KNujsaV4AtijqNymg2gqB8kBzWu22XPhn6fNN5jQKBypK/
         mv1Tb8D6AqF304Z1A8pS6Zix7YBKbqv1EypPmLgkRsY0JwJlMt7BsuzDe0FjCQbHC7Pc
         JaKRUrb+i7w1VQ5UrJjsT/1QWeK9y2j7/xcNw5NBpUrcuCiUFlp7+DBDZD3/zQQVyKfL
         oU4dSKlapanWv0icdiKUA/RLuVNYt3YaEyDStm0jKKnBW7AFuWJQ/n0BTgBK/XIdNbUU
         16MZv063++KUcHPgMUUYi6dRFoKp8lbvx16UPzcxq+WP5Pigh5LSfPl7y7LpRnz/bU1M
         rJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029317; x=1697634117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwgmh6+dGvGXg4dM1TwwbyonY61p5x8aIJa99FUZaaE=;
        b=uTxN53/fXoIoIHSXzUMW3+DQ7gonjqp/27ggs8lJyuIHx53MrzeNrS8SIlzixK8cLa
         EHMm71DE00rBoOTEmPAsp4F4sBMSjCwY8LI5hLXRWfc0cb9f5+CisQj08j1wOvFSbyaq
         oq/lVgMtp9Eha3x3FM1mxXdq9vACstRloiyfr+E6lxUJpmNUqi2jOYB6bZ1/0cl+OO30
         JdcpzlpkFZbR1jrrIABAY0ONC8Gif3xM7SJBiGbltNP/wVpK1uUPbDAmsTS0gpRkqqZs
         8akH0Xag56M6B6IafnlJ06+6RyYlQ4z5TouwBVHzPk8qnVRSRr+Sbid7gReh7E+74PW9
         EPWw==
X-Gm-Message-State: AOJu0YzXd42TfRxl8LZAtmcbyOeSa0Tm5kOsTjZE9i/wjXAi4ycLmVVW
	44tjzl9dhDJ73CysNrmeiCzmEQ==
X-Google-Smtp-Source: AGHT+IEhMkJ2UZs6Oq4f4tUpfy0l0nV4F52Qa2DFBj6+4HKIgbRMYasQqxe3N8vqkwv/ysHcS2lQQg==
X-Received: by 2002:a05:600c:1d03:b0:404:7606:a871 with SMTP id l3-20020a05600c1d0300b004047606a871mr18566318wms.2.1697029317191;
        Wed, 11 Oct 2023 06:01:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9134:b302:d8b:a200? ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b00405bbfd5d16sm16970192wmj.7.2023.10.11.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 06:01:56 -0700 (PDT)
Message-ID: <7d8958a5-01cf-428d-bc40-efc06d1be8fe@rivosinc.com>
Date: Wed, 11 Oct 2023 15:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, qemu_fw_cfg: Add support for RISC-V architecture
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231011114721.193732-1-bjorn@kernel.org>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231011114721.193732-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_060203_276079_E20D9213 
X-CRM114-Status: GOOD (  19.06  )
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

CkhpIEJqw7ZybiwKCk9uIDExLzEwLzIwMjMgMTM6NDcsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4g
RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFFlbXUgZndfY2Zn
IHN1cHBvcnQgd2FzIG1pc3NpbmcgZm9yIFJJU0MtViwgd2hpY2ggbWFkZSBpdCBoYXJkIHRvIGRv
Cj4gcHJvcGVyIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuCj4gCj4gQWRkIHRoZSBtaXNzaW5nIFJJ
U0MtViBhcmNoLWRlZmluZXMuCj4gCj4gWW91IGNhbiBub3cgZG8gdm1jb3JlIGR1bXBzIGZyb20g
cWVtdS4gQWRkICItZGV2aWNlIHZtY29yZWluZm8iIHRvIHRoZQo+IHFlbXUgY29tbWFuZC1saW5l
LiBGcm9tIHRoZSBxZW11IG1vbnRpb3I6CgpzbWFsbCB0eXBvIGhlcmU6IG1vbml0b3IKCj4gICAo
cWVtdSkgZHVtcC1ndWVzdC1tZW1vcnkgdm1jb3JlCj4gCj4gVGhlIHZtY29yZSBjYW4gbm93IGJl
IHVzZWQsIGUuZy4sIHdpdGggdGhlICJjcmFzaCIgdXRpbGl0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZmly
bXdhcmUvS2NvbmZpZyAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2Nm
Zy5jIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnIGIvZHJpdmVy
cy9maXJtd2FyZS9LY29uZmlnCj4gaW5kZXggYjU5ZTMwNDFmZDYyLi5mMDVmZjU2NjI5YjMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9maXJt
d2FyZS9LY29uZmlnCj4gQEAgLTE1NSw3ICsxNTUsNyBAQCBjb25maWcgUkFTUEJFUlJZUElfRklS
TVdBUkUKPiAgCj4gIGNvbmZpZyBGV19DRkdfU1lTRlMKPiAgCXRyaXN0YXRlICJRRU1VIGZ3X2Nm
ZyBkZXZpY2Ugc3VwcG9ydCBpbiBzeXNmcyIKPiAtCWRlcGVuZHMgb24gU1lTRlMgJiYgKEFSTSB8
fCBBUk02NCB8fCBQQVJJU0MgfHwgUFBDX1BNQUMgfHwgU1BBUkMgfHwgWDg2KQo+ICsJZGVwZW5k
cyBvbiBTWVNGUyAmJiAoQVJNIHx8IEFSTTY0IHx8IFBBUklTQyB8fCBQUENfUE1BQyB8fCBSSVND
ViB8fCBTUEFSQyB8fCBYODYpCj4gIAlkZXBlbmRzIG9uIEhBU19JT1BPUlRfTUFQCj4gIAlkZWZh
dWx0IG4KPiAgCWhlbHAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2Nm
Zy5jIGIvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2NmZy5jCj4gaW5kZXggYTY5Mzk5YTZiN2Mw
Li4xNDQ4ZjYxMTczYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2Nm
Zy5jCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2NmZy5jCj4gQEAgLTIxMSw3ICsy
MTEsNyBAQCBzdGF0aWMgdm9pZCBmd19jZmdfaW9fY2xlYW51cCh2b2lkKQo+ICAKPiAgLyogYXJj
aC1zcGVjaWZpYyBjdHJsICYgZGF0YSByZWdpc3RlciBvZmZzZXRzIGFyZSBub3QgYXZhaWxhYmxl
IGluIEFDUEksIERUICovCj4gICNpZiAhKGRlZmluZWQoRldfQ0ZHX0NUUkxfT0ZGKSAmJiBkZWZp
bmVkKEZXX0NGR19EQVRBX09GRikpCj4gLSMgaWYgKGRlZmluZWQoQ09ORklHX0FSTSkgfHwgZGVm
aW5lZChDT05GSUdfQVJNNjQpKQo+ICsjIGlmIChkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmlu
ZWQoQ09ORklHX0FSTTY0KSB8fCBkZWZpbmVkKENPTkZJR19SSVNDVikpCj4gICMgIGRlZmluZSBG
V19DRkdfQ1RSTF9PRkYgMHgwOAo+ICAjICBkZWZpbmUgRldfQ0ZHX0RBVEFfT0ZGIDB4MDAKPiAg
IyAgZGVmaW5lIEZXX0NGR19ETUFfT0ZGIDB4MTAKPiAKPiBiYXNlLWNvbW1pdDogMWM4Yjg2YTM3
OTlmN2U1YmU5MDNjM2Y0OWZjZGFlZTI5ZmQzODViNQoKSSBkaWRuJ3Qga25vdyB0aGF0IHFlbXUg
Y291bGQgZ2VuZXJhdGUgdm1jb3JlIGZpbGVzLiBCVFcsIHdoZW5ldmVyIEkKZG9uJ3QgaGF2ZSAn
Y3Jhc2gnIGF0IGhhbmQsIEkgb2Z0ZW4gdXNlIHRoZW0gd2l0aCBnZGIgYW5kIHZtbGludXgtZ2Ri
LnB5CmRlYnVnZ2luZyBzY3JpcHRzLiBBbnl3YXksIHdvcmtzIGFzIGV4cGVjdGVkOgoKVGVzdGVk
LWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpDbMOpbWVudAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
