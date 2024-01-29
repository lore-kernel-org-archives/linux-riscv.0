Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933FC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tK5W+CgRvL+xoaM93hn+FnGU4o4IucdJEPulzf3uEtk=; b=kMWcvXwWe9x0U5
	3JTVzaYUMULfEy3EefqSZrDqGXe9969ccd90QEAcC1X7xvipsOYjpONvKFCaR7+KXlxnFDtiTuOKR
	3NkSBeO2eNixWscDfPoAMI5q2fZZ0dtBpjNgwSPTXVs9H10aBoSAmPTETfPNOzPUjwfKdJ6JgeuN+
	DW9jR9mxnWNs12X06CngdVEvUigfUZ93ljMvBG62A64NhfLREEYqmKxzwnIZ2hCriSU/nrQHD1F59
	NYH7SyCcVI9u/G3QSnAKmjJFMJZUpaun/aDvwNaAhAT/Se3oG5V7R9JQAhMob6nXzGSPVos737pXv
	kZbn5wywoKgIhAqAxhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVtk-0000000Dq2O-13XI;
	Mon, 29 Jan 2024 17:58:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVth-0000000Dq0W-0KBf
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 17:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70EB4CE14E8
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77ACC43394
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706551093;
	bh=6DH4cAVVB5IcyXxT68rpRBwUIyW1lmrOSidCGZgTXeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tN9f5VGwGgojQP6IzYYRXYugWHQwG78L4hEUcTUhpoilWnsUKCxiFkP0+ypaB6m5y
	 6oX+4SEwBtP9ZMs7qwnlTFqS8G+97GIDjDJmq1og3W6X922gic3QO9hCYdP83NkjaM
	 FJfmIgPqOhs+jDrvktT7s+EpjvqfIOpPFc7WmdK18CAO3Aq/58ed9KvNQufLQopgsk
	 X7vKbWX+/NFrq5ez5XyKIxVrdUqlezQHb2OGwF9qg4T0aVe8jXpm1WQcY82QHNzQeO
	 yQsEbA22uVkF85AbBRrUyfkBOWQ7ORjNpjKId7CXSjX2gwvozuQJ/tlJwhj7pPZrEV
	 JRtYViUiM5kRw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51110896b4cso969300e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 09:58:13 -0800 (PST)
X-Gm-Message-State: AOJu0YydFW0epWfwkDkOCbmnVA0+TZog2ydfhrvpIuuDn03igjB+KjQb
	VWrHJphaBwZpShGohI+dS7ocYswtTrSTq49FsH95gJqscbC7WB9OD1aZi95F/o0fi/sXyHL/LhH
	SesPfTZBt5dSZgxxhwnK2lI71AxE=
X-Google-Smtp-Source: AGHT+IF+SMAtsL8GekK8AArEA+PlT6pcaQajQuzdNtzKFztkBVunkhn84LwsBdVN1dgRWBtHedf519s3rYYkb+uEYbQ=
X-Received: by 2002:a19:6414:0:b0:510:16ef:14cf with SMTP id
 y20-20020a196414000000b0051016ef14cfmr2319781lfb.31.1706551091851; Mon, 29
 Jan 2024 09:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20240123103241.2282122-1-pulehui@huaweicloud.com> <20240123103241.2282122-3-pulehui@huaweicloud.com>
In-Reply-To: <20240123103241.2282122-3-pulehui@huaweicloud.com>
From: Song Liu <song@kernel.org>
Date: Mon, 29 Jan 2024 09:58:00 -0800
X-Gmail-Original-Message-ID: <CAPhsuW67c8NYxBhwrq8JK8HP95P1Wwq1zHEDqooAOgP+aru13g@mail.gmail.com>
Message-ID: <CAPhsuW67c8NYxBhwrq8JK8HP95P1Wwq1zHEDqooAOgP+aru13g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf: Keep im address consistent between dry
 run and real patching
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_095817_491302_2B777E0A 
X-CRM114-Status: GOOD (  19.13  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMjozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gSW4gX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUsIHdlIGVtaXQgaW5zdHJ1Y3Rp
b25zIHRvIHN0b3JlIHRoZQo+IGFkZHJlc3Mgb2YgaW0gdG8gcmVnaXN0ZXIgYW5kIHRoZW4gcGFz
cyBpdCB0byBfX2JwZl90cmFtcF9lbnRlciBhbmQKPiBfX2JwZl90cmFtcF9leGl0IGZ1bmN0aW9u
cy4gQ3VycmVudGx5IHdlIHVzZSBmYWtlIGltIGluCj4gYXJjaF9icGZfdHJhbXBvbGluZV9zaXpl
IGZvciB0aGUgZHJ5IHJ1biwgYW5kIHRoZW4gYWxsb2NhdGUgbmV3IGltIGZvcgo+IHRoZSByZWFs
IHBhdGNoaW5nLiBUaGlzIGlzIGZpbmUgZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCB1c2UgZml4ZWQK
PiBpbnN0cnVjdGlvbnMgdG8gZ2VuZXJhdGUgYWRkcmVzc2VzLiBIb3dldmVyLCBmb3IgYXJjaGl0
ZWN0dXJlcyB0aGF0IHVzZQo+IGR5bmFtaWMgaW5zdHJ1Y3Rpb25zIHRvIGdlbmVyYXRlIGFkZHJl
c3NlcywgdGhpcyBtYXkgbWFrZSB0aGUgZnJvbnQgYW5kCj4gcmVhciBpbWFnZXMgaW5jb25zaXN0
ZW50LCBsZWFkaW5nIHRvIHBhdGNoaW5nIG92ZXJmbG93LiBXZSBjYW4gZXh0cmFjdAo+IHRoZSBp
bSBhbGxvY2F0aW9uIGFoZWFkIG9mIHRoZSBkcnkgcnVuIGFuZCBwYXNzIHRoZSBhbGxvY2F0ZWQg
aW0gdG8KPiBhcmNoX2JwZl90cmFtcG9saW5lX3NpemUsIHNvIHRoYXQgd2UgY2FuIGVuc3VyZSB0
aGF0IGltIGlzIGNvbnNpc3RlbnQgaW4KPiBkcnkgcnVuIGFuZCByZWFsIHBhdGNoaW5nLgoKSUlV
QywgdGhpcyBpcyByZXF1aXJlZCBiZWNhdXNlIGVtaXRfaW1tKCkgZm9yIHJpc2N2IG1heSBnZW5l
cmF0ZSB2YXJpYWJsZQpzaXplIGluc3RydWN0aW9ucyAoZGVwZW5kcyBvbiB0aGUgdmFsdWUgb2Yg
aW0pLiBJIHdvbmRlciB3ZSBjYW4gZml4IHRoaXMgYnkKc2ltcGx5IHNldCBhIHNwZWNpYWwgdmFs
dWUgZm9yIGZha2UgaW0gaW4gYXJjaF9icGZfdHJhbXBvbGluZV9zaXplKCkgdG8Kc28gdGhhdCBl
bWl0X2ltbSgpIGFsd2F5cyBnaXZlcyBiaWdnZXN0IHZhbHVlIGZvciB0aGUgZmFrZSBpbS4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQpbLi4u
XQo+Cj4gIHN0YXRpYyBpbnQgYnBmX3RyYW1wb2xpbmVfdXBkYXRlKHN0cnVjdCBicGZfdHJhbXBv
bGluZSAqdHIsIGJvb2wgbG9ja19kaXJlY3RfbXV0ZXgpCj4gQEAgLTQzMiwyMyArNDI1LDI3IEBA
IHN0YXRpYyBpbnQgYnBmX3RyYW1wb2xpbmVfdXBkYXRlKHN0cnVjdCBicGZfdHJhbXBvbGluZSAq
dHIsIGJvb2wgbG9ja19kaXJlY3RfbXV0Cj4gICAgICAgICAgICAgICAgIHRyLT5mbGFncyB8PSBC
UEZfVFJBTVBfRl9PUklHX1NUQUNLOwo+ICAjZW5kaWYKPgo+IC0gICAgICAgc2l6ZSA9IGFyY2hf
YnBmX3RyYW1wb2xpbmVfc2l6ZSgmdHItPmZ1bmMubW9kZWwsIHRyLT5mbGFncywKPiArICAgICAg
IGltID0ga3phbGxvYyhzaXplb2YoKmltKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAoIWlt
KSB7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHNpemUgPSBhcmNoX2JwZl90cmFtcG9s
aW5lX3NpemUoaW0sICZ0ci0+ZnVuYy5tb2RlbCwgdHItPmZsYWdzLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0bGlua3MsIHRyLT5mdW5jLmFkZHIpOwo+ICAgICAg
ICAgaWYgKHNpemUgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIGVyciA9IHNpemU7Cj4gLSAgICAg
ICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlX2ltOwo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAoc2l6ZSA+IFBBR0VfU0laRSkgewo+ICAgICAgICAg
ICAgICAgICBlcnIgPSAtRTJCSUc7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAg
ICAgICAgICAgICBnb3RvIG91dF9mcmVlX2ltOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpbSA9
IGJwZl90cmFtcF9pbWFnZV9hbGxvYyh0ci0+a2V5LCBzaXplKTsKPiAtICAgICAgIGlmIChJU19F
UlIoaW0pKSB7Cj4gLSAgICAgICAgICAgICAgIGVyciA9IFBUUl9FUlIoaW0pOwo+IC0gICAgICAg
ICAgICAgICBnb3RvIG91dDsKPiAtICAgICAgIH0KPiArICAgICAgIGVyciA9IGJwZl90cmFtcF9p
bWFnZV9hbGxvYyhpbSwgdHItPmtleSwgc2l6ZSk7Cj4gKyAgICAgICBpZiAoZXJyIDwgMCkKPiAr
ICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZV9pbTsKCkkgZmVlbCB0aGlzIGNoYW5nZSBqdXN0
IG1ha2VzIGJwZl90cmFtcG9saW5lX3VwZGF0ZSgpIGV2ZW4KbW9yZSBjb25mdXNpbmcuCgo+Cj4g
ICAgICAgICBlcnIgPSBhcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoaW0sIGltLT5pbWFnZSwg
aW0tPmltYWdlICsgc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmdHItPmZ1bmMubW9kZWwsIHRyLT5mbGFncywgdGxpbmtzLAo+IEBAIC00OTYsNiArNDkz
LDggQEAgc3RhdGljIGludCBicGZfdHJhbXBvbGluZV91cGRhdGUoc3RydWN0IGJwZl90cmFtcG9s
aW5lICp0ciwgYm9vbCBsb2NrX2RpcmVjdF9tdXQKPgo+ICBvdXRfZnJlZToKPiAgICAgICAgIGJw
Zl90cmFtcF9pbWFnZV9mcmVlKGltKTsKPiArb3V0X2ZyZWVfaW06Cj4gKyAgICAgICBrZnJlZV9y
Y3UoaW0sIHJjdSk7CgpJZiB3ZSBnb3RvIG91dF9mcmVlIGFib3ZlLCB3ZSB3aWxsIGNhbGwga2Zy
ZWVfcmN1KGltLCByY3UpCnR3aWNlLCByaWdodD8gT25jZSBpbiBicGZfdHJhbXBfaW1hZ2VfZnJl
ZSgpLCBhbmQgYWdhaW4KaGVyZS4KClRoYW5rcywKU29uZwoKWy4uLl0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
