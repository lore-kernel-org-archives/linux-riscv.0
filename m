Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2BFC19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lvUaWDkGywmPK4LgLmyr6g+6TKcEkM/RtNUBdauF6Dw=; b=Xmu9Cu1KQwEEIR
	fwTKwSwWMOfibH79TFnSBmLWWYyig+9ggWhuIuoFfUNSFLoX3T7osbl5ZBrPiOtAwhErnIB+8Cy5T
	/3kYCCXBl38Ds8YMOxruDUmveDR/rOWOnnyoCASTDSqJoaxHS75eYNJ0OmjucGIQodK1mjXfbhJ5v
	zSAj3xWiNCWAbzfpdrgco6IJuhyDMwADFzOiwhVIo2RKuUWsTxAezct3P2VBCvlvlU/aTMxc9REld
	FOWcsoBvnwkjGzHvPOHGoLe4MuxdjPwcbPhMrgJfE461qi7u0Wpw5+Cy6MGnsyZ0GlEdjZAhT9ixv
	LMoH45G0wPZUFHe5wluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncYB-00000007GVr-3ua5;
	Thu, 27 Feb 2025 11:59:35 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc12-00000007AgA-3p4n
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 11:25:22 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C8961342F9D;
	Thu, 27 Feb 2025 11:25:16 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] gpio: irq: support describing three-cell interrupts
Date: Thu, 27 Feb 2025 19:24:58 +0800
Message-Id: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIpLwGcC/02OywqDMBQFf0XuuoE8TIz+SnER440GfNREpSD+e
 6NuupwDZ5gDIgaPEarsgIC7j36eErBXBrY3U4fEt4mBUy4p5wWhOek+fiY+LGTtA6LFYSBKIUN
 aCKupgvT9BHT+e3vf9cMBly3p12eExkQkdh5Hv1YZpyy3pTQu2VBgoazJjVSlVKYUCrngWjgqG
 /jPum5XFCueonDtkbh5C3eTllpr03JWtqbaBdTn+QMIU5Sy7wAAAA==
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=PYLYF/dGKIxYWh/3gfabjFbV0NyMK26qmfVNmoMxlxM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnwEuSx8iKG0sz2u5bINgaoTFxMqT+83XiLhRqa
 olydrM1eTCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8BLkl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UeLD/9l9N+oAmWTukZ8iu
 BnMlGikNlF/ufOEdEO0PbTyAcLR/GnLgkngT2NBV47CttDj37y+HOT2ZvOA5JcKY/I13aELTSK2
 kU768Coq5u2euC5746HP+Z9f/6MbbyY9kMPSlcFW57bquxfpAAmLpholorRJQbpNVECGzOl9YlP
 LFXi37ANePnHCVBti2P+qB9jwV8UNczuvHQ1x/aEU32P59bAus7SUscGVPaBjU0YNRUGbzUi1Ds
 B3SJA5WEJ7BkgvU4qSLovuM9Qvvyx6iIP7hweummVvb23KvshfUpS/MAZFZq2z60FDvlMvRFnB1
 giDp0ZPBaGErFHQtSHnswrqgA4EX2tK5ltPQL2f4DvSC0DwgTGuVZ/2mopyY62gZrnQY2h5yjXm
 Z89Jf+F/wjNuWBq/vOFS1PcZ2jm3anpwbVRXtWwJ4nS0F/tsQBsw8XjX/MfMvdm3yseSLT091YX
 MOUq29Ml9uxpufvI+DkVBy0ZuuBxjR/dyr+22HOL9klupmesFoly3YV/7xnmPvNfscu9/610PzI
 Chf5z6k5MNj7qu/85JPJq8gevxSQ2DHNGqXxC3hNCywfog7KTma6lgdpbpK9tmsHlTY6sKgBBJg
 E4ACmjWMwgAchgG2PuxCGTIMp0s1EdWjS+fNhkoHPJjMDerRQsXfWNvoQYOup8cWG0RA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032520_979294_C99BCE38 
X-CRM114-Status: UNSURE (   7.06  )
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

In this patch [1], the GPIO controller add support for describing
hardware with a three-cell scheme:

    gpios = <&gpio instance offset flags>;

It also result describing interrupts in three-cell as this in DT:

    node {
            interrupt-parent = <&gpio>;
            interrupts = <instance hwirq irqflag>;
    }

This series try to extend describing interrupts with three-cell scheme.
The first patch will parse interrupt irq and flag from last two cells,
the second patch support finding irqdomain with interrupt instance info.

Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      irqdomain: support three-cell scheme interrupts
      gpiolib: support parsing gpio three-cell interrupts scheme

 drivers/gpio/gpiolib.c | 19 +++++++++++++++++--
 kernel/irq/irqdomain.c | 11 +++++++++--
 2 files changed, 26 insertions(+), 4 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
