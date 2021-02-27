Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED65C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:07:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C530664EDC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C530664EDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zGJ136BUYwWZbYjdB8UChyCEB71ye4nKhBVH8L4ucDg=; b=0hY4lY30vVQeZ8DpjQ30qcP2v
	I/JVbrTaAtiHeyMqZsS0hqpgK5yvpYjKRDNlnVN2KE1hVWuuqGUZ5I/kDwUeBZ/1YMbyeRqKu7XSn
	rtQXgfl7Zj1RvQiCgopwtJHf+hAvVAE48hx26eldAMzp885KBebL5fDgIBFta4vaJrjyKnzxqxISa
	+9XXf34NhsN9art9F7+jXvnwwkX7gux+Mgyl6hho6pkoHb1feYLTVTMOITJPuQkZVBc7dzdVNoX5E
	yubsYpz5QOfiVruMgzb69oiL99qEwAnm8uuXpQnu6StuRKFy4DYUHV/rIlGkLbYb0Y4JnP04b3j4d
	DVgYAEcow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFpx5-0000AR-8t; Sat, 27 Feb 2021 03:07:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFpx2-0000A4-RI
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 03:07:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id e9so7237565pjj.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 19:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JBIul8fr3ZeQzXGpvzXjp7Ea1B9cqWbqLNAsQUjgvrw=;
 b=elNFiVlkdazF1u8TXmQ8v+imUcgYqv4KwcSMfFfeME3OjFEsxq8MFzDX8pQXcTdf/D
 n7zaMPDRm84cMQ3U99OJ7ZfhVz6VhnZBAZWvhc2b4rhOHXjqVNc2hgxkDoq1wcHPi/z6
 kIkw9ovs+djzz7fpP/IPOJvmnZ465q4pEBpqzZixaKLavlIkuk+zEZz3yDJmXRyMJu9o
 mNPZ4fD7q5Sx8OjF/DA3gSWTZNQeB/uWIIie9fgdnan1ZQyMIm26lQIhmLAKRXxZivIe
 CVMtQV0K8/kHJlkTZWDm4NKjumWLorx4gI54S8CfTt/1tqkEF6wYSO/YhplAQNuFtUZ8
 ccmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JBIul8fr3ZeQzXGpvzXjp7Ea1B9cqWbqLNAsQUjgvrw=;
 b=gJMzEWvUjo1Z+MM1OmnUcbAKGaO/R8xPO3R5AE/f89z2d6gOKHQkbjv4l5WGefDcGK
 qmvNsm4yhuVg4Qyl7F8e1ojkB6dpZzt6AQXhuY+WPhIqywkSxVoIAdcRBqU/aJjHx2Sw
 0epe/Z7QBgfbh8I0yVm0UMP9q0UE9WTZzewB8v4Hi4pS1qdskE/RFqgtVgk87B3fD94J
 6Ew9oTDLgWwdqErYgOQzIu2l1M1UDlqe1h3JJ3gV/o8/lsXv770rqEhfOM6jdMcSJPdo
 RFf3sj17eBtis47NEBdxksZeKT9M2PXWG1vXxoMxX/qBYRi3ZcE/Sn3C7dRKY4jlA06Q
 sa5A==
X-Gm-Message-State: AOAM5323JBnqsAUw4fmfzI+M26Z95cO3ValJGnmGHjxMY7YoF6f1n6Kt
 BSY1BX28EoVuKPZ+OKniqct10A==
X-Google-Smtp-Source: ABdhPJy2NCmISIzqWRxPxTNogNB1OKA8LwJ9bHBHqUgIGFVilKwWdezAfYjMxNoYH7F2UwzMDxZesA==
X-Received: by 2002:a17:90a:e616:: with SMTP id
 j22mr6392414pjy.190.1614395246739; 
 Fri, 26 Feb 2021 19:07:26 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o127sm10708708pfg.202.2021.02.26.19.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 19:07:25 -0800 (PST)
Date: Fri, 26 Feb 2021 19:07:25 -0800 (PST)
X-Google-Original-Date: Fri, 26 Feb 2021 19:07:24 PST (-0800)
Subject: Re: [PATCH] RISC-V: Make NUMA depend on SMP
In-Reply-To: <e76cf929-ba52-6d53-9ac8-ef403f9b1f4f@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-9b0ca6d2-c491-4bd8-a9c8-0b2793694576@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_220728_893885_84E4E46D 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: aou@eecs.berkeley.edu, atishp@atishpatra.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com, akpm@linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNiBGZWIgMjAyMSAxNzowMzo1MyBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4KPiBPbiAyMDIxLzIvMjcgNDoyNSwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+
Cj4+Cj4+IEluIHRoZW9yeSB0aGVzZSBhcmUgb3J0aG9nb25hbCwgYnV0IGluIHByYWN0aWNlIGFs
bCBOVU1BIHN5c3RlbXMgYXJlCj4+IFNNUC4gIE5VTUEgJiYgIVNNUCBkb2Vzbid0IGJ1aWxkLCBl
dmVyeW9uZSBlbHNlIGlzIGNvdXBsaW5nIHRoZW0sIGFuZCBJCj4+IGRvbid0IHJlYWxseSBzZWUg
YW55IHZhbHVlIGluIHN1cHBvcnRpbmcgdGhhdCBjb25maWd1cmF0aW9uLgo+Pgo+PiBGaXhlczog
NGYwZThlZWY3NzJlICgicmlzY3Y6IEFkZCBudW1hIHN1cHBvcnQgZm9yIHJpc2N2NjQgcGxhdGZv
cm0iKQo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4+IFN1Z2dlc3RlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9y
Zz4KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xl
LmNvbT4KPgo+IFJlcG9ydGVkLWFuZC1UZXN0ZWQtYnk6wqAgS2VmZW5nIFdhbmcgPHdhbmdrZWZl
bmcud2FuZ0BodWF3ZWkuY29tPgoKQWgsIHRoYW5rcywgSSBmb3JnZWQgSSdkIHNhaWQgbm8gdG8g
dGhpcyBlYXJsaWVyIDspCgo+Cj4KPj4gLS0tCj4+IFRoaXMgaXMgb24gZml4ZXMuCj4+IC0tLQo+
PiAgIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4+IGluZGV4IGE5OThiYWJjMTIzNy4uODVkNjI2YjhjZTVlIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBA
IC0zMTQsNiArMzE0LDcgQEAgZW5kY2hvaWNlCj4+ICAgIyBDb21tb24gTlVNQSBGZWF0dXJlcwo+
PiAgIGNvbmZpZyBOVU1BCj4+ICAgCWJvb2wgIk5VTUEgTWVtb3J5IEFsbG9jYXRpb24gYW5kIFNj
aGVkdWxlciBTdXBwb3J0Igo+PiArCWRlcGVuZHMgb24gU01QCj4+ICAgCXNlbGVjdCBHRU5FUklD
X0FSQ0hfTlVNQQo+PiAgIAlzZWxlY3QgT0ZfTlVNQQo+PiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JU
U19OVU1BX0JBTEFOQ0lORwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
