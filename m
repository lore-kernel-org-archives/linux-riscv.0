Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8879A105F783
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 09:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2mX+FzhPCQPCIRbUuJOAbuRSvOHtonUibBHpT7BL3E=; b=pS1yXkPElZVmvG
	LTs1zpJoCC+oa4kNYk4P76Ih9efJ0HmCU0tnjI39vxpFzgrPeHIF4TWPNZJSEgmF1DcTUyvRFGoI3
	w2bBE1RGb09bbBRhoQtsf2lmcshrDzfhLVlYcWEORRfNSVjUZG/jrc706TQ667Ex6PzMLS+OzYlEh
	ogBlZa1UAERmZNCzgUvqCcJaAhzMNfNT2NW8EpL0Qjd8Fk08qn6cPZ19a/rZAQsvMK/jFCu2K51JO
	Dvb8LWkq34EGi4k0HhO0LgDio2SKeib0NyRfiLpbva7BrsMZTt1mjf8+7NiiJ35Gu9Vh1ubXfeJEh
	Yu4J/O1Y+61VWr1MuKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yhN-0000000HMxC-2s2q;
	Fri, 13 Mar 2026 09:20:49 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yhJ-0000000HMw3-2TOb
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 09:20:48 +0000
Received: from Mobilestation.localdomain (unknown [183.6.60.7])
	by APP-03 (Coremail) with SMTP id rQCowACHqeDN1rNp8DWJCg--.26183S2;
	Fri, 13 Mar 2026 17:20:35 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: andybnac@gmail.com
Cc: alex@ghiti.fr,
	eric.lin@sifive.com,
	greentime.hu@sifive.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	paul.walmsley@sifive.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	vincent.chen@sifive.com,
	yongxuan.wang@sifive.com,
	zong.li@sifive.com
Subject: Re: [PATCH v2 0/1] update riscv prctl for discovering V extension
Date: Fri, 13 Mar 2026 17:19:52 +0800
Message-ID: <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260117233228.36088-1-andybnac@gmail.com>
References: <20260117233228.36088-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHqeDN1rNp8DWJCg--.26183S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYg7k0a2IF6F1UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v
	6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r
	43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRAxhl7UUUUU==
X-Originating-IP: [183.6.60.7]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022046_023962_EDF74B13 
X-CRM114-Status: UNSURE (   4.49  )
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

Hi all,

It has been a while since the last activity on this thread,
so I would like to gently ping for comments.

Thanks,
Zihong


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
