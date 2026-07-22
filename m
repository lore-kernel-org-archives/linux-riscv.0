Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B2C4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxcAREqMXetrxkB7KbOLT4FoSD6BWsbz009ZZEDCGBU=; b=Yq91Bl1vXox6DW
	7DL7eOtPmU5a+62QbPvh83W58lnQG4q5zw2BJhscjVAxZG41+NXLFHQuUdHSyYCJZGn9YpEQHGFD9
	OkTEFtRhjjn17sppS018JYDUtQulDpcN0kvtwCueDIpwNuHvOvJwKvqVbuGn/E/1nqDLvcUG+/ILN
	syIXAhvt+km3s4MmzSG0Bre7rMzmxo8MN9AajGYm5pJtvdkgnuFcGAjY+EScToIjfFDd3RTD6TtgY
	9h9iM2iVUyPTh+SKRMaZ1ud4ANEctz94vYI0f11LOuvj3K4tKSEO/ZIGbAk6PsF3e3SS7wzgZlFp1
	piyDDFsQZymHJmwMaoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRkt-0000000B9qp-3l4x;
	Wed, 22 Jul 2026 07:52:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRkr-0000000B9ps-2Mcs
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 07:52:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIMICJOliSFh/mxIXRLbp9QNZQoXBr2mUObIuad0KMQ=;
	b=B7lH0kcIg6EepRauWvBylMJNh4OAV8/T/k0pAPME65n1yUJiledATEHSvGlUhi0NgYDZV0
	2SVDgUI0suEvrCabuYQGSwg80Tc5BrPNl6FOOMju5QSIe8LYRtzaaCpZCsWd1i5TPhOIHN
	23mLIX47ZhBKXVLQAGn06Syati7u7kKrg0yj907Tn2hpgNIgwqIICyDIve+hHJ4oaD/3r/
	nEOWNOKAcnpQNCUxQd2PdADpdBUhlQ4tOkC1KBJtvIu0UBnoCnT40r0dvhcA7jpSRa1GJL
	o+JJj400akiMTma3NFRJnLnkSQPigy4sKNZ+1X/x7amGQQW+nIVQrsNNmQkUbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIMICJOliSFh/mxIXRLbp9QNZQoXBr2mUObIuad0KMQ=;
	b=sv206CJj7UFmeFdeFrQTQkLDUr51W5u05R2KYjZ8zqypIH2kMfKzLqL2eHRiUXPkl/14Nt
	HENjMen8cPQIRtCg==
To: Rui Qi <qirui.001@bytedance.com>, linux-riscv@lists.infradead.org
Cc: Rui Qi <qirui.001@bytedance.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, Jingwei Wang
 <wangjingwei@iscas.ac.cn>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
In-Reply-To: <20260721150511.1607105-1-qirui.001@bytedance.com>
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
Date: Wed, 22 Jul 2026 09:52:32 +0200
Message-ID: <87a4rja2bj.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005237_741817_47341F91 
X-CRM114-Status: UNSURE (   8.87  )
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

"Rui Qi" <qirui.001@bytedance.com> writes:
> The hwprobe vDSO data is populated by the first riscv_hwprobe syscall.
> Some values, such as MISALIGNED_VECTOR_PERF, may depend on the async
> vector unaligned access speed probe registered by
> check_unaligned_access_all_cpus().
>
> That initcall currently runs at late_initcall level. However,
> rootfs_initcall enables usermode helpers before late initcalls run, so an
> early helper can execute userspace and call riscv_hwprobe first.
>
> In that case complete_hwprobe_vdso_data() consumes the initial
> pending_boot_probes reference, populates the vDSO cache, and marks it
> ready before the later async probe is registered. The eventual probe
> result then cannot update the already-ready cache.
>
> Move check_unaligned_access_all_cpus() to fs_initcall_sync. This still
> runs after clocksource_done_booting(), so the ktime_get_mono_fast_ns()
> benchmark uses a stable clocksource, but it runs before rootfs_initcall
> enables usermode helpers.
>
> Any async hwprobe probe is therefore registered before userspace can
> trigger the one-time vDSO cache population.
>
> Fixes: 6455c6c11827 ("riscv: Clean up & optimize unaligned scalar access probe")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Sounds reasonable.

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
