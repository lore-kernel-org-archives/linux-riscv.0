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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF55C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 20:13:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E035360EC0
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 20:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E035360EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+8fH1p3e2pQ+8Jlx9GSCmZ4wESFVhBj+glJqpBjRbuI=; b=FwxvzPt53VXGYFXE0DzsANhO9O
	RJ7McWAOfoK2bqpEkE1uZdlb78VKDM7aW/5poESlAX4gOFzNwNjuqqLs4LyVXjbW2ICosGntjO56P
	T85RGG9as8gWzIOfZi906R7ib9yhyQSz0cT1VY8XZa7K2TvzOscwcx/5lNqTFb1oyOgjZ+VogLl/X
	mviklSem1HCmZ61VkEU6wKjf/b3JMaO7Bjcs+fY47jJqd0oojrG/0RR63NTScKkE9LoJ2tUijjF2a
	Z+ZhW9mibT6RcqKLkhKXMIMxH3MnVx9hYEijtLXJ7MYDlEicB0CUrFKXNcr0hmXIrY7LEO/OXcKvb
	nDXBcq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBjjc-00AhGG-3M; Thu, 05 Aug 2021 20:12:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBjjY-00AhFM-M3
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 20:12:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so14440495pji.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 13:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zxMNsCnDZfscYCp8Pd6Rb0DW8Iybthh+JtApPuzegLk=;
 b=BEFWnj73Sq3pOZ7DcxXxNrFGVITKuGNGUJ+Q/ZnF4loW6xWptwZs3jbw44FIbSAwu+
 sYykqGc/9cMjngRwo3BjpChCRCoj0J2mTtKAYUQ5iNVUuQH3kT4Wx64Xmc5xzkNa0tLJ
 EH74Zw/nz+Bs500/ffHgYeH10IUr1wyIFrG0VvEHM/ulCRxIpUucVqNsajiV+wv4ITTA
 Dszuif5f1JiZ0XtmzYJzYuL3C6j2shotYdwj/s6p/rK5ukKAN7fWjY4a7BiDiIhBEm1s
 SGrVzWrMyJE/Qibttpq/ccjAlPy+kxQW1pG6z7xgTRahEzRMfnB2P71pVEr0CqyMFGYo
 x6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=zxMNsCnDZfscYCp8Pd6Rb0DW8Iybthh+JtApPuzegLk=;
 b=bJsJnCJGtbqVh7yQpKcd0jG/ydq8YM8MJLWJNLYqK9R3JggrKOZuk/8PKcRzBvZeOE
 KTzAiqn1+6pv9RIGY5VyGNCOVsDqlLauFPP05W2kxaelgvMrrialjMBi7EbTWfribu9A
 wQS2LX9K63jUCFY7seWBSrjioUpvEqhiqof6g+sJrMPcxAcBfVNEA1MBTerP0GQ/ak3O
 tApdSE2NIdKoywF+XyqK0y3ulEn9Am6AkaXXfAfQYbg7Cw4HywklYyGpJnN2EQhfPcWN
 ywRDilEFiOhtV487cXMH6SDGiV08yrxVKrcfTnuROrJdZYelECUChs38/4yd1ndCnNBC
 hFOw==
X-Gm-Message-State: AOAM533VQvFFVmAsktzcKc5bbLlL1XkzPT3UHP5gJAOXnl+fx+9e2Y2b
 u9H4BguUDDs0DxrbcEILeeg=
X-Google-Smtp-Source: ABdhPJxO84McaIfhchqquCaAuHPEJZ/ygV1cCjfkIxuNaMVnJiRSK/sRWZbv+4Yg0kNsfzwUaibIyA==
X-Received: by 2002:a62:864b:0:b029:3c7:7197:59fc with SMTP id
 x72-20020a62864b0000b02903c7719759fcmr3092420pfd.59.1628194367010; 
 Thu, 05 Aug 2021 13:12:47 -0700 (PDT)
Received: from [0.0.0.0] (hope.twd2.net. [45.32.56.123])
 by smtp.gmail.com with ESMTPSA id p3sm10177017pjt.0.2021.08.05.13.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:12:46 -0700 (PDT)
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 masahiroy@kernel.org, keescook@chromium.org,
 Nick Desaulniers <ndesaulniers@google.com>
References: <mhng-4af8be52-7620-478b-bf69-73306a2ffc3b@palmerdabbelt-glaptop>
From: twd2 <twd2.me@gmail.com>
Message-ID: <a6615b69-d99f-220b-d980-1f5f40ee2999@gmail.com>
Date: Fri, 6 Aug 2021 04:12:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <mhng-4af8be52-7620-478b-bf69-73306a2ffc3b@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_131252_765885_06A4EB71 
X-CRM114-Status: GOOD (  14.55  )
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

U3VyZS4gSSdsbCBzZW5kIGEgdjIgYWZ0ZXIgdGhlIExMVk0gaXNzdWUgaXMgcmVzb2x2ZWQuCgpU
aGFua3MhCldlbmRlCgoKT24gMjAyMS84LzUgNDo1OSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4g
T24gTW9uLCAxOSBKdWwgMjAyMSAxNDoxNDo1OSBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20gd3JvdGU6Cj4+IE9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0IDE6NTMgUE0gV2VuZGUg
VGFuIDx0d2QyLm1lQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gUGFzcyBgLW1hdHRyYCB0byBg
bGxkYCBzbyB0aGF0IGl0IGNhbiBnZW5lcmF0ZSBwcm9wZXIgbWFjaGluZSBjb2RlLgo+Pj4gQnkg
dGhlIHdheSwgaXQgc2VlbXMgdGhhdCBgLW1hcmNoYCBkb2VzIG5vdCB3b3JrIHdlbGwgbm93Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4+PiAt
LS0KPj4+IMKgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDcgKysrKysrKwo+Pj4gwqAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFr
ZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4+PiBpbmRleCBiYzc0YWZkYmYzMWUuLmJiYzE4
NmEzYWI0NSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvTWFrZWZpbGUKPj4+IEBAIC01Miw5ICs1MiwxNiBAQCByaXNjdi1tYXJjaC0kKENP
TkZJR19BUkNIX1JWMzJJKcKgwqDCoMKgIDo9IHJ2MzJpbWEKPj4+IMKgcmlzY3YtbWFyY2gtJChD
T05GSUdfQVJDSF9SVjY0SSnCoMKgwqDCoMKgwqAgOj0gcnY2NGltYQo+Pj4gwqByaXNjdi1tYXJj
aC0kKENPTkZJR19GUFUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gJChyaXNjdi1tYXJj
aC15KWZkCj4+PiDCoHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKcKgwqDCoMKgwqAg
Oj0gJChyaXNjdi1tYXJjaC15KWMKPj4+ICtyaXNjdi1tYXR0ci15wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gK20sK2EKPj4+ICtyaXNjdi1tYXR0
ci0kKENPTkZJR19GUFUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gJChyaXNjdi1tYXR0
ci15KSwrZiwrZAo+Pj4gK3Jpc2N2LW1hdHRyLSQoQ09ORklHX1JJU0NWX0lTQV9DKcKgwqDCoMKg
wqAgOj0gJChyaXNjdi1tYXR0ci15KSwrYwo+Pj4gwqBLQlVJTERfQ0ZMQUdTICs9IC1tYXJjaD0k
KHN1YnN0IGZkLCwkKHJpc2N2LW1hcmNoLXkpKQo+Pj4gwqBLQlVJTERfQUZMQUdTICs9IC1tYXJj
aD0kKHJpc2N2LW1hcmNoLXkpCj4+Pgo+Pj4gK2lmZXEgKCQoQ09ORklHX0xEX0lTX0xMRCkseSkK
Pj4+ICvCoMKgwqDCoMKgwqAgS0JVSUxEX0xERkxBR1MgKz0gLW1sbHZtIC1tYXR0cj0kKHJpc2N2
LW1hdHRyLXkpCj4+Cj4+IFdlIHNob3VsZCBwcmV2ZW50IHRoZSBwcm9saWZlcmF0aW9uIG9mIHRo
ZSBjb21waWxlciBpbnRlcm5hbCBgLW1sbHZtYAo+PiBmbGFncyBmcm9tIEtidWlsZCBNYWtlZmls
ZXM7IHRoZXNlIGFyZSBpbmRpY2F0aXZlIG9mIExMVk0gSVIgc3BlY2lmaWMKPj4gaXNzdWVzIHdp
dGggcmVnYXJkcyB0byBMVE8uwqAgQ2FuIHlvdSBwbGVhc2UgZmlsZSBhIGJ1ZyBhZ2FpbnN0IExM
Vk0KPj4gdGhhdCBgLW1hdHRyYCBzaG91bGQgYmUgZW5jb2RlZCBpbiB0aGUgSVIgZm9yIExUTydz
IHNha2U/Cj4KPiBXb3JrcyBmb3IgbWUuwqAgSSdsbCBob2xkIG9mZiBvbiB0YWtpbmcgdGhpcyB1
bnRpbCB0aGUgTExWTSBidWcgZ2V0cyBzb3J0ZWQgb3V0IGFuZCBleHBlY3QgYSB2MiAoaWRlYWxs
eSB3aXRoIHRoZSBvdGhlciB0ZXh0dWFsIGNoYW5nZXMgTmljayBzdWdnZXN0ZWQpLgo+Cj4gVGhh
bmtzIQo+Cj4+Cj4+IFNlZSBhbHNvOgo+PiBjb21taXQgMDIzNjUyNmQ3NmI4ICgiTWFrZWZpbGU6
IGx0bzogUGFzcyAtd2Fybi1zdGFjay1zaXplIG9ubHkgb24gTExECj4+IDwgMTMuMC4wIikKPj4g
Y29tbWl0IDIzOThjZTgwMTUyYSAoIng4NiwgbHRvOiBQYXNzIC1zdGFjay1hbGlnbm1lbnQgb25s
eSBvbiBMTEQgPCAxMy4wLjAiKQo+Pgo+Pj4gK2VuZGlmCj4+PiArCj4+PiDCoEtCVUlMRF9DRkxB
R1MgKz0gLW1uby1zYXZlLXJlc3RvcmUKPj4+IMKgS0JVSUxEX0NGTEFHUyArPSAtRENPTkZJR19Q
QUdFX09GRlNFVD0kKENPTkZJR19QQUdFX09GRlNFVCkKPj4+Cj4+PiAtLSAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
