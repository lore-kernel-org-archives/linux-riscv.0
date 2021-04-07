Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250AEC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:50:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC3761279
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC3761279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9lolBfNnRMpcW4lIkiHYQhKYloPPNpuJBfEgMK2E2nQ=; b=Bovxuj3/ZFRrJKsp7egb5HLtlV
	CRLyDwvK/KiHDCAoZ8QZ9kNdoL3SHL/z8t52gwGb40WPsVLNFmgbUrJIlQak7l+9SMPPjVCqaN23t
	Dah66518PT+w7jWmNTvVC8BYAPn7cGFr16YUtR/rJFW3BJtHpLbAGlJS/x1ig7yQnPGHJpsJ/nEJH
	OZ+79thgBA3Q1nYGKCkLf3MbCZooKWM+xfWEHmxbVZXLt8njjgOa2pevKo6yB0NHHzTtqbo6/OjDH
	nS5YxObyyqIZHQpVSAJNHqgeVR7CtNNGu3D56Jsx4OSj6FiYQRO+uXWJqa4/swcWXTB1tEVrT8hy5
	vSIq58bw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUARN-005KDo-IS; Wed, 07 Apr 2021 15:50:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUARG-005KBL-M6
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 15:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617810595; x=1649346595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZugdE2MSPgCWYyU5LqjY0o9IlEkCJTXH/EVdmfDbnm4=;
 b=HgDkgexuMijz1Toyx31OPe+3F7v44UKWIgtiOuPvUbpalfqlP06btw+F
 MDlkDy5e5iApoyOBuShRYnRKi+4QroT4SChM9sr0crDmHHhiAV9sog3Is
 TqoExYIizX3giosUdvbZDjjRVhuxeiEyVe2ZQU46U+QdqjnjowVROnV9E
 irugbr1lkZCie1ZJwCDpvgVNBJN8a56fynWv7XwXm9yiplMTqtNadKSDh
 tMMz0n6W2tlbK8IiAwNJYfX0ICu5TOXkaPkBBiXQbB51pFUFggW0Nc5WP
 z4/pCDpiwKZQlDxpp1wcIy8KkqAfs/xfFAWf3DA+LjytHP9Pf3ddVxVH4 Q==;
IronPort-SDR: q67QyhlIWq4qNy8QzEZoYse432QHxt/Dlr+0FN3iOT7zkqJ4EzvMADZRomzB25gMgheKSGa3wS
 pa0/druKDZ3hXXoTYK7llWZwvCyxGYQWlRK6Q147nTKjA70HdBh54KYlYMpv1JqZxjwnTqB+Eg
 9j8IcvVe/IaTsnrAhumByzPkRMqL9FuD2vCDS+aO3PjeszjATgRqPTA8UgpjprrTJ5jyr6qWPK
 tqLAnZ8WLEcg99JpQRhM3SGLo1micDlr3cSv1aqgF7o5WznN0n8xCpcBJYTBdnY9vdBmdSdhtp
 jeM=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="165012667"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 23:49:39 +0800
IronPort-SDR: +EFbrmcQXTxwk7gvjsG3WU1x89NMTIe+mzAnxl7OEYgunmxqAGFD47UIbT/yigqaoZmO88LyEx
 sJf/WniJCUkgrXWyT8ieTP6UUUpempiPDxO5gWI9jqCAUTzAlyiUINDJnAk9t3erIMk2bXQi/+
 uOpfzhOYXp4v6TT38fwng4jJHa3jJ1Dq2dLPuDQvBqCsisWpNwczAHsp2GmWlfQV1wp31tO6W9
 17+f6EXepMnC4AU2SptLmSCcJLpDd4aP6Xms83igllwKFQk4b/+r5aGmoOlpNnehVcZYWG16A6
 Bt1ZwVN/tF082FDarIultVSk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 08:30:50 -0700
IronPort-SDR: BVWSjMsVeCSoBX+ovKJ7GRzen6qtlyXyGD8snXYwuErsvhxRlumX1U2l33ECkVCpXo7f6Fxdau
 RSHbvBVnCVtZdhq5FNIYRjeCk+wIXvB0F27gNEq2rnZRvCKsUjpvqJpzOl1lKOUoPG6SM7evvT
 F522UxNn5ImuRLnDcpqOoUBzICVf8RWupiYSrYnHPcF8oC8oq5iHdZ2STzpQz4eh2aRH7crV/p
 D00cDmhwm2j1h4URZF2C+4eMhdCnCXOAfqQVf5afXBCbS0VwfC3HHg9t5qrFrfjH/jIqcFWtP+
 xqE=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Apr 2021 08:49:30 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Date: Thu,  8 Apr 2021 00:49:22 +0900
Message-Id: <20210407154924.1557489-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_164955_479745_821924E2 
X-CRM114-Status: GOOD (  13.69  )
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

RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
data section as the toolchain fully resolves at compile time the PC
relative global pointer (__global_pointer$ value loaded in gp register).
Without a relocation entry provided, the flat bin loader cannot fix the
value if a gap is introduced and executables fail to run.

This series fixes this problem by allowing an architecture to request
the flat loader to suppress the gap between the text and data sections.
The first patch fixes binfmt_flat flat_load_file() using the new
configuration option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP. The second
patch enables this option for RISCV NOMMU builds.

These patches do not change the binfmt_flat loader behavior for other
architectures.

Changes from v1:
* Replace FLAT_TEXT_DATA_NO_GAP macro with
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
* Remove the addition of riscv/include/asm/flat.h and set
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU

Damien Le Moal (2):
  binfmt_flat: allow not offsetting data start
  riscv: Disable text-data gap in flat binaries

 arch/riscv/Kconfig |  1 +
 fs/Kconfig.binfmt  |  3 +++
 fs/binfmt_flat.c   | 21 +++++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
