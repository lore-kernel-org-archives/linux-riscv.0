Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D7606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IwPlzIqg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DcerM+8RuUvqHnXNF+u0k3H1+bJs51RQ2e6F/4OiF24=; b=IwPlzIqgd+P/UIAbaS5dXO7z6C
	v/8PrzpqrtxhzKWvF5m3yaX2SqB3vLqZz7xWyJQPM6sniv5/X7T6yHdeUf3arTFW44BkWzlUR1zwR
	PxYOZNa5xvFktWESEs6LS1tmIALJjhIXgtsJ5cgyKORy3ZfriQRdkpqHAAdf+OHEW5syO9iWO3vhq
	du0UJd5jUpJ0hEbIijbUlrtZgdWNjKXtbI5wQjOrI73Q2TDOD+IVFdFrd7wZna/eu44C8sZ2Hht0v
	9Hm5jYVN5U/fYVXDNhN3dPRMBkUkSYnglnJqUKSZZjjctIZM152uFmNIGAxRd++DENW50vnpVi+lv
	qfY1W1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPD1-0000000FD5z-1nSw;
	Fri, 20 Nov 2026 14:03:23 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPCv-0000000FD0Y-3f5z
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 14:03:21 +0000
X-QQ-mid: zesmtpsz3t1795183332tc79d3492
X-QQ-Originating-IP: 8MUBfue/CSK9C6Ko0L4h+J8TmiUajD4AQmf5ZXhtkkM=
Received: from LAPTOP-H63V2Q11 ( [36.110.52.2])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Nov 2026 22:00:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2838506993678247511
EX-QQ-RecipientCnt: 15
From: Zhouqi Jiang <luojia@rustsbi.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Anup Patel <anup@brainfault.org>,
	Andrew Davis <afd@ti.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alejandro Colomar <alx@kernel.org>,
	contact@rustsbi.com
Subject: Re: [RFC PATCH RESEND] riscv: sbi: expose firmware identity in sysfs
Date: Fri, 20 Nov 2026 22:00:09 +0800
Message-ID: <8E061F1E54130DAD+20261120140009.755-2-luojia@rustsbi.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <20261119-zoning-appeasing-71d648cfc78c@spud>
References: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com> <20261119-borough-flap-6481c20b3013@spud> <20261119-zoning-appeasing-71d648cfc78c@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:rustsbi.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M1JP5WkaVWo/JK7CrDexK/3T8UnQlC1pSI58Tb3okSZJQgbGxVklkUHn
	gfeAgIPei0jw38cTyzzz1YuX2v+h+ZpEG0gVHwqFN1EphgnsUM2UOgOPpTPVlUxLD/J90b6
	3lE37/G5fMwUNLECqgNqfzpT10BqNmoJ9xHJbiNLpDGYm0vmFrQW5CPJli+i0En933/Zo2E
	lkY8e6Fu/XN2kYg1j43ytZZJ+ihkdf1wzQSaXlnCuZRquwjRTEvsGmpFX/QtosJTccd6Cur
	QLhnXGsGoBGbdpSK1jtI/wk/pQjhICYreVYnKhGgT2I36GIHst6//5Kd/hhAWzb6NSv70xu
	wxw3cKdkUHEwcrlsnlO3J71bO8hZcOFRDdmW+RAUwnP5LVVAASbAPA9Yw9IZpaH15zN0tQ8
	rhkfeAXHvNU6FP5AU2uU268SJI3J7269Cv4raZ1Zw0ea9j5SrWXNhXTjsL9oePYByDEckE3
	TyNhYaEIxGSQgPHj2E7L/0O80a80X5EChqDBwI/f289Sv667uvss8DIIHddxxTD7meqvw42
	/qSMJmxd/GuFFfqOPPFJgq4Ke9hwps6bkw5Yw2eyJ4yLtS1IkyXqDxttiD2WlZEg2lnmuTF
	vqRX0T8OQllxzhxFO/lls7KK73WAZ3ciAtuBdEXU8l8pHHvDcjZcVUIeg/kWdGB2LpVYb+T
	Cxco3o44IZ42Ofukoe4Wq4jMgbQKamppqyZUuIb6k1cqkzZ6RNItVtX9LItS5kYivm1ZsNe
	uu/PFKjmSFUNBxz6nTSeqXmkUJz3vkMbxUzG5CR0H8onxUcez0Vax/d9hnjokhP1CTKDcc4
	wyAQXG/5J5kW4PSZ2PKMkm9mb9u3qBPbKik6jj3y35zk45V2MHSsvTzLPVgz+IO5B7RdSb8
	1CAKzjU0LAP3KSaqdm5mdNmHKjLj34n4unA7XJa5+8zOJrQ7xV7lIuVbfBbXxQzTKtGn8kx
	bgf1i6mUwMonvCmxanbdXyPWsGyhNv6vkxVpPZ+kWqh9fdS2ukJPSaYq2KVN1eSyD7FM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_060318_433706_65F9229C 
X-CRM114-Status: UNSURE (   5.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

Thanks for the review and for testing this on PolarFire HSS.

> FYI, these tags are now deprecated.

I'll drop the tag in v2.

> Should this actually be printed as a decimal?

Yes, I'll use unsigned decimal for impl_id in sysfs to match the SBI
implementation ID table and update the ABI documentation. I'll keep
impl_version in hex because its encoding is implementation-specific.

Thanks,
Zhouqi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
