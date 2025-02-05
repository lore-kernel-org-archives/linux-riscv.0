Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88EC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 04:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B33MTU6P1mTnUtyyc04BEVIaNIYfH2tRJjwzIySh/NQ=; b=2jjTurwLCjlAd3
	zAhBtLzN+DNZ+L2hSF/pUDQ9qgLYQqco7/ei7ZCj+kAVQ8jqHwcAoewY0ZJnQujhUZVqyhhzHp6OO
	HAFOuZVPqwBrkwnc9vgXXUau7k9pB0zgBs168OGguo3o2jLMJv5ZEPD28g9Ivx65K9la6cUJA7oAa
	s6NC5MsyEdQjvzgkIUlXCvNY16KBm/NNAD9s6SjYD0dUctiPGYM4Ei0Dzfjt/AHSd+o+MsMKt+mYg
	GdUIj8Sa6Gam0T1gxdEee42lCAtrx8vn22rduhmtNnxxI7XecrnozW4wUpFj1QVw8kUe+XO0gYYNI
	VIBBfF83uLSxOChvJzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXId-00000002Iqw-0Oiy;
	Wed, 05 Feb 2025 04:46:07 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWCs-00000002EI7-0x3x;
	Wed, 05 Feb 2025 03:36:07 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5174db4e34eso309926e0c.0;
        Tue, 04 Feb 2025 19:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738726564; x=1739331364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=JiNbkttkMKVqxoJnYjS5Ut5O+u1Ph0Jxt9aeSo9F1zbThTpm7FBCnaXY12KINa0RPR
         ViMkXZwLnZZAtafQBExYzFJEgveBknLRxdzlloyBpdIbfh+kTKzUyYM+g8wFvMaRNy/S
         R2GzskRe2J5UrqBPJ+u2dPVuLYk5mp9L7GIdwHqNBNUQtz/PwGWN1PXwXlLi5GaMiz15
         uP5LeP8PIe7cbaNQFbtBCYFn2VMHHM9vBZd+EOlLT2bEsLdzmIYGlNRd8Fo3MRUI/lyY
         XbubzjZUbVFOWLfdcruMnxZ6zxMgYe/AYDkQLqitz1Uw5Izql6dXyvxiBP8OiKXGcboS
         5FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738726564; x=1739331364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=oUrZbAqGVVQvMepDxU/na2nc6vJ37Qn+GCb5tjuHcJ/6snAM15aWmGnVwpYj4dK2CN
         EXDe1u3mSGX17yxYVnjYK1eu7G9u5qDt3W7oL2KqvCgn56IfslpZXBG7pNVoyeC0IYv4
         KfObcCCQIweFnyJ+KgHgQL29oSVtrE9Upej+CzkmGYq6dIFaRaUlcGhHmG1E3xFmGdLt
         v29K7sEXx7kTfL3nyGZ50FKYix0A16HuOFX1LK9ePXa+E4ev+0JUEGvz+x+Y27o2kEUM
         4KevIWopt9WRG2VEJ+o+a2Yg/fsvk3kMSwYqtNUE/iVWNVCQvdp76FsH6WJcWNCeK+t1
         07Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZjSrOVi4HaSjGuSx5+EPBARsnEApQqyVRmXQRt8/9m+JYI26GiuW4Wx+M4KO3z0le6vdAVXHVBQhbLU=@lists.infradead.org, AJvYcCXtZwAGD1I/OdTCywJnRCXTbl+d939nu62A0GciKrafH9CNG4UG6LZbkdSvR+yy2BAoyoaoFV6VXQLBxJTueIko@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4tW4mPYPXojfOHErGHNT+pTfJ7OgNPKnckC1XcOwJCqzB//M
	i/4JvxiTIdYltZeuLu+n2c5rVD/om1ISKwzsuCr3p0DPEgDZrwHyGBTjUunySVqxFFFKcAvWn3t
	8bu2e84Xss+FRTNJSxMTYTKJdVZ4=
X-Gm-Gg: ASbGncvPVD41duBCUd+I4mXBMrkJfHO1k0s0psHEq9JN7sufOuzLBNmf88ki8mG1VdE
	anm2ubW4RGmvm5ElQDM/A57AcLJScMoUmAvmJnzXM+BoXBnc1SwgtTSvk0cqHxU7dWyxgz8/YCJ
	Fprlu7DQwzKYY8t6i0iZ/IusXlV2JHxqg=
X-Google-Smtp-Source: AGHT+IGP4WsgiqUVX5HyqOYtIvh4Hq32IEZYHctOrR7MFUBGMBkylUMFNIOHuXx97Yh2py0mo+lW5Gea5XZG/gxtO2A=
X-Received: by 2002:a05:6122:2217:b0:516:1b30:8779 with SMTP id
 71dfb90a1353d-51f0c93d1fcmr880863e0c.6.1738726564404; Tue, 04 Feb 2025
 19:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-4-21cnbao@gmail.com>
 <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
In-Reply-To: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 5 Feb 2025 16:35:53 +1300
X-Gm-Features: AWEUYZnXwE_m5JMhkeEf-s_y5Z5EWucY3F69kva5tUuQ06iIfAx7YdL3KdTzTZE
Message-ID: <CAGsJ_4wFp5e3DkP2dk_Zar7Feu-LrAyqLG6X1181UeRHCh1pVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_193606_267818_F828B203 
X-CRM114-Status: GOOD (  16.26  )
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

T24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxMjozOOKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGhz
eiA9IDA7Cj4gPgo+ID4gQEAgLTE3ODAsNiArMTgwMCwxNiBAQCBzdGF0aWMgYm9vbCB0cnlfdG9f
dW5tYXBfb25lKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHVnZXRsYl92bWFfdW5sb2NrX3dy
aXRlKHZtYSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIHB0ZXZhbCA9IGh1Z2VfcHRlcF9jbGVhcl9mbHVzaCh2bWEsIGFkZHJlc3MsIHB2bXcu
cHRlKTsKPiA+ICsgICAgICAgICAgICAgfSBlbHNlIGlmIChmb2xpb190ZXN0X2xhcmdlKGZvbGlv
KSAmJiAhKGZsYWdzICYgVFRVX0hXUE9JU09OKSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY2FuX2JhdGNoX3VubWFwX2ZvbGlvX3B0ZXMoYWRkcmVzcywgZm9saW8sIHB2bXcu
cHRlKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzID0gZm9saW9fbnJfcGFn
ZXMoZm9saW8pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2NhY2hlX3JhbmdlKHZt
YSwgcmFuZ2Uuc3RhcnQsIHJhbmdlLmVuZCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHRl
dmFsID0gZ2V0X2FuZF9jbGVhcl9mdWxsX3B0ZXMobW0sIGFkZHJlc3MsIHB2bXcucHRlLCBucl9w
YWdlcywgMCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHNob3VsZF9kZWZlcl9mbHVz
aChtbSwgZmxhZ3MpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2V0X3RsYl91
YmNfZmx1c2hfcGVuZGluZyhtbSwgcHRldmFsLCBhZGRyZXNzLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzICsgZm9saW9fc2l6ZShmb2xpbykpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZsdXNoX3RsYl9yYW5nZSh2bWEsIHJhbmdlLnN0YXJ0LCByYW5nZS5lbmQpOwo+ID4gICAg
ICAgICAgICAgICB9IGVsc2Ugewo+Cj4gSSBoYXZlIHNvbWUgZml4ZXMgWzFdIHRoYXQgd2lsbCBj
b2xsaWRlIHdpdGggdGhpcyBzZXJpZXMuIEknbSBjdXJyZW50bHkKPiBwcmVwYXJpbmcgYSB2Miwg
YW5kIGFtIG5vdCAxMDAlIHN1cmUgd2hlbiB0aGUgZml4ZXMgd2lsbCBnZXQgcXVldWVkK21lcmdl
ZC4KPgo+IEknbGwgYmFzZSB0aGVtIGFnYWluc3QgbW0tc3RhYmxlIGZvciBub3csIGFuZCBzZW5k
IHRoZW0gb3V0IGJhc2VkIG9uCj4gdGhhdCwgdG8gYXZvaWQgdGhlIGNvbmZsaWN0cyBoZXJlIChz
aG91bGQgYWxsIGJlIGZhaXJseSBlYXN5IHRvIHJlc29sdmUKPiBmcm9tIGEgcXVpY2sgZ2xpbXBz
ZSkuCj4KPiBTbyB3ZSBtaWdodCBoYXZlIHRvIHJlZnJlc2ggdGhpcyBzZXJpZXMgaGVyZSBpZiB0
aGUgZml4ZXMgZ28gaW4gZmlyc3QuCgpJIGFzc3VtZSB5b3UncmUgcmVmZXJyaW5nIHRvICJbUEFU
Q0ggdjEgMDgvMTJdIG1tL3JtYXA6IGhhbmRsZQpkZXZpY2UtZXhjbHVzaXZlIGVudHJpZXMgY29y
cmVjdGx5IGluIHRyeV90b191bm1hcF9vbmUoKSIuIEl0IGxvb2tzCnN0cmFpZ2h0Zm9yd2FyZCB0
byByZXNvbHZlIHRoZSBjb25mbGljdC4gSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIGZpcnN0LApJ
J2xsIHNlbmQgYSByZWJhc2UuCgo+Cj4gWzFdIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAy
NTAxMjkxMTU0MTEuMjA3NzE1Mi0xLWRhdmlkQHJlZGhhdC5jb20KPgo+IC0tCj4gQ2hlZXJzLAo+
Cj4gRGF2aWQgLyBkaGlsZGVuYgo+CgpUaGFua3MKQmFycnkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
