Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4912EC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 16:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27B92064A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 16:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbnoFQI2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="a0a+n4EJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27B92064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qa8fxDmHuQvLfBuWOjGxeFFf5eK/2ATSy38Tv0ttO5Q=; b=CbnoFQI29gdTy+wUC1TSN5wxU
	6U+Wd/26WcuskI//goEpk7Ui7/UIJ+O4InvMUBwn+3AsDORMbIhfJoeMTVDGss1em9CLNFaGnsqDC
	Izn2+FYeu6655lxCuBuo2h2GIilmhLoYNKTZmNa270OQnyJhWSDpZFJ6JoVwzO6SSvVFvnsjDhs65
	HJCcS757ex4tlF51KEMlm3Aa7rf2uL+E98Mf/rS1TzrvfmQMztSSNV/WYS+hcpEGeiR0x0OeuwUHD
	dGydWDBSQioMPrpVjx6RjVlkrdQnFeQuVF+MWCzWb1LawcBznlUXBoPOZjroqYJ71p5BNIpB12k42
	J+wWdPCnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7NyX-0008Hk-8y; Tue, 02 Oct 2018 16:56:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7NyU-0008Gi-1l
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 16:56:43 +0000
Received: by mail-pf1-x444.google.com with SMTP id k19-v6so287346pfi.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Tr0T8sOeCL8qC/iUHbjCvryGt1KjfZu/JoUKaBBmURw=;
 b=a0a+n4EJ8DHoQLNeHuno/vkrs4UIbOkWyM/r4KqBmjcju4+Ydnx6MQI1R+462wXuqd
 /iSkisptcUDl2sxSNIg2NAGq/1ATHGb5b3EJvfMxLHmxYU6BmIfvaoviFHIDELMX4PUY
 sDDUKgU4eFzQ05CrxjFySijy10frkLtS1jjEgcMcGNZyUan6BtfRjYhH6BRBiVqIQGqL
 PNhpoigwBsuBAv5eNnY/s7bWn7gkHD7yoGQUUyEb26jBAStKHfOrk/NDHOIuAJlKfGcU
 tOz5RAtC1gglsIer6xrUMrDsSEP2dI0udVF27fiX+C6fhTBCLOf/zlDojrJPgiQGJefM
 hpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Tr0T8sOeCL8qC/iUHbjCvryGt1KjfZu/JoUKaBBmURw=;
 b=W04XdlRwvJ7xIkfI99KMkkU0xBQPvJ2HdKlTbPe4YUc8Xzk5gEhN/9f0fG6gavbiay
 B6+xTa+UfwtJsAWLuuzp5WdT4L6+7JHLZxjPVpo+qG9xEHh/yH/c4Z0f3yhENjpovfIq
 HXJU82AXlrUBGmo37A0hyZYzhNebRSZyiF98HWn8EiJk7+qhqs6Uc97zmx9UWX55OAVQ
 BiBDk5LCFk1bAd9afAq96XpIN/ZZF3LUAAl/8LljmwkkQOVM3hocTp8PZgbrnVMtGoxv
 AtGPHVkd2YjGvCTOGKfyZimu6ZBXhP8sf/lpQFLT/6B9HKS92Rrq5xD0Ztze2OvWlRU1
 mAuA==
X-Gm-Message-State: ABuFfohQ/ZFWBLpIfOXF4aczDjv4kYACfQ42EHWP9ap48dDPb2Wn49nC
 2jJYOkHzDhnyjHrkEl7RTBKlsg==
X-Google-Smtp-Source: ACcGV61GBfZB0bF4pv9JQt7r0HW+4YNPhvm7xcOaIADTaz1r3nsiyl6BIPb0Q+4Ev8SGv7v2gh/c7Q==
X-Received: by 2002:a63:e5e:: with SMTP id
 30-v6mr15303399pgo.320.1538499390229; 
 Tue, 02 Oct 2018 09:56:30 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p1-v6sm9944600pff.128.2018.10.02.09.56.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 09:56:29 -0700 (PDT)
Date: Tue, 02 Oct 2018 09:56:29 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 09:55:53 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <41abac95c55e46047e37ee77439bc4c9@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-bd562b57-bc35-434a-a3ba-431d48b17b79@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_095642_127139_56C31BD5 
X-CRM114-Status: GOOD (  16.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002165629.uJFOvO2bbnMuI1zF5Rag_-D4yNyoUdLe7w82qe6Du70@z>

T24gVHVlLCAwMiBPY3QgMjAxOCAwOTo0Mzo0OCBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAxOC0xMC0wMiAxNzo1NiwgUGFsbWVyIERhYmJlbHQgzq3O
s8+BzrHPiM61Ogo+PiBPbiBUdWUsIDAyIE9jdCAyMDE4IDA3OjA0OjQ5IFBEVCAoLTA3MDApLCBt
aWNrQGljcy5mb3J0aC5nciB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggZW5hYmxlcyB0aGUgdXNlIG9m
IGEgYnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSwgd2hpY2gKPj4+IGNhbgo+Pj4gb3B0aW9u
YWx5IGFsc28gb3ZlcnJpZGUgdGhlIGNvbW1hbmQgbGluZSBwcm92aWRlZCBieSB0aGUgYm9vdCBs
b2FkZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5m
b3J0aC5ncj4KPj4KPj4gQ2hyaXN0b3BoJ3MgY29tbWVudHMgYXJlIHZhbGlkLCBidXQgSSBoYXZl
IGEgYmlnZ2VyIG9uZTogb3VyIG9yaWdpbmFsCj4+IHBsYW4gd2FzIHRvIGZpeCB0aGUgZ2VuZXJp
YyBzdXBwb3J0IGZvciBDT05GSUdfQ01ETElORSwgYW5kIHdoaWxlIEknZAo+PiBzdGlsbCBwcmVm
ZXIgdG8gZG8gdGhhdCBvdXIgb3JpZ2luYWwgYXR0ZW1wdCBnb3QgaHVuZyB1cC4gIEEgd29ya2lu
Zwo+PiBpbXBsZW1lbnRhdGlvbiB0cnVtcHMgYSBjbGVhbiBvbmUsIGJ1dCBJJ2Qgc3RpbGwgcHJl
ZmVyIHRoZSBjbGVhbiBvbmUKPj4gaWYgeW91IGhhdmUgdGltZSB0byB0YWtlIGEgbG9vay4KPj4K
Pj4gVGhlIG9mZmVuZGluZyBmdW5jdGlvbiBpcyBlYXJseV9pbml0X2R0X3NjYW5fY2hvc2VuKCkg
aW4KPj4gZHJpdmVycy9vZi9mZHQuYy4gIFRoZSBpc3N1ZSBpcyB0aGF0IHRoaXMgaXMgb25seSBj
YWxsZWQgd2hlbiBhIGNob3Nlbgo+PiBub2RlIGlzIHByZXNlbnQsIHdoaWNoIGRvZXNuJ3QgZ2V0
IGNhbGxlZCAoYW5kIHRoZXJlZm9yIGRvZXNuJ3Qgc2V0Cj4+IGJvb3RfY29tbWFuZF9saW5lKSB3
aGVuIHRoZXJlIGlzIG5vIC9jaG9zZW4gbm9kZS4gIFRoZSBmaXggbWlnaHQgYmUgYXMKPj4gc2lt
cGxlIGFzIGNoZWNraW5nIGZvciBhIC9jaG9zZW4gbm9kZSBpbiBlYXJseV9pbml0X2R0X3NjYW5f
bm9kZXMoKSwKPj4gYW5kIGNhbGxpbmcgdGhlIENPTkZJR19DTURMSU5FIGhhbmRsaW5nIGlmIHRo
ZXJlJ3Mgbm8gL2Nob3NlbiBub2RlLgo+Pgo+PiBJZiB0aGF0J3MgdG9vIG11Y2ggd29yayBJIGNh
biBhZGQgaXQgdG8gbXkgVE9ETyBsaXN0LCBidXQgdGhhdCBuZXZlcgo+PiBnZXRzIHNob3J0ZXIg
OikuICBHaXZlbiB0aGF0IGxhc3QgdGltZSB3ZSB0cmllZCBtZXNzaW5nIHdpdGggdGhpcyB3ZQo+
PiBicm9rZSB0aGluZ3MgbXVsdGlwbGUgdGltZXMsIEknZCBwcmVmZXIgdG8gaGF2ZSB0aGlzIG9u
IGZvci1uZXh0IGZvciBhCj4+IGJpdCBmaXJzdCBlaXRoZXIgd2F5LCBzbyB0aGVyZSdzIG5vIGJp
ZyBydXNoIG9uIG15IGVuZC4KPj4KPj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghCj4+Cj4KPiBBQ0sg
SSdsbCB3b3JrIG9uIHRoYXQgaW5zdGVhZCwgaXQgbWFrZXMgbW9yZSBzZW5zZSBpZiB3ZSBvbmx5
IGdldCB0aGUKPiBib290IGFyZ3VtZW50cyB0aHJvdWdoIHRoZSBkZXZpY2UgdHJlZS4gV2UnbGwg
YWxzbyBuZWVkIHRvIGRlZmluZQo+IENPTkZJR19DTURMSU5FX0VYVEVORCBmb3IgdGhpcyB0byB3
b3JrIGFzIGV4cGVjdGVkIHNvIEkgZ3Vlc3MgSSdsbCBzZW5kCj4gYSBzZXJpZXMgdG8gYWxzbyB0
d2VhayBLY29uZmlnIGFnYWluLiBEbyB5b3Ugd2FudCBtZSB0byB3b3JrIG9uIHRvcCBvZgo+IG15
IHByZXZpb3VzIEtjb25maWcgcGF0Y2ggb3Igc2hvdWxkIEkgc2VuZCBhIG5ldyBzZXJpZXMgZnJv
bSBzY3JhdGNoID8KCkkgdGhpbmsgeW91IHNob3VsZCB3b3JrIG9uIHRvcCBvZiB5b3VyIGtjb25m
aWcgcGF0Y2gsIGFzIGl0J3MgaW4gZm9yLW5leHQgbm93IApzbyBpdCdsbCBnZXQgcHVsbGVkIGlu
IGV2ZW4gaWYgdGhpcyBkb2Vzbid0LgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
