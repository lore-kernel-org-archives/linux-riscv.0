Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF47CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 03:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mslRE3yxhYXGLF0YssUGyubi/079P6OsTyQvZM9R9pc=; b=GOFnFzpbjykApPxAZSA+l8lVac
	hDDoM8JkWk+RkDk/QVgVysC1xHyfKi1Vp8caHsawLKqAFW7NtIkcPsP6AyKsloSHaa1dq19v48lj9
	eayXUjjWs3r5zgvGL3RqIm1/rCg4bYwC4y20KmyIUYL5/VSarX989Wg/OzjN0TbegXzqW9rjHXFCg
	Vpjs2v3uvPQBZu9JAwFenrIVLQJ1mS9LH3Isrr395NCpWsSkd4DEyS0IjAqz+uqcRrELLaUvVEmkE
	59aydi65X2kykfjDcxu8BJECx9UrCqu5avCTB48VbvXpCo0J8AbRawr15VXWlINPCfSocijDi0kOS
	jMR4CJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iH2-0000000Dago-20NB;
	Sun, 28 Sep 2025 03:40:32 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iGz-0000000Daei-20Xi
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 03:40:31 +0000
Message-ID: <fb7c70eb-ea8f-4da1-8194-738367c2b92f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759030824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtTopic9YQwr2HQE5cEUgdOxaEU/xcnxbY//ZaC/05k=;
	b=jrwKuomh+ByTRwiaJk64P5YMEBlUoeCdajme9WFq6oHnORlWBBj5CZTvVNNNtTsLqh9fk5
	bEE2rVJtoCsWqrlofcMcL8NRgHKe2Ba4Rv4ly8DDalQTsCfZvL65xbdLKFLlSZ8Pktn9ov
	3DSmU79tOJ4+1X3Cu/as7+RbU8wkui8=
Date: Sat, 27 Sep 2025 20:40:19 -0700
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3A_CFP_Now_Open=3A_RISC-V_Microconference_at_LPC_2025_?=
 =?UTF-8?B?KFRva3lvLCBEZWMgMTHDojEzKQ==?=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
To: linux-riscv@lists.infradead.org
References: <b8f3af23-045f-43e7-9a8c-542260475bb5@linux.dev>
Content-Language: en-US
In-Reply-To: <b8f3af23-045f-43e7-9a8c-542260475bb5@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_204029_736202_CF295890 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ClJlbWluZGVyOiBUaGUgQ0ZQIGNsb3NlcyBpbiAyIGRheXMhCgpQbGVhc2Ugc3VibWl0IHlvdXIg
dG9waWNzIGlmIHlvdSBoYXZlbid0IGFscmVhZHkgZG9uZSBzbyEKCk9uIDcvMzAvMjUgMTA6NTkg
QU0sIEF0aXNoIFBhdHJhIHdyb3RlOgo+IEhpIGV2ZXJ5b25lLAo+IAo+IFRoZSBDYWxsIGZvciBQ
cm9wb3NhbHMgZm9yIHRoZSBSSVNDLVYgTWljcm9jb25mZXJlbmNlWzFdIGF0IExpbnV4IAo+IFBs
dW1iZXJzIENvbmZlcmVuY2UgMjAyNVsyXSBpcyBub3cgb3Blbi4KPiBEb27igJl0IG1pc3MgeW91
ciBjaGFuY2UgdG8gc3VibWl0IGEgdG9waWMgcHJvcG9zYWwhCj4gCj4gS2V5IGRldGFpbHM6Cj4g
Cj4gIMKgKgo+IAo+ICDCoMKgIFN1Ym1pc3Npb24gZGVhZGxpbmU6IFNlcHRlbWJlciAyOSwgMjAy
NQo+IAo+ICDCoCoKPiAKPiAgwqDCoCBTdWJtaXNzaW9uIGxpbms6IGh0dHBzOi8vbHBjLmV2ZW50
cy9ldmVudC8xOS9hYnN0cmFjdHMvCj4gIMKgwqAgKE1ha2Ugc3VyZSB0byBzZWxlY3QgdGhlICJS
SVNDLVYgTUMiIHRyYWNrIHdoZW4gc3VibWl0dGluZy4pCj4gCj4gIMKgKgo+IAo+ICDCoMKgIENv
bmZlcmVuY2UgZGF0ZXM6IERlY2VtYmVyIDEx4oCTMTMsIDIwMjUgKFRodXJzZGF5IHRvIFNhdHVy
ZGF5KQo+IAo+ICDCoCoKPiAKPiAgwqDCoCBMb2NhdGlvbjogVG9yYW5vbW9uIEhpbGxzIEZvcnVt
LCBUb2t5bywgSmFwYW4KPiAKPiAgwqAqCj4gCj4gIMKgwqAgRm9ybWF0OiBIeWJyaWQgKGluLXBl
cnNvbiBhbmQgcmVtb3RlKS4KPiAgwqDCoCBIb3dldmVyLCB3ZSBzdHJvbmdseSBlbmNvdXJhZ2Ug
cHJlc2VudGVycyB0byBhdHRlbmQgaW4gcGVyc29uIHRvCj4gIMKgwqAgbWluaW1pemUgdGVjaG5p
Y2FsIGlzc3VlcyBhbmQgc3VwcG9ydCBkZWVwZXIgZGlzY3Vzc2lvbnMuCj4gCj4gRHVlIHRvIGxp
bWl0ZWQgdGltZSBzbG90cywgdG9waWNzIHdpbGwgYmUgYWNjZXB0ZWQgb24gYSByb2xsaW5nIGJh
c2lzLCAKPiBzbyBlYXJsaWVyIHN1Ym1pc3Npb25zIGFyZSBlbmNvdXJhZ2VkLgo+IAo+IExvb2tp
bmcgZm9yd2FyZCB0byB5b3VyIHByb3Bvc2FscyBhbmQgc2VlaW5nIG1hbnkgb2YgeW91IGF0IExQ
QyAyMDI1Lgo+IAo+IEJlc3QgcmVnYXJkcywKPiBBdGlzaAo+IAo+IFsxXSBodHRwczovL2xwYy5l
dmVudHMvZXZlbnQvMTkvY29udHJpYnV0aW9ucy8/IAo+IGNvbmZpZz0zNjdhM2JkZi03NDA1LTQ4
YzUtYThiZS1iZGE4MTBjMjgyOTcKPiBbMl0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE5L3Bh
Z2UvMjQ0LWxwYy0yMDI1LW92ZXJ2aWV3Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
