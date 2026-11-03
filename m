Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403E606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaqKXWr1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wHwreRWJR7vgZbev4SBvClXZiVtNO3/0biDj+D5GyE8=; b=uaqKXWr1YXvY4aNvlP+iFrRUB6
	U8hrfd1rp4/ve8FqaRQQL897kSE4qFbUpKqjAXNeVeIelRVA6bW8DT5AAVpC9A9suV190+/sq6/qH
	HdvGZ9UABbNsi1ZbImEfPfHOE5/W5IJrP7lrhim0/RkiVVplKj4gaLHZoQcZHbe5FoSir2Nx6Wwel
	EfX2RPjNYeCIrjWPkQsKXRRR0dAkOiEi3eOG8pVx3yOCENFV3TcATjWZZBKt8xvP6t8qIwSfqMDt8
	8K3c6DOJonlaqNAYfvHOL4d/nkqCBCj94GUQJLtSFT4+ShIY3+Lp+eYhHsz2OXmAPoktad4cVzbcZ
	at3DbkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7Mp-000000019jt-2Kdd;
	Tue, 03 Nov 2026 05:47:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7Mm-000000019iK-1xCI
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 05:47:31 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-01 (Coremail) with SMTP id qwCowADnE_5ndelqIhI0AA--.57481S2;
	Tue, 03 Nov 2026 13:47:21 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Subject: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Date: Tue,  3 Nov 2026 13:47:16 +0800
Message-ID: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnE_5ndelqIhI0AA--.57481S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rAFW8uFW5Ar4kWFy8Xwb_yoWDWFbEgF
	1xJFs0yan7AFWrtayvqryxJF1fJw4akwnrAw17CF43J34Sva4FqF97K3yYkrW8uF4fuF17
	Cas7X3y7XanrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_214728_927533_37D64B51 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T-Head TH1520 has multiple system controllers for the "subsystems" on
the chip.

Add them to the syscon binding.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca22..b9d45f98345f2 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -126,6 +126,13 @@ properties:
               - st,spear1340-misc
               - stericsson,nomadik-pmu
               - starfive,jh7100-sysmain
+              - thead,th1520-syscon-ao
+              - thead,th1520-syscon-ap
+              - thead,th1520-syscon-dsp
+              - thead,th1520-syscon-misc
+              - thead,th1520-syscon-vo
+              - thead,th1520-syscon-vi
+              - thead,th1520-syscon-vp
               - ti,am62-opp-efuse-table
               - ti,am62-usb-phy-ctrl
               - ti,am625-dss-oldi-io-ctrl
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
