Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A6EC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KrtEjGFvjhCIdCXi4HmwIThzJlFv7hK0Xk/lts/2Cg=; b=OvInWmZAQHQ1r1
	MQyFUtm3T6sUoCISdBJ5PB7hkFSoZ6IF3tc5egZYM9HAiuLQkW9igWS2YkDv5Am6r9fqTwIi5B8oE
	ZBu5GsgM9sdii3wlRoJUXzKF5K6rNVcEF0wEvtjsg8ty4VBTysLGACx6ekBu5hRvf2+IFqHPjaq7A
	yUAZ66OyUTiXzlQqKhNVwhcOHgbGBENyEP1O5Fh1wXwWr874I5HP67+oegxccLj3LF2XUlCc/QjPk
	6wBBc+NJO9wkvfZKk3mYE4A3N8y4VaBhJnmMLQZ9t+9bmlqqbOBUhoGLJX6VS+tu+KxoovU6lOiRH
	KJECqGZdkTKt63AAyKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxw1q-0028o6-LN; Wed, 23 Nov 2022 20:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxw1n-0028n4-Bx
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 20:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB3FA61DB3;
	Wed, 23 Nov 2022 20:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A71C433C1;
	Wed, 23 Nov 2022 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669234046;
	bh=s17osRDuFFTXSmbRyj5BL7PHDUQYJZ+NO2AwDclrJjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLIm4rpxMG2Eps3Rp4NkkcfCzg552JIwtvIzd6FL4D83/bitutNaMOWFrC5zV9gza
	 xi1QQMIGsZOWLHKSh0N5aYg2/BMwOS2OsunAjVukN5dCexAnulyWV0yBU7LHc6w6j0
	 RWoDrf2jD36kjMDCpxd8dMx3i24FfHTRujvmUyxsw/60BXkRQmzMH3OlWQ011fi3dF
	 vjHfXFUJpkd5w+Vbkdz9w//VMwiH9M03rtl2rzeMURUsp8dpVNLRYgnoplRvY7yYpr
	 CpGJHK3FnYu4kAnITd0PTZG2nYDP4x/B9tav7Lsn6Qce+UZYLousbNVFo8Jdozc7WW
	 gzHMzqZn9zKBQ==
Date: Wed, 23 Nov 2022 20:07:20 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/5] riscv: ftrace: Fixup panic by disabling preemption
Message-ID: <Y359eOOrm/lpDHjt@spud>
References: <20221123153950.2911981-1-guoren@kernel.org>
 <20221123153950.2911981-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123153950.2911981-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_120727_463170_9251EA8C 
X-CRM114-Status: GOOD (  12.80  )
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

On Wed, Nov 23, 2022 at 10:39:46AM -0500, guoren@kernel.org wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> forming a jump that jumps to an address over 4K. This may cause errors
> if we want to enable kernel preemption and remove dependency from
> patching code with stop_machine(). For example, if a task was switched
> out on auipc. And, if we changed the ftrace function before it was
> switched back, then it would jump to an address that has updated 11:0
> bits mixing with previous XLEN:12 part.
> 
> p: patched area performed by dynamic ftrace
> ftrace_prologue:
> p|      REG_S   ra, -SZREG(sp)
> p|      auipc   ra, 0x? ------------> preempted
> 					...
> 				change ftrace function
> 					...
> p|      jalr    -?(ra) <------------- switched back
> p|      REG_L   ra, -SZREG(sp)
> func:
> 	xxx
> 	ret
> 
> Fixes: fc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")

==========
verify_fixes - FAILED

Commit: be26b864dac9 ("riscv: ftrace: Fixup panic by disabling preemption")
	Fixes tag: Fixes: fc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
	Has these problem(s):
		- Target SHA1 does not exist

This should instead be:
Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
