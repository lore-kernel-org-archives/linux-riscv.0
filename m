Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF51C88E40
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCvph9vRv8A0T4gOdZtGk90qLDZJDRF0YQaUtNQz3sU=; b=IVUJuxDkGe/Bvb
	c5lMjKY+r11hxdkCr9Iy1xpJveVfHqGbTXUhA/j+s2aP57v8s/apKsbeIOQJL1I7ZGFPHpUJBS9PK
	yHAxE04zV8B9t9UYrx01ZHeLjo1aFmeHaJMdUPSKpUnBlJle/q4CJLpmmhsoKuu057CaCEje+K0ow
	w0g9Rm6HlR/a3ncldcXqLZ9/abqXoxB+oa3Jqh0fukbdtTwTuD9XrCrWoCnX2WZaqG8MYAuoXMKU5
	+yCPedwxDWuWu6O751864L+8tVwz0cHO+O0Udm9vtPu/9dIkg/wMjbqDUS3CbcAlyT6tQ5JwQC0Kt
	OuI/YDPrp0wblwiRJzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IyA-0000000BtyU-3mE5;
	Wed, 09 Sep 2026 14:08:10 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Iy7-0000000Bts7-1QM8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962834;
	bh=rdxtsC5FGSM610q9x9cjd+jqKpTMaFc1fUwPTup7fho=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=T/V5F4ANRbs3TmRh8jo76Yq4Ja6HBp31figQ9mS6QGGGVRa9cs+EatbwKxlWZ08Ho
	 9hgCA8yEbkDyzg29mG6kNpFaBoizHPtzjIOIJLOrT82efJepeg6LEXF8MGX8H9HHUP
	 mf8LeWf31W9Jj9DW5Lh4IgTvqupBBNfPXg5yJ5/U=
X-QQ-mid: zesmtpgz6t1788962832t950897d7
X-QQ-Originating-IP: 46inqLcoNwJCWbThTDJYTUkHgzGHF8rQss84kWW0nCU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11212110114369243432
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] clk: spacemit: preserve and safely synchronize
 firmware PLLs
Date: Wed, 09 Sep 2026 22:07:00 +0800
Message-Id: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2kQ6jEq4gLE6d1RGPIxFIQ7
 25qd+9bvP8AocQk0FYHJPqw8BYKHnUFfhrCmxSPxYAan9rqRkkcPK2cVVwWxaEMbw06h8aiMVB
 +MdGLv3ez6/+W3c3k8y8E53kBYMoYInUAAAA=
X-Change-ID: 20260907-spacemit-pll-init-c942bb249244
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=wQNud0kEsTSOp1R+Gv0Q92P1f5sdKHbucbO9OsVAuq4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM1iXdUzZ4LTLJfp4yMfj/2NeTdYxkOe8Zuef8q9WT
 s+PMep4RykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwER2fmBk+CO9wdHJ48jkXAc+
 5yxnL/adxzznvnZImqVskSXlKPPGgZFhBYeaoOn/d5X1T0/NUlwh6KLcOiEvPEG+Jn96TZTOWnY
 mAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MUZVN6GmaGOthUDQyPAmlFeYynRItECDOFA3oHm5nWlc4bGCoibTXueH
	+mXaq8iaAZHZlFi6bpykLepkfGVsDnfXZmBUCKSAjMLTAxRFGc7LMOUF94bCfsjESfXA3cp
	NUQtlWknTbKg/HiiTOLuWJcrAe9wmsgnXCYpbTDq0VdFAvYgCkYps8aEetdj8VLtN3c0nKb
	CgtrJGMVVcime2TeA5H6MtAhDVUh7A00w4UgUt+ZbodUmoPyXdyp/6XBBTHEM3rI2kA5B/B
	GaoW2N79R+QOCTxZUtgVLf2nfQxmsUAtvABfC2Q+ACgS+A5P6s1DCZsLlRGRGzIqBKtoWWa
	ggp3qRowbnNFIrLZMIj9Zv3wrM5lIoOTKXIkgjLJlxws5mpr43EzVV0/Ag7+Y0gDZ69dW3y
	6Ra9SxKpSqtKGj6AUd9aPlAzMRnpYDJF+lSF1tShapdfh848Dp3zHOTQSByWez1rxShEfUx
	6fNbxxIHpo4JY4SOkqcR05Ps6SaOw/DKJo2ncY//USrMXdJaZeuf0jU2ywht5/xXT5Zwbtn
	Hrl7mcmAB6wZXuMCLVdTygGjzgBB+MIsUMMu+QR1tf8q2V7kKid/qsVCOIu0gC6E1pD5qdN
	ld7KSskWRaDhCMqY/wNfaMG2tyOqYU1glBLPU1ZO0s1l7y2mv6mamJb5rM7dQfeJAilNqwT
	cY3VTHsvJ7uV7jUezbHq8MkjCrQ5o+1tI1xm65ofF94Uu5tqG3ia28A8nEdviItrwlN5rgE
	laZwL5rlHCWlPo+c46Eps36yu4ataJTxwlaJMhzt6/LuBHsdldJL7ImV5wx7AzfIpR2uAzz
	rXABNffHbhgMcp44NpRAAC1RQ+/1aC3MfftUy3bhrH4N8oGa3qWE3ZIDiu9tnDsGyFj5sMP
	k5iEtlFrCSuJbglMJbgXrMbgHb3iLpxS+0VrK0viJggqAhSrCL9TNIciHJyLF0+hGr70O1O
	Ma4EwsaFEI0I5daqpIBZUCL8rPJKRW9b5xxoFLQTNCnJ8qZSfYOrv3n40S7lfbhAtVDhph9
	swMSnpdiMl7PBDWYaq8/CkU27v0wCX0KvDrXNiQE4X41nKqqgB3+GhcZDfUzcd8xXhk2X1v
	BIs4he8p8AqksHvCdktXHONjTzb3zP311OISleOZ85kNJKuknbAOELbx4Jj+gGtW8xFwl8b
	3ofF
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_070807_771666_55EC31E9 
X-CRM114-Status: UNSURE (   5.80  )
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

Firmware may leave PLLs running with valid settings absent from Linux's
rate tables. Replacing those settings during clock registration can
stop CPUs that depend on them.

This series removes the init fallback to the first rate-table entry,
decodes hardware rates directly and preserves unlisted rates. Opt-in
synchronization applies only to differing parameters for the same
decoded rate. It temporarily moves mapped CPU consumers to validated
PLL1 branches and restores their parents after the reprogrammed PLL
locks. PLL1 itself is not synchronized, and enabled outputs outside the
managed CPU paths prevent synchronization.

The series also corrects CPU divider and shared-parent modeling and
makes MIX rate selection agree with programming. Runtime PLL rate
changes still require a stopped PLL; automatic DVFS switching and new
rate-table entries are outside this series.

---
Troy Mitchell (5):
      clk: spacemit: derive PLL rates from hardware
      clk: spacemit: make MIX rate selection consistent
      clk: spacemit: describe CPU clock dividers and shared PLL muxes
      clk: spacemit: reject rate changes to running firmware PLLs
      clk: spacemit: safely synchronize PLL parameters during init

 drivers/clk/spacemit/ccu-k1.c     |  60 +++--
 drivers/clk/spacemit/ccu-k3.c     | 137 +++++++---
 drivers/clk/spacemit/ccu_common.c |  12 +
 drivers/clk/spacemit/ccu_common.h |   2 +
 drivers/clk/spacemit/ccu_mix.c    |  35 ++-
 drivers/clk/spacemit/ccu_mix.h    |  18 ++
 drivers/clk/spacemit/ccu_pll.c    | 535 +++++++++++++++++++++++++++++++-------
 drivers/clk/spacemit/ccu_pll.h    |  43 ++-
 8 files changed, 689 insertions(+), 153 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260907-spacemit-pll-init-c942bb249244

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
