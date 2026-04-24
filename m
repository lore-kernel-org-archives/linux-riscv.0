Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED0FED3F1
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IDfytHJq/IXiyVHy8je4PVx3GRZkvnVN1SiNvv3xqs=; b=GelXs4Z/E0GSGx
	S2Ie5F8XlHnQQ3vVk0CrJPWagi3hWy4kkl7h/RwF+qRl/JQ2M2YFwjBqEJU33DA0hFZ5+DxdZnSUO
	5prg5m+YhMcnJVz61h3cNLeY8fSPG+Ab3XXsgIoeN2qr0qA40qaPrnxglwpG3c6zK90EKex2nW2gM
	kwZhSPtIkhX428qhU/E8oDtDiBk50hw2B++2Gjrhjb2nc4x1GFznQBbj/fjuLu3NycvaXcaZW/Vft
	uqHsG56T9Rh+QRWwEIVKg6FdIXt+/FiVWrnFZBPq06M42EDk0z0G/EFHxIZMrnbMWVFDTuzglLT/r
	SpI1xRcqcOgUtZuyWFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJoq-0000000DYDW-1lmc;
	Fri, 24 Apr 2026 16:55:56 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJom-0000000DYCM-3V75
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 16:55:54 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so6011247fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2026 09:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777049751; cv=none;
        d=google.com; s=arc-20240605;
        b=jondMSAoO86GURHKCakjaTNSNpTsJw5WVO2lIe01JjwDxo7vAwuok0rV2++DDh765z
         /Z9dHRiMBmZW1FtuDXLcbYvdUjafWTIB76bgVzyXymlBRQIpHeygqTmP5bvzo6UbcNh7
         /NS+utc6mqSB0QstT8NnFmB/9xB1hzwK5RsJ+0pusR8PeEyOUcsRQtea/qH3MsvDnwTh
         ulNTZGIpqMv+pkcJSwtf8h5LEAlUyWNvu5HLCFaswooR3n803VjoB6yRb/rFN8OtYzWy
         maz15NuNWAr13oLXQrqUGj42XcacCRHJ6PVliQYIzrzcGrZzcgCLcTto2G6+hyHbJzk1
         ndnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5O3azLHRGBFKMGUz9uO/5pGOdHvkyg5cXzhZj2vlRYs=;
        fh=zW8fLdYf7g9PxbRSlW546u9Eb4cqY3f1eZvYfEwYZqM=;
        b=hXTB4EBdC2b0KsO1USr8HFMLvrLQznpI6xvLd6o/4v4DKV9Ng3EBIm5wokrFWO9KJU
         pMoNq8yWUcTzPzK0uvtavxeZVR7kf5oyXneTDu9H3Tj8XDrKmqDfLdstHIuH776aVtNV
         Vxf/chOUEyd/iRUXiPNFZNr3V+7wMsRQbg7r79gB02ML6qM7S34/6rEpPRvavdOuqF4q
         3tfbyBOowC8HrTnIPBb/O/r+xqPNaJKf5OW5inIH2qBzDAWtGRdkJfDhApv9VU4fniPC
         DB96eZcuu9ukrdyTmRaxRR2iOjs+m+ootO55u4WwhUe1CZwm8berYLDE0uJpCNlydDVj
         DcDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1777049751; x=1777654551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O3azLHRGBFKMGUz9uO/5pGOdHvkyg5cXzhZj2vlRYs=;
        b=GgUsIL7EMl/dct+uM4kf9SA4H+MeJDsQJmADYm+Z82u+U4Jppkt6aTZMCla5kCXooV
         ecdJan2jjhB6wcEK3gRiqXYylP3Hf7iqkNbuVNGwUaGy7gpji9tfYByG2nWYVvpiwZQc
         ecDF4L0FuQBbhPq52IW8N068/54Ln8TjhkZ1cIzFwgLP1hMRNbgdumaVEhqrE82LSG9a
         IV3leAJgizf64RIu8C+ZQ5+grSDOImhTJg6PLbtbNuWsgHxvI8DeNlfVI6sreQf1PcCI
         EwWdxY52CWNCiXiY1AvaRzcxTijfHkNjlruQC/B/Dzard+erBsgkEBO+z+EFtzAJ/xOB
         GvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049751; x=1777654551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5O3azLHRGBFKMGUz9uO/5pGOdHvkyg5cXzhZj2vlRYs=;
        b=bu7RRsJ1y0bBFl2FJVQMBYPAntuZuFsPh2rExE0tj5BEFwCQEAJ/yuDtr1y+1i833t
         bznP/q1oJWJ4Ueg6JYz6BrFMtttmcHJk1lExr3LNlxlpd9zmsEH5jd0yYNk51klbVfj8
         9XvG9ePRwYs8ebTRYQPvEhBzHDVpsJUA0IWvA3xwxJNL+1TmoPxnInYiaDLD3B/ZVnBP
         0IYUlN/w06GolNhqcUkWOoB1kDo/qB5wNP6Ykyx85Gt3dStKT5DQfGxk0wWetm7mism0
         m8/75Fo+8/FiiFW8F6Z7M/hDCUCGwqhXTp2uxoDN0Co40Pet+2H7jjoaEEzuPvnIPQJP
         sG5w==
X-Gm-Message-State: AOJu0YyPDi7T5M3dTIMM8U6awdDEtjX0O5PDbUdp47UTod3uA1cdnBit
	9J8jLUUwdPNPi666qK8lYi0IoxkuFQqy1uvE44O4OQiDjRCXB6qVei+LJPQ4WybvbADeWT/CVUL
	LB1NCe8VND1p5pkal8J37/PUPQtd3N1baCEv0WilQMg==
X-Gm-Gg: AeBDieu7kEbmUkmZVAMeOktWxaOKlQm5sZlKOGSrQM7qkcPHw16Gozv8ThycFLYTiiX
	jwqwM4kIVHiYkkl5vXS/TuwBcqgUEjU//S73coau8eAPZCIn1wXhZ+w3y9VojFPFjUItVDBDHUd
	eN+mJ9fT9K76tYBiwkDoNU9WVWmuegSSfXvhLPDgh8IjaTe/dsO0nhwL1HonMVMWL7qCWOC7gzN
	HjYytmdFWFg6o2A1IzUedhjiXLE9xyEsCsFatZNrQzzMWgzbTywWS5iYgsVeR4vfJmAqcm03JrQ
	pujZx8Vv2onty1nLbZgJu2dWbNS86VdmNLggTJu9tN3tiXvxLmWcuVRR6FJ5xAL1HpqxCHg4J0Q
	a/ci1dcheT7Tvbgwdr2Y2eNvxHFBEfKE7iRd68w==
X-Received: by 2002:a05:6820:55d2:10b0:68c:2ff9:522c with SMTP id
 006d021491bc7-69462e2e252mr12260138eaf.2.1777049751025; Fri, 24 Apr 2026
 09:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
In-Reply-To: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Apr 2026 22:25:39 +0530
X-Gm-Features: AQROBzDHsrxBvhRcU1Yqr-em-NwYKYx8XDrdYdbrFrmhwLOS9uHqa9BNwgbosZI
Message-ID: <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
Subject: Re: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on IMSIC
To: Baptiste Le Duc <baptiste.leduc@etik.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_095553_125970_ED4BD79A 
X-CRM114-Status: GOOD (  17.61  )
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgYXQgMTA6MDnigK9QTSBCYXB0aXN0ZSBMZSBEdWMKPGJhcHRp
c3RlLmxlZHVjQGV0aWsuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gV2hpbGUgYWRkaW5nIFhlbi9S
SVNDLVYgc3VwcG9ydCwgdGhlIGd1ZXN0IGV2ZW50IGNoYW5uZWwgaW50ZXJydXB0IGlzCj4gYWxs
b2NhdGVkIHZpYSBpcnFfb2ZfcGFyc2VfYW5kX21hcCgpIGFnYWluc3QgdGhlIElNU0lDIGRvbWFp
biBhbmQsIGlmCj4gd2UgcmVmZXIgdG8gdGhlIEFSTSBpbXBsZW1lbnRhdGlvbiwgaXQgbXVzdAo+
IGJlIGVuYWJsZWQvZGlzYWJsZWQgcGVyIHZDUFUgdGhyb3VnaCBlbmFibGVfcGVyY3B1X2lycSgp
IC8KPiBkaXNhYmxlX3BlcmNwdV9pcnEoKSBpbiB0aGUgQ1BVIGhvdHBsdWcgY2FsbGJhY2tzLgo+
Cj4gV2l0aCBJTVNJQyB1c2luZyBoYW5kbGVfZWRnZV9pcnEgKHRoZSB1cHN0cmVhbSBkZWZhdWx0
KSwKPiBlbmFibGVfcGVyY3B1X2lycSgpIG5ldmVyIGNsZWFycyBJUlFEX0lSUV9ESVNBQkxFRC4g
VGhhdCBmbGFnIGlzIHNldCBhdAo+IGlycV9kZXNjIGFsbG9jYXRpb24gdGltZSAoaXJxZGVzYy5j
KSBhbmQgaXMgb25seSBjbGVhcmVkIGJ5Cj4gaXJxX3N0YXJ0dXAoKSwgd2hpY2ggaXMgY2FsbGVk
IGZyb20gX19zZXR1cF9pcnEoKSBvbmx5IHdoZW4KPiBpcnFfc2V0dGluZ3NfY2FuX2F1dG9lbmFi
bGUoKSByZXR1cm5zIHRydWUuCj4KPiBpcnFfc2V0X3BlcmNwdV9kZXZpZCgpIHNldHMgSVJRX05P
QVVUT0VOICh2aWEgaXJxX3NldF9wZXJjcHVfZGV2aWRfZmxhZ3MpLAo+IHNvIGlycV9zdGFydHVw
KCkgaXMgaW50ZW50aW9uYWxseSBza2lwcGVkIGZvciBwZXJjcHUtZGV2aWQgSVJRcy4KPiBlbmFi
bGVfcGVyY3B1X2lycSgpIGNhbGxzIGlycV9wZXJjcHVfZW5hYmxlKCkgd2hpY2ggZG9lcyBpcnFf
ZW5hYmxlL3VubWFzawo+IG9uIHRoZSBjaGlwIGJ1dCBuZXZlciB0b3VjaGVzIElSUURfSVJRX0RJ
U0FCTEVELgo+Cj4gUmVzdWx0OiBoYW5kbGVfZWRnZV9pcnEoKSBoaXRzIGlycV9jYW5faGFuZGxl
X2FjdGlvbnMoKSDihpIgY2hlY2tzCj4gaXJxZF9pcnFfZGlzYWJsZWQoKSDihpIgcmV0dXJucyBm
YWxzZSDihpIgSVJRIHNpbGVudGx5IGRyb3BwZWQuCj4KPiBUaGlzIHdhcyBjb25maXJtZWQgYnkg
bG9nczoKPgo+ICAgIFhFTl9UUkFDRSBpcnE9MTIgcGVyY3B1X2VuYWJsZSBjcHU9MCBJUlFEX0RJ
U0FCTEVEPTEKPiAgICBYRU5fVFJBQ0UgaXJxPTEyIGhhbmRsZV9lZGdlIERST1AgSVJRRF9ESVNB
QkxFRD0xIGFjdGlvbj0uLi4KPgo+IFdoYXQgd2UgdHJpZWQKPiAtLS0tLS0tLS0tLS0tCj4gLSBy
ZXF1ZXN0X2lycSgpIGNvcnJlY3RseSB3b3JrcyB3aXRoIHVwc3RyZWFtIElNU0lDIHdoaWNoIHVz
ZXMKPiBoYW5kbGVfZWRnZV9pcnEgd2l0aCBubwo+IGlycV9zZXRfcGVyY3B1X2RldmlkKCkgYnV0
IGl0IG1lYW5zIHdlIG9ubHkgY2FuIGhhdmUgb25lIHZDUFUgd2hpY2ggd2lsbAo+IGFsd2F5cyBo
YW5kbGUgdGhlIGlycSwKPiBhbmQgd2UgZG9uJ3Qgd2FudCB0aGF0Lgo+Cj4gLSBBZGRpbmcgaXJx
X3NldF9wZXJjcHVfZGV2aWQoKSArIHN3aXRjaGluZyB0byBoYW5kbGVfcGVyY3B1X2RldmlkX2ly
cSBpbgo+IGltc2ljX2lycV9kb21haW5fYWxsb2MoKSBmaXhlcyB0aGUgWGVuIGNhc2UgYnV0IGJy
ZWFrcyBhbGwgb3RoZXIgSU1TSUMKPiB1c2VycyAoUENJIE1TSSwgcGxhdGZvcm0gZGV2aWNlcykg
dGhhdCBjYWxsIHJlcXVlc3RfaXJxKCksIHNpbmNlCj4gcmVxdWVzdF90aHJlYWRlZF9pcnEoKSBy
ZWplY3RzIElSUXMgbWFya2VkIF9JUlFfUEVSX0NQVV9ERVZJRDoKPgo+ICAgIFdBUk5JTkc6IENQ
VTogMCBQSUQ6IDEgYXQga2VybmVsL2lycS9tYW5hZ2UuYzoyMTAxCj4gICAgcmVxdWVzdF90aHJl
YWRlZF9pcnErMHg4MC8weDEyYwo+Cj4gVGhlcmVmb3JlLCBkbyB5b3UgaGF2ZSBhbnkgcmVjb21t
ZW5kYXRpb25zIG9uIGhvdyBzaG91bGQgSSBoYW5kbGUgdGhpcwo+IGNhc2UgPwo+CgpUaGUgUklT
Qy1WIElNU0lDIGRyaXZlciBkb2VzIG5vdCByZWdpc3RlciBwZXItQ1BVIGludGVycnVwdHMKcmF0
aGVyIGl0IHRyZWF0cyBJRHMgYWNyb3NzIGFsbCBDUFVzIGFzIGluZGVwZW5kZW50IHZlY3RvcnMg
YW5kCnBpY2tzIHRoZSByaWdodCB2ZWN0b3IgZm9yIGEgZGV2aWNlIE1TSSBiYXNlZCBvbiBhdmFp
bGFiaWxpdHkgKyBhZmZpbml0eS4KCk9ubHkgdGhlIFJJU0MtViBpbnRjIGRyaXZlciBtYW5hZ2Vz
IHBlci1DUFUgaW50ZXJydXB0cyBzbyB0aGUKWGVuIGd1ZXN0IGV2ZW50IGNoYW5uZWwgaW50ZXJy
dXB0IHNob3VsZCBiZSBhIGxvY2FsIGludGVycnVwdAptYW5hZ2VkIGJ5IFJJU0MtViBpbnRjIGRy
aXZlci4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
