Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED41C282D1
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Mar 2025 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BasMjpqymxPouSFYrZm04SCT4ilhbzpCErqAgqTMb0E=; b=jXdaNOjF4carHL
	kOPuGS3f3SVtjhAsevbfC+D/GQ63TpAoAKjjQ8jhLHweTsiyv1JLSAHSdVHdvD34RAcB59zUxUGRs
	dZkZxorWNUAizerNt/+QYXKM3gD1Xq2UmnKXUKUsa29CG9muc+Noz5NEkCVRN80jhRR6x7NAcTIxx
	ftyt+Xh1C31TJ+PYYWYXd7zamgbzECmdbYsPhccZU+Nb+cTUc5YbCH246A+VvL0PfI8XeK2NrJzma
	GFTfgfULetOjQpA99bpxT26ay71+xw0xg+w08ABPBFL/rJpdScK7YZpD0MSKKFAusv81kuTdYTIIH
	f2Fir2ueKqeBBQZIkYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trBwU-00000000A7P-35Yj;
	Sun, 09 Mar 2025 08:23:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trBwS-00000000A6i-0wJM
	for linux-riscv@lists.infradead.org;
	Sun, 09 Mar 2025 08:23:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741508601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZEfVXfbWSs4mJiGD94+1pNr7HfhKB5xKrjUV7TTCks=;
	b=FGpvuTuaBLJSb1t+8raGXBRaENq4zgAFP5112yZK6Y/PRpvsL0QIULDhRL8YZL1BuBa242
	KruaEiHzda+wWE730CcnNZ6DUNxRFAGaqPHOGzBLdV+DdSD7mkn0YfMQYkjLQukxMDlLxM
	ueGqpnesEEhjskLv+h7ZAV3QhceW09d1uaY8mp1mwEev1XGHS+p64zjqovZjCCE6XxN2dE
	a8MEPtFd+8OfpeUynCyE/8oEQX2VEctEkfXE4ztHoA32weQHqoZ/mnMwIf983ZTU/C9kn9
	WcMDVwdquae+ufreSX1XS4roIe8xPrQvQSkbDyyk5QlVL7mOAS6Rgz88UofbgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741508601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZEfVXfbWSs4mJiGD94+1pNr7HfhKB5xKrjUV7TTCks=;
	b=hGRltaDWVms6RukgrjSfzrFHRypAnpcy7O0x/FIB69T7MKmVomnus0BjoUxWbhUYqunqmW
	c/K+5IMExs81UbCw==
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
In-Reply-To: <Z8zb-L8bFMh_YHxO@ghost>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
 <87senn3dh1.ffs@tglx> <Z8zb-L8bFMh_YHxO@ghost>
Date: Sun, 09 Mar 2025 09:23:20 +0100
Message-ID: <87jz8y3953.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_002324_396429_D29C4E79 
X-CRM114-Status: UNSURE (   9.50  )
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

On Sat, Mar 08 2025 at 16:08, Charlie Jenkins wrote:
> On Sat, Mar 08, 2025 at 01:37:30PM +0100, Thomas Gleixner wrote:
>> On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
>> > Architectures using the generic entry code can be optimized by having
>> > syscall_exit_to_user_mode inlined.
>> 
>> That's a pretty handwavy claim. What's the actual benefit in numbers?
>
> I put the numbers in the cover letter! Here is the data I gathered:

They should be in the change log as the cover letter is not part of what
ends up in git.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
