Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6ECC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:40:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0B920656
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6PNkYk8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="SAkQmP5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0B920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NPgqfh1HA6YOkeGgFRLXBkufs34G4OBWeaFvcg4lfSo=; b=Y6PNkYk8y1WZOCv5yBf/ytoCq
	TPXv03IiMve0sgJ+ymOxhcmmxJYcMe+Cl36mReMwotsFk1ox4BHjvNT5N3dB52Vzew/rlDQZ9hvK9
	QpQmo/j/x9D/iMRZbAJe5JUTt3Lb9q5IGAQ7g8Rakv8YbB+Ny1wEFfHo3FEMOoY9aDW7D8G4TckXe
	TDCgaSGLqAZABV9Cr88R5OUYVZO7jJFxryEhjYWyEXYcdHkZfG//fkVXQdDzdGyiYeT2VClLflD0i
	ktQJl1sebyv858vrThtyJ9nm/kfGF537E54NrsUWIW+DX5ErAtVD1wSsAvfwrJtZIudOVNazQBJ8S
	4WraabxhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvlO1-0002x4-FD; Wed, 15 Jul 2020 17:40:05 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvlNz-0002vr-BZ
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 17:40:04 +0000
Received: by mail-pl1-x644.google.com with SMTP id m16so2676858pls.5
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 10:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ywUKWVT/eyMZ+XQcAhS0lnLwNHG1WTmE2GpfzDh3hJI=;
 b=SAkQmP5KmtFfZotBEnARRISfu9C5HkzjTskBH4LCABMmRQE8l55qAd7TFulCEGLwQa
 yiXtBZlFQ891mQxo86nkC5sDhUYD3EZB1DtT9oz4iIc3CNUHhYH6F843Q1MeHg8c5MQj
 QZSgS1+4Ev7dvpR27AaM4D63PX1WUrJJUAAaPwR6Tq1wPj4leFOLAhupTL2l/H1w+TnV
 +xCqwFbFOczFkDJVrvT4VoDN+jvOItc+/LTG2hnHpGVy8JfPnS8Hmw9yrBFlc0bZQpQ/
 6NR738FZsF53ReNhQwIA1+ndX1yOezkZDMm2f9sDMQzf9MfJycNmcJVToO9F82ZttWre
 2ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ywUKWVT/eyMZ+XQcAhS0lnLwNHG1WTmE2GpfzDh3hJI=;
 b=oclTB9X6nP/xR7MvdKbfnZlb/6tfJtNGBa7IcF4Z3T/fyne4aBoY/RL1Fx+8ijIhjI
 5VcXzlvHJSdNq8veUgw5wfyXTR2Jn73+rpPtVUGT6dyBlcWFJvvaHelZpBFQqflk7//M
 Q/nHd6JnBP0MgZjM7YsM0+TxXJT+k/jI3q640V/SS2LT2POU2chlli+Qq24aMJxDLkh1
 Cl6Zpxzm2yNTNoP4YSUkym/DuZUUc+QfudOkOCIl4N+RNHb6XeBALRXeHpxrl+qghXHS
 bYsc8ZJhrBGElYYP5FM+gGAapVIZO4/hEPVFme/MEBK1wMyH6g6DKLLGjO34rmaVdyeU
 m+0w==
X-Gm-Message-State: AOAM533+4HKdHwGzCA+ELIQc6oPHjp0Y9bhG0tT/h4OhUK6/ez6k3/TY
 fhQxwemds/p/eoTkHpINx0qr/g==
X-Google-Smtp-Source: ABdhPJwxE/ifq3HQV1LHlX3oUeTGo0J4reyrAWqbGkB2fI7g7fUomlpqmP6tmQGrGLgfHs9hV6HUdQ==
X-Received: by 2002:a17:90b:4910:: with SMTP id
 kr16mr766924pjb.126.1594834796454; 
 Wed, 15 Jul 2020 10:39:56 -0700 (PDT)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667]
 ([2620:15c:17:3:4a0f:cfff:fe51:6667])
 by smtp.gmail.com with ESMTPSA id x8sm2662158pfn.61.2020.07.15.10.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 10:39:55 -0700 (PDT)
Date: Wed, 15 Jul 2020 10:39:55 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Pekka Enberg <penberg@gmail.com>
Subject: Re: [PATCH v2 1/2] mm: pgtable: Make generic pgprot_* macros available
 for no-MMU
In-Reply-To: <20200715053340.576300-1-penberg@gmail.com>
Message-ID: <alpine.DEB.2.23.453.2007151035130.2788464@chino.kir.corp.google.com>
References: <20200715053340.576300-1-penberg@gmail.com>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_134003_414737_B6DBEF52 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020, Pekka Enberg wrote:

> From: Pekka Enberg <penberg@kernel.org>
> 
> The <linux/pgtable.h> header defines some generic pgprot_*
> implementations, but they are only available when CONFIG_MMU is enabled.
> The RISC-V architecture, for example, therefore defines some of these
> pgprot_* macros for !NOMMU.
> 
> Let's make the pgprot_* generic available even for !NOMMU so we can
> remove the RISC-V specific definitions.
> 
> Compile-tested with x86 defconfig, and riscv defconfig and !MMU defconfig.
> 
> Suggested-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>

Acked-by: David Rientjes <rientjes@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
