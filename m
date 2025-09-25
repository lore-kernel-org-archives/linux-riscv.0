Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A5CAC5B3
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWSpas8nWseQTLNGteRNXwV8b/X6uiMG+2il6TnIT+g=; b=AMubuerlKhpYnP
	CxELT6EbYryZTO8nA3uDhZ+sFTXaiVUUB98wQJ4pOE/LY8JqaG8MmmrAxh106e0tc2xOGsFt02dnf
	UhtQEy8DoMsaEGapxUPbpPiKkqTRygzLZg5/0RPGvtm/Gw/xNtOYWJz+s2o4Ee3s5ut18nWUw7P/n
	WTTjueaMEwhC/L3ZPgi7tHll+0hOKidgpPjjeSd7omocl01QO3hQYxk3JZ6PI2Y58atBfasd+s7/c
	lsXU+oEIHXgAvjMbkkmqDRQSKm1x3R3QnGUhTTsMA3m0j0h6/+cIycRR6SAH5DGohktYEZEjBRHQD
	NwlJogrV5R1+OksyIsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKq-00000005ExH-0LVa;
	Thu, 25 Sep 2025 02:03:52 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKm-00000005Eu6-2A5E
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765757;
	bh=/3q2hOrFcCfu03khAGZ1/m7GoaKoIkgm7i5lEDGVYOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=YyTjSFQb5Zwt6mEeQgiOwFdp+XAqFp9CosvONLiyfZoWJ36MsSIUWpreG4YQJsIyw
	 b2du1geJ+OfD2c/dbz2UNgCGcPy712JcnjBuA1W5Fc+fiMszu7Z2YwN6gWrzLezSQ8
	 VZxAwtRrvFdoOq+uV6Whrauz2gYPvlfXTh96oeXM=
X-QQ-mid: zesmtpgz4t1758765755t3d602099
X-QQ-Originating-IP: DeFQPRLG9Sq25rBnhlRa3qMFcNcl4wFzlsRxRS93BXs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14026594320109242510
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Date: Thu, 25 Sep 2025 10:02:24 +0800
Message-Id: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALGi1GgC/13Myw6CMBCF4Vchs3ZIWy4CK9/DsKhlkInSkhYJh
 vDuVuLK5X+S820QyDMFaJINPC0c2NkY6pSAGbS9E3IXG5RQhahkjg+JrAzq2Y1ssJe6FqbL8qz
 MIX4mTz2vh3dtYw8cZuffB7/I7/qT1PlPWiQKpKK+kRaqKytxebJ9rWmYtKGR59S4Edp93z/bt
 rcMswAAAA==
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=1649;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=LHjHJrXqZVZYgG9B+E0spJV3Yspn9c/QJE4SsURPrkk=;
 b=Su2mS330C2vNCCq+gt5t62A6KZK4tsdg6gSgeNS4FbIYaZoa2cbyNhzaEQh6yuF8MgnUIfY+C
 jgG3GOAMktZA3lwyMMPydvEnms+OYeIrri6WP4NvcDTGT7Wu02p9UKK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NRRxESCIhBwbRNuk49BV5x0uHNXa8B0rjoX9N/6bAOUIaDy00mbWICZq
	Iecap9Qt5vigiIs4QmYgkFI0gtTdTr9SggUZG9o5HSZehYOrW5g3/OgG3T959bnFdLy9o7i
	P5NveDy3S0Aw7DfMlANVAAYqV/tEtM8byw44WlRh4C0EOcCKNuUAYNYsXTuE7u2Nce3Hip3
	f/nD9qEDswx1np1fcpOpGkO8veqU8joXybMU4rfNQn8Pmb8Kp8nGnThwIM+fw6Z32PpzWoS
	oQldK7dTFjin3uNNxU6KPbi5peJ48MGQaYoASBY3Sizzx2aEyryjCrrqCpf2te8GyNVRuAn
	hhYvqJzGzMjJQifqmC6/ScLBzaJNnLoPcIREyMNpb2UCbBus9h+pOK8kPBlUP5Ob5iDQr+V
	HS6wSsjBGtD99frW9LA1g/UFK3FgJQjaalGkduhvLMnlsZTgJNnpSuOBNTgozUtWa9XQnw3
	bBTzdUfWMTUhNvNRNHhoReJe+UPbm2lkcVD05zGyJosRzrOr/MQoshLS3vWF6DlV6z0OV6g
	OaYYzn9IGXx2mjMAKKnWiELNgDh77+j05cF9UC4+0afGpui23qu41tifErCmo1t1J+mcOaP
	NdHURmxlezEh67SNfjSbzEJtmtZnsob/9MkVk5mTbiXe7Vqp1i8nYy+YFiRDAKxPbEYivs9
	xVn2zXT36MSL4RYNGGQLiA/KP/YH6c/AGaRSLqKuwDQqU91I4A2kDsRR/8oF7r9k0Hkc3QP
	OhuudXX+AEzX+DStYWE/NBgcfy0Wghf/xvHUABpQys7Ai0cFP484J567ofsYiWfAIacezPC
	QjOQxY5tydZ96Va/oVEEpxkdPm4WF4Eka3cI7bJq3D+/71kQF6dckC4ZpIhJ0xr3NkV5iLG
	OYG8HnR18SBbLJax3URJlt5Z7PhC0mdM+8EFDduYGShOg1ZYeFjgKvs+A/4veV1fHlWfsve
	GkQiAVanA4yCBx/I9lwgLiYCz6kR1UZG57AySBmKyzaS3XV9wfXOpu3inSGpHrx2vUOk+01
	Ecqx5fP5BIDUAzo8PpkqTc1HRqsCKni3Vfcdf4QibaNTbXLEsHbwdiyHB6AJwkEXFh0V1Q+
	jW56CtZ1SB2CcwJv2hYlX3QKWtu2wRr7sBOl2xAZ81mUPQVBnniuWhV3G6bBxNKw/9R56Gp
	adiH
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_190349_404133_50845866 
X-CRM114-Status: UNSURE (   9.19  )
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

Previously, there were a few latent issues in the I2C driver.

These did not manifest under interrupt mode, but they were
still present and could be triggered when running in PIO mode.

This series addresses those issues and adds support for PIO
mode transfers.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Patch 1/6:
  Patch 3/6:
  Patch 4/6:
    - nothing
- Patch 2/6:
  - remove is_pio judgement in irq_handler()
- Patch 5/6:
  - fix wrong comment
  - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should 
    return directly instead of using break.
- Patch 6/6:
  - add is_pio judgement in irq_handler()
  - use a fixed timeout value when PIO
  - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO

- Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com

---
Troy Mitchell (6):
      i2c: spacemit: ensure bus release check runs when wait_bus_idle() fails
      i2c: spacemit: remove stop function to avoid bus error
      i2c: spacemit: disable SDA glitch fix to avoid restart delay
      i2c: spacemit: check SDA instead of SCL after bus reset
      i2c: spacemit: ensure SDA is released after bus reset
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 221 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 178 insertions(+), 43 deletions(-)
---
base-commit: f9a7e1f3eff519e88c91d87701d05cfd968d89de
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
