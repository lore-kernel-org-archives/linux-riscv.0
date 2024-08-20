Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C6C531DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 05:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgwgGNEkxLjOqlylGrMncZCFx7gbhZuzi6Hp/L1Et8I=; b=4iCV/BniXsJ/9B
	Eop9g2oUY17Wh6jNrm33lwh5t5YTWi9zweiP/2k31oV9Vi16Gi3oIbmbJH4izrXOUODsjD0fmvMoc
	/nt1ouPylaBDZQuaTbTpyc52oU5a6X/PyePxSa8mgniWHBb98yXj0J5dix1Rdyf3bAgYXdtt76BMk
	L6rKTzD+UYoIEgpfRX45vmOrzl0NNKxHvblEW8v0zyjObNUlUHYlHZ8pu42kZEKvmb4spoRmPtTsr
	eXEB7IDaMnlUpFd1Knt+zIVqkjR84A0S8TUIua0tkWdMmN4Wfrz42dSbsBHCyoemITNqk41J3M3ik
	xoJoiEyh1py7ARAYC18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHbX-00000003teo-3JCH;
	Tue, 20 Aug 2024 05:40:27 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHbU-00000003tc7-18bZ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 05:40:26 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-39d3cd4fa49so7285755ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 22:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724132423; x=1724737223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GHJdsQ/Q26V4Dt/c4tmH8VqkuznizJko1phacknKag=;
        b=uzXg2XQY4dj9BAKfbT1wk1SS28P0UQjHikMex/I2jd4E4jFKskFqbve+E2APSDBy4O
         DfVxAzf4DbJYDYCljEamScraa/1KbjoJyI8NlaLKVBTuvBQ0qkgB/O4eHFBcLSakplAw
         sS1Ypi5K9addICFdL0P6zJYJuj7+na2XYLSzTiJ2I642AIS42jeQPsxIEUPRwWDzWqKj
         aU0BGbtINl+0hR9Lk3XdJ+5ZzE6OOWOmw0BeTNzAbkaSAgrWNKJOCwyljCXhAB84jZA1
         6eaTBZWHdJQMToZeJ2TGw4/aqXfotae1ODXccpdHzndvs/y9i6c4aMZYapDFIZON47Sl
         pc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724132423; x=1724737223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GHJdsQ/Q26V4Dt/c4tmH8VqkuznizJko1phacknKag=;
        b=ONn2E5lApWHUe+xQtM1QnQHsHwdVBRo/E3MLSITYGq1FdQA/JfbgoRnzWR+mP7cLcB
         MteRn8b1T11bpfxkLM8HvZAD1SwMtKKqBsT2cPcbjgXyZFGHzL9PlFDwkZHYHaLZjIXF
         hZXlrf3ox15gqDulwj15t8HICqRS/WExik308BRtnCDBjPgiYFWnw2SVGhGkrY3Tm+jU
         ZyKqDdGm5aiomN//D+XoHtwLztRcez9h/qMrmf4dKTkRHaVHB58xsd+wlvAB4iZ+rxOl
         TlmTRSUqKP5/n4rTgmT6iyNX1XFbMms3DKOOL2oRgohysfCQbs714ojNF1lCfj9aOpZk
         RbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL1nh2Rhvelj6wtbJf+ABqr2D81/ukfsvJFl0aR5nZtzAqRD4HM/YGm8M5WyaYN8A4gODQiFUH4dD/dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6WZbbiwEIonMK4EVS48C6cp4qfkx8pdfOB+d2aH+sQtjjSxXc
	BeFB2SruS6tqDA/M2Ady8koTyfZcl3Rm8QRz/sqH2kjhW3K9U01nm7aZBwnWnoKRfAeE1AGAWzw
	vyxZMDtpNCldPgrt9xSMv38PPUP/QnOPrZMo70Q==
X-Google-Smtp-Source: AGHT+IEpOyPwY1ti/ApjMw6FrfiNvrsrXNrEkxYxWphvGLVII6n7y4noKSFLykCAOH2pvk/Gik3Hh6G9f8HZPxG/4Es=
X-Received: by 2002:a05:6e02:1d8c:b0:395:e85e:f2fa with SMTP id
 e9e14a558f8ab-39d56de7f0emr22309735ab.1.1724132423336; Mon, 19 Aug 2024
 22:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 11:10:11 +0530
Message-ID: <CAAhSdy33bSGOr6122MBzuLFP1-dQ45LRbd9zQMDPXf_zQDVNvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fixes for KVM PMU trap/emulation
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_224024_330044_F5892ED0 
X-CRM114-Status: GOOD (  11.39  )
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

T24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMTI6MzjigK9QTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBjb250YWlucyB0d28gc21hbGwgZml4
ZXMgdG8gaW1wcm92ZSB0aGUgS1ZNIFBNVSB0cmFwL2VtdWxhdGlvbgo+IGNvZGUuIFRoZSBpc3N1
ZSBjYW4gYmUgb2JzZXJ2ZWQgaWYgU0JJIFBNVSBpcyBkaXNhYmxlZCBvciBmb3JjZWQgdGhlIGt2
bQo+IHRvIHVzZSBocG1jb3VudGVyMzEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBBdGlzaCBQYXRyYSAoMik6Cj4gICAgICAgUklT
Qy1WOiBLVk06IEFsbG93IGxlZ2FjeSBQTVUgYWNjZXNzIGZyb20gZ3Vlc3QKPiAgICAgICBSSVND
LVY6IEtWTTogRml4IHRvIGFsbG93IGhwbWNvdW50ZXIzMSBmcm9tIHRoZSBndWVzdAoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTEgZml4ZXMuCgpSZWdhcmRzLApBbnVwCgo+Cj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfcG11LmggfCAyMSArKysrKysrKysrKysrKysr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDg0MDAyOTFlMjg5ZWU2YjJiZjk3NzlmZjFjODNhMjkxNTAx
ZjAxN2IKPiBjaGFuZ2UtaWQ6IDIwMjQwNzI5LWt2bV9wbXVfZml4ZXMtMjY3NTRkMmEwNzdkCj4g
LS0KPiBSZWdhcmRzLAo+IEF0aXNoIHBhdHJhCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
