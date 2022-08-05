Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4302AC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioZxDAv3DBdLB4IYf2jqxm2GzS6cCVYNG6FBHFD1vc8=; b=M98c76C5Hl0Wlf
	sTmVMjmbCG4IP7d9oEd4+DkYPqHyK9EbZw9wHC+5VN59iEKi8GnGSy+m7PESgVH+7euuNK+5J6IlO
	kvImYMacEVm8t+NMZz849i4eBnZOhQQRYVm0LD0zZYzBr3S7h2mdpr2sXZVmcdz9N/10xfXoJ6lKo
	pOvtGx+MBHxldhqBaVsLWlKftR0EjXGQNvNN9wKUS9WVxb8nXLpjSW2iUfzpHRLLGZiKPKmfRrVJh
	vPWmhhPg1rGzds5kpq2ZkL0AbZijU0TslKceUAPc/cA5kOCIO7XmT4UITWiJu7/RA9xpB6v8KRimS
	2pct10VCJNa9Mskdhp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtm6-00Dfmy-IH; Fri, 05 Aug 2022 09:37:46 +0000
Received: from bryonye.bartmcqueary.com ([185.246.220.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtlw-00Dfgk-3z
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 09:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=bartmcqueary.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=tay.dav@bartmcqueary.com;
 bh=u2y4maTsK1zci1O1hwwQXd6v9JY=;
 b=YB31+DoklxRhY7B4uRHit0BTOSHSTu2g6RsO9TUTBFSBukCRjRDLWXsvQJuKrzONL435ArpwSqt5
   PrgKP/46lHzemf2Qu/+QXLM9QjGhSRg/519qOuVx7wPvLNvqNVisrpu5PVlhwP2k6fhDCEmh4jPp
   c+lEpOYxscM+fgEZ3Y+/uSijo8Jram3dgtfdon0h3ycOq29xyL3qlZC9sv6+SQmrmCwYJqmT+bj+
   PZPCy/IzFctCfq7AUlimQ3utKbUd/63XHbqdPJXsVtXmkQuC55QxcnOS9RS1vLcEJCjhttalRjt9
   u5v739jJyhHMxFH2gCI9TWtrgMc+paIMO5bvvw==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=bartmcqueary.com;
 b=1j2fAYb2TLN/pEJ6g7yVCMXGtSKaEY/Nme8MntJkrw9MhtWJnPMmcxzhhMzsp486A1KJe2iSQ6WG
   794GYsi20AAjmkhuQDtn8pR7Af4Oy/aJNBQ5FvuTziXogw7oWTlEpL11qX+OO9sY/Or4n7x7SE6J
   MQf9EL2/YsZOC3q4SDLwlKgKlIcTPGIXo3QYZlrLt5AVGXz9sIetOibsIVxGTvAf+A1ULYptPdtr
   evw2jA0hOzlBK8gb9rFZpxgOy9KDzDH/JE1ySORz4cjfuaVMUWN4mKAD3sa2YTIdD6PXBByMl40G
   F8n+Mycu9HyQokqXYkHygarHh6EYu7TOhBeMTg==;
From: lists.infradead.org  <tay.dav@bartmcqueary.com>
To: linux-riscv@lists.infradead.org
Subject: Investment Opportunity
Date: 05 Aug 2022 02:37:35 -0700
Message-ID: <20220805023735.ADD0E1DE91A459AE@bartmcqueary.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_023736_348731_CEF9ACD7 
X-CRM114-Status: UNSURE (  -1.22  )
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

I am an American soldier and before I was serving in the 
UK/American Army base in Scotland UK but right now I am in 
Harasta and I am leading a troop  Syria, I am serving in the 
military of the 3rd Infantry Division in Syria,

I am 48 years old and I have lost my husband for 8 years and I 
have one daughter for him before he dies. 
My address  Room No 65,, Kashmir House Rajaji MargAnsari Square, 
Shahr-e-Naw, Syria.

I want to invest in a company, education, agriculture, real 
estate and any good businesses in your country.
I need someone to help me carry out my mission.
Can I trust you and can you help me?

Write to my inbox in

Emails
anguleanna@gmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
