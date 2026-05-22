Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF04CD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7xsMa20rfoR/5deYIKAjCoGicKz2zm9ZNr902GtR+A=; b=kGpcQgUQpTmKvZ
	REilgY5B6i4iE9NnObI4UgAtJHe0bffT0Ffq0j/eybYV40eGAMMaMELiaD4ivmayJCLEQa0sYB3eM
	YyH3LYx3iO+pSPxJNUQPHPIfiwC6Fa/zlvoU9TbVUSFqZepgpzYU+H+ZEa7zJ9WrCVYPIWrVsyTMF
	KkzSDkSSlyonsrXVq9vdurcZ5YZm7qOQtloI7KsJBY9PN0vskoGkisEKmm5D9Xw2KwG4ynZV57VM5
	L4T1R3JrN19Sz7qX/eplgytqSaAdMkGXamBhUObQDkGaJZrcrRTO6lqnEdR7YkBHs7Zd7MZdEJYFm
	9YRGiFIUQZVaTmANXVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKJM-0000000A5ZG-0pCA;
	Fri, 22 May 2026 07:28:48 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKJK-0000000A5Xn-0JWt
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 07:28:47 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4854b95c307so176722b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 00:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779434922; cv=none;
        d=google.com; s=arc-20240605;
        b=h7Ow6C6Pf03+jBcfAxAv/m2+pUd6fWehEzyoDQjYQhzPAp469e7Rb7h1tCGx9Hg7sa
         AMg2+NkCcx58MY7/XTGnmuOjNf4FJ+M6B6Xts2jKWaMtT6uBbno/KpJ2nOEmEgd9/3TP
         TvFvHq1JMVcD4mvo9Iv3mqEvKCsTrZDVsN7WMkpWoghMjPaHb7d7Kb0zLlcn9ETjSHah
         fhIY7434meVQvLS8LDdu8Z7gWZJPFhzhG5i4x8dcOWPYjZJTEB0qA2hdab/TRtZEJBHy
         5tzBBtyPWCXZLLRAC0nGynqjueHMaNMQugg8l8QWNLeIKwCw070dthIBX3Srq1iqCgM5
         FMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HZS9hgh8aLsGbUrSZZTTZWq59knACBwFo2r8d6GPxEQ=;
        fh=uZJsQAG0AAEY5W71VUod8jRN4xoT0jTypZUVMxRFHyE=;
        b=cDlaNyhx4eIDZsa98UQVIwYhygMSKO75ucLb8xa2/NIf8zJMtc8nCCd6TifjP0sI4D
         AxBG+dZItTXbBHW9fYhJLm4571x4WWgl8ly/NdMTbsZnBMUufrCDxioLqPUyI3qioMDI
         mT7tL9ve3eSv2FKXceSWA3yxAEzi6Efd8kf4eMZ5BglIOMxSLwyf5C8gtBIk+jhfY8+C
         8oY9ciK5qhaZOCMM9tkyhHM8+TmVQH9eMefTVcJfhmnB9pMpBr40QTpDicn2u9Mc3Vg4
         RSdlQght0PnfB5FJ8kL8tB5YTLj1TgkTybAFhy7JoR4x1+QwKL461FXvfSUGIs0TvfoH
         J1gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779434922; x=1780039722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZS9hgh8aLsGbUrSZZTTZWq59knACBwFo2r8d6GPxEQ=;
        b=TCp7yp/+GCAgQVkyPczYwUJzFKptyRu0RGQBljLzNT6JkxGXA5fB0QwkertB8tNLYz
         cZBqxrgrs9WBtQwfZ0zEjfZPUXz/pVOivugTQCpSMiXacv0hhVpjzxbE3otE8Oo+/oTp
         bqL+y4OaV93xLc85PN7T5tObfKx5uE20RQo0krOkleEPGpRAbUcGhnNrmkzCZFKgBXfN
         B/XPwu3lSnoBr4QDgQwHN3cGzwrghv3eVDmReYQIlGflEnZ4ZedlD/GbOT07KGMHtXfj
         eTazoo62I13pr56JP/XRJWbjUnkvjwhtCgMvu4t28lti0LgRq/8TgldcCaBRYThV3nQ6
         vn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434922; x=1780039722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZS9hgh8aLsGbUrSZZTTZWq59knACBwFo2r8d6GPxEQ=;
        b=FDHvp0LgsZjZmJADBszQvKSOPNtgDwUk+IF9U7fgZBeNMpMLEqbVGbB+0MALeue8/I
         +ohaVxIkP6xHjF6rKtjgf+l/e47qUFa3PI7OSQ0WGxE+FkzfmsC+fu47ba4JQ7jUteiX
         2JbUU+lsknLC8zKOmXb9qADFXfgDYq6N1v73ENNgMmmGPTGEdlwnmZNjyZs9m56coJ/R
         Fd3TXAEOv/ultlBad2zXaWTO4mI5zVAYIfFyNpIi0ES3Q8d9p4D3IenslK9RxXgd/tKX
         HS73mZ4cRYR06Sb7F+oRjHDXEi6OQO9eh7o2cwpy9Sj426VlwNFuCQqyADDfuE0XsaLL
         zZjg==
X-Forwarded-Encrypted: i=1; AFNElJ/S4st6MPl9q0PfQbicDKT9YQ/OYukeoDXDzTQoVaolczveMuBnCeGzg5aid7t2DqP21yWpnuxvgJs8Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX1v4Q+FMFK7HUSeWzgzDEi1UbE6LRD4xxQCfjCcNuFxwXhw1q
	ODCUVEKkM9coAMX0AoBaNjz03wgmOEZiDxYiDrwOFO6r3FqgDzFXXANR3n4IFBE+jLLE2mk96nG
	sxGTf9Vh9kAd/uVHXIzf00dfS7l01nXGxXmJiwb1Flg==
X-Gm-Gg: Acq92OEjUZEqbhPYKBRP5RV/do/3r3wO/mJgPySHf1QqWv8GSTegTs+r6CAn1Yzb//G
	dIW0UFAf1etVK5siLxySs6x5yGcqNwqEWlZd1yvjwFpkU0rNU2EjHE60yx2nC2b2Vb9L5A/HECf
	h+W8g4+rKAXW5rsxLFDWQ2ErXyEwsNRiDDZHHLVwAAAdR1Ag7TBUPr6Vbmvki5kdNUgpykecuPI
	4KYJDAu/VEdvfhiRDGwGaFNyOAF6ktRxn3wBbHwOnNfp6mXjjO5/uTLDH5D79GwX7M/4twYm72+
	39kiu7BMRMU+gBnNVrr13uGB
X-Received: by 2002:a05:6808:1719:b0:482:ce40:ab59 with SMTP id
 5614622812f47-4854a1d41f1mr1346942b6e.31.1779434922283; Fri, 22 May 2026
 00:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260519031927.70683-1-cuiyunhui@bytedance.com> <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
In-Reply-To: <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 22 May 2026 15:28:30 +0800
X-Gm-Features: AVHnY4JFzF7z73DMmpzBJSQ8T8EFzchSfqwyJUgoPainYvykmkyrMOCzZ6WBYfY
Message-ID: <CAEEQ3wkvH69Q2MoWoqyWC-P-hY1RKSN_tdvSsj-c0Tkz86moDg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] riscv: track effective hardware PTE
 A/D updates
To: Michael Ellerman <mpe@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	akpm@linux-foundation.org, pasha.tatashin@soleen.com, 
	andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com, debug@rivosinc.com, 
	baolin.wang@linux.alibaba.com, zhangchunyan@iscas.ac.cn, apopple@nvidia.com, 
	namcao@linutronix.de, wangruikang@iscas.ac.cn, apatel@ventanamicro.com, 
	liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com, 
	pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_002846_135075_4BB68B71 
X-CRM114-Status: GOOD (  32.64  )
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

SGkgTWljaGFlbCwKCk9uIFR1ZSwgTWF5IDE5LCAyMDI2IGF0IDg6MDXigK9QTSBNaWNoYWVsIEVs
bGVybWFuIDxtcGVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxOS81LzIwMjYgMTM6MTksIFl1
bmh1aSBDdWkgd3JvdGU6Cj4gPiBTZXBhcmF0ZSBTdmFkdSBjYXBhYmlsaXR5IGRpc2NvdmVyeSBm
cm9tIHRoZSBob3N0J3MgZWZmZWN0aXZlIEFEVUUKPiA+IHN0YXRlLiBFbmFibGUgU0JJIEZXRlQg
UFRFIEEvRCBoYXJkd2FyZSB1cGRhdGluZyBvbiBlYWNoIG9ubGluZSBDUFUKPiA+IHRocm91Z2gg
Q1BVSFAgd2hlbiBib3RoIFN2YWRlIGFuZCBTdmFkdSBhcmUgcHJlc2VudCwgdXNlIHRoZSByZXN1
bHRpbmcKPiA+IHJ1bnRpbWUgc3RhdGUgZm9yIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpLCBhbmQg
ZmFsbCBiYWNrIHRvCj4gPiBzb2Z0d2FyZS1tYW5hZ2VkIEEvRCB1cGRhdGVzIHdoZW4gZW5hYmxp
bmcgdGhlIGZlYXR1cmUgZmFpbHMuCj4gPgo+ID4gUGxhdGZvcm1zIHdpdGggU3ZhZHUgYnV0IHdp
dGhvdXQgU3ZhZGUgYXJlIHRyZWF0ZWQgYXMgYWx3YXlzIHVzaW5nCj4gPiBoYXJkd2FyZSBQVEUg
QS9EIHVwZGF0ZXMuIEV4cG9zZSB0aGUgcnVudGltZSBzdGF0ZSB0aHJvdWdoIGFuIGlubGluZQo+
ID4gZ2V0dGVyIHNvIGhvdCBNTSBwYXRocyBhdm9pZCBhbiBvdXQtb2YtbGluZSBmdW5jdGlvbiBj
YWxsLgo+Cj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gVGhlIGN1cnJlbnQgY29k
ZSBkb2Vzbid0IHVzZSBhbgo+IG91dC1vZi1saW5lIGZ1bmN0aW9uIGNhbGwgQUZBSUNTPyBNb3Jl
IGNvbW1lbnRzIGJlbG93IC4uLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBRaW5nd2VpIEh1IDxxaW5nd2Vp
Lmh1QGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmggfCAgNiArKysKPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggICAgfCAgOCArKy0tCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAg
IHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCA3NyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaAo+ID4gaW5kZXggNzM5ZmNjODRiZjdiMi4uODc3ZDcxYTFlYTc1NSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gQEAgLTEyOCw2ICsx
MjgsMTIgQEAgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSB7Cj4gPiAgIGV4dGVybiBjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXTsKPiA+ICAgZXh0ZXJuIGNv
bnN0IHNpemVfdCByaXNjdl9pc2FfZXh0X2NvdW50Owo+ID4gICBleHRlcm4gYm9vbCByaXNjdl9p
c2FfZmFsbGJhY2s7Cj4gPiArZXh0ZXJuIGJvb2wgcmlzY3ZfaHdfcHRlX2FkX3VwZGF0aW5nX2Vu
YWJsZWQ7Cj4gPiArCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2hhc19o
d19wdGVfYWRfdXBkYXRpbmcodm9pZCkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gUkVBRF9PTkNF
KHJpc2N2X2h3X3B0ZV9hZF91cGRhdGluZ19lbmFibGVkKTsKPiA+ICt9Cj4gPgo+ID4gICB1bnNp
Z25lZCBsb25nIHJpc2N2X2lzYV9leHRlbnNpb25fYmFzZShjb25zdCB1bnNpZ25lZCBsb25nICpp
c2FfYml0bWFwKTsKPiA+ICAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9o
YXNfZXh0ZW5zaW9uX2xpa2VseShpbnQgY3B1LCBjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBpbmRleCBhMWE3YzY1MjBhMDk1Li4yMDY2M2E0
NjZjZjZjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtNzMyLDE0
ICs3MzIsMTQgQEAgc3RhdGljIGlubGluZSBwZ3Byb3RfdCBwZ3Byb3Rfd3JpdGVjb21iaW5lKHBn
cHJvdF90IF9wcm90KQo+ID4gICAjZGVmaW5lIHBncHJvdF9kbWFjb2hlcmVudCBwZ3Byb3Rfd3Jp
dGVjb21iaW5lCj4gPgo+ID4gICAvKgo+ID4gLSAqIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGNvbnRy
b2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4gdGhlIFBURSBBL0QgYml0cyBuZWVkIHRvIGJl
IHNldC4gQnkKPiA+IC0gKiBkZWZhdWx0IHRoZSBNLW1vZGUgZmlybXdhcmUgZW5hYmxlcyB0aGUg
aGFyZHdhcmUgdXBkYXRpbmcgc2NoZW1lIHdoZW4gb25seSBTdmFkdSBpcyBwcmVzZW50IGluCj4g
PiAtICogRFQuCj4gPiArICogQm90aCBTdmFkZSBhbmQgU3ZhZHUgY29udHJvbCB0aGUgaGFyZHdh
cmUgYmVoYXZpb3Igd2hlbiB0aGUgUFRFIEEvRCBiaXRzCj4gPiArICogbmVlZCB0byBiZSBzZXQu
IFRoZSBjb3JlIE1NIGNvZGUgb25seSBjYXJlcyB3aGV0aGVyIGhhcmR3YXJlIHVwZGF0aW5nIG9m
Cj4gPiArICogdGhlIGFjY2Vzc2VkL2RpcnR5IHN0YXRlIGlzIGN1cnJlbnRseSBhY3RpdmUuCj4g
PiAgICAqLwo+ID4gICAjZGVmaW5lIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyBhcmNoX2hhc19od19w
dGVfeW91bmcKPiA+ICAgc3RhdGljIGlubGluZSBib29sIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyh2
b2lkKQo+ID4gICB7Cj4gPiAtICAgICByZXR1cm4gcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2Vs
eShSSVNDVl9JU0FfRVhUX1NWQURVKTsKPiA+ICsgICAgIHJldHVybiByaXNjdl9oYXNfaHdfcHRl
X2FkX3VwZGF0aW5nKCk7Cj4gPiAgIH0KPgo+IHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHko
KSB1c2VzIGFuIGFzbSBhbHRlcm5hdGl2ZSwgaWUuIGl0J3MgcGF0Y2hlZAo+IGF0IGJvb3Qgc28g
dGhlcmUncyBubyBydW50aW1lIGNvc3QuIEJ1dCBub3cgeW91J3ZlIGNoYW5nZWQgaXQgdG8ganVz
dAo+IHRlc3QgYSBib29sLgo+Cj4gSSdtIG5vdCBzdXJlIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygp
IGlzIGEgcGFydGljdWxhcmx5IGhvdCBwYXRoLCBidXQKPiBzZWVtcyBsaWtlIHlvdSBjb3VsZCB1
c2UgYSBzdGF0aWMga2V5LCBzbyB0aGF0IHRoZSBjb2RlIGlzIHBhdGNoZWQgdG8KPiBhdm9pZCB0
aGUgcnVudGltZSB0ZXN0PwoKT2theSwgSSB3aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCBwYXRjaCB2
ZXJzaW9uLgoKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggZjQ2YWE1NjAyZDc0
ZC4uZTQ2YjJkMmI0OWVlZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAt
MzUsNiArMzUsOCBAQAo+ID4gICBzdGF0aWMgYm9vbCBhbnlfY3B1X2hhc196aWNib3o7Cj4gPiAg
IHN0YXRpYyBib29sIGFueV9jcHVfaGFzX3ppY2JvcDsKPiA+ICAgc3RhdGljIGJvb2wgYW55X2Nw
dV9oYXNfemljYm9tOwo+ID4gK2Jvb2wgcmlzY3ZfaHdfcHRlX2FkX3VwZGF0aW5nX2VuYWJsZWQg
X19yZWFkX21vc3RseTsKPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9od19wdGVfYWRfdXBk
YXRpbmdfZW5hYmxlZCk7Cj4gPgo+ID4gICB1bnNpZ25lZCBsb25nIGVsZl9od2NhcCBfX3JlYWRf
bW9zdGx5Owo+ID4KPiA+IEBAIC0yODcsMTUgKzI4OSw3NCBAQCBzdGF0aWMgaW50IHJpc2N2X2V4
dF96dmZiZndtYV92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRh
LAo+IC4uLgo+ID4KPiA+ICtzdGF0aWMgaW50IF9faW5pdCByaXNjdl9od19wdGVfYWRfdXBkYXRp
bmdfaW5pdCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIGJvb2wgaGFzX3N2YWRlLCBoYXNfc3ZhZHU7
Cj4gPiArICAgICBpbnQgc3RhdGU7Cj4gPiArCj4gPiArICAgICBoYXNfc3ZhZGUgPSByaXNjdl9o
YXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1ZBREUpOwo+ID4gKyAgICAgaGFz
X3N2YWR1ID0gcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NWQURV
KTsKPiA+ICsKPiA+ICsgICAgIGlmICghaGFzX3N2YWR1KQo+ID4gKyAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+ICsKPiA+ICsgICAgIGlmICghaGFzX3N2YWRlKSB7Cj4gPiArICAgICAgICAgICAg
IHJpc2N2X3NldF9od19wdGVfYWRfdXBkYXRpbmcodHJ1ZSk7Cj4gPiArICAgICAgICAgICAgIHBy
X2luZm8oInJpc2N2OiBoYXJkd2FyZSBQVEUgQS9EIHVwZGF0aW5nIGVuYWJsZWRcbiIpOwo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IFRoaXMgYmxvY2sgaXMgaWRlbnRpY2FsIHRvIHRo
ZSB0YWlsIG9mIHRoZSBmdW5jdGlvbi4gSSdkIHByb2JhYmx5IHVzZQo+ICJnb3RvIGVuYWJsZSIs
IHdpdGggYW4gImVuYWJsZSIgbGFiZWwgYmVsb3cuCgpPa2F5LCBJIHdpbGwgdXBkYXRlIGluIHRo
ZSBuZXh0IHBhdGNoIHZlcnNpb24uCgo+Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBzdGF0
ZSA9IGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX09OTElORV9EWU4sCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJyaXNjdi9wdGUtYWQ6c3RhcnRpbmciLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9od19wdGVfYWRfdXBkYXRpbmdfc3RhcnRp
bmcsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2h3X3B0ZV9hZF91
cGRhdGluZ19keWluZyk7Cj4gPiArICAgICBpZiAoc3RhdGUgPCAwKSB7Cj4gPiArICAgICAgICAg
ICAgIHByX2luZm8oInJpc2N2OiBsZWF2ZSBQVEUgQS9EIHVwZGF0ZXMgc29mdHdhcmUtbWFuYWdl
ZCAoJWQpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXRlKTsKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAg
ICogQSBzdWNjZXNzZnVsIENQVUhQX0FQX09OTElORV9EWU4gcmVnaXN0cmF0aW9uIG1lYW5zIHRo
ZSBzdGFydHVwCj4gPiArICAgICAgKiBjYWxsYmFjayBoYXMgYWxyZWFkeSBzdWNjZWVkZWQgb24g
YWxsIG9ubGluZSBDUFVzLgo+ID4gKyAgICAgICovCj4KPiBlbmFibGU6Cj4gPiArICAgICByaXNj
dl9zZXRfaHdfcHRlX2FkX3VwZGF0aW5nKHRydWUpOwo+ID4gKyAgICAgcHJfaW5mbygicmlzY3Y6
IGhhcmR3YXJlIFBURSBBL0QgdXBkYXRpbmcgZW5hYmxlZFxuIik7Cj4KPiBwcl9pbmZvKCkgbWln
aHQgYmUgYSBiaXQgdmVyYm9zZSBmb3IgdGhpcy4gSSB0aGluayBwcmludGsoS0VSTl9ERUJVRyAu
LikKPiB3b3VsZCBiZSBiZXR0ZXIsIHRoYXQgd2F5IHRoZSBtZXNzYWdlIGlzIGFsd2F5cyBhdmFp
bGFibGUgaW4gZG1lc2cgYnV0Cj4gaXNuJ3Qgc2VudCB0byB0aGUgY29uc29sZQoKV2lsbCB1cGRh
dGUgaW4gbmV4dCB2ZXJzaW9uLgoKPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+ICth
cmNoX2luaXRjYWxsKHJpc2N2X2h3X3B0ZV9hZF91cGRhdGluZ19pbml0KTsKPgo+IGNoZWVycwoK
VGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
