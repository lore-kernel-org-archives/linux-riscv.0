Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C1EE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 04:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AC4AzHq7A6N+mdJnkv7gfk3HVglnyUuaTUmHLQr+EKs=; b=PhDKEgd+ZfaTOt
	IS5P9kHaqxT1bgPlRVRC0iRFPdgDd7+OSD0uvaZHjZAkqv7NQjuiWKtHf2DlpE6KE96d9z6AaAboQ
	t7wZSxZmr4l+E/+UeOAREETc1sc5GFBheFoE4A9/vk21+WtkKOHOGkvhnVYFpEunn68/z+JP59msH
	qeaLnEyzHyYIeVI8JWeKUcpN8fI/cIzOSd8sd+l1By/APt/iBbJifaSGHCaHcxLh3jMEsiL1tCe0C
	Rg5AcrjYEC3PnycxG2jiozVhk9h1C+z15LmDrXEFA/tDB+lh1krqI46t+HoMeie6hTAgTlVpb5bhL
	lMhcftpxibuOBbeHeiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYdA-00000007RDP-2XuY;
	Tue, 14 Jan 2025 04:34:20 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYd8-00000007RCp-0SuX
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 04:34:19 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ce7ae7d84dso3861795ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 20:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736829257; x=1737434057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaLay9e4NdLaEnMvQA3m36X3NEQUW8GDcLBWUlc8nBc=;
        b=x2ZMfGGdFZs3o6yZPG9RlB2/mRakxxbwsUfEcd5cSXpNyNBsiqvu9/G1rW+lq3XqEw
         t412i9BO0XqYlxnidGkURi3jEH+SZKmdsMXuLYe7xooV1neFo+YjbcS2vqVM3jgxAwvk
         +CUDL65T08QK8kS1g8hh8G2N72+rDruPKoWfsGkzW/wLzoqpvbIRfQl6DmODwSJpy04v
         fGMilwfEkMCBuJGVX/qzzMEcQ5V+fKRh1clMRbguwtQAB3D3fVLq2Ytc8SCOkv5d7stO
         REUj6B0PcRLqBrDjfQOcnG19EaqsF4rWrQslm2kVb+kG6eo9MeonwahGdHft3fywAVp1
         HkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736829257; x=1737434057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaLay9e4NdLaEnMvQA3m36X3NEQUW8GDcLBWUlc8nBc=;
        b=i74ZYQU6aUCdI8Aar1eSuPb6hgDocx6cpXCe0mwLFICBkaTgJSQvFTy5kSRUumGygm
         WDr3e/gI2LJlbBDvUEUampd69qKg7agVCU0osv1kUTyBYGn62HyDu7XyKrNwLEyx324h
         W+HJz/TQJYUaGcjYtfdDKR2yvU8BzRcG1RYUs9EC9U40CnDvGU3q94+WQETG1PVOsOox
         KScN2zxH6cZvEcjERhSCjJQfE9BjKX91kDaPIBPRixIhIAn0611f0wjauOSa3MNC4WmO
         SjucAMCz+7K3CeAvJKF6gbNejxBPg2gutYGv6V3YtAWZQcIcDa4pXfPOymtOp8IRYs09
         YzMg==
X-Forwarded-Encrypted: i=1; AJvYcCWeTdjeTtwOtmGqKSJwZeoXB20kLkNt1vdQhSHi9pZ6pw0wPz2/4vpxKJ6JcQvxdMww+SQwdQS1SJC93w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrdHBQ1RuIDxZRj+BlwWCuVfzRKNGhPkgcUradpeoxZ9o8qGpn
	66jaVFlbP6IjQlp8gMjghjLGuxQm38RW9CAL2Pr/coaL+s2Gem+Bb1g5GMWUPIDgfNIUQA6R65h
	y88090UgfNzPovQSrSmKOnZi7V5ByMG3XLsWsMA==
X-Gm-Gg: ASbGncs2BasaxleHbMLXxAIt0mR4mJPUDydmdxXxK6pMPwyh+BpgfRJ32Nkgh3mSE7X
	fg+rBjofiXv5+GtIAVSABbO2J7yHC9HPrYcEmwpo=
X-Google-Smtp-Source: AGHT+IGAXEjqQ6kFnFrOFh+45XOajkSLy5h/c4T2FNvhCbx1iVcVT1PzOog5c9A9OORn146hYlQrQhJYoldi+ju5WMQ=
X-Received: by 2002:a05:6e02:1f8a:b0:3cb:f2e6:5590 with SMTP id
 e9e14a558f8ab-3ce3a7abde0mr202672165ab.0.1736829256752; Mon, 13 Jan 2025
 20:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com> <20250113150933.65121-4-luxu.kernel@bytedance.com>
In-Reply-To: <20250113150933.65121-4-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jan 2025 10:04:05 +0530
X-Gm-Features: AbW1kvZAvYdN_KStXN-1CYf0hA8vqUcnxOUfqSj-H5WH4WKAvbTbjgXbQdSBcOU
Message-ID: <CAAhSdy1UaFVyGMCtGHZZTuEhxGAja=9viN10SbFXKcNwjwJ8yw@mail.gmail.com>
Subject: Re: [PATCH 3/5] irqchip/riscv-imsic: Use wmb() to order normal writes
 and IPI writes
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_203418_413952_8D563FA4 
X-CRM114-Status: GOOD (  15.12  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgODozOeKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IER1cmluZyBhbiBJUEkgcHJvY2VkdXJlLCB3ZSBuZWVkIHRv
IGVuc3VyZSBhbGwgcHJldmlvdXMgd3JpdGUgb3BlcmF0aW9ucwo+IGFyZSB2aXNpYmxlIHRvIG90
aGVyIENQVXMgYmVmb3JlIHNlbmRpbmcgYSByZWFsIElQSS4gV2UgdXNlIHdtYigpIGJhcnJpZXIK
PiB0byBlbnN1cmUgdGhpcyBhcyBJTVNJQyBpc3N1ZXMgSVBJIHZpYSBtbWlvIHdyaXRlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMgfCA2ICsrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1lYXJseS5jCj4gaW5kZXggNjMwOTdmMmJiYWRmLi5jNjMxN2NiNTU3ZmIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gQEAgLTI5LDYgKzI5LDEy
IEBAIHN0YXRpYyB2b2lkIGltc2ljX2lwaV9zZW5kKHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAg
ICAgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWcgKmxvY2FsID0gcGVyX2NwdV9wdHIoaW1z
aWMtPmdsb2JhbC5sb2NhbCwgY3B1KTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEVuc3Vy
ZSB0aGF0IHN0b3JlcyB0byBub3JtYWwgbWVtb3J5IGFyZSB2aXNpYmxlIHRvIHRoZSBvdGhlciBD
UFVzCj4gKyAgICAgICAgKiBiZWZvcmUgaXNzdWluZyBJUEkuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIHdtYigpOwo+ICsKClRoZSBpbXNpY19pcGlfc2VuZCgpIGlzIGNhbGxlZCB0aHJvdWdoIGlw
aV9tdXhfc2VuZF9tYXNrKCkKd2hpY2ggZG9lcyBzbXBfbWJfX2FmdGVyX2F0b21pYygpIGJlZm9y
ZSBjYWxsaW5nIHNvIG5vIG5lZWQKZm9yIGFueSBiYXJyaWVyIGhlcmUuIEFsc28sIGJhcnJpZXJz
IG5lZWQgdG8gYmUgaW4tcGFpciBzbyBhZGRpbmcKYSBzaW5nbGUgYmFycmllciBhdCByYW5kb20g
bG9jYXRpb24gaXMgaW5hcHByb3ByaWF0ZS4KKFJlZmVyLCBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9rZXJuZWwv
aXJxL2lwaS1tdXguYz9oPXY2LjEzLXJjNyNuNzgpCgpCYXNlZCBvbiB0aGUgYWJvdmUsIHRoaXMg
cGF0Y2ggaXMgbm90IG5lZWRlZC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
