Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D0606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uUKHRP9t;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=R6k8B3wW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NbWhYd8Mhdy37RlHTjUyqp3wj2o8yux8x3JkFqjH5IM=; b=uUKHRP9tD14RSKKxxPzpMy7nSz
	Bfi6BoH/9K5zwFLCKqVImaC+JNeqaIVayaqLNp5/YgP9nQQm04oyVX310VsvT9ilSglqwAbwQxNR/
	OH6MBC4fQ473sSpO2SuNclyBqk4F/bAjaSJmo1LXv2t1KtNClzcIZDFoerbRWhAaf9cZlQdvSRfCb
	HL+N84wciNLJaRT16C50q9orFW2I9gXdiEEqfN+b71W3d3Ye9SCrtjPDP7I3ZJjK2V9jqRdv7pRtP
	vG7ixu89pMwd4xPmy8fwFAWXBux9JYM2oME9fYoPqkGsaCbndi317SUGv4QSmzj4CCF1J4y7kvkjq
	T4C6fJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRv9-000000035L4-40xQ;
	Mon, 23 Nov 2026 11:09:15 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRv4-000000035JO-3pfB
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=+kDopycZnDAP9HA19BBrkkNf4GaSRLyZa
	HpHCwaxUpc=; b=R6k8B3wWpsiObveZeoFHed2EGTGDnFK/0MmJcI8iybAPk3FF0
	pJQ0EDMJ5VaLgj7thKOpbCuh8pWZSJlpeyZDf6gQuLeL7oUj8L1WPtMvc/97H09n
	lzYtebxKcWeCSegQDhjBnScZFBSLUxWY4UZRU2J+koaIlXN0oF6ZJY+T3U=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAexHgRrhEgEAA--.2091S2;
	Mon, 23 Nov 2026 19:08:33 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261118-unimpeded-swapping-6b1b3e5bebba@spud>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
 <179501112283.639563.5233054429317576626.b4-review@b4>
 <20261118-unimpeded-swapping-6b1b3e5bebba@spud>
Date: Mon, 23 Nov 2026 19:08:40 +0800
Message-Id: <179543212034.1604484.9462414929447940252.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795432120; l=658;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=2XLgEq6VwPYO3u9Cdwe+eXzTlcnJKcd6VYZ8ir9zoX4=;
 b=aKUFY1rPQkOEW8tfiUw+ybT22Zp6yoFu8w2dZgnGnPlt9ibfbxWWEE9JKWkooBYH/PP4AKZCr
 UTCWh0XY9DvBDMZKPe01jKMlplaefeGjNl2vREUNTEe+gDv5shPr6X+
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID: AQAAfwDHQAexHgRrhEgEAA--.2091S2
X-Coremail-Antispam: 1UD129KBjvdXoW5Kr1fJw13ArWfCr1xWF48Zwb_yoWxXwb_uw
	nayFyxA3WUCF1xAanF9F45urnF9rW0gw1UZ34Fyr1xCrWvvw4kWws0kr90vr1Sva97tF9I
	krn5Zr13Kry2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbT8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRCCJPDUUUU
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAADmsD4rIADQABs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_030911_878675_9EE316DD 
X-CRM114-Status: UNSURE (   5.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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

Hi Jerome, Conor,

Thanks for the feedback and the clock Ack.

I agree that leaving the company does not necessarily mean stepping
down as a maintainer. Unfortunately, I am no longer able to contact
Jia Wang or Xincheng Zhang to ask for their confirmation.

Following your suggestion, I will send v2 adding Fei Chen and myself
as maintainers while retaining the existing entries. We can revisit
their removal after allowing a reasonable time for them to respond.

Conor, thanks for offering to take this through the RISC-V tree if
the subsystem maintainers do not pick it up.

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
