Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03118CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpVm0FTw4QUUi+UoXaFzh6+mStVsAsaYOWeZ0uJiYhQ=; b=0si0AydETjz2ok
	HLyMq+uZ//m9C9et6X222bz8P015lBn0z5K1G+po/JLLmWvvErYzh8eDK7dzIYTWvSiW5V7Rui4Lx
	MC33oR+oySd488FMSlx4B9MotnP59pcEluc8sR7pqP0yaGBR7XaXiNNJKA2U1QMF1WmaKs2drhKqo
	/Wdvvz8VQQ3R4gXbTHPUCZITrlNjiiLeXxPawEsqRYET2r/oq8R9cYz84EpvxWJLHLg3KYWU2IafE
	AglS4280pOsPr5FsBYVkvfs2EB3IrpitlOnM9fXKXrODDGxOtqjMVN+m316hgRL6otIuFHn17QIyJ
	NXmRBu+qi3a8BHmOVSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCiCl-0000000Bbfy-3YLF;
	Sat, 25 Oct 2025 17:37:27 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCiCj-0000000BbfI-0Pt4
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 17:37:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so1158147b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761413844; x=1762018644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W24fDmk9KGuj2UH3C1cIlrBfOFLoZl/lXv81T5OGdqU=;
        b=TxWQthhjBodWFfEOu+MTnb+BYsdS5z7p6QMWUsahSJY6duqqvVQ4xXmz0k77bMs4uZ
         4CATrLhd5cfM9OHK4tFfPeIp/zEXcv/3GSEBzRkyQ0YNvc49UW8afnrTPqioPA75oBPt
         zpVLyZ9hLMBql74J3TjTvBn+lcpCWELwvAyHWmKLGeY4cC8eFIFL28uq09CV5Pasn01U
         axQY9LkH8CCHo/x63S8k8TiG//bTxdCzhz3ZOBMYkjjTNvMJuJWEZdAnxNLr/sEOGHeS
         yEIdXJNvEMmEUGFG4c5URnKNOyN1mmHAS+kpilZtjD/qetauFVqzXvQs4U4LlQSMoxw4
         AlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761413844; x=1762018644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W24fDmk9KGuj2UH3C1cIlrBfOFLoZl/lXv81T5OGdqU=;
        b=cW/P70VLrUDorTPDa+JC1shdKUTvQ3BnIkOTSKB4ytCEO7E3/4hN6NegQMtpOrjkJk
         +F4O7vz15PWwEhFq5qDijE15geX0zvXQWy6mBnwSYAl2S+tZC58ZXbsNkk/JMMsfV6U7
         nZPPj+pV8bYqLxX2UqMAMHE4vzraFMYk7NaVz/eUZIP8V0bPc6ciGF10adpfozTuAzq1
         UINgZ1IQK1WTii/B7DBrlOQthGIz30cQJ1QVFYhbluJXWKqBJG3E9yXT+LO5sq5t+uL4
         PZaUfxOEwT15Z8KZBYP194vKHFUeQ/JRkG+6aS8xh1D0MxxJ87/sc3LjRDwXjVXiIDKy
         JUVw==
X-Forwarded-Encrypted: i=1; AJvYcCXp+V3tWuy3xEA5mA0pGbfFdcj5iaKBtWnvw37kEVgGWjCI/THbiGdydW1m+WAZXMScSzyuJwe5E+JBcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcaq14++7pPoQT4Vkoplw7COmXcOEHQxUWzEAnsigp/rE1hSM2
	ahVjmK9XKyCnDwxl5G5PowKz+m7zENQUzvaiJZliZYXy63WQ+BvcgPVL
X-Gm-Gg: ASbGncsqufbofbPw18FkCdLGiYcpWqhdI2Pi5Dy4NJELvzR6UMvQZEVY1nC9K33+/zO
	07a6PQNEQKtCiHwosammepPn6uEuaeahZ8hVsegCqNtvPuLWMxmfMzS+nf/09AD8fF+IYPvJUt9
	sooATD9W/WwLbhUJIPSts4iKgenIiI1MljNxqeSeUUVhTqIboWZ6PZKQEcPKdWk68HOl5bRkrCd
	oljHeA61GsWBiHUku0iM78I0dZnqDtvC42VJd9lCEHmQ+zSMSAXQLjTHJCNmq1zPtfAqgJoDKrM
	bY5w8Q8fYc4cKwLkanDzEJH5hGd2XC+KRhY8iCiH7gTWkN7jGRYYNqlAkNPn31DvvI0ASt6d1ZQ
	E+W/B+I7ha47a4WkgOlKI2BhMRjFO7lXQL2tEuqx9eTKrrJSYkptmP1AExqn3dHzRgL2eUB1yo5
	l24POoKGP96eKO9I6VYHGx
X-Google-Smtp-Source: AGHT+IG7r64b+QFeTKdxScX1JEZBuLYNZKVtVxJcQwnEV/Y6Xyj7YdsojGm9RYGUWg1kr834PfcIZg==
X-Received: by 2002:a05:6a20:7344:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-334a8649ed5mr43587422637.54.1761413843895;
        Sat, 25 Oct 2025 10:37:23 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm2656018a12.5.2025.10.25.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 10:37:23 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: riel@surriel.com,
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
	peterz@infradead.org,
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
Date: Sun, 26 Oct 2025 01:37:00 +0800
Message-ID: <20251025173700.754-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
References: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_103725_141364_AED8389B 
X-CRM114-Status: UNSURE (   9.12  )
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
> Also, what kind of performance improvement
> have you measured with these changes?

When I debugged performance issues before, I used the company's equipment.
I could only observe the macro business performance data, but not the
specific scheduling time. Today I did some testing using my devices,
and the testing logic is as follows:
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

On my device, these patches have very little effect when mitigations off,
but the improvement was still very noticeable when the mitigation was on.
I suspect this is because I'm using a recent Ryzen CPU with a very
powerful instruction cache and branch prediction capabilities, so without
considering the Spectre vulnerability, inlining is less effective.
However, on embedded devices with small instruction caches, these patches
should still be effective even with mitigations off.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
