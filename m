Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAC5CCFA13
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKaGcKAvwGH7lRi1SpK16xSqBvXj2RH5ftAuGgzPDLs=; b=bv/ZOIyKkilBE7
	doXfl7CHafDv7HqCJAvUhNKwOVaTKgirnvfl/lpt9O8vLoRuP/ef7TxNohqGwxd0rHTtILcIuh685
	jsrrH57sqIcRw0hN4M4gDUF3bCPUkv7JK2qrv/VIqUt7exnBNVIP66K1tTH3wIL8aWEhHht9gcbGK
	ZJkV86/P0vWLPjf9Koi3D9672oehzQlTb4yJRBH605lFyNlWXj8IdAdNNum11arC5yVQQgnPBpJoQ
	SK1bszFl5R/9Uq4Zr8pgwcbgRDeDHRRvKORbNMbXpCPiXD5neCrvoQo0RZiVLY1CYN6jYigjTeVzW
	nR4x+TiTDn1aibsKhePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8qB-00000004B1y-0tg4;
	Sun, 09 Nov 2025 17:04:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8q8-00000004B1G-2xl5
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 17:04:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29586626fbeso18755595ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Nov 2025 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762707872; x=1763312672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K+T0yvpGk3Q2IrzYuDGX8XEZi6W9MmpXSWX8qogLWs=;
        b=b85Ho4xpj6kEOunxKNtCnfLSjIel6etFiYcbw4Wrzy+Xj7Mr1uKX9V/q/wziJoBfn3
         HItZ1fCBk6yt9pALVj0YylGRaWydz/rXc791hpDL0e6b8gkLuL1aI5s7U8bTYUbEPewp
         B1fbUgtSWoYyR4pQ73vnhPt1x+zRbVCnu+zmnw0JZIL56l3M6Hgqbz/oqphQ9rUDw3os
         LhFHqg9ZT8aqK/sXvFuaEWPTlb+NdGmusVBsiCDfKwkdNRTyjSI/esHAsMA7mN2lXIug
         95EfnS8+iqf3SCv4LJFDX8YZtPVv3rAN5tMz2K+ufSKUBalc4mynaoMFalzo3mTnfueN
         ZaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762707872; x=1763312672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4K+T0yvpGk3Q2IrzYuDGX8XEZi6W9MmpXSWX8qogLWs=;
        b=oSAsS6iZ1UJbqR17gXsWMBI5FOd1gGWRe52LxZfLCTTeJ4sgbZ0tn0HRlH/7tSTzhG
         LvzIiLO7fe+HKbXku4g6zVhvJMGGHzEDVWYhnYz29sZgJvNVGhTiTlmtO4KDDdY+wOTj
         YgD/9TlKTBJYJ7AtFE+pEweZpUL4sLnEXyV74IBHdN6sx9X+CdSOT8AZ+Ww72PoIHDol
         cbpBvAjGge5m/G33UT3IfQKoVN7Ba6r5Q0ZcwOMvFXuklNVq08fGA/x1g6pmF5yhZ4XX
         YgzhatHY8jnwINwTiGXQ2p+ez93lns3q0uf2AAbLtEIrNG2KapKQqwcrQ0SKqpZFFPHD
         bPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1o8Oi8jm/Sw3To+KDQXWC9chpP3b3+vPC2mdRi2J3yDlQdRNU/rHbDi9wICKqup0VbgIBujFx62svg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOc0NchsZn7OxlpzlIhdU2vbUdYX4iycLMfMI9jh7PYHdx13v9
	fAXHJdJrGElS06otk1tOO21xu4KEwDK3+69OFpwbgDBpG37Cq3ux8nV5
X-Gm-Gg: ASbGncv7R501qdil4K9OXYmgnpwqd2UTHyhmQBHGAD+JBURaiegC4BN09j60xvIX2tZ
	jNijiJ1EV7lVIs+th0biqTZJJ9fULEFpyXAOCP5IpBYRibZ0u58PuKJwIXDV0VlHJOwedMUDrF2
	JQU4QgWL5keu8Ecgp4jSSZRTWfzNxKOiIaUcE/0pjMh4O8rS4ln3YZInA+oFrI5WpfMiO6eM8jk
	dLNaMdub77eEopzcDNbcnm3ml461/DK/4FVUHTd4DM0ROQfy0NwYR0bsx0rcairjYXZ9w51lbT0
	GNYEt7Wvv3LIfK8fxoAREbptQVjideBU2nyNWb1It5JC0GAeHhWBP0CIBpZXG/NgKkPYO03d9e4
	xvoc9kMtatr+WsYZ8MgLp0Kx1+jhYXA13ZLD0s7Qe5ZcHcj3jtvDtu5RQBeHZsxrdqT7dEx8y1l
	8mLLunrw0wV0oxRdfHcc+t4z2yIUstEjQl138=
X-Google-Smtp-Source: AGHT+IEO5xU3ShKvIQJG0EYcsf90e1JVTbxU34yk/YUYIZqWcpmJ8G9BchXReIw1drUaTkP5NUMmRg==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr71705165ad.36.1762707871570;
        Sun, 09 Nov 2025 09:04:31 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968253sm117879105ad.20.2025.11.09.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 09:04:29 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org,
	david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
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
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: Re: [PATCH v2 3/4] Provide the always inline version of some functions
Date: Mon, 10 Nov 2025 01:04:02 +0800
Message-ID: <20251109170402.145012-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251109113152.GA2545891@noisy.programming.kicks-ass.net>
References: <20251109113152.GA2545891@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_090432_748567_59E764D1 
X-CRM114-Status: GOOD (  12.40  )
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

On Sun, 9 Nov 2025 12:31:52 +0100, Peter Zijlstra wrote:
> There isn't a single function in the entire kernel with an _ainline
> suffix, while there are a ton of _inline suffixed functions.
>
> On top of that, this function was already marked inline, and your
> compiler just chose to not inline them for raisins. Just make the thing
> __always_inline and forget, dont make thing extra ugly for no reason.

Simple test: "Make the original functions as __always_inline" VS
"Add the always inline version of these functions (with _ainline suffix)"

compile as OPTIMIZE_FOR_SIZE: the size of bzImage is same
compile as OPTIMIZE_FOR_PERFORMANCE: disassembly of vmlinux is same

Adding the always-inline version of these functions can provide better
guidance for compiler optimization, but it does indeed lead to more
complex code.
The best solution may be to prompt the compiler to always inline at a
specific calling point through some keyword.
I noticed that there are also people discussing this issue on stackerflow
, but it seems that the current compiler does not have such a feature.
Link: https://stackoverflow.com/questions/14571593

I have no objection to either option; it depends on the opinion of the
community maintainers.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
