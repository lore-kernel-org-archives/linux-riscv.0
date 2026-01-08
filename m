Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DBD148A0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u/3UC5OEhaKPyONkLy4pYR4Y7W3wNhZTc5WKW8hGRY=; b=SbXgz6hXop5OsP
	eE/mMa9XhCiREYGRwCSlR03XJ6QSdwLaRJLioRwFAu0aNgzuwhgT9MDgfu7F4aAQtpaCBK/AouqDh
	wp2M9rCnzrVzz8QaH5GV6y7rK+s0lbaX9YIWwM0V6gDEPNvVDzpGbJY8YQEMC4Q3f5vMCT4sNS305
	nKGLNB/RVf2fKJGaNCq81UxSKnnbYDIg8iGRU+ml5yI8dZ921asEcd+xmOE9NEKVc3knT14Uhlxib
	xX+k8/9wvMNIhHmzjK7ZYIVPIKInUjWNGV/DsJJ2kCdSoozM7hbgMWOiXw7+LLm/nscpRK0CDAY5V
	IRt1g6ahyApuBi+yZIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj9b-0000000FyKr-3Oot;
	Thu, 08 Jan 2026 06:05:51 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj9Z-0000000FyFq-1bZ7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852269;
	bh=gav39FpEO5VhoeNj+txZWA56UCcKyhzVpE/iKgOWVJY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KEJWR/Rvv1LtGBU6FRdloSwoOR+f1QqVQ8i6T0N9zxCN/rFOEUtxlln2s5FDH8K4l
	 m5sk9OaCu5COhchpzT5rHr/2kStj0j8OVw6yWiWbQpu86SR+u86HdnqcCHLryNKZ6a
	 9RU6SCH5Xoc7BgwTsResgm1fOL8MhXHFu1FEZNc0=
X-QQ-mid: esmtpgz10t1767852260tdc8c5949
X-QQ-Originating-IP: QJieDE39AnE314JUPQ9dkuFuRWnObXeuCXtaTy2H3o0=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:04:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14099507488698372074
EX-QQ-RecipientCnt: 15
Date: Thu, 8 Jan 2026 14:04:18 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Linus Walleij <linusw@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <F002D2DE9196BF8A+aV9I4lkCHzU9QB5H@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
 <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OccmtviHNKX2X4asGSxbSnWcNjc2rk7CP/KmekUuLba7eolWcOM2s4rk
	2OxNnjnGoqg0EWFuZ1lsjCmeiJFA7WFRH8pIjPYKw3OXnzH4ags+9Kek6Zwu3u2TQHcE12Y
	75Cmq++u9wQzqkp3ZztfGwWrGSGW0Qp3VFn0XUyEVWYZ6JnE8oDm1dEo7MlF0pH2k7H2KJG
	IwOsv/Q6Ljn0ljP4r71MNOO59d2Vz6bAc/7mtRqa1TCOErSjXY91z+UXgOng/ynaUSKZsTl
	gp7QP4ciaP+Uuojn8IKDQAfsQ5wF23GpdnFirzBWQv80nFMmYpy05T45KP2VjuEq2Yp4+3z
	mGv+/4MBVEQoTYBMGeQF2A3hpG5XDSwfOZ84Xnu2uMyHb5oNzO8EoM2CmdNY4ZAnmKHrToX
	w+wMP0bRkPtsSxZtC7mjryMf/WofRRzhc1J3Vj3fk4mBqc/ribqB72PEEz/b1kChgSXHRL6
	dIXM5SNHG/cv8fXtPIIdF0i+1IfD3ezsLyiUCXVwuTo8nynL/kfYnx6L6AKgRttrypsa7/h
	FZjLeLk1HMVTaYC7w+0mgWRrScrCkr7rrOtaf66IJ3ri10RAoP7OhFPn1oD/LWbW6Vukkeb
	w5jjpdOi2Up+qmQqwqeeBv3AOSKbFvybEkvGiDqotGRxV76arO5qARq8534I+ZwPr/BKoXb
	a1cedZ74r6JNATzWL6x0OnBehllrcsMK/ZPIDAJ4H0uJITMEe8hgNEQNgZcWK8+G8HbI3CK
	Lx+cxzBxaKPzT8gD6IOW8hzQTq5meVEYPH8ry4mLeucHhGeQSS5nZcEAQGePUqqZxOifMAD
	COFvCAnKShmDxgFPWofegUXQQuy0v0YMFgSDgmaKJMC4S9xsHb5SGtnlGiTT5vGyT0nwSgc
	JMlhlxLSTjd/E1T3YL6/scaMfRevXeTXDVgoxaK3tRD5O+yKyWOU3vaT3rpTiS3XXhjSfMs
	6V+oV3jD2wWvKgeUoiRDa+aPZ1Siq9NGqCxB1xH60Jv0OhvZoTO+EEHlotQl7opCXERiFTr
	ChY+BiHAbFYhIlcwEzOO6TPAAQ9KadDuzIB1hzDw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220550_166064_F7E1C14E 
X-CRM114-Status: GOOD (  15.21  )
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

T24gVGh1LCBKYW4gMDEsIDIwMjYgYXQgMTE6NTQ6MDJQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBIaSBUcm95LAo+IAo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiBPbiBUdWUs
IERlYyAyMywgMjAyNSBhdCAxMDoxMeKAr0FNIFRyb3kgTWl0Y2hlbGwKPiA8dHJveS5taXRjaGVs
bEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+IAo+ID4gKyAgc3BhY2VtaXQsYXBiYzoKPiA+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJh
eQo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGRl
c2NyaXB0aW9uOiBwaGFuZGxlIHRvIHN5c2NvbiB0aGF0IGFjY2VzcyB0aGUgcHJvdGVjdGVkIHJl
Z2lzdGVyCj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IG9mZnNldCBvZiBhY2Nlc3Mgc2Vj
dXJlIHJlZ2lzdGVycwo+ICguLi4pCj4gPiArICAgICAgICAgICAgc3BhY2VtaXQsYXBiYyA9IDwm
c3lzY29uX2FwYmMgMHg1MD47Cj4gCj4gSXNuJ3QgdGhlIG9mZnNldCBpbXBsaWNpdCBmcm9tIHRo
ZSBjb21wYXRpYmxlIG9mIHRoZSBwaW4gY29udHJvbGxlciBvcgo+IHRoZSBzeXNjb24gb3IgYW55
IG90aGVyIGNvbXBhdGlibGU/Cj4gCj4gSXQncyBlYXN5IHRvIGNoZWNrIGNvbXBhdGlibGVzIGlu
IHRoZSBkZXZpY2UgdHJlZSBhbmQganVzdCBzYXkKPiB0aGlzIG9mZnNldCBpcyAweDUwIGlmIGNv
bXBhdGlibGUgaXMgc28tb3Itc28sIGFuZCBzb21ldGhpbmcgZWxzZQo+IGZvciBhbm90aGVyIGNv
bXBhdGlibGUgYW5kIGp1c3QgZ2l2ZSBhbiBlcnJvciBpZiBhbiB1bmtub3duCj4gY29tcGF0aWJs
ZSBhcHBlYXJzLgo+IAo+IFNvOiBwbGVhc2UgdHJ5IHRvIGF2b2lkIHRvIHB1dCB0aGluZ3MgdGhl
IGNvZGUgY2FuIGVhc2lseSBsb29rCj4gdXAgaW50byB0aGUgZGV2aWNlIHRyZWUuClRoYW5rcyBm
b3IgeW91IHBvaW50aW5nIGl0IG91dC4gSSdsbCByZW1vdmUgaXQuCgogICAgICAgICAgICAgICAg
ICAgICAgICAgIC0gVHJveQo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
