Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E640EC43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zNu5selFnkMnEOwVfXRd9o9l1Sc1pD0KesLodEC6sg=; b=UrcEVlXX9Vc/Jv
	ttKsbo4yTtnbQaJfyfeNLQEQdK0xbaMz6br+Hd9gwZGX0R4dAya69aVmZokzuTSdUlY1HtMFRtUcL
	6ChLKDVCWiXy8C1ef7Ukp4Iqf/RU9DadZIzkiYUptAGh2BooOQBk739uExlWtiHbseOzA6fxL3L0N
	KVHbpE348k1YGf6MZ2wCC8RAdPY0vKQkdSqNTeddn580dI1UfzJw/kJ2M42ehelOGbAFq09j5vGXf
	xqQLO8xVVnnDwSzopoKzA/Tyf5dufhbqg0hCP/dgaKqpd7LcHhOqE23d/r7+8Y0Lq+RcpSpJL367B
	nLEemEF5f8l8aiVA/3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCfu-00000003q3U-3w2q;
	Thu, 02 Jul 2026 08:21:34 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCfr-00000003q1d-42y8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 08:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1782980401;
	bh=3tcD0Vtdp21AQXkfTlPs95Zl9wYOFIGlxih4N4h9StQ=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=xxezl0qdjpo20MPGvMlbp5dbtFwVzHpZMnQ6dfhxm1wE05dRaw6DF9D5tsIm9TSIH
	 ES2uW7crPoV82mbRD7xjdxZXqaawHdBEkDVWuD6LmMunV4jhRWe0/mXPhxRszjVyMW
	 03CFUgRq6puciC0PxHxL9q4dOwXwSZ743hOw7Gmk=
X-QQ-mid: esmtpgz16t1782980398t64e51a94
X-QQ-Originating-IP: 9vM7/i79yZjCOzv6+3QoAO5ixH4Sp0huNw3+3vzLCXo=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 16:19:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13503955215817398908
Message-ID: <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
Date: Thu, 2 Jul 2026 16:19:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: anup.patel@oss.qualcomm.com
Cc: adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, irogers@google.com,
 jolsa@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mark.rutland@arm.com,
 mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NQ1g9UwlD56gX4vqCAdAulla5GLh/42qDOBsy+vPBAHJGXiLHvSfOHGg
	qX4OuVKI/y/uBCOPIG74Q8daRdyDeTK0T2FJhGOkg8LgLXSQowePbTHnkrynBEKyH889aNz
	n0e4SttxrdGMe6y7pgICeXl4kciWOwX40iLeN7p6ypgXmLWRBuvMZepjSuFc+aoI8V6HrOe
	w8DH6ikq1WQ0JFQjlX71+mJNq+HNQ+QDaC79x7FzNjPQJJaHMXdeetEBQAkk6/BuJNzSmj8
	rE9m2aJnfsA+fXAhPyOJg3vXTCuw71mRw1e7R8Qo7xs33bAViRDUX+lziGGOh3DQJr5E3/A
	+psYHAIwZSf1YwElW6iLyKdrBQfKi8n8VCIH9s0wpELYECB+Tx3iIxUmZQgQc1E/v3BgN5N
	9SyyBy+c82KThl1UNWTHOatoYn6n9GtT2DgJuifWR2dG55OsYNtpPyXUx6eNi1pNvsxZs5r
	DEY4QeookM+W30E1lgov5bQz4t02McKuzRLsStH4CsUFonR07zc2Nd/XxtziVBSKzXMPkm+
	95OpfL4mCHdNbvtwqxCVNaqOdwOaeF/ZqIttlXSFcveUCx84C5K+Wf0OIQq9EmrbDeT6EEz
	Xdy8EFIq8ZMzLtU8UBQRe8bTqJfL0VX1a1tdfrM15qPeReYiobubgbuungEAvpOeORTqm9Q
	6Gxg2wEN+uXydHjvKx5a5M6etyzGIOU1gpERKSedJZtuMGEtlceiuG3EVw1iEUU8UYk7bwb
	v5Wtkj7QQ/WvDvz0OO/GcxRhcG1A/t7APyqJvbQU9pi92g7w1MoIkOe+CwE6tlqHU8IuL/R
	Rk7zHHKrbG0fI2sfBgE2LLrwEHfLaGNH3M15wlypT1pa3+DFZq3mX3B71hmZJc01jSdirQM
	8kKUBRaO9JHJ9NULyR93+k9wcuE/pnUjBsk0JgSioLSK0S+nnebGCaM5VVkSXqg3Ob86hil
	lZyQ4ycfR1REonE4/UE/tSZZcPfQh6Y6EcJcgy288rvroCOsn4OwJtvm7aChviCNkZ70=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012132_965793_8127A904 
X-CRM114-Status: UNSURE (   2.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkswqAKCkJhc2VkIG9uIHRoZSBjdXJyZW50IGZyYW1ld29yaywgSSBhbSBjb25jZXJuZWQgYWJv
dXQgaG93IHRvIHN1cHBvcnQgUklTQy1WIEFUQiBhbmQgcmV1c2UgdGhlIENvcmVzaWdodCBjb21w
b25lbnQgKEVUQi90bWMvVFBJVSkgaW4gdGhlIGZ1dHVyZS4KClphbmUKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
