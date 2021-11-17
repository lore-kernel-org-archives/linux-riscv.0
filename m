Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07BEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 13:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693DC61ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 13:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 693DC61ABD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgOubdF1ZC3QEtSPCEuNgCVOt++0NSv6Sjcl9bfpgLg=; b=OfY9LGtrf0hurP
	TDAx+7Z7O00hkG3BfHSyECc4SQU7wSzi31LDRh3OjKeqiZmwBWw0vAyQ+VFzMTHJns1sSD5BTXuNz
	Uy8eJKIBi4giKWIYYyzpanf1tcYjoOxut1DTf/kFihU+Dtj0saCnwC+/sH7ZcMy3DDhOOO7F6unaS
	OWNt7asJHaEdQ3+bbwhalP9/sxPs9l7QyLdzt0m7Z6VL2ZyZOAVayC8K+X70i2cUfudoEPtosojxB
	yFy0275k21YeiuMkPvX0i8cAY9BpLnS1+3a0wgp6LMsw0Y9cIpgvMng32zy+xUNd5mA5kbdIxjUnS
	UGvc1eBtiZaoVv4hbHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKkU-004nye-NL; Wed, 17 Nov 2021 13:13:14 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKkC-004nrM-Bf; Wed, 17 Nov 2021 13:12:57 +0000
Received: from localhost (unknown [151.68.164.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id EF7A666F1;
 Wed, 17 Nov 2021 13:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF7A666F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1637154773; bh=RqOZ23BhV9RO5xXgnmEiwuWQ5dgdsqUxxSkLw87co+4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fSzeC/7YkG5oReHXjPQMMOcz6IPgAo298LUNP+2NVVrj4T84sWjraHJ+Y0Cs0HLRQ
 Pjjo1/20Zo0kfsdSFjDMh4BnwMUPeCdLG1wywJl0ZqlNAq85D4BVThIFby3fD+wbRj
 hKWUi3XVS2WA9MDMW/kroHha5/a4ysDR/b8/Qb0fSqzwB/lME+VYlGLUgtcgIit1pV
 Izr4YlWvBYKbmIBcQQmr4crURcJ7u8bzZ1ciiBmKIzAjurwcD7MNkXcblG0Cf99DHJ
 CBJ61e0Pd5/n40QAaGd15jwjKx15lBgVtbwqKJQ3FG4cIQNpO7RV7gHG5BPz/NrfSY
 8KA6EVFt3Lp3Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, Atish Patra
 <atish.patra@wdc.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/4] Address some bad references to Kernel docs
In-Reply-To: <cover.1637064577.git.mchehab+huawei@kernel.org>
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
Date: Wed, 17 Nov 2021 06:12:48 -0700
Message-ID: <87r1bfexin.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_051256_416371_88514D73 
X-CRM114-Status: UNSURE (   8.81  )
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> It follows 4 patches addressing some issues during the 5.16 Kernel development
> cycle that were sent to the MLs but weren't merged yet. 
>
> They apply cleanly on the top of 5.16-rc1.

I've applied the set, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
