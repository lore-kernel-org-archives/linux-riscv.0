Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D95CEB2C6
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Nov 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2JEE2hIyJThqNCfBlMVDCpaWWUnFYVVIhrGdVjMA1w=; b=R63QlEMrgh1jQy
	pjwJNI9kwv0oupAfKzd8330MuBj1NXJXBmFFqfYlqSD/2fLcJjQs++Hts58MgS7D+WjVAFr0+au2X
	+Yg3NMrlWjQh6ul9xEizwXEQoz6xOFqHCCqVJFQIFhTeJgbJt6CHwkoceDpidi+SrotSQuFzAKh7L
	Y1h9y8fabF/r7fcHwKx9QECv9l5iZ6gV58QEGz9r3c2eC71QH2/v2w9lh+eTIBQ7u/Wf+ATIzNqFD
	SLXPJVHi4tomhdxRwkycTBZFchjuGmJACb/nratQ4/Trq7K1BXYsIaKWKst8GeqRXtvDsydaILdv1
	8mMHlsArTMF8m7OnmoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHub-0000000DsIz-0iMN;
	Sat, 15 Nov 2025 15:10:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHuZ-0000000DsI3-0e4g
	for linux-riscv@lists.infradead.org;
	Sat, 15 Nov 2025 15:10:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso3740150b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763219398; x=1763824198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SA9SEdpJyHPt8tsp4kccmbvrFG5gu2WIbEuJq7mvJw=;
        b=EYzv/0B0LsynCLWsvbEE7V782AffZUa1bA250bLoetoA6/VU8TpbWex31jYmLSrtSC
         i3gPwwyhva9WqA0f44YGuP2AR0woFQ1ij9iL3eOmfK+zrpu0XsLqhLPGkR5ZZWZixUsX
         qAqm8Yrd7Tem6RAGRvE6h3J8iTzr7Pyxtvf6TUkYTkRfiMuozNTLn0VQ9xkSuJQW7HLT
         0jNGQGfhWEuuv9w7byBF8/VaQVRoMGcpFKue4RVQAXNfUQdx5aHM6Grb2RJeKSsiOxz7
         r/qc+q8qz6+GJh4DJYQyb0/4f2J4XbR4hEV6Bv+IGgsfb68P+lTw92NY7li2ehr/vEMd
         DEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763219398; x=1763824198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SA9SEdpJyHPt8tsp4kccmbvrFG5gu2WIbEuJq7mvJw=;
        b=s9DHuX7nReFjp0cOjOA4q3VwH8Vn/SixqMuBxbUlDwbiz1x4hHh4f5HCB/PDAzMO6T
         VqMu7xn1aDdfBZZEFPcyjgJg7+aTCox4u2cKVT9ZNglnzf1YznGKmVpVPo43RI8yrNVn
         6sEUCcN2g9jxjmox8mukjIj1XIxZmfVXWoFqOP7qTGC4Vrrl9wHdjuhRB/C8XKRS7fTt
         OhvfWvc2XS9/K9ix1a79xM5SrW4gUZdCdz7/k12j0nw4elc5Ku95OsvxgCRAC8S8epXv
         16dY+aXnQhh3MwbieKpTmn9LUF9ND/FijJERTh6ihebMIMeCNsYWeUIBu0xEut09/XWk
         Ybzg==
X-Forwarded-Encrypted: i=1; AJvYcCXK9ifSJO1T5s3KN6Z44Y67pQBqGS7qVPboTIgUndpyaA+oSyGRDTKXhbVuIjooaEuliT5j7Z1+ewBkPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9WO6RCvdoeS85+B5yzNChRv/CM/D4u4zYUUdRIJ+iRQLZd5xa
	y7lYg+GUMZHrPvMLIPtMkIo9r2QMLkpPoYiO4itBjQhK0oYqy/M6vd4Q
X-Gm-Gg: ASbGnctDfWtRJNODN4UVKfHPFwebH4HWdFbKw87nmu3h+vx/dlQVr0Yi1EbdVBV4j+P
	k6D3St0ImTZzy36h/zh5vWNH10e9VxpMg1/6f9UnRJHQtcYJv8ybdFWdpYwZNZXp+ES9dKtgH5a
	mCb/w5TG7k+gUtPBx4UppWzz0KP1+YNXazgVya4bTPkyZw2PIuPEJR7UvO6dLyZ7nHq3oB5kQNx
	Y/vnoVsGZjSeiMgPe9cmxSDi4hLPty0oLDt3pHKKFiP8893ZdBP7Exsn+5xnhSyQA+H1aflZuJw
	G2CBkxrTPsM5xu7Ftr2OVipgyufD8wykT50b4IMFwcigOL3iUz64S0R3dBDMlcnZaWhAunaDQCq
	5FTTIYWewj735YmtzcvgzIm3l8jQP4AlkXAzaOMqGrh2s+we6N+Ibd2FU6xQAi2rgT6ZjM/9qxX
	QSVMdxj7aAwf2/d9Rmb9CN2uCw5ODH+q5oNDo=
X-Google-Smtp-Source: AGHT+IHWcY+GtYxvT2QkvWrdoG6nA29trQIRuLrsD8pNdWPYP/nxv4eW9O/LAvnZtRfQqFwuGVp1RA==
X-Received: by 2002:a05:6a20:a109:b0:34f:c83b:b3f6 with SMTP id adf61e73a8af0-35ba2598aebmr8896833637.43.1763219398046;
        Sat, 15 Nov 2025 07:09:58 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm8266986b3a.69.2025.11.15.07.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 07:09:57 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de
Cc: aalbersh@redhat.com,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	andrii@kernel.org,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	brauner@kernel.org,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jlayton@kernel.org,
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
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	oleg@redhat.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sforshee@kernel.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 3/3] Make finish_task_switch and its subfuncs inline in context switching
Date: Sat, 15 Nov 2025 23:09:28 +0800
Message-ID: <20251115150928.649-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87346gbd04.ffs@tglx>
References: <87346gbd04.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_070959_218160_B6B6271D 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, 14 Nov 2025 21:00:43 +0100, Thomas Gleixner wrote:
> What are subfuncs? This is not a SMS service. Use proper words and not
> made up abbreviations.
>
> Again you mark them __always_inline and not inline. Most of them are
> already 'inline'. Can you please precise in your wording?
>
> This really can go into the comment section below the first '---'
> separator. No point in having this in the change log.

Thanks for pointing it out, I will improve it in v4 patch.

>> After `finish_task_switch` is changed to an inline function, the number of
>> calls to the subfunctions (called by `finish_task_switch`) increases in
>> this translation unit due to the inline expansion of `finish_task_switch`.
>> Due to compiler optimization strategies, these functions may transition
>> from inline functions to non inline functions, which can actually lead to
>> performance degradation.
>
> I'm having a hard time to understand this word salad.

I think the description is very important here, because it explains why
it needs to make the subfunctions as __always_inline.
Where is difficult to understand specifically? Please point it out,
and I will improve the description in v4 patch. Thank you very much!

> What means (rdtsc)?

This is a high-precision timestamp acquisition method in x86.
The description here is not sufficient, thanks for pointing it out, I
will improve it in v4 patch.

> So the real benefit is observable when spectre_v2_user mitigations are
> enabled. You completely fail to explain that.

What kind of explanation is needed here?
```txt
When spectre_v2_user mitigation is enabled, kernel is likely to
preform branch prediction hardening inside switch_mm_irq_off, which can
drastically increase the branch prediction misses in subsequently
executed code.

On x86, this mitigation is enabled conditionally by default, but on other
architectures, for example arm32/aarch64, the mitigation may be fully
enabled by default.

`finish_task_switch` is right after `switch_mm_irq_off`, so makeing it
inline can achieve high performance benefits.
```
Is it ok? Thanks very much!

> bzImage size is completely irrelevant. What's interesting is how the
> size of the actual function changes.

I think the bzImage size is meaningful, at least for many embedded
devices. Due to compression algorithms, code size cannot directly reflect
to the compressed size.

Anyway, I will supplement the size of the .text section in the v4 patch.

Thanks very much!

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
