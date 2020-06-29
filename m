Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C488C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 09:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29FE920857
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 09:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lDDHe+af";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hW0bjXJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29FE920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2AjQZJbnbJpfsR569XzM0ffTWUW6nffeMsJZeDJLTfw=; b=lDDHe+afNSjh1Ehb7calB3oKK
	Dl10+kIQfheZUaYtzHgWj0njuJDLQwKZ+v45Z5qHrBArQySml8oE9sF9MK8UPW24XMy+FDhE6HvU1
	pnPkqkyuDVDE6Z90pz2eDv1h/Rgl1QhIQqMmK/4055tzdxcAMLFGACGp5ublRsXHwIqG9GZiakvIs
	XYuHULBG9+vyLPtpQA8PoulaeFRHjBCDRTyjcgz1tMzfrsosIgTVCDVVVf9L3bYlCnga2CmQxr2Lg
	DfjAYSIq7MC9zGCpu0Ovo9L8OmzU8s8F8kJ7j2ndzyjwT/LEN93Cz49sIWsPwLUb1b7SCbfRHgTC3
	IijTQmddw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpq7V-0007hT-Uw; Mon, 29 Jun 2020 09:30:33 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpq7T-0007hL-KJ
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 09:30:32 +0000
Received: by mail-qt1-x841.google.com with SMTP id e12so12282743qtr.9
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UWVs7He7VNIcTh2C2GcW0olT9jljSKgU/1oAwOuPtj8=;
 b=hW0bjXJ0rtdgLiAay3FdknLQeHjtZqzeYHE69L5wxoXNmFXvK+g5OpTMUhJwRHwb7q
 bvbox0QHDiD0SWD3kx0HYahntB4q1cNXNRlDC0/R9t7yEOw5ekE67FmcALSsiLzjg3+f
 VL/UgX+94SeirX9eASNqOzglpF/GB/ckHbGUEubGz6b0wAx0SKVBnANLxN/gaYoMo2Yc
 X6pSS5Lirm3fN4cisNuiLIMKseewP65b30sMVYmnNDQwpy+Yd8O8q/HJ/TxZAZcgU9Bh
 Do9DkbjBCxyJAw9Q953X/t9ZOnwnvkOC5h6FffoGecyxugFrYB5FmJHH2EO9vzhEErtB
 s/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UWVs7He7VNIcTh2C2GcW0olT9jljSKgU/1oAwOuPtj8=;
 b=ZqyuXLyiyAPmy0pVGR3o01hGcHAwYaV4o38xZBhaD8GgiR2NjH9vISMTxqoeUPpyla
 TwVGOJVwbI4EtouvEaFrdeZqXjs5nt5IlKLFFcfjz4kVU/6bAAcbhXWzMCWEjcHlK1/e
 MBl7jD0k9gCQlgqio/jk7VKXY6dDzFB+uHGQSRSOFpeKWZjAUL13eui70w6UCzDnhEIj
 teew+bb8Sk5Lq5sK/Ku1plRiemkvDkpqH14hyWC+ymHGU5xclS3i9pJhF5Lb/8A8v5Ku
 T9G9gfXAyk0ZDqFy0Y5ka8JVusyyD2G9EQkkmypxu8J3dV89wdujjJhBKkGkfUqfbEfo
 x9UQ==
X-Gm-Message-State: AOAM532RyLv0Si3aW0D7y/5RXBzuozfsbkRrqxCK6UfBbWd3CLW7S/lG
 Nt8l7B7/LDudcTzrtndouaJQx1/28Da1Z5D89Mp9+biRKgE=
X-Google-Smtp-Source: ABdhPJypLWJGj9IRMTQXEPocCDXObCcTTrMC0Y9v+HHaQ4Ic+KR82mGBzixOF6s8j9FAdyeyxr4vPoEu5a71J2jx/OI=
X-Received: by 2002:ac8:3470:: with SMTP id v45mr15134731qtb.51.1593423029840; 
 Mon, 29 Jun 2020 02:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 29 Jun 2020 17:30:18 +0800
Message-ID: <CAHCEeh+X+0m_oprdS+frRkfbmW7EvWF63xWeJFcQB4_Zc_RUgw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
To: Yash Shah <yash.shah@sifive.com>
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 lollivier@baylibre.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Green Wan <green.wan@sifive.com>, sachin.ghadi@sifive.com, robh+dt@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, deepa.kernel@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, alistair.francis@wdc.com,
 linux-riscv <linux-riscv@lists.infradead.org>, bmeng.cn@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

WWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lmaXZlLmNvbT4g5pa8IDIwMjDlubQ25pyIMTbml6Ug6YCx
5LqMIOS4i+WNiDg6MDHlr6vpgZPvvJoKPgo+IFRoZSBwYXRjaCBzZXJpZXMgYWRkcyB0aGUgc3Vw
cG9ydCBmb3IgZHluYW1pYyBDUFUgZnJlcXVlbmN5IHN3aXRjaGluZwo+IGZvciBGVTU0MC1DMDAw
IFNvQyBvbiB0aGUgSGlGaXZlIFVubGVhc2hlZCBib2FyZC4gQWxsIHRoZSBwYXRjaGVzIGFyZQo+
IGJhc2VkIG9uIFBhdWwgV2FsbXNsZXkncyB3b3JrLgo+Cj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQg
b24gTGludXggdjUuNyBhbmQgdGVzdGVkIG9uIEhpRml2ZSB1bmxlYXNoZWQgYm9hcmQuCj4KPiBZ
YXNoIFNoYWggKDMpOgo+ICAgcmlzY3Y6IGRlZmNvbmZpZywgS2NvbmZpZzogZW5hYmxlIENQVSBw
b3dlciBtYW5hZ2VtZW50Cj4gICByaXNjdjogZHRzOiBmdTU0MC1jMDAwOiBkZWZpbmUgaGFydCBj
bG9ja3MKPiAgIHJpc2N2OiBkdHM6IEhpRml2ZSBVbmxlYXNoZWQ6IGRlZmluZSBhIGRlZmF1bHQg
c2V0IG9mIENQVSBPUFBzCj4KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgOCArKysrKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9m
dTU0MC1jMDAwLmR0c2kgICAgICAgICB8ICA1ICsrKwo+ICAuLi4vcmlzY3YvYm9vdC9kdHMvc2lm
aXZlL2hpZml2ZS11bmxlYXNoZWQtYTAwLmR0cyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysK
PiAgYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAg
NSArKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4KCkhpIFlhc2gsCgpU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gSXQgd29ya3MgZm9yIG1lIHRvIHRlc3Qgd2l0aCBjcHVm
cmVxLWxqdC1zdHJlc3MtdGVzdC4KSGVyZSBpcyBteSBsb2cuCgpDUFUgc3RyZXNzIHRlc3QsIHdo
aWNoIGlzIGRvaW5nIEpQRUcgZGVjb2RpbmcgYnkgbGlianBlZy10dXJibwphdCBkaWZmZXJlbnQg
Y3B1ZnJlcSBvcGVyYXRpbmcgcG9pbnRzLgoKVGVzdGluZyBDUFUgMAogMTQwMCBNSHogLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uIE9L
CiAgOTk5IE1IeiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4gT0sKICA3MDAgTUh6IC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiBPSwogIDM1MCBNSHogLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uIE9LCgpUZXN0
aW5nIENQVSAxCiAxNDAwIE1IeiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gT0sKICA5OTkgTUh6IC4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiBPSwogIDcwMCBNSHogLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
IE9LCiAgMzUwIE1IeiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4gT0sKClRlc3RpbmcgQ1BVIDIKIDE0MDAgTUh6IC4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiBPSwogIDk5
OSBNSHogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uIE9LCiAgNzAwIE1IeiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gT0sKICAzNTAgTUh6IC4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiBPSwoKVGVzdGluZyBD
UFUgMwogMTQwMCBNSHogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uIE9LCiAgOTk5IE1IeiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gT0sKICA3MDAgTUh6IC4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiBPSwog
IDM1MCBNSHogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uIE9LCgpPdmVyYWxsIHJlc3VsdCA6IFBBU1NFRAoKVGVzdGVkLWJ5OiBHcmVl
bnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
