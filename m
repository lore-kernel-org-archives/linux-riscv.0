Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70475C36009
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZbOBjTRvx/dNrGzBd6g74pA9YGIuYz4L1h2MRiU/Aw=; b=3dkA4TVoTu1JSn
	duVqScQPCifJVOSTJ7cbASrbaaHhL9zknXx+LiY2w4QwTUMKgpDWQDY7oX+Cua2YmezARb+CvScL3
	5cZBci5gOPmFjseEawNLY6jHFZclFR4lH9t1SeXhR7TAD65Rxym9JzMi6uG1pf9oA987eL9zsCOqf
	+jViWiPFO0dJ9SCr9CsuMTD44Ekbjn+pVtyRQ+cuquv2+Ys04fV6kzmo6Wui7K11KUK/QOdRwF5mr
	aqhp5XHZPdthHlc7BeSuI0kdQsvz32wJ8eFbXxJ7pACn59ErIfrxcVxzN3OZTmuHfif2xc4t+Dxc9
	7yU4UuH8cN75qS7qwovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVi4-00000005zK7-06yE;
	Tue, 17 Sep 2024 10:45:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVgt-00000005z7y-15vi;
	Tue, 17 Sep 2024 10:44:19 +0000
Date: Tue, 17 Sep 2024 12:44:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726569851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy+4/1n+ad3a8AV+WCtI2cD2537ZZ8vIrmHCHPAf+Do=;
	b=ub/0zY/tn1KHEjEdR/XC3W39Ov6R9WCQxkU59zhLnSZnLXB9HrljO/DzW831JF4pTWX/r0
	2GpvVc3KVj3z30V96G31IYSYBy1MPtKF/bMmxliNfP3Emw/nWWUX14Ex+lEUePWXSnXwKK
	h2D335M62o8zSCtu1jowrFHpv0IR0VHDscnhEeMt7BOYJt0E2coHu1NW1zhMwVjLSujmGl
	flpiBY+QVRM8G22Wn3OlKIlo3vudtEENkVWSLahN7y6TZEiU/rL+2aRYlc1tTd/ac+9uyi
	5dEtfiPzdf37dnIFMcti4Uppx4Eo4sJj/bblljtSm7klbCBNe5QCYEBFn8MsKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726569851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy+4/1n+ad3a8AV+WCtI2cD2537ZZ8vIrmHCHPAf+Do=;
	b=eBpji7ZgNulCp86xJPG08myqucni+BhjZBxZNfbpwdtzuUv3PhyCEzFNm1uL8ArdqV5hEE
	8HA/t7tPHdd4wGCQ==
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
Message-ID: <20240917104409.b9nGBsc8@linutronix.de>
References: <20240906151324.tVwX6lFy@linutronix.de>
 <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_034415_461638_5A0DE615 
X-CRM114-Status: UNSURE (   9.32  )
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

On 2024-09-06 11:48:03 [-0700], Palmer Dabbelt wrote:
> I don't have a test setup yet, but I figure it's a new feature so I'll just
> flip it on as a config post-rc1.  Presumably this just works in the QEMU
> virt board, or is there some wizardry I'll need to copy?

I don't think you want to enable it by default for everyone. The riscv
defconfig sets CONFIG_PREEMPT_NONE=y by default. For testing you need to
flip this to CONFIG_PREEMPT_RT=y and since CONFIG_EXPERT=y is already
set this option is available.
And yes, it works on the virt board and there is no wizardry needed ;)

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
