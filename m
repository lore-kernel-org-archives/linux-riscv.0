Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42140CE7B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bnzcn5Z7Wewa5H1/FIgtu2bnu/vn+TFr20gqJ9FFcek=; b=nfRYY3mXVWvV5l
	VsLyUp/ivhEazn0HzYS67Ia1ExwM8wIgUnefqCMBY1e5OmoOFAkBODe3Jf6qZulBXtW9gAxdmsNlu
	el5MwOcZ98Y5B3UVJ3xNZoCsZL724Q8ZTsvoDsm30hLLn2ckfccASZqPHwiedtFZItvuDXhMOjgN3
	Cz8p/VyyHKA0RTe4Abyd6WZve29/JB1NxXnuDFoZ3aczBiWX3F1Q8vTVL4I5RpX3QNOHrKePtWTwV
	+9o4DLGZiq57lgiohCpukyCiZ/P8Nh7e4BO2XG0pEl1chl0thnKUBu4YD7UiopWOoiPxbvTVtRwEO
	l3Gfa+dE5xBl4w/RWtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtwK-0000000CGUL-0qDR;
	Fri, 14 Nov 2025 13:34:12 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtwH-0000000CGQE-2UFL
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 13:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127173;
	bh=4vsQ9a4sfdto53Iz7h22ctWn2ltPYXiwp6/cuN4SgYs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ctJA5eKg+sTiWKxF8cv0uNZVqXCV0xhHzwxpZV6V1hV1qXPCMgj2Hpx69Q+yqLsgt
	 3u4LBqo9a+q6jYaSSZKqHGFj3Z0LT/N+LByoQ0mmrVGkC2B+6qSl6a+m5Z/FhLoDEH
	 Rxcwz0U/CbDSDiBciCB7F3PoNeH2lvwVn6lJAIGs=
X-QQ-mid: esmtpgz15t1763127165t49f36372
X-QQ-Originating-IP: upTtG89dUR6BITyX4XCOKRP3GVJT7+Owo5qsvFsfV5k=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:32:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2566697099854471615
EX-QQ-RecipientCnt: 11
Date: Fri, 14 Nov 2025 21:32:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <ABF94A5EDD24501D+aRcvfFgny7UqgLZ6@troy-wujie14pro-arch>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
 <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Myi7noze6Y4xnUZa/0lS8FZRIQVlwhxbYlc0fZSgTrgDyFjAqHKqpKkg
	ddiVENpt4JwzpqO4DF+nwYJq+MUWfOeDctBsnUHtTQu27QtYd0bbkjmVrZqxJ/zxyoEyTJT
	ecRhs0L07JYsaYGGNuEd1zt+0AmPi6LZin7cs9WhmA4wzo0CtPbyc3iRLDKiLlLW+uhqZy0
	THLIjGMOw1usVbqPXVNqMTBFn9dBgQf9MGfpllG+IVkjKKbbeJVURrbujuyszYafpkNdU5V
	ktfRb29zcZZwxzoj/GaK6GRHZ9Vz1fHsWcY0F6pDbOKtPCErhzIiHIQY+/7ANu6M+GU2fRz
	oer/cKbeZBxZIfz7X1OIsblMKpAWD+PO4ZZazP9lHJZdTHOwPkmXjxWtoBw2VO9PcK7p4+G
	PWrIEce0QdeYcOKTxFRd0jvDQq7+MIVugIYWBOlmindL3S8SmRNDpPrjcJ8QLNQwrpuU4DM
	V2riIqrGDxZsE7LSA3PeCW7cqKmaSozE+5rhHDGZDq6MqG0dioKYLf+RbLPqv+lOoEeMS5A
	2dWBMwtzGEeQM/dSZApnAyJ56zUUsTxAB2nr6LqsvTvwderwx5wRofBkrROfA7Gx+0eb33T
	YHmaX7QvtTj55fmeU9ioVV9KoJ2yOvARH4f65cqbzjvbEN+gIdCCZtdSJCRoZyMbFICEDwH
	+heTer339Po86HhGJVB/pJqEc/8wsCh3dsZxlRLy86wOFMeI1YvQG6ZAhx63IvbtvzNy2/9
	gIElw2zp0ZZMcRME9yFe8/giWbU8gYPs2HdmGVnmkNvQgB8O9ZYuHorJtRSw0wI5BOVNl/f
	bH/p3a+zvUMruE5TZMCf2jWL9W+eilRDgV2A8tI176J3thNgsu4o7Cak28KEzEx3nL9GKfl
	e2V5LzrvNa9wdbCrODSfqIUKBgpVxi+8LC9EsZhBXmUPluCENlzTnEdalqnaRadH+eGlzJx
	Lpb7znl2+US2GNPyC6CYSnSdLkCqBhfKDiAuV+bd4l+hE8x163h1NDYEaS8XQXB1z9c2aiy
	YHyBC1HNviFzxHshvMkjG7PvNDL4cvoKsry/gEJsPi4ErCkqzN4M51ro+4CQuUGEohgSh3K
	ihC6c+ugHMlBo4Zy/ymtjwJIxz9BdPPUyxCVT8EAOvN
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053409_986445_471D3FF8 
X-CRM114-Status: UNSURE (   6.36  )
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

Hi Michael,
On Thu, Nov 13, 2025 at 03:37:32PM +0000, Michael Opdenacker wrote:
> Tested successfully on OrangePi RV2.
Thanks for your test on RV2!

              - Troy
> 
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

> Thanks again
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
