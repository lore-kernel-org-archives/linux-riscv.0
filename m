Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74891C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 00:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmQYaS6gQBqZ+qX/cpE+0TL9cee6/HMFahGoI4gMgIM=; b=JNbDLFiIzgR1Cm
	XZEzxm63zeGOi//etv6r+DJvpeS9bvcmV4qjUdnBg0B48GNtaEnO/4t6IJpKw+GMt1X4crF/Bj+Q4
	EFgMbKcHzwh7N14PU2vShlWOMW1oWWhNJa7Uc4eqoRczBCJLFLG8Cqv4Ay5jab2lAwof19H7ZUkMb
	BWI6jyzG7ShX0mffI9yP8gH+e66xVAXNQxoOlbOh2QGNtCrB7Y4PmIW9dMqKAWpftjSzx6EbzOUGk
	JrSNBS0zcdUbflJlcPWwW+ikFtzqddPQBheUiQH0SKS2wKxbmxZSrqDQ8QYyPja02Kl2h3JJnWmVK
	okIxAR2iYUm9KPsmElOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pujR6-009P8F-05;
	Fri, 05 May 2023 00:36:36 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pujR3-009P7r-21
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 00:36:35 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-32b47d6792dso8486995ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683246992; x=1685838992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjmOKwxVLQY18CC3WHFDbVhiCUx1xhOsqgqBRjXYxok=;
        b=a7y7UEmIBOuYdwcFqiVdt1mVbZ3V8yR9xcOGExvHxnh4MMDfRjs0ybX3jSVEWd84/D
         SAHKhOeBZS8BYcEAjoDtLgvzMiioHGEAoDR/tLMciltWezAaeYpbxNIGMiv6tQ2yRoBN
         iafnpmbknvt0dZXpvJN6a7M/v46hbQPgR+d0nhkN//YO+rtni1RxP0rFvHykSMGwgJfk
         6ytmF3XgdJ2mDfnV+G1M69KEPvzovzVpnc+aPUPUPgH63Qu37rLEpbLMeaSajveIN4Vq
         FS6wI8MbJLraEYKQ8IQyuj4Csy0DyMcDh9fO3W1IzGAgD5JLzeJ7z0TZ/kcq1Sow1TOp
         QNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683246992; x=1685838992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjmOKwxVLQY18CC3WHFDbVhiCUx1xhOsqgqBRjXYxok=;
        b=ETRl9gJo71c9fVlXN+snoHyF3msdoD9xDnbSqE6zob5UnfkIjW18kOi6iToJ3ZB+xG
         l2WzRt0y+oxpwucKLA6xAFWaCovaCKjK0BQ3ZBUxxF2BsXulRprPr9kWUwUTW1sB7dT8
         K6ReZfgU0AtyI+UrMOPrszR0Zmgfi2ni4feZUthIJ+DnglttLAuhnH2OjcNXsT/RGWrZ
         Hwe31+25rx1L+dEQObUSqD4Tlhrlnt+0yJBhSEURXYwtVWAAd9FzfpJJV55/VtR9ENwO
         EHziG+bwwZ5zGgqv8TKTngS5sadgHqcmAjUEPkYp1uQfKzMM4DN/288JSHmc+uMDP2OG
         vY3Q==
X-Gm-Message-State: AC+VfDxgOMxHk5u96Uc9qKbZBXmerVbesdJftjnRcWX0uMapxeO9hhkE
	aF2H0WUCpS8fXstE7SPwBV2fIv3+y5FttzeJa+9Ovw==
X-Google-Smtp-Source: ACHHUZ7+o0ekC6oKbBn6xsJ7rA6FEMvSDV8hE9RxRkaB1i7GEfGcBGK/l8ntjGsrVczH79IiMO+tszApBOKFULzWfr0=
X-Received: by 2002:a92:ca90:0:b0:32b:4d92:2b8 with SMTP id
 t16-20020a92ca90000000b0032b4d9202b8mr430638ilo.26.1683246991074; Thu, 04 May
 2023 17:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230426074248.19336-1-zong.li@sifive.com> <MN0PR12MB59536CEE65DBB0EF343650F4B76D9@MN0PR12MB5953.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB59536CEE65DBB0EF343650F4B76D9@MN0PR12MB5953.namprd12.prod.outlook.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 5 May 2023 08:36:19 +0800
Message-ID: <CANXhq0q=VHDmpweSX35iec1x6UHBDRB7-mo4nWL_cqSWTBW0tQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx: enable on RISC-V platform
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_173633_795159_9D2BD290 
X-CRM114-Status: GOOD (  20.34  )
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

T24gVGh1LCBNYXkgNCwgMjAyMyBhdCAxMDoxN+KAr1BNIFBhbmRleSwgUmFkaGV5IFNoeWFtCjxy
YWRoZXkuc2h5YW0ucGFuZGV5QGFtZC5jb20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+ID4gRnJvbTogbGludXgtcmlzY3YgPGxpbnV4LXJpc2N2LWJvdW5jZXNAbGlz
dHMuaW5mcmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mCj4gPiBab25nIExpCj4gPiBTZW50OiBXZWRu
ZXNkYXksIEFwcmlsIDI2LCAyMDIzIDE6MTMgUE0KPiA+IFRvOiB2a291bEBrZXJuZWwub3JnOyBk
bWFlbmdpbmVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBab25nIExpIDx6b25n
LmxpQHNpZml2ZS5jb20+Cj4gPiBTdWJqZWN0OiBbUEFUQ0hdIGRtYWVuZ2luZTogeGlsaW54OiBl
bmFibGUgb24gUklTQy1WIHBsYXRmb3JtCj4gPgo+ID4gRW5hYmxlIHRoZSB4aWxpbnggZG1hZW5n
aW5lIGRyaXZlciBvbiBSSVNDLVYgcGxhdGZvcm0uIFdlIGhhdmUgdmVyaWZpZWQgdGhlCj4gPiBD
RE1BIG9uIFJJU0MtViBwbGF0Zm9ybSwgZW5hYmxlIHRoaXMgY29uZmlndXJhdGlvbiB0byBhbGxv
dyBidWlsZCBvbiBSSVNDLVYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9kbWEvS2NvbmZpZyB8IDIgKy0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvS2NvbmZpZyBiL2RyaXZlcnMvZG1hL0tjb25maWcgaW5k
ZXgKPiA+IGZiNzA3M2ZjMDM0Zi4uODE2ZjYxOTgwNGI5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9kbWEvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9kbWEvS2NvbmZpZwo+ID4gQEAgLTY5NSw3
ICs2OTUsNyBAQCBjb25maWcgWEdFTkVfRE1BCj4gPgo+ID4gIGNvbmZpZyBYSUxJTlhfRE1BCj4g
PiAgICAgICB0cmlzdGF0ZSAiWGlsaW54IEFYSSBETUFTIEVuZ2luZSIKPiA+IC0gICAgIGRlcGVu
ZHMgb24gKEFSQ0hfWllOUSB8fCBNSUNST0JMQVpFIHx8IEFSTTY0KQo+ID4gKyAgICAgZGVwZW5k
cyBvbiAoQVJDSF9aWU5RIHx8IE1JQ1JPQkxBWkUgfHwgQVJNNjQgfHwgUklTQ1YpCj4KPiBJbnN0
ZWFkIG9mIGFkZGluZyBvbmUgbW9yZSBkZXBlbmRlbmN5IEkgdGhpbmsgd2UgY2FuIGNsZWFudXAg
dGhpcwo+IGRlcGVuZGVuY3kgbGlzdC4gU2ltaWxhciBjaGFuZ2VzIGRvbmUgaW4gZXRoZXJuZXQg
c3Vic3lzdGVtLiBQbGVhc2UKPiBoYXZlIGEgbG9vayBhdCBiZWxvdyBjb21taXRzOgo+CgpIaSBQ
YW5kZXksClRoYW5rcyBmb3IgeW91ciB0aXBzLCBsZXQgbWUgdGFrZSBhIGxvb2sgYXQgaXQsIGFu
ZCBnaXZlIHRoZSBuZXh0IHZlcnNpb24uCgo+IGU4YjZjNTRmNmQ1NyBuZXQ6IHhpbGlueDogdGVt
YWM6IFJlbGF4IEtjb25maWcgZGVwZW5kZW5jaWVzCj4gZDdlYWY5NjJhOTBiIG5ldDogYXhpZW5l
dDogSW4ga2NvbmZpZyByZW1vdmUgYXJjaCBkZXBlbmRlbmN5IGZvciBheGlfZW1hYwo+Cj4gPiAg
ICAgICBzZWxlY3QgRE1BX0VOR0lORQo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBFbmFibGUg
c3VwcG9ydCBmb3IgWGlsaW54IEFYSSBWRE1BIFNvZnQgSVAuCj4gPiAtLQo+ID4gMi4xNy4xCj4g
Pgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
