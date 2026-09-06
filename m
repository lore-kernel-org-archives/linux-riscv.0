Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F4C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TS5KSAn3Z2Zatzw8H8NBn/+bf+Uzgy5OlDgSqNdetWA=; b=aiv0canoAGcuHF
	533/JF73y9tIyQEiSJw226A0e7BhHtUcKawkdZa4EAEhv8vBgYgf7SIx0FNTF6YEeCN/5j8ttzokp
	AUuSdNVBxp2sT5IFpyfb36f9jlnGHmC7nEcqVwpRacS9SIgtPwYnMa7tgX+NurLvUQwrdC6B9oSl7
	oi4lvE/X4PyBi9Ul0hh+WydRmqxDT7EJgqwQnNJPuFBT4Swq/FE6tLnhbsRT9wSs88S1y7iz+uhr/
	6Z7UL2PEqy5Hj6OnwcBt8ln2zwgRTSdtHBgT2TFShofRf0FykVv/7avREXlTD3tDtNjAR7XWbWBXl
	nAyytnXU52V6rw0g5Ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3CwW-00000005304-2xcJ;
	Sun, 06 Sep 2026 13:29:56 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3CwS-000000052zT-0tEl
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 13:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788701356;
	bh=+S8ttCoCMy97kRUS5c0xmIv9QQhnjS7Q0Eixl0YMrw8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JuVP7VMQxBuw1B0UsbbfbJEtw8fbz5qahd3zNK1hZyWIUzeXNvaG+Jw2TJVqWkxg2
	 nNTSmlVY4CPHdIfZy97u2df0kDU+tbtJVEjEWAih0fv6RyZT/8yMH5HJOru4PRhJAk
	 IZ6Z9n3AmVjKSJpkZhoLvED+ZY/vmQrZO254ArVc=
X-QQ-mid: esmtpgz14t1788701352t8e9fda0f
X-QQ-Originating-IP: 8l7GrQphbZsRqienUxFziZMX9t2dpfGiPcUVVuTjKJY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Sep 2026 21:29:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5099097618670319179
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sun, 06 Sep 2026 21:29:08 +0800
Subject: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
MIME-Version: 1.0
Message-Id: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTvJQEKtXsW4KO2PjolIOqAkh
 LtbdPkt3lvJkBVG52qljLeavoaC+lBRvIfhBtZUTI00Tk7i2MYQ8dSJQ0q8F/gg87GrnRPvpW8
 9lXbM6HX5fS/Xv23uHojTPqNt+wJwmDj1eQAAAA==
X-Change-ID: 20260906-spacemit-add-reviewer-7b1660880f58
To: Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=q8NPgh2AongVC5ji9dIdBTKB59XNafcA6arnzRGWaXg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlzs5YYX9U8uvNIYBnvk23ez92vzj2aNeVUUSf/PbH7R
 QlBxezZHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOZ48HIcLEm4qTUQucToicm
 pK8+Od3toh77/Bu7jyYZ3lvw7fKshB5GhtMtzbyfi7Y1HDPyk5wZvnKX0aV82aTC+Mg86bCFz4s
 P8AEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NM/Va/AgX/pNu5n61BjJ6zN9zwGi6/60hEcObO8TLskYdYwjaxZYV2Np
	A5ZDLKrV7vFX+wDg/4x3rUj93IRNdoocJuWUvjTU68H4GMJF/8yVvYzGbJ6nJmPXkk24a3a
	OwZJUIDzTRpEy/aIJzcJeycudMU1roqyqy+1CzJCOPuzFRmKnV/4luPPtmu+qStohRQkSWR
	g4qdFZ9P/WSicMzhYGWpAAIZ9xjbbtD67j4aCkRB3IV+72cpx9ZXpadTqNGCQCc67dp75f/
	539ldu8wC+G034+TULQWn/0wJ/otgKCVyU/K4XEL53m238/lhdNTxGDKpFlmo34iXH/Ax0c
	dCIvjlLpGBYQM6Ufsuce3YzlTB5B4OD/WE3UfNeiz6IvQa5tINXk8aDtx2yR6BQXVgjootM
	JTL+u8VP+fM7i4bGmZOoecsEPxAV7sUlG3IDmtY0f7NMVM/xW8bnbcAoDxWU5c5YMcp2aWy
	hL23+LerIfswvMOM/a+CqJwmTvi0M40w8kTAayYHGu1zwtA+2v9fSC4PcaZ3zAcBT3QeTIZ
	+NQNxSoqGLN0wRmsGj0e7y5/N7vPosE3uKfWb0Rhe7DDEhTXef6loC9yUfkKdK93aIrciXT
	dv8yn3+Udk1DFuYO9qvP7tyQBNXnSUIalm5sUE3R0nQpOFCUCjJPmoDZ1Wly1YU/hhNPZ8X
	kaTSAoT+D0E+JmRNROsGd1eNjsMsOXBfchKMo7wTUcYskDahjd44a5IjsytRQZkSG1L7y4G
	z4RTX0MyruVWs4Yp1Pp6KYwueOZAhUvVJvEcZBzTIYmGO9QuKWNSQdn8RpND3g0zExL1z9M
	DRggxIH0QzqqsDkymA57lw/rzjigYG6xlW3OYBMewQ6fFZjSRX+CsADOiJM2wlvOfM4rQLu
	0jpd8zbNhJDk7R1k81IJcf8QctEeavwZgQujJnXiNyZCAQxRZeq5lXKLtY5QV5500jCeOjO
	5ShzS3oHqnkHJVUwbpWAGIeMnZn6oSuiFQH8Q0RpFcyW0uZMr6x/s2YlpLbUf0UGZZvR/hQ
	IzmXLR0aF+51kUZox4K3iGqaiVdBzhQSQhaqc/IhwOhA+t+0rAUypIlRLKPkuND47nerNih
	C1cLDcLdGXWpAShXsYXHX5oKvjIw+Gf0VutKhSMQzRq
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_062954_022019_A5F5F78F 
X-CRM114-Status: UNSURE (   5.85  )
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

Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
support.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..97ca10e2b7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23589,6 +23589,7 @@ F:	include/linux/mailbox/riscv-rpmi-message.h
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
+R:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 L:	linux-riscv@lists.infradead.org
 L:	spacemit@lists.linux.dev
 S:	Maintained

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260906-spacemit-add-reviewer-7b1660880f58

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
