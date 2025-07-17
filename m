Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BBC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FKqpOThKAdurK2QcmId+D1DFxr+pMaYPBGyR0Exbi0=; b=dJmRnpb/RDsc1Y
	metQF3dHVACCC3g6BZRC7BPy28vC7v6HC7FsC9/nlDzKeGAo7Tml1BNTBG3EwxItgoiveP3AYNNHE
	l2OPXNEpGRQmEsJ2WbJo6fdAVY/ueOdgMiHm37aqdAwnLzu3svh9AIu30myn94njUKYYNFRjhtoq/
	pjUsRxPefUPZLtVYsvBuVSyTszOtkghREXO2IzqWDNnM85UgG1MpbaFxOveGWRWiaqnpbkRpL9OdB
	beKSu7gUFAYmA0h+2CrgrPKDbBZmjGrh7iGqOwt35rdUBPkV0A48O6akd/8wJ8cu7jnQmrGLfMhYU
	QZzYwMlAuNqVrRsvN1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORj-0000000AE6c-042g;
	Thu, 17 Jul 2025 13:14:47 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNLq-0000000A40f-3IZD
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 12:04:40 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-879c734f0e2so27813539f.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752753878; x=1753358678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QcVJX052LEXBJv99aAWEE5wFktIbYwNU2eZQCUhFGg=;
        b=mN3YVFZ9a2PINGmQgWpQFF83OOyGaPDs6NAuQS/X6sklMLg17zFifbwENgdOQ7ZLwf
         sJ8lh+gzio3WqM+Bd+/cZ0BIP/Qgy2qDJTLdLD01pph55XV4QsMo99jB5oqYZexb8Dl4
         QFQ3ruzoivR0VCBHyMX50b6oeHkrXfivwWX+HL2LL5NuQIXlNZF20xN9+Vasonc+r9E9
         JWnp68c4xi+mML26eFRaijEU56zPqgtT9Vy0Gk4lw0leN9YwRqUUc5z5qi4/SStDpIno
         UHaOgd02bolfCqf/6HRKz/ghEmdrWbEhAXHcIL+r5sv3g+zpFQJkCgmd0Rfygv8+9cwH
         0GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753878; x=1753358678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QcVJX052LEXBJv99aAWEE5wFktIbYwNU2eZQCUhFGg=;
        b=tHkx6sqFq4uss8H5Nund1sKVL3o6T+yDdxuFk4u7FRGnvenE4BaQfPIxVFoGIjZSnw
         UuGM8nDtq2n0S9PaxO4LmYGd0lgw67xF2lkEXmfNHIMgxfA0gJCY0kNiMmska6QfiMPT
         eR8sqHg3bWbdK/UeMURYGsi2fmSbpUN4sDCXAAtOcUCODJBKSqU2eY80zaeUU1MnI21x
         eQ2W5uy3Q09OqveA5NtrLnXuWtv1q3hRHfUQDPTOlZJTr9Dgs6UqvsD+/PlIjDu+8QgK
         vHpp/pkV2in60/4vGrqwT8Zcebw36E7H19uMJlxNtkJnSsV8P1/SQIvVWXwKkQuHZn4M
         hw7g==
X-Forwarded-Encrypted: i=1; AJvYcCU70a2R3Am2xoQsrg7xHhjvZkxUB5rLx0wRye3Qlco3GJByOFkzru5fRoQUy2ekpY4X06/N2SxcZ7fhKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo1jfBLjwRyJuB9/rr0niRzFOh05wm45QgTweHlzD5ljMl4Ncs
	u4CNaCVyQ0smf52BxCydlKl5x98Pa/xKtrKf5wbM1lSCBrLqIswhwa0MGknvRwPmMtyOK82ax4z
	uYvsx/IBtjACfxloLsUAFoOJTg6Qy3Aqy/mqR6Py9bw==
X-Gm-Gg: ASbGncvegS9gZzTjEHVQVj+/kkpl86CX0BDvBHe/aTJ6dtn1jgo2aKmFtL6HmSmoXye
	cBw90KnRljB+LRqJoan9X+ParrETvtpl8VwGAVPC1uX2syXdtokAfCzUW9Rvlxox2OlndXpt3dV
	B8m38NALZryBhgSxHtkDty9K4uxL0S8gL4koFyWi1AHwBnnUn00NP4FlybHNrA+nRZG4+MxS7mp
	Js5
X-Google-Smtp-Source: AGHT+IHUjN0WtpcP4Ro+lSCJYUTyuKmTlKwKgPzpi8LVsCv5TFEcqprpyTpUikU7+qtzrB5+BO+NiFTYY7tWuiIfMM8=
X-Received: by 2002:a05:6602:7185:b0:875:bbf0:8bf with SMTP id
 ca18e2360f4ac-87c01356e4emr274220339f.5.1752753877857; Thu, 17 Jul 2025
 05:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1750164414.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 17:34:18 +0530
X-Gm-Features: Ac12FXwbyEoUlz3T8TSIi03E9WKp7zPs9qMqtNqR8ejTADSP2ePNd_lJkM8wKLc
Message-ID: <CAAhSdy3gYp7uc6ddpNxHhSQDRFDBMiUW3EOf695U77C2JH=HhA@mail.gmail.com>
Subject: Re: [PATCH 0/5] RISC-V: KVM: Allow zicop/bfloat16 exts for guest
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050438_824202_5DEF2C5C 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNjo0OOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gQWR2
ZXJ0aXNlIHppY29wL2JmbG9hdDE2IGV4dGVuc2lvbnMgdG8gS1ZNIGd1ZXN0IHdoZW4gdW5kZXJs
eWluZwo+IGhvc3Qgc3VwcG9ydHMgaXQsIGFuZCBhZGQgdGhlbSB0byBnZXQtcmVnLWxpc3QgdGVz
dC4KPgo+IFF1YW4gWmhvdSAoNSk6Cj4gICBSSVNDLVY6IEtWTTogUHJvdmlkZSBVQVBJIGZvciBa
aWNib3AgYmxvY2sgc2l6ZQo+ICAgUklTQy1WOiBLVk06IEFsbG93IFppY2JvcCBleHRlbnNpb24g
Zm9yIEd1ZXN0L1ZNCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgYmZsb2F0MTYgZXh0ZW5zaW9uIGZv
ciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmljYm9wIGV4dGVuc2lv
biB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgYmZs
b2F0MTYgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0CgpQbGVhc2Ugc2VuZCB2MiBvZiB0
aGlzIHNlcmllcyBhZGRyZXNzaW5nIERyZXcncyBjb21tZW50cy4KClJlZ2FyZHMsCkFudXAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
