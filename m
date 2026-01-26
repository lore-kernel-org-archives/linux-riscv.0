Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A658D74EFD
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpQJT7/107kFrxIap29WLcQyw0xU6fRsrYhRmLMPY8s=; b=IIEWwe+CaaPWvw
	Y1pzh1tD6Rh2oNLdOX/b9o3jqgflSjbXW4Krbzyt/0x7MXQyledoFvuTNzgOVqyuW+zty6PIcJdqr
	gR17crYH4J0SjB7Si1KkG/eQta9JjUiNWf5TkH3Ch7nHUVpDJUruG5Pj67LIKonUpycuIeI+LV3k0
	wBQBzurhe0VAqlYNhIzyPCDNsek68HCQdIrZne4i8ZVnLyjcnbs539DRwGuuyd5mhWeKenlCcGVf9
	it3bpIek0ALrrF0gEzytP4wiLNbJYFBf3Mv6nPYWxhyQa8oo1vF8XTE4DNzMFopaDwPv1BM5h3xDc
	8f+iYFZlIJHftEfuW5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJ2A-0000000CDaH-1Zx0;
	Mon, 26 Jan 2026 09:37:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJ28-0000000CDZr-1g4L
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 09:37:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so4222212f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 01:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769420238; cv=none;
        d=google.com; s=arc-20240605;
        b=gVmidLe1z4khQ5PeQ4vRdvquIRP/aStpjpQDtTJpmDwcqOer1Zuv9xMEdoLddIuRcr
         2/rjz7PvILt979ZW3hBxXO6VxtJRPZMAFGZEiTthbsQ8JpDDkXh1GErMwFbeE7/W0RZc
         vAMP6EJzM+uDpmhAsl49PCXgeze4j0SDlGXPdkMlPLSdmQwUa6MBuRw+rSalQljdMqnQ
         BYWfDn/J0UaKf76HNq1bS0dGz3LJsgwoeaOrPq3euX8iv6hAP1TzqDOwh75I1bmdwBwy
         N5GhoXpACSRI28k5fMcTNnJfxLZmCLoVnEgfh8aGYwB97Qf9nj2GBFlJByhGzZ0C5TvG
         D00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6PIlGh0RYQgVwuQeZ08CWIYO6OF7Z9UDosx2vdgc2s=;
        fh=ATvimsRwQStzhcDqaV6YxYxg5ME3d9yDPLLwdv0OYsA=;
        b=lB23qjzXJXsZzwv/y56J3Q1ABU1OTNNxN8084Uv8yNhmQWIzbHvkLzdNXQ5ZcV4cRs
         ErvjBY+k3+IK3W7T8Re8QCPI53TiSgWhUjxcLwzu95eTFsO33wjuYs4qh+Sig1RUKlT/
         Liiyzcu5pqXJ0bxS0CmyJ5EYeTfh8EhDHmyzoDIAtgdxUE2SV9vocaUDAiAlIt1ma/Ft
         np/w0FPa+gVw2N29I8twVXPMAyeSLTyqrWS48JU6NHe42R4BFAjBv3JMoY8TyShzfh0U
         hxPln/ZBjtGpurjjQNneNEXpfpvtG/kGGamsyp4tggTHR6CNWLzZh8woJjr0VPaz6xgl
         W1gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420238; x=1770025038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6PIlGh0RYQgVwuQeZ08CWIYO6OF7Z9UDosx2vdgc2s=;
        b=HxLQQYhHOcMj/4x7hPJEDcaBriS8tyDyxi+txnDfU2/pAzhZiGGpBfIMcXj7x1dmts
         RO36SAQADeKcXW0hfS8aoVoeW13FVnRaaIcd3+KZ+WWk8RUZm0nXteitNE/HnFnepw61
         hABIekNnJXkXJCAWdibyBopIgjEp/1IZNUuyue4Y58k8WHbpGGzSBYAydnqMVCa34PHX
         FIpG6dYxnAhVojXDttCRXpCjIJzo9KuK7fPKZxMDhTcsZxnPYaZPylgs3aPI23IL6tXC
         pC4a9v5/ZbUoMK5fHohLiaRZZJIV3JDTYnD6kn/OdMs0X5FV1XjXv+iXw8ICy405A3Kh
         YIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420238; x=1770025038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6PIlGh0RYQgVwuQeZ08CWIYO6OF7Z9UDosx2vdgc2s=;
        b=Zo+7GZbpM6HhLlMnPNEqN1kgeXVDIGOA5m6VnhRbPxQsZ7a9EgMsX6/hwnSa3ue+41
         sMELwRxr6IWIMW6QaAxwbDGUEP7E7FSn16YBihwPwEE+wdjTgSlIiYPga1ENMVEQjnyr
         B3pzXjNh33GFQAeaHt1d5fU/lbToRptSIJGjhB0puFiJJJqlpe7zYDtvhOK8YGP6Wx9O
         acbmjvoRegLik6MpaBZ9TOb4n4gBeLB48X5T7rAoJqJ8n+hdU/RpkUJ1ETKeEuAoxpOB
         ynQ556SN0bPm/fHSY7soJedjTmQyXuTw4S72cAS05NlqKsOsCHAs0ie3RjWjChyrRbFM
         g2JA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JkXLb90WoFat/dst43vJzsQyM7RGuPocaDCD+PPf6Vvb8uuCCTuWYRkd6dAU4pd5N/f9GgsZyR+1gA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9qizOCW1M1Twx86XIcFB1BOEYzzyCNSnm8k6s+X0IbIiflhMf
	hqST5jJtO+BsIrdC7Tkm1LDoxRBhXuGq1eZyugm+GJcwvDX+hWy+92sDZgnTQKRXjN55d5muXbr
	XTa7avxBZfjrdh8mjCZT07ibWLgd37Y0DoQZX
X-Gm-Gg: AZuq6aJO7w9bJ1NhaznqQlzr6htlJoJUL+wYv6/H5+BL0wtfN6RaRPw99YzCfHjgleo
	hHo32QEAHlEaj9OWju2cjP+Kl5geHnKzZq6cydI+1ReGV6S7uESFcydHti4SF4fSr37iLi/P1E9
	r9ocqyEpNqsRObyVGUCQWLToLFHbOeO+ovdnplaBqfR0eJIiigO1UArwW5OrTbFlN//lOomWkHZ
	IMBxV6x3X0m/EU3V595g7ZiCedXkNL8TibejbB/Cw93JAm0RfxIRihtRdAJ429trHiqZc4=
X-Received: by 2002:a05:6000:26c1:b0:431:327:5dd4 with SMTP id
 ffacd0b85a97d-435ca39b983mr6117460f8f.46.1769420237949; Mon, 26 Jan 2026
 01:37:17 -0800 (PST)
MIME-Version: 1.0
References: <aW3Z4zTBvGJpk7a7@adminpc-PowerEdge-R7525> <a4e97928-a953-ae2b-3c49-339d5cad2aad@kernel.org>
In-Reply-To: <a4e97928-a953-ae2b-3c49-339d5cad2aad@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Mon, 26 Jan 2026 18:37:05 +0900
X-Gm-Features: AZwV_QjfFrLXXufP5a9mCvnHFe9Sc-o5vPPiupWx7s4Rbc3_96ciApFAN-AOqiQ
Message-ID: <CADLLry6gA+vstcpZ6JOPrL8t76j=wS6+mV3-dg7-dt5=nnqz8Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix minor typo in syscall.h comment
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_013720_453269_C62CBF98 
X-CRM114-Status: GOOD (  10.39  )
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

MjAyNuuFhCAx7JuUIDI07J28ICjthqApIFBNIDQ6NTUsIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiBNb24sIDE5IEphbiAyMDI2LCBBdXN0aW4gS2lt
IHdyb3RlOgo+Cj4gPiBGcm9tOiBBdXN0aW4gS2ltIDxhdXN0aW4ua2ltQGxnZS5jb20+Cj4gPgo+
ID4gU29tZSBkZXZlbG9wZXJzIG1heSBiZSBjb25mdXNlZCBiZWNhdXNlIFJJU0MtViBkb2VzIG5v
dCBoYXZlCj4gPiBhIHJlZ2lzdGVyIG5hbWVkIHIwLiBBbHNvLCBvcmlnX3IwIGlzIG5vdCBhdmFp
bGFibGUgaW4gcHRfcmVncyBzdHJ1Y3R1cmUsCj4gPiB3aGljaCBpcyBzcGVjaWZpYyB0byByaXNj
di4gU28gd2UgaGFkIGJldHRlciBmaXggdGhpcyBtaW5vciB0eXBvLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3Rpbi5raW1AbGdlLmNvbT4KPgo+IFRoYW5rcywgcXVldWVk
IGZvciB2Ni4yMC4KCkdyZWF0ISBUaGFuayB5b3UgYWdhaW4uCgpCUiwKQXVzdGluIEtpbQo+Cj4K
PiAtIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
