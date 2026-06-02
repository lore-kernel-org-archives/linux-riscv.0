Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A135CCD5BD1
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWT6aFPXFRC4USoJM1r5lgvpHwldtvXQAewGJObzWW4=; b=E/7RdpZKO/lHq6
	fQ7VS7LAcLsD1NiYRAQ+b5Hdk5niJbCq4YugcyWsGVBTmOeLRZaF7cblSthaQ5EfiUvltnPUAC6lo
	63vCEPkzxstKGXp6DFw76uNz/zT1wn0ttcMceEC87GfS4saLMU5IHrmlP2bGdHlOOxvRe7hm02luA
	bua/zFIi+2AIq86XkKZ0k3AOs/CVxTD12FgINgXnD4br7r0oCjPxMFqHQ6Y10b+XmRjgSHM9KgiQB
	NTxOpwiDkznec3VGzF1zcUxClqkm+plWEguG1Wmu3dc/Ybavf3Y3WXIrUHXt3aL+KYJuRk0HkFOg/
	Om+jysw98m7Q+GUxt2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSb7-0000000DXyd-1A31;
	Tue, 02 Jun 2026 17:08:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSb6-0000000DXyE-0ZdM
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 17:08:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6548B60120;
	Tue,  2 Jun 2026 17:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E661F00893;
	Tue,  2 Jun 2026 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420091;
	bh=3M0vc+nnyZUAtCakqX25nvCIWIKoTxj8AwWEe+bdm8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZnowGirIqJXWMIvwon10ID8EtU9ssuP9ICXRzhuOlVx89jK8wFqoDvteFmHS9KDh
	 E/z1KcDLeUR3zksorVBYqnA2wBMJcNpoTTm/GgaXO47EzUu2mIKYr3V5qDxBvia7nw
	 oF9kiaJYruPpDb19VyYLI0Nnjb9BMqFWhcRHhy7PghnPvY4IQyHiR9Cr9Lsv7VVP3b
	 /LZe7pmbipLvrVGKcSw3O5ka56Yb9ujEUi5xVi8KZJCtxTdE47JDFyf/EZVfhwP/9O
	 rGt7NCqeh6vvAZGbxCkIoksIJwENaE/R8Lrqdnl99CGtRimRZWGqqtTeDLxAuXCpdd
	 U5CSY4O9wwgyA==
Date: Tue, 2 Jun 2026 10:08:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Han Gao <gaohan@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH V5] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <ah8N+UThw4JnOdDb@x1>
References: <20260421143154.1590156-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421143154.1590156-1-guoren@kernel.org>
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

On Tue, Apr 21, 2026 at 10:31:40AM -0400, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Yao Zi <me@ziyao.cc>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
> Changelog
> 
> v5:
>  - Add Acked-by: Arnd Bergmann <arnd@arndb.de> for asm/generic
>  - Add Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
>  - Rebase on v7.0

Hi Paul,

Han Gao (revy) let me know that there is now an errata entry for 'Writes
might stick in C910/C920v1 store buffer for too long' [1].

Does that address the concern you had about documenting the errata?

Thanks,
Drew

[1] https://github.com/revyos/xuantie-c900-bugs#writes-might-stick-in-c910c920v1-store-buffer-for-too-long

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
