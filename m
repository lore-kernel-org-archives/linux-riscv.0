Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339E0CAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 04:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYNldVFJv93qYt8t4AIg9rGbGm7h3Q/EIZrHkcwAVfA=; b=edQUsDMK6Li0WR
	IV3Lum8Shyr5K0ZnlTGsYzx7GWOAWwWBoE/fAFayqbjg24h+rU8V2Cdv9lr0MXtq7uocyS1GAXwdG
	gIcUSVlpHeB4iUy0kYLMVgus+Km82QCgBMP5E0wS85OONU+WiEdtnzrW7vMHHDnwDDjH5rPzXMi7f
	fAAWTGlVAYcH0RkOsEDsnhFzVHfbhLc9+uiJlqoMqpO8oHgpHYFr7cP7cVN6xjS7x84DtMqXXaV/W
	k8Q07Ocv+7wQYRMtjXsZPBclmB97OKFGSduYZdRoq4nOu9oajRqPPQcXoRTvHl8PGVLIG7Jpj+RsR
	0wMoOymHmtRxebRw7h3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Pw-00000007dPq-190G;
	Fri, 10 Oct 2025 04:07:44 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ps-00000007dNg-4BEc
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 04:07:42 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-780fe73cb41so9417777b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 21:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=Gg0zpDaQBr2D0XPqVXsPPKRLAEm13BuvnCSQYHsm8Hm2BCUw/idUy4NGOizF8t05i7
         tCwGEdYjG4Gmy25YlC7LGlgi08pC02Q22WD6emqwNK3FPKTD4vJfHu24qt7yvSh4jU2r
         8llQVkgWTzXI7PCMiqzv94sQlqCPv0aJEnt/NBX7yeQxya36/WxGH+j45CkJ2mHs1VxM
         1s219F+zGqml3zWkuRm0omMICOfP5/AR/90GOUdqWadAuSnbSpfU4msxRs4fGG6l93B6
         oLBhUggsg55gC6M0ZQ5Zp667LxBJ1nUAAm8fJYTEh4gpIbj9gYiSbIcjBMYW4JQLWdw6
         E5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=W39MScJ969IpALmF87qF/0BfqOiG6D6gky8jqArSgYel/9M8I53JoI/TvHu2cZJvEk
         kncbfLk0kFaJJUTIdsLWSiahnOsUZ7M7wnBWAm/guXbgdK1Kr5c2BCFYk/WN3Y5uuSew
         tEg8/K3PPKGpNZ/rD6558bBdxWolyQ+GLYBaUe1vDet8/hrNqoPkgGRURy4cTpj0eSgC
         PD8i4R0UugOsVBaRwEnHuzr+UkBRjJi71Wl2jSYqd1VY/NFJB8v9K3l8JXPXM11JtbT2
         Fhfu0kcX8PUO7aSL6zX2/kg/l+uky0iY/FbOULTnnEdITBk+lYlRc+fQCq1GClb5ff+m
         27ww==
X-Forwarded-Encrypted: i=1; AJvYcCWWy1q9YkidIt47zTwqISlWpyePariKOL9BD1/yRYVUt6QyC6ncZq1qX3lVgc3yXPNRxnUWTKCI9YQDwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAa4Zaz80wIXHxBaR4WzRx8wqOCm3rq4AoQL9yP7Qu24qfrSoe
	QmFTSUYcbe9lySlVdnIf/GczIFhn//ymBpkkbk9jBCD3SS2N3KiD9442hG1Ud47PuA4nG3/FFQ2
	ZbHQdEtqmRrzCq2I1vqeJZHZDA/MO6Ig=
X-Gm-Gg: ASbGncsevg0sJ8i64pJCg4GHatWvOT7UQPjwTE65Gs6a7ieY1zrQpLhl3BIZYK+L4KG
	CW5hCv7GMeaK6jA+bI+BGRBBXkTy2Vne+BBFF8KzVGKCWPyxhwFHJEDC0wZVONHR+oFkvzgFMD7
	wmAzgmM7mTJcOWsxXKiNQ9aY953CzGIJEccJvlqQaXXGZZ8PIuQ8kKT1ThTLXLKq47XCGYJiXJZ
	5ngIBWdeN1kM6hIV1Om6ANKWg==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_210741_039132_DD792C5D 
X-CRM114-Status: UNSURE (   7.29  )
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

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgNjowOeKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFRoZXJlJ3Mgbm90IHJlYWxseSBhbnkgcG9pbnQgaW4gbGlzdGluZyBl
dmVyeSBhcmNoIGluIHRoZSBzdWJqZWN0LgoKT2ssIEkgd2lsbCBmaXggdGhpcy4KCgotLSAKQXNr
YXIgU2FmaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
