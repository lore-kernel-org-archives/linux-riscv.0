Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E8CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMzdyJVaeCQYCXdx7HFdsd6MezEc+naF9Nbw1lOE9ZE=; b=dFp63VjA+zazjI
	ft9tXi4TPt/0UnYSo1ywd++Wo6RrLgXM1p7jiKxrRmJiBGgRgOZ1/wRXUSBpCzZS61IeeLN7Fnfo/
	Y8ygceD2mj1k0o/Pi+KOurjJ4WvkKrcXbgH+28VVL0Fn0FQZq4Y2FUfoQ7wZjSlVpQLa0zm1h3y9q
	x4Ft7x3JTaCMM+aNVJ87hi9Ef6ATqGvmVgbpzEPLISYf9HlZQsf4yXbKLnuNtbI4lvznZO7oYDJ8+
	egEl1Uxe1G0L0feu3VcwxtsLgpZKJxPjB7bJWME/fhb1N4YSY0cNA1QEEkTWvHPifQUz5JLfzrI6K
	b+CSsRqCqGFSTDPF3NDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAXd-00000000h4M-1psd;
	Thu, 04 Apr 2024 00:01:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAXa-00000000h3J-11qA
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 00:01:15 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-430c4b1a439so2264791cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188873; x=1712793673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EouJXf14bYBG3TFDA7FhpXHScaVdR+iW0OTLcyhvMu8=;
        b=mVfqiJPO/L+LcmoUsigHQvrkf+oxeVtLizY9ouP7yadGd7CYHcar1FN+fmkU/t4h7I
         Df9+/GZqYn5cVDwgDO8xzxfb3O6TwOs6VCwl2ANKVoLqJ8K0aLkaL66t0wVieoBD/YdW
         8HCEE+9vDCrsVZLezv38KX6cen5kzbpgbDnjDisviFASBp48J+UMXdhaPWsJ05/Tu9j4
         Tm2yHY7NmsvfJf+aDrYyqfOk3fkQNxQ/MT0gA2ynruPOaL29RIWem8ZwoyuYqrVYjGjC
         X0G4J/khXCEvHKsdongDIm8nM0iRh4y7ViVjBtYw1+b8Q04DWtban5v8pbzirFwrtCNN
         kbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188873; x=1712793673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EouJXf14bYBG3TFDA7FhpXHScaVdR+iW0OTLcyhvMu8=;
        b=OaWJCrTA/O3B5WAxyNq0PA8bL0YYidDUdQKuaC7H7OAbVSDWINShf0mzuKafZvNxVT
         nKuvvwI2UX4j4pAaaBx4EWRBevJ1nCZAiIZZuUUA/OXZMszyaae1uCRCzhmTc8iO+jap
         VvrwgwKS3b+IcR4SK+uRcdGlDuZhjcyl+1cKna1QPNQRGaggMnBHgvN8P1TKeMJ94a4l
         IdYtdFYpG+XVwFxI0X3rw8m8+DIvO7OLBx5dXXnnRNkPz4GhnZ3YUJLnxp866GchfbUN
         yfQ8lr+xZ9ieGelmdIj0+Iz3h+fu9GNjhJpXW4b7hSWP+pZsu375973x2NnXY2Mjg/77
         kTIA==
X-Forwarded-Encrypted: i=1; AJvYcCVaUkwxI6IG0ycRD7+CpEqjNCGjrbGhVaJW22QUASevxR29hVyiXDjgrEdXxzLcJZ9ht0jjW8978bVSIIwGa9jaCRAUUwbuUngqwvBF1pyw
X-Gm-Message-State: AOJu0YyKl0CavHK3gQDTXwjzjOM/Oa+qTU8r0efGJB66ZvFGpm3OwgIn
	xIZI6itL6UZevzOS6kEF3ST+J1gKca3ptXqJqJh4N1Vxc+Oig+4pe/hg/q0Zlwy43RWIw4zagiN
	935PFOuFg+pbBcIJmQAlvjJ6avjQKq9wYz6171g==
X-Google-Smtp-Source: AGHT+IGsXyB4D2wJ0imPILoI1sX0/9gh1QXhIS2cWPu5WGcG8wW0R1/3s3Qb93ZqSuEATVQyB05fmjchi9mzxvRVQ7w=
X-Received: by 2002:ac8:5786:0:b0:431:82d5:13d5 with SMTP id
 v6-20020ac85786000000b0043182d513d5mr844572qta.9.1712188872638; Wed, 03 Apr
 2024 17:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-10-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-10-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:00:35 -0400
Message-ID: <CA+CK2bAh7-HJhV_xm4+yKhwOFp4BO0+VurcXgMZjoOhw+gz1sA@mail.gmail.com>
Subject: Re: [PATCH v12 09/11] poweprc: mm: Implement *_user_accessible_page()
 for ptes
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_170114_324135_86A6B5F5 
X-CRM114-Status: GOOD (  11.56  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gUGFnZSB0YWJsZSBjaGVja2luZyBkZXBlbmRzIG9uIGFy
Y2hpdGVjdHVyZXMgcHJvdmlkaW5nIGFuCj4gaW1wbGVtZW50YXRpb24gb2YgcHt0ZSxtZCx1ZH1f
dXNlcl9hY2Nlc3NpYmxlX3BhZ2UuIFdpdGgKPiByZWZhY3RvcmlzYXRpb25zIG1hZGUgb24gcG93
ZXJwYy9tbSwgdGhlIHB0ZV9hY2Nlc3NfcGVybWl0dGVkKCkgYW5kCj4gc2ltaWxhciBtZXRob2Rz
IHZlcmlmeSB3aGV0aGVyIGEgdXNlcmxhbmQgcGFnZSBpcyBhY2Nlc3NpYmxlIHdpdGggdGhlCj4g
cmVxdWlyZWQgcGVybWlzc2lvbnMuCj4KPiBTaW5jZSBwYWdlIHRhYmxlIGNoZWNraW5nIGlzIHRo
ZSBvbmx5IHVzZXIgb2YKPiBwe3RlLG1kLHVkfV91c2VyX2FjY2Vzc2libGVfcGFnZSgpLCBpbXBs
ZW1lbnQgdGhlc2UgZm9yIGFsbCBwbGF0Zm9ybXMsCj4gdXNpbmcgc29tZSBvZiB0aGUgc2FtZSBw
cmVsaW1pbmFyeSBjaGVja3MgdGFrZW4gYnkgcHRlX2FjY2Vzc19wZXJtaXR0ZWQoKQo+IG9uIHRo
YXQgcGxhdGZvcm0uCj4KPiBTaW5jZSBDb21taXQgOGU5YmQ0MWU0Y2UxICgicG93ZXJwYy9ub2hh
c2g6IFJlcGxhY2UgcHRlX3VzZXIoKSBieSBwdGVfcmVhZCgpIikKPiBwdGVfdXNlcigpIGlzIG5v
IGxvbmdlciByZXF1aXJlZCB0byBiZSBwcmVzZW50IG9uIGFsbCBwbGF0Zm9ybXMgYXMgaXQKPiBt
YXkgYmUgZXF1aXZhbGVudCB0byBvciBpbXBsaWVkIGJ5IHB0ZV9yZWFkKCkuIEhlbmNlIGltcGxl
bWVudGF0aW9ucyBvZgo+IHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZSgpIGFyZSBzcGVjaWFsaXNl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29t
PgoKUmV2aWV3ZWQtYnk6IFBhc2hhIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
