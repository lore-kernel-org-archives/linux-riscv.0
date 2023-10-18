Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45DCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mT8nQJ9Ud60yc7qYctr2Lj/ylsLNxIUMvpj+OltI3M=; b=Sf+OFPsaWg9ezR
	801lqIKFGeptNgm1bPLgVht9HvpQwTP5BlO1wlX/EptQxPQZ6WxhYkl5KwaxA4B/wrL+5p4uX/q03
	wdmapUKRcbxgv2ogYrx/8w1TpTU/ubGasDfgL3WMFR4GwZyDS/oNbz3EeuCFc8K+9nhLwJ9+0Gf9y
	hPg9QJOLLyC5eHkoZ9yM1kub4i419O8J5u5zSRyoLqYIqvyNJ1qWzDW+3ufebplopyA8bQbrQY0Xp
	ejGUnqH6g/Amz5TM6sqssef9dSVFfi7Ygmj8MTtT6jZDqc+IKgQdE/nhjd+TGvaddK218aI8kx8D4
	ZE1ZFYhzgsYPN3+SwYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALn-00FJei-2B;
	Wed, 18 Oct 2023 17:28:55 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALk-00FJcb-06
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:28:53 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c515527310so60610501fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650130; x=1698254930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlxzenAtGOBBl5FAqiPH6k/I934Jd+ferEyJouIx4OM=;
        b=O2w7U5d/ozN6c/pw5EVS/mn5hwSRvNyvMseGUaaSQjhXu44KtJqOkw59EL53khQhZv
         /nOv7G1CsIvO+W2iucmrKFd4S3eme3OXE1rkPGPHDSiHDpWGJ5P9QPPHuMXY7EovFh43
         xlzmaaT8p+S4NFpmt+SZI9xEq7LS9VLTekNZJ2qm/lnwc58COSujhPQW0AMc1sZzLdGC
         w66uD8mcTIzxj/W5Dtj/JcSQB2iKNST2I6YhOxP9Be7rkBcVE7ZIpM65qil8grFDOFH6
         t8MD4TW5yTEWxzKEAQ9pHr6S57pmo74aLrnQg7HTKROgxUY7F2Cp80LfFSYdyxsIAQUQ
         aJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650130; x=1698254930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlxzenAtGOBBl5FAqiPH6k/I934Jd+ferEyJouIx4OM=;
        b=gN4+YWjf8KPzz4cQercMaWURuDfRCw9SOeunipgD2dEUDwIGvW0MMsYiJ6iA4eZgcn
         D6/hqygfwSDy2D/XrjK7B+sQKaZRZTrBl3PYHLTC8qohpjmOV57u69SqJVWxkN1Wmm+2
         pTWOuBIaKuNzgF83dHF8sTqd5RoUVBY+1Uf7ZDBffR+9RQtumc5z1zJ12OqN9vbtikDJ
         M6XJOsYPUcQnSmnrMW8DLV9M28lDMLyRB8B8YbR4xVS/ZiDilqw3Wl3c+XQumVFEHg5o
         VRWFlkY37c5BKz1o2UJ1Jfl9V6C44OLGxca5cZpe9yTZv10gOUMBr1vCzhAFsOa/VjJj
         iTAA==
X-Gm-Message-State: AOJu0YzMuDT4qelcGDqQOA6bluwXweYkw/GC9+ZTYThVPyK1qVkLnEOF
	rkFBoMpVJReTeqVb0DrcWqen6nNznSffpuIJYzY8eA==
X-Google-Smtp-Source: AGHT+IGHruj4vIi0kef+bVD+gPV4FxwyxPA0I1qw/x4/ZVHhtOHwosRH5M2N+IuPXDxc9LdApCvF7N2Iujro1xmxL7A=
X-Received: by 2002:a2e:9107:0:b0:2c5:1c9d:7f81 with SMTP id
 m7-20020a2e9107000000b002c51c9d7f81mr4392793ljg.32.1697650129601; Wed, 18 Oct
 2023 10:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-10-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-10-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:13 -0700
Message-ID: <CALs-Hsu4_sJ-qPXdg--p6+u9Zu_+FFZVAPp=D7SEuR-XG_A-nw@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] riscv: hwprobe: export Zfh/Zfhmin ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102852_067765_97DFE816 
X-CRM114-Status: UNSURE (   7.07  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWmZoL1pmaG1pbiBJU0EgZXh0ZW5zaW9u
c1sxXSB0aHJvdWdoIGh3cHJvYmUgb25seSBpZiBGUFUgc3VwcG9ydAo+IGlzIGF2YWlsYWJsZS4K
Pgo+IExpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMXozdFFRTG01QUxzQUQ3
N1BNMGwwQ0huYXB4V0NlVnpQL3ZpZXcgWzFdCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5A
cml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
