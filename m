Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696FBC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ascLeStHYyYBDMEu+ft+ihJeo74rMw50XwIkXAHJm40=; b=o+Q8Y6b83lgcoJ
	FWV1TtKdVR7sCPNMWf5EkEzP1vh+wdb3xjmBOmXynjjg+bcfmmsOVY6rtRf/XnlGTMz7RrPgLOpGD
	g2kWv/oaUSg2AnJTItGCtLtwXcePGkxX8wWl9ECjcwT0ireRNINrnBkDaZCcBcmHyyhmNe58RfZOj
	fJg9tvFi3fnngHnGZxZN6oLBKXRGn2B19zNtYuIYo9RCDsO+AO1S3I5rJVL7vvgIRIjbQjPQHzQVo
	C3jU07kboO5gyA6gRJa1OK+NlCetNsWRQi/bq9jslPU3RjqiKiYLjXsypRFxUdmURdTc5e7kR8GIj
	IYD/JQgQlAOnQhEy8axQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDJ9-00000005Che-2ih0;
	Fri, 10 Jul 2026 15:38:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDJ8-00000005ChY-0b3O
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 15:38:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E913601D9;
	Fri, 10 Jul 2026 15:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3F11F000E9;
	Fri, 10 Jul 2026 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783697909;
	bh=iSOEINRoO6HE5NOxott3HWiwrBXL02Ivy5qz/Rs9LVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LvNemzKXlLuF5PyX5QEtUAjG+TXppzsaWgClX8JhswGVZ0r9V25dllYEI2yiwP0Q3
	 duHRsJdwq8Ls0X0R7DDX1qZ413SQ9TOyqElSWAW2IK7y9kVcQ4bIRu524bQcZ847Oe
	 FRmkWMG0VyShfnX+IbQJJ0Fve0g9yTVG1qG5zNKy9G6kPUFETMJMOr6kOErQRXgyUl
	 icu6JZDOneRTC51oeDROaVvnmiCGsSWJ2P6wfXaPvevBjbg7+xcG0iF7BPV7bJ+9dB
	 Urj+HmLxyPJrWLKIbflz+3fzngu70c2gNAA29PMa4qu011G9EZR4XMwjoXuzUVoha+
	 mH63FWO1iGyKg==
Date: Fri, 10 Jul 2026 09:38:25 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Wang Yan <wangyan01@kylinos.cn>
cc: shuah@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, geomatsi@gmail.com, 
    andybnac@gmail.com, andrew.jones@oss.qualcomm.com, 
    thecharlesjenkins@gmail.com, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: ptrace: Fix memory leak of regset_data
 in vector tests
In-Reply-To: <20260710083437.489648-1-wangyan01@kylinos.cn>
Message-ID: <5ad27d5d-a396-341b-324d-ff2ca7bae26f@kernel.org>
References: <20260710083437.489648-1-wangyan01@kylinos.cn>
MIME-Version: 1.0
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

On Fri, 10 Jul 2026, Wang Yan wrote:

> The regset_data buffer allocated with calloc() in the parent process
> of several vector ptrace tests is never freed before returning,
> causing memory leaks in:
> 
> - ptrace_v_not_enabled
> - ptrace_v_early_debug
> - ptrace_v_syscall_clobbering
> - v_csr_invalid/ptrace_v_invalid_values
> - v_csr_valid/ptrace_v_valid_values
> 
> Add free(regset_data) before kill(pid, SIGKILL) to release the
> allocated buffer.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
