Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561CFC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFqEKv1aarhwRnyI7BHtBOtLV3lX0JNPJKkXMR84c3A=; b=4kCEVohCCo4dgT
	0RGQP06h1bZvzKVH69l17hUJjlxWW8W6vNG4KQv6a5B2C6J+V8lp4ihwXe5FRdx/F6Z6m9AgvNYY6
	LV0OnRkeZ6/umiwyvC1yOVoupp3BE4WHwQ3iG0KPtUPotXnayBWLbKG3a7sJvayDMEkHEr4S2l2TA
	VmGUPZNHjb4vnQJrdFx+Ah7awZwyFl9mLsHUo7tJ3iXoZNbMTWsI075EEtRLWUrTVwcujn3xiN8Fv
	skIAUI2/KAwofM2hstITE4gdsrqSkGO8849HvVi+rVIy/ok4BdG9c8Kk1ybZtYiBBW/PBAR7dpoKT
	QgL2dEkallYtQB8N5iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAUp8-00000008xgM-3P2O;
	Fri, 24 May 2024 13:19:06 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAUoy-00000008xWo-1K1U;
	Fri, 24 May 2024 13:18:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f8eba8f25eso737441b3a.3;
        Fri, 24 May 2024 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556728; x=1717161528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=bJx11EyXoehljHhiutcE5wCa6vAYr++YOt3YJXge35zpCGEj8UdttpQ6n4bMw7KIZs
         0btmY7ZrlbkigGRM/1Dd2MmyA6LhAkeDeN9opkoQGeYK78x/WEF5y1pJfltqVc85sc6/
         0QhMzqD3jfmL9YhU+zwGG1sGHaWCpNwgDryVjJx7JZbHtAKiWiAMzDwXAbaL8DERr5Is
         JV4DbxG/Icxh7707wre+/oCwuUDHE/z2Lngd2BPWNIBOSTVe12sHkoJNB1sgs/i3Cte+
         Xm4X11qPvwl9j2XevfcctA+VW8ah02EgjFCEmPCOzIqvGMp+KPb/10F2LwCZraup5/te
         pwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556728; x=1717161528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=ipb4Mdwa3TJWlqK6Pikl5rpEw2szNeaadO+gU0tO8PmbtAMBqp9FYFxJi2ZRjqB4bb
         63F9B7jZ8SN/6uhVDHk0rxLJy2Jj5ZyJXw/Pm//954PVbkdkWmFhvz4NlEm/cBFqydkh
         RvFTNroi+qeN3iXl5lVhc9hEtSCRPYN9zm2Zl5zKY2lvhlk0q2szTrAALcmrpo2rR1qW
         lHcHG34RqU5MVnTLPVOrghuKKpdPvFGQxkKKxo7WVO2BXxLzRoeoACCsq+VBCWcL21Mp
         Z0+0dXfAgn4YZ+Zlu+7WCYjKa5TvEyzLzLwqrgkBMFUDqGYCzhVpRckhSZ+yDSyRMqKm
         cvaw==
X-Forwarded-Encrypted: i=1; AJvYcCVYwva0vOVkm3Ct7/Svr64gzMGNqMCCxAQwBFWLF7uIDN0LJK0/X/t8WATsvMMkQ/CYQP3JXD4oroOam043ai/PFvYPcFU/Vz3FczwcABd6DW8Eku+NxfSpLv7n/5DPJvjFHTnIb+bRK54fIponCqBWxL5xlB4=
X-Gm-Message-State: AOJu0YxRuGd2n0xguXA+m2+D5Ry5yrkJ3v2V4TuGXbF5eGtZNkF5Yd4Y
	R3mPRoJjgzNYrRAz5t8HJUu5WhSp7KLcOHb6Ym5mtRky7+x+ygunL25Mgyc02ZbVjaehrjdk0Qq
	pjoQRjpfu1cZQTKh8LyArNWho+/Od+Q==
X-Google-Smtp-Source: AGHT+IE8pCp8W5E13VNHTBajd1iiFRN6k3JoN7VIxHp3GdM/LrEcuL4DsERnr62fGGcgTS9Bh/R3Y3m/qNihJWl6krM=
X-Received: by 2002:a17:90a:c394:b0:2ae:346d:47cc with SMTP id
 98e67ed59e1d1-2bf5f715486mr2416381a91.38.1716556727885; Fri, 24 May 2024
 06:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
In-Reply-To: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:18:36 -0400
Message-ID: <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Samuel Holland <samuel.holland@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_061856_368759_4AE21E36 
X-CRM114-Status: GOOD (  19.52  )
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

T24gRnJpLCBNYXkgMjQsIDIwMjQgYXQgOToxN+KAr0FNIEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDI0LCAyMDI0IGF0IDU6MTbigK9B
TSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+ID4KPiA+IEhpLAo+
ID4KPiA+IE9uIEZyaSwgTWFyIDI5LCAyMDI0IGF0IDEyOjE4OjI4QU0gLTA3MDAsIFNhbXVlbCBI
b2xsYW5kIHdyb3RlOgo+ID4gPiBOb3cgdGhhdCBhbGwgcHJldmlvdXNseS1zdXBwb3J0ZWQgYXJj
aGl0ZWN0dXJlcyBzZWxlY3QKPiA+ID4gQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JULCB0aGlz
IGNvZGUgY2FuIGRlcGVuZCBvbiB0aGF0IHN5bWJvbCBpbnN0ZWFkCj4gPiA+IG9mIHRoZSBleGlz
dGluZyBsaXN0IG9mIGFyY2hpdGVjdHVyZXMuIEl0IGNhbiBhbHNvIHRha2UgYWR2YW50YWdlIG9m
IHRoZQo+ID4gPiBjb21tb24ga2VybmVsLW1vZGUgRlBVIEFQSSBhbmQgbWV0aG9kIG9mIGFkanVz
dGluZyBDRkxBR1MuCj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+Cj4gPgo+ID4gV2l0aCB0aGlzIHBhdGNoIGluIHRoZSBtYWlubGlu
ZSBrZXJuZWwsIEkgZ2V0IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IKPiA+IHdoZW4gdHJ5aW5n
IHRvIGJ1aWxkIHBvd2VycGM6cHBjMzJfYWxsbW9kY29uZmlnLgo+ID4KPiA+IHBvd2VycGM2NC1s
aW51eC1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGlz
cGxheV9tb2RlX2xpYi5vIHVzZXMgaGFyZCBmbG9hdCwgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMubyB1c2VzIHNvZnQgZmxv
YXQKPiA+IHBvd2VycGM2NC1saW51eC1sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVjaWZp
YyBkYXRhIG9mIGZpbGUgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX2xpYi5vCj4gPgo+ID4gWyByZXBlYXRlZCBtYW55IHRpbWVzIF0KPiA+
Cj4gPiBUaGUgcHJvYmxlbSBpcyBubyBsb25nZXIgc2VlbiBhZnRlciByZXZlcnRpbmcgdGhpcyBw
YXRjaC4KPgo+IFNob3VsZCBiZSBmaXhlZCB3aXRoIHRoaXMgcGF0Y2g6Cj4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4Ly0vY29tbWl0LzVmNTZiZTMzZjMzZGQxZDUw
Yjk0MzNmODQyYzg3OWEyMGRjMDBmNWIKPiBXaWxsIHB1bGwgaXQgaW50byBteSAtZml4ZXMgYnJh
bmNoLgo+CgpOZXZlcm1pbmQsIHRoaXMgaXMgc29tZXRoaW5nIGVsc2UuCgpBbGV4CgoKPiBBbGV4
Cj4KPiA+Cj4gPiBHdWVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
