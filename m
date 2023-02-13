Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D6C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QcDfPhzrE6TYJPaoccYK2v1ekuxgiwTOzje41ZxukY=; b=lYmI1P716bRn8Z
	lqD9SlFe18cy89tqJWVuwjIpewG9IRYqrfd+pbscQjRt/w4SV/ZMqTFKm+TDsjzJKPG1GfUBO1YqT
	wVrw/5+Va5BAUXAQFpWjwsv+rwOFWu5a6gS3cbcYyorxYPYTg4dp58n42MusM872R/I0nh6Loii1v
	q79a/ZJORo41JBnpgKLBnle77zFyYiq6pd70FDreVSPAQA7zqK40UYdW8MEzECVjzndOYu2k5lV6X
	N3CUeBcQYQ1UQSrXepwviRlqWKHcVWdLSScDipYlrhx0qeocXmza1t2bdR4k4SBxtAcoMnrgOKXdD
	iurJkOFUxJRkACe1fOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcfL-00FghM-LA; Mon, 13 Feb 2023 17:30:59 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcfG-00FgfK-Ry
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:30:57 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7621635F;
	Mon, 13 Feb 2023 17:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7621635F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1676309445; bh=+0G13RTh6TKJd+Psii2Hnwyy6W/qCSu6rqe6+5bBQ1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V5bvl/7/rl++F9YhB+WZvzhrYMi1v31mog3I+XmrgoQBisl7CyvRhQpjApEO/6otQ
	 22hRCUpCaufkRkl97rafJWbb1bHYUPmh0uKHR67gYPr+AR2qMCWpbHpOUO/yAUnfrk
	 sseiyIotkQGyF03z+ixuE/q0sK4xU93okXadrQgrqtNO4Tdp21PYf8vPMaO2Vn8VMU
	 RHHOeSbIPG0YiKOLBEfksz8SISGKxxJhVVPjcPn0UzHUX239SPfjIItcboIq7o9lqz
	 OqDX0r9PqrJPxbt61NX7wd7LzEWKNACuM82PZ7vixL/44V4GO8Kfj09sQwSLJxrewe
	 8KuY8EKPe21JA==
From: Jonathan Corbet <corbet@lwn.net>
To: Leon Romanovsky <leon@kernel.org>, Nick Alcock <nick.alcock@oracle.com>
Cc: Conor Dooley <conor@kernel.org>, mcgrof@kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] kbuild, PCI: microchip: comment out MODULE_LICENSE
 in non-modules
In-Reply-To: <Y+kx3fb2Lzlg+u5+@unreal>
References: <20230210164749.368998-1-nick.alcock@oracle.com>
 <20230210164749.368998-9-nick.alcock@oracle.com> <Y+aMh5e9bWaTphiZ@spud>
 <871qmx1fv5.fsf@esperi.org.uk> <Y+akw9VBjg9oZ7QV@spud>
 <Y+kx3fb2Lzlg+u5+@unreal>
Date: Mon, 13 Feb 2023 10:30:44 -0700
Message-ID: <87ilg5mq0r.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_093055_794673_2F4DCD7A 
X-CRM114-Status: UNSURE (   9.42  )
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

Leon Romanovsky <leon@kernel.org> writes:

> It looks odd to me too. Please add SPDX tag in modules which don't have
> it already, instead of commenting code.

So I'm just a bystander here and should probably be ignored, but ...

From what I can see, Nick is attempting one of those cross-tree cleanups
that's painful enough to do on its own.  This request is asking him to
perform a different, unrelated, and potentially fraught cleanup that the
maintainers of the code in question have not yet managed to get around
to taking care of.  This will impede an already prolonged process and,
IMO, unnecessarily so.

Wouldn't it be better to let this work proceed while making a note
of the files still needing SPDX tags?

I'll shut up now :)

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
