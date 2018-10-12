Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA0C6786C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 12:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87BA20865
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 12:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZF/LSGLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87BA20865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zInxBVmGeF/raFiXAQxuAUjwRhLM08boD9uiUsIpfk0=; b=ZF/LSGLYWsPtmYiP7SAuyalkD
	Kx56sYypJOsbVmL4oiMI3VWCb9408SZu3P75KGoHLLUyMVp05rR0z9ulJkk/Yapa4cTowkhn0xP7e
	yXxC8zbKaJN5WDq1o891tYHkZ2VwqUpQgicUhCCr6XF+CsvABXRZXblsGXU/xrILHXA+zw9DUb2Cx
	LMLweiWVW3xxM/68A4gJKIzmiYCYP9bot81xv8qvlnGWkEjLyHN8nilnF61FKeHCaXjKwAAz+6vQh
	uUv9BkSCxC5G0OnAGxEOrz8cNUocZMP3QXf1VWOIyZl9AFHucSydUM/gQPMtn2GgXyGhzNUjSUakJ
	TPxMm9fgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAwp4-0005C1-Qb; Fri, 12 Oct 2018 12:45:42 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAwoj-0003j2-1n
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 12:45:39 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w9CCiuvs071230; Fri, 12 Oct 2018 15:44:58 +0300 (EEST)
X-AuditID: 8b5b9d4d-91bff70000000e62-22-5bc097488e41
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 77.E1.03682.84790CB5; Fri, 12 Oct 2018 15:44:56 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w9CCiukM000637; Fri, 12 Oct 2018 15:44:56 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 12 Oct 2018 15:44:56 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Pintu Kumar <pintu.ping@gmail.com>
Subject: Re: RISCV - missing kernel features
Organization: FORTH
In-Reply-To: <CAOuPNLjReF+EXOnQM9=e5cHUYOUWync66VMKR5Qt+jrN2WkG8w@mail.gmail.com>
References: <CAOuPNLjReF+EXOnQM9=e5cHUYOUWync66VMKR5Qt+jrN2WkG8w@mail.gmail.com>
Message-ID: <b08b6678025254191562823bd6d826bb@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsXSHc2orOsx/UC0QeN/QYttn1vYLK6/nMbi
 wOSxc9Zddo/NS+oDmKK4bFJSczLLUov07RK4Mm5e7GEq6Gav2Pz+FksD41PWLkZODgkBE4m7
 Z84D2VwcQgJHGCVWz+5hAUkICRxilDh7lRGiyFRi9t5OMJtXQFDi5MwnYDXMAhYSU6/sZ4Sw
 5SWat85mBrFZBFQl1q+9zAZiswloSsy/dBCsXkRATeLriq/MEPXKEsfW9oLFhQV0JGYv+wlm
 8wsIS3y6exHsOE6BQIlNr1eyQ9wTILFz8SpmiBtcJBb3b2WBuE1F4sPvB2A1okAzX5yYzjqB
 UWgWklNnITl1FpJTFzAyr2IUSCwz1stMLtZLyy8qydBLL9rECA7dub47GM8tsD/EKMDBqMTD
 +2Pi/mgh1sSy4spcYLhwMCuJ8C7IOhAtxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfwi/AgIYH0
 xJLU7NTUgtQimCwTB6dUA2M389P50f9MWt8f2m5qusX++MFzXNESVy4fLfI1CTm5dkGxpER1
 S/E9+9NvpQ10C/P0F6/vlDry3kiY333BSmHl0FqFL3Ntl9f+Sn68gG2p5OeCS0vOXF/jyF8/
 0a0/QWGvnGqs7+EFBde5DRq/h4R1dVZlLXFKmMQjvPhpQlrG9vpTk5e4L1RiKc5INNRiLipO
 BADrhvfkWQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_054521_512423_D1C8A9B6 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012124456.M9Q0_WPxXy76d8sUw4GBACfjRlR-kbQeYA0rpupLnow@z>

zqPPhM65z4IgMjAxOC0xMC0xMiAxNDoxMywgUGludHUgS3VtYXIgzq3Os8+BzrHPiM61Ogo+IEhp
LAo+IAo+IEkgYW0gbmV3IHRvIFJJU0MtVi4KPiBIb3dldmVyLCBhdCBmaXJzdCwgSSBjb3VsZCBi
cmluZyB1cCByaXNjdi1saW51eCBrZXJuZWwgNC4xOCBvbiBRRU1VCj4gZW52aXJvbm1lbnQgdXNp
bmcgYnVzeSBiZWFyLiBUaGVuIEkgZGV2ZWxvcGVkIHNldmVyYWwgc2FtcGxlCj4gYXBwbGljYXRp
b25zLCBkcml2ZXJzLCBwZXJmLCBMVFAgdGVzdHMgYW5kIHZlcmlmaWVkIG9uIHFlbXUuCj4gTm93
LCBJIGFtIGN1cmlvdXMgdG8ga25vdyB3aGF0IGFyZSB0aGUga2VybmVsIGZlYXR1cmVzIHRoYXQg
YXJlCj4gbWlzc2luZyBpbiByaXNjLXYgcmlnaHQgbm93LCBhbmQgd2hhdCBhcmUgdGhlIHBsYW5z
Lgo+IElmIHRoZXJlIGlzIGFueSBUTy1ETyBsaXN0LCBwbGVhc2Ugc2hhcmUuCj4gCj4gSSB3b3Vs
ZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gcGljayBzb21lIG9mIHRoZW0gYW5kIGNvbnRyaWJ1dGUg
aW4gbXkgCj4gZnJlZSB0aW1lLgo+IAo+IFRoYW5rIFlvdSEKPiBSZWdhcmRzLAo+IFBpbnR1Cj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
V2UnbGwgaGF2ZSBhIHdpa2kgdXAgbmV4dCB3ZWVrLCBmb3Igbm93IHRoaXMgdGhyZWFkIGlzIHVz
ZWZ1bC4uLgpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlzY3Yv
MjAxOC1TZXB0ZW1iZXIvMDAxMzQ4Lmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
