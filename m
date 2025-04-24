Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F62C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=965bKPqR6uxSvzgJohvFEyC+WMIQDLydC6Z/KU3SEaA=; b=c+XJxDMZKj3Mt0
	MmIZf6iRqhhd5MK4G53QwjlkRrIYJIOWuelQJehGNFcHVURM3VWWSiuVQYskmi0/W7C+nd4Wj9hN8
	pRKjuD8L21hAEZtMF30P7zZbH5MawhoXxhaqjzqpYW9Nf9Piw8nFshp0KEPnYdYPZTYmsP80Xkqmt
	MvGMu/F1lBASIQdWB/1N/vn3WoeEeeswZuDFXkOqiEddIkE1vLgcVAteCmCqiqpvZ1JNkbf4plnSH
	ep1tFENdgGsA5YMunuf/k6g0YkFVrB51/5KzUcUyuh2KxW4D8cyW48dyYdKHipueRKzA5Xd3vJvsf
	XtNU8MJPv/Rcy6jPmgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sJe-0000000DPbh-1aOi;
	Thu, 24 Apr 2025 08:52:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rK7-0000000DF6Q-43PI
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:48:45 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AEB1A343024;
	Thu, 24 Apr 2025 07:48:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add clocks to pinctrl and
 UART
Date: Thu, 24 Apr 2025 15:48:07 +0800
Message-Id: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALjsCWgC/3XMywrCMBCF4Vcps3YkCUapK99DushlmgalI0kIS
 sm7G7t3+R843waZUqQM12GDRDXmyGsPdRjALWYNhNH3BiWUFic5otDoS0b3ZPdAoc52duaiSVv
 ol1eiOb537j71XmIunD67XuVv/QNViQKlc6S9Ho016hZoLcxHTgGm1toXELm3XqkAAAA=
X-Change-ID: 20250419-05-dts-clock-026bfca75e5b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=O1rnIa2Nc0xLuYwJRBgZaxKvxjoAvMbb1IroWhNhceQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCezL/JF4+9LLHuxULoCqqywrxzAnkPGTKoztZ
 wjTAktDuWCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAnsy18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XYqD/0YfD4VZu3OE5NtGS
 WolLvLeH74lP8+RcmRqFHX7NyY5R2HuPOfG5YQYFUmg6X5qGwQ98b3B9ua1aJ3GpyMyJDjZo/L4
 m4n40AcasoHdCiQ7h5Z2LvcjnTizqEKjulLcnt4uGD+OJyOMVhvdrUNTbbknEtNFJs3MWsLy8b5
 kiP3FeS2UCuaVcqNLfYYXa48gzs1HjT2SUmvPiBVM1/ikpgZHAbpiNw2p3c5wb3ulCuUqcIdLrL
 TsOMZRlzTyncEkIT8C9Ex6rty8GedfaIw5RVk9iuToysnW7SeuCp9zjAGkIqrm/eTzq2CpgidOo
 tM5WWqluuC6CEk0Mp7O/Wzo+6q3ePUTEthaNLAf4kUEghUlesaAT4XTsiCz78G69Om3bAyPfXvW
 4FywuWenRSSW8d4/B9CWZJIkQ0yk3GGMbDVhSLNif9yWiYxf8MPtCjcQ1MKGpZH6ebCnXB6Rgtx
 jIz+U7wYz62vRv1/5HRajKrDyuvFUe7AZPtRFl+vCMg7RE8CCOU+jyw+/EvKfiYnI16WNrcQ+C6
 VF6mbpRNDkeWYSDs+XhenAHW1zafAFCMfFaWDSBdsAMOiatFyjiBS/nuN4u0yyr0i177ZZQyCI4
 dJHOZ0w8BEUPCdSp69Qsq3ZxatGHYW4rlU3DSqjKNfOo4zP3m/kew6osbDaFbBYy6HfQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_004844_039715_D70FB0C3 
X-CRM114-Status: UNSURE (   6.17  )
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

Populate clock property for pinctrl and UART controller.

The pinctrl's clock dt-binding patch is still waiting to be merged[1].

The UART's dt-binding and driver code has already been accepted[2],
so we now are only sending the DT part patch.

These two patches are abased on SpacemiT SoC tree's for-next branch[3]

Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
Link: https://github.com/spacemit-com/linux/tree/for-next [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- collect review tags
- order DT properties
- improve commit message
- Link to v1: https://lore.kernel.org/r/20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org

---
Yixun Lan (2):
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART

 arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)
---
base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
change-id: 20250419-05-dts-clock-026bfca75e5b

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
