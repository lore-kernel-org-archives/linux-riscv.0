Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDF0C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEBfbhqhh46baBEk7bOCsh7xt1bOr+x169TT5n/vQzw=; b=UKaRSlG4xtcAJE
	7nSER2M3R/Xc7fc67M2lxkYcN+01q8MFrv2fN7Fi+pZ1t8YKoTx4iCH6Q4dohgAT62RnajPFK3A7w
	lwNfKQ6yixVVUAgkua26bFgoQDSaKARfiV3VWn9AAjyK7U+zMPQzrCcqa1wpKxDT+xoWh8XPaoDpl
	/+vzeZaPmxwSLv5WpBhaG7lM9IikckFVRZKWLkAYul7f+ldMbtfEWvEVj3DS7h2HuuWCGd2IuuCNs
	clpkYiNBhyLMacXkNlUZUmasrvwvkiHnXYx6Bn/GVcTVUu7jnlMkxroe+0gl70J+JDeKadX5O8K5d
	7HkbSiHAXAG11bW5hxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6jO-00000000CJX-1dGd;
	Fri, 15 Mar 2024 12:32:14 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6jK-00000000CIp-3RxZ
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 12:32:12 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2219edd959dso675718fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710505927; x=1711110727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j31+yMWO3vIgCtHa47BOYcnWShrCl0VEtcdZTnTOWgw=;
        b=hUWSjWokH/HPuRSk12iEbY652U6TdSJWL255FnoaLpugoUEh8RNZza46s675cIsbkw
         WwuPlEgPGYdSRdUeGlbs5TDRxYIew92Tly3yZGNwlA4OM4/4h5XxYg1cIrdGBQEI4tVc
         usBetOp9ZYS/n8LWlUXnoh1qT5bDaSiojFqkBu3NrT+swJNd5lZAKWq26JunmUVGrZth
         eopWkdG2Ud3aDn43rFIxEgANDb1lUFWWl2PJdsReX6iPGXF7zru9YeyCvpJnIPH3GrJp
         QrE449BfwCYZ4/qk+hN31K5aZOm1d5WWQch0ARG+jG59Wz8rqeX1PW1sMSHSpEJTL1vC
         yJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsnrkOfHya0ufLEXVMhlA+Sl5BTg37GqjIKlc3Zvbsqthqz2MoQAkmeOaBdjnlrOtCjvBHpaT0WB92n/zimYnGdxPOwodY+1nW9QdQcIJe
X-Gm-Message-State: AOJu0Yw0qCkPq+6Jks6TbYhazCroda3GdyIbPqL6LJNlFba4jxosohWh
	4HF0iCkD9wnmWUjcs3KKMv0L0hlgK7SIJxQEcxKOHNrF4AmNyRQ7QYsEIiLkzE4TbgWHM3RwRbp
	+ucVrsIlQGzqYlHv0JHHrDZ2Xe/M=
X-Google-Smtp-Source: AGHT+IGfMnFTEOnZaqR3REd4OURjr0SyRKy28dnUBfXOV8VCPImJ6jmpCfhSKSb5BKmLCAHTXAFjDVx0p+e6u+QOw88=
X-Received: by 2002:a05:6871:458a:b0:21f:cd7d:9904 with SMTP id
 nl10-20020a056871458a00b0021fcd7d9904mr4604361oab.4.1710505927029; Fri, 15
 Mar 2024 05:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240118062930.245937-1-sunilvl@ventanamicro.com> <Zc2U70o7teYnJyp9@sunil-laptop>
In-Reply-To: <Zc2U70o7teYnJyp9@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 15 Mar 2024 13:31:56 +0100
Message-ID: <CAJZ5v0iaVj+E5yq2wph7-tr6y-vzFbfoscxjk9Y_O1iWqNp3Mg@mail.gmail.com>
Subject: Re: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_053210_888642_2D9FC475 
X-CRM114-Status: GOOD (  12.23  )
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

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgNTozN+KAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpIFJhZmVsLAo+Cj4gT24gVGh1LCBKYW4gMTgsIDIw
MjQgYXQgMTE6NTk6MjdBTSArMDUzMCwgU3VuaWwgViBMIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciBMb3cgUG93ZXIgSWRsZSAoTFBJKSBvbiBBQ1BJIGJhc2VkCj4gPiBw
bGF0Zm9ybXMuCj4gPgo+ID4gTFBJIGlzIGRlc2NyaWJlZCBpbiB0aGUgQUNQSSBzcGVjIFsxXS4g
UklTQy1WIEZGSCBzcGVjIHJlcXVpcmVkIHRvCj4gPiBlbmFibGUgdGhpcyBpcyBhdmFpbGFibGUg
YXQgWzJdLgo+ID4KPiA+IFsxXSAtIGh0dHBzOi8vdWVmaS5vcmcvc3BlY3MvQUNQSS82LjUvMDhf
UHJvY2Vzc29yX0NvbmZpZ3VyYXRpb25fYW5kX0NvbnRyb2wuaHRtbCNscGktbG93LXBvd2VyLWlk
bGUtc3RhdGVzCj4gPiBbMl0gLSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1hY3BpLWZmaC9yZWxlYXNlcy9kb3dubG9hZC92L3Jpc2N2LWZmaC5wZGYKPiA+Cj4gQ291bGQg
eW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIHNlcmllcyBhbHNvIGFuZCBwcm92aWRlIEFD
SyBpZgo+IGxvb2tzIGZpbmU/CgpJIGNhbm5vdCByZWFsbHkgY29tbWVudCBvbiBSSVNDLVYtc3Bl
Y2lmaWMgY2hhbmdlcy4KCkFzIGZvciB0aGUgQUNQSSBLY29uZmlnIGNoYW5nZSwgcGxlYXNlIGZl
ZWwgZnJlZSB0byBhZGQKCkFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lz
b2NraUBpbnRlbC5jb20+Cgp0byB0aGF0IHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
