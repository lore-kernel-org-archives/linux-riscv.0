Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B413AC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFB3216C4
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAE28GZ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsLmSuWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFB3216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x8Uc3hqQroXNCFs8gdfcn+Uio9S0tm3be+1fdOMIGL0=; b=KAE28GZ8pz6eJD00lZWN0FBcVx
	lcw+3L9MZy8YPEKxvqX8Q5o87s7tG2ETk5nObKQ4n7GGeWNZfDTxGtkhqez/zZGOgZmQYGWY3Zldj
	JHIfvttTq1JKYGrlrsJXjfRMg7BWxjPexk3FwPzzHL70dHT95bNrZE5JmoXfl2My/jDkiVVcWZTc8
	gpEVw/QJvkxuPrU2pBabLz2mwMBFFgcocwmFHxLlGplew9S0JPCv8aC1fIfPWkho1O/wUJWMPmrAe
	SvniN94lfEVHsAOXrpZqOQLDMaigWbw0EOhv/VdDG+hLXNv27QnMZ7uw/XQPb6vvzPatDhbIGlApt
	YVs49/Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdC1E-0004iW-UZ; Thu, 12 Nov 2020 12:48:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdC1C-0004hu-W2
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 12:48:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id j205so8223203lfj.6
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DYGJkaa7yHIR96e3EyKOpzlMcDkqXw4+dR6K8UXIm3k=;
 b=SsLmSuWlcbOzoGU57TAZ/s4M44qskvGknpmrO+kfYoIJMLCxM7S6tPgAs+XZ9OsYro
 MMUu0vxI/j8cu7nJftTZGst7jpGzTrVsv0Upb9FtIBMJZwXMSYZj4Dvy3yko5qGhpFOL
 yEsGkl5wEhdYbZWvDJtq1C2LdGwh+o0ifdyh/qpO81vfllkDTW9QlyVPkhnTM+jThdRv
 Y3QKs9zLkqjh9y24Fg5OWcQuP1uOaYeKRVfFPOBE9iFioZu/qAp+hWFwcQinD4XGZm9U
 4/zOIGE1f3NhshoChXLG8SC+h5Lz50yHeAa0yn3WcNuZe3FjSzMZ4woLhyNTd33tb8gP
 rCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=DYGJkaa7yHIR96e3EyKOpzlMcDkqXw4+dR6K8UXIm3k=;
 b=F6DcFOar1ohEiAXxKLbHinswq0iz/m7VPWy4fzEIfx5+dkqv9HTEjuU8R5ygBb1aUl
 qMIKa42qbvmA4wT0NGr/dL22FLGhdbd+gxO27Cf/ZW8g49tpJZsQSzGnOB9oGHvqmm4V
 m2EfqjxyvLR4ZyLAmFHup9fxY47E2rEfwEmwZBm5crvUvKw25lEr8MPdDloQ2JRsLJt8
 pODmFC6eUAHdj5BdEi51OQ3WwW+kUl1r7KtYoGjbefdJRRmBW7aPUx/aIEJldH7BOlJj
 7uRE4w/mpDFwgMrtJqwD1hr97hJZr6RcXvmOT78DAvm7BEJ0Ei/XSE07ARPtXxqBJ4K7
 ETpw==
X-Gm-Message-State: AOAM532uPbsHYH3mRI3ko+O9R8ngkHE6WXxNkHvzCMD+xKciZxwOltCd
 CxQrIDVmywjTqJlN5DpXP0LVdJaqlU1JGjMUhLgrkXoxOHsFsnar
X-Google-Smtp-Source: ABdhPJx0T55NaSdkTCrjIs7lliAoziHaitfyUWDNwUsi504HFY03ON/hfCy2z8x9rZEGo95jl4p4x5JS2NpQBF4pDP0=
X-Received: by 2002:a05:6512:104e:: with SMTP id
 c14mr12465498lfb.345.1605185278962; 
 Thu, 12 Nov 2020 04:47:58 -0800 (PST)
MIME-Version: 1.0
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Thu, 12 Nov 2020 13:48:08 +0100
Message-ID: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
Subject: Status for RISC-V Summit
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_074803_092274_B423F255 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGVsbG8sIEkgYW0gdXBkYXRpbmcgbXkgRW1iZWRkZWQgTGludXggQ29uZmVyZW5jZSB0YWxrIGFi
b3V0IExpbnV4IG9uClJJU0MtViBmb3IgdGhlIFJJU0MtViBTdW1taXQgaW4gRGVjZW1iZXIgWzFd
LiAgSSB3YW50IHRvIGhhdmUgYSBzbGlkZQpvciB0d28gdGhhdCBjYXB0dXJlcyB0aGUgcmVjZW50
IGFjY29tcGxpc2htZW50cyBmb3IgUklTQy1WIExpbnV4CnN1cHBvcnQgYW5kIHdoYXQgaXMgb24g
dGhlIGhvcml6b24uCgpJIGN1cnJlbnQgaGF2ZSBsaXN0ZWQgYXMgcmVjZW50IGFuZCBvbmdvaW5n
IHdvcms6CgotIEtWTSAoQW51cCBQYXRlbC9BdGlzaCBQYXRyYSkKICBbd2FpdGluZyBvbiByYXRp
ZmljYXRpb24gb2YgSHlwZXJ2aXNvciBzcGVjXQotIGVCUEYgSklUIChCasO2cm4gVMO2cGVsKQot
ICBLR0RCIHN1cHBvcnQgKFZpbmNlbnQgQ2hlbikKLSAga2V4ZWMva2R1bXAgc3VwcG9ydCAoTmlj
ayBLb3NzaWZpZGlzKQotIGtwcm9iZXMva3JldHByb2JlcyAoR3VvIFJlbikKLSBnZW5lcmljIHZE
U08gc3VwcG9ydAotIHN5c3pjYWxsZXIgc3VwcG9ydAotIGJ1aWxkIHdpdGggTExWTS9jbGFuZwoK
SSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSBhbnkgZmVlZGJhY2sgb24gd2hhdCBJIHNob3VsZCBh
ZGQsIG1vZGlmeSBvciByZW1vdmUuCgpUaGFuayB5b3UsCkRyZXcKClsxXSBodHRwczovL2RvY3Mu
Z29vZ2xlLmNvbS9wcmVzZW50YXRpb24vZC8xbUQteVBkLXpCLUROWFZUVE5XR2QyMkVadVNpOV80
aGNKR0hZenJEUUxqVS9lZGl0P3VzcD1zaGFyaW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
