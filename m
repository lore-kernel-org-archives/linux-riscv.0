Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7555CD5BDE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3XnIJPgPn7tRcGkq1aTKhiD5KsSsNTS6NTS4dDjgS8=; b=wgP2lVT7cMi/5h
	j75lQ4nPMv7ZMAeH0sQaElMa0R69dzElv08UiAStzdgDrn+5Xc0VDZtQmB5xEqZD9bBPKFqi9yPor
	EXvk9N93q0XxelLpnOlbt/Q+SgMceTDLufM3a/q0CzOY4Hh2lqlWHNY4rW8bc56solSSxUzSAv/kK
	Yldsdxce0zvXKMTYWXPYO+uADkpE6KOFl1y6hIag+xbxNiMkYATf/q6Dubxo4aa9uEFRIg9pHTuAP
	xoy/790q71bWnbQlLM00yqH9GoDlIm9RJafGGmMgs+VaPO8EnaNL7aW0KLMis2wjaTYlmuGk1KiEY
	WXROGf5+hf9zV23MrcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWAv-0000000AR53-2gAk;
	Thu, 13 Nov 2025 12:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWAs-0000000AR4G-17Wx;
	Thu, 13 Nov 2025 12:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57FAC44307;
	Thu, 13 Nov 2025 12:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71383C116D0;
	Thu, 13 Nov 2025 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763035896;
	bh=Re1je7zQc+x3bKvtwuM4wZn4KGHoRXGn+zQBODkxr50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hv9b7xs+9rTAxcmcEMkcl99qjgmEvtnz2aJ3Saur/UfhHxxrkaBy2g8C300bh8nru
	 eQfDbA9ZEeOHpSdfF01cV/KZCH8JdeuFkvXDaRvDaT6Eo8X4yKsuMf+1wHdypIhfzn
	 XXOHkGaU70hqlYrL4zixPenh7EnlGHuE8M+TrPHJ9xI61zc6KNX3G6u+ILDB9tfyY/
	 bcyicslf9h/3vfr24u01+x4XoYfoCArW2OHycxLZYcPVtHzzMtxIskvnkASLKnY/bQ
	 czf8HF7tr144ZO+8k1Elc0hVLdFwJpist64JRgnwZmnKhPThRE66/0JkXsemQ5CcFt
	 Raa7YHyDBrT0A==
Message-ID: <ef9b57ee-5ea4-4ce9-ab9d-02502c410630@kernel.org>
Date: Thu, 13 Nov 2025 13:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
To: Xie Yuanbin <qq570070308@gmail.com>, tglx@linutronix.de,
 riel@surriel.com, segher@kernel.crashing.org, peterz@infradead.org,
 hpa@zytor.com, osalvador@suse.de, linux@armlinux.org.uk,
 mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, davem@davemloft.net, andreas@gaisler.com,
 luto@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 anna-maria@linutronix.de, frederic@kernel.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 thuth@redhat.com, brauner@kernel.org, arnd@arndb.de, sforshee@kernel.org,
 mhiramat@kernel.org, andrii@kernel.org, oleg@redhat.com, jlayton@kernel.org,
 aalbersh@redhat.com, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 baolin.wang@linux.alibaba.com, max.kellermann@ionos.com,
 ryan.roberts@arm.com, nysal@linux.ibm.com, urezki@gmail.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, will@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
 <20251113105227.57650-2-qq570070308@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251113105227.57650-2-qq570070308@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_041138_347611_DBB26A4D 
X-CRM114-Status: UNSURE (   5.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13.11.25 11:52, Xie Yuanbin wrote:
> This function is very short, and is called in the context switching,
> which is the hot code path.
> 
> Change it to inline function

"always_inline" here and in the subject.

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
