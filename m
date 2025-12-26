Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0755E7AD77
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2499vtBtZOgnEF7XAwh0izigdCIvLYebxxBD9Dqgl1k=; b=hnnnRKuwQdWxpO
	u+AcAh/i9rhzbQJMe6PqkPTizkN2j0piVjiPCGE0NZmfnv9OE9fNSUfYHSRJvM30DrD1hZda8ivAo
	N2qwKOILYTKgkTk93BS4Xu2O9763EaL2fa7NkHvit1ptY2W49Nn5imV3bATPZPV9Ng7vs3CUK4VRD
	E4zyFUDZqoPBpnwby/6iJ0GS0vzE8vkW9AWaU5LtjiCFodomvWRUpne7O6q7cr9gZiFLqcomspK2x
	dlkai+apu/yL6QYWuXV+lmSt/PBm7lY8P5HkBVb+N6lkzZvW7JQM5cZDB6NDsZkkXJTur+zOsYAYy
	hwHp6WLWlRiOoSqELDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyZX-00000000rwa-0YPi;
	Fri, 26 Dec 2025 03:32:59 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyZU-00000000rpM-1MRT
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719882;
	bh=4G898/TytwWeDsBTfk/Jr2w3MTgrtRAcNQGtcA6BRCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=LIV/3GBshsHzYKhk68zXvzRzw6Uja0JdF62PEtZxVpjgnL4bMNlKDHKxLHduqfYEK
	 NeEQp7M6TErNkOlDHw1MtAtDsXX0JykQUAjdx6EUGD3GXqlloxvCJUARHNUIkuO0vG
	 ZiHyhwjKWkvRZLlRGBis80ouz9GsQgOvL2VIa/PU=
X-QQ-mid: zesmtpgz8t1766719872ta0a08439
X-QQ-Originating-IP: 2ZRT0Vzzq8tXbh3T6RdSk452eWXEivfl0DGUAeiOMg0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:31:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16197927595669781183
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Date: Fri, 26 Dec 2025 11:31:09 +0800
Message-Id: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH0BTmkC/3XMQW7CMBCF4asgr2s0M3Ycm1XvUbEwtgMjmgTFI
 aJCuXsNqtoqwPJ/0vuuIqeBUxab1VUMaeLMfVeieluJcPDdPkmOpQUBVWBRyyNKpiD92LccZIP
 eQYhKK6NF+ZyG1PDl7n1sSx84j/3wdecnvK0/EtULaUIJMlVulzxQNBbeP7k7X9b55ENqeVyHv
 hU3cqI/xlG1ZKgw2sSASiGG6F8y6j/jloySKJs6GQNFsjvzktG/DAI8MLow3jplalsD2efMPM/
 fp2HTIIgBAAA=
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766719870; l=610;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Kmj7kza3loEFGMSkqc/gxZgNsE6AP5OpWEy/KU79XYg=;
 b=vvBcdNpH7OiYwvJTmzjugqmBgV39sCJeIn6zteoGLf3iXenQGIGreeplrCiNAsmhC5R5yrd55
 oaIwvja6eT3BmBGEeNpcFD0dw+S7RgeLafTF8uaY5d/Sv+lL3/CPjGP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MH0lMfdEGk359Dds6svjm9DXMtDPej8dTxZIn2aMWwJ0+KXfqBEyw7RW
	+kvZ/hFxwzmJNJ7PJZCKOaVEGZHOOLhSf+onFu34uNxHK+zySqjs5Fb/cM3KwYxjNymcDTU
	WkX7LgdN1XLzbuRY56YCKl/jPZP1eXvwCqKrQ7dSr51bRgQqXu4mkAm7I78Ftm/VOolBVM3
	U8QeqaUTjH/tI6G+s8h9QbjdiEjqOdVy3JD4YEeWtsPo+v+b2FH1356aNWrojq3QAeOVGM5
	Uqap0/9gKlik/LwqDKoPMqn/E5eAuJ0d4jkp0a4qbDiVE+IJ7sx0ugvuafS3f7z8czJ7Mqu
	jPO9Ksu0XRhdiBo3gGSr1UMjsaRoVLXoU6R9rUg0vjUaSvIuRI7LW/YjNEMcIdLrBT5f39l
	1zoLnqvUMAkMcJIS3PfSWPP888Lnxrsomt03On35JYBKK6TvrVSBED0CpqpCp7oBz+x5M7o
	UHzflTFowS54gE56i4o1s8MlcpwwuqWVUyAFZ2Cz983mk4fLVARCt44IWeQRpfMfc4kk+i5
	ez2MdPBS8iwewN1JlSai5TrE0jfIB/t92ZMRpYXGlOn9X2M/folwFPtPffho6EqWU1KV89f
	CVT6Y9X3u0Kscui0lRsIZdpKPGD6cumpfl3usLPCaP/jvdTanjsdOh9dBf9OXKh40qAxRnI
	foMZvcePBNoY8xocauJG9D6gpCpLZP7lpb94cTq6LogKa/OW6KcKhSDI9MSiEE7Vf4InQyI
	k+xSVXXuFsZluJl80wj36emT+Qjt9NUVLDNp2khhHw7EjuWAgVTVjH1vjeBiljSc3s7UPw6
	9wUCSqlLcEbnBfUHFWC8SnW34CEtsiWnHtf4iaqppqIweQqeCquR8x6wD2PBhRzKjDf1gbU
	XzNMsXFzxD/x9akW8hmAK/B/1dVqQ63PYRHCnFwfYaSqR202v/gReWhm5NCPlJyAKnyMBg+
	TWarzjOQC03vVGqAbv/h8xATVpVpDMowX4twYtCJH9jlyN91XS6s/C06L98Nrm3ZKfnmV1v
	1hzWHR8QdUjI+co0GyJs5RysycnalRZlHgyPaUqwZrfIPw7Oi23ZvWtpwLD6JpUcf7hoFhR
	r4baHAXHj+IQl0FgtHlEo1dz8IDh8mZ7i5VkWDOn3w9tsJBG2EhRPEC2NGbkQE1xQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_193257_243618_5001D371 
X-CRM114-Status: UNSURE (   4.69  )
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

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: replace i2c_xfer_msg()
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 307 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 230 insertions(+), 77 deletions(-)
---
base-commit: 8dd7d777904fbe2e684d1f1942f81256ca6fd312
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
