Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1DC606A33C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MvrL2PXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0l9UdzskMI2U/dA+O4hD+XrBRwGNrwaepfu5wZouOvE=; b=MvrL2PXUe7M74mYS4s7Uy3RK7X
	bSPLQVjt5eUkvAPYCJ0iUWTKjIL/v4EOCkqkBsvvwTaFlwbt1AtP2bx93VViKds5Y8JzSqodByeso
	jqs9GvohgvxeSKRxAg1iEzlf9z3wSBZ1bZbIu4O+qegIc/HNlgysZft/RUdsQTid51E8fsS9/vfBl
	JNQaD1Cn9WEDgAsMLnIDIVEzlTyUnErftofnDROg/JTqviXyfcoZeJkZVV2kroo4OY3tLvuU9kWsP
	pbP/lCGa3+5cilm/wNsSfltCxb+OVku4y+BwUaB80MPRide2+EtVeIr1jfp0CfDiDIpksuCvfG4V/
	PIaDU4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLaa-00000000FF2-2ouz;
	Mon, 09 Nov 2026 09:22:56 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLaY-00000000FE5-0vNu
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 09:22:55 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDHWW7jkPFq6pqJAA--.47946S2;
	Mon, 09 Nov 2026 17:22:44 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Mon,  9 Nov 2026 17:22:42 +0800
Message-Id: <20261109092242.810-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
References: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgDHWW7jkPFq6pqJAA--.47946S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY37k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j
	6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Av
	z4vE-syl42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_GFv_Wryl4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGE2rwpK0rJAABsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_012254_268782_B2493376 
X-CRM114-Status: UNSURE (   5.27  )
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

Gentle ping. Is there anything I still need to address on this series?
Happy to rebase onto a current linux-next if that makes it easier to apply.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
