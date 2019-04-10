Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5008C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE0521852
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6nARyxs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gsQTldfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FE0521852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kSWXD/uW4/QnDeQEsyWENmuTtaaRcEgtzf/YNTGLmlQ=; b=F6nARyxsmx0PQn
	IMLjdx3SS1uFro5ViVetE0MoHgkThOF8ez1w8z/+UXcg7MkqT1B0/remfP0TM15OMzfMFa1LYSp1y
	h5RYfEDqE+E16m0cvMOBih/LouDUyeVMcpmM43sCJabVaTuiGLBSepL2IauI2lsxHvVYxBI/srgEd
	bwq2z+5K9/UB1oVY1lRJSYSFMlFsBaSqiwEri7xYPViVVwCbfqzedz4VC9ykZPFJ+9ZOs89eMvNXc
	jN9lpVK/eVaRlCYSQlLsiul4ZyRdnzgHv93zvrFMC1OPOxFlKxdvfMjRC/5rcMIw3TzUhWex11/x7
	L0U/cmhMQtdyC7ohYnlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hELxy-0003oY-Gb; Wed, 10 Apr 2019 22:45:14 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hELxw-0003nm-By
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 22:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554936312; x=1586472312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a3VvaOh2cf1QC+g5MffvF8to+gMoca9eohO0HIC8O3Q=;
 b=gsQTldfTq/8AgHG1HimVF9RladTEnH+VKze+mUFrvd9KGEPZHhhaA55/
 A3pc5c/2p0KmOxRZAxjLjUvgH8R2rkKxB/H5CziJre6aXy/DrufAhBBpT
 XQlzvG5p37Omx2nO6B04sldrONU2b0ruLymvK5HNoWSPAMyA1sLoxil8F
 8y7v0ujGl76vp4PbViSk1P8vEP92hrlqrTGOCv7Zo9Wx9/JnPp6HW5Nuf
 JroNsf9uUQF9uUTa3p98z40NrzQByBitkECk583i+C0Cu5gwZ8qj2wvc9
 jexWbBneeS1bVK2jXb1pf7V5RS8K7Oi6kYPHiUJ0quspbrFj8+k8l6+Yq Q==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105470407"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 06:45:11 +0800
IronPort-SDR: 65p6k0UftyKURWqSorBP7E+duhXXMj2hEN9KFc9waq2laDghZXSXHoImN2E2JYZRLj0derbYaj
 flaLXJ9ljP0L9880aduEX0bjM7+pkO9BVnuy1lHGZTuT2qanJBY8ItKWdpL35LBPEjqum+sw5M
 a/t/K/+PRXgnoGVdAOuY2FDiw+rv0JPDke6D7Um36ycUQHPp2KLCyNhRG2XsXYAaM/CBMxKnPs
 t+edBi6jDduCom0TuFsOLf5Jzs7CNkYMl6QhWmy6Ly6wBLpw8K4avFXShyaNVHTbz3PPtE/KmI
 9qEc+tYq3mMIQ7I3fP/xEYbB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 10 Apr 2019 15:24:13 -0700
IronPort-SDR: QlOKyi6VU6nK9T6rpHWVoYgt23bZNACPlGHgqvZhpoX/gyPVFdKc50HhypFMdxTAjDyQfHRryu
 6PWonAigBO3stB2INKY2ZKSqX6Imvy9+ghIv+m5qGEQUPmCPa3fA3NyoJVzTZbmwh5wIWQ+vVX
 FnrnnatYkvFWgISr6UksoLUIcqH1owqc3a4f40/WXNDCFTYwfFkFPhA+5fNP++Qg31NUDPZtJU
 tyfNwUHwcBxYQmuY8y2bvMUDcwDWORzXw+Y1nZPcNolUfbQ1QPBYhFPB7wUXovph73WtY0W+E7
 xyA=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Apr 2019 15:45:10 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [0/3] TLB flush counters
Date: Wed, 10 Apr 2019 15:44:46 -0700
Message-Id: <20190410224449.10877-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_154512_452471_0FBAAAB1 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V patch (2/3) is based on Gary's TLB flush patch series

https://patchwork.kernel.org/project/linux-riscv/list/?series=97315

The x86 kconfig fix patch(1/3) can be applied separately.

Atish Patra (3):
x86: Update DEBUG_TLBFLUSH options description.
RISC-V: Update tlb flush counters
RISC-V: Add DEBUG_TLBFLUSH option.

arch/riscv/Kconfig.debug          | 12 ++++++++++++
arch/riscv/include/asm/tlbflush.h |  5 +++++
arch/riscv/mm/tlbflush.c          | 12 ++++++++++++
arch/x86/Kconfig.debug            | 15 +++------------
4 files changed, 32 insertions(+), 12 deletions(-)

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
