Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DB4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6f+gTB6JnhMWRiX+xKBwbWS8y2DCDPs2up6Zb6NDgY=; b=pLzHWQwDo7rwse
	JkRQVumgGRU+1N0SLRbb1XSAvno9Sqr6xqQY2vi9r2F8IPZKnwWsX3wsuB5KnyKj1hRxWvvqXj3+t
	DuBR98eJ3IpIHw+HLh1iG9Z/6Obhof15GrN4DUHUSOeMXRxVLXEandD6sW+h2209UAlOt9szbBms2
	4svN8lZXzjfSCTWEF2Y20JD9um6bYxOjFrqijMsvrEG3SGG19srblf6sh+iUvFGG4rDvbMve40+aS
	J5OA0WRn2HcF8OhPjgkppoHIuOQmmbY/jjET4bcpNS63ONAPn6oQSu3R34Uqq2LRFoQNFWjs2MrWX
	YU/cnGg4xSd1YUaPtPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAPo-00CZLE-KD; Thu, 12 May 2022 15:07:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAPb-00CZHr-Ut; Thu, 12 May 2022 15:07:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68CD2B828A0;
 Thu, 12 May 2022 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE97C385B8;
 Thu, 12 May 2022 15:07:26 +0000 (UTC)
Date: Thu, 12 May 2022 11:07:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Li kunyu <kunyu@nfschina.com>
Cc: agordeev@linux.ibm.com, aou@eecs.berkeley.edu,
 borntraeger@linux.ibm.com, bp@alien8.de, dave.hansen@linux.intel.com,
 gor@linux.ibm.com, hca@linux.ibm.com, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux@armlinux.org.uk, mingo@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, svens@linux.ibm.com, tglx@linutronix.de,
 x86@kernel.org
Subject: Re: [PATCH] kernel: Ftrace seems to have functions to improve
 performance through optimization
Message-ID: <20220512110725.22e69e3c@gandalf.local.home>
In-Reply-To: <20220512144533.58085-1-kunyu@nfschina.com>
References: <20220512101229.7886a798@gandalf.local.home>
 <20220512144533.58085-1-kunyu@nfschina.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_080732_191077_C8CBEE31 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, 12 May 2022 22:45:32 +0800
Li kunyu <kunyu@nfschina.com> wrote:

> I'm glad you're willing to reply to me. 
> My current English level is limited, and I may not describe it correctly. 
> I consider that these functions may not be modified in a short time,
> which may bring advantages in function performance. I could only submit
> it by inquiry.

The performance improvement is negligible, and not worth the churn (changes
to the code). And if that is the reason for the change, it is not worth
adding it.

Now if the reason for the change is to clean up the code to remove
something that is not used, then it may be something to add if it is not
too intrusive.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
