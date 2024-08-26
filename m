Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9386DC5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsbamSM39a/De9zwf01NK9Q7kjK0x+Xr3UdfG4THcqM=; b=QTd2lapYhR7qSU
	zx8tahWeU/uOHTJrWYujgUdrPERMhZt/8DHu96pvdEHho95M3YBZj9QuvVbbmIs9hobJzjTvu+bmN
	nDMdrTlg/Ynef/wWlQSITQ9vtutpNH/AKttRJncdUAVvg1MeebiT7tIluS1wvyVxUImXseR8ioIAE
	2+AiMyg6a2dLZi8BH/T/afV7F7yQPxrATSokzxtvKbDFS0Gc3GSAndyq7XB5GXFqk3X8jenoVabFB
	VNwR9WiNhogSX3bi/i2DzCXS/B1MS67bSdy4HLqzl9GQJxJjr6rcod/nsWdoYmonUWQLZQrUC1Vxd
	+x7o3sccs9ERyT30gasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sid3D-000000086YP-2PEZ;
	Mon, 26 Aug 2024 16:58:43 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sid3A-000000086XU-0Mwa
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:58:41 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-39d30f0f831so14477365ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724691518; x=1725296318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhXfyj2KvujK2JosxSUi62CACNBRQWFA93L81bGY5QM=;
        b=ZeCPJnXmrpfL4V9ROiMHXHQP4ZYuucd5wORU0MXTUMDuc44RwOYzO2BgpzvU4d0yaI
         Mwv1yhwLnB1Yeie/nyHGZ/RY8rOZ675jBf0twpVnXU9A24Y4yOQTD3Cp3tolxq/Ge+iE
         AqHoVYPt/g0/EfDK4f0rGC++nJ+mL7eONMfRnGEd4P0xJSLgBaVO+2dHp2UzU8Xox2tJ
         jvrsgyOqiksTlxryrvlcFvn2Xu7HXTTj/VDuBykGEATByqd+vW9wXS4CUABBy/ZyXnkb
         bLGcBoJW9UU8xDr1gyZuDqVrEGCqAriT2q3R/bJfW7b+Ku5dBFWAhL+00EE0D2dXdS6U
         9wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724691518; x=1725296318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhXfyj2KvujK2JosxSUi62CACNBRQWFA93L81bGY5QM=;
        b=CB/8Et44i+03PmpQnwnPjOoJ28c6S4JBuOssW0JvzFJv2qp1FeDPS0UyWLYd6NkCox
         YxBU9Qpg5mcP0oYw8tsBb+lcqvbWKQ9vgSo6u82Pk86SbT/uXRtx2SYuGStVzJXqAgh5
         cQHKQPP57ZGNui0L3NMDi+4r/BvVzQw+HWKbO1FJ8NAskSDotoS+0H/HMTb764Lx2rgw
         kl5x+CmUJuSQaFgvzaoeAIkIIa0YCEe0FhPGLT4uStotyqvVYndEFDa7GDGYMsXzmZXb
         n4iZ//AMR+T5n5T+44cao4Pa44Hu5q+6d9MI1XY4nzSaUA+cWvS4bcaPVNpX87d2G5hu
         TEjg==
X-Forwarded-Encrypted: i=1; AJvYcCXZksHt6RVhWKSIl6Frb7xD1ZpRCbvhF4rPaot1/z1FR3ux9OODnHQSN1NOo873SzYqkCWlPxVgpNVg5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWrxSOukuH7XmNhikdUtB7qIGsfkYn4geFCcwIThf562XqSWvn
	ITLMwwROQWKobBQwzivIxUbysyY4AXUDH2mkiD0hE38sThPpByOMKSFw4E4Nk4cxXogixzscpwk
	iCR2sk3LGrxE/jIXE53Y5StawaS4BV2BjxhbOrw==
X-Google-Smtp-Source: AGHT+IH4bICu5Y2Tz+c4eaKlhmDoXJzs6Lw7o9SzL4rNxEFKuKRRO791TsZARgRDm/pcGEbgtFsnpTsWbDhZmJahDBg=
X-Received: by 2002:a05:6e02:1a68:b0:39b:25dc:7bd6 with SMTP id
 e9e14a558f8ab-39e3c976b3bmr120851375ab.4.1724691518066; Mon, 26 Aug 2024
 09:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
In-Reply-To: <20240826165210.124696-1-alexghiti@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Aug 2024 22:28:24 +0530
Message-ID: <CAAhSdy2WxN54ee0xWa=CZJvW6insfh_4Q_HBp4o+T-djLOFP1w@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_095840_315110_8F21A5A3 
X-CRM114-Status: GOOD (  17.89  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTA6MjLigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQXMgcmVwb3J0ZWQgaW4gWzFdLCB0aGUgdXNl
IG9mIHNtcF9wcm9jZXNzb3JfaWQoKSBpbgo+IHBtdV9zYmlfZGV2aWNlX3Byb2JlKCkgbXVzdCBi
ZSBwcm90ZWN0ZWQgYnkgZGlzYWJsaW5nIHRoZSBwcmVlbXB0aW9uLCBzbwo+IHNpbXBsZSB1c2Ug
Z2V0X2NwdSgpL3B1dF9jcHUoKSBpbnN0ZWFkLgo+Cj4gUmVwb3J0ZWQtYnk6IE5hbSBDYW8gPG5h
bWNhb0BsaW51dHJvbml4LmRlPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNDA4MjAwNzQ5MjUuUmVNS1VQUDNAbGludXRyb25peC5kZS8gWzFdCj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJk
cywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDcgKysrKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKPiBpbmRleCAzMWExN2E1NmViM2IuLjI1YjFiNjk5YjNlMiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gKysrIGIvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+IEBAIC0xMzczLDExICsxMzczLDE1IEBAIHN0YXRpYyBpbnQgcG11
X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAg
ICAgLyogU0JJIFBNVSBTbmFwc3Bob3QgaXMgb25seSBhdmFpbGFibGUgaW4gU0JJIHYyLjAgKi8K
PiAgICAgICAgIGlmIChzYmlfdjJfYXZhaWxhYmxlKSB7Cj4gKyAgICAgICAgICAgICAgIGludCBj
cHU7Cj4gKwo+ICAgICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX3NuYXBzaG90X2FsbG9jKHBt
dSk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXRfdW5yZWdpc3RlcjsKPgo+IC0gICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX3Nu
YXBzaG90X3NldHVwKHBtdSwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiArICAgICAgICAgICAgICAg
Y3B1ID0gZ2V0X2NwdSgpOwo+ICsKPiArICAgICAgICAgICAgICAgcmV0ID0gcG11X3NiaV9zbmFw
c2hvdF9zZXR1cChwbXUsIGNwdSk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAvKiBTbmFwc2hvdCBpcyBhbiBvcHRpb25hbCBmZWF0dXJlLiBD
b250aW51ZSBpZiBub3QgYXZhaWxhYmxlICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgcG11
X3NiaV9zbmFwc2hvdF9mcmVlKHBtdSk7Cj4gQEAgLTEzOTEsNiArMTM5NSw3IEBAIHN0YXRpYyBp
bnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0
aWNfYnJhbmNoX2VuYWJsZSgmc2JpX3BtdV9zbmFwc2hvdF9hdmFpbGFibGUpOwo+ICAgICAgICAg
ICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIHB1dF9jcHUoKTsKPiAgICAgICAgIH0KPgo+ICAg
ICAgICAgcmVnaXN0ZXJfc3lzY3RsKCJrZXJuZWwiLCBzYmlfcG11X3N5c2N0bF90YWJsZSk7Cj4g
LS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
