Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E932FCF11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSEbMxBdES+k4GYfqofqSRDHUofVLVE87w4E3pR4zC4=; b=0YW6V/YPZFpOFr
	ebEbsJeRQMtzLkZ7w4b55ZAGIL8WmmzZ3zPaqn+PYB+OJ69QT3sG/0NXQ8UGDSLp+Fs5jxTkqL1KO
	ezxWs1b9YhmszgwtcT9sbzvUOnYeWe6qzsP/Opq0gKhv8FpFhERJgIo7LjOiUqmTfohEcVQZ97lah
	5aRpGrNsW65C0lzHS85+UfZSpQYUFC8p4UwhpO+P8wt+KQ62ulASemjgSJsJtYPgmoARHiwvz3z8l
	PQIk0Wbf+bIB2FqghXxqNgkvwX9Cso/8UfCtGn7QxM4SO1zcOIDAe2EBwdKtLpoH2BslGiPm4qR1b
	D//+lY66GA1RZjstLjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysW5-0000000ClHE-1HLS;
	Thu, 10 Oct 2024 12:43:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysAO-0000000Ch7A-2WUI;
	Thu, 10 Oct 2024 12:21:20 +0000
Date: Thu, 10 Oct 2024 14:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728562873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kZuBpACaIGf6sO1p3qo3UuoGLZQPpP9DFEKWVKFprY=;
	b=hfl1BcPolanyamFJPfmUedMfaXGy/TqA2beboaqyBseEtudxma+nu1+qeKcnXcDKpJH2fY
	Z0CUwGdh/J41idsFvJsNTwZc+pHsKxqdN2I+32rBdyD/ObPbRPnHPBdQeST0nLQ5XFmwkl
	t7oouocZqzAMizi+sF5fzDnUzcAshwKSZNvNhC/IkNiMmtRHCcTudi6oKy8ndo+7g/vzmY
	LIqa053QkFfZ+Dd1i+jzXmCkP+96emkbHjlDSrz2a3pfXB2x1nzhICtYTmaPnNXI29Dt8j
	lhgJvyxMLLCaefphiSWPAQixpg+v8kqAGI/Va7fRXHy4gdT8zaq9Jxx9lap+bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728562873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kZuBpACaIGf6sO1p3qo3UuoGLZQPpP9DFEKWVKFprY=;
	b=NC4Dc6arP8x72ULzTxCnxc0QBApm3EMZxBsEKzG+RG7zCUeO7vgmxam3df2imfdLSBP1jX
	LoyG9j3vP/zorzCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: namcao@linutronix.de, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
	aou@eecs.berkeley.edu, bp@alien8.de,
	Catalin Marinas <catalin.marinas@arm.com>, williams@redhat.com,
	dave.hansen@linux.intel.com, mingo@redhat.com,
	john.ogness@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
	pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
Message-ID: <20241010122111.BKz_RSCv@linutronix.de>
References: <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
 <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_052116_808440_573F73B4 
X-CRM114-Status: UNSURE (   9.66  )
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

On 2024-10-09 09:44:59 [-0700], Palmer Dabbelt wrote:
> 
> and it breaks my boot test script.  Looks like it's actually working mostly
> fine, I'm just not getting the "reboot: System halted" message that I'm
> checking for to make sure the system actually went down cleanly.
> 
> I'm not sure if this is expected behavior in RT land, or if we've got some
> sort of bug.  It sort of smells like we're losing the last printk() line...

Is it just defconfig + kvm_guest.config + PREEMPT_RT on "-cpu rv64
-machine virt" or is there more to it?

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
