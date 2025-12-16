Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA5BD609B3
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avuXZTqqlYsd0xsm9R6zGCdJUYhrcqLYxp+i1YzSuNE=; b=cwaCiiqR02c/8B
	v9OWD2pIVTfpkhvHT4vhm6ToXKx4SezYS9SZichZu7E5uM8V8aEUPU5W4KzJVC+puFF+DkDBPEgBp
	071KlxwpcxGfy/9nl8YgEJu+JH+O419vbWQRJdyXbf079vDRSqxja7jvNN0mtbMdawE0T4vtjtzhl
	cVaa4OLAHW8t2lTmT3ZyrKYEdAggKDG17Jxv1H+xjZSsj0dc7LTeAxI/tcDyUVvUH13+xgusC8/UM
	1LUj4b6UyPyfOm+j0pJYIRpamY27lzqIqd7mw2a+Hecq8gDUMD1/5p5Z2bl99GLgKlGoI9wkcyH5P
	0BEs/ei3LXoZprnwKKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXJh-00000005Tjg-2ZFE;
	Tue, 16 Dec 2025 15:50:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXJg-00000005TjJ-1oyw
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Dec 2025 15:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AezLWqLpD6CrSSZ20H0ppmyNNXbXENPGR4Qr/3w4H5M=; b=rZm/SKemg8DhHCrFV1g9OBdtjE
	uq1c5QW15J0+WFjw+pSWOrJbQ0uakQ1FQXRo5xS/TtsGUdugnJI4nLQNoNARIDOutj2fb8VqPi7l6
	ARL6b1gbMBTKERCPAbIfFW5kMACFNeWvpgxeDuFI/Rf+msU93WskXvpy59jmJJI2LHX4yqCUZ3sl3
	Xrj9Sos1yv1NfzxPf97rAR6cBkooNSFfHD4c9tZvelrxkzD+xR/VfEI/6iJCuw0jEhLj4P9JSCtOp
	5gjJwWRPtVAr4ZnclJWjC2IvvxOJf87hFegfaoueteMaHw9SuWbQA1uaY5fj0S01BsY02pzbh2mbE
	TE6EwWQw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWS9-000000054cT-3ruz
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:55:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo5501928b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 07:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765900219; x=1766505019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AezLWqLpD6CrSSZ20H0ppmyNNXbXENPGR4Qr/3w4H5M=;
        b=UbBIp0HMwvevUw4xS8qymg3iPgslg9z7+HwhwdjHOI60KVlyVEfWvmrN1rbUiFTiJd
         BuLik5LS98i8Lb//ImkA3qn0VE65MUQlhKNXiudZaT7V+g+tp4HvPGwIN5uI+7ZaVo05
         KNiKEzxUjU2We566GlGf67cgJ/tgb/72XupPzmOqWXoIsIgjoepJU4aQOh7W9gtVVTk1
         wDrqTPvgOG2qBeF4VpW/2ztq9KDJi9M5QPFQLNLOOTc0BO/99BPGEtldU3BdZXrO78f8
         DV26/ea6/RUb5HQYIIpavm9daz2dKXpJgcRUhh4zyoDcdRfIHVVuKqtUXoMa32gGaa44
         TZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765900219; x=1766505019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AezLWqLpD6CrSSZ20H0ppmyNNXbXENPGR4Qr/3w4H5M=;
        b=YaWchAY4zO6y6QgCPHAFugBR4ZteSEkebQeFD5FjhyFBb3FJ4k4W76BNYATn3Ktv3Q
         0KotNPoA9dGg0wKSFo9Y4td54lcUWLoAGi8RGE1XxnSLj3GciRHwIL8Krcb6vr+Yh9aV
         rQW/QNEwbFhDuawha6pdh1Y2TtcLVK8vP8GlGB+rnS7LIlCZOtnBuADpdwN6NLsGv8MN
         kGzYxXfmkteFdCIADw/gVtnlsnRINOFAGJyRmyOm8hW/HsmllBAsoS2u9WxPA77E5iuM
         b0QUz/OWfkhpkn7xfR1qEFzYAjPriiwJDH6rQbajcUs/AZFh5y43HboURDQQYjnJ2sJ1
         RnxA==
X-Forwarded-Encrypted: i=1; AJvYcCWkRGoaAqexNNUggQi34xd4mt/Bvb2e4ybKFA6BwO8dPJtMtvWd6a0R6T2g5IhvX7/Jw5Sz5zMsF2nBMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/5WHE4JAsfzuD8t6jgkhVhlS12xU82nxOBX41opRpPDLo6gj
	iAJ/M/7EE52x1HxEpjAY9A8YKnmfeLoLQnbLCs6eOf+uflmoxk6UuZw9
X-Gm-Gg: AY/fxX6a2IYVTuCo2PpMvVvAt+I4bHkIjM3NsjKnMDRlyRLxMe1t37I0muUVD+cFbLb
	SBYMFr2ou2E5gGebO1J/RiutoQkClVDqo4k71oDAG8ZlHtUdTFzuAFGrV7sLuHM6uWJi4fyIutq
	4xIsiWwnUhRW3gg4K0UfytZ/GVyU4XDLJz8S3m0sPJMltavldglSiWNPy5KFGrNBvIHb24rgvbC
	sbF+h7vY5Vp5lJ5hs+FuykHNBd04jKrdVbSzhqVJKUW4yqEUTOTDEvQ2hxfaNhu8hkXD0syg/lm
	es9vvgEJKz8exgRMKoGq/itvCEWARgn6w3qEfs5xC9mZpDy9Fo6z8y+fqnsGvI4T3dUpfRsvn2S
	M3estkHPJ1qZczI5YCBQvGsp8VE9TyBfkI5VMNFn0wszpzxhkx40RGAJCa9LcxtMizYxqh+QMeY
	r2/4x30n/ncdrW5hfpnvbklHff46OVHIo=
X-Google-Smtp-Source: AGHT+IEoNHdZ1DEBYEdZ8Fi4jzaSzQZOk4zYX1IY5OzpnLVZluq/HgR2KLlvGI9RonLCmUXvHnMZDA==
X-Received: by 2002:a05:6a20:258b:b0:366:c321:9fc6 with SMTP id adf61e73a8af0-369afa082a3mr14434795637.48.1765900218667;
        Tue, 16 Dec 2025 07:50:18 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093a4bsm15829494b3a.50.2025.12.16.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:50:17 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	x86@kernel.org
Subject: Re: [PATCH v5 1/3] x86/mm/tlb: Make enter_lazy_tlb() always inline on x86
Date: Tue, 16 Dec 2025 23:49:51 +0800
Message-ID: <20251216154951.631-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87345beoq2.ffs@tglx>
References: <87345beoq2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_145506_009959_BEAD8A7B 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, 15 Dec 2025 16:42:13 +0100, Thomas Gleixner wrote:
> These Reported-by and Closes tags are just wrong. This is a new patch
> and the robot reported failures against earlier versions. The robot
> report is very clear about that:
>
>   "If you fix the issue in a separate patch/commit (i.e. not just a new version of
>    the same patch/commit), kindly add following tags
>      Reported-by:...
>      Closes:..."
>
> No?
>
> [...]
>
> Please move the '#define enter_....' under the inline function. That's
> way simpler to read.

Thanks for replying, I will improve it in the V6 patch.

>> +/*
>> + * Please ignore the name of this function.  It should be called
>> + * switch_to_kernel_thread().
>
> And why is it not renamed then?
>
>> + *
>> + * enter_lazy_tlb() is a hint from the scheduler that we are entering a
>
> We enter a kernel thread? AFAIK the metaverse has been canceled.
>
>> + * kernel thread or other context without an mm.  Acceptable implementations
>> + * include doing nothing whatsoever, switching to init_mm, or various clever
>> + * lazy tricks to try to minimize TLB flushes.
>> + *
>> + * The scheduler reserves the right to call enter_lazy_tlb() several times
>> + * in a row.  It will notify us that we're going back to a real mm by
>
> It will notify us by sending email or what?

I didn't write any comments, I just moved its location.

As for the content of the comment, I think it has nothing to do with this
patch. If the content of the comment needs to be modified, it should be
modified in another patch?

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
