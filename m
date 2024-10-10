Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D71CF11CC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifJBGwnR7PUYm4opbqCvDpEUV39b7G4eBvdbt9w90vY=; b=nc4/CwVC+s6gdk
	F1d7JR74BvZ2Kp6dMvkc8BTMrSmWSyXHBwv1oRl1sPAwxZVr4KYO6dGUXxPWTAovbLN9ua4vIm8j0
	PecZqjCUEtfnoM6zWHciZ+7LFxpLP/NvIPDHq8+uCUAQhCosSB3Mu3Lpbm7GtsF+RRMfWF0znPJH1
	EBPgV5a97RB8fl9UUNuzsYDJX4Huq9aO54/lyiZ52T+WzxxUb+NMAhsDLkdL+3XCq5izkv1NAGCS6
	Ik0s97EQk9zPHSJlb453IOXLj7LEY0RKaNaawFqIok8lImtTPFccGs75U7n3Ufmef4Bi7lngdwy70
	rokm7i+sF8wqlj0sZ4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syq1j-0000000CKSI-1BOh;
	Thu, 10 Oct 2024 10:04:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syowo-0000000C7CQ-18EX;
	Thu, 10 Oct 2024 08:55:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728550498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec6XdUosMlLP404cIM/Sp1Kyqw0kVma/GMPn92t9HDE=;
	b=2PTAjiqPtRqkKvjlSKaANQwVdiwThhCREPlRX8T6WrkNlX9e8SWCTxhLkgfsjJoX/aUSjv
	dcZhDaUfZi9FrtMVTYX+T2YVRkZ19EjmLxtTdqNPnm+i361UiYq5z0iAreXCTIwAWVbSPq
	EVJt1Epoqj0BhfVHzZozCnr4NAo89/tI5IAO32L16fo9XklyAwHtTfdDRaCycKy1I/gLGe
	ohYP4Xh4XP1AoAY8NTWb+mG1eTVfmNZx3f0wo3MA8y/c/q1RFnYKjac1mgo8zh5wLmJRIb
	J3vNRB4/Z+9fzswe/fPcEyuPurtjomHZoM3CXfVeN3W2b9xwFE/VRbBZEFZuPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728550498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec6XdUosMlLP404cIM/Sp1Kyqw0kVma/GMPn92t9HDE=;
	b=jIvjA+SIxgG5ChpnWhKDeLcT2fIJ6XikDrFxrvXgmh0oyUrc8nqV+ObPf0TmYzHXqd493I
	El6nXhLfmFI5B/Dw==
To: Palmer Dabbelt <palmer@dabbelt.com>, namcao@linutronix.de
Cc: bigeasy@linutronix.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
 aou@eecs.berkeley.edu, bp@alien8.de, Catalin Marinas
 <catalin.marinas@arm.com>, williams@redhat.com,
 dave.hansen@linux.intel.com, mingo@redhat.com, Paul Walmsley
 <paul.walmsley@sifive.com>, pmladek@suse.com, senozhatsky@chromium.org,
 rostedt@goodmis.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
In-Reply-To: <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
References: <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
Date: Thu, 10 Oct 2024 11:00:57 +0206
Message-ID: <844j5kmj6m.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_015502_992463_CF939A8F 
X-CRM114-Status: GOOD (  11.43  )
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

On 2024-10-09, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> and it breaks my boot test script.  Looks like it's actually working 
> mostly fine, I'm just not getting the "reboot: System halted" message 
> that I'm checking for to make sure the system actually went down 
> cleanly.
>
> I'm not sure if this is expected behavior in RT land, or if we've got 
> some sort of bug.  It sort of smells like we're losing the last printk() 
> line...

For PREEMPT_RT, the console printing is done via a thread. On
shutdown/reboot, the threads are no longer active to print the final
messages. There is a new console driver type (NBCON) that is available
for this. However, currently in mainline there are no console drivers
that have been converted to NBCON yet.

I am currently working [0] to get an NBCON console driver for the 8250
uart in mainline. But that will not help your case if you are using some
other console driver.

John Ogness

[0] https://lore.kernel.org/lkml/20240913140538.221708-1-john.ogness@linutronix.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
