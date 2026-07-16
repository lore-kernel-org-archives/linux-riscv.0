Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E4C4450E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+qWcgog/1J+wHipJPbQ8EeI5kxT8zM/BDT24gHzlns=; b=1u2T+PuYkJl4Gl
	/2FwkaQNjrLRtK9hmAo0nmO+PuKbT5sx076+0sGk32GKHCK5kVxt+TkwEL3UTpmOMaVBGfvXhQYi6
	7YRydouj4cDnFxrma1mHE/Dt3N/X90q3eysD6aOs8NJnIs26dLSTSDiUogtB3hnAyb8NhNSmkfIV+
	S8lp2clQ2uK3uV3CH4attaoKiMYWSItpeJkkD93QangPRmS11h7l4IEtKzfJ75+UZ7A+n6Urnxa59
	RyCQyfzEVRFfsJwEZ6t8THLkGPwhI9XvGK3i9BcClWxZzebr3b7WavqFUTT7ojocc6Ll2yINo2NBj
	DCmrE35cBVL+yOQ1+oBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKpd-0000000HCTS-1G7c;
	Thu, 16 Jul 2026 12:04:49 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKpa-0000000HCSQ-25Jt
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:04:48 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACnf_PUyFhqVZ0fAA--.22460S2;
	Thu, 16 Jul 2026 20:04:36 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: xujiakai2025@iscas.ac.cn
Cc: akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	david@kernel.org,
	guoren@kernel.org,
	junhui.liu@pigmoral.tech,
	kas@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	muchun.song@linux.dev,
	namcao@linutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn
Subject: Re: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
Date: Thu, 16 Jul 2026 12:04:36 +0000
Message-Id: <20260716120436.3503989-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716114902.3455029-1-xujiakai2025@iscas.ac.cn>
References: <20260716114902.3455029-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACnf_PUyFhqVZ0fAA--.22460S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4
	A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwI
	xGrwCF54CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GF
	v_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	0JUlYL9UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBggKCWpYolRpMgAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_050446_912866_FE665EB4 
X-CRM114-Status: UNSURE (   4.10  )
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

Hi,

My previous reply containing the kernel log and the relevant kernel
configuration was held for moderation because the message body exceeded 
the mailing list size limit.

I have uploaded the full information here instead:
https://gist.github.com/6eanut/e4302872c5a761f10f2e2486505bdd2f

Sorry for the inconvenience.

Best regards,
Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
