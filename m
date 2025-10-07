Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15274CCA470
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YebR/94dEHX/Ij+ITPuDbyU+33HI4IAyoQVnkxb5PIM=; b=NHzfLxe+QQ69Vj
	rtoJh+5PeDpA7SYBv4+9GxcOEzZK+jYfyGs/ui0XhgBafYuZDQh9/b1NVYyXGtnnSMRow3yMeG/XA
	TVzDh+GxAfTyj0SNxovnmzkJn1rWoQWGEElnqVCX0A59/+TzicxpXZswkfsc3beWXYNm64jd5fZLk
	/9rJNXHzBEcAAMTyBH2SKZchv2N4yZe/1HW7lda14HnD7wpVNOyviyBSbngepAgAxoluRmhnPhnQR
	wsyNu+OefVXCGls2hfG+5rpXYAeaMhQY4Zn9EqJvT0nFifrsoa6lw3C1AxL+yO+5CwjQIyP4a5SOJ
	iYPq2L+G3qt2bXup0Enw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Atp-00000002RF5-2A6E;
	Tue, 07 Oct 2025 16:50:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Atm-00000002REO-3cMn
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 16:50:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso8584201e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759855848; x=1760460648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeZ4XDgQ6DyKwKqrcoC8/9t0LHZzFxjwDccZTjHFTaQ=;
        b=NnbAA2upv/+vPJVmmVMvxMpcm8OK7h103HFekKagN6hu0vUkTUOgwcHx1RlAhq3Ene
         mR63xd2OsIQZTHMLyB2KTPgDACLJ3ctNR38hKK92BGUh33CkCd8rLipCsT2wqI0H8F3k
         YqSz05J0X7aZ6HnjK7xT//5PkLRV0UyAxjSzErEmAMiHsogdLVskvMRLcV5Moecob9Su
         XSThB3BJt/CWaUgMLs9c7E3Zfmaw14YV6QQa2s2GpK94IgOjMBuet/JjlHHrrLpfce9s
         ifbjw7AhRYxSfSpHvc/Fn16S2oRXk8ykJ0ckHHxsOYbH776fkUjCgJChHBi+LPpu1XMD
         36sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855848; x=1760460648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeZ4XDgQ6DyKwKqrcoC8/9t0LHZzFxjwDccZTjHFTaQ=;
        b=sQTNKkCPkGBkyLSyrvxkadUqDO2JA7NTaEaAgkEpS8e9KTzCVaR2FrxzIeKU40xb5D
         YiJWgNFFKlb6245GohY9MDP8vThDAhtngfLQB/q6oagOha9da1fvQotDV8SN1BB//RsZ
         N/EgeMw+i2H+ebLs0LS1SEfd/iI55sibOLBuDCPIqJJVXyiNYuPTZkfp4IPokc9FkK60
         yZIEhy4N/LNGAHA/eTlEswXckqZAM2s6v2/8+cb2qkxWwb24OcjMmVRpBKjpQyxCzG+n
         69TyS/Sk6jASLfemFlPfqu6d0NgfnigYxzsFFNv+7TO4lCFkVlG4xAuNufO4C5+ObH+B
         HZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVywZyoeVBq385xrAM30F9q1xtQF2i5d5ldDSn2DEL29y+Y9YK/6xqzephrAEk3IcDNbWbm8kIPpeLx3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLGZCmy5BqBeaL+SAZ7lQi/RR+SsJH3ryChNB5jMjZ/LM09Bj
	jwJFGPyvyktM7f3MxC/19Cm3SPpan3wZHausbqEbJ+vVAl5oQCXLH/lqnKY3zcu/oJwb+As+jGb
	45YXehqe9fJX885fnCMFxfCJCdcnEIX9OnUiG3xDQ
X-Gm-Gg: ASbGnctjCec5RBmMa8wFwDc5f13P8nTTiW1fTtrHRGv6cJ2H7AVYPInGv4C6bRu3pdQ
	QXlFkjAYOElz//ZZQScM2PJzRMgsEMpXhlY+NxtWmsvsN27g28POBXXRYyvnA3SesHFQ2JaZbXf
	L1I6gARgcnPtJp+3K9nHSY4aR+093FAGQumiDVYlpr72XkPNolONTa9/1/GtOx9rpw+xcYiNZWH
	FH99dpPKmgBYhzP/1DrOEstTGJXiCAH8B1mbQ==
X-Google-Smtp-Source: AGHT+IGlJgwQGEf0vzt0iuMqZ0Q/3B5wNSB8RlWM05q8qkhQUfszu75UfeZenkZMb/XBGK6avKY5JjXuhw+68Fb/I/g=
X-Received: by 2002:a05:6512:3f02:b0:58c:787c:5f05 with SMTP id
 2adb3069b0e04-5906dd7ada3mr121303e87.52.1759855846077; Tue, 07 Oct 2025
 09:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com> <CALzav=c0Wgcc60_dGJuYffS3f3vD9mpdSjFguaE00L1Zr-YcbA@mail.gmail.com>
 <aOVCmIu0Dv7vJ0M5@google.com>
In-Reply-To: <aOVCmIu0Dv7vJ0M5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 7 Oct 2025 09:50:18 -0700
X-Gm-Features: AS18NWCMTjd5Ianir1w6T399jrV8GYXPXDvKsIysDv-DtdU6jZCzve4cer1YDyc
Message-ID: <CALzav=dH4F0_pXTBSkQDMiog2Y-=7VVyHYUW4s01uySaLY=XKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Use $(SRCARCH) and share
 definition with top-level Makefile
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_095050_903400_92814368 
X-CRM114-Status: UNSURE (   9.24  )
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

T24gVHVlLCBPY3QgNywgMjAyNSBhdCA5OjQw4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDE1LCAyMDI1LCBEYXZpZCBNYXRs
YWNrIHdyb3RlOgo+ID4gR29vZ2xlJ3Mga2VybmVsIGJ1aWxkIHRvb2xzIHVuY29uZGl0aW9uYWxs
eSBzZXQgQVJDSD14ODZfNjQgd2hlbgo+ID4gYnVpbGRpbmcgc2VsZnRlc3RzLCB3aGljaCBjYXVz
ZXMgdGhlIEtWTSBzZWxmdGVzdHMgdG8gZmFpbCB0byBidWlsZC4KPgo+IEknbSBwcmV0dHkgc3Vy
ZSB3ZSBjYW4gc2ltcGx5IG92ZXJyaWRlIHRoZSB1c2VyLiAgRG9lcyB0aGlzIGZpeCB0aGluZ3Mg
b24geW91cgo+IGVuZD8KClllcywgdGhhdCBhbHNvIHdvcmtzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
