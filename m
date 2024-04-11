Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12C7CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYDWmCk03pF5RtH23qjamqDtehs4jXWAGseeh721KiU=; b=XnAQhsEJrMJ9O4
	5w/SzuBALpPggnc52N07DZKxHr+5Trwct/tXUf31TEL4CA9r9+tTU0mbucUgCiWPpMIEzQDRKVpNt
	NgouthAZ6wTy5cz/SN7pcKTrIE39zGjpirsPDu5b+MIo0Xj6gNc/VaHCWvAww65BdE/HOMN1DT4uY
	E1PtAw//zMUB1c8MvX+9hQobGZXcBbUZUlFCjVjoGjJ7duq0bvu0sYp/6x5AXAoukabRv428yZ97a
	DAK8U3V5LKHuVzmP0E+T1AstKbqja+k34Clzh5pBUNw7/1uAynWHLCtl9UcLBwmLA4hkkoeNAc1fJ
	xx2EdjusTBVHOeFSSjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujci-00000009uK6-1qWj;
	Thu, 11 Apr 2024 01:53:08 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujca-00000009uGm-2UgE
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 01:53:07 +0000
X-QQ-mid: bizesmtp90t1712800304t1ksuc7r
X-QQ-Originating-IP: MIR7lNCdXm2gxJlu1KOUSY0BdyMnYLIqBuKiWzcg/GQ=
Received: from HX01040082.powercore.com.cn ( [14.19.178.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Apr 2024 09:51:43 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: zT6n3Y95oi0rtWnXgdbUTchQrChx9AHGrXslGgx/sf7vMqCwU+36IS0UQL8+/
	tgIX0Ns6fv6B/lTRlMBRJrGgdeeM1y+STtw1ZKRpoO7GbOJu6wgdtlYz00ISDXa5CMTYAfR
	VrScp0TqdkyqhAq+fn7ZgsxQO6HNKh/iiEmmiP6selOt+4skjcWmWbuteJICvtVG/vB8AmF
	1wDyAlvinUahCav1JnIq0HZvyNNPZNi4U8bXOMJNobsdqqFyBKyLQTmWJQ0CBh7GudJz/bj
	Xwe109SKfzZp3W2EcuXwb1n65yCtpYSfD5fmOsA/T030prwm3M5FmthrcRB7Frw5HaSA6P6
	+t0PceOQKnCEZQ4Xd/Z8Sr4PPNbkVhMyl0h6lNVV+EtU/HlKFYcEg5de8VuV8s3ipwbeMAK
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 16034395823288831725
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: bjorn@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] Add early console functionality
Date: Thu, 11 Apr 2024 09:51:44 +0800
Message-Id: <20240411015144.24901-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87y19lpub5.fsf@all.your.base.are.belong.to.us>
References: <87y19lpub5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_185301_148041_7AE493A8 
X-CRM114-Status: UNSURE (   8.46  )
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

Thank you for taking the time to review this patch.

Bjorn <bjorn@kernel.org> writes:
> Jinglin Wen <jinglin.wen@shingroup.cn> writes:
> 
> > The following patch series implements support for the early
> > console on the RISC-V platform.
> 
> I fail to see how this is different from earlycon=3Dsbi

Yep, you are right, this patch duplicates the functionality of
earlycon=sbi, and should be discarded.

Thanks,

Jinglin Wen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
