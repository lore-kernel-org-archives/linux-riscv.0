Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2FC79F9F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03yeZSmvUOXvxGVOSMQ7YEi2E4OLBYcW4y+J4LP2meg=; b=kDQfZtxLlbne+b
	S2IM0TqbBu6bTSsaVOKyIoGuchED3WMOfb9vVN783yIrJZSvB4+b+clxe63AMdENd/VoSAkINuFwS
	sNGw7e4KZNqCWPNVxRc92zu45QFTlhR4L7U9qCcqxrS86OQSvXRzO//PzGKp1Z9yTZM2qgackl65T
	YU1ghoe55zCOFWMS3GE6mVCdqpvMBaDg1fsXvV5e3qgUoKn+C0JjDOISRa2gULP2ZozgAsT3Jlry2
	kYx88XChIzhuyPUV34jlXlzgkl2me5yaSF9QxgeZbgQ/KMih9WLAlH9NPvswUwTYyDqBwTA0915Rm
	eoBJRXLw3c+ONKBSYisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EYJ-000000057iU-2rCq;
	Sun, 06 Sep 2026 15:13:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EYG-000000057i9-2iOh
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 15:13:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482e257a23aso1771972f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 08:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788707578; cv=none;
        d=google.com; s=arc-20260327;
        b=sHQX1DghX5BKsk4aVoEPLsTclt09sX27b9vFrJnHxykLRPmco7+3ixaU24SKJXWBZl
         3DzFo4g659Qg7Hm24FpziGBUETlRmg+dtz+k38IhT7I0rlr4bE5R1XTkFlgnvqjdw+t7
         ef1MxCqEvYVwmtfjiwoAr1MSSp/wI5xmKkZI3QlK2u8Rnmf6Ms8n2JHh2FBHGpAORoGJ
         DQql1P+G7WYHywMEylo+SQUM03+4TISHSEMIfJ8LiGRnqSWqhXYo3W8vSWvWJ51+E7xA
         Y7YCogs7FEKa5jMGQjdZ/2ypm+09Bpcl/oPisN0KoRM34Zgf++wFcQo6KbboeubQyLVH
         3vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        fh=9DZHJyNG9Zx37sHnZFE7GpbAgZCSbzclZBJxvc+IJ6I=;
        b=iy+OEPOeWiF7PIEMuOCNCEML5I7xh8dobkPojRyyKaMw3OiTXXnxxhTzjboM0FFUbg
         pWZm4gl/fgQnG4OYnK3Lu9XTQAilq5wKHl4wuvUuZ0ymtHkt1OeV3DVbpOmONaEnDof4
         OCsF8+I6TH3ve3+UbsEA1nXIwgJaAJ+Ua882uZQ6ejdez6s3Up7Wovb0wOAxBOrEQ704
         TgJo0Q8QZggXeLDr72rJIjwoCd5sPhxIEJP2+N3H8FUcfbYQxbsfYzA2vP8PKNH5nXEK
         Prrof4QQaSrmnwsrP8od4WWpeSLFkfWOTtmpb/eQukrm/XnKT8JFWB6EZhigO3/ZTTMR
         +8yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788707578; x=1789312378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        b=DnxDfJ2l5OZrpPf36b2SZKvo7DUY7vXdulqGIeHEcS35r6GCkxNdtfgjmgYZJnFloD
         KYMQT7vy7omKQRqtyhq6eIWRBAZFers4vcp/1N/eHlsEplRGBeEUdHz/XOQqU9b6Rd2e
         8mtXvRUPqJiy2NpDjBpLa8H0juJarIQdzOU3mWaujpY89+eFIZougy0/4f4unB/S6VoW
         D/QikTTSLTkgssf+QqB4RNiDrUjnq0/69Xi99rz63uWSHTtuDHyrPDPWyf3rDOY+qDtN
         Q8+YNbOSQV6NAQGyHxEFjMLntTd0WqLVQ0rcGwNMLszy7utr2aTcv2omzPVelQFqMAEv
         sUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788707578; x=1789312378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        b=HcMWWiAPgB/UBhyFs/mwA3S0s7I2sjYd223fbNGMy1orgfkwt0+mv8HTGNU0YGHHmI
         JWYaLrSRq2KOrr+K4VdmadaGYG4NgcN3R05//zAJ0v7n4yDCTwG7KdmtLzBbK84fsVK1
         8NNvZJvEz6fneTGMRBFtMIY22MyVVxegMmBehlpvBjiXCmeIPAqkkWGVlmTE/S6l3MQV
         inULSUXmUAo8Vfsut1M/vNzuzdTn7uzunlHIntRnrqnBGLvO6d7wFqOVw94ADV0pqwu2
         IxEY2N/79VxEXxdpDUAXxHsbCq72Hm/rt/J3jHfsh+wZfcCZB8kS/lDSd7hMtOQ3bu+b
         ijrA==
X-Forwarded-Encrypted: i=1; AKwUvBz7iS7wWvAzzzfJQ3Bf0txmr3Bt0E5qMqjLjUqXi5CRY6ZlMIvIWqI2sGTCDEDOs9ZqwruSk9gVlxHwuQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kjynbf5SqS7O5o8xfmibZinv5JIg3jacg/UKCzBMEjhZJehQ/7
	DKnJS+AdI+0LNl6FG0vIyj/2ZmX/A7HpCVHZJqf7MuHLABAxryrvhk8YbfIGj1YuzGL+WzMX73v
	EQF5KiLV8fcEF+uVvzzCXU1O/a63akAbl9YGMWpo3mw==
X-Gm-Gg: AYBFou2fCnWwD4Osn9Z1rR2hYAoKTBawbzW6v4K2gHUw5ZCj0Fm93NJ+nnl8Jtb2cxo
	zINQeBY0uMA7IDJuzYBOwyg2iLcmodwZstvzKWSkUl5xc7C1SoeerUpM2CB2yKmAQX5bptgAyFR
	73hSf0NvTyhuvqOaY/RXIhHDgFBYiHfdh4vkwHFPJ9JH/WSfzFxdJtoi66aoRfFdHuYCFiBkXvc
	Up2BAZ1j5IY6axaqWp12w+8xIun/hQ7lBtywyeamrcw6IgGbmKv46dqI/wiSmGIOAdTNVmLnCUw
	UmBtYeG8dUeNy3ycEopLmD/VE9c3/b14F8QOiqzS8+K7jOpy7bpz/DgNbP5X8PkpVIutbMqu/w3
	vwZ4BCSdKwfQlrVzV6G52l8XIDD8p9cd9TO46+zKQTcWdxKOm0UT03aC1xxaU+QA=
X-Received: by 2002:a05:6000:2508:b0:485:8e8b:7bf4 with SMTP id
 ffacd0b85a97d-4858e8b7c78mr14147410f8f.33.1788707577698; Sun, 06 Sep 2026
 08:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
 <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
In-Reply-To: <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Sep 2026 20:42:45 +0530
X-Gm-Features: AcwNN1X9oTn0svXCCN4OeBCKJLZeONyVHPKvQXZJrhy7-m9QRuibPvMEQrtTQVA
Message-ID: <CAAhSdy05y0Er=4xNDU166TA6E268ObPLghktNOsSfNvv_aupYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] irqchip/riscv-imsic: Reject overlapping group index fields
To: Pengpeng Hou <hppiscas@163.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Bjorn Topel <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_081300_709805_4D215029 
X-CRM114-Status: GOOD (  16.13  )
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

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxOjM54oCvUE0gUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPiB3cm90ZToKPgo+IFRoZSBJTVNJQyBwYXJzZXIgdmFsaWRhdGVzIGluZGV4IHdpZHRo
cyBidXQgZG9lcyBub3QgY2hlY2sgdGhhdCBhCj4gbm9uemVybyBncm91cCBmaWVsZCBzdGFydHMg
YWJvdmUgdGhlIHBhZ2UsIGd1ZXN0IGFuZCBoYXJ0IGZpZWxkcy4KPiBBIG1hbGZvcm1lZCBsYXlv
dXQgY2FuIHRoZXJlZm9yZSBhc3NpZ24gb25lIGFkZHJlc3MgYml0IHRvIHR3byBmaWVsZHMuCj4K
PiBSZXF1aXJlIHRoZSBncm91cCBzaGlmdCB0byBiZSBhdCBsZWFzdCB0aGUgZW5kIG9mIHRoZSBs
b3dlciBmaWVsZHMuCj4gQ2hlY2sgdGhlIHVwcGVyIGJvdW5kIHVzaW5nIHN1YnRyYWN0aW9uIGFm
dGVyIHZhbGlkYXRpbmcgdGhlIHNoaWZ0LCBzbwo+IHRoZSBib3VuZCBjaGVjayBjYW5ub3Qgd3Jh
cCB3aGVuIHByb2Nlc3NpbmcgYSBmaXJtd2FyZS1zdXBwbGllZCB2YWx1ZS4KPgo+IFRoZSBpc3N1
ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sIGFuZCBtYW51YWxseSByZXZp
ZXdlZC4KPgo+IEZpeGVzOiAyMWE4ZjhhMGViMzUgKCJpcnFjaGlwOiBBZGQgUklTQy1WIGluY29t
aW5nIE1TSSBjb250cm9sbGVyIGVhcmx5IGRyaXZlciIpCj4gQXNzaXN0ZWQtYnk6IEdQVC01Cj4g
U2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0AxNjMuY29tPgo+IC0tLQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IGluZGV4IDQ0YjljMzRjLi5j
NmViMTZhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0
YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBA
QCAtNzQyLDggKzc0MiwxNiBAQCBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19wYXJzZV9md25vZGUo
c3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPgo+ICAgICAgICAgLyogU2FuaXR5IGNoZWNr
IGdyb3VwIGluZGV4IHNoaWZ0ICovCj4gICAgICAgICBpZiAoZ2xvYmFsLT5ncm91cF9pbmRleF9i
aXRzKSB7Cj4gLSAgICAgICAgICAgICAgIGkgPSBnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMgKyBn
bG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0IC0gMTsKPiAtICAgICAgICAgICAgICAgaWYgKGkgPj0g
QklUU19QRVJfTE9ORykgewo+ICsgICAgICAgICAgICAgICBpID0gSU1TSUNfTU1JT19QQUdFX1NI
SUZUICsgZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzICsKPiArICAgICAgICAgICAgICAgICAgIGds
b2JhbC0+aGFydF9pbmRleF9iaXRzOwo+ICsgICAgICAgICAgICAgICBpZiAoZ2xvYmFsLT5ncm91
cF9pbmRleF9zaGlmdCA8IGkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIiVw
ZndQOiBncm91cCBpbmRleCBzaGlmdCB0b28gc21hbGxcbiIsIGZ3bm9kZSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4g
KyAgICAgICAgICAgICAgIGlmIChnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0ID49IEJJVFNfUEVS
X0xPTkcgfHwKPiArICAgICAgICAgICAgICAgICAgIGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cyA+
Cj4gKyAgICAgICAgICAgICAgICAgICBCSVRTX1BFUl9MT05HIC0gZ2xvYmFsLT5ncm91cF9pbmRl
eF9zaGlmdCkgewoKVGhlIGFib3ZlIGNoZWNrIGZvciAidG9vIHNtYWxsIGdyb3VwIGluZGV4IHNo
aWZ0IiBpcyBmaW5lIGJ1dCB3aHkKaXMgdGhlIGV4aXN0aW5nIGNoZWNrIGZvciAidG9vIGJpZyBn
cm91cCBpbmRleCBzaGlmdCIgbm90IHN1ZmZpY2llbnQuCgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByX2VycigiJXBmd1A6IGdyb3VwIGluZGV4IHNoaWZ0IHRvbyBiaWdcbiIsIGZ3bm9kZSk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICAgICAg
ICAgIH0KPgo+IGJhc2UtY29tbWl0OiAxM2NhMWMwYjdkOGEzYWIxZTU5Y2IzZTc4MGMxZGQ3NDQx
ZTIyNTE1Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
