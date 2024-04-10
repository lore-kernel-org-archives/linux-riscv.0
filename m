Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD65BCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S71YctoepE38f3yGN78/C5zcDZI+YjKPAI6DrfAzZHI=; b=Wn6cjxo8caUwfvlrpit6IWjzkY
	E3wB1d7PEBijC9ASqeAn1XzT8I6YXsRB6o5uqc6BKQDJtTI31xkH4hPSOPt9NmjjwrYSM8N4jl3FW
	3EgqjQbMV1Pm3LRquu4dFIYJCGyueatVg6PCioVrG4JBwBjEnrSx9dnULivKT+IgJm2HjQJyTTOw2
	OotlaiXdTJnc379wWGS2f+81cav1WdUzpHYpYouzLVwTThTSYXaCFCTaF1FGLvr8XiP4HjVFsStPY
	sTPY/BIPxcJiQIkzTxFW3rr9xXRYSmdjTVGa/KPeFXx287ZUZV+1fYyQAumIpQSNFJ3Sp12CFcmEK
	k3OPrUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUNj-00000006BRY-3Fd8;
	Wed, 10 Apr 2024 09:36:39 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUNf-00000006BMD-0rzC
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:36:38 +0000
X-QQ-mid: bizesmtp86t1712741709t1j9dvxx
X-QQ-Originating-IP: UlX+U0HDn8U2wZOPMdV+GrEUZEAqhBp6L5g2wVnl0vA=
Received: from HX01040082.powercore.com.cn ( [14.19.178.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 17:35:07 +0800 (CST)
X-QQ-SSF: 00400000000000B09000000A0000000
X-QQ-FEAT: Gg/rOgmEge/NdIqCpZvkuVgy2frrl2wIfYRWto7rpHg7PxnU70es4ZHQMstKx
	nVA80ljUsv+MGwF43KZcabPuqFDRNKi2LugMuiiUkXKrJZdMwWKk2mlizvKQQKyC6JJfmIZ
	84exB4Wp9i/AXK+kegVX6S+Rti3fN9Fe8RpZU3X0yg3WJPYA5gEY0Ej663A2ok87+uBItI4
	5wEvgW5Kgp7qY0ZL8PgrIjXfCWTBC1GddSrW1MYuidO9vOwdmAFMLrc+irGJtfxIlxcz3dT
	ojwpUwcSZqXC47Q7OM6ApLmkXbOWGZ7Vfi9Ua1MO0w32hBX10ooUKqpdEMk5s2LGDIiwf8I
	LJYHird74EwlEYlIDsSrXanwB8UqLhEW+LGizET1oBAhi9F57WJKWUX4JAOfAcz0U6L7X9r
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 4513538048317919293
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: bjorn@kernel.org
Cc: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] Add early console functionality
Date: Wed, 10 Apr 2024 17:35:07 +0800
Message-Id: <20240410093507.8312-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87y19lpub5.fsf@all.your.base.are.belong.to.us>
References: <87y19lpub5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_023635_824278_EA3893C0 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: multipart/mixed; boundary="===============5378500026943166321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5378500026943166321==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Thank you for taking the time to review this patch.

Björn <bjorn@kernel.org> writes:
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


--===============5378500026943166321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5378500026943166321==--
