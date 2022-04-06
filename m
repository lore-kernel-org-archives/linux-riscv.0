Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtFJI3i+Es6EURDVwtaSF0/5iciRh0WFm3EoQSeGiXM=; b=QKHPGWmHYSJTZC
	tasKbTVJTyCb77acGHlac/TafaCqE60Fu441se6NiEA9qOTLBhSr43qa5T6R+Ghk3UZBO7mWHtu6+
	vdA/+gBN6ZnkbmX9tH6Dvb8xkLFuYciQ0TK4wKBcajesPFR0wk4TENIJ6QoIECMAhV9oY4P4cwPgC
	RIIlDtcAMWu3z0XFtN3CHqVZfXoSuEto+4hsRRVc2WdcrM2QjjJaXO0+nhAggL1w7WLcyAgEbmDS4
	m0GZlPnKwoP8m6RaCE1nbInWMURMJI5Oh4UjkHmVQK2JKExcHLSXEgiMeNTc2f6Kx5QdAS/QETvuZ
	RAZD/8EtfKrNLkWRUcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2cW-005GRf-5H; Wed, 06 Apr 2022 10:10:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2OG-005AER-Fe
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 09:55:54 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E2F243F864
 for <linux-riscv@lists.infradead.org>; Wed,  6 Apr 2022 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649238947;
 bh=Cr0zob3O2czZYqaT1XEpHfoL1utbHJLFt3/CqeQ40lk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=n55Bp7yyxGnJq85OM6WFenmQbYVo6iGoaocg0+HgkF+NiI6v8OGAWqAnjNE75DL7u
 ng/n0YMcBNUSf1pndtbXtTDnZAbMSvT9UUMkkgk43ggm19PXJN3pbbamBzqWBbVhTv
 Z6TNfWofhqU1wKIOC7HXCD8zmVzVUuSuowq6D+L3M7xZHlxIdSeTWW2d/wlW2dQNqD
 KmIafOk1Tju3EumRrXEkN4TBxB64yxfI7HralLC9bCPaz9JnFMKD/RldsTcb3z0qEx
 melNGtI7d1CKS5F0UVmVLCr7+/2Xsbs2gkoJ2JprkKWy0Igqg1avl/puCh0Tft+XKj
 RhzOfiwEVwr+Q==
Received: by mail-ed1-f72.google.com with SMTP id
 v5-20020aa7d645000000b0041ce08ab5afso948066edr.6
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 02:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cr0zob3O2czZYqaT1XEpHfoL1utbHJLFt3/CqeQ40lk=;
 b=0c9Rro4sKU3XbZaOrjNIeidlwOChH/jPpg+isUVyf/bDmPQXNpJz0MuWJGMYufDQ42
 Nkrg2v1MBfCWthhab2zdJVCFdE3/0G+AOZG42QNf7YtTUfFxhvw+B0jT4IMP53mQSfk9
 r9Y1bVMRNRt10204g972CWZWblK6sk+RLqNN/9RzaY0Kt0kRPsazKijRWUt/NTDarLfw
 3TcZbKrSyiqZJnyY+Wqw6Ppkq9vtygwCa5ecfDMk2hNnlTwhqSUHYqXp3u+phd952Q0D
 z+b9ydwRlId/ssfvMaiZ486O8NtXsopMSaPX+hHYBtBqlxl346i2ALD9XnEuyYTqiKgi
 V4TQ==
X-Gm-Message-State: AOAM533eCxE89pwdXqB2eT5+m2EHJ0H9HaqbekOB+MAJ14S5G0EXjHSH
 UcvxZmxse8m2Y2MKY/eIalaecESKVM8zm9COUfy9tk8PwiCS8udr6rDnwhV+LoVE/0JaTTdA3av
 yWSahQ/pfG1Dggd/HwYi/8U0gI9uAtpwPGMgNMg+IyJYvIQ==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id
 qb22-20020a1709077e9600b006daf7ee4a25mr7322192ejc.436.1649238945561; 
 Wed, 06 Apr 2022 02:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp7atgtib6PHMj3QV9Py+Ljc5dGjtqXV9y+Mr0o7vdm5hiR1gMwYh9YCrNenxw7wazsURVVw==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id
 qb22-20020a1709077e9600b006daf7ee4a25mr7322169ejc.436.1649238945248; 
 Wed, 06 Apr 2022 02:55:45 -0700 (PDT)
Received: from [192.168.123.67] (ip-088-152-144-107.um26.pools.vodafone-ip.de.
 [88.152.144.107]) by smtp.gmail.com with ESMTPSA id
 sa26-20020a1709076d1a00b006e6b23c8dafsm4774120ejc.164.2022.04.06.02.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 02:55:44 -0700 (PDT)
Message-ID: <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
Date: Wed, 6 Apr 2022 11:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 atishp@atishpatra.org, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, apatel@ventanamicro.com
References: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_025552_980617_2DC84517 
X-CRM114-Status: GOOD (  29.47  )
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

T24gMy8zMS8yMiAyMTo0MiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gU2F0LCAxOSBNYXIg
MjAyMiAwNToxMjowNiBQRFQgKC0wNzAwKSwgYXBhdGVsQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6
Cj4+IEN1cnJlbnRseSwgdGhlIHJhbmdlIGFuZCBkZWZhdWx0IHZhbHVlIG9mIE5SX0NQVVMgaXMg
dG9vIHJlc3RyaWN0aXZlCj4+IGZvciBoaWdoLWVuZCBSSVNDLVYgc3lzdGVtcyB3aXRoIGxhcmdl
IG51bWJlciBvZiBIQVJUcy4gVGhlIGxhdGVzdAo+PiBRRU1VIHZpcnQgbWFjaGluZSBzdXBwb3J0
cyB1cHRvIDUxMiBDUFVzIHNvIHRoZSBjdXJyZW50IE5SX0NQVVMgaXMKPj4gcmVzdHJpY3RpdmUg
Zm9yIFFFTVUgYXMgd2VsbC4gT3RoZXIgbWFqb3IgYXJjaGl0ZWN0dXJlcyAoc3VjaCBhcwo+PiBB
Uk02NCwgeDg2XzY0LCBNSVBTLCBldGMpIGhhdmUgYSBtdWNoIGhpZ2hlciByYW5nZSBhbmQgZGVm
YXVsdAo+PiB2YWx1ZSBvZiBOUl9DUFVTLgo+Pgo+PiBUaGlzIHBhdGNoIGluY3JlYXNlcyBOUl9D
UFVTIHJhbmdlIHRvIDItNTEyIGFuZCBkZWZhdWx0IHZhbHVlIHRvCj4+IFhMRU4gKGkuZS4gMzIg
Zm9yIFJWMzIgYW5kIDY0IGZvciBSVjY0KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+
PiDCoC0gVXBkYXRlZCBOUl9DUFVTIHJhbmdlIHRvIDItNTEyIHdoaWNoIHJlZmxlY3RzIG1heGlt
dW0gbnVtYmVyIG9mCj4+IMKgwqAgQ1BVcyBzdXBwb3J0ZWQgYnkgUUVNVSB2aXJ0IG1hY2hpbmUu
Cj4+IC0tLQo+PiDCoGFyY2gvcmlzY3YvS2NvbmZpZyB8IDcgKysrKy0tLQo+PiDCoDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggNWFkY2Jk
OWI1ZTg4Li40MjNhYzE3ZjU5OGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTI3NCwxMCArMjc0LDExIEBAIGNvbmZp
ZyBTTVAKPj4gwqDCoMKgwqDCoMKgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwg
c2F5IE4uCj4+Cj4+IMKgY29uZmlnIE5SX0NQVVMKPj4gLcKgwqDCoCBpbnQgIk1heGltdW0gbnVt
YmVyIG9mIENQVXMgKDItMzIpIgo+PiAtwqDCoMKgIHJhbmdlIDIgMzIKPj4gK8KgwqDCoCBpbnQg
Ik1heGltdW0gbnVtYmVyIG9mIENQVXMgKDItNTEyKSIKPj4gK8KgwqDCoCByYW5nZSAyIDUxMgoK
Rm9yIFNCSV9WMDE9eSB0aGVyZSBzZWVtcyB0byBiZSBhIGhhcmQgY29uc3RyYWludCB0byBYTEVO
IGJpdHMuClNlZSBfX3NiaV92MDFfY3B1bWFza190b19oYXJ0bWFzaygpIGluIHJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMuCgpTbyBzaG91bGRuJ3QgdGhpcyBiZSBzb21ldGhpbmcgbGlrZToKCnJhbmdl
IDIgNTEyICFTQklfVjAxCnJhbmdlIDIgMzIgU0JJX1YwMSAmJiAzMkJJVApyYW5nZSAyIDY0IFNC
SV9WMDEgJiYgNjRCSVQKCj4+IMKgwqDCoMKgIGRlcGVuZHMgb24gU01QCj4+IC3CoMKgwqAgZGVm
YXVsdCAiOCIKPj4gK8KgwqDCoCBkZWZhdWx0ICIzMiIgaWYgMzJCSVQKPj4gK8KgwqDCoCBkZWZh
dWx0ICI2NCIgaWYgNjRCSVQKPj4KPj4gwqBjb25maWcgSE9UUExVR19DUFUKPj4gwqDCoMKgwqAg
Ym9vbCAiU3VwcG9ydCBmb3IgaG90LXBsdWdnYWJsZSBDUFVzIgo+IAo+IEknbSBnZXR0aW5nIGFs
bCBzb3J0cyBvZiBib290IGlzc3VlcyB3aXRoIG1vcmUgdGhhbiAzMiBDUFVzLCBldmVuIG9uIHRo
ZSAKPiBsYXRlc3QgUUVNVSBtYXN0ZXIuwqAgSSdtIG5vdCBvcHBvc2VkIHRvIGluY3JlYXNpbmcg
dGhlIENQVSBjb3VudCBpbiAKPiB0aGVvcnksIGJ1dCBpZiB3ZSdyZSBnb2luZyB0byBoYXZlIGEg
c2V0dGluZyB0aGF0IGdvZXMgdXAgdG8gYSBodWdlIAo+IG51bWJlciBpdCBuZWVkcyB0byBhdCBs
ZWFzdCBib290LsKgIEkndmUgZ290IDY0IGhvc3QgdGhyZWFkcywgc28gaXQgCj4gc2hvdWxkbid0
IGp1c3QgYmUgYSBzY2hlZHVsaW5nIHRoaW5nLgoKQ3VycmVudGx5IGhpZ2ggcGVyZm9ybWluZyBo
YXJkd2FyZSBmb3IgUklTQy1WIGlzIG1pc3NpbmcuIFNvIGl0IG1ha2VzIApzZW5zZSB0byBidWls
ZCBzb2Z0d2FyZSB2aWEgUUVNVSBvbiB4ODZfNjQgb3IgYXJtNjQgd2l0aCBhcyBtYW55IApoYXJk
d2FyZSB0aHJlYWRzIGFzIGF2YWlsYWJsZSAoMTI4IGlzIG5vdCB1bmNvbW1vbikuCgpPcGVuU0JJ
IGN1cnJlbnRseSBpcyBsaW1pdGVkIHRvIDEyOCB0aHJlYWRzOgppbmNsdWRlL3NiaS9zYmlfaGFy
dG1hc2suaDoyMjoKI2RlZmluZSBTQklfSEFSVE1BU0tfTUFYX0JJVFMgMTI4ClRoaXMgaXMganVz
dCBhbiBhcmJpdHJhcnkgdmFsdWUgd2UgY2FuIGJlIG1vZGlmaWVkLgoKVS1Cb290IHYyMDIyLjA0
IHFlbXUtcmlzY3Y2NF9zbW9kZV9kZWZjb25maWcgaGFzIGEgdmFsdWUgb2YgCkNPTkZJR19TWVNf
TUFMTE9DX0ZfTEVOIHRoYXQgaXMgdG8gbG93LiBUaGlzIGxlYWRzIHRvIGEgYm9vdCBmYWlsdXJl
IGZvciAKbW9yZSB0aGFuIDE2IGhhcnRzLiBBIHBhdGNoIHRvIGNvcnJlY3QgdGhpcyBpcyBwZW5k
aW5nOgpbUEFUQ0ggdjIgMS8xXSByaXNjdjogYWxsb2Mgc3BhY2UgZXhoYXVzdGVkCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3UtYm9vdC9DQU41Qj1lS3Q9dEZMWjJ6M2FOSEpxc25KenBkQTBvaWtj
ckMyaTFfPVpERD1mK00wakFAbWFpbC5nbWFpbC5jb20vVC8jdAoKV2l0aCBRRU1VIDcuMCBhbmQg
dGhlIFUtQm9vdCBmaXggYm9vdGluZyBpbnRvIGEgNS4xNyBkZWZjb25maWcga2VybmVsIAp3aXRo
IDY0IHZpcnR1YWwgY29yZXMgd29ya2VkIGZpbmUgZm9yIG1lLgoKQmVzdCByZWdhcmRzCgpIZWlu
cmljaAoKPiAKPiBJZiB0aGVyZSB3YXMgc29tZSBoYXJkd2FyZSB0aGF0IGFjdHVhbGx5IGJvb3Rz
IG9uIHRoZXNlIEknZCBiZSBoYXBweSB0byAKPiB0YWtlIGl0LCBidXQgZ2l2ZW4gdGhhdCBpdCdz
IGp1c3QgUUVNVSBJJ2QgcHJlZmVyIHRvIHNvcnQgb3V0IHRoZSBidWdzIAo+IGZpcnN0LsKgIEl0
J3MgcHJvYmFibHkganVzdCBsYXRlbnQgYnVncyBzb21ld2hlcmUsIGJ1dCBhbGxvd2luZyB1c2Vy
cyB0byAKPiB0dXJuIG9uIGNvbmZpZ3Mgd2Uga25vdyBkb24ndCB3b3JrIGp1c3Qgc2VlbXMgbGlr
ZSB0aGUgd3Jvbmcgd2F5IHRvIGdvLgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
