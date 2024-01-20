Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA3C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JuhT1eTeflRnXGrT4mgemSuiQ9eQgehp5El+NjD6KY=; b=No5+br/FSz5dOn
	DDKP5WuDhfi5IfkraeNh4xJ8lNoX07hoGQg5VSOATdHIIIIP0wnEj+upxLUgrDqTfxGhlusjXVGBj
	K146OOVqzm7ad6l/nKKiQ295Y8qajfktAfnWOKAgbNtTTg1uNXKXfEQADU6X91DDAJ70/hqxyF0nk
	mSid1tqeNHUEuTuln+oVGpPGDWn6/tm2kGvaWK2rvYev29u69aI3t5AUZ0sWi6SIlcD7jl6WJv4HO
	Ho2gMS8p+dqohwF46vuaIJpg+ry5nZU+0f6J+gRKa4pXithlL2nTjbbVjPdgSiNPifwn91NLecTh/
	YhdCxLNBDzCVhNj3DZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIgV-008Qck-1Y;
	Sat, 20 Jan 2024 21:15:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIgO-008Qbf-2R;
	Sat, 20 Jan 2024 21:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1aBK0Gktyu8z+XAOtZwM9ibKmLTWPXmi9JXFn46Moag=; b=NchmfWpKV8qW4oGh0F1Qvj2C/6
	/9LiX34B1wlpHtipYkfPNQ+3G4sxN+nN75vc36dqQqjNMWNyQa5wFbXiDuuJCw81FAOfCSys3cLbS
	IooU5FuZdHsgy/cCTasUw23eGZLHi8rqM87NA8xNGA8TZZ5t8ap1so2ig5rH24oATjRzXeNBH9G8b
	ES6a95oRMX+OMy2zD9vQRKPlkHHSsMPeqUmu5H/RRAiTRt7YRBqjFrwcrblJ1oMA3AphMu0iwndBx
	qYPvgpL249fguGP08RS7rSdcLn8m1HFKMQRGIg7MzbGLKydZ2bOvJvLHRY4wKgtirPXoSsCPXUNrl
	VswDM4wg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40226)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rRIgD-0007pB-1l;
	Sat, 20 Jan 2024 21:15:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rRIg9-0007ya-3x; Sat, 20 Jan 2024 21:15:01 +0000
Date: Sat, 20 Jan 2024 21:15:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Suren Baghdasaryan <surenb@google.com>, linux-riscv@lists.infradead.org,
	akpm@linux-foundation.org, willy@infradead.org, will@kernel.org,
	catalin.marinas@arm.com, palmer@dabbelt.com, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when
 retrying under per-VMA lock
Message-ID: <Zaw31DVa9q3JZASo@shell.armlinux.org.uk>
References: <20231226214610.109282-1-surenb@google.com>
 <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131517_901795_382C3A97 
X-CRM114-Status: GOOD (  19.91  )
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

On Sat, Jan 20, 2024 at 09:09:47PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This patch was applied to riscv/linux.git (fixes)
> by Andrew Morton <akpm@linux-foundation.org>:
> 
> On Tue, 26 Dec 2023 13:46:10 -0800 you wrote:
> > A test [1] in Android test suite started failing after [2] was merged.
> > It turns out that after handling a major fault under per-VMA lock, the
> > process major fault counter does not register that fault as major.
> > Before [2] read faults would be done under mmap_lock, in which case
> > FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
> > mm_account_fault() to account the fault as major once retry completes.
> > With per-VMA locks we often retry because a fault can't be handled
> > without locking the whole mm using mmap_lock. Therefore such retries
> > do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
> > because we can now handle read major faults under per-VMA lock and
> > upon retry the fact there was a major fault gets lost. Fix this by
> > setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
> > VM_FAULT_MAJOR was returned. Ideally we would use an additional
> > VM_FAULT bit to indicate the reason for the retry (could not handle
> > under per-VMA lock vs other reason) but this simpler solution seems
> > to work, so keeping it simple.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [1/1] arch/mm/fault: fix major fault accounting when retrying under per-VMA lock
>     https://git.kernel.org/riscv/c/46e714c729c8
> 
> You are awesome, thank you!

Now that 32-bit ARM has support for the per-VMA lock, does that also
need to be patched?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
