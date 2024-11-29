Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFCDD6EC04
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIZP4HZYLUTr761GmlaGc0UWvHfFel/GiXiG4kl334o=; b=kbLHaUUpeVIdvT
	uGX+JXBnraWZkeMgJ+5uKWmVklq2yoisbJJdsSyyF9pn8fmYCgaWSfYnsagJ1HlDLghek9E0tKf6J
	sWg2P2KiiCemsirBityIf57ETrmnEY0OkYDYQFlmHEy3v0kQeLWWyOZW/5AJyJv4wpurVmrLC3mXt
	hD0DtvrUMm++p430vxY9ejA+F8xAzC5shQQJ5Tq9GKJEqzPRngLQKcfjkOpE3kwqi9cU3lSFEUGgi
	NbrnvNPJ7+sSRcjDGHWPDO55ebM8NVnVSakbym+fi9cISTPpzlt4nFFKpemsITj8BTIsgFVVXNptI
	e806/lJpLDMQe30kOo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0FF-000000005QD-0u5f;
	Fri, 29 Nov 2024 12:37:13 +0000
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0FC-000000005Pi-05Ec
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 12:37:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241129123703euoutp02b36bbb0a42bd8a223e6b6b7403d9add2~McKfynaxC3026030260euoutp02z
	for <linux-riscv@lists.infradead.org>; Fri, 29 Nov 2024 12:37:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241129123703euoutp02b36bbb0a42bd8a223e6b6b7403d9add2~McKfynaxC3026030260euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1732883823;
	bh=KSXnnVUHiB/eCy4nTpGK0exHRDJOgGETf1CCV9SENGs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LemBn1pRjpfwBovnqX41F7XpVncJkC4sb6eyNAEbwXOG+Vm5Ffr7EA8Ai73+HkVXN
	 aHILd7RGkZCAojRBPS8weso6CLrLNzanQO45J5KUY9Z2ki2jnDfFOP0ljKVz14i+ng
	 oFdcizP2UxCXgkTVs2xQ9OJxotQ+s3guzwTaN5I4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241129123702eucas1p271e200ecdc43b062470e856dcd59919d~McKfdIy261289612896eucas1p2O;
	Fri, 29 Nov 2024 12:37:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id FB.A5.20821.E65B9476; Fri, 29
	Nov 2024 12:37:02 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241129123702eucas1p2caa1fa4baf14c9de3ad31d50d1004759~McKfFDIqh0746107461eucas1p2U;
	Fri, 29 Nov 2024 12:37:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241129123702eusmtrp258dab87d3da10cd7ce76a63b353c0110~McKfEHbqm0289302893eusmtrp2d;
	Fri, 29 Nov 2024 12:37:02 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-37-6749b56e1882
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.11.19654.E65B9476; Fri, 29
	Nov 2024 12:37:02 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241129123702eusmtip2143cda9f9fad063d3e8048b0bed50a44~McKeyONQn1394313943eusmtip2e;
	Fri, 29 Nov 2024 12:37:02 +0000 (GMT)
Message-ID: <9b61b713-7c0b-47d6-b6a0-dbef5c17adc2@samsung.com>
Date: Fri, 29 Nov 2024 13:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] mailbox: Introduce support for T-head TH1520
 Mailbox driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <a99e72be-8490-4960-ad26-cbfef6af238f@stanley.mountain>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7djPc7p5Wz3TDRqbjSw+zGtlt9j2uYXN
	gcnjzrU9bB6bl9QHMEVx2aSk5mSWpRbp2yVwZdw4eIm5YBtPxfPNy5kbGH9xdDFyckgImEhs
	PLaevYuRi0NIYAWjxJR5e5kgnC+MEgv29jJCOJ8ZJbZ8fMMG03LiyQQWiMRyRomr0w9Dtbxl
	lPiz5CxQFQcHr4CdxJoTXiANLAKqEpumzWcCsXkFBCVOznzCAmKLCshL3L81gx3EFhYIlzh0
	+yYziC0ioCPx7+9ksBpmAWWJY2t7oWxxiVtPIOawCRhJPFg+nxXE5hRwkfjz+RsjRI28xPa3
	c5hB7pEQmMsh0b5hAjPE1S4S327fYYewhSVeHd8CZctI/N8JMVRCIF/iwdZPUPU1Ejt7jkPZ
	1hJ3zv0C+4tZQFNi/S59iLCjxKG7C5lBwhICfBI33gpCnMAnMWnbdKgwr0RHmxBEtZrE1J5e
	uKXnVmxjmsCoNAspUGYheXIWkmdmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cT
	IzBhnP53/NMOxrmvPuodYmTiYDzEKMHBrCTCe2WxR7oQb0piZVVqUX58UWlOavEhRmkOFiVx
	XtUU+VQhgfTEktTs1NSC1CKYLBMHp1QDU6l90a71Nrdmllu+u7ky8fTCFQWxMyYp2SWau9lc
	C9pTPpvnwPoJAYs9Y1r+cocz71+1sUbmwPanE0X2Op3iL9xveDLhfFCdzSeu3xfTZkbM0pCa
	ftbvafyToCuZ3CdKv59gDNELsr5dl7xBZc3v568fV+XwfRcuvuLi1Xsys3XLKQY3p6Dzwpnh
	18qed8VbCOwv2xNgN6/8ZAXTQ+UZb+J5+lhPL3BxfLHCRabh15rNRl/W5+WahnpvsjMOOWD5
	uMpv2efDHm9utRxxWz8h+ka1X6zb73MFmjdslx64afhfeLOj8b/9KtO3SR/aelWx1OKd5XeT
	2ybZJmWT9TYz1s1aNnH2/HWPBQ4bMH9wV1diKc5INNRiLipOBACJMl6ohwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42I5/e/4Pd28rZ7pBut2i1t8mNfKbrHtcwub
	A5PHnWt72Dw2L6kPYIrSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJ
	zcksSy3St0vQy7hx8BJzwTaeiueblzM3MP7i6GLk5JAQMJE48WQCSxcjF4eQwFJGibN/77FB
	JGQkrnW/ZIGwhSX+XOtigyh6zSjx6MM8IIeDg1fATmLNCS+QGhYBVYlN0+Yzgdi8AoISJ2c+
	AesVFZCXuH9rBjtIubBAuET3mlqQsIiAjsS/v5PBSpgFlCWOre2FumE6o8T6c6dYIRLiEree
	QMxkEzCSeLB8PlicU8BF4s/nb4wgM5kF1CXWzxOCKJeX2P52DvMERqFZSK6YhWTSLISOWUg6
	FjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMj23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVE
	eK8s9kgX4k1JrKxKLcqPLyrNSS0+xGgKDImJzFKiyfnACM0riTc0MzA1NDGzNDC1NDNWEudl
	u3I+TUggPbEkNTs1tSC1CKaPiYNTqoFpPd+GWbfS/e121e+U+Dn/jvPV9vXr9+z7neC+XOux
	4uyK2C9b11g5/fgo72Nmx+K/rlex/pMzwx3L0MYYPtXWOnerzECPmSFHxe/s57/E0Cft6boj
	3/kEu35f0dnk27/Nft44lp8/LdX1TwlD7MbguTPEtG/0PWfWUtM+Flh4q4Sj6LGn0sqejRqL
	ghiy5ieF3ew7U96YGNctUiHzUHjGrfasad+U9syOzHZty2aQ61H4Ok+CXVc64afow93fFrzP
	nBrrfXLqq0BB2zUblX++XFhWoR/0p87y0J3uSOePhgeYLlh1+mn+zw7x4y+ckbrcRk3s8jm5
	eQlSWR5pTVcOhddyX359c3erdtZ0OyWW4oxEQy3mouJEAMOYn1AYAwAA
X-CMS-MailID: 20241129123702eucas1p2caa1fa4baf14c9de3ad31d50d1004759
X-Msg-Generator: CA
X-RootMTR: 20241129065640eucas1p2dc23ee4309b01cb0e7a0f7ae7e5408a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241129065640eucas1p2dc23ee4309b01cb0e7a0f7ae7e5408a1
References: <CGME20241129065640eucas1p2dc23ee4309b01cb0e7a0f7ae7e5408a1@eucas1p2.samsung.com>
	<a99e72be-8490-4960-ad26-cbfef6af238f@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_043710_504899_AC4A5119 
X-CRM114-Status: GOOD (  11.93  )
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



On 11/29/24 07:56, Dan Carpenter wrote:
> Hello Michal Wilczynski,

Hi Dan,

> 
> Commit 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520
> Mailbox driver") from Nov 4, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> drivers/mailbox/mailbox-th1520.c:535 th1520_mbox_suspend_noirq() error: buffer overflow 'ctx->intr_mask' 3 <= 3
> drivers/mailbox/mailbox-th1520.c:548 th1520_mbox_resume_noirq() error: buffer overflow 'ctx->intr_mask' 3 <= 3
> 
> drivers/mailbox/mailbox-th1520.c
>     525 static int __maybe_unused th1520_mbox_suspend_noirq(struct device *dev)
>     526 {
>     527         struct th1520_mbox_priv *priv = dev_get_drvdata(dev);
>     528         struct th1520_mbox_context *ctx = priv->ctx;
>     529         u32 i;
>     530         /*
>     531          * ONLY interrupt mask bit should be stored and restores.
>     532          * INFO data all assumed to be lost.
>     533          */
>     534         for (i = 0; i < TH_1520_MBOX_CHANS; i++) {
> --> 535                 ctx->intr_mask[i] =
> 
> The ctx->intr_mask[] array has TH_1520_MBOX_CHANS - 1 elements so this is
> memory corruption.

Thanks, yeah it seems like the array should just be bigger to accomodate
for all registers interrupt masks. This kind of slipped from the vendor
code, and I haven't noticed it. Will send a patch fixing this.

> 
>     536                         ioread32(priv->local_icu[i] + TH_1520_MBOX_MASK);
>     537         }
>     538         return 0;
>     539 }
> 
> regards,
> dan carpenter
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
