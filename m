Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADD606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dt5Gy1eq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=H9SoAKsb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QjYLRwkDF0kfKHFybGVrIxQrkkYv4uYOCNgLpNl5mO8=; b=dt5Gy1eqAQDsooKFTpRcafBZHS
	W1Pz1gYWBHYEPRRxz6ot5pS986TJ85sm8PKVMUTzPFfeqTpECXo+Gzng6/eFOX7wQ7PeR/JWMf9ni
	THGz70jWQ52RhW7tldUWvnNpuI/VnG+refNhFOVjgrvMDvd6P3isbh49EmX+GzBTzNTWAPIqdl6US
	kp8jR5d18PnqcvIj2fnEgWFiQzTonMYwfjeUg7MceCprFdFiREGyK7mjQmCjDLBr1L9V0dwMT5M5W
	xmApjKSVmCdWgLWkm0uFMEuYMOqFz2Gb8T6G1GcUt/kKQ7VnJQuOG4zvCt1JW/th05a1/3QBd2cau
	sKYB8vVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yH-00000008C03-1sbj;
	Wed, 25 Nov 2026 01:38:53 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yC-00000008Bz0-1voD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570715;
	bh=Z5NvmDfoOMh8nWvdrDVFy+6gwXUkjwkZJi8F1o7NcSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=H9SoAKsbfgmnqQojp1je3aWPSAnKANkYuC+TWH1Zv4XbB/Tk9fbnzHEaCJ6g3g1Gn
	 cpcuAWSAm8CndjB2QtS0vtBkgnJz1e2Rp0K0cNR3IwIW/7SViT8GamABblcHzOUoDI
	 j6/S/kO0Y/LkN564peXk0bO7mRPOYKWv4WMHK/hg=
X-QQ-mid: esmtpsz17t1795570713ta358a06e
X-QQ-Originating-IP: 7nEOW7i3Kyhwc+ETQLBoqO76AJdyJ5JmFW8JFTW47Ik=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5425572140736427969
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Wed, 25 Nov 2026 01:38:19 +0000
Message-Id: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywqDMBBFf0WybiQZNWpX/Y/ShSZjnVKNJCoW8
 d/rg0IXLi+ce87MPDpCz67BzByO5Mm264guAdN10T6Rk1k3AwFKCplz3xUaG+q5t5r31KDjujB
 VJLLMQKbYeuwcVjTt0vvj2H4oX6j7zbQRNfneus9eHeXGHQEporPAKLngkUoBYpCmVHh7UztM4
 Q8NtW3YVhrhzyXTUxesrhxUbAQWaZokp65lWb6maOhuGwEAAA==
X-Change-ID: 20261019-spacemit-soc-timer-cadf3088d286
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=z4UmabJALYVuqfx9tXza0VVqatCCYFgC19fmlWlxTfI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqL3lxr33n8sYT+5uHC+vckSDjHbq8a9U0pWeGVw/
 bnPWDa3o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCK56gx/Bebxq4XmNNYlM3as
 9z0f9L29Z05ctuf194f6hY2Ee9IyGP7KmV1fyvtr2aL6taJrYm9uWqd1bt7upaoB4fcmH9KaKR7
 MDQA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MYQNnnlvmY00f1yMc2/KR8kw6oQZDV+VgxDCGN2Y0O2S3ISveEMN0bb5
	FCHszBpxoGcAmLSIOxdt2FTR1EfePjxNstuGFXt1m/adR2wERoGNTR2/+UBpQ0gfU3YTHTh
	a6t2tpjIKDPpQC97CZ2GgZMku7XQ/2pxUtaqzaTM+aw1TIJmubo9RssaxDp/uj49Uca2lJr
	Xr28f9IHui97mcmwEYYOlBzmsG57Q+pxBD80lBg73cfMO5cB0diiBAuLj56JV/SUZRilcYs
	OcaYDXrhgsGbQtJ8WB+RHC55AeaecEiKcH7e+nzB7QZquB3RUIYwulM6ggQMMZJ5bbtiAVD
	CUcHuklO0yAqzFsc7v+VZEGKwZsw4noVt5YReHNW/0yvis4igHhuXQof+cfXkCkhk7/zBK0
	d0AmxgLH/IRPgchbVX2CqIJ8/XQRSDdtIpNl4qJPG8R34eztn5GqGJa7y+U4NEOFmoceTv/
	RCkvNgx1ohvGBviqyB9L3Brr+F1PXPyx/3F8FkuQb1Dc8m6/Gfvml29j4MTjFfzR3QOonxm
	LaXcSMSobKTYoQ4xhHqjHg9YWEL+ejCcSc6d9W0GjiWatuHdZcMtADkueJf2vj4o8+tN65R
	krQzq9zjqCz2Faq5KfuhNbDp8IYumF3ZiVGGjyioGzII8aQuBbYJCPguAvmtOkfqWsvVrjV
	GO1jDcGH9OmNq7y1oMJ2RsD5RLc65V2TBDSaKUwPfcexX5/mcIIBzS58FNAafoVOb4dB8yk
	vHZPNKRJwyNBcc3vaP5n7CXDRv9mIdmJ19mWN4RU8hs0+6rD8amePvYNdt6dv9fvppkYGOM
	0eYusVZKQYdKgFCkOUO72Kkf2mCXClYParxh12ejxBz7ypBP8cfeWj7vNh73xDWvuhZ7CvG
	XPE6wc41O7wxcxpVQrUrpHhINqSxSLM4ao4R9CkI8BNBdwlfnhGgvVg5/ll1nV4LrlGcp8G
	LjeWgY53B3AM5biXO5AZojmTarbXVSNyiCzeZjpzK1xhHxyJ623PZ5wZmEWh5zRl/i5GeD3
	zLYGkuq3Wbq62LZYbGehuVvAX6n8ssPAPuW2KLboKxL7Ndom7oHA2/S/Wms9trcEwvV8eSR
	f4VRSjBdjOZ1iosANEi+KfH4VN4O9by7uKSPcuRn/OYcEfAl/WBunTDm5Tks4vs8iMoU+yQ
	iGPxsCadXnKiDMs=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173849_302258_B04589A5 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SpacemiT K1 and K3 SoCs have APB timers that run independently of
the CPU cores. Each timer block has three 32-bit up counters, and each
counter has three match comparators and its own interrupt. A counter
can be clocked from the functional clock or from the 32.768 kHz clock,
and can run in free-running or periodic mode.

This series uses counter 0 as a oneshot clockevent. It is registered
for tick broadcast, so it can wake up CPUs whose local RISC-V timer
stops in idle.

K3 uses the same register interface as K1 and falls back to the K1
compatible. Both SoCs run the timer from a 1 MHz functional clock.

---
Changes in v3:
- Drop the unnecessary RESET_CONTROLLER dependency (Philipp)
- Link to v2: https://patch.msgid.link/20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com

Changes in v2:
- Use named constants with comments for the counter sync latency and
  the minimum clock rate (Iker)
- Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com

To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev

---
Troy Mitchell (5):
      dt-bindings: timer: Add SpacemiT K1 timer
      clocksource/drivers/spacemit: Add K1 timer support
      riscv: dts: spacemit: Add the K1 APB timer
      riscv: dts: spacemit: Add the K3 APB timer
      MAINTAINERS: Add entry for SpacemiT timer

 .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++++++++
 7 files changed, 430 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261019-spacemit-soc-timer-cadf3088d286

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
