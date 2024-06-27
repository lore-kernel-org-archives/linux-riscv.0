Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F024C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S15ikCj1kUy2eusoaDmW2eOMxaLmoprb4d9GV/tY62s=; b=p/0VvOlOT9zokA
	xv/YqR8Ri7q+q3Yi3VINYeJbS+XfpK1pFoXK/GXwCs0epKM88xhZYeG9cKFPa741fsLsIxVabgZI4
	1E7RAYPo3torQLV01XYyhJD5w6IHQmf/IpaBBdczAy9Aq3bTvpBpacLVwX/C5d32pi+1A/mVhnnyq
	gfFH8hdCRkP89vtSWg39Lj6wDfHBtAQQ8kKkqxfe5E3epXQ9Sq226F1s3A9fI8engqaT53QF/F3nl
	MnEWTVRuBfDmUk+XIWXGPqLlorn+f4WdO344SBva2KdHp3VtTdci3Vu2Nbvy+FOMykGgV58YVszcS
	vV7kS1eHXVdqd40fYUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMq7Y-0000000Ae1b-1dO9;
	Thu, 27 Jun 2024 14:29:08 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMq7W-0000000Ae18-0BeM
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 14:29:07 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1f9b523a15cso13660185ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498545; x=1720103345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JcNaLWolRs7n14rIRyjHq0Qm/GfqPz8+VFMNKe+dU0=;
        b=KZTPWSriKWQsqb3mqqsM3HAJQplfAIAa/0g9vrxGbw8nYTY289zi6nyJvWRKQcwFFJ
         hnl8z/XSndePyyh4VUtjMk7jBrpLiiBS9E82Tp9685CX0IkxVVvdbjyJngbK1sOIW3eZ
         8haRwhqeBN9Vjb44nHVSlICNaeN5RAFLmwoMoN2ky+mlooDlkQqMi0jAGxre+8D3r4E5
         LdRB3oXFvwt0fBqRVxPTnyjhTje+gu2C+tSQj47Udws0p5eRHxS64S6V8uUXXj/+k1oC
         5s40ajPXZYKoC+jfdYhlnJMAet3L0jQhCw7IzCTjcjLkEqfQvsbM9IHdyHTetgvrvMd9
         sx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498545; x=1720103345;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JcNaLWolRs7n14rIRyjHq0Qm/GfqPz8+VFMNKe+dU0=;
        b=grnZUV9SHn2vszKykOkdFmIGIlCpNB9erh89E3auSCg9o9n5v6ZiMOcLhSyrM3iVyD
         AzpfrB5MpQslUepubqhu0MmUMcCq3H3XTsZvY1PxR8yWxCTrXN5GoVfDbeL3tc06O3C4
         DgOqI7NKQI7c1M+gWq8hmJs9oBtXNuA1Z+5+890XXEGu9N10i4HoP3jXM/EtWW1WHaGw
         mnn609qHbUC90yWPfYQjEN+Fhp4fPMhhGr179Xvjv3j2oy9RhsH03ViCGM0Fsxg2TQ1V
         FhV/4s98JPpbCehjTbLf90fPmymMPkf46gEONadLCk1wxUMmKsvMOeDVvb/LCMphj6Lo
         9EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhKOgD5WaASdx+IuEOkNs4bC8yzGitXLFS8q+2O4aRpy/G15qTz4A/4BuY/eZECld3UgMdhyNnBK0WIy/aNvx2Dgxqub8Bg3S4bdphyTRt
X-Gm-Message-State: AOJu0Yxn35p1yTP6/NyiAnb6weTKmxGlhRGVYy9Pmm+ajhImJa18W5yx
	cWlfRMZToZSeqkmzPCZkYGCJ2GvqNG/DqKlfILIEnN+BUdO0tWK4
X-Google-Smtp-Source: AGHT+IEG6KOTj12naJO65gSeeuIGUydngcS0AbDsxxcu1iqE1UvUj8yUX43NwPl9NrYcL72FxRQO3g==
X-Received: by 2002:a17:902:e5ca:b0:1f6:87f:1156 with SMTP id d9443c01a7336-1fa5e4f60d2mr153436935ad.0.1719498544580;
        Thu, 27 Jun 2024 07:29:04 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac8f2c0csm13941975ad.99.2024.06.27.07.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:29:04 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <6b8e1e79-5a2e-416c-8fee-878b3f5568a0@gmail.com>
Date: Thu, 27 Jun 2024 22:29:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: entry: always initialize regs->a0 to -ENOSYS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, "Dmitry V . Levin" <ldv@strace.io>
Cc: linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 stable@vger.kernel.org
References: <20240627103205.27914-2-CoelacanthusHex@gmail.com>
 <87o77mpjgd.fsf@all.your.base.are.belong.to.us>
Content-Language: en-GB-large
In-Reply-To: <87o77mpjgd.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_072906_126031_BC7E5A9A 
X-CRM114-Status: UNSURE (   7.36  )
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

T24gMjAyNC0wNi0yNyAyMjowOCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKCj4gQ2VsZXN0ZSBMaXUg
PGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gT3RoZXJ3aXNlIHdoZW4g
dGhlIHRyYWNlciBjaGFuZ2VzIHN5c2NhbGwgbnVtYmVyIHRvIC0xLCB0aGUga2VybmVsIGZhaWxz
Cj4+IHRvIGluaXRpYWxpemUgYTAgd2l0aCAtRU5PU1lTIGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMg
dG8gcmV0dXJuIHRoZSBlcnJvcgo+PiBjb2RlIG9mIHRoZSBmYWlsZWQgc3lzY2FsbCB0byB1c2Vy
c3BhY2UuIEZvciBleGFtcGxlLCBpdCB3aWxsIGJyZWFrCj4+IHN0cmFjZSBzeXNjYWxsIHRhbXBl
cmluZy4KPj4KPj4gRml4ZXM6IDUyNDQ5YzE3YmRkMSAoInJpc2N2OiBlbnRyeTogc2V0IGEwID0g
LUVOT1NZUyBvbmx5IHdoZW4gc3lzY2FsbCAhPSAtMSIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhAZ21h
aWwuY29tPgo+IAo+IFJlcG9ydGVkLWJ5OiAiRG1pdHJ5IFYuIExldmluIiA8bGR2QHN0cmFjZS5p
bz4KPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUGF0
Y2ggdjIgaGFzIGJlZW4gc2VudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
