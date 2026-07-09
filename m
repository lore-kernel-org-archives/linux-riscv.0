Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA9C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azGQ0B7fNf7DvjrX6aiCd2imVWHc9sQb5JUuP+0xbZc=; b=oUQuFBg4xtwyys
	JoFi41A2Lyfr81Cyas69VmJBfCp6NTkUXfoykL4ZZF2YFi1P17i6RA5uvSDS4pX+R5GFIhd5m5/t9
	aH5yJp4cSEF012Iuc8PWnkRBONBx9GuYsl9A0F99ryXcLbrN0AaYSIB9UzLL5OpRx8SHr0bUfHYLA
	FGkotwcZRy4NcvZtTea6DHLEvQqrnm6J+ulbJ9CYDhdEOQcl3JK8W1G+JxtTLQbC/oUpPdOa5zHkg
	h4aUMo6dY7tI+uxZBPC0O8nngB5MEEr5Qsy64y2PgZCQ3qSbZDH6DNsoGLFffcsJf7T40F4ht9KKF
	dcofjg8Kmmc45eFP5U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn4X-00000002E5E-0dmH;
	Thu, 09 Jul 2026 11:37:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn4V-00000002E50-2wNO
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AC3543C93
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 11:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F991F00A3F
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597059;
	bh=Yz412YS1mm3028gqttBvo2HQF+dXMccepgPqvi+nG/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iExFUyhUDyMyxoRuz8GZQpYxNkallp36NctdPvI0f4t1c6nYnFyDSGBCGzYX9EGr2
	 eJhpH+D66yUgEm0+AW8S3XWw9la/TrQvYorkSwvFTiqRdM0xtcvZPCGTDKcyAEXK2j
	 LZMrJwHou76OhY3EJUl7mRg1zAbGqkx2I3nVxjgOGJalU2nuy3yTZqqDGzoPhxm0AZ
	 By9kDcm+gQPgHnK0lb8BmjZ5mFZS4zG+7PhX/71xi32DWQbX3o7NBjycc89W04HBy4
	 hzfEMh+p7/cNlcB0xFk673NUOEWQN+TlcO2WSURryWQeP0h6/nf6oU/V0cpY5K8irW
	 ChuMQT+9B2HkA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80c5cb9a888so10511647b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfBcQNSUg/Ogh0BCd2kcOqHhQLjFgcBBTy5loMzaDFOaRqvlALOtIc+3CFR7dT7XrJS6aVZjAC0xIDpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuXc2CufD/ccebdNWnnv4bTvKJxPVrmYBNkxcyaa40Shxjg6d0
	gnX7SvF3e61ioutn3m2A1oIeqgIJoVQ4m4/auieb9KSPxEOVvOe2xjnYUhKx0sQOeBbeVFybj5b
	bMkoNcNGIXz/HAQJxAok9mZErjqll/24=
X-Received: by 2002:a05:690c:7288:b0:81c:7f96:591d with SMTP id
 00721157ae682-81dbe553a1bmr51674577b3.36.1783597058167; Thu, 09 Jul 2026
 04:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
In-Reply-To: <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 9 Jul 2026 13:37:27 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
X-Gm-Features: AVVi8Ce8nk2IlpXpBJGjqQ3IJKRb90NHUVNDXbkho0Wnz5Bid6O-iKdNzIa3RjM
Message-ID: <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com, martin.lau@kernel.org, 
	clm@meta.com, ihor.solodrai@linux.dev
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

U29ycnkgZm9yIHRoZSBkZWxheSBoZXJlIC0tIHRoZSBib3QgaGFkIG1lIHRoaW5raW5nIGEgYml0
LgoKT24gV2VkLCA4IEp1bCAyMDI2IGF0IDEwOjU0LCBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWlj
bG91ZC5jb20+IHdyb3RlOgoKLi4uCgo+ID4gVGhpcyBhc3N1bWVzIGEgZml4ZWQgbnVtYmVyIG9m
IGluc3RydWN0aW9ucyBiZWZvcmUgdGhlIHRhaWxjYWxsIGVudHJ5Cj4gPiBwb2ludC4gV2hlbiBp
c19zdWJwcm9nIGlzIHRydWUsIHRoZSBydl9hZGRpKCkgaW5zdHJ1Y3Rpb24gaXMgbm90IGVtaXR0
ZWQsCj4gPiB3aGljaCBtZWFucyB0aGUgdGFpbGNhbGwgZW50cnkgcG9pbnQgbW92ZXMgZm9yd2Fy
ZCBieSA0IGJ5dGVzIHJlbGF0aXZlIHRvCj4gPiB3aGVyZSBSVl9UQUlMQ0FMTF9PRkZTRVQgZXhw
ZWN0cyBpdCB0byBiZS4KPiA+Cj4gPiBUaGUgdGFpbGNhbGwgZW50cnkgaXMgdXNlZCBpbiBlbWl0
X2JwZl90YWlsX2NhbGwoKSB3aGVuIGNhbGN1bGF0aW5nIHRoZQo+ID4ganVtcCB0YXJnZXQgZm9y
IHRoZSB0YWlsIGNhbGwuIElmIFJWX1RBSUxDQUxMX09GRlNFVCBkb2Vzbid0IGFjY291bnQgZm9y
Cj4gPiB0aGUgY29uZGl0aW9uYWwgZW1pc3Npb24sIGNvdWxkIHRoaXMgY2F1c2UgdGhlIHdyb25n
IGVudHJ5IHBvaW50IHRvIGJlCj4gPiB1c2VkIHdoZW4gdGFpbCBjYWxsaW5nIGludG8gc3VicHJv
Z3JhbXM/Cj4KPiBUaGlzIGlzIG5vdCBhbiBpc3N1ZSwgc3VicHJvZyBjYW4gbm90IGJlIHRoZSB0
YWlsY2FsbCBjYWxsZWUuCgpTYXksIHRoYXQgd2UgaGF2ZSBhbiBlbnRyeSBmdW5jdGlvbiB0aGF0
IGRvZXMgYnBmX2Zvcl9lYWNoX21hcF9hcnJheSgpCmludG8gYSBjYWxsYmFjayBjYigpLiBjYigp
IGlzIGEgc3VicHJvZ3JhbSwgc28gbm8gaW5pdCBvZiBUQ0MuIE5vdywKY2IoKSBjYWxscyBhbm90
aGVyIHN1YnByb2dyYW0gdGhhdCBkb2VzIGEgdGFpbGNhbGwuCgpUaGUgY2FsbGJhY2sgdG8gY2Io
KSBpcyBjb21pbmcgZnJvbSB0aGUga2VybmVsLCBzbyBhNiBjb3VsZCBoYXZlIGJlZW4KY2xvYmJl
cmVkLCBubz8gV2UncmUgZW50ZXJpbmcgYSBzdWJwcm9ncmFtIGNvbWluZyBmcm9tIHRoZSBDIEFC
SS4gTm93LAppZiB0aGUgY2FsbGJhY2sgY2FsbHMgYSBzdWJwcm9nIHRoYXQncyB0YWlsLWNhbGwg
cmVhY2hhYmxlLCB0aGUgVENDCmNhbiBiZSBnYXJiYWdlPwoKCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
