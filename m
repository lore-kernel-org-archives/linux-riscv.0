Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42143E92FD9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 02:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmRP3zD2Gj/7HMTA2nMHNEKnxhrn4YVMnL/iD+VR+2I=; b=qeUw4EwyGM3p4X
	EgNCsiFOFz68F7ehAV9yZ7QLk7YHg7CgLAxfY6Bx4ztDWlqXIg35Y336fJ/5frA9c/EcnShOoRry1
	oBRgmoh7w6J672ZaLndd0B8xg8hRmTmBCizepH5eN4fwWdImYYqSSeA4S8KfCfa23SzfmVT39zyzo
	W3i0LUTIUq46y6FkYqdA2ducmJe1NQDC7RZKPSGXVNrV/cfB3JK/KL6hC4UMfQrS0kjBLPFG9eqDZ
	eLLkpw64jB+eW+peUvcEEC9YcOgGS0PlVHFkky3osLgQYpQDoAf/VqWgUIy7pbMnwbwbfdK05969C
	3G+6n8Oei1Mzl2rC7lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoatC-004ogN-1g;
	Fri, 06 Oct 2023 02:48:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoat9-004of5-0J
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 02:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9495BCE2568
	for <linux-riscv@lists.infradead.org>; Fri,  6 Oct 2023 02:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD87CC433CA
	for <linux-riscv@lists.infradead.org>; Fri,  6 Oct 2023 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696560500;
	bh=S+UavZRf4TVde+EA7hXdDDYlBSk/ccOB+/KHk1iz80g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VkuGMNWUI/INWYI7UAQ5hDFiJvSQwqvucBLoGelVQy34XYyJjVLSJpfovqnvoDl9r
	 wMsFhn2dXzRKhQuZMtjNlIKdRfX5MrEDfToEvH9Mfs1+rDCM7Z3OP8e84+5xeIs3JP
	 IWz2g9U/Ia4oB6sNLc6oyAwQrgo71YxbH3ItMdcSiv6zo5qyJfOCdvzXFg7LgLBiNQ
	 dun5eOGuk8s64F4MaZFwk/s4FJH1v7a+U8icg1dAx3acq/Aq4QSCbqvua1KF5oel1S
	 +xCw9GBJJqqQ/yp3KRlU5HYbNEX6oZZbloWupv66b8Gmua3K0hYA2jHoiWxXjvNRwq
	 AXcgya9LgXHcg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so2821412a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Oct 2023 19:48:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy36Yj+hzMbAMXVTnOkm8aeQHdTan2LhDGxWhaOhAl6G6HCw2WO
	tuIYRmP6gRq57o2c3L0FYVQjd+4QwEGb67NP3uY=
X-Google-Smtp-Source: AGHT+IHHJrOv7etXCufe5MYexC2R/ar0YERk9oUhukJTm0YaOv3zNAwX91pCk/3auUIH/dZW4AA5ZcAtrNbsYHKMwHw=
X-Received: by 2002:a05:6402:1859:b0:530:8a17:39e0 with SMTP id
 v25-20020a056402185900b005308a1739e0mr6630177edy.13.1696560499299; Thu, 05
 Oct 2023 19:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231001103433.3187-1-jszhang@kernel.org>
In-Reply-To: <20231001103433.3187-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Oct 2023 10:48:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTROKwz01psgVES0Vq6G+krnYySW2BAXuHfhQHPsj-yFLw@mail.gmail.com>
Message-ID: <CAJF2gTROKwz01psgVES0Vq6G+krnYySW2BAXuHfhQHPsj-yFLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_194827_488110_08C3DE00 
X-CRM114-Status: GOOD (  20.96  )
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

T24gU3VuLCBPY3QgMSwgMjAyMyBhdCA2OjQ24oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFByZXZpb3VzbHksIHdlIHVzZSBhbHRlcm5hdGl2ZSBtZWNo
YW5pc20gdG8gZHluYW1pY2FsbHkgcGF0Y2gKPiB0aGUgQ01PIG9wZXJhdGlvbnMgZm9yIFRIRUFE
IEM5MDYvQzkxMCBkdXJpbmcgYm9vdCBmb3IgcGVyZm9ybWFuY2UKPiByZWFzb24uIEJ1dCBhcyBw
b2ludGVkIG91dCBieSBBcm5kLCAidGhlcmUgaXMgYWxyZWFkeSBhIHNpZ25pZmljYW50Cj4gY29z
dCBpbiBhY2Nlc3NpbmcgdGhlIGludmFsaWRhdGVkIGNhY2hlIGxpbmVzIGFmdGVyd2FyZHMsIHdo
aWNoIGlzCj4gbGlrZWx5IGdvaW5nIHRvIGJlIG11Y2ggaGlnaGVyIHRoYW4gdGhlIGNvc3Qgb2Yg
YW4gaW5kaXJlY3QgYnJhbmNoIi4KPiBBbmQgaW5kZWVkLCB0aGVyZSdzIG5vIHBlcmZvcm1hbmNl
IGRpZmZlcmVuY2Ugd2l0aCBHTUFDIGFuZCBFTU1DIHBlcgo+IG15IHRlc3Qgb24gU2lwZWVkIExp
Y2hlZSBQaSA0QSBib2FyZC4KPgo+IFVzZSByaXNjdl9ub25zdGRfY2FjaGVfb3BzIGZvciBUSEVB
RCBDOTA2L0M5MTAgQ01PIHRvIHNpbXBsaWZ5Cj4gdGhlIGFsdGVybmF0aXZlIGNvZGUsIGFuZCB0
byBhY2NoaWV2ZSBBcm5kJ3MgZ29hbCAtLSAiSSB0aGluawo+IG1vdmluZyB0aGUgVEhFQUQgb3Bz
IGF0IHRoZSBzYW1lIGxldmVsIGFzIGFsbCBub25zdGFuZGFyZCBvcGVyYXRpb25zCj4gbWFrZXMg
c2Vuc2UsIGJ1dCBJJ2Qgc3RpbGwgbGVhdmUgQ01PIGFzIGFuIGV4cGxpY2l0IGZhc3QgcGF0aCB0
aGF0Cj4gYXZvaWRzIHRoZSBpbmRpcmVjdCBicmFuY2guIFRoaXMgc2VlbXMgbGlrZSB0aGUgcmln
aHQgdGhpbmcgdG8gZG8gYm90aAo+IGZvciByZWFkYWJpbGl0eSBhbmQgZm9yIHBsYXRmb3JtcyBv
biB3aGljaCB0aGUgaW5kaXJlY3QgYnJhbmNoIGhhcyBhCj4gbm90aWNlYWJsZSBvdmVyaGVhZC4i
Cj4KPiBUbyBtYWtlIGJpc2VjdCBlYXN5LCBJIHVzZSB0d28gcGF0Y2hlcyBoZXJlOiBwYXRjaDEg
ZG9lcyB0aGUgY29udmVyc2lvbgo+IHdoaWNoIGp1c3QgbWltaWNzIGN1cnJlbnQgQ01PIGJlaGF2
aW9yIHZpYS4gcmlzY3Zfbm9uc3RkX2NhY2hlX29wcywgSQo+IGFzc3VtZSBubyBmdW5jdGlvbmFs
aXRpZXMgY2hhbmdlcy4gcGF0Y2gyIHVzZXMgVC1IRUFEIFBBIGJhc2VkIENNTwo+IGluc3RydWN0
aW9ucyBzbyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gY292ZXJ0IFBBIHRvIFZBLgpTb3JyeSwgSSBk
aWRuJ3Qgc2VlIHlvdXIgc2Vjb25kIHBhdGNoLiBJZiB5b3UgaGF2ZSB1c2VkIFBBLCBqdXN0Cmln
bm9yZSBteSBwcmV2aW91cyByZXBseS4KCj4KPiBIaSBHdW8sCj4KPiBJIGRpZG4ndCB1c2Ugd2Jh
Y2tfaW52IGZvciB3YmFjayBhcyB5b3Ugc3VnZ2VzdGVkIGR1cmluZyB2MSByZXZpZXdpbmcsCj4g
dGhpcyBjYW4gYmUgbGVmdCBhcyBmdXR1cmUgb3B0aW1pemF0aW9ucy4KT2theS4gSSBqdXN0IGRv
bid0IHdhbnQgc2cyMDQyICYgdGgxNTIwIHRvIGhhdmUgYSBkaWZmZXJlbmNlIGhlcmUuCgo+Cj4g
VGhhbmtzCj4KPiBzaW5jZSB2MToKPiAgIC0gY29sbGVjdCBUZXN0ZWQtYnkgdGFnCj4gICAtIGFk
ZCBwYXRjaDIgdG8gdXNlIFQtSEVBRCBQQSBiYXNlZCBDTU8gaW5zdHJ1Y3Rpb25zLgo+Cj4gSmlz
aGVuZyBaaGFuZyAoMik6Cj4gICByaXNjdjogZXJyYXRhOiB0aGVhZDogdXNlIHJpc2N2X25vbnN0
ZF9jYWNoZV9vcHMgZm9yIENNTwo+ICAgcmlzY3Y6IGVycmF0YTogdGhlYWQ6IHVzZSBwYSBiYXNl
ZCBpbnN0cnVjdGlvbnMgZm9yIENNTwo+Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgICAg
ICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgICAgIHwg
NjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2VycmF0YV9saXN0LmggfCA1MCArKystLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDc0IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQwLjEKPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
