Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65AACD98F6
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSuS8rAq7/7lyH3/X5k/+LJFGYw6myvfF9pG2wgpk6Y=; b=hkTF7hISo9xbC0
	2qOxD+1R0U5X1e1Otemyjk1udZo5+Ha8VuJsZpnN7DCS/e6fNRNYJx99cj1C8XAouqosuWKRFyFg2
	WyKADeK/QYVsFAnrMOZIPezP+xiks0tcSD+rBBoaI7itpMZHd0YKj2Y7fdwDarbLoUnjIkOI7if8t
	CTVGJvRyUWJd1zmPoiz2YO4QaO95lCTbF37SPN0Q0vPpXPW0Pwe842QDjR2tx0JgFyKeaiHHNoBDG
	qX0pIMYEecPfLvPSrpVwWreRmp53Sq5U/hBf5/ip5CrEg98q9BFHBr/GWV5IpFpGvmyhzO+RP9wWg
	1kAIHpLiDcuw8LSR6wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgAV-0000000BD6E-0Rd0;
	Thu, 13 Nov 2025 22:51:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgAS-0000000BD5r-1Lu7
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 22:51:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b710601e659so215631166b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 14:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763074310; x=1763679110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UVVQud0Izrm82Y9YsVW4ejkPGLxxg20QvfQU/ToybY=;
        b=YaR1UAV5S+ok9CdkABAj1G1MhFPenQaUkmIU81SdQiQU0TB55UZ2lVdXoLVLz9EpxY
         /Rk9z0vGL9ENL61mJEqSxSCFrNyrFU/XyvQt4ET5Zm+Mz/f1Ci1MIbEStfKVickYgW3C
         uZsLlzdnmiu4fOm+K5bsi6VIArlBGxIPB+Qvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763074310; x=1763679110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0UVVQud0Izrm82Y9YsVW4ejkPGLxxg20QvfQU/ToybY=;
        b=joTR3qnstrpBhmTW7LeHMf0b+0jRJakxaQ7zJIU9L9uAu7mvBgwqFoisS3wLH1KgO0
         in/Werle5KqrK6Tl9hzsSP1bDRA+9jMmyv3dhNg1jmQtgmRJpXSvbp2UFORsDpOj7o8p
         ErGH7XVvwlX3/8Lmw7BY4SM9AdSEmY6CO4LT3b3sSpqzuZQl4ynufDEf1qvmo6c5MIxY
         uPSL4BT7gyLqTwsP5fnw3WUkXs/sfSJRz0cHXuhR46RPd75vX32w0YWebmC9kNIH+W3I
         6LU9UCJUxZzHf4U5KFfqLnlpdZPvc88Sd+SymBC7ryXi0rws9PPX5fBFzJ59NGCN1gAU
         +Y1w==
X-Forwarded-Encrypted: i=1; AJvYcCV6ut8JM7psI9WPHjLTlpJLlApCCf2dOPpMFC1ax6N2pld64s7IL94xwMURzrfTb0qMIedv2GYqBsgQfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNTPO40uPODDtYk8UaZaNSi3WbSBSh9QgTRe+Yxbfb4tA89oLV
	NBRcsnl9RossU2wGzRLMtM88ET1vD5id+u1YwZBLW8mhzDRKaAJkOPiJJa39g2fzAzU2ps3jeH4
	9awZY22Eg
X-Gm-Gg: ASbGncsMOKbzPWZtv5HatXCCujWL8m7WMkkrltVfDsZkat0nJfsmUK+qZkc6SJ6aK/w
	URLKfIGjnIjrAou7rtR03f+/b3O/aFAm2R5XqGTLEFn1Rdc++kQDRNPXZhNpICNYjQX4mTGD80P
	7G7itmXXyige5fhdXHLM2hO9HNQLro8DkyjTHqOOF5/BJrH+zzmQ1XeSDg08byiO62oxt2bJYuT
	mJ1ElyEl128KQHw5y3WFeGDb3+vUsIlHJrk3OxYL1NvYMFQM5ebLk0+wzTlrRHAmRz4AftzpPh7
	DOhJA5kolbdeIPnBUkZPIMYPFJDXyyzawtcSRcqHfeL0F/tGAP1aNSm40yh3Cp3Ca9/SdnwS84z
	T+C5dPCNAL+Id5scjozpHV+dPc4efenJpM1QEdTKhi2d2Bt0Zq4eQUYpybP+ib/kl2ZfIFUzLMv
	YooB/jKph43zcQx9mva5J20XIKzSfdcEG3eq015vFw2/A0Nm4TI5t67qF6teuijBao526XcDI=
X-Google-Smtp-Source: AGHT+IFvFNBzTbZHDD3FMRyesG+fdSQ1LQzHUIpR5N14nxOZIfdxlhIcBEi7qnMrlDTHQZUQJodn/g==
X-Received: by 2002:a17:906:dc8f:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b736796a6a6mr93549066b.63.1763074309685;
        Thu, 13 Nov 2025 14:51:49 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm249485466b.56.2025.11.13.14.51.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 14:51:49 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso2496960a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 14:51:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/hkLViWhk4+vSetDedAka4XnyuKiGzgsLFPUnJNP9TxG21rgZALRparUOmlUQAe1uDkomg0O37wifoA==@lists.infradead.org
X-Received: by 2002:a05:6000:2010:b0:42b:3c3e:5d53 with SMTP id
 ffacd0b85a97d-42b5933aff4mr761555f8f.16.1763073948860; Thu, 13 Nov 2025
 14:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20251111073459.44030-1-cuiyunhui@bytedance.com>
In-Reply-To: <20251111073459.44030-1-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 14:45:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
X-Gm-Features: AWmQ_bkNWl8O-v3oF1GNsRABKkGX6YQ-aUhM_Mt29bXwj4MZQ9qr2FjFv9F9mEw
Message-ID: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_145152_419871_0EDCD1F6 
X-CRM114-Status: GOOD (  16.01  )
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

SGksCgpPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCAxMTozNeKAr1BNIFl1bmh1aSBDdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEFmdGVyIGRpc2N1c3Npb24gWzFdLFsyXSwg
aGFyZGxvY2t1cF9wZXJmIGNhbm5vdCBiZSBjb21wbGV0ZWx5IHJlcGxhY2VkIGJ5Cj4gdGhlIGhh
cmRsb2NrdXBfYnVkZHkgYXBwcm9hY2gsIHNvIHRoaXMgcGF0Y2ggaXMgc3RpbGwgYmVpbmcgc3Vi
bWl0dGVkLgo+Cj4gdjEtPnYyOgo+IFRoZSBjb250ZW50cyBvZiBhcmNoL2FybTY0L3dhdGNoZG9n
X2hsZC5jIGFyZSBkaXJlY3RseSBjb25zb2xpZGF0ZWQgaW50bwo+IGtlcm5lbC93YXRjaGRvZ19w
ZXJmLmMuCj4KPgo+IHYyLT52MzoKPiBBZGQgQ09ORklHX1dBVENIRE9HX1BFUkZfQURKVVNUX1BF
UklPRCB0byBlbmNsb3NlIHRoZSBwZXJpb2QgdXBkYXRlIGxvZ2ljLAo+IHNlbGVjdCBpdCBieSBk
ZWZhdWx0IG9uIGFybTY0IGFuZCByaXNjdiwgd2l0aG91dCBhZmZlY3Rpbmcgb3RoZXIgYXJjaGVz
Cj4gbGlrZSB4ODYgYW5kIFBQQy4KPgo+IHYzLT52NDoKPiBQbGFjZSB0aGUgbGluZSAic2VsZWN0
IFdBVENIRE9HX1BFUkZfQURKVVNUX1BFUklPRCBpZiBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYg
JiYgQ1BVX0ZSRVEiCj4gaW4gdGhlIEtjb25maWcgZmlsZXMgZm9yIGFybTY0IGFuZCByaXNjdiBp
biBvbmUgbGluZSwgd2l0aCBubyBsaW5lIGJyZWFrcy4KPgo+IHY0LT52NToKPiBSZW1vdmUgX193
ZWFrIGZyb20gaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKCkKPgo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9DQUQ9RlY9VUVoVkNENkplaFFpMXdvcjJzU210VExEeWY9Mzd4Zm8t
RE9USzE9dTF4ekFAbWFpbC5nbWFpbC5jb20vIFsxXQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MDkxNjE0NTEyMi40MTYxMjgtMS13YW5namluY2hhbzYwMEBnbWFpbC5j
b20vIFsyXQo+Cj4gWXVuaHVpIEN1aSAoMik6Cj4gICB3YXRjaGRvZzogbW92ZSBhcm02NCB3YXRj
aGRvZ19obGQgaW50byBjb21tb24gY29kZQo+ICAgcmlzY3Y6IGFkZCBIQVJETE9DS1VQX0RFVEVD
VE9SX1BFUkYgc3VwcG9ydAo+Cj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAgIHwg
IDEgKwo+ICBhcmNoL2FybTY0L2tlcm5lbC9NYWtlZmlsZSAgICAgICB8ICAxIC0KPiAgYXJjaC9h
cm02NC9rZXJuZWwvd2F0Y2hkb2dfaGxkLmMgfCA5NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICB8ICAzICsKPiAgZHJp
dmVycy9wZXJmL2FybV9wbXUuYyAgICAgICAgICAgfCAxMCArKystCj4gIGRyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMgICAgIHwgMTAgKysrKwo+ICBpbmNsdWRlL2xpbnV4L3BlcmYvYXJtX3Bt
dS5oICAgICB8ICAyIC0KPiAga2VybmVsL3dhdGNoZG9nX3BlcmYuYyAgICAgICAgICAgfCA4MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi9LY29uZmlnLmRlYnVnICAgICAgICAg
ICAgICAgIHwgIDggKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKyksIDk4
IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9rZXJuZWwvd2F0
Y2hkb2dfaGxkLmMKClBlcmhhcHMgeW91IG1pc3NlZCB0aGF0IChJIHRoaW5rKSBBbmRyZXcgaGFk
IGFscmVhZHkgZHJvcHBlZCB5b3VyIHY0CmR1ZSB0byB0aGUgS2VybmVsIFRlc3QgUm9ib3QgZmlu
ZGluZyBhIHByb2JsZW0uIFNlZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEwMjQw
NzAxLmVCNnI5N1YzLWxrcEBpbnRlbC5jb20KCkkgZG9uJ3QgdGhpbmsgeW91J3ZlIGZpeGVkIHRo
ZXNlIHByb2JsZW1zIGluIHY1LCBoYXZlIHlvdT8gSSB0aGluayB5b3UKbmVlZCBhIHY2IGZvciBp
dD8gSSBoYXZlbid0IGR1ZyBhbGwgdGhlIHdheSwgYnV0IEknZCBzdXNwZWN0IHRoZQpjb21waWxl
IGVycm9yIGlzIGlmICJIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYiIGlzIGRlZmluZWQgYnV0IG5v
dAoiQ1BVX0ZSRVEiLiBJbmRlZWQsIHRoYXQgbWF0Y2hlcyB0aGUgY29uZmlnIGluIHRoZSByZXBv
cnQuLi4KCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
