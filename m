Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C78C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB722076A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BG9fj++4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB722076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sk9QHNS9PXExPag3WFJSV5zhJrvikHnZi3gAMVHpSeQ=; b=BG9fj++4c2kspgBXMMjs3t9ZI
	2F7JSs+Oa4Vk3cO6dZ2QKhJM5s0NoNW5lvmUmmy5uGzL5ppyLvLXZKbcNtxDXutPmIKF6sx09krao
	b31L9FnHD09J1nbevg8rSlK+xXLibM0hs+AvYGDEsNGFOkAbmf238zzIJ4SjjuSAt1h6mlW7oM+fs
	TeZQpJkCB9l3CIiJfrJes181zgzdpOG+0P2y5RItV4hI803a03o9TOYpMVUT2SQlSt2xjtqJJpE75
	O40/leacCjzu26s285JIoHLyea1C/0kxsE565a5/ZC71WuUGmKlG60PbVDoJ1E8bYbeMfFzU/dIKV
	SughcNCvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtm1O-0001uS-Fv; Fri, 10 Jul 2020 05:56:30 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtm1L-0001u3-Ta; Fri, 10 Jul 2020 05:56:29 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 06A5mKfN028585; Fri, 10 Jul 2020 05:48:22 GMT
X-AuditID: 8b5b014d-257ff700000045c5-ee-5f080124e40e
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 67.B4.17861.421080F5; Fri, 10 Jul 2020 08:48:20 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 10 Jul 2020 08:48:17 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/5] lib: Add a generic version of devmem_is_allowed()
Organization: FORTH
In-Reply-To: <20200710053850.GA27019@infradead.org>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
 <20200709200552.1910298-2-palmer@dabbelt.com>
 <20200709204921.GJ781326@linux.ibm.com>
 <20200710053850.GA27019@infradead.org>
Message-ID: <a037dac961c989d027eab293a0280643@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDTdRzH+/4eN2Tx46Hzd5hUA1MoniSuz5Vnnan3y+Lyrv5AUdaSCRxP
 3ngo+cOWTYWB11qMxRhBDENsZzw4QIJJcCAkhROOh8kShRhIazxNRdwRg+uO/173/rzv3q8/
 Pjzc5wHpz0tOz5JI08WpQsqDKIjTBIYGIZ4o4vrNXaD7xUDB1ZsKHKbGnCRcPKvBwLiipWF5
 yYHApeqmYansdwLU9ycpcPxUiECjvo1A1y8noKeuloDzfU0kXJhvw6FYU0uCq62OglvKSgzu
 maox6CtIg+YmP+jvr6Wh6NlaktfiJKB+YoiEgRYdBY2Lcgo61G0ILg2bMbg/PkJC06MHFIwo
 /0bgWMjHQF/9KswpVzGYGSjEwVh3FcF5rRcsVD0iYHViTdo+piHAlDeOwUiRjALLbBUJz24s
 E9BQr8ZheMGCgXwsGlaerO11zy8jmLOWUu9GcY2/NpKc4QcD4gaGzDi38lSFOMfIOZorlZkJ
 7p+ZGYK7VjOKcZ15SzS30jVBc3/1FJPcda2V5uQmC81V1GdzDZdDOH3rDHY44KjHngRJanKO
 RBq+91OPJK1OhZ066/lFfvtDUoasfAXi8VjmDfZhe7ICefB8mC7EuvpkhALx1/JotrQtH7lZ
 wHizvSWT6znOAKsevIE2+CX2a2Mp7maC2cFePte2zhQTzJbf+W2977fGluoLuHsAZ2q2sE9V
 jZR72Jc5xN7RvuXueDG+7ILVTLqZz0SxjtlOtCHUitiBb5XUhsR+1jrRQ23IBbFzK+O0m19g
 AtnRThutRN7aTa7aTa7aTa4VCL+CGHFOVFjyicywkxnSrKSwRGk9Wn9DFNOM7jbYwzoQxkMd
 iOXhQj9BxCukyEeQID6dK5FmiKTZqZLMDrSNRwi3CtK3VB/3YRLFWZIUieSURPr/FePx/WVY
 91BgdsmHdfGf6+wZZfbKYweNO8v0uz9SnIjrmi6Iiz9yTz75r2vAUxfcNWreevRl0ZXykymt
 /E9e+y7hywDnOwF5B5Q1kalTUp8A+kf9N0FfxVfkTOOhIkNsVMgljQTZDtpakhr09W++aAg6
 /jil8ICrTt18pt1mv0gq/GPpw0VOIbWr+rPi7cvhuXu83369d29a9HZVVbmvEzNNGGJyuwe1
 iXnBh8bTFlOeWGwxlY7vs8WrRrmj+blyS+Z7XvFnGiYFtd5E6GB+5OkP9n+87c9S6WzMvKcp
 8vmf/yghI5Z79/Fv37o71buzS/U4XzatWzwSe2zfjmGBa/c1mc0U3vl+jJDITBJHhuDSTPF/
 Gk8Jw/UDAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 10 Jul 2020 05:48:22 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 10 Jul 2020 05:48:22 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_015628_436053_DB31E561 
X-CRM114-Status: GOOD (  15.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, elver@google.com, glider@google.com,
 willy@infradead.org, zong.li@sifive.com, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 ardb@kernel.org, linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 alex@ghiti.fr, takahiro.akashi@linaro.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 bgolaszewski@baylibre.com, Palmer Dabbelt <palmer@dabbelt.com>,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, paulmck@kernel.org,
 rostedt@goodmis.org, uwe@kleine-koenig.org, broonie@kernel.org,
 matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, dan.j.williams@intel.com,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, james.morse@arm.com,
 mhiramat@kernel.org, akpm@linux-foundation.org, davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0wNy0xMCAwODozOCwgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IE9uIFRodSwgSnVsIDA5LCAyMDIwIGF0IDExOjQ5OjIxUE0gKzAzMDAsIE1pa2UgUmFwb3Bv
cnQgd3JvdGU6Cj4+ID4gKyNpZm5kZWYgQ09ORklHX0dFTkVSSUNfREVWTUVNX0lTX0FMTE9XRUQK
Pj4gPiArZXh0ZXJuIGludCBkZXZtZW1faXNfYWxsb3dlZCh1bnNpZ25lZCBsb25nIHBmbik7Cj4+
ID4gKyNlbmRpZgo+IAo+IE5pdDogbm8gbmVlZCBmb3IgdGhlIGV4dGVybiBoZXJlLgo+IAo+PiA+
ICtjb25maWcgR0VORVJJQ19MSUJfREVWTUVNX0lTX0FMTE9XRUQKPj4gPiArCWJvb2wKPj4gPiAr
CXNlbGVjdCBBUkNIX0hBU19ERVZNRU1fSVNfQUxMT1dFRAo+PiAKPj4gVGhpcyBzZWVtcyB0byB3
b3JrIHRoZSBvdGhlciB3YXkgYXJvdW5kIGZyb20gdGhlIHVzdWFsIEtjb25maWcgY2hhaW5zLgo+
PiBJbiB0aGUgbW9zdCBjYXNlcyBBUkNIX0hBU19TT01FVEhJTkcgc2VsZWN0cyBHRU5FUklDX1NP
TUVUSElORy4KPj4gCj4+IEkgYmVsaWV2ZSBuaWNlciB3YXkgd291bGQgYmUgdG8gbWFrZQo+PiAK
Pj4gY29uZmlnIFNUUklDVF9ERVZNRU0KPj4gCWJvb2wgIkZpbHRlciBhY2Nlc3MgdG8gL2Rldi9t
ZW0iCj4+IAlkZXBlbmRzIG9uIE1NVSAmJiBERVZNRU0KPj4gCWRlcGVuZHMgb24gQVJDSF9IQVNf
REVWTUVNX0lTX0FMTE9XRUQgfHwgCj4+IEdFTkVSSUNfTElCX0RFVk1FTV9JU19BTExPV0VECj4+
IAo+PiBjb25maWcgR0VORVJJQ19MSUJfREVWTUVNX0lTX0FMTE9XRUQKPj4gCWJvb2wKPj4gCj4+
IGFuZCB0aGVuIHMvc2VsZWN0IEFSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VEL3NlbGVjdCAKPj4g
R0VORVJJQ19MSUJfREVWTUVNX0lTX0FMTE9XRUQvCj4+IGluIHRoZSBhcmNoIEtjb25maWdzIGFu
ZCBkcm9wIEFSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VEIGluIHRoZSBlbmQuCj4gCj4gVG8gdGFr
ZSBhIHN0ZXAgYmFjazogIElzIHRoZXJlIGFueSByZWFzb24gdG8gbm90IGp1c3QgYWx3YXlzCj4g
U1RSSUNUX0RFVk1FTT8gTWF5YmUgZm9yIGEgZmV3IGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndCBj
dXJyZW50bHkKPiBzdXBwb3J0IGEgc3RyaWN0IC9kZXYvbWVtIHRoZSBnZW5lcmljIHZlcnNpb24g
aXNuJ3QgcXVpdGUgY29ycmVjdCwgYnV0Cj4gc29tZW9uZSBzZWxlY3RpbmcgdGhlIG9wdGlvbiBh
bmQgZmluZGluZyB0aGUgaXNzdWUgaXMgdGhlIGJlc3Qgd2F5IHRvCj4gZmlndXJlIHRoYXQgb3V0
Li4KPiAKCkR1cmluZyBwcm90b3R5cGluZyAvIHRlc3RpbmcgaGF2aW5nIGZ1bGwgYWNjZXNzIHRv
IGFsbCBwaHlzaWNhbCBtZW1vcnkgCnRocm91Z2ggL2Rldi9tZW0gaXMgdmVyeSB1c2VmdWwuIFdl
IHNob3VsZCBoYXZlIGl0IGVuYWJsZWQgYnkgZGVmYXVsdCAKYnV0IGxlYXZlIHRoZSBjb25maWcg
b3B0aW9uIHRoZXJlIHNvIHRoYXQgdXNlcnMgLyBkZXZlbG9wZXJzIGNhbiBkaXNhYmxlIAppdCBp
ZiBuZWVkZWQgSU1ITy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
