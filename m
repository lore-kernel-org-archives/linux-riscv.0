Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32F2C11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB8B61443
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABB8B61443
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6c/xaW2Aa1vsMCWRTVGiL0XowPaJ9sbYRb9BNnz9YfA=; b=20HR9sFshBMqCffhMeAFqN5j4O
	0bc06aT3K2HATNCEOM6Gm7cEt2WBVWX0n0sPTb0n254vWW+3BzpkBmmfnALsMI8CFaJqfGqfDu7uy
	1EIyO/ur/wrra2DuEUaUD406flEuiKggOH1rpj9j8OIZFVHplgRIjx6hKgWZT5Tbdh3NMDbt22rpQ
	F+xQ2w+McaHzw8ia6qL7lOTwRAzMVkX3d99hK30bW+eG1ZsiTfB9XDsfA5nXYlOgswwFQJYedjQiZ
	PWKZaoO0cibsg1QlXaKpVu70T5tYdQVxHYUxzExk84gZoexi3GaI0Jbh6jvglkZM83i1c4LlLtYP8
	QJqw1qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lympA-00FwEY-9p; Thu, 01 Jul 2021 02:53:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymow-00FwD6-IV
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:52:56 +0000
Received: by mail-pj1-x102d.google.com with SMTP id n11so3387517pjo.1
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 19:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hvxDF3nom/N8rPm+Ppo7zGPA/qzGtO9RuOCfsxZTu98=;
 b=SpjFL08PBqV7tkh6qKJFbHlv80PlDkGq07wcYsvXaYnweI2EpYhmpM/u8RV0DX7eud
 lszQ4GyMHGCeoLbl8uNh/YKcZWbdc+fRt/XgL1QGeyrevEt5RgdJ6m0PW/BND3i+5Mvt
 Tf1Ptudl3du2nRf77SJ/JTGH4r2jVQ6ewpyf6qFhyG5k2cA8/+YIheA6dKXE0TLYOJ4N
 TiemKl2puGeIDcT/OFNCWGTGKsgDz4DYMn/wxKrrGcVMn9+0e2BzC1Ov8ExreTRiJpb8
 //MHSLFw+Mp/ugzIgYixQV3a4jfQgyIOYoHYuZkvH1D9IaVUWIAkkKC4GniP/WYVuQpc
 HoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hvxDF3nom/N8rPm+Ppo7zGPA/qzGtO9RuOCfsxZTu98=;
 b=c6LK+zr2AHNAMMpN2vJc/J2fcuQyWdtB+2TELX5u//qmIEcObXGL6wj9vS4lm1o7Ys
 Bf7p0c6V8Ynbf9lFIwzBLb5HEJ5fdyckfQhxY0xwGbp1OU8UeCvrQWt7XawTm8OPoYhA
 +n9R4A63nd9ZOFc0rKWSwhvYyMG8FnpS6ixEAk17Z2rI6Z1EDNzcMYE5DH3IMwEFtBp0
 V4mSANZW7cG8FoY4id8AZEiIFmLLOTOSyfHThaiIWTGTmb7fNEsFMBEk9xK3EQFZXR6n
 vaQCjWQAVJLBsX5cZKZC7P6+00QMFkFqQrYSbyUpzMZ9pp7EBgrvKWCfogmoybUjRupS
 ttdw==
X-Gm-Message-State: AOAM533K/mAiyJEdcmMhQyIQuKwFdGZde4bMR7xSCmEqlaFcJ/kdvEYd
 bwHa/pwn+mvWjeNMR33TYh/tSw==
X-Google-Smtp-Source: ABdhPJwTB1Hi0X5cFeHOElli+j39Ed7Ljy/aE1Qg7eTojjCof97X9FW3uTdfNXuJxXddlvtQXZecVA==
X-Received: by 2002:a17:903:2341:b029:129:1282:fd37 with SMTP id
 c1-20020a1709032341b02901291282fd37mr6223940plh.6.1625107972559; 
 Wed, 30 Jun 2021 19:52:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 206sm23381385pfv.108.2021.06.30.19.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 19:52:51 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:52:51 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 19:52:49 PDT (-0700)
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
In-Reply-To: <CAL_JsqKJgz=ixNAJProoVFmQXGEOsTYX=bXTdtf7RLQErL1VRg@mail.gmail.com>
CC: mick@ics.forth.gr, geert@linux-m68k.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 frowand.list@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh+dt@kernel.org
Message-ID: <mhng-6db38728-4f82-45bd-9b17-c41da55c41e9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_195254_716572_18AF40B4 
X-CRM114-Status: GOOD (  19.22  )
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

T24gV2VkLCAxNiBKdW4gMjAyMSAwNzo0Nzo0NiBQRFQgKC0wNzAwKSwgcm9iaCtkdEBrZXJuZWwu
b3JnIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE2LCAyMDIxIGF0IDQ6NDMgQU0gTmljayBLb3NzaWZp
ZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4+Cj4+IM6jz4TOuc+CIDIwMjEtMDYtMTYg
MTA6NTYsIEdlZXJ0IFV5dHRlcmhvZXZlbiDOrc6zz4HOsc+IzrU6Cj4+ID4KPj4gPiBJIGNhbid0
IGNvbW1lbnQgb24gdGhlIGR1cGxpY2F0aW9uIG9uIGFybTY0LCBidXQgdG8gbWUsIC9jaG9zZW4K
Pj4gPiBzb3VuZHMgbGlrZSB0aGUgbmF0dXJhbCBwbGFjZSBmb3IgYm90aCAibGludXgsZWxmY29y
ZWhkciIgYW5kCj4+ID4gImxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UiLiAgRmlyc3QgcnVsZSBv
ZiBEVCBpcyAiRFQgZGVzY3JpYmVzCj4+ID4gaGFyZHdhcmUsIG5vdCBzb2Z0d2FyZSBwb2xpY3ki
LCB3aXRoIC9jaG9zZW4gZGVzY3JpYmluZyBzb21lIHNvZnR3YXJlCj4+ID4gY29uZmlndXJhdGlv
bi4KPj4gPgo+Pgo+PiBXZSBhbHJlYWR5IGhhdmUgImxpbnV4LHVzYWJsZS1tZW1vcnkiIG9uIC9t
ZW1vcnkgbm9kZToKPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTMtcmM2
L3NvdXJjZS9kcml2ZXJzL29mL2ZkdC5jI0wxMDExCj4+IGFuZCBpdCBtYWtlcyBwZXJmZWN0IHNl
bnNlIHRvIGJlIHRoZXJlIHNpbmNlIGl0IG92ZXJyaWRlcyAvbWVtb3J5J3MgcmVnCj4+IHByb3Bl
cnR5Lgo+Pgo+PiBXaHkgZGVmaW5lIGFub3RoZXIgYmluZGluZyBmb3IgdGhlIHNhbWUgdGhpbmcg
b24gL2Nob3NlbiA/Cj4KPiBHbyBsb29rIGF0IHRoZSB0aHJlYWQgYWRkaW5nICJsaW51eCx1c2Fi
bGUtbWVtb3J5LXJhbmdlIi4gVGhlcmUgd2VyZQo+IG9ubHkgMzUgdmVyc2lvbnMgb2YgaXRbMV0u
IEkgd2Fzbid0IGhhcHB5IHdpdGggYSAybmQgd2F5IGVpdGhlciwgYnV0Cj4gYXMgSSd2ZSBtZW50
aW9uZWQgYmVmb3JlIHdlIGRvbid0IGFsd2F5cyBoYXZlIC9tZW1vcnkgbm9kZS4KCkkgZG9uJ3Qg
cmVhbGx5IHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIG9uIGhlcmUsIGJ1dCBJSVVDIHdoYXQgSSBt
ZXJnZWQgCmluIDUuMTMgZG9lc24ndCBtYXRjaCB0aGUgYmVoYXZpb3IgdGhhdCBvdGhlciBhcmNo
aXRlY3R1cmVzIGhhdmUuICBJbiAKdGhhdCBjYXNlIEknbSBoYXBweSBtb3ZpbmcgUklTQy1WIG92
ZXIgdG8gdGhlIG1vcmUgc3RhbmRhcmQgd2F5IG9mIGRvaW5nIAp0aGluZ3MgYW5kIGp1c3QgY2Fs
bGluZyB3aGF0IHdlIGhhdmUgaW4gNS4xMyBhIHNjcmV3dXAuCgpTb3JyeSBmb3IgdGhlIGNvbmZ1
c2lvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
