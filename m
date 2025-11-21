Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56011CFA459
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 01:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6wJ6YKFqyQlfJG6ZJ1wf1x+9UkcA/cjt0eVekUWmSs=; b=rcN0bkegMoooy7
	FgiXzjAcRvNfbZHGCjJUgoGC86DmUxjU6hDWz4XLg18IBYdDra7uBPIZGHNQzwmoClo5eJYCtB7Mg
	yckEdwhnXSFuW7qHJlqhIk6gpRtANhF/RoqyOvOH1LSvMtsfEcXvU+p+DPoj3w7MuWcRDUtOz2+xC
	dNVqAQG8AEQjAw/Vo46qfXJ06ZzjXyXDWT8kL0DZLG2wqc550csbJ7AM2o2M1edDsz3YrvZ/Ti4wN
	IhHbbinfZ26BoVFDX+apIIMaV0Gp+T86QAPpI3M4S52nVRTxi06kyUicjUcH1/IOmn/fGaa7yfV+z
	7qlJKFcbay8YPF6K5zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFc5-00000007dPq-2GHH;
	Fri, 21 Nov 2025 01:07:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFc3-00000007dPj-48Zg
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 01:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23DBB6020E
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 01:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B62C116D0
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 01:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763687218;
	bh=Jt8lXkFCWKS3cFs/xChO8KZVAsJRM+PJgGHcq4dDsRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OoPymf4nHgZqOFIpSZeG8gzEQRNf3ObAQprc+UhVaPDPAOKdR8V0li2kUnNkQkzIH
	 jtS9oeuIcDu1PyqiUFeB1gC9rPf3SXQD8zkCOO8ggEonSXlfFQWMSjx2TpVBRcdDmo
	 50nU1Zl7/jD1oCEmXg/yaQzogQsA34fzA/ZhA8FvP4U0qBjbFbNvluiBzl7bPyxpOk
	 1FCZ2Cqjb8ftdqDt/uaxm0opUQ55FcZU1CzIsjlELKDEh8RxQVzm3rSfb78qzmPM1x
	 bdhvNKZItUHYmeeniKdyPSJALgKAFs1vFMrl9KZlWWtCrUhOuukgQEmNHvgjuabmtL
	 JXzYyjSePzVRw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so2612393a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 17:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSf7CfNtPEyWqZ6J/0S1AC41Cc8iSiZMwlMhwUzUvis1nh5jEBTPNEf1c5qvwdbahli0LgA0RuVUn48w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAXbhfC7wgbah92GGOkjDDRQfepyNzRiahAqXYia+bU/dzPuvk
	nJxFoM5UA4+D3/tysOF7BC4fbQUf8K7e+JMlmr8VNKcz5ZaRp95Oq3t7OIM52JyE8AUAH9DUIMj
	T0uoIni2vmekPE+Ncfz4vjZQETTNvzQ==
X-Google-Smtp-Source: AGHT+IEr8UNZJdEEJXzbvLODQi82/EawVSe13I+a/Ug5TSwMKyLWH/s20rCyByBisR0z44L15MdZI5LUMFD2YBNHrB4=
X-Received: by 2002:a05:6402:3246:20b0:640:c640:98c5 with SMTP id
 4fb4d7f45d1cf-6455469d112mr494423a12.34.1763687217400; Thu, 20 Nov 2025
 17:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20251023160415.705294-1-linux@roeck-us.net> <176297731621.2151636.2516355929483523874.robh@kernel.org>
 <f5cc4e3e-ef66-7786-f9b5-f9d5f0846386@kernel.org>
In-Reply-To: <f5cc4e3e-ef66-7786-f9b5-f9d5f0846386@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Nov 2025 19:06:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKzLARKeM8xP+TeVhuksth7F9p8kaU7KtRxHFe=q1Q=9w@mail.gmail.com>
X-Gm-Features: AWmQ_bmdEJ5yUUe6s_0aXrsjWn4r4713F3SQSs6LiJVNFPLHbf0H6rd0ZVsUCOM
Message-ID: <CAL_JsqKzLARKeM8xP+TeVhuksth7F9p8kaU7KtRxHFe=q1Q=9w@mail.gmail.com>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
To: Paul Walmsley <pjw@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgODo1M+KAr1BNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIFdlZCwgMTIgTm92IDIwMjUsIFJvYiBI
ZXJyaW5nIChBcm0pIHdyb3RlOgo+Cj4gPiBJIGd1ZXNzIHRoZSByaXNjdiBmb2xrcyBkb24ndCBj
YXJlIGFib3V0IHN1cHBvcnRpbmcgdGhlIHJlbGV2YW50Cj4gPiBmZWF0dXJlcyBlaXRoZXIsIHNv
IEkndmUgYXBwbGllZCBpdC4gQ2FuIGtpY2tlZCBkb3duIHRoZSByb2FkIGFnYWluLgo+Cj4gRm9y
IHRoZSByZWNvcmQ6IHdlIGRvIGNhcmUuICBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoaXMgcHJv
YmxlbSBuZWVkcyBhCj4gbW9yZSBnZW5lcmFsIHNvbHV0aW9uLCBzb21ldGhpbmcgdGhhdCBhcHBs
aWVzIGFjcm9zcyBDUFUgYXJjaGl0ZWN0dXJlcy4KPiBMYWNraW5nIHRoYXQsIHdlIG1pZ2h0IGFz
IHdlbGwgaGF2ZSBiZWhhdmlvciBjb25zaXN0ZW50IHdpdGggQVJNNjQgLSBhbmQKPiBmb3IgaXRz
IGZhdWx0cywgdGhpcyBhcHByb2FjaCBpcyBhdCBsZWFzdCBzaW1wbGVyIHRvIHJlYXNvbiBhYm91
dC4KClRoZSB0aGluZyBpcyB0aGF0IHByb2JsZW1zIHNob3cgdXAgb24gc3BlY2lmaWMgbWFjaGlu
ZXMgd2hpY2ggaGFzCmxpdHRsZSB0byBkbyB3aXRoIHRoZSBzcGVjaWZpYyBDUFUgYXJjaC4gSSBk
b24ndCBoYXZlIGFueSB2aXNpYmlsaXR5CmFzIHRvIHdoYXQgcHJvYmxlbSB5b3UgYWxsIGhhZCB3
aGljaCBwcm9tcHRlZCBkaXNhYmxpbmcgaXQgKGZvciB0aGUKYXJjaCwgbm90IHRoZSBrdW5pdCB0
ZXN0cykgdG8gYmUgYWJsZSB0byB0aGluayBhYm91dCBhIHNvbHV0aW9uLgpMZWF2aW5nIGl0IG9m
ZiBqdXN0IG1lYW5zIHdlJ3JlIHBvdGVudGlhbGx5IGFkZGluZyByZWdyZXNzaW9ucyBpbiB0aGUK
ZnV0dXJlIHdoZW4gd2UgdHJ5IHRvIHR1cm4gaXQgb24uCgpSb2IKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
