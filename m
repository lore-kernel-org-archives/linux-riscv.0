Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C01CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZaAKX/3EQIVeX70MYalSl0SQjL6az1cSqTxliQUSUQ=; b=kQIRxvffbojaS7
	0tkYNY9EeECW0/tzrmVcB2BIWLGMiQ+vGfdM2zaC0OrbnHFG49EHUBCiQV1K8L2xNwn1GTcVdtuAO
	SfWx3o2aocgRTodMwD3vgbNlo2p8qyiNwLofy0Mz1B868KkTPMAPaJnRlFsJLnqQFlv9072Q9d53k
	Lf6WZA1wpKb0TJB4llGgENsm6rAe/gNWogC1wJMRekMbi2o9ubtDTyeW8GSSxluu1M8Ghfus4PIoB
	5tEQ2qQS74tHN6SaRfalq01FptbguTQMV89rLosGpMZ491/SFDA01uBcAgNFpd5xzv9ccVQwtPTu9
	znYYA0fP6URzDRcQfaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm3N-0000000GFTP-25kI;
	Tue, 28 Oct 2025 15:56:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm3K-0000000GFS9-0hUG;
	Tue, 28 Oct 2025 15:56:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=OzfJrQmaGSYN7SjKtIVGt8XfMPuNg4JidCQ8tWQK7AVcOCmFMWTyt7m3oaUqsJxpyM0pab
	+9VYgPLRugbHDX88KcBOysbJ/aq1qSI58eSdNkEqVOW7qjKTKIUy5Dlk/fxAOLwId5eUGL
	MMCc/R6qmw7qog3LmZOpn1hDbjFJ/yfaXhgNJR3gCLTsi/v5MgAafS4ZxWm/T3HYbhDBYz
	7c21YHT0Nu/Sjny5kfjGTXYYbNGtZT06Axwaf1pQQ7shqgfmdljAo2APs5uuRC3KZQDlgK
	uYX1vd7MjyQwAwEqJ1sI+OyJphVkD9lM3WBrKG1nbnqWkrsRgH5c5NF/n8hOYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=+BHGZAi3yNFrAvpwe9vwol5p0lVACxAmOqomEwb4Pm2KqtlBgDYqoGb8xyRWB/0XxRQyXl
	VePkBymJj4BQJSAg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?An?=
 =?utf-8?Q?dr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, kernel test robot <lkp@intel.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Linus
 Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
In-Reply-To: <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
Date: Tue, 28 Oct 2025 16:56:03 +0100
Message-ID: <87frb3uijw.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085606_341755_6437EEC3 
X-CRM114-Status: GOOD (  15.44  )
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

On Tue, Oct 28 2025 at 10:24, Mathieu Desnoyers wrote:
> On 2025-10-27 04:44, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> Replace the open coded implementation with the new get/put_user_inline()
>> helpers. This might be replaced by a regular get/put_user(), but that needs
>> a proper performance evaluation.
>
> I understand that this is aiming to keep the same underlying code,
> but I find it surprising that the first user of the "inline" get/put
> user puts the burden of the proof on moving this to regular
> get/put_user() rather than on using the inlined version.
>
> The comment above the inline API clearly states that performance
> numbers are needed to justify the use of inline, not the opposite.
>
> I am concerned that this creates a precedent that may be used by future
> users of the inline API to use it without performance numbers
> justification.

There was not justification for the open coded inline either and
converting it to get/put must be a completely seperate change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
