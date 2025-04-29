Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D3C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 06:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/PwITPVog8grRoew8ccYXSaO9Dt/utJxZWJjgLsKfs=; b=22DHOG5vSqwv83
	z7CzD7eP2uzUompM/+h3GRw161w+YJw+LQA1BMECBygMGVjInN5bw+yfu0M8wr/1Yx+brRKVEd4qA
	S2Nwk0uQfdCug2o/HcVo2CkIIebXi4bxpQ6fkH4u124xh577mUM0FiUCYwfigJEWAo1SjJwvx3uPg
	qLygaN9ZY9BP86db7GGzObUwpwFTK8/fQP6udn8WdfMgDxUdlx5SmYOfeeG3RoXue4Uxlq6U0M3/D
	mZnSC34yXDTTzXBK8IVCGHfgvZrjrxUxTTpngY9UQ5gn4kbgwriVA0OvTuiIIztlRIV9z3gsB8K/T
	3lBe9Q2YfgdcPDWQQ6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eWP-00000008aMh-1PF0;
	Tue, 29 Apr 2025 06:32:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eMi-00000008YDw-3gFJ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 06:22:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745907764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PfLmHnwY8ZXEOsYbbVJ97ixKv/+/pNFlWhDjGPZV0X0=;
	b=hfCoNAtXzAVfQidb26BP0lKQSh2195S7soqRj6KUUzf9DiZNJjsQI5GsDdC0iaQz7WVqrX
	GWX4zEc9F9sfXx+O9mBmWDLMVMe1FdYlYUhyFoiQExlc8uoFdhqk7HX52MXR7gW+LpDffQ
	ZyHhinw7Go1rN6dpWvd42wvuYMJUbKTKtXY8FFXFgqfMAUhye9oShUJxpIahq5nyZM3Khg
	l4g1okocmC2G1T4pwt53bgmiAOZTQn/pXawLGQduh1ld682nqJftGLk7Lrqd7lGp2ky6uh
	Rti1DRK4H7cAzNNry5vvONaclcPdjuX8+h4KPr2ohMI9qf+cAiU2NPI5hC3nEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745907764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PfLmHnwY8ZXEOsYbbVJ97ixKv/+/pNFlWhDjGPZV0X0=;
	b=QUebiwN640dbdSwxBbXtKNIRo5ReVVztAjTPJCU7kxyTPXe2EAucUCM2oaHaxJtmI1m7Oy
	wGcTWG70DVjZZWDg==
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
In-Reply-To: <aA_5IGGvXqB7v_EA@ghost>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
 <87frj613kz.ffs@tglx> <aA_5IGGvXqB7v_EA@ghost>
Date: Tue, 29 Apr 2025 08:22:44 +0200
Message-ID: <87a57zqyff.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_232249_361800_7281B21F 
X-CRM114-Status: UNSURE (   7.56  )
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

On Mon, Apr 28 2025 at 14:54, Charlie Jenkins wrote:
> On Fri, Mar 21, 2025 at 10:22:36PM +0100, Thomas Gleixner wrote:
>> 
>> This looks sane now. I've bookmarked it as post-merge window material.
>
> Has this been applied somewhere?

Thanks for the nudge. It indeed fell through the cracks. Tending to it
now.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
