Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD72C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADNiUNeqPTGFAw6GtI1eNvTMb0O+rSDQuzfxjc4A+i0=; b=XIWv4kp7ATn1e0
	t+9SEHitI2Q6BV/D083o65Iu5CVZZGsKrXciVGlW1BJhgznSFVxhODoqHmsPcXtQCcFi7L7GCyCIP
	Ws5ac4EnUt6Xy8BzedaQGJtv7XgzptxHPEzeL2hQWzoiQwRpaFJ7x79aVy3OvyE83GRGtJ3RlWu5X
	xWWaww4739FR1sORyTGLCrWKAksSSf8TjtxRSNLdEH0Q6ZtkDK2ggmNUXJZg1KHgTAbdJFpCDIiU7
	fCrrPdGlAGHELlb9Wf7nXotkr8tbcdlgLdQMbJqKn8YNUilHRVkzZGXDLP5/RwhOTmONcy/lHF+nN
	QdoA222jki01Cy8KFRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYla-0000000898j-1Bvl;
	Fri, 21 Jun 2024 07:33:02 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYlX-00000008977-05wg
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 07:33:00 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7eeea388a8eso65188039f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718955177; x=1719559977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVfCPcleGZb0eMzqXi7Vsq/j2SxIArSsk0slGEmGrA8=;
        b=BqyZCv7STn8p0sVsOFvSC7XySYgNNQBv/iyhEg3wHhIOqrFyuQWI8Bnx84KmUi852i
         T7MA3OJc8YUqNEdDJpt3Cpjt2HjRUsUOZnbCPfTtb5Bq6AP2a7yzTS4x9b6qnmIoiZr/
         Z9u9FEGLwtFzRIrzsSUihROD5l4jzzHumxw9i6TytJqA+GBZf/7O/3PAf1hudJbexUhc
         stp79gyoq9pxYRqb6qbJywDWbr5IqcInzJU1tugiJJs+ZFFjOzM+d6EQsYaWndPCniQ0
         Xoyu4IolQGN1+sHjkpguonWSPR5yhOL/HzDvIYheGmSO02o1JtdqfsaT1PtxOorGsgF9
         vvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718955177; x=1719559977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVfCPcleGZb0eMzqXi7Vsq/j2SxIArSsk0slGEmGrA8=;
        b=WB1ud5NdV3yJhmMo2qBAtpGQ5pSAJ9OVAOGP5dOPRgr4Yq94EDC42AOmvYgzHemJS4
         tJBbvuB8l2EQjCHHYhXVboXUUGijSdABJBIbuuxe+ZLkGcIIfK0DdGMWzY78KzMtK569
         2Fn8GBP5m530LuEldJo0RSbRYAu/ZGop0nESFQio3WLfg7ZxBNi0iTtbEPRfvOK0XMpT
         KTynKY+M0l1NqUrsRwuNCOtuQMvV/9Wfcf1YrnN+0NfQaSLKwPD6rd4OtDMvgsf/P3Y1
         lbyV/RGNPt1saBgRdlVKi/GA9m74CPQ2LN0yV7nkugVHvKtZH/HLWvuYD8u9mAIGcxIO
         OI7A==
X-Forwarded-Encrypted: i=1; AJvYcCVrO/QgjeL5jbMG+BGVd2Aa57VMi56zQ4HNZCuxTRRK9BGu6rEtVXD1Au6vpDZXFYUHars6diq/PeAhdSW2p316MXayJUpMm+gjO815G6mo
X-Gm-Message-State: AOJu0YzoMXFkhIQIJiBVnCAL373gTm6Y1pEAX0JkXKKYWKyYG4w4nAsm
	s/DNd5lRWC/sXPhlZDhzOdwMsjqg+PA66e1Me05i0CuGhBObY8KxBvfZKs+9eSauJotCUkxPWKJ
	aQUXal0XvLdo44HyooSnYpHz7yn/Cf3nwbUobkw==
X-Google-Smtp-Source: AGHT+IEu4dzZYkNTMX3+BfnbcWOAfXALbnMrAKJ+znJ39Y2amlEx+w3//cBWxFx/TUtSBRZyaVePY5uzyySauxGMR6c=
X-Received: by 2002:a05:6602:2cc5:b0:7eb:af88:1e3a with SMTP id
 ca18e2360f4ac-7f13ee86867mr811509939f.14.1718955177505; Fri, 21 Jun 2024
 00:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-7-zong.li@sifive.com>
 <20240619154901.GN1091770@ziepe.ca>
In-Reply-To: <20240619154901.GN1091770@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Jun 2024 15:32:46 +0800
Message-ID: <CANXhq0qts90x4L6gOhrAx0dMpX1UbPqEAK6QK9fshgso+Pxk3g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/10] iommu/riscv: support nested iommu for
 getting iommu hardware information
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_003259_261334_15DD69F0 
X-CRM114-Status: GOOD (  16.03  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgMTE6NDnigK9QTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMTo1MlBNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIC5od19pbmZvIG9w
ZXJhdGlvbiBhbmQgdGhlIHJlbGF0ZWQgZGF0YQo+ID4gc3RydWN0dXJlcyBmb3IgcGFzc2luZyB0
aGUgSU9NTVUgaGFyZHdhcmUgY2FwYWJpbGl0aWVzIGZvciBpb21tdWZkLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4gIGlu
Y2x1ZGUvdWFwaS9saW51eC9pb21tdWZkLmggfCAxOCArKysrKysrKysrKysrKysrKysKPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+Cj4gPiAgLyoqCj4gPiAgICogZW51bSBpb21tdV9o
d19pbmZvX3R5cGUgLSBJT01NVSBIYXJkd2FyZSBJbmZvIFR5cGVzCj4gPiAgICogQElPTU1VX0hX
X0lORk9fVFlQRV9OT05FOiBVc2VkIGJ5IHRoZSBkcml2ZXJzIHRoYXQgZG8gbm90IHJlcG9ydCBo
YXJkd2FyZQo+ID4gICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mbwo+ID4gICAqIEBJ
T01NVV9IV19JTkZPX1RZUEVfSU5URUxfVlREOiBJbnRlbCBWVC1kIGlvbW11IGluZm8gdHlwZQo+
ID4gKyAqIEBJT01NVV9IV19JTkZPX1RZUEVfUklTQ1ZfSU9NTVU6IFJJU0MtViBpb21tdSBpbmZv
IHR5cGUKPiA+ICAgKi8KPgo+IElzIHRoZXJlIGEgbW9yZSBmb3JtYWwgbmFtZSB0aGFuICJSSVND
ViBJT01NVSIgaGVyZT8gSXQgc2VlbXMgbGlrZSB5b3UKPiB3aWxsIHByb2JhYmx5IGhhdmUgYSBS
SVNDVl9JT01NVV9WMiBzb21lZGF5LCBpcyB0aGF0IG5hbWluZyBPSz8KPgoKUklTQy1WIElPTU1V
IGN1cnJlbnRseSBkb2Vzbid0IGhhdmUgYW5vdGhlciBuYW1lLiBJZiB3ZSBhcmUgcmVhbGx5CnVu
Zm9ydHVuYXRlIGVub3VnaCB0byBuZWVkIHRvIG92ZXJoYXVsIHRoZSBlbnRpcmUgc3RydWN0dXJl
LCBtYXliZSB3ZQpjYW4gZ2l2ZSBpdCBhbm90aGVyIHByb3BlciBuYW1lLiBCdXQgcGVyc29uYWxs
eSwgUklTQ1ZfSU9NTVVfVjIgaXMKZmluZSB3aXRoIG1lLgoKSSBoYXZlIGFsc28gdGFrZW4gYSBs
b29rIGF0IGNvbW1lbnRzIG9uIG90aGVyIHBhdGNoZXMsIHBsZWFzZSBhbGxvdyBtZQphIG1vbWVu
dCB0byBkaWdlc3QgdGhhdCwgSSB3aWxsIHJlcGx5IHRvIHRoZW0gbGF0ZXIuIFRoYW5rcwoKPiBK
YXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
