Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EF6E6F079
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YPqCpTh2aOZIgZ1InFhEQw9vZDaezQPxZIB3q0cNCMY=; b=mn9zbIPYtx4U3+
	TZMJoFdfOzM+j11SfDz4sQ3LM5vxCxaZrMPrWwpPCMD/mbaYcmBBQZZa5vdQCgGYZuAs/nj74HId3
	G9pNY+r+d4oRbfYNFsbkAMS/KEBp+h5AUjt78oRVYwEEq4MrKfskYQreb0jOka6TfMuf0kejZyM31
	IAmuj2JB8jm3P9J4pQzREl/Irs6ait/S5BJ6gYsYmY4prOZO0GzWylsQnXn+Z5aRilagIs5m+Kkbc
	2tGfEA+LPZB1kiwUVh/7ReszNviHOebmxyadpJ3I3YNx9rP+3ud27Ysls4kFAdVsgX7zauogrhhO/
	WKAN4aYPBYt88/kytJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRc-0000000Ej6c-2FaD;
	Tue, 23 Dec 2025 09:12:40 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRZ-0000000Ej5j-47jV
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481088;
	bh=vkg79EMz9L8oFjhmFaO8dgtw4MQE2grCjBZHqRgAWic=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=gbKwAmvU4EIOf+V2bchUMORtc1g+DyW4jlIWjFFBmdV35+U9OuUvAnQShKrndEHu8
	 cE2uX5UjTqIBrNMd4FIqbTJ6RSqkbQ5nPzRJbGKf5vxvdYd4lOhAS0OG6jzS3KYVxq
	 pkdEjH6fBBR3Muu6VkU/VNTEfJe729yiGsWUcUW0=
X-QQ-mid: zesmtpgz6t1766481075t2d0932cb
X-QQ-Originating-IP: moyYXklt29oP9BlIlW7fWfKsjaaOlmBl7T1eL5JMtw4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12213458338995436147
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] pinctrl: spacemit: support I/O power domain
 configuration
Date: Tue, 23 Dec 2025 17:11:10 +0800
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK5cSmkC/0WNy26DMBAAfwX53JXsxQ6GX4k42N6lXaU8YmgaC
 fHvcRKpPc4cZna1chZeVVftKvNNVpmnAuajUukrTJ8MQoUVanQGsYbLHRaZ0pa/IUgEmWH5zUD
 zGGSCqJECOje0LqmSWDIPcn/lz/2bM19/ymV7y/9JV70WBh1ohEv9d2lqnyJRZNtSdzPPbAwrQ
 5rHUbau8oOONiW21pshIp5cfWqbIsiTJm01Nika9qo/jgfDG+3U7wAAAA==
X-Change-ID: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=1603;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/Qy63wA7Y1r24zibFO0aO/HQu/hapCRtKKDOroyPo1M=;
 b=MaFPNL0TDDt1VLjqVP5PiTSo+HZbkjaoX+3zP2cBpz0Qz58J+M00s8KAgPUrMksjfBXu0DXFl
 7QnGWIrPcazAmvXhEVQsYXp4tcd7m8jKwU8qHRKPIjgMQP2xNkZKmkY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mig2VxCelCgAULwIojxZRfsP4iVoT5kL0OZfQEouGxCmFJLEul44mDF1
	UpeF7K7hwlhSQmjUevGQTxxkmPikhxcbIABCdSlLrBgj6RPzw5ixPIF0IN6fQ18ZGiwEFdh
	7QSo1hwF2D45yQ7ms9q7lr3rTn/sdjN4Hv7LLb658CsOUtUPqTIFfWlSSYVgHxlumwnDVoX
	LmGEJnWmNGpvMzqlFN0Js+fQ99yKzMK0UJglzMaFsvp0Jk2SWmpg9PvFzo38rUGFnoflRIy
	4r4K0h8CKuros1d1WBy04WJsBZ6c3K/4Pfy+k8rlPw5nWTgYwm4ZWhL9gU8SYRQO4of9DmB
	y4O0XMYnR9+S7DunphjjJr/XNrfdNbLrIutV7Ho7B6PnvLDK2WZZ0ZIH1m7HsG1cC7GY5A1
	CkqhVIzoJFYO+XouAzX+cnZQH6Qae+LT7/vXrBhbZBVwIXFDL45kzsD2wxcx2CxqTS68YAs
	yxKJkQkDk0gH5mNg8U15xIdwlj8HIqAfQiTSlf1NzwZAXeFt1RNVhIIM3zt9IIkTY94Gqc2
	6yjMoLp1EiCdHcU3CdPnUHl0dVYCFVYs0L0+zHs2RLUsm6ututLZu5pvrey1SmrYhs1tVui
	5XTQbhQtAtODUcHsyIedOXcSOKkXVY/fq4tf4RCSkMXyerFaSHfVV00V7xaKdRdkLgqL024
	EO2VaGYsM7/K26dfc+4rmBMfBgXNWTgNmu6/3ehtx21PWRTJUHdjGGk/LYB0QTxUTZ84Zk6
	HllSbUHv5RQXHPNrnxlZdTuFVzrBWg1YeQZaUla8L29ACMZl4S/HCpdSrTf05mPfsKnBvyR
	TGKIGSQzTBE6WhvR09Nnv2uzzwXNhIKNrUaTNk8gfNeQuMJFHlP9CUd3B1FdR6tNxbzMdG0
	cN3nW7DYeaisrwlfMxh7IChZQk1UsF8HzWkwb1h/cJoZAEXEYYNCPTz4e3C0vVQCXDz+4aB
	wwPBQ/HuSit3pNkKIQSIavpcQb+PlYugCoKwoLY78pWvBvVJ5fh6T603AqgtL5GAm9ib8Sb
	xSww9gPDotx4pxFOpHkwV+/Tn21oJ+oPaK4DphlFRIlHIpqtd7IC5g+P0wmtdVFGQ7fyrwO
	sgoJ/I34wgTWO55y2szbV9PQj/mUTu60bz40mxnsGVe8Y9bxA9LTvB/SjElfXD8fu/RpZNX
	ZXpvVXdJt/nA5QA=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011238_409127_3BA1E071 
X-CRM114-Status: UNSURE (   6.50  )
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

This series adds support for configuring IO power domain voltage for
dual-voltage GPIO banks on the Spacemit K1 SoC.

On K1, IO domain power control registers determine whether a GPIO bank
operates at 1.8V or 3.3V. These registers default to 3.3V operation,
which may lead to functional failures when GPIO banks are externally
supplied with 1.8V but internally remain configured for 3.3V.

The IO power domain registers are implemented as secure registers and
require an explicit unlock sequence via the AIB Secure Access Register
(ASAR), located in the APBC register space.

This series ensures that pin voltage configuration correctly reflects
hardware requirements.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: pinctrl: add syscon property
      pinctrl: spacemit: support I/O power domain configuration

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  11 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 131 ++++++++++++++++++++-
 3 files changed, 142 insertions(+), 4 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c
prerequisite-change-id: 20251125-02-k3-pinctrl-738cbddbe49d:v1
prerequisite-patch-id: bfa2def3e13eeaff0bb88e5b3411041d4e2a61ca
prerequisite-patch-id: 3a1590265f1222f1497fb55608a09388df3efdef
prerequisite-patch-id: 26d923faae23d9248bbf650f5f8ceb02479466f4

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
