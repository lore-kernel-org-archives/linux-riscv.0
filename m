Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 04:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SSRX02pjbxp/FFPRHvkpi4NB2IK8UGgbEqqKhmIzLU0=; b=Ukp864H3MjOsVhfsky2Qr9MHem
	sQdH9FtpgU1a/nlWM0apCUHmdCq9qO9YvFJ3LbWtoc3G6GVOlNOabyOfP1/f3RrUYXKjbdiu8wncX
	iA51BSEsPEuCKGEy0M3Neqg6OYq/QXL/WqLvhG/xST0vivlaDKUro1x+4vvGNJthuCt4fM766YCX/
	8KtI/+gHM+7bfUs8AjIQFUaQGY4pB9aUv2CWvFdnXK7cM5nBClGpAsyUinqxQxkICFY22m4Lf62P/
	rc8IkWL1gvaFlCXh5N2lEKf1mr5lZYZStcUqsRiQ61golNQtD/5z+8Zj3L0QIE0fdoSCh9R2R9tWk
	43rLetKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Jx1-00GOep-TD; Thu, 06 Jan 2022 04:00:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Jwz-00GOds-G7
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 04:00:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id h1so1596512pls.11
 for <linux-riscv@lists.infradead.org>; Wed, 05 Jan 2022 20:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qgwKv5PQoXLkxgyDTQ4hHS1V4o8XM30V03ednSV4rWQ=;
 b=Pl4BTvT7b3DtTv0DzxSbh2JOxkqsv+n3SNLIAmsPG5NUWpS44uJ9zJJK44UcRZdVWX
 tG+PyjQAu7cKYH3gYZOA/IRYn05vJa5jrQ6Rn+xT6ZagN9Hz1kmoCDQ4v0YP1ZK0tibV
 tqX08oRMPX6EclAMSmNxZRHio31u15Tdo6hdeUUa/xmxcRrcd0byNwDgXINeA4fsGozU
 hmd0KnMjOvmsGqxdRZi0T9EOHEHZqBwE/7Lp8/W9pVZ1+Q+WZJQ+Em11fQaHdINghOI2
 go1ns+QPtPT+JinZuRfesRa4WMTNVsOwY+1oW8+/k1BYQRXdndBoaBLRfSywWvY1fezb
 76nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qgwKv5PQoXLkxgyDTQ4hHS1V4o8XM30V03ednSV4rWQ=;
 b=MdQPvu6Q2rA7KJ/RMYVLbwsJlq/OXm3JP3m3QNiTjWJLxwB2QnAREAq+9VV/cCQI/s
 HIgB4wmYEWRN+QBv8GvZDnctX4hRCKOUHq+mtLpNXckQSewVfhWokPO3LJRCEIzo4g0t
 8bh1lr9M6l/UXpnGUjS6/UGDJQlLk2dPOPvsiAtpxdpG0P4n0bPavYQt4doiNsC3XNz/
 XmTlNWeuzmEzfZeUplhZd3+rZ5MUM2f3m5xoL2GZjXBtY704PCxc5m99NDopNudmdTpU
 m2IuTNlOC7e4ydMCM1ACchqJnpwupC6rMfDoiOt8GqfkhZfBwnLrHdiocM65nGfiFexz
 +2EA==
X-Gm-Message-State: AOAM533zv3oN0PYftDgR7eQLQ3r9bB0J6lBxUSbTq49jRUJt7YNBv8iY
 9ktGVJMg1dYurjnTbuP6zQ0gxyL4x7CE8w==
X-Google-Smtp-Source: ABdhPJyDfrl0uQYOAlKego2gW2Ho0JSv7ULHKyS8LFwpKdYNS53B8PgJpSH4I8+qtamA/h18AJFWaw==
X-Received: by 2002:a17:902:d503:b0:149:16ed:d15f with SMTP id
 b3-20020a170902d50300b0014916edd15fmr56920468plg.102.1641441627553; 
 Wed, 05 Jan 2022 20:00:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 10sm543272pfm.56.2022.01.05.20.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 20:00:27 -0800 (PST)
Date: Wed, 05 Jan 2022 20:00:27 -0800 (PST)
X-Google-Original-Date: Wed, 05 Jan 2022 19:32:14 PST (-0800)
Subject: Re: [PATCH v2] riscv: mm: Enable PMD split page table lock for RV64
In-Reply-To: <ee556125-4ac7-f93b-4996-26b21783dff7@huawei.com>
CC: linux-riscv@lists.infradead.org, palmerdabbelt@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-4f54e0c0-74d7-4065-b825-7a06be04c4cf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_200029_571854_B5CA5AEC 
X-CRM114-Status: GOOD (  16.06  )
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

T24gRnJpLCAxOSBOb3YgMjAyMSAwMDoxNDoxOSBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLMKgIHBpbmcsIGl0IGxvb2tzIHRoaXMgcGF0
Y2ggaXMgbWlzc2VkLi4uCgpTb3JyeSBhYm91dCB0aGF0LiAgVGhpcyBpcyBvbiBmb3ItbmV4dCwg
dGhhbmtzIQoKPiBPbiAyMDIxLzkvMjcgMTE6MDMsIEtlZmVuZyBXYW5nIHdyb3RlOgo+PiBBZnRl
ciBjb21taXQgMTM1NWMzMWVlYjdlICgiYXNtLWdlbmVyaWM6IHBnYWxsb2M6IHByb3ZpZGUgZ2Vu
ZXJpYwo+PiBwbWRfYWxsb2Nfb25lKCkgYW5kIHBtZF9mcmVlX29uZSgpIiksIHRoZSBtYWluIHBh
cnQgdG8gc3VwcG9ydAo+PiBQTUQgc3BsaXQgcGFnZSB0YWJsZSBsb2NrIGlzIGluIGFzbS1nZW5l
cmljL3BnYWxsb2MuaC4KPj4KPj4gVGhlIG9ubHkgY2hhbmdlIGlzIGFkZCBwZ3RhYmxlX3BtZF9w
YWdlX2N0b3IoKSBpbnRvIGFsbG9jX3BtZF9sYXRlKCksCj4+IHRoZW4gd2UgY291bGQgZW5hYmxl
IEFSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0sgZm9yIFJWNjQuCj4+Cj4+IFJldmlld2VkLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVu
ZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IHYyOgo+PiAtIHJl
YmFzZSB0byB2NS4xNS1yYzMsIHVwZGF0ZSBjaGFuZ2Vsb2csIGFuZCBhZGQgUkIKPj4KPj4gICBh
cmNoL3Jpc2N2L0tjb25maWcgICB8IDEgKwo+PiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMyAr
Ky0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4+IGluZGV4IDMwMWE1NDIzM2M3ZS4uNWM0NDYzZjMwZWIwIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBAIC0xNCw2ICsx
NCw3IEBAIGNvbmZpZyBSSVNDVgo+PiAgIAlkZWZfYm9vbCB5Cj4+ICAgCXNlbGVjdCBBUkNIX0NM
T0NLU09VUkNFX0lOSVQKPj4gICAJc2VsZWN0IEFSQ0hfRU5BQkxFX0hVR0VQQUdFX01JR1JBVElP
TiBpZiBIVUdFVExCX1BBR0UgJiYgTUlHUkFUSU9OCj4+ICsJc2VsZWN0IEFSQ0hfRU5BQkxFX1NQ
TElUX1BNRF9QVExPQ0sgaWYgUEdUQUJMRV9MRVZFTFMgPiAyCj4+ICAgCXNlbGVjdCBBUkNIX0hB
U19CSU5GTVRfRkxBVAo+PiAgIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRQo+PiAg
IAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfVklSVFVBTCBpZiBNTVUKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gaW5kZXggYzBjZGRm
MGZjMjJkLi4xZjIxMzc1YmE4NmYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IEBAIC0zNjcsNyArMzY3LDggQEAgc3Rh
dGljIHBoeXNfYWRkcl90IF9faW5pdCBhbGxvY19wbWRfbGF0ZSh1aW50cHRyX3QgdmEpCj4+ICAg
CXVuc2lnbmVkIGxvbmcgdmFkZHI7Cj4+Cj4+ICAgCXZhZGRyID0gX19nZXRfZnJlZV9wYWdlKEdG
UF9LRVJORUwpOwo+PiAtCUJVR19PTighdmFkZHIpOwo+PiArCUJVR19PTighdmFkZHIgfHwgIXBn
dGFibGVfcG1kX3BhZ2VfY3Rvcih2aXJ0X3RvX3BhZ2UodmFkZHIpKSk7Cj4+ICsKPj4gICAJcmV0
dXJuIF9fcGEodmFkZHIpOwo+PiAgIH0KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
