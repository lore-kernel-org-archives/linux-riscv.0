Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5C5E9B37D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJzP8C/Y9B03MqYApS0VGYe0GyTuKKF2yRWidXHMoDg=; b=JGruYzOvv78kkE
	c7xifVrs7156J6BqhoBKvafC+POD4Tvg5p5OYdt3VMey6cVIQX74DPh5BDyEU39kbOCMm61QnLX2S
	79GyuzATbPBJnu7xRZ//V0zAwwXsXxEBeXrEyWRbixwFqahXbkoJdVENvS1iykvpK7C5D+/ODsibK
	priXTgyrPHuKWLjIGMo0BG/Lefs28OK93zZOmNdhYq404a1JH8CLBz2aRp2MLqrrk7L9QWd4GMXvu
	PxQZ/ESlsCi3Lbvu8hMmov5M0vcx4FGdemh/kzzqKQNg9dOgKNlzr0HgVnOI/l2tc+Z9Qyvm69dRA
	TlmHQTfEEgqXgQgDxuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx36B-0000000D4rv-2uSk;
	Mon, 02 Mar 2026 13:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx369-0000000D4rN-3hxM
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=; b=bufVgFG4pqtdHObPhsZZqTcq5g
	xZclexauRVaDL17EqH3E4hVzWwVpkhm3rr73ZbFlZUec3trmamKdrLS9GaB9x2/8ViDuwPeXA0NZy
	pYM42BJ6qWZ00NZdjWA7Dbj6EvznFyRq/kz7rYgX9pBNL2on1EBJhlFPIsdRCuKH0gxnlJWdY7JjQ
	LTA2+QPhAMXzcao0cIjBD4nlC+DP7NSAYIRFB8UL7s81utj3WAufXRYHh6cYzYcnVHdI4NFMb0WSA
	TIF31nvu0Li5JysZnswJlbJKGJFKedqZKbkz+NGDPrPNlFY7/VDNb3Dpo0wiASzHn3d0Xi8VPtE8U
	cFzknuUQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx366-000000008N0-2UNr
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:14:08 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d4c3896e32so2445586a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 05:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772457245; cv=none;
        d=google.com; s=arc-20240605;
        b=AVr4dFHI5nIu/rPJFQkZumXlHYHsDG/bvVfWP9MYSMfJZX0OuHFMUQaZ5V7GndMmCB
         h/B3jK45BZ13rchzqYo4D4iT061hH0lW1Sh0ly3cmzZv01NUgFQNH1RvAQk8wRQXr39a
         NiI15Yb/EqJkfCil2nDVt06rfIDg6weJ0qfW1toPRxCcqd1WHpgBuoEDL863sqPc3rw1
         Z8bs9p9IDYwIa6gVMopOiM7gD8wLsfDAboudAx/AabionwjdSUdvGoJz7jD9/UIpXRdC
         5cphwWc/KqTa6yIhEXIynaksJr9iygjMQnN8ptxaIavpmauLWk8YyV+y0YoZdwEWKdxm
         uPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        fh=ed92qcFAvlinDQDoEDiqtcS46GnLLXXZ2OMVpZMCYGM=;
        b=AbJraSYg1m6UNYJJ/5zT7w1YO/9FyzO4rp5e0DEuGg71bXjQfrtmJybxjljaLQ2v4g
         OdRTe0IC5vno4FtOT1vXz+n/11DaViDYfKI+Q2aFtOPhRs0IRq9Oq2UQVg0pDBWHmo6M
         mwT0KxTksQs2pKVC1y8QhUT/gMJLZngFrBHkrJQfRvdcQMwXqPuqVIwPOtAPieVP6wLC
         ll2S/yMxssROH5j+7/JZxaMxtrmMqvsAdSTz5c2uu4FvCwyQArSttBoflgwY8PR4EWx2
         LVZW1zqQ+orud8FrscgtNKiwMXr443d8aAcSgYGrYLd5PyapBV6ZSGuFmo9az7g1ROVu
         usmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772457245; x=1773062045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        b=JVpT1K2bCOc59TPx66fZWBE90wTEVwBfBb2YCrBtPi8GDFjj5DZRywdzRCHH498+7b
         082sQsLi2PtjDQrdDVHfFov/PAwz0o01/zr5FKFGAgoHeLc8Cd5+r5qVFP7242++G63o
         LM4EGQlhcyRxJvWzGRVa5xQtIquaFKgqmjGwTiGg2xIuuP/I3NUfFyXfFSFt3tK/TPD4
         bZo1PDlkHCdchqdqn0V8SoQ5R0d7vsuDppPy2BfrJSwtkO5O6T4BgckmclgLfB/M3fB1
         3sxQ34JOPAue7keJa/VDMCTojhjAEXZOLX/eJHhlxR+KohB1E/Vw2mOsZxphhhvDvkyY
         e/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457245; x=1773062045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        b=cG8sOC1ur1ujcQHRE2WQQ9V/6rt2ixBTpVih4abZooU557qA6v5HyaTaMXv+gqQ0EP
         tBvbp9CFUkfkEsY9kApoEePFYwlum1qlKfLSPh5tEsFE2SKg3oifBYswyIc1uBTZlxUU
         8jza4HRKoqyAhFtV3izBkW7kV5p2uBNt4zUyrjDOz5EeFYv/THzvD0jy6/ImUMq2G5N0
         V3WYYxByyDyAmQtehl/J95ejM+w6yBf/by4/SIsVp2I8RxyljhHXm2pGr8HgPatdtbYJ
         UtjL15cFIR3mouvMC9LCl7GzVxzirKQoHz44Uy7ca603v6P7eqAkbMfjqu91BP4JXv1p
         5Crw==
X-Forwarded-Encrypted: i=1; AJvYcCXW4b2JBwLc0N6aSSGxnOecwMcKzeUxTCqzl4n+DMo8MJPjlVypB17cIHcd1PG+J8Izy7aZMYOZusk2Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+s8eloVccv/N6jjzwWKyOawv3Af6eyi56WXsG6ya4wnnL2Fnh
	QAtqeKwnP/vfHCwCHTgVktQ6vWpi3b4NcWYlF//Jn2h3P5/YXeboLk2NAzjAdx37D3NAGkTqmVh
	FP21+9G2MFKji3gaMUsyccut1GZnorrAevyVQq+QQ1w==
X-Gm-Gg: ATEYQzyzYEz2jLAEusXA2NbeUyNU3tlrQ6f1VJlX/8sS7wZw5O0LdBfXerl0lH8lEFY
	xV9SWU/0le+A0jtdwANJoizp2GpZ98WdkbF0ug4FJaMR98DxWAamw2ONAGaFB66FWMG7UdgKBzW
	BNv21WWeR2PD/10dzH6JuK/+hWfZt4OgiglSy9oSpU8gVK5Kc5J0CASLLM2FsacfWjjxsWbgGMe
	FglbbprdKnXEKMW9srYNSBs4mZpT7Qx9tPyCNspizBVPOrCvbz8p1d+Aa9eCGtaqABrj6vyrDi7
	cPnobxPOeOaFKthWI+jiSTkljrTQghPt8MG/63WSk0OhlQicjdsOppMCxJD2o8BBQ/dWuqpkaI/
	CLgRfZHi7jPcloslT5MpFuLWarA==
X-Received: by 2002:a05:6820:290b:b0:679:9802:7cd7 with SMTP id
 006d021491bc7-679faf194bfmr5794292eaf.40.1772457244644; Mon, 02 Mar 2026
 05:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20260228152226.2116895-1-ethantidmore06@gmail.com>
In-Reply-To: <20260228152226.2116895-1-ethantidmore06@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 18:43:53 +0530
X-Gm-Features: AaiRm53b0DPXsxrpiSTrmcHPiPDsc5YZtwK0BzdP4iIWyQHt1ODVlWYlaZYCUFQ
Message-ID: <CAAhSdy0k416xVG9uiTYKgeqhMKZvKQbSSuqNaPgkgCQVTdvHBw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_131406_737246_D567B21A 
X-CRM114-Status: GOOD (  17.27  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgODo1MuKAr1BNIEV0aGFuIFRpZG1vcmUgPGV0aGFudGlk
bW9yZTA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYXJyYXkga3ZwbXUtPnBtYyBpcyBkZWZp
bmVkIGFzOgo+Cj4gc3RydWN0IGt2bV9wbWMgcG1jW1JJU0NWX0tWTV9NQVhfQ09VTlRFUlNdOwo+
Cj4gU28sIGFjY2Vzc2luZyBpdCB3aXRoIGluZGV4IFJJU0NWX0tWTV9NQVhfQ09VTlRFUlMgd291
bGQgYmUKPiBvdXQtb2YtYm91bmRzIGJ5IDEuCj4KPiBDaGFuZ2UgaW5kZXggY2hlY2sgZnJvbSA+
IHRvID49Lgo+Cj4gRGV0ZWN0ZWQgYnkgU21hdGNoOgo+IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmM6NTI4IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfaW5mbygpIGVycm9yOgo+IGJ1ZmZlciBvdmVy
ZmxvdyAna3ZwbXUtPnBtYycgNjQgPD0gNjQKPgo+IEZpeGVzOiA4ZjAxNTNlY2QzYmYxICgiUklT
Qy1WOiBLVk06IEFkZCBza2VsZXRvbiBzdXBwb3J0IGZvciBwZXJmIikKPiBTaWduZWQtb2ZmLWJ5
OiBFdGhhbiBUaWRtb3JlIDxldGhhbnRpZG1vcmUwNkBnbWFpbC5jb20+CgpSYWRpbSBoYWQgYWxy
ZWFkeSBzZW50IGEgc2ltaWxhciB3aGljaCB3YXMgbWVyZ2VkLgpSZWZlciwgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI2MDIyNzEzNDYxNy4yMzM3OC0xLXJhZGltLmtyY21hckBvc3MucXVh
bGNvbW0uY29tCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IDNhNGQ1NGFhOTZkOC4uNTFhMTJmOTBmYjMwIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gQEAgLTUyMCw3ICs1MjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X2N0cl9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICB7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUgPSB2Y3B1X3RvX3BtdSh2Y3B1KTsKPgo+
IC0gICAgICAgaWYgKGNpZHggPiBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0gMSkg
ewo+ICsgICAgICAgaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyB8fCBjaWR4ID09
IDEpIHsKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5WQUxJ
RF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gLS0KPiAy
LjUzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
