Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D146E8FDA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hmr1y6WhNkC9llETpHZdHmFcb/KuqGnszFowwQcAGQA=; b=VtDO/cvPytpyYW
	aUQTx7MEo/ftlFxtde+OM1uw3iWYrcys0nbnA0ncz4vOnIjl+3IvZ2BBLmYuLCJrR3q4TuAyMBk0V
	JEwxbCg/3nVngtDmeatguSx8lENEZ18KFe4u1DDvMPaammRqac3OKoZrat8wsmyCX12f/tBwRt95Q
	7CXgJ7EVjEh+MNpr+q0cUCbUWgS1aUO7phfYqkE/3XKB4KI/JgTn1NuEYTTH1ZLhPzoEFhGGMc5q2
	fZteyj9SDXa4ujqumKeqGTETk5oukRxzC0yZYHsEtMd5UoKi8VXBE94pgr2KUO4P/ZlITX3YXzAqw
	9K8haeVwkngNKpHLgC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7P9-00000001BrV-3Z2y;
	Fri, 26 Dec 2025 12:58:51 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7P7-00000001BrA-1IMn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 12:58:50 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3A3A23415E9;
	Fri, 26 Dec 2025 12:58:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
Date: Fri, 26 Dec 2025 20:58:23 +0800
Message-Id: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG+GTmkC/13Myw6CMBCF4Vchs3ZMO1y8rHwPw6LQKUw0LWkJ0
 RDe3Yo7l/9JzrdC4iic4FqsEHmRJMHnoEMB/Wj8wCg2N5CiWmuqURE+SpzE93N84qk89521HVc
 XC/kzRXby2r17m3uUNIf43vlFf9efRKT+pEWjQte4yrBplOncbWA/h3AMcYB227YPvB1YaasAA
 AA=
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=mISs6e4sFOmpqFJF5huwwA03CYAmRcdBj3UxE2vX5+w=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpToZ2sXKWCLz7sikw7eDEqH4mys554B/JUlG6x
 g94EcrjLsSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU6GdhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3nAg//bcFwZe43UMQMUvof6Cd+Ra84AQgnlE06KFJldrRDftkiQBc7+qcPX
 03m/xs+cpvQfDH70A/iG7D7aomvbrjii9ydC4lhnJdjanvrmOQ/fnP26QKciI4twg8wLc+iLPcY
 awK8e7z4j0vpu7He9m1n3mmKl/96bMJcvWcIKvYdZBSJ5x/i5BS4yAz/TpTVZHcYA4JvdPCt2+k
 QOuLYIFOvRjGfj1pqi1pZ+16a1ICpx0aJ74ifrefy/VKsxnP+pPBGWFQkaD+7HsXhma5gja9kqs
 hwzZ2SDtPNSRtChi9Zh54xE+Y3umbo/Ft2RhQsd6lWaPjEImL/J//3+VDBuPPv+u/y5qM9o5RPP
 qAYTIQSQYoxM89Zz2HwZR/eM+5M0iJrRyiKd3I0kzX4FVT9UCuMZzUa6V4pNfC7bSa62aYWw0ut
 AW/jrZ2JIUQyryK29hJlpQNZ+Y3nNznhsv88SXeDKCnRt6ftxytK61F5Yaw21JuKzkzBLkkpnJR
 gEgTFtlunDT9su0XDqu3jwvf9Ag6E5LNlEvKq3RHXhd0TOi40D5SfNsMWXAEDw1LIG5rk3V7SXi
 KmWwLqDG4n8wy/VgG3J+N6vdbCPAYaIeJdHn9nSwlAV4lDRaBts5pF5/Jc15CV91vSxPo92aYjf
 gyC0dXXDdomG+8DW8zRdr4ZZfooO2s=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_045849_390926_204944BD 
X-CRM114-Status: UNSURE (   8.01  )
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

This series attempt to add pinctrl support for SpacemiT K3 SoC,

I've removed the RFC tag as the driver is tested on K3 SoC.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

The patch #1 try to add pin support which should handle pin mux, while patch #2
adjust drive strength and schmitter trigger settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- RFC tag removed
- update dt-binding docs for drive strength
- fix wrong argument for drive strength
- Link to v1: https://lore.kernel.org/r/20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org

---
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  12 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 477 insertions(+), 56 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251125-02-k3-pinctrl-738cbddbe49d

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
