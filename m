Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B7CC5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThgikmWbKGHSdYsAOkdIsAa8l08t4ETNWsKOacIy+/E=; b=HQZ3TXgVzZf/uE
	1nw7AyKPOFtH1C4ybuCeOUjMS+pjv0QJ6wCWqAJnLpkSjdYVmzj5rjrZpeAezDDhZ7DbL7pzFTVJp
	flJtTWd1b34q1FCRDwrS3szIjyifVwYwzYh74/VXIWn9hv/GF+sXXGG2po+U7XZ6dfFGrTfaQQe4L
	lqFh5Jjj/lmrBdJhQp14YHZCd4U2hcg6SfVPYu9OgnT/uodlJPEadTUBq2RMevxhVYxVvA/cF2XNP
	/2XPuTujiDFrmVsqYYxvcQi5CyhVuJ1t8TA8DuBVglFONtvX4Hw2wv+cvbBPUjCPziXnVqTw1liAm
	S9Qxna8TNT/8jcqkizQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sipMa-00000009xSi-0hBn;
	Tue, 27 Aug 2024 06:07:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sipLj-00000009xHc-2T2a
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 06:06:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-533488ffaf7so6794592e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724738798; x=1725343598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTrR0BM4ODiDkdhs0fxD9YCdOTbXeH2dM84cX6npY98=;
        b=dDF/lzZXf+01vXAPrbgWUw/9pbdwWeMimE6CxaACceNTF6oM+KFpo8ilw3e1aezdve
         0ClWM+OM9WLelvlHxd+7z2mFqwtokgx6skeS+PpPrksLcxidvtFd5E34G7uPFfojTsz1
         2NNjv5So3lf410OuoAn3niszb6no3qqDw0u98Y8sTTir6y/Qg1n4d0e9jpiMEfzdap8I
         zV/UMULvXfGWCv0lvBXLSer96/c5kWxHsXZ2XEIfT54aC0yDyCLO4b2sZ5FXFzH1JPdd
         Qw257VU4gWN0EQ9Mw+T0K2zRqnM5Djun0h2qaeLZ0E4RWUR3gTGJR2sMymYKhzjDtHZ4
         /LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724738798; x=1725343598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTrR0BM4ODiDkdhs0fxD9YCdOTbXeH2dM84cX6npY98=;
        b=Mjbn0REirDae12OQB1aIrm7emss5VhHyZBIRA+Je4PmkBeu1OWypLFxpMjR5RuerCL
         YoAykBMHRgfR3/tTVfO2pZ8gkl+XdvXqhlLtFdp1+klsfy8WtSzCU2Z/6zVQscNOQAn2
         aJpU8Ik0nk+MC9QjjbHVmPHhXA7w79HcXHkCl1S9ZVHOl2Y8/cxnbo574RLW3Dz6pJ8G
         wX5TymYIORnedJiGEnk1sZisJzYDvUzcTe4E78E6Ps7mXIycX8u2eHwqV7Msag4b5JAR
         7hUaME30T6jmrWBXyHuOhrQl6W+s2efRxqn1emly0Iz+nLuzZA08/48SYXogDkcQgBZT
         3M7w==
X-Forwarded-Encrypted: i=1; AJvYcCVCs91xnWjvecFAg9dDwW0Rutma0hTRvR/Y5RJxo+m8PnMQepm8PM8ALlcsu5RbCyYMFT9/KgHXEfCBZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRLgRso8mXkugdQw7Q0rb81Xqn/FlRwjvutg5iXqsU6A3EpYXq
	7w0JRjs0STBbUQrmzjecRoB7M/Y7SKGvLOh9/FUGMvTAyLfpy3sIaKXvhZkMSOfSqAMaxx0ANPj
	pTumBBcZAWjfPFoxhEz8wiEI6zLXYA+Eukg7mdw==
X-Google-Smtp-Source: AGHT+IH0GAeFQVloNzRRFQdxxP1U6JC1pb+UF15amHRXtNVp9K9yOTWAoBaHBI4ogBkWM1d+wDyqOUtogd6HaEzb87g=
X-Received: by 2002:a05:6512:304f:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-5344e3ba53bmr1027589e87.11.1724738797413; Mon, 26 Aug 2024
 23:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240826165210.124696-1-alexghiti@rivosinc.com> <ZszZHycX31dGeP4O@andrea>
In-Reply-To: <ZszZHycX31dGeP4O@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 27 Aug 2024 08:06:26 +0200
Message-ID: <CAHVXubh+yEROx-P0iS06J4BSc9bBzi8D_FUFAG5mHXAvuE7TpQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_230639_914582_FA7A0556 
X-CRM114-Status: GOOD (  13.43  )
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

SGkgQW5kcmVhLAoKT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgOTozNuKAr1BNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAyNiwgMjAy
NCBhdCAwNjo1MjoxMFBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBBcyByZXBv
cnRlZCBpbiBbMV0sIHRoZSB1c2Ugb2Ygc21wX3Byb2Nlc3Nvcl9pZCgpIGluCj4gPiBwbXVfc2Jp
X2RldmljZV9wcm9iZSgpIG11c3QgYmUgcHJvdGVjdGVkIGJ5IGRpc2FibGluZyB0aGUgcHJlZW1w
dGlvbiwgc28KPiA+IHNpbXBsZSB1c2UgZ2V0X2NwdSgpL3B1dF9jcHUoKSBpbnN0ZWFkLgo+Cj4g
ICBzaW1wbHkKPgo+Cj4gPiBSZXBvcnRlZC1ieTogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXgu
ZGU+Cj4KPiBSZXBvcnRlZC1ieTogQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29t
PgoKSSBhZGRlZCBpdCBhdCBmaXJzdCBidXQgc2luY2UgdGhlcmUgaXMgbm8gbGluayB0byBhIGJ1
ZyByZXBvcnQsCmNoZWNrcGF0Y2ggY29tcGxhaW5zIHNvIEkgcmVtb3ZlZCBpdC4gQnV0IEkgaGF2
ZSBqdXN0IGNoZWNrZWQgdGhlCmRvY3VtZW50YXRpb24gd2hpY2ggc3RhdGVzOgoKIlRoZSB0YWcg
c2hvdWxkIGJlIGZvbGxvd2VkIGJ5IGEgQ2xvc2VzOiB0YWcgcG9pbnRpbmcgdG8gdGhlIHJlcG9y
dCwKdW5sZXNzIHRoZSByZXBvcnQgaXMgbm90IGF2YWlsYWJsZSBvbiB0aGUgd2ViIgoKU28gSSdt
IHNvcnJ5IGFib3V0IHRoYXQsIGl0IHdvbid0IGhhcHBlbiBhZ2Fpbi4KClRoYW5rcywKCkFsZXgK
Cgo+Cj4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NDA4MjAwNzQ5MjUuUmVNS1VQUDNAbGludXRyb25peC5kZS8gWzFdCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPiBUZXN0ZWQtYnk6
IEFuZHJlYSBQYXJyaSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4KPgo+ICAgQW5kcmVhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
