Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4FFCCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1BAkimQtgbHEB4albcnyg4vqMlIdOIxQ921Y3gS8+Q=; b=S5WOSiWVtZ3A42
	usk4ZYoYkP0DsF9tOIgM1SxOYcNnrRQX3moiLK+BxT64cb62gX95Kohdwg0LO0+Tl7kULtYNeiIfi
	9YLRrSg5/fyzritNFXNhioVRREm6m5wq0lL31cNwNT8IurK+ai6h/zCgg9WHPTvXm8btdPrQ3NoV1
	c/nf3QpZaSsT1gm5YjpNctyWo449oLXcid4ueMrCL6s6JbthRU6s2n61XpHJOBQGvXfL1d50Cxips
	fSBDqVW95HwKeEp8wwjKbxHPEYmzca4+zN7V30jhR19Gbho5jk8iYE7e8VexxMh/X//HZy214Wb8B
	q9veZZT546iHWGKuZEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCitC-0000000Bcy1-0GDZ;
	Sat, 25 Oct 2025 18:21:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCit9-0000000BcxK-188l
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 18:21:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so3352038a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761416474; x=1762021274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH14/MnMcHfYPrdUmbrPExznn7x87YgaxQDndo6vh/4=;
        b=nWJXZwtAt2jkddDtjQmbFaHRPdYtmpKqzhs6x9AmmQxkMDNdE3QGKcnzRzyPzthTj8
         A+leTpNNa3Y8Zcs7r4VKWX0iLqUFeULTG55/Lr+Dahjb5T4hro92eqL8KMlBhWFs4VRq
         tjOj7TxPKoR/S/aJpr6Pnlliua5Ys3PcmUEOZpfvnjCiL+c32Pv5SAv8kR9QcPwk9wqX
         1So8KnEZtktnTNKXRryFlFoj2IDGIu5eiHsShX3D3nUcxrGDQwWZFQwvXJ0Q4CYKrhcR
         uoRVDGmVI9D1mno1bY9dJ3wISvG1WCJ21UyK0lQEsioKiIHnNy5uY3ujubqxu2W+jrPw
         L3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761416474; x=1762021274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH14/MnMcHfYPrdUmbrPExznn7x87YgaxQDndo6vh/4=;
        b=ObmKoJdbr/0Doo8jEmOFfCFIZcZ+garMct6ajEGLleOrBnDUCZnfZdAXHCqbdy9lVX
         Jpo1s7NQAzVY2nbIK8yrMHJYLTPfbbLxKLbGBVOg9HTeazQ0jzGLdkwl4hkzN+1ExgbG
         JmqKuvY5p5lXpZo0NC2g0CK2H5mX4C1Y9bwfAfvwrIqP0N/Ka9mpqWRNywU5mozwSrTV
         PHIeB+lqeQNcKggeXvwG43SicRH0GJppkBVaEFAt3A5h/sRg2lK4vS0tSc97oijyNp/N
         8VKqsFK4+lt0C0BWVeBkRkUy7Pq3Lv84lo8Rqw6bD+3dkYpVwD/tuTvE/YyXBNNFrGRR
         P+RA==
X-Forwarded-Encrypted: i=1; AJvYcCWvmcNv1UfFtFShpU66UOUkkoZm3XNOWfxCVR1vatOMC8vBMZVFBrTnUfFyMPY5vrEf4KJuvGkyWzjeeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYA9TFyNxd19Ph0SXn42b5oAzYKgPny1g6X8dAaGWN6r3I4Cvr
	WLJArnfTBvE9h9HoBlqb+bF3JCWfiWLu0fjWDj4RP5qo7O+VODT43sTI
X-Gm-Gg: ASbGncvnwvlwgsFrLHCWKhax6AXnAnYL3XtVCSKJDX12dcaWnZZkk6QdiAjV40PFTT9
	iOHqrXqT9pnKMQDh6FXYgb+Ehyrnuhin6iFePVjqlHDQ821aZ4+Na7b8q4DZ/Rule71ixk02XfP
	MsZ1y5E8F4bEIQ6Nrck6lJNEq2G5p3I5wtyVZ3jHdCmYP+R4M+NwlphBP7ZZ2xLpW7enEvGclq1
	aqNpvamJmwK+ZBYsK6TF/p2375OBWIYg3S/D4hSLbTENvB8uPmuslEV4qal3ewbPWty+G+vKvvP
	XS+41efpqr1TDinc3ve+bF+ArHkSPYXb7R7V6p8Qcf7xrd/zPVBzV6BrpS4ipKOMy6kQzvA3Jzi
	zYhHFHhQp7mHs+JNgvqNqD/2C+e5nmXEQreVlrEtNRLMaJp7uItYmPrt1Oj0qvRUYvQbz5Z8fk5
	y6ce/k9Uu0TOPNVqOe8ex6
X-Google-Smtp-Source: AGHT+IEsUSXlYbD6I629dWvXZvj4cEZuKoZGpxoERZCztC74qj4lgbg/Yxnib/SOWntPtHtuSob5TA==
X-Received: by 2002:a17:902:ea11:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2948b97429emr78955375ad.14.1761416474192;
        Sat, 25 Oct 2025 11:21:14 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4113fsm29127285ad.90.2025.10.25.11.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 11:21:13 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH 0/3] Optimize code generation during context
Date: Sun, 26 Oct 2025 02:20:53 +0800
Message-ID: <20251025182053.6634-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025122659.GA2352457@noisy.programming.kicks-ass.net>
References: <20251025122659.GA2352457@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_112115_330585_2D03CC5D 
X-CRM114-Status: GOOD (  16.94  )
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

On Sat, 25 Oct 2025 14:26:59 +0200, Peter Zijlstra wrote:
> Not sure what compiler you're running, but it is on the one random
> compile I just checked.

I'm using gcc 15.2 and clang 22 now, Neither of them inlines
finish_task_switch function, even at O2 optimization level.

> you have no performance numbers included or any other justification for
> any of this ugly.

I apologize for this. I originally discovered this missed optimization
when I was debugging a scheduling performance issue. I was using the
company's equipment and could only observe macro business performance
data, but not the specific scheduling time consuming data.
Today I did some testing using my own devices,
the testing logic is as follows:
```
-	return finish_task_switch(prev);
+	start_time = rdtsc();
+	barrier();
+	rq = finish_task_switch(prev);
+	barrier();
+	end_time = rdtsc;
+	return rq;
```

The test data is as follows:
1. mitigations Off, without patches: 13.5 - 13.7
2. mitigations Off, with patches: 13.5 - 13.7
3. mitigations On, without patches: 23.3 - 23.6
4. mitigations On, with patches: 16.6 - 16.8

Some config:
PREEMPT=n
DEBUG_PREEMPT=n
NO_HZ_FULL=n
NO_HZ_IDLE=y
STACKPROTECTOR_STRONG=y

On my device, these patches have very little effect when mitigations off,
but the improvement was still very noticeable when the mitigation was on.
I suspect this is because I'm using a recent Ryzen CPU with a very
powerful instruction cache and branch prediction capabilities, so without
considering the Spectre vulnerability, inlining is less effective.
However, on embedded devices with small instruction caches, these patches
should still be effective even with mitigations off.

>> 3. The __schedule function has __sched attribute, which makes it be
>> placed in the ".sched.text" section, while finish_task_switch does not,
>> which causes their distance to be very far in binary, aggravating the
>> above performance degradation.
>
> How? If it doesn't get inlined it will be a direct call, in which case
> the prefetcher should have no trouble.

Placing related functions and data close together in the binary is a
common compiler optimization. For example, the cold and hot attributes
will place codes in ".text.hot" and ".text.cold" sections. This reduces
cache misses for instruction and data caches.

The current code adds the __sched attribute to the __schedule function
(placing it into ".text.sched" section), but not to finish_task_switch,
causing them to be very far apart in the binary.
If the __schedule function didn't have the __sched attribute, both would
be in the .text section of the sched.o translation unit.
Thus, the __sched attribute in the __schedule function actually causes a
degradation, and inlining finish_task_switch can alleviate this problem.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
