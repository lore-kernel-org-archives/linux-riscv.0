Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ABAC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A62123975
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A62123975
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZBpXstwnQm1/S+wpa65HjyMS9dZjhnL5M8qWu+L8Emw=; b=Hh/lzKIiBYNqMEISIonVHkpQr
	obsM2ZY5j4wA2cofINP8j7yxPGRNepCqmfpv3RgUD55pDksm58jkibYeVfGoFnRAhyLkuxihq5Zq/
	S1Xx44AmU871ogJiXSA+TWPLhXGEkE2o2VeNw+fR8YDe4AWh5tpeGaPVeLFsrbJSs918vXxWGIZgH
	LqBXGfeh5sy3HLR0z0EUYpioKow2YthMYfAYsy64QzZJZ6+gJSKkLXuHexBvfGEHVOqApl15YAwJC
	4275n+LThVG6AS1AF66C9Ya3IXhPN0gGonYmIf5cEVtrR0nKAf07WbCmAPsiiriLrN/FG9aUDy30J
	QznbZUEng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyNQi-00075L-2m; Sat, 09 Jan 2021 23:13:56 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyMbx-0003eA-Ku
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 22:21:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p18so10015879pgm.11
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 14:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7W2YZRkQEwPTHFli7Q8LAXtCbhfH5mCxXdH2FfDDn10=;
 b=fQDwlGnuJZ2Qb94R/idwKS2rS1VJoLBJv/4xpeVlsLf3RORTeovyj6XBALp/fYEUtN
 /X/IiFbLjUrJyyE72jbZCDHvUKL9SeB015uczBWKNPOFpD0qPmdcmJK7oZzNSt9GlELX
 3XdyGx6cx4B7I+4R/yqxvzfy9Me1SxzCROU1gGj8TGeRKVQSVKQ0BydZKfD2aegdJyjG
 axBLDooPRXnRusLH9OEclbq6/FsVEUM8fpn4VIkb6CNkoOcnig0PTGdJ6xtZUII8FN2D
 vy1B5NPs5UI3rrs8a8bpmmaBe0v0DooRZBij02REo9kNqqtyLfzaXfw09voXaNb3AXDy
 vC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7W2YZRkQEwPTHFli7Q8LAXtCbhfH5mCxXdH2FfDDn10=;
 b=UFbFyfCz+o+pETK0cwjsF8iruCLvPtfZeth1J12Yjlt2ac0akWE8BpeeCtsrzFdz+P
 ZzRv7HAlAJJ/G8CDptmyDuTsxRUiycIg1B/yrSIYoRaq4lPodUa/FZzDmQ+n5dZOyF12
 arGE0N2BIjkQHvXQBSjmz3D0101EFgZ9B1kEVqG58H+2w9eKvQ8EjXIZYbIiXeik1wTH
 pzadWc8W/eHCKS13FY0Gvmw7jP15k9hMAsH9w7xqhm/gW0FAFi+sVZpgHaDxGHfkCyyE
 MK/eDOVImfUvMzkckpBZUaFQs1vClmGlpSDHryF/H1J7hwI/+v8yLdbAv+RgHfNyJf8Y
 CMzQ==
X-Gm-Message-State: AOAM532Qbmxhepjq+HY+aona3N0mg56II+2FeuhBKdzOLI2fpAspo/64
 MfIo7lnwYp6V6exoB4NNG2s6Tv7N4ab+4Kms
X-Google-Smtp-Source: ABdhPJxgmgAsC+9E0s7+UJiwTZujZ0nHBTaH+3c9sAzyweaAdRU/7Y+jTDP6T8vGg0ASD1bBh817hw==
X-Received: by 2002:a63:545f:: with SMTP id e31mr13328314pgm.327.1610230881651; 
 Sat, 09 Jan 2021 14:21:21 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 22sm13464449pfn.190.2021.01.09.14.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 14:21:21 -0800 (PST)
Date: Sat, 09 Jan 2021 14:21:21 -0800 (PST)
X-Google-Original-Date: Sat, 09 Jan 2021 14:21:19 PST (-0800)
Subject: Re: [PATCH] riscv: Add machine name to kernel boot log and stack dump
 output
In-Reply-To: <b0cc0186-b14f-7ce4-e429-1a09442c4953@huawei.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-fb261c4e-325c-47ed-a3d6-fb0da634c743@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_172129_764986_6577B80B 
X-CRM114-Status: GOOD (  17.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNCBEZWMgMjAyMCAwMzozMTowMyBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLMKgIGtpbmRseSBwaW5nLi4KPgo+IE9uIDIw
MjAvMTEvMjUgMTk6NDQsIEtlZmVuZyBXYW5nIHdyb3RlOgo+PiBBZGQgdGhlIG1hY2hpbmUgbmFt
ZSB0byBrZXJuZWwgYm9vdC11cCBsb2csIGFuZCBpbnN0YWxsCj4+IHRoZSBtYWNoaW5lIG5hbWUg
dG8gc3RhY2sgZHVtcCBmb3IgRFQgYm9vdCBtb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWZl
bmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+IC0tLQo+Pgo+PiBIZXJlIGlz
IHRoZSBtZXNzYWdlIGFmdGVyIHBhdGNoZWQsCj4+Cj4+IHJvb3RAKG5vbmUpOn4jIGRtZXNnIHxn
cmVwICJNYWNoaW5lIG1vZGVsIgo+PiBbICAgIDAuMDAwMDAwXSBNYWNoaW5lIG1vZGVsOiByaXNj
di12aXJ0aW8scWVtdQo+Pgo+PiByb290QChub25lKTp+IyBlY2hvIGMgPiAvcHJvYy9zeXNycS10
cmlnZ2VyCj4+IFsgMTUxOS40NzUzNDZdIHN5c3JxOiBUcmlnZ2VyIGEgY3Jhc2gKPj4gWyAxNTE5
LjQ3NjAwNF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IHN5c3JxIHRyaWdnZXJlZCBjcmFz
aAo+PiBbIDE1MTkuNDc2NDgwXSBDUFU6IDAgUElEOiA2NCBDb21tOiBzaCBOb3QgdGFpbnRlZCA1
LjEwLjAtcmM1ICMyNDYKPj4gWyAxNTE5LjQ3Njg3N10gSGFyZHdhcmUgbmFtZTogcmlzY3Ytdmly
dGlvLHFlbXUgKERUKQo+PiBbIDE1MTkuNDc3MTY5XSBDYWxsIFRyYWNlOgo+PiAuLi4KPj4KPj4g
ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgOSArKysrKysrKy0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+PiBp
bmRleCBjNDI0Y2M2ZGQ4MzMuLjkwMWFjMGM2ODBkZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2V0dXAuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+IEBA
IC01NCw4ICs1NCwxNSBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGNwdSwgY3B1X2Rl
dmljZXMpOwo+PiAgIHN0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV9kdGIodm9pZCkKPj4gICB7Cj4+
ICAgCS8qIEVhcmx5IHNjYW4gb2YgZGV2aWNlIHRyZWUgZnJvbSBpbml0IG1lbW9yeSAqLwo+PiAt
CWlmIChlYXJseV9pbml0X2R0X3NjYW4oZHRiX2Vhcmx5X3ZhKSkKPj4gKwlpZiAoZWFybHlfaW5p
dF9kdF9zY2FuKGR0Yl9lYXJseV92YSkpIHsKPj4gKwkJY29uc3QgY2hhciAqbmFtZSA9IG9mX2Zs
YXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgpOwo+PiArCj4+ICsJCWlmIChuYW1lKSB7Cj4+ICsJCQlw
cl9pbmZvKCJNYWNoaW5lIG1vZGVsOiAlc1xuIiwgbmFtZSk7Cj4+ICsJCQlkdW1wX3N0YWNrX3Nl
dF9hcmNoX2Rlc2MoIiVzIChEVCkiLCBuYW1lKTsKPj4gKwkJfQo+PiAgIAkJcmV0dXJuOwo+PiAr
CX0KPj4KPj4gICAJcHJfZXJyKCJObyBEVEIgcGFzc2VkIHRvIHRoZSBrZXJuZWxcbiIpOwo+PiAg
ICNpZmRlZiBDT05GSUdfQ01ETElORV9GT1JDRQoKVGhhbmtzLCB0aGlzIGlzIG9uIGZvci1uZXh0
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
