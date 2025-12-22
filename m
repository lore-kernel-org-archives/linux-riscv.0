Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD6E677F6
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqenPFu47FBWFuWNXpOlustHN97H0tVnatkrom+GBig=; b=KlihV4MMENQ1j7
	3MDfS2xG//pU0NC9M9GTwXKrSDWsJHPpi1BNwNsaKXAuPG3VgrA2SRD4fuuRph+RVtIh08TW+p3Ls
	UUjadnQ6jT3GbUT3Nv5wJQnOqZ3ew2x5Q3xDBpvwQNX/FeE0umlpl1DIFZ8avQoc2OKlDtKlaEcUr
	duJ8R9B4FQ/+i8j/KYZa5C0NHgrKcz8qq+Y/3DVyWUN9piGOtxgY0MlorWax3/LpvjofVDoR1duyG
	KjQ230vUjq5gqHF8TEswf04kPuQT7svBBvd0sqMIYoijO2LwcYZyPvK3J0ceF4c3vKa07+9gLglDr
	j61HHSro9zs5CJxO94gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXj6G-0000000Dz1Y-2BHP;
	Mon, 22 Dec 2025 16:49:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXj6E-0000000Dz0v-0oM1
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 16:49:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso6472463b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766422172; x=1767026972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHCtXyk+QeDYWx6FYrKpt8TBQA4HduB+6BbofOvZbwo=;
        b=Uklh4Nm5KIOy31mjyhlsC8+Ew6BO3Xmzfgm/3w6VTv/K3bad74SJK5InHHt/lYWjrT
         7ahM6Se+d4d4r2cnvT3CGF2dtZnIuUvl9U8WgqMAKU4EJY0El5A77v0fivUbm1l2PzFb
         l4ovJtbiLCcnxDT/vPTkQlSXFyS5O9pmieV0zB3tlY+4z5vr1fUtGZNLSNwSu+Jlcg+w
         f+skEcpy9oTjYu3JF7Yo9MZNhlzeL0bf/Jtb84X2FB91Ll7ZtswovJOxLOl1yVoLjWMW
         KP+/L/JbEffydSDNEuyCJJt2sd9MULZe1clWgfvrzl9BxH22a2Juw8LVQDwmcV2E47Y5
         VlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422172; x=1767026972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHCtXyk+QeDYWx6FYrKpt8TBQA4HduB+6BbofOvZbwo=;
        b=b+HUE8oWu01m6GnHkpQvLM4qfRpIcF2MFehfV0pa8fIw6NbT6g0YKsnTiUnNwtusEx
         PNyTUEXpUk8lJwSAIxwfCv7TvSNLrJsDUxS/hZUqWrKAbHtqIGj8uPmvqmp5E+cOM1Vj
         KFrptgkLI6TPb4ZiKqFiW90xmTXsDlYR58W2pT8MueB+MwrwY0r3KZ8uiLw1w3l7K2NB
         QfuTk27MaBKm/TuGgGbTsCmZ3WIlaxhQsfDyH/eAg7sD+b/X9UFzdzoqwfjc7Jl/BcTA
         xnNokGTrR+pdNROs4vOMHPoCpKmZ33Y0fFDTZLFalPfr3vq49ROuAfcp84aab1+oSug3
         STlg==
X-Forwarded-Encrypted: i=1; AJvYcCViXxDs+ENFD2XE1SIwM0QUsD8IhWhoitD3/ZWC+igSMt7r3QRPUFNWcFKCN7V5eHxO6e4rhOWkXFHE8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAKitFicQiSpNIU9IQ9LQ/mozszizdJbjQAkFtji2damIt+mig
	4CbzdYkfd8GOroiqYZH0g+pvLh7p67W5h9wdjDhhHHMVDCMgzD+7NrDT
X-Gm-Gg: AY/fxX61i+BwUdbN4ao2XzW1vKrwfRVUDVQhxS1JjYwdSRorJYKp9W/c0+5vbSztl2h
	eWPmeBoGxhuYQwujbeb1eklsqaYJsCppddeoNKfStTMxfKJJC+ULdccaSWgVKzP5MOF39Lk0vEY
	nggGBCg18+XRhG1iuoHmzJOvCG9QuBLDswgUM0MwEe09EUp8NlGSjAvfFny6hAWcKcdoChgM2wx
	09nLECsXYD6E6WDjLGsMJ24QGhKZT78u0FHhEA6T5Tr0rqAH9x2hHz+JC/mELJ4xU7LmPnVM7+u
	Aaw2BPgbd/T8PslbpGGpjpgKIbtGWDPKgwvB6yTibyJP7MpRQj9XXutch1HvI8fAhw+nrQ9ht6C
	GzCvUjQePrQFg/WaJ5Sh/ObiwkNJccZv344+z28Y+UNf+S8GJFQ8qz1pvuSltqjMn0pzs6NY60Q
	7hbO69sbfgnN4HEX6MPmgqnCdrZyrIdTfEDTwQrRub5Q==
X-Google-Smtp-Source: AGHT+IE1kSobyivF21U2b11KGtxcCjvRi7p3rr+R+RS7uDCxpPw8QK+rjeZvOZXB1HHavY3ezNQDyA==
X-Received: by 2002:a05:6a00:600c:b0:7e8:450c:618d with SMTP id d2e1a72fcca58-7ff664806c2mr10273618b3a.36.1766422172494;
        Mon, 22 Dec 2025 08:49:32 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93b441sm10813272b3a.9.2025.12.22.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:49:32 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org
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
	pjw@kernel.org,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	x86@kernel.org
Subject: Re: [PATCH v5 3/3] sched/core: Make finish_task_switch() and its subfunctions always inline
Date: Tue, 23 Dec 2025 00:48:15 +0800
Message-ID: <20251222164815.485-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214191307.184897-1-qq570070308@gmail.com>
References: <20251214191307.184897-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_084934_222060_39318C41 
X-CRM114-Status: UNSURE (   4.87  )
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

Hi, Peter Zijlstra!

Could you please help review this patch? The content and testing of the
patch should be sufficient now.
Link: https://lore.kernel.org/20251214191307.184897-1-qq570070308@gmail.com

Thanks very much!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
