Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112C606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zfawj9QE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5MC+Oj2BU8eS9siXOq8Kj3T0Oh6rfBZ9Z2cPDWV5pRU=; b=zfawj9QEo/uBWAuhgbv+yHAN9Y
	MYqT2jRv+TJesKsVCtsiAAxpFXor7dQ5KyVDiJa2h7N3jr4Dd6UIorbVfNeuHQb0eNsQsOSInPbTY
	7kuCPa1LNqpjlbUPEPg+chatEjC8VoShy1SPcSbqAQ70Mj7m9m6pG4Xz3YTBVZUwX3UED/6SQw0oo
	9e3Ui4VKkIanX7Gp+sKR981gfl5nHH3ik0h4TxloO2DAkKK0TLFb0LG1P7zF17biWSHqyipNBtrk7
	M0fauioKuY3+9nCITz6vm1NzwImJrBOji/avkl1noDpIVmIw4lWLUBQIHYi+FQQ4xctQq8Or+tzZ8
	/W+axJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9fY-00000001VmQ-1wjh;
	Tue, 03 Nov 2026 08:15:00 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9fT-00000001VkW-1vXN;
	Tue, 03 Nov 2026 08:14:58 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-05 (Coremail) with SMTP id zQCowABH4LX3l+lq3fQ9AA--.19826S2;
	Tue, 03 Nov 2026 16:14:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
Date: Tue,  3 Nov 2026 16:14:42 +0800
Message-ID: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABH4LX3l+lq3fQ9AA--.19826S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4xWr1rXF4rAr1fGFWUCFg_yoW3CrbE93
	W8ZrW7Aa1Duas5GFWjyr1xXayjyF4aqFykJF1Fqry3Zrn7Z34Yv348uF13WF4kGr45GFn3
	J348ZF18ArnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_001455_874786_CA503076 
X-CRM114-Status: UNSURE (   6.87  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patchset is split from the "Add TH1520 USB support" patchset,
with only the PHY binding/driver part.

Icenowy Zheng (2):
  dt-bindings: phy: add binding for T-Head TH1520 USB PHY
  phy: add a driver for T-Head TH1520 USB PHY

 .../bindings/phy/thead,th1520-usb-phy.yaml    |  75 ++++++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/thead/Kconfig                     |  12 ++
 drivers/phy/thead/Makefile                    |   2 +
 drivers/phy/thead/phy-th1520-usb.c            | 179 ++++++++++++++++++
 6 files changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
