Return-Path: <SRS0=Sfcq=ZS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BC0C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 22:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDEA20727
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2019 22:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b8YUCgbZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gstardust.com header.i=@gstardust.com header.b="pi0x798Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sWTLbOKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDEA20727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gstardust.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5wvzop5JGbzpginrmwObcAu0txzT2jtxXJEYYGIERf0=; b=b8Y
	UCgbZPITmfKx6oHctIt54o4F17A4Vpk0rzOzmsCfs3/R07kHYRGEm4tDLoxAkr/o7dQtIBNOvnkE9
	k4VxEUjYdIkB6z8qw0B169wU4kLFMxiylyfEmr7Wiutd6X9ddzxkGSHXhKMfGilcWGB3hClskfAkp
	R5sPgCfMVtcLiqffOjDW3GtgYadGCLsCBDwkucpzu8/kvHNsFchVyEJ+4GGPKFf4Bg9U6U2ShmK9b
	0gmDjakm5plt39uSw0E9JPidR+n+LQyTfXncqwMwRWW+gcJ+afWDSE9DMs6KKkNzLuR4OMBRThwOm
	E49xDkpeVMjooVJA6a5FXsIYSOEm7Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZjaC-0005cH-IZ; Tue, 26 Nov 2019 22:45:20 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZja9-0005be-L0
 for linux-riscv@lists.infradead.org; Tue, 26 Nov 2019 22:45:20 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A7F78821;
 Tue, 26 Nov 2019 17:45:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 26 Nov 2019 17:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gstardust.com;
 h=from:to:cc:subject:date:message-id; s=mesmtp; bh=GXPSExd0Xh1m
 HUV01+q3c74RT3biwUg3NF4msP/s7N8=; b=pi0x798Q6EsHvFVVdrct1ELtvO/I
 uxb2ur16DWj3INZuKaGHhpyR0O4Yw72ygjVDhFrxw15pm6vK5UOjzr8ODjCDbQkN
 v0hCK7aMl0JFS34UtK4meMxo60AYW2u3/w1ehWFnqsmZFO+xzR4IJ1yfNqP+1NwI
 YDq5CUQXDrv5Hlk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GXPSExd0Xh1mHUV01+q3c74RT3biwUg3NF4msP/s7N8=; b=sWTLbOKy
 UNx90cUSIF9NOpUBlf+uDT8ebGpBQuZ/fbKEJTVCPQ+VM08qnaYtvOB5wv3bJx+T
 GlkaqSKJLhladxJvEBe619zw8DZ6IylHOAQm83hYzGhm2ScnTMj2GKaKZhAfxhsB
 LyYA/cVGklK7mQcivQ6MIzjDuhcV/CXgP32U2x0P7/Gdsil522Y2KcgtxJ8NFgFM
 6MAhiqjflQCFYPs3hyxBKex5fUtFDkSNVFZoYW07fDm6IFWuZ8I4PliSyWu8D4Ht
 oxOjwlwuheFxB6P4FUMJpEr90rjs78doMx+RHX7nokImbL4s/JNN8Zezoq0JKmn3
 KccMjKzmL96k4w==
X-ME-Sender: <xms:86rdXbbogGPtk52Bs143gc29U3svGQ2jeO09FoI2-o1zwrsFSrm0zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeigedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpeforghrtgcuifgruhht
 hhhivghruceotghonhhsuhhlthdqmhhgsehgshhtrghrughushhtrdgtohhmqeenucfkph
 epudegvddrheelrdehledrvdelnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnshhu
 lhhtqdhmghesghhsthgrrhguuhhsthdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:86rdXeqO4yvyxf2vfua4pIcMDnoQdPg1WIE1v_jB9o_S8tAPsoIakA>
 <xmx:86rdXY8CrY-RsHG037UFVQBnZAT_Y_WFULI3mXqQLa6nuiY-AZQDPg>
 <xmx:86rdXV-ayQltTTfGXD2n8s3SAlawo1b6lp2QP5Rv8PCfp7RqQIS6Og>
 <xmx:-ardXSpXN7EV4GVC6AITBqbuUhRuhGhb_nbz890qdIM5nv-ASQvA9Q>
Received: from SurfBoard.localdomain (unknown [142.59.59.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBD00306005C;
 Tue, 26 Nov 2019 17:45:06 -0500 (EST)
From: Marc Gauthier <consult-mg@gstardust.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] riscv: Align shared mappings to avoid cache aliasing
Date: Tue, 26 Nov 2019 17:44:44 -0500
Message-Id: <20191126224446.15145-1-consult-mg@gstardust.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_144517_963742_EF5BE2FA 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marc Gauthier <consult-mg@gstardust.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Ensure optimal performance on larger VIPT caches by aligning shared
mappings to the maximum cache "span" (line size * number of sets) of
all CPU L1 instruction and data caches (L2 and up are rarely VIPT).
If the device tree does not provide cache parameters, use a conservative
16 KB alignment:  only large enough to avoid aliasing in most VIPT caches.

This patchset is based on Linux 5.4-rc7 and tested in simulation.

Changes in v2:
- Fix formatting per scripts/checkpatch.pl
- Edit include/asm/Kbuild to reflect shmparam.h addition

Signed-off-by: Marc Gauthier <consult-mg@gstardust.com>

Marc Gauthier (2):
  riscv: Align shared mappings to SHMLBA
  riscv: Set SHMLBA according to cache geometry

 arch/riscv/include/asm/Kbuild     |   1 -
 arch/riscv/include/asm/pgtable.h  |   4 ++
 arch/riscv/include/asm/shmparam.h |  12 ++++
 arch/riscv/kernel/cacheinfo.c     |  52 ++++++++++++++
 arch/riscv/kernel/sys_riscv.c     | 113 ++++++++++++++++++++++++++++++
 5 files changed, 181 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/shmparam.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
