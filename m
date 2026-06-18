Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4CCD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qvVBH68NqvI2annWSdlFNNvnSuHg8fMygyY6whnN2A=; b=TufM05XobemA0c
	tg9oDLiGVybu7K+4dVugq89zOKXy3S6jDiD2OJinv2MFfhJigJtiZSzINc7GGyBKcMsQmSHGEWXUN
	9HecU/1EpJ1tbHvHFDHoLFrGIK9uLz4AIqLt0VlFN6oO1fhZdwniju4xjYpl9ONffJoDueVaY0O1S
	myjI+ph3bP5VkmohWy1YhLzGa0JfwrsexhyAdnIlCJ8+UCIrHaZWM/mcX0HV06ANyb035dKXAhMqb
	gM7/2dwfrdMQyIr1jTlo/fZ4jQ2kMkBCV2JoJo/ZICoOGOKeB0FZUkQ1m0o/JcfNEDS/EBFCBXBY0
	WmmSt4FJtgo9MPxtSCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF3q-00000001X5C-2T87;
	Thu, 18 Jun 2026 15:53:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF3p-00000001X4l-0iZd;
	Thu, 18 Jun 2026 15:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A5460018;
	Thu, 18 Jun 2026 15:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5851F000E9;
	Thu, 18 Jun 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781798024;
	bh=EwX9mxVgUx4kbF0qZ290eryMIgfNI0MdhJKVS5zuxOw=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=dFbyuhdxS8KRLeKukg6wGxWrZKR7+kw+xqNzs3yRunvw4FB7RQT+K+h6r1RUTVb4a
	 H+XMDkYxvmBiMuqK6N4j1KwALKy4zAVPDNJLrqk5VRjQmKqdBxJSdrP0h3D/m/mb/Y
	 08qVUbjX3v5xmk5PeWvmWNQ7NBaxuUDFHMnmx8qih+TsRiJYrLNTg9orqijFMNJ/zY
	 UYIpbgfnw2o6Wu/fRmaGf38lG5t4n+Y8avnbK9JaZ9rWD+u7xO68HArQRZjlEQIK/U
	 yTyHP2EioUBOSUKbMp9/bDNibaJlaph6Xa8ztrGG4/FL5Ju36LIJsfYUCim8Oa3P8+
	 UMWh6Gg9zlbNA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Michael Kelley
 <mhklinux@outlook.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
 <pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
 <alex@ghiti.fr>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "dave.hansen@linux.intel.com"
 <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "kees@kernel.org"
 <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
 "linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
 "lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "maz@kernel.org"
 <maz@kernel.org>, "timothy.hayes@arm.com" <timothy.hayes@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "oupton@kernel.org" <oupton@kernel.org>,
 "yeoreum.yun@arm.com" <yeoreum.yun@arm.com>, "miko.lenczewski@arm.com"
 <miko.lenczewski@arm.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "james.clark@linaro.org"
 <james.clark@linaro.org>, "tabba@google.com" <tabba@google.com>,
 "mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "anshuman.khandual@arm.com"
 <anshuman.khandual@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
Date: Thu, 18 Jun 2026 17:53:41 +0200
Message-ID: <874iizdeuy.ffs@fw13>
MIME-Version: 1.0
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

T24gTW9uLCBKdW4gMTUgMjAyNiBhdCAxNzo1NywgSmluamllIFJ1YW4gd3JvdGU6Cj4gT24gNi8x
Mi8yMDI2IDExOjQ1IFBNLCBNaWNoYWVsIEtlbGxleSB3cm90ZToKPgo+IC0gRGVmYXVsdCAobm8g
cGF0Y2gpOiBTbG93ZXN0IEhWQzY0IGhhbmRsaW5nICgxMjbigK/OvHMpLCBoaWdoZXN0IFdGeCBj
b3VudAo+ICg4NWspLCBhbmQgbW9zdCB0b3RhbCBWTeKAkWV4aXRzLgo+Cj4gLSBjcHVocC5wYXJh
bGxlbD0xOiBIVkM2NCBsYXRlbmN5IGltcHJvdmVkIHRvIDc44oCvzrxzIChjbG9zZSB0bwo+IGNw
dWhwLnBhcmFsbGVsPTApLCBidXQgSVJRIGV4aXRzIGluY3JlYXNlZCBkcmFtYXRpY2FsbHkgKDEy
LjlrLCAyLjfDlwo+IHRoYXQgb2YgYGNwdWhwLnBhcmFsbGVsPTBgKSwgYWNjb3VudGluZyBmb3Ig
OTUlIG9mIGV2ZW50IHRpbWUgYW5kCj4gYmVjb21pbmcgdGhlIG5ldyBib3R0bGVuZWNrLgo+Cj4g
LSBjcHVocC5wYXJhbGxlbD0wOiBGYXN0ZXN0IEhWQzY0ICg2OeKAr868cyksIGxvd2VzdCBJUlEg
ZXhpdHMgKDQuOGspLCBhbmQKPiBsb3dlc3QgdG90YWwgc2FtcGxlcywgZGVsaXZlcmluZyB0aGUg
YmVzdCBvdmVyYWxsIGJvb3QgcGVyZm9ybWFuY2UuCj4KPiBUaGVyZWZvciwgYGNwdWhwLnBhcmFs
bGVsPTFgIHJlZHVjZXMgSFZDIGNvc3QgYnV0IHN1ZmZlcnMgZnJvbSBhIG1hc3NpdmUKPiBpbmNy
ZWFzZSBpbiBJUlEgZXhpdHMsIHdoaWxlIGBjcHVocC5wYXJhbGxlbD0wYCBhdm9pZHMgdGhpcyBp
bnRlcnJ1cHQKPiBzdG9ybSBhbmQgdGhlcmVmb3JlIHBlcmZvcm1zIGJlc3QgaW4gYSBLVk0gZ3Vl
c3QuCgpXaGF0J3MgdGhlIGNhdXNlIGZvciBoYXZpbmcgdGhpcyBtYXNzaXZlIGludGVycnVwdCBl
eGl0IHJhdGUgaW4gcGFyYWxsZWwKbW9kZT8gSnVzdCBiZWNhdXNlIHBhcmFsbGVsIGRvZXMgbm90
IGdpdmUgYSB1c2VmdWwgZXhwbGFuYXRpb24uCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
