Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E190606A31B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 03:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ye3xUFeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oxqXYsVxJFdtdbhSumFOoFKRmut6WYDM1uSeCu66RxY=; b=ye3xUFeNfDeyhJNplKOyt8Ldn3
	9Zws29tHhggxzVnz0VrQjx8av5JqSzo43KQ8PNBaM04snuSoBa1y46oBIBXtIOvnBAiLgG7LqSzSJ
	2p/aNLMjmoOA+Ur1W6eag35lTzQ/w4SjXdGeJdH+scBWIMv09nGofppAQOhShQJooY2T10vloqNgK
	gvPiix6h13XZAmXDFPLG3FNbmakDE2B68iW5NA2e0f/VRRs9KqZO4BwpH/vILy8UEuzpQYS1Y3FdB
	mSU1FG0Dn7zVRPkJmOB1XTJzUF4EBlE0AhGkixe7nOztPZ74gIwP5lCa+QxrJFBV17VqoGPHddnkL
	OfEgdZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAuf-0000000BBUd-1vlV;
	Fri, 06 Nov 2026 03:46:49 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAuc-0000000BBUJ-2dqD
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 03:46:48 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXv_mjTe1qG+leAA--.15426S2;
	Fri, 06 Nov 2026 11:46:43 +0800 (CST)
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: put the flash device
 reference
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 valentina.fernandezalanis@microchip.com, linux-riscv@lists.infradead.org,
 vulab@iscas.ac.cn
In-Reply-To: <20261105-blandness-smilingly-dd268d223a1a@spud>
References: <20261104021435.1468301-1-vulab@iscas.ac.cn>
 <20261104-foamy-toad-of-courtesy-e0907b@quoll>
 <20261105-blandness-smilingly-dd268d223a1a@spud>
Date: Fri, 06 Nov 2026 03:46:53 -0000
Message-ID: <179393681351.2060480.10672001055094269033@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXv_mjTe1qG+leAA--.15426S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF47KryxZF4ktF48AFyrZwb_yoWkJrX_Wa
	yktFW3u348AFyxJF4FqFy7ZrsrK3y09ryrA3y8Wr45Jry5Ar4IkFZakwnxZr1SvFW0vF1D
	ur9xJ3y2krnFvjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbtl1PUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMDA2rtB+r-VAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_194647_046269_5BA857E8 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof, Conor,

Thank you both for the detailed review.

Sorry for the late reply, and for the mess it caused.

This is a v2 of the earlier patch, but I sent it without the v2 prefix,
without a changelog, and without referring back to Conor's review from
8 October:

  https://lore.kernel.org/all/20261008-47741881fb032091ea3d7f0c@squawk/

You are also right that the patches were sent in bulk across unrelated
subsystems, without being grouped into patchsets, without running checkpatch
on them, and without documenting what was and was not tested. I am sorry for
the extra work this has caused you.

In particular, thank you for pointing me to the kernel documentation on
subsystem identification, patchset organization and testing, and for the
guidance on how this work should be submitted. This is an important lesson
for me, and from now on I will go through all the remaining feedback
manually, one by one, and reply in a timely manner.

Going forward, I will also not send patches in large batches, so that I do
not exceed my own capacity to respond.

Best regards,
Wentao Liang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
