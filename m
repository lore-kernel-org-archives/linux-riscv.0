Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC1CE8D76
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoGafy4t+zGRoS59fh7tH+WWK1EVCyyR8W5HRHRQeyw=; b=xi7YjdARUXnr99
	ICnXMFHduvab0dt+D7sT08ZnvnYbs8hHc8AUP2PBox0YKO9bka0wE2hc/iXQpz3+Ks5O7OR9y2JlK
	pOD8Rt/gLgsg3MV3lhvIeAPCCfWRb5Py2MCCfSbLtNcDfzQKXMLsloYatSe7cvBD+Bfqy5luFl/GT
	oTI3TVYepS6m73QRnqqEqcHWzIKfk9RGxVa6O4qJY7CgxJlWDfFckvlAvWDH3VvlX7FGWGe7lkAmG
	urn5XE5f0ntCLyemUZYRLh6NuZy1uiLJ0FciBhKMLXPw2+kq+2Bxg+mpxqQBeQV3+nj2UUwdJ1MEr
	FZUNpsyWQJsfiWdIkJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzgx-0000000D1sc-0xRU;
	Fri, 14 Nov 2025 19:42:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzgv-0000000D1sC-0HUL;
	Fri, 14 Nov 2025 19:42:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763149358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3IHvVsPgDGgh4gxhht7IySilnSlK/VxUegrc5zLH3s=;
	b=tmPyGoi7m3AvXW/CX/zMIO65G7PyvJBKlfJsuix9wfjHJzRrlPqkABvOvY/bnCHnFo25uZ
	bTshnIsTcLeD762ltXy4fPtS9qdVymcUCVK5rnhpml6p7kTZIyWUea+nnu7etMEn4pmT81
	pSRtqWXhJ5DBoRpqzkIWW1J5kGdVedX3ZdHA5ql6iyUZKVWPVqr5OjW9tkfrVcZU9L4uLa
	zyZ+0aaDclAIzRfBjodzfRR12J/YeUpdD+u3b3ntB+1xhMBaJVgUYVIHIMT0jvyPpIteWG
	JppPfjJyfhN6nruv3z7JJCQI3f05RAdUgdw1S6qmKgbsYTtMC2Ti7y6nkdeptA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763149358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3IHvVsPgDGgh4gxhht7IySilnSlK/VxUegrc5zLH3s=;
	b=qKiOV8Nu3bAHinKQUQaPR+3NsLwHyKY+LCxDv7LI8tochAdFWOuv24biMTpHainD+blGhr
	EdHuyMKEyEMqSJAQ==
To: Xie Yuanbin <qq570070308@gmail.com>, riel@surriel.com,
 segher@kernel.crashing.org, david@redhat.com, peterz@infradead.org,
 hpa@zytor.com, osalvador@suse.de, linux@armlinux.org.uk,
 mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 andreas@gaisler.com, luto@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 james.clark@linaro.org, anna-maria@linutronix.de, frederic@kernel.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 qq570070308@gmail.com, thuth@redhat.com, brauner@kernel.org,
 arnd@arndb.de, sforshee@kernel.org, mhiramat@kernel.org,
 andrii@kernel.org, oleg@redhat.com, jlayton@kernel.org,
 aalbersh@redhat.com, akpm@linux-foundation.org, david@kernel.org,
 lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
 max.kellermann@ionos.com, ryan.roberts@arm.com, nysal@linux.ibm.com,
 urezki@gmail.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, will@kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
In-Reply-To: <20251113105227.57650-2-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
 <20251113105227.57650-2-qq570070308@gmail.com>
Date: Fri, 14 Nov 2025 20:42:35 +0100
Message-ID: <878qg8bduc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114241_246037_96777326 
X-CRM114-Status: UNSURE (   4.60  )
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

On Thu, Nov 13 2025 at 18:52, Xie Yuanbin wrote:

Please use the documented way to denote functions in subject and change
log:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

Also you make this __always_inline and not inline.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
