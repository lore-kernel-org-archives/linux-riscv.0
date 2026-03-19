Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53854108E1E4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFI89pcbTtGfLqF2V6sg3ICEx2yK4I/dR4hIlyPKPic=; b=GHkRZl4EtddLLP
	jEYSGEWQ7Pfen058q86LYk/vtRIWZP1Khd7ZKwQSmMPXBndWVITbEL4vM0JDeRnVaOiyQ+hfD8uwz
	AsC3RcZPx/movZKC6LJ/oFltNZATN88fIYwq++uS3ouz/eavi5rMAqkANxumg8ZTyW7aLmOAxrY1Y
	vLRuzYrErnBT/K8N5DghrE9IfswRJTzcUqFG+B+7LVCoybziKF04QZEnGxpdhMnr6k8tAPComM2rx
	7/lybK+FmS2HUI9YS3NBvNzyOjpryrEHyRnrn+MP8Tehl1EDrJfaJtJy6wH3ln9S2kxcBM2AXYfY3
	KgQYCH1VEbwZMudrKWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ak1-0000000AQW9-1RdX;
	Thu, 19 Mar 2026 10:36:37 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ajy-0000000AQVP-0s9N
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 10:36:35 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso748280e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773916592; x=1774521392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvZnxNdQMkwiTW3tDu7XCVsslkr30HbaMvbGALgZS0Q=;
        b=YezpFcEHbijf2okBwe9cPjbG7hs7fk/SHPVuUP4Q2vFtn+EkPg4q5dko/aMprVMM2n
         0XltjXtq5fGKTafdA3bCHnQ5covsJAWQqpEFTAJWRLVGIJeVxEfb2JqILua93lMMF3jH
         XSzYhVpNyvXdgF43Tjz/QUszLK95hPramRpupmBJwTFHiNDV6FaA0MoVSaW0hrwjETO8
         gmj7RsPWq9kvH4ItCD+XWawLw3Xlox6RFW5LE5hyas1SBkZ2gELbyl8oJAflwefyVFOI
         LSdvEVAbZ5Ydv8muemBv1hi7n2bFLUewsJVhl839J7J8Osm1KV/dmmSRXpnYYxND7gZu
         lh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916592; x=1774521392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvZnxNdQMkwiTW3tDu7XCVsslkr30HbaMvbGALgZS0Q=;
        b=qLriImDrz0rjNT0Fer5b7e2UAcKLOvpiQnmkwhfJmYpA4f9UXOFivI4y1kt1M75+qe
         IToVCwB+4vYVv+RdCNngTt6IqyxAa3Gld81rabjto7lcYaUHedGCyH8qLFunSVSSt3Nv
         pw2XO4sXMij+l574xf4Y/ROKAqhBGdmCXlJ2EQ/ByYR9Rl7d6T9CvwcRjeURDhOQIx8X
         bcgREN3/vl+xrckZulAMrbaCgx2/zyY4Sn1BuU3L4cMUYfD09hYgaCJsd71aAQKz6Cvo
         H1vsSZQcqd9Dc95Xj0fU6Y04CTN/ORN+GJhgYhRU3MXxdJtMfX9BL8+tdXEzdCvNdMW+
         MlWg==
X-Gm-Message-State: AOJu0YxEQ2nJ9C0MZ1pRBY0AB2nbcwWqXf+fqt69i4euc6XZ7lwrv7p6
	D6K1K0qNnvFCK4HrfClzh5nWqvBjGNIGVMDpqVrgvaTHFTsTYhzan01J
X-Gm-Gg: ATEYQzwpWvMNDWm0bdfKG77Mmgb3tUSHl8YEq7TE4mmkgvgLLaZUedi7DeZ8PqyU5kS
	VVncTZZfQSHmfjfkLoS8c/Q8IWOqChAiBki5Pe3nAW2oEGP6JfuwaO1ZhzbIox0rIjwkzrssb2S
	9gZA/MZqKf9EHaG2LYoypxs8sjn+72V/Axal0EvzjPy1nL3OpxlcDYy1B32uYz9Gh79c4X2AlqM
	IQRGVj+PIFbM7n5KdGCj5LHoRPY+8hvOscHPHKlQSfJ11QDfYZh6kQRZxuZcnHozcNVnamNqy0D
	xOydAenpAoikJ7aW0rEnEq+IBEc0yaWTKJTCZa/1YUs3XxSw+OYfv1lrZdLC0qGLnj+TobB99Tc
	k1ExYyIC4KkqK4q85CeQvtcHRgq90KmKgHkU1B9dqR7c3ouQoM0cI3KrsimtUVab4uI7UBMuVmI
	4Fwh3hnGfyR5q1SFwJwTA27HfLDBD0pW8ljY/+Bbg=
X-Received: by 2002:a05:6512:1193:b0:5a2:7c1c:749 with SMTP id 2adb3069b0e04-5a27c1c088fmr2333426e87.39.1773916591523;
        Thu, 19 Mar 2026 03:36:31 -0700 (PDT)
Received: from imamay-pc ([46.73.133.192])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27575sm1120034e87.17.2026.03.19.03.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:36:31 -0700 (PDT)
Date: Thu, 19 Mar 2026 13:36:29 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260319103629.by3bw3qeev26jvqq@imamay-pc>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_033634_270114_3851E04E 
X-CRM114-Status: GOOD (  22.38  )
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

Hi, Himanshu

I have been using your previous HBP implementation for some time and have
encountered some of its shortcomings, which this implementation has also
inherited.

On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:
> +/*
> + * HW Breakpoint/watchpoint handler
> + */
> +static int hw_breakpoint_handler(struct die_args *args)
> +{
> +	int ret = NOTIFY_DONE;
> +	struct arch_hw_breakpoint *bp;
> +	struct perf_event *event;
> +	int i;
> +
> +	for (i = 0; i < dbtr_total_num; i++) {
> +		event = this_cpu_read(pcpu_hw_bp_events[i]);
> +		if (!event)
> +			continue;
> +
> +		bp = counter_arch_bp(event);
> +		switch (bp->type) {
> +		/* Breakpoint */
> +		case RV_DBTR_BP:
> +			if (bp->address == args->regs->epc) {

> +				perf_bp_event(event, args->regs);
> +				ret = NOTIFY_STOP;
> +			}
> +			break;
> +
> +		/* Watchpoint */
> +		case RV_DBTR_WP:
> +			if (bp->address == csr_read(CSR_STVAL)) {

Sdtrig spec (5.7.11 and 5.7.12 in the tdata1.select field description) states that:
"There is at least (!) one compare value and it contains the lowest virtual
address of the access. In addition, it is recommended that there are additional
compare values for the other accessed virtual addresses match. (E.g. on a 32-bit
read from 0x4000, the lowest address is 0x4000 and the other addresses are
0x4001, 0x4002, and 0x4003".

A 32-bit read from 0x4000 will definitely have compare value 0x4000 (the lowest
virtual address), but may also have compare values at 0x4001, 0x4002, and 0x4003.
This means that a 16-bit watchpoint at 0x4002 will fire on this 32-bit read, yet
stval will be 0x4000, and the current hw_breakpoint_handler implementation will
not detect it.

Therefore, it is important to check tdata1.hit bit (which indicates that the
trigger condition was definitely met) and only use the comparison between
bp->address and CSR_STVAL as a fallback (if tdata1.hit is not supported by the
hardware).

> +/* atomic: counter->ctx->lock is held */
> +int arch_install_hw_breakpoint(struct perf_event *event)
> +{
> +	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
> +	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
> +	struct sbi_dbtr_data_msg *xmit;
> +	struct sbi_dbtr_id_msg *recv;
> +	struct perf_event **slot;
> +	unsigned long idx;
> +	struct sbiret ret;
> +	int err = 0;
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));
> +
> +	xmit = &shmem->data;
> +	recv = &shmem->id;
> +	xmit->tdata1 = cpu_to_le(bp->tdata1);
> +	xmit->tdata2 = cpu_to_le(bp->tdata2);
> +	xmit->tdata3 = cpu_to_le(bp->tdata3);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
> +			1, 0, 0, 0, 0, 0);

perf installs breakpoints (via the call chain pmu.add->arch_install_hw_breakpoint)
during context rotation after a perf_event_open or ptrace call finishes.
So, if the hardware does not support the given tdata1, tdata2 and tdata3
configuration and OpenSBI fails to set up the trigger, the kernel will still
report that the breakpoint was successfully installed.

A probing stage is therefore needed  before or during perf event
registration to ensure that all breakpoints can be installed
successfully during context rotation.

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
