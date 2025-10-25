Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4FCCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gOVbj+32RrkWC9+1xNBABrdoxnb3ZZHniT1+DVRkGs=; b=KYyr2RwktjQ2uQ
	UfJ+V4y8PvdThD/mdmpQx4/dP5AOHuKFAmdlS2XlkrRqL4i2ahorCF3JiyfG5kOwt4CGAsSFHrrcX
	B8uRGF0rQ9n6b1prZUgUE2nKygwzvfxX/pgwCauuSxz0TrXOTEu8mujAdXjOWCCUywuOHZS+uM6qC
	eZX83PVRLX+KWePBAxPEbp/N+nzx05NdokNMie3MhuWv0WqNiLmnipDAq7T0b3f1gxJnHrJ/r59oC
	ysZHnzdi1UA5vbbGOGzxR/o9yPfib0UWfpqkFUFLLSa/8IANIKydNisqobRdKTp4U+0jKFSCkAWQX
	Rh6NBqYbvsoF6+A4Rvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjn4-0000000BfYZ-098j;
	Sat, 25 Oct 2025 19:19:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjn0-0000000BfXx-3DWu
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 19:19:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29292eca5dbso43612815ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761419938; x=1762024738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b50a9arCrSL/MR93BKO9o7wTWQtm+XsywFPqsAesqkQ=;
        b=D09hEz2/70WblP5tHsOa//ta4IGIC+Fl3thTl8vgIgSsT1/OSOTEVmjQNFvuiVEkKK
         rzBxVovEJFgKOJsOdgFj8izYR4VIbuhi4ST4gM6OQSQ/jV/ajSUygu1udL+ad7nqP/c9
         ucuGiviu0z5UN5RY55Xu+pllmgc3UUa2BC12XTSyttQ/qpXbb1QC9py7ZaYiFWSy/uMT
         Dls2pGQNDGKJkMOdQ2aFi9ZUL/nhP1F8qny/r5SEo8FBobhWjQasEFnFzOyS47wz0qAI
         cHvNY7X+VIWD6e0Dg5GxU31FeOZw2BAX/f3gzQ1Hb/qtnQJSYKtrQHptu+rBwBOSzVSd
         PQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761419938; x=1762024738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b50a9arCrSL/MR93BKO9o7wTWQtm+XsywFPqsAesqkQ=;
        b=aQjVrX9ndtYopI4pOgenbmKBEsILO4lcWfIph8y18vv90fAZZhoXpQS2+DVo6fu/3+
         qHGZPU1vPnvYmDFf5dUQobcSN8DdD13tIBRWFaa/GXxldImNgBXg8upPE9t14dWub8Fi
         AA9HoQEW4mfes39muBTtJWUnqmm8TcNmGsL3Jm2tGU/WsHx7lxhP/7Otg7F1ZzPJV5GC
         UazSzMuRerUnHgz+sBl/uXjWNYq3AZk34T0wQMsz9x4qO5XvFQI70xMkRxK1I6sh3GZ6
         0EgJEAIjr/SKicyScBIDuySOMgZc10gIJDx7zBpoALhpIW0DVfJ8ro6bKeuRDYfXk58w
         qyig==
X-Forwarded-Encrypted: i=1; AJvYcCV3SmCZKUFnOig5wPqzs5uHcUv5TvU5bZJHG5TjplmqqTQcs4gL+IYLUly/bzFf8TJ0bhUueV9eJmIrpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw88MHYdDRPQ1gEzbbVvbzUjQkDZElxCrnBzaZe4YHOmFuar1e5
	Lg+vL5QT8kyf03oYxl3M0l6lgezB5al89H9gRO1p84TcXSVH9O2T+7zB
X-Gm-Gg: ASbGnctDobEcc6EWkSqc6NruEjn+3x0s6pL8oPh0Oh2B9np0Q1pOQVv9+vf5dbUDtjy
	pTm5gsVNC75E6nTp5axzwNjFLBzRu7y0Xga4e6KrB1tmqhMcqxJJ+DzeiiTT2tcHq/NjW93YzQ+
	YQ/CmieEjWicpIPsyyxQRO6wee8fOfA1ohPJStOMEU5Xn2u4GXja5W2MJf5Ac8BsL9q7/IESTEx
	P36vnmoD2X8YTVSs7Cu4VA3Vj0nLWgqkOS8KJNHk8TWVw5Whjyc2z97OtQbE59XJCLMTmjGi0uL
	KBRgTNSt+oorMZqjhQfpSfJOdBZpDCHdUerMQ4ks9fJliyk9Uo2OrVl0DZzW09sptcdxes0rDLO
	s2vZfVX5H75sK77fMPw2ihuVEtrN5++EXyJ9cga+VgKfowA2xwYdJAJiOuObu2W6GrSk7gm+T5a
	V9+2jNm+Mi6TH0GiYiX4dUE4A/Wt+7iYw=
X-Google-Smtp-Source: AGHT+IGB2o/5lEiKd9cWH/x2UTjOp0RZ2ut0VtofYuc7VyGMeDPM/lJA9l37C37EEgCCcQfgsU8H7w==
X-Received: by 2002:a17:902:e889:b0:27d:6f49:febc with SMTP id d9443c01a7336-290c9c93af5mr423757525ad.1.1761419937751;
        Sat, 25 Oct 2025 12:18:57 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm30054435ad.100.2025.10.25.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 12:18:57 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: riel@surriel.com,
	segher@kernel.crashing.org
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	namhyung@kernel.org,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 2/3] Provide and use an always inline version of finish_task_switch
Date: Sun, 26 Oct 2025 03:18:39 +0800
Message-ID: <20251025191839.6907-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
References: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_121858_831448_82398322 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, 24 Oct 2025 17:36:06 -0400, Rik van Riel wrote:
> Does that actually work, or does the compiler
> still inline some of those "non-inlined" versions,
> anyway?

For the current code, adding a new finish_task_switch_ainline function
and calling it has the same effect as directly changing the
finish_task_switch function attribute to __always_inline. This is because
there are only two references to the finish_task_switch function in
core.c. When one is inlined, the other becomes the only call point and it
must be inlined (unless the no-inline option/attribute is added or the
static attribute is removed). The uninlined finish_task_switch assembly
code will not exist.

However, if the call point of the finish_task_switch function in core.c is
increased in the future, as long as one point is added, a non inline
function will be generated and codesize revenue will be obtained.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
