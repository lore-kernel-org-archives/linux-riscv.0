Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88873ED7B95
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DN6T3EuzPLci/VYwcq63Vxhh5NCeeutd25R5ETLT6Fo=; b=KDfITj+GUt5Uut
	PRqZ7QUldhCp1RUz2pFcMxHA+4dXjUYO3gQeTJdE+OiL5qPN+aAnulhKQDdRTacEM838IfmiuzUe/
	HyY8h6fiiSDw5zp17yzO4Y2T34AmIXMXdZTzpjJRRLc/AaOFsfxbDaZiYRCkiKqRyRaj44IZ51q80
	hljwA0Zan1nmjlH7mrIP7ZA2J5h4alCTIL6nOAthZVw+I5ca4oWgg3QFAoqn7HNyaAFT1E6P7wBPq
	xlXxmWdwVkz+BE07svB26ro4WIJylig/+/Hl3/i278R+xG1oRrnvjSIp3JXSFG8VbkNC9tpaQ/BYI
	1ngyRGyq5ZgezzwbtPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaE0-0000000H4I1-3DtH;
	Tue, 14 Apr 2026 09:38:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaDx-0000000H4Gb-1kFw
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 09:38:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso853152466b.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 02:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776159503; cv=none;
        d=google.com; s=arc-20240605;
        b=M6pZ0GLWVn42Aw6mINwBCxgq6WCM6AqP4lL6/OzSF6CEUWWyxEUEgd5FH2smf9mHic
         DbcwIEnl0lT3x37NmiRJtOBLmppFLBsyteZdsrpucF9oXsxADEMBYvkdlGoNiNCKeE1z
         rPutX5nlE5HMOH32syfyY4Vi5scQeFF3Z50p8xC/4tRxy1d52eWkEYRIXNhMSZdiS4BL
         rWFt0+YKb4I2vJBhaVG1FApz+NdnBLWXQ5EqJvNMMS0wEvIsh3k09HN/+iRDXsXw1zMb
         e8jAyJNkRpDsHjL0zc+R8qyYILegDLBzzZrRLEJpDGyND/7QNqhf4Gi6jWAvTasnur6H
         5evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        fh=jBzk1Sa2pli7IWDriX3GfCc3SP5OwOtodc2fgH9d8IA=;
        b=d6CLq9t4GYZosXp4CGYM7AR3i40bYNnpAOKyMQm8QORIe7tKkFsKXddH22N3IJuVc7
         2ib4L3XAHdNJZ8EQZAh7EXWcokt7+DhKAR8xX9wLix1WS9ELHeIBi1atfaiDvzXOkPEN
         kuvYKOYkxpsyYULCZsqUaPoBZWbhNHPIdRehH2vuGYuvSA0vi8UoAIBttassznMZYLIb
         SfsXPZonC0l3Z6phZxQ3YBMiuj+5nWX34Xmbvb0HDL4Lts/iu5CixOQcJLw171n5+nsO
         1V48/NbRcYylFjWVSRnDFLjUseza8jqluILIAaT6oGep8lJmsXOJkYgkGd9lZBCi2RXm
         2FhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159503; x=1776764303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        b=BP5voxCV2TtcVNeB6ASspb0CcYTDAVJhMM5oxNJ3rfG+PQtu/u0mN6i454JZpApOh9
         5HNxTwCLoVBMS8bqeg+VePRY9mby3i7YTbLxTSjbqq/RJIBQu820woOhUwP8F+mEK0Re
         D/OVPnv5d9ErZmcAS1KirZ92+qNQ1OKF6bdr6aYqIdKjJKAiAI2Emibgj6xdAFzbbx0r
         EUEPKb9lSv3Pe+YubKmNUmKXDV4WBLgz7ailaSo7mLlsKbJRklJUzUfqZeBk9XxGw8dg
         diMhGozPRJHSuayOwOWpTQjZsZ4xJJpXvajhdtqU3BoY/IW+biBocqgjC0MriyXNQDW3
         Wk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159503; x=1776764303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        b=OMSUIQcnWFWJ78erv4AfgpvBbDxGC0wbYlCB0Q0dElbUfeKuTUXDCTfcmkv1TMOeIA
         B2EHaHWMA9nM+6tadlc6EeqbFbWtWHculmX6MFUXjceMYEY7kyJgP4MwsShV8Rapg11q
         Cl34/Uwe24/RW5MwETpq2hpdJQHHHIABTiTRLxFw6MjhKP/bCNETW64KsRwBB5GkN81R
         lV8qss2QsrmaAoTYf6c7hYGtoKjLknUmc90x4E3PhE88+XIRXxP+gZUcBYjinEZMOBpe
         0gaQZB3TEHkm+hq2w4D0+e/aB4XJlciMJ07eJCQ92lt/GtNsN3kdBJV5GKGZLC8hu9Z+
         TbQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xjiob1nXJdHoweCCtcp0FVXxHJ8Lhn+zK0bl2iqJmLebnpM8cA5SmEaU7w5VjUbp+QuJTlz8Swk5uIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkkepnt5YKGTajNsdi9wP05pun9DB8aRYm8CeC2DeQab7bEwJm
	2TpS24sA4c7VrXme621Ng0zaNNp6YI5PuyI9xHwdyZGoQgYUwn3VtGGdwru/o1MEi3+mZX61BHx
	VgU/3m3yvCSniRvcNQse9Ny1iercBY7I=
X-Gm-Gg: AeBDieu4A/UCh/0ohZrBnoXDUezvLYyQwZSWgfI2Qyta4pm7Wtm18H5r49a/kDPnIw6
	WXdlU0nOB1+t3haCBSYXFRvsx4gyqiOyNB4bE3wk4y2x56FAtz8qjNSHPmAHqnaF77CTeZe3lDL
	13JjGoizW8PayCY23cLLqGBid94ryE1ixLMk1ufiAWJM+MV6w88aXiYsXPQuKSQs5ip7rJNOKYd
	4VMSSYeD5pphNX8uXuTq2wY72yJs7Y+2fpcSFtfA2L+e4yU4JrFaaM9GCs76dB87SZK3R+058uR
	hQAUQy/j8kDHs3WJjaVLb+wQkmkfdv6pcw==
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr959935566b.32.1776159502686; Tue, 14 Apr 2026
 02:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260413191111.3426023-1-puranjay@kernel.org> <20260413191111.3426023-2-puranjay@kernel.org>
 <dd645fcf-76dc-4c68-8b6f-1a168cafd44f@huaweicloud.com>
In-Reply-To: <dd645fcf-76dc-4c68-8b6f-1a168cafd44f@huaweicloud.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 14 Apr 2026 10:38:11 +0100
X-Gm-Features: AQROBzA5ZqN85V-5pwDPQTcpuLbGTsQR3YyYyNFZOhVjcHyYWB-ouK4sX2jSl08
Message-ID: <CANk7y0js0YxPFX1HqpYumN-ji6-OkKi4YO5=CRz8nx8aTzYxPw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023825_541234_0EAA3677 
X-CRM114-Status: GOOD (  14.28  )
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

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMjo1NuKAr0FNIFh1IEt1b2hhaSA8eHVrdW9oYWlAaHVh
d2VpY2xvdWQuY29tPiB3cm90ZToKPgo+IE9uIDQvMTQvMjAyNiAzOjExIEFNLCBQdXJhbmpheSBN
b2hhbiB3cm90ZToKPiA+IGJwZl9mbHVzaF9pY2FjaGUoKSBjYWxscyBmbHVzaF9pY2FjaGVfcmFu
Z2UoKSB0byBjbGVhbiB0aGUgZGF0YSBjYWNoZQo+ID4gYW5kIGludmFsaWRhdGUgdGhlIGluc3Ry
dWN0aW9uIGNhY2hlIGZvciB0aGUgSklUZWQgY29kZSByZWdpb24uIEhvd2V2ZXIsCj4gPiBzaW5j
ZSBjb21taXQgMWRhZDM5MWRhZWYxICgiYnBmLCBhcm02NDogdXNlIGJwZl9wcm9nX3BhY2sgZm9y
IG1lbW9yeQo+ID4gbWFuYWdlbWVudCIpLCB0aGlzIGZsdXNoIGlzIHJlZHVuZGFudC4KPiA+Cj4g
PiBicGZfaml0X2JpbmFyeV9wYWNrX2ZpbmFsaXplKCkgY29waWVzIHRoZSBKSVRlZCBpbnN0cnVj
dGlvbnMgdG8gdGhlIFJPWAo+ID4gcmVnaW9uIHZpYSBicGZfYXJjaF90ZXh0X2NvcHkoKSAtPiBh
YXJjaDY0X2luc25fY29weSgpIC0+IF9fdGV4dF9wb2tlKCksCj4gPiBhbmQgX190ZXh0X3Bva2Uo
KSBhbHJlYWR5IGNhbGxzIGZsdXNoX2ljYWNoZV9yYW5nZSgpIG9uIHRoZSB3cml0dGVuCj4gPiBy
YW5nZS4gVGhlIHN1YnNlcXVlbnQgYnBmX2ZsdXNoX2ljYWNoZSgpIHJlcGVhdHMgdGhlIHNhbWUg
Y2FjaGUKPiA+IG1haW50ZW5hbmNlIG9uIGFuIG92ZXJsYXBwaW5nIHJhbmdlLCBpbmNsdWRpbmcg
YW4gdW5uZWNlc3Nhcnkgc2Vjb25kCj4gPiBzeW5jaHJvbm91cyBJUEkgdG8gYWxsIENQVXMgdmlh
IGtpY2tfYWxsX2NwdXNfc3luYygpLgo+ID4KPgo+IFNvIGljYWNoZSBpcyBmbHVzaGVkIHR3aWNl
OiBvbmNlIHBlciBpbnN0cnVjdGlvbiBhbmQgYWdhaW4gYWZ0ZXIgYWxsCj4gaW5zdHJ1Y3Rpb25z
IGFyZSBjb3BpZWQuIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gcmVtb3ZlIHRoZSBwZXItaW5zdHJ1
Y3Rpb24KPiBmbHVzaCBhbmQgcmV0YWluIHRoZSBzaW5nbGUgZmluYWwgZmx1c2ggdG8gYXZvaWQg
cmVwZWF0aW5nIGZsdXNoIG92ZXJoZWFkCj4gZm9yIGVhY2ggaW5zdHJ1Y3Rpb24uCgpObywgYnBm
X2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSgpIGlzIGNhbGxlZCBhdCB0aGUgZW5kIGFmdGVyIHRo
ZQp3aG9sZSBwcm9ncmFtIGlzIGppdGVkLCBhbmQgaXQgY2FsbHM6IGJwZl9hcmNoX3RleHRfY29w
eShyb19oZWFkZXIsCnJ3X2hlYWRlciwgcndfaGVhZGVyLT5zaXplKTsgd2hpY2ggZG9lcyBhYXJj
aDY0X2luc25fY29weShkc3QsIHNyYywKbGVuKSwgdGhpcyBjYWxscyBfX3RleHRfcG9rZSgpIHdo
aWNoIGNvcGllcyB0aGUgd2hvbGUgcHJvZ3JhbSBhbmQgdGhlbgpkb2VzIGZsdXNoX2ljYWNoZV9y
YW5nZSgodWludHB0cl90KWFkZHIsICh1aW50cHRyX3QpYWRkciArIGxlbik7IG9uY2UuClRoaXMg
aXMgY29ycmVjdCwgYWZ0ZXIgdGhpcyB3ZSBkb24ndCBuZWVkIHRvIGNhbGwgZmx1c2hfaWNhY2hl
X3JhbmdlKCkKb24gdGhlIHNhbWUgcmFuZ2UgYWdhaW4uCgpJZiB3ZSBoYWQgYmVlbiBjYWxsaW5n
IGZsdXNoX2ljYWNoZV9yYW5nZSgpIGZvciBlYWNoIGluc3RydWN0aW9uLCB0aGUKc3lzdGVtIHdv
dWxkIGhhbmcgZHVlIHRvIHRoZSBzdG9ybSBvZiBJUElzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
