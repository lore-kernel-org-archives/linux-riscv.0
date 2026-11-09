Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28494606D80E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFo+WCyo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VEV/XNlPjzXbuMreqJMflBlYovvJeKUkhS2Gs/eKW9c=; b=xFo+WCyojdyYTVEBXdGCdGuAd3
	1yd75yPTQJHaljFzpPP+VhliSdAGG0iOioGEfy5TaqXCQQLPEAlqn7r/NTDGBN3EvcT+7Efqim02N
	AHm4RgPP+lnbs8jwA8DsdrjATGcFFSZsyOE3p6TPr4IZDVOzvr3JZpg7LNNu9p1PcMTW9V4GnonMO
	mlB1VeyVV5hXXg9zOVyS/qyVh2+ledIG+VlsMmDkjqKSNY75ideucJRCyGAOAj/MJh+KY4nNPGyTt
	6Sz2NMDzktQHrC9yHtYfF8wzTLFe4sPo+E7daBQjMP0rjGiayR36f7dKIcZvSjs3i0qOKTyxacqjn
	kfEmIjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLY7-00000000EcE-3Zti;
	Mon, 09 Nov 2026 09:20:23 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.78.106])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLY4-00000000EbP-0Kmj
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 09:20:22 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDX3Zs+kPFq8X+JAA--.48044S2;
	Mon, 09 Nov 2026 17:19:59 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Mon,  9 Nov 2026 17:19:57 +0800
Message-Id: <20261109091957.645-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
References: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDX3Zs+kPFq8X+JAA--.48044S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j
	6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Av
	z4vE-syl42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYx
	BIdaVFxhVjvjDU0xZFpf9x07je1v3UUUUU=
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGE2rwpDcqUgAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_012020_621896_9532C5B1 
X-CRM114-Status: UNSURE (   5.31  )
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

Gentle ping. Is there anything I still need to address on this patch?
Happy to rebase onto a current linux-next if that makes it easier to apply.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
