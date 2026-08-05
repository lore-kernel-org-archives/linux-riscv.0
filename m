Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDC5C55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMfKo8jgtClrzpJFl5FKc6vTaw9YgdRDG0NlynLphjg=; b=FUdHc6/OZUJWCi
	jvyQgZq4jZoz9byA2eoVJ9VUpmEMsKwrD6FhM8Z8f9FjVOkJxH8KxPO+us2vS0itAuldFIh83+BDR
	QnTQf9CB0cKaOi1a6H+hOkOkkOJ2JQwRDB9Ul4fOKM6mpvDW9hcYb5RGZ0ckrFUxIBhJ9GPc5pjrA
	OwiIkdsTS2PUB5ZiRVkzX8FeUc/1ERVvqC+XcQfK/Ly4AG5EjrVgsZzEpXP9ilKL1MAR9zJ89/Cvt
	fJI9RUW+y0XO6YCS7eu2ofO+VD5fOT3cXynLcsNIx4kZFa8/v1N3tDxUdOwkBDLnqowhU+8F0lvEO
	G3nZzuVWWbW5feERjv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbYc-00000003zFQ-3Pp5;
	Wed, 05 Aug 2026 13:21:18 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbYY-00000003zEZ-3qdO
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 13:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785936064; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=vVvxj/WW/DMjYIOr6TBPnL4uKTl0YgWQXR0OuDSiAtI=;
	b=DC36NyaRw4qHzkF7SzUsZDagA8SrRH7BktTBZE1bf5XHRUuYkRzUKGbEOXQkHs6kwPVEDzXPVX1yvD3LHJZPcij3VMmNyJA9DuVMl68tz/C01E18PNo+2NQp2/2No1kkp/o3vopytbQFfoJ1yiu/zWe6oBK6M/4bZabtKm9yU1s=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X8RIxcf_1785936059;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X8RIxcf_1785936059 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Aug 2026 21:21:03 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	pjw@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	thecharlesjenkins@gmail.com,
	jtaubepe@redhat.com
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware break/watchpoints
Date: Wed,  5 Aug 2026 21:20:54 +0800
Message-ID: <20260805132058.884-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com> <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_062115_483369_485013AD 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Himanshu,

Thanks for the series. Two small observations on the tdata1.hit
handling, based on my reading of the Sdtrig spec.

> +			/*
> +			 * Prefer tdata1.hit from SBI trigger readout whenever
> +			 * possible. Fall back to address-based matching if HIT
> +			 * isn't observed/supported.
> +			 */
> +			raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +					      *this_cpu_ptr(&ecall_lock_flags));
> +			shmem = this_cpu_ptr(sbi_dbtr_shmem);
> +			sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
> +					 i, 1, 0, 0, 0, 0);
> +			if (!sret.error) {
> +				tdata1 = le_to_cpu(shmem->data.tdata1);
> +
> +				if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL)
> +					hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
> +				else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
> +					hit = !!(tdata1 & RISCV_DBTR_MC6_HIT_BIT_MASK);
> +			}

It looks like the hit bit is read here but not cleared afterwards.
The debug spec describes mcontrol.hit as:

  "If this bit is implemented then it must become set when this
   trigger fires and may become set when this trigger matches.
   The trigger's user can set or clear it at any time."

and for mcontrol6 hit0/hit1:

  "The TM updates this field when the trigger fires. After the
   debugger has seen the update, it will normally write 0 to this
   field so it can see future changes."

So the hardware only sets hit, and clearing seems to be left to the
trigger's user. Without a clear, a trigger that fired once would keep
hit=1 and might be reported as matching on later unrelated traps on
the same hart. Would it make sense to write tdata1 back with the hit
bit(s) cleared (e.g. via TRIG_UPDATE) once a hit has been observed?

A related minor point: for mcontrol6 with tinfo.version > 0, hit1 and
hit0 combine into a 2-bit field (0=false, 1=before, 2=after). If only
hit0 is tested, the "after" encoding (hit1=1, hit0=0) might be missed
and would then rely on the address-based fallback. Checking (and
clearing) both bits could make the hit detection a bit more robust.

Best regards,
Pei

-- 
Chen Pei <cp0613@linux.alibaba.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
