Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9DFC79F8C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 03:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDamADR9iLUn5JXHcR6XVUKYmfe0GmjgYKQGqGhHWV8=; b=Mu8pgVKkOg1UcW
	PSFTWnBUd8rjX0mhpKNi9wc1UjHkYpxSjdad5bRoXcIEFgY30/8KCtcd+Rj8rd/ohTU/OFcCHQUCY
	WvsTjwtxs6uKm0UO8QBZe5n5X3gGJVRGRGp76/M7nUJE2xJ9vF4kISTPKni+QDRyEB95M1nxTKPMe
	PyL9WDAly5KX4bp69y/hE1zq4/uBwFmER4NOgtstUftD4ZWJvXJifv+BBQmFDFUs48d2Hg9MDmaBQ
	VvqnajolcPhMSGNfyg3ZN+X3si8RI0Uob0Ah8/8CXBwvMRVyfZ/dcka4GoX73xsxh5/+5TiUW6UXB
	nPZtRb3VBXZGtfpIv6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Q0Y-00000005lYQ-2dIP;
	Mon, 07 Sep 2026 03:26:58 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Q0W-00000005lXK-1YdQ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 03:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788751610; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=jlOQ0n2PNhuPIh1KarKCVTN6XuHIkDQKRI5gKjnrtrk=;
	b=Y+qqBM+QBk2e+u4P6g2VyzYCXMG6U95kIg6Og7ZDIy2Z+LL4j2H8HTC0FUtM1ig9wuFeyReAgeXz+QIsFhHLJ3bLCv3+9seMMrjvSWJ80d/Baj8VWuMeFZbb5UqpIMQBCcJjNy/zhwnXrHeDGeopTmg/WU2ben8/BPI+tWMmrdg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XAOUcAG_1788751605;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAOUcAG_1788751605 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 11:26:49 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Pu Lehui <pulehui@huawei.com>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf, riscv: Register extable entries at probe insn call sites
Date: Mon,  7 Sep 2026 11:26:32 +0800
Message-ID: <20260907023000.16104-1-reply-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7fbae9ac-44e4-4607-8aba-15db9779f80d@huawei.com>
References: <20260901120013.16104-1-cp0613@linux.alibaba.com> <7fbae9ac-44e4-4607-8aba-15db9779f80d@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_202656_546135_169291D8 
X-CRM114-Status: UNSURE (   4.79  )
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

> This patch looks fine, but I still tend not to introduce these changes.
> I think the function itself should handle its own defensive checks, and
> we should also avoid "shotgun surgery".

Indeed, you have a point. Thanks for the review.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
