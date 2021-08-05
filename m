Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05B0C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 21:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75B8601FE
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 21:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A75B8601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HIpBr1cAJCFoyiPwo5a4Rxw+XsnP57xXa/mUSYRuDao=; b=2x6zfQuzTTWHCcStViQ+run5Wx
	2X241pUlojSTvVxbQiGKKjxRhtRitIXtA/AKoZMIfAY0hGRdcPT51khXsuVHULL8mYAijNFFlKUUD
	QgPwB16QW+wUy8J5ddLFk1qAnMj29q2GZOdWYeVgEUth4Dr6CuY2Sr5DHvfydMmciPNjY3cDjB5Ap
	poyIjtKjMIvQSM2fueMEedFNFQfLY740IvBPRk6kVThLPXjsGKiRNWncDxZqL5jbDW60yhim//TjP
	y++XVNrTdPfEVKg+wFHdBkInpc0UUZyLRv6D60ZphveAV85RMzkoz9al6IhIkbzRlrT6Wr3nWzST4
	TjkywEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBkZc-00AnnQ-69; Thu, 05 Aug 2021 21:06:40 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBkYu-00An5o-Oo
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 21:05:58 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 cl16-20020a17090af690b02901782c35c4ccso8909085pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1A6zVE75UmYU5dEKrc8fYnAEYlLr4AgyRlgzHl1LV5k=;
 b=Y5GOTUdp8MJXWCRjR1j2OkcZX2oliw36EJjtQcFYxVsy173dwxL6JYIAsyg/OXEVvx
 dlV1S/UrN6mNp42hAZhffcOMWAxS4o8xgYxDNJ9mCd31P0OmX5JhMHJ6K0ViVssTBPEY
 K24jxMcKxA7pDhyGu203/0bNwpMoOleRvSc2fVxruapjrR3pFwBmopqhVpRW0j56OeYa
 LnYSkc4Ed4SoetXzrfxdpnDECy2r2EgcIFA0VCMokmo6tMAXQjcOh4KL7Ck+ZemP8y3H
 JyGnOXJfX3pjC5UDWOw4EK1M+F7/Q/Gd82bbymCLzNnJsL0NvaXDyeWVy5dRRMpzc9/p
 47ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=1A6zVE75UmYU5dEKrc8fYnAEYlLr4AgyRlgzHl1LV5k=;
 b=iEjByz9TJc4T3VOEvdiKQynu95dUumHh699RRNnSy7baxcAhPVWgiHSl01Pw8w6pKh
 b0xpRPif3GZxr08xhz7qYTc4rpuBcGEzLZs4BaiA/KTCn61IpZri1578UZQ9p5Lbabnm
 ZhuhU/aPL3TH1CG9/Q7JcWy4Z6xph3jy4RaJGSL4h8CxaqAFYTK7y8T29rvF3nMYSrYj
 fRC9K42znul2OWLlhDaZ5sCO6QpgQIh0VPPGcmeyKg7ksNL1nNgd8jVSrflmLwndV4ft
 27BMrb8X1ZqQ/uanpw6GhvxwkXZSxjG1KyKVI+oKx7uvD4/hdaE/XFjd9yllC6wngoit
 4y9Q==
X-Gm-Message-State: AOAM530NPEx6tzjrGRItdCQ+03ZjEdEWJCTDjeOVzvSXW/VJSrKTBoxi
 lXaGMaTTVWp5jPuR6c+u6eo=
X-Google-Smtp-Source: ABdhPJxwVkQXXT3SxA0VSdCPH7nyKwX4tv6xX7GnGltKqlDUosvprzvgHIw1ZZJTz6Xd3vjdz/RIlQ==
X-Received: by 2002:a17:902:6b09:b029:129:c61e:e31a with SMTP id
 o9-20020a1709026b09b0290129c61ee31amr5480995plk.57.1628197555914; 
 Thu, 05 Aug 2021 14:05:55 -0700 (PDT)
Received: from [0.0.0.0] (hope.twd2.net. [45.32.56.123])
 by smtp.gmail.com with ESMTPSA id q21sm8694240pgk.71.2021.08.05.14.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 14:05:55 -0700 (PDT)
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 masahiroy@kernel.org, keescook@chromium.org,
 Nick Desaulniers <ndesaulniers@google.com>
References: <mhng-4af8be52-7620-478b-bf69-73306a2ffc3b@palmerdabbelt-glaptop>
 <a6615b69-d99f-220b-d980-1f5f40ee2999@gmail.com>
 <CAFP8O3JKw5CHiYwM3Pqj5w3vnib0UW2PEs8HRBORci9dSAXwwg@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
Message-ID: <ea692a6e-5920-e03a-6083-59fa833d6437@gmail.com>
Date: Fri, 6 Aug 2021 05:05:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFP8O3JKw5CHiYwM3Pqj5w3vnib0UW2PEs8HRBORci9dSAXwwg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_140556_852611_02910875 
X-CRM114-Status: GOOD (  20.27  )
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

SGksCgpJIHRoaW5rIHdlIGV2ZW4gZG9uJ3QgbmVlZCB0aGlzIG9wdGlvbiBhZnRlciB0aGUgaXNz
dWUgSSBmaWxlZCBpcyBmaXhlZC4KClRoYW5rcyEKV2VuZGUKCgpPbiAyMDIxLzgvNiA0OjE4LCBG
xIFuZy1ydcOsIFPDsm5nIHdyb3RlOgo+IE9uIFRodSwgQXVnIDUsIDIwMjEgYXQgMToxMiBQTSB0
d2QyIDx0d2QyLm1lQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFN1cmUuIEknbGwgc2VuZCBhIHYyIGFm
dGVyIHRoZSBMTFZNIGlzc3VlIGlzIHJlc29sdmVkLgo+Pgo+PiBUaGFua3MhCj4+IFdlbmRlCj4+
Cj4+Cj4+IE9uIDIwMjEvOC81IDQ6NTksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4gT24gTW9u
LCAxOSBKdWwgMjAyMSAxNDoxNDo1OSBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdvb2dsZS5j
b20gd3JvdGU6Cj4+Pj4gT24gTW9uLCBKdWwgMTksIDIwMjEgYXQgMTo1MyBQTSBXZW5kZSBUYW4g
PHR3ZDIubWVAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4gUGFzcyBgLW1hdHRyYCB0byBgbGxkYCBz
byB0aGF0IGl0IGNhbiBnZW5lcmF0ZSBwcm9wZXIgbWFjaGluZSBjb2RlLgo+Pj4+PiBCeSB0aGUg
d2F5LCBpdCBzZWVtcyB0aGF0IGAtbWFyY2hgIGRvZXMgbm90IHdvcmsgd2VsbCBub3cuCj4+Pj4+
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlbmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4+Pj4+
IC0tLQo+Pj4+PiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDcgKysrKysrKwo+Pj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4+Pj4gaW5kZXggYmM3NGFmZGJm
MzFlLi5iYmMxODZhM2FiNDUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUK
Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+Pj4+PiBAQCAtNTIsOSArNTIsMTYgQEAg
cmlzY3YtbWFyY2gtJChDT05GSUdfQVJDSF9SVjMySSkgICAgIDo9IHJ2MzJpbWEKPj4+Pj4gIHJp
c2N2LW1hcmNoLSQoQ09ORklHX0FSQ0hfUlY2NEkpICAgICAgIDo9IHJ2NjRpbWEKPj4+Pj4gIHJp
c2N2LW1hcmNoLSQoQ09ORklHX0ZQVSkgICAgICAgICAgICAgIDo9ICQocmlzY3YtbWFyY2gteSlm
ZAo+Pj4+PiAgcmlzY3YtbWFyY2gtJChDT05GSUdfUklTQ1ZfSVNBX0MpICAgICAgOj0gJChyaXNj
di1tYXJjaC15KWMKPj4+Pj4gK3Jpc2N2LW1hdHRyLXkgICAgICAgICAgICAgICAgICAgICAgICAg
IDo9ICttLCthCj4+Pj4+ICtyaXNjdi1tYXR0ci0kKENPTkZJR19GUFUpICAgICAgICAgICAgICA6
PSAkKHJpc2N2LW1hdHRyLXkpLCtmLCtkCj4+Pj4+ICtyaXNjdi1tYXR0ci0kKENPTkZJR19SSVND
Vl9JU0FfQykgICAgICA6PSAkKHJpc2N2LW1hdHRyLXkpLCtjCj4+Pj4+ICBLQlVJTERfQ0ZMQUdT
ICs9IC1tYXJjaD0kKHN1YnN0IGZkLCwkKHJpc2N2LW1hcmNoLXkpKQo+Pj4+PiAgS0JVSUxEX0FG
TEFHUyArPSAtbWFyY2g9JChyaXNjdi1tYXJjaC15KQo+Pj4+Pgo+Pj4+PiAraWZlcSAoJChDT05G
SUdfTERfSVNfTExEKSx5KQo+Pj4+PiArICAgICAgIEtCVUlMRF9MREZMQUdTICs9IC1tbGx2bSAt
bWF0dHI9JChyaXNjdi1tYXR0ci15KQo+Pj4+IFdlIHNob3VsZCBwcmV2ZW50IHRoZSBwcm9saWZl
cmF0aW9uIG9mIHRoZSBjb21waWxlciBpbnRlcm5hbCBgLW1sbHZtYAo+Pj4+IGZsYWdzIGZyb20g
S2J1aWxkIE1ha2VmaWxlczsgdGhlc2UgYXJlIGluZGljYXRpdmUgb2YgTExWTSBJUiBzcGVjaWZp
Ywo+Pj4+IGlzc3VlcyB3aXRoIHJlZ2FyZHMgdG8gTFRPLiAgQ2FuIHlvdSBwbGVhc2UgZmlsZSBh
IGJ1ZyBhZ2FpbnN0IExMVk0KPj4+PiB0aGF0IGAtbWF0dHJgIHNob3VsZCBiZSBlbmNvZGVkIGlu
IHRoZSBJUiBmb3IgTFRPJ3Mgc2FrZT8KPj4+IFdvcmtzIGZvciBtZS4gIEknbGwgaG9sZCBvZmYg
b24gdGFraW5nIHRoaXMgdW50aWwgdGhlIExMVk0gYnVnIGdldHMgc29ydGVkIG91dCBhbmQgZXhw
ZWN0IGEgdjIgKGlkZWFsbHkgd2l0aCB0aGUgb3RoZXIgdGV4dHVhbCBjaGFuZ2VzIE5pY2sgc3Vn
Z2VzdGVkKS4KPj4+Cj4+PiBUaGFua3MhCj4gRm9yIEdOVSBsZCBjb21wYXRpYmlsaXR5OiAtbWxs
dm0gLW1hdHRyPXh4eCA9PiAtcGx1Z2luLW9wdD0tbWF0dHI9eHh4Cj4KPiBXaGljaCBjYW4gYWxs
b3cgdXMgdG8gZHJvcCB0aGUgQ09ORklHX0xEX0lTX0xMRCBjb25kaXRpb24uCj4gKGdvbGQgZG9l
c24ndCBzdXBwb3J0IFJJU0MtViB5ZXQuKQo+Cj4gTm90ZTogTExWTSBMVE8gKyBHTlUgbGQgc3Vw
cG9ydCBpcyBleHBlcmltZW50YWwgYW5kIGhhcyB2ZXJ5IGxpdHRsZSB0ZXN0aW5nLgo+IFRvIGFj
dHVhbGx5IG1ha2UgR05VIGxkIHdvcmssIHdlIHByb2JhYmx5IGFsc28gbmVlZCB0byB0ZWFjaCBH
TlUgbm0KPiBhbmQgYXIgdG8gc3BlY2lmeSAtLXBsdWdpbiBMTFZNZ29sZC5zbwo+IGh0dHBzOi8v
bGx2bS5vcmcvZG9jcy9Hb2xkUGx1Z2luLmh0bWwKPgo+Cj4+Pj4gU2VlIGFsc286Cj4+Pj4gY29t
bWl0IDAyMzY1MjZkNzZiOCAoIk1ha2VmaWxlOiBsdG86IFBhc3MgLXdhcm4tc3RhY2stc2l6ZSBv
bmx5IG9uIExMRAo+Pj4+IDwgMTMuMC4wIikKPj4+PiBjb21taXQgMjM5OGNlODAxNTJhICgieDg2
LCBsdG86IFBhc3MgLXN0YWNrLWFsaWdubWVudCBvbmx5IG9uIExMRCA8IDEzLjAuMCIpCj4+Pj4K
Pj4+Pj4gK2VuZGlmCj4+Pj4+ICsKPj4+Pj4gIEtCVUlMRF9DRkxBR1MgKz0gLW1uby1zYXZlLXJl
c3RvcmUKPj4+Pj4gIEtCVUlMRF9DRkxBR1MgKz0gLURDT05GSUdfUEFHRV9PRkZTRVQ9JChDT05G
SUdfUEFHRV9PRkZTRVQpCj4+Pj4+Cj4+Pj4+IC0tCj4+IC0tCj4+IFlvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
IkNsYW5nIEJ1aWx0IExpbnV4IiBncm91cC4KPj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdy
b3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBj
bGFuZy1idWlsdC1saW51eCt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+PiBUbyB2aWV3
IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5j
b20vZC9tc2dpZC9jbGFuZy1idWlsdC1saW51eC9hNjYxNWI2OS1kOTlmLTIyMGItZDk4MC0xZjVm
NDBlZTI5OTklNDBnbWFpbC5jb20uCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
