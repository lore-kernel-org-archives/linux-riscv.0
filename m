Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7ABC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niUzKwoCAaEnhQ9t+clZbgJwnhhzfcUQMqtPIXMnvvE=; b=pbcnA/Qk11TsmM
	DOD36OghZOZe6GNPfIhUhtzw5JGtxjFWoF3PeXPPRbkiDTvUacGQ8lv1iNrrHPPPMzkMN9c6UvJvQ
	fV3qYt1SgmKF5SYOfJWJedN/vLLUOE1wOqhFuE/+srAt9k+ta6e24HCOeQtlmvMYv5SrRzvVRDn8b
	2aVOcYI2sfYBXcrsFn2X8rJoERQ5iSXBkfdIVyWRycMZQvV5bElf7N18yUU7IkgUxZwuM849oUQ3n
	Um3ueyUIyOzQzlVrard9kh3VR8h/pN1HItiDne06+jgt8H/HBB5Mk6Gaxz+s/Igyo/6g4DU3Vet63
	HrgybiPTMZ4NcJKvv3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskTA-00DU0h-Nk; Wed, 09 Nov 2022 12:46:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskT7-00DTp3-F7
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 12:46:15 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EE5B7412C4
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1667997962;
	bh=RHoZ3MT1CpOkrn1NipWXHp2Mz+AtOoijcEZtSmMvrms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=XBpW5B46Z3k4iE0Whtoc9akmCO5nEqqTyvTvVUhKS/mW2LgP5kwkJNYN4utnhzb8N
	 rw/gZpX/75sSQfLVXUmv7KJmvfA3/S6dLUmhkvQNtSyUS9gRg5Mjqk82TIYRDlSgcy
	 y0DHfZU/K5/cq1IYNKoxrJeN4VDUkGcAdjj09auQXaTyDkEX8XR1oEArsUWk5dFuos
	 6q7PjLMMIaJypK7IUWpQ+dFQMcd632hcs09llepu18FKxH8csGTAnA9+a3BhabMFXG
	 1kYZnQk96AXomXthnsSm9L4VBvNsd0tudOOq8JuhSoFpKYId/Qv9ETn8mPZaDcQrJy
	 CC/9sTb6jxDjg==
Received: by mail-yb1-f198.google.com with SMTP id l188-20020a2525c5000000b006cbcff0ab41so16699176ybl.4
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 04:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHoZ3MT1CpOkrn1NipWXHp2Mz+AtOoijcEZtSmMvrms=;
        b=XKrXckesRS+CAIXbHHwtIsJviW01UqOnRlazZNpiSpSM8oXAenMEJ6b6Nmaw8x06K6
         Bi/mgBiz0YfA1uTHO6U18NWWcW5eo0nl6oCp2cAxHpgPy1BPR7UWGcwGR7cX0kL4nBHe
         b6qAGtEqdqNk6JDrBILxg5LM6ci0zYptraHnMozI+a5afWHm8rjbNFPUdYfWPGyWWgPM
         lhHCkv4TV9XjfzLgmLXIUK7Vs6r397H57dVcW1Sph47U0LcSbAFi8JvRa7gny4V2Ccox
         +ipWnk9ULJjtKvqif2OaQqpHurjxGRWiPOOPZIA3L4KZLKhxPFxHFN7hhyIy/JL2fHCK
         hxDw==
X-Gm-Message-State: ACrzQf1vWumVrYs9SRxUb9whR/B5/oBuAfsRBeX2dbWqx0tKJaWsdXmn
	IBtwaoV5Taaxa87knUJKn9NPFF/KM2wrf1cEf3Kb0vXmmyyZDLxIt523Ck0T2suqhWNH0dDw5FB
	mIpIG/X7p7qWvn9F4ljb3c9Kzxun4M7QQJpKN9cVhdd6zabsA3Pl+tE17I5r1ZQ==
X-Received: by 2002:a25:8a0f:0:b0:6c2:4ea4:69e5 with SMTP id g15-20020a258a0f000000b006c24ea469e5mr59162094ybl.153.1667997959466;
        Wed, 09 Nov 2022 04:45:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4dO6RzG5dyotHYVC6fTTwkSqXjxngNZIAGPea9dxDM4GU/TS8fzUHaIukBdHxI3UlX2WUNH91ddTE8pHQQ9JE=
X-Received: by 2002:a25:8a0f:0:b0:6c2:4ea4:69e5 with SMTP id
 g15-20020a258a0f000000b006c24ea469e5mr59162077ybl.153.1667997959226; Wed, 09
 Nov 2022 04:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com> <20221109120102.ylnseq2w33rvt7fz@pengutronix.de>
In-Reply-To: <20221109120102.ylnseq2w33rvt7fz@pengutronix.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 9 Nov 2022 13:45:43 +0100
Message-ID: <CAJM55Z-EVXB6FTWwh_vY_B3LoVv+b7TCQCE7asB8G8wkEwui_g@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state succeed
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_044613_812358_8BA2A1BB 
X-CRM114-Status: GOOD (  36.66  )
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

T24gV2VkLCA5IE5vdiAyMDIyIGF0IDEzOjAxLCBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvIEVtaWwsCj4KPiBPbiBXZWQs
IE5vdiAwOSwgMjAyMiBhdCAxMjozNzoyNFBNICswMTAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3
cm90ZToKPiA+IENvbW1pdCAyY2ZlOWJiZWM1NmVhNTc5MTM1Y2RkOTI0MDlmZmYzNzE4NDE5MDRm
IGFkZGVkIHN1cHBvcnQgZm9yIHRoZQo+ID4gUkdCIGFuZCBncmVlbiBQV00gY29udHJvbGxlZCBM
RURzIG9uIHRoZSBIaUZpdmUgVW5tYXRjaGVkIGJvYXJkCj4gPiBtYW5hZ2VkIGJ5IHRoZSBsZWRz
LXB3bS1tdWx0aWNvbG9yIGFuZCBsZWRzLXB3bSBkcml2ZXJzIHJlc3BlY3RpdmVseS4KPiA+IEFs
bCB0aHJlZSBjb2xvdXJzIG9mIHRoZSBSR0IgTEVEIGFuZCB0aGUgZ3JlZW4gTEVEIHJ1biBmcm9t
IGRpZmZlcmVudAo+ID4gbGluZXMgb2YgdGhlIHNhbWUgUFdNLCBidXQgd2l0aCB0aGUgc2FtZSBw
ZXJpb2Qgc28gdGhpcyB3b3JrcyBmaW5lIHdoZW4KPiA+IHRoZSBMRUQgZHJpdmVycyBhcmUgbG9h
ZGVkIG9uZSBhZnRlciB0aGUgb3RoZXIuCj4gPgo+ID4gVW5mb3J0dW5hdGVseSBpdCBkb2VzIGV4
cG9zZSBhIHJhY2UgaW4gdGhlIFBXTSBkcml2ZXIgd2hlbiBib3RoIExFRAo+ID4gZHJpdmVycyBh
cmUgbG9hZGVkIGF0IHJvdWdobHkgdGhlIHNhbWUgdGltZS4gSGVyZSBpcyBhbiBleGFtcGxlOgo+
ID4KPiA+ICAgfCAgICAgICAgICBUaHJlYWQgQSAgICAgICAgICAgfCAgICAgICAgICBUaHJlYWQg
QiAgICAgICAgICAgfAo+ID4gICB8ICBsZWRfcHdtX21jX3Byb2JlICAgICAgICAgICB8ICBsZWRf
cHdtX3Byb2JlICAgICAgICAgICAgICB8Cj4gPiAgIHwgICAgZGV2bV9md25vZGVfcHdtX2dldCAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiA+ICAgfCAgICAgIHB3bV9zaWZp
dmVfcmVxdWVzdCAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ID4gICB8ICAg
ICAgICBkZGF0YS0+dXNlcl9jb3VudCsrICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
Cj4gPiAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgZGV2bV9md25vZGVfcHdt
X2dldCAgICAgIHwKPiA+ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgIHB3
bV9zaWZpdmVfcmVxdWVzdCAgICAgfAo+ID4gICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICBkZGF0YS0+dXNlcl9jb3VudCsrICB8Cj4gPiAgIHwgICAgICAgICAuLi4gICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgLi4uICAgICAgICAgICAgICAgIHwKPiA+ICAgfCAgICBw
d21fc3RhdGVfYXBwbHkgICAgICAgICAgfCAgICBwd21fc3RhdGVfYXBwbHkgICAgICAgICAgfAo+
ID4gICB8ICAgICAgcHdtX3NpZml2ZV9hcHBseSAgICAgICB8ICAgICAgcHdtX3NpZml2ZV9hcHBs
eSAgICAgICB8Cj4gPgo+ID4gTm93IGJvdGggY2FsbHMgdG8gcHdtX3NpZml2ZV9hcHBseSB3aWxs
IHNlZSB0aGF0IGRkYXRhLT5hcHByb3hfcGVyaW9kLAo+ID4gaW5pdGlhbGx5IDAsIGlzIGRpZmZl
cmVudCBmcm9tIHRoZSByZXF1ZXN0ZWQgcGVyaW9kIGFuZCB0aGUgY2xvY2sgbmVlZHMKPiA+IHRv
IGJlIHVwZGF0ZWQuIEJ1dCBzaW5jZSBkZGF0YS0+dXNlcl9jb3VudCA+PSAyIGJvdGggY2FsbHMg
d2lsbCBmYWlsCj4gPiB3aXRoIC1FQlVTWSwgd2hpY2ggd2lsbCB0aGVuIGNhdXNlIGJvdGggTEVE
IGRyaXZlcnMgdG8gZmFpbCB0byBwcm9iZS4KPiA+Cj4gPiBGaXggaXQgYnkgbGV0dGluZyB0aGUg
Zmlyc3QgY2FsbCB0byBwd21fc2lmaXZlX2FwcGx5IHVwZGF0ZSB0aGUgY2xvY2sKPiA+IGV2ZW4g
d2hlbiBkZGF0YS0+dXNlcl9jb3VudCAhPSAxLgo+ID4KPiA+IEZpeGVzOiA5ZTM3YTUzZWIwNTEg
KCJwd206IHNpZml2ZTogQWRkIGEgZHJpdmVyIGZvciBTaUZpdmUgU29DIFBXTSIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fu
b25pY2FsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDggKysr
KysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMv
cHdtL3B3bS1zaWZpdmUuYwo+ID4gaW5kZXggMmQ0ZmE1ZTVmZGQ0Li5iM2M2MGVjNzJhNmUgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
cHdtL3B3bS1zaWZpdmUuYwo+ID4gQEAgLTE1OSw3ICsxNTksMTMgQEAgc3RhdGljIGludCBwd21f
c2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwKPiA+Cj4gPiAgICAgICBtdXRleF9sb2NrKCZkZGF0YS0+bG9jayk7Cj4gPiAgICAgICBpZiAo
c3RhdGUtPnBlcmlvZCAhPSBkZGF0YS0+YXBwcm94X3BlcmlvZCkgewo+ID4gLSAgICAgICAgICAg
ICBpZiAoZGRhdGEtPnVzZXJfY291bnQgIT0gMSkgewo+ID4gKyAgICAgICAgICAgICAvKgo+ID4g
KyAgICAgICAgICAgICAgKiBEb24ndCBsZXQgYSAybmQgdXNlciBjaGFuZ2UgdGhlIHBlcmlvZCB1
bmRlcm5lYXRoIHRoZSAxc3QgdXNlci4KPiA+ICsgICAgICAgICAgICAgICogSG93ZXZlciBpZiBk
ZGF0ZS0+YXBwcm94X3BlcmlvZCA9PSAwIHRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgd2Ugc2V0Cj4g
PiArICAgICAgICAgICAgICAqIGFueSBwZXJpb2QsIHNvIGxldCB3aG9ldmVyIGdldHMgaGVyZSBm
aXJzdCBzZXQgdGhlIHBlcmlvZCBzbyBvdGhlcgo+ID4gKyAgICAgICAgICAgICAgKiB1c2VycyB3
aG8gYWdyZWUgb24gdGhlIHBlcmlvZCB3b24ndCBmYWlsLgo+ID4gKyAgICAgICAgICAgICAgKi8K
PiA+ICsgICAgICAgICAgICAgaWYgKGRkYXRhLT51c2VyX2NvdW50ICE9IDEgJiYgZGRhdGEtPmFw
cHJveF9wZXJpb2QpIHsKPgo+IFdoaWxlIEknbSBjb252aW5jZWQgdGhpcyB3b3Jrcywgd2UnZCBn
ZXQgc29tZSBtb3JlIHVuaWZvcm0gYmVoYXZpb3VyCj4gY29tcGFyZWQgdG8gb3RoZXIgaGFyZHdh
cmVzIHdpdGggc2ltaWxhciByZXN0cmljdGlvbnMgaWYgeW91IGxvY2sgdGhlCj4gcGVyaW9kIG9u
IGVuYWJsaW5nIHRoZSBQV00gaW5zdGVhZCBvZiBhdCByZXF1ZXN0IHRpbWUuIFNlZSBmb3IgZXhh
bXBsZQo+IGRyaXZlcnMvcHdtL3B3bS1wY2E5Njg1LmMuCgpIbW0uLiB0aGF0IGRyaXZlciB1c2Vz
IGEgcHdtc19lbmFibGVkIGJpdG1hcCByYXRoZXIgdGhhbiBhIHVzZXIgY291bnQsCmJ1dCBpdCBz
dGlsbCBzZXRzIHRoZSBiaXQgaW4gdGhlIHJlcXVlc3QgbWV0aG9kIGFuZCByZWZ1c2VzIHRvIGNo
YW5nZQpwZXJpb2QgaW4gdGhlIGFwcGx5IG1ldGhvZCBpZiBtb3JlIHRoYW4gMSBiaXQgaXMgc2V0
LiBTbyBhcyBmYXIgYXMgSQpjYW4gdGVsbCBpdCBzdGlsbCBzdWZmZXJzIGZyb20gdGhlIHNhbWUg
cmFjZS4gSG93ZXZlciB1c2luZyBhIGJpdG1hcAppbnN0ZWFkIG9mIGEgdXNlciBjb3VudCB3b3Vs
ZCBsZXQgdXMgaGFuZGxlIGV2ZXJ5dGhpbmcgaW4gdGhlIGFwcGx5Cm1ldGhvZCBpZiB3ZSBkb24n
dCBzZXQgdGhlIGJpdCBpbiB0aGUgcmVxdWVzdCBtZXRob2QsIGJ1dCB0aGVuIHRoZQpiZWhhdmlv
dXIgd291bGQgc3RpbGwgYmUgZGlmZmVyZW50LiBJbiBhbnkgY2FzZSBpdCB3b3VsZCBzdGlsbCBi
ZSBhCmxhcmdlIGNoYW5nZSB0byB0aGlzIGRyaXZlci4KCkhvdyBhYm91dCB3ZSBtZXJnZSB0aGlz
IGJ1ZyBmaXggdGhhdCBjYW4gZWFzaWx5IGJlIGJhY2twb3J0ZWQgZmlyc3QKYW5kIHRoZW4gbG9v
ayBhdCBob3cgaXQgc2hvdWxkIGJlIGhhbmRsZWQgcHJvcGVybHk/CgovRW1pbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
