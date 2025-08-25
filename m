Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF573CA0FE8
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4gvSZLfmp8X/fn5yKQ5QWGERibRirIyEwQVR8TgyUg=; b=Zwhy5sY/6yLp8M
	Am/B79WgOxkdKAC0ZA44x7s3MA3YplrUSja8jJG82X1QceNHdS7eJavJqq6fj05ZBFefwgLaC/6rm
	SrOtKAlzoSPIzP84UGNzqKdADfV8MLNaE9K42Pe9OWU4HpoQE0+F8U7/Ia4scldWEtk8gaKVzVXPZ
	Gj+FcYoYNiWRn6V3l9X440CE+G1AVw32wMogrMgQ+YdhEkpYKIXgFBzd6cwCX7Ef8M1+S3cpnSeyE
	hRp57rK6eyOWXLCFG5kJpTABLCiHrcYr35lDnwxMgnDIhLv5adgmWdbG6JnHpI2w9AGJlY9mBYIlp
	XPMXnQdLfNHkXJ1lrXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYny-00000008SMP-2Wu2;
	Mon, 25 Aug 2025 15:08:18 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY0s-00000008DrN-31VS
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 14:17:35 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-30cce5c7f1eso3480190fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756131453; x=1756736253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfZ62tLuxByRPYy6WjHQSXBDg1A/cx9UlgBoxSwnUEY=;
        b=S+flP8zBLc6qp4dlBlJT5OK9D1dSqe1af+6uI6cvlY6x4serwsM2G2IcsvgSL5vLP3
         0fjGuVlTLPXYVOeS27wMWGEiEd+odegOz2jqvQ+UswajQ+8BKilbFcr9B3X9KmS/Exbs
         lcnlFc9vBnWLZF38p4jm82KavD+Ny5gCrOuvQiEsHweg12WhW/2oC+QtGukNII+S9pfr
         dVyPqxIzGA5I/xKPW1bStyL1K6pPu6dfseB9FqXS4a1Ci1L+nak4+9vGxtw9ZsnN3gr8
         CQhuscCeOifXYoqZXg+01BpxwxPI9ZBEr0WXHSmK9NYMeUGtMxddcJjWYCoPac0dS3Vk
         b5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131453; x=1756736253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfZ62tLuxByRPYy6WjHQSXBDg1A/cx9UlgBoxSwnUEY=;
        b=JEpkvRr5oACFKqenY/Kz9UaNt3Kt9rmTKZvw1RPiQQZ00+BxYII63fsWPSVZnStOEx
         nXl84V1uXuOovrkpg1rupaQ7BAoobIrCT1sat5JexHiURYxSJMe4fewUA+K2VecmNVNP
         XCYIyiqe3dWO/FNGDeN7bAzc/xUH4np/8FoNcW6thmvKd2CuHFaB3B3driydYTXXeiqx
         gbw6HvxWauoG34/Q/cROt/yk4/7W6OMxwu0xQtD+4VS5SeBAssVH0mh9S7/Ilfx6uvGC
         CBU9YCezmj4B/fHRMJ6754tgp1WAjo5E8PZuENdjOk94o4FP+U+Uiy9pu0Folkb2Plo/
         rxXg==
X-Forwarded-Encrypted: i=1; AJvYcCWOxE2LCOkPFFI20hgT5/qYp/aEV8SojWPQNIyAfb46DotWeuI1lrgggCcdxMjaKgaHDi/Op03EoWxfOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzatevy4kjSXUU86cYi4gWSolMBLEDwhcPBfPvLrcfYzAsP4RQm
	qb++gELuIjxo2exy01ZxvpXba+MUSxJ3IhNzlIAefpjrmWQDB7dlOLachTYEGJrwy+qvh4HIIYB
	8pnh8GY8W4QLdRtS5fz0gWHDawtaQoBQ=
X-Gm-Gg: ASbGncuck1li0nfR/ukv2E/hSYwtITNR08kCKGuRBukgVu6dN7EvVJnPNn75iiyEynU
	LDsW6MR0iYmbVUUA6DGaeSuOi3EKvyqjasjObQnkDybUMDlqnS3pNSgC0WdtkH/MVJcNcvZsu8u
	/5ct7Bv02KdCNNW1ELoYj3g2e7kLqQua/UD61to898IIE8oGCUllHbYgbUXIzzdae7gni02EVXO
	8pzt/1xFA==
X-Google-Smtp-Source: AGHT+IFSc8yJZYP5++oyX3zmrWa4FAQwXR273vNyQxNEoAE2cLriN8WjmSnBc4L7oE7eTe5khl35lhborZFipbzMxh0=
X-Received: by 2002:a05:6870:9a86:b0:30b:9efd:caaf with SMTP id
 586e51a60fabf-314dd684ff3mr6566294fac.19.1756131453427; Mon, 25 Aug 2025
 07:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
In-Reply-To: <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 25 Aug 2025 19:47:22 +0530
X-Gm-Features: Ac12FXx8FORsgG-UWpSZaL1OSNZ7sKM_Gyr2_7qwAfsu43fTiyQJX4R9qb9Mtrk
Message-ID: <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_071734_758750_A1C74D17 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 16 Aug 2025 at 12:16, Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> Hi Namhyung,
> Thanks for reviewing the patch. I'd like to ask if there's anything
> else I should do regarding this patch, given that it's supported only
> for x86 and powerpc?
>
> Thanks,
> Suchit


Hi Namhyung,
Following up on this patch. I would appreciate any guidance on further
actions needed, considering its current support is only for x86 and
PowerPC.

Thanks,
Suchit

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
