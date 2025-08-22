Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F7FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lCVv6tu7U+hWkw1Wkrlb1VrdpmhXfYBHZykYl8SIjG8=; b=DMdt4CKXz5eH+E
	cRTyOkmYZ5nZi7RXbkqTBbUPt1tr6mcDQzBLHhqAlZl0TnBeVZsAs0+Ba/Cwbq+rDa9k8Y33KT02q
	4qbrVR3ZECK+Sy3HmCq44pXdfSiIB6OmLenaEWK/AqlYKnEjyo9WQoGiCrbhpNIzvAF7STT91iDSN
	qUfjfYMPmc5pIEUWuirzqZBTJYi6x17gg4Y/uN0TfE02lSY0zMsc1JNlikh15W9AItg3SQl95cOlO
	aaXiIvTClSk560wG4jH57WvILYq1L64OETKUBScr2m31DzNfjs5vxkbg3d7nvnDxKll2G2gRe0VHB
	09ekj0xf5NR424VgKVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfK-00000004UbB-1S1r;
	Sat, 23 Aug 2025 09:36:02 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-00000003CWU-3XHP
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4uSMaKwilMJKEnzT2LNfK1+ulVf5SEJUfrtAqAGUVmg=; b=WJcamnONMeyH4VQIMDXWzO+/Ud
	HfEO+G4INrMvWVWtL58XdGPc2Iv/PD6Fzhturpu1/ogQfEjtQP2yfMdZL3tp4GVarl8DPXWmylH5p
	maOkgAAGYy5PPOaAZMaD8e3fvOVavnsGjLjxQBt6y0vle7QGwh0rMjBhtTg9k+yWyQJX9SJG9MZ3A
	gSz75wrlvPEJ8s61GB4Koo4tDf+WAOmPi3USnZ8OseRJxebNDLy6yTzc239nkACfPE6oiEtTiuGVI
	AlUUrHnUEg0DsawawNOXnIU6n6+x0JyUnSQgWwZaiSaG0S9dpF0a8kmghMOopxamld4ysuv4ljoKp
	kocXimBg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0T-0015cj-Ob; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DOt-1h4Y;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>
Subject: RISC-V big-endian support
Date: Fri, 22 Aug 2025 17:52:30 +0100
Message-Id: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095258_919563_1135DC2C 
X-CRM114-Status: UNSURE (   8.19  )
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

This is a new series for `experimental` support for big-endian RISC-V
operation. This has now been tested on both QEMU and a Codethink built
CVA6 FPGA as well as being joined by MIPS and their I8500.

Since MIPS will be shipping systems with big-endian support and the
work we have done with QEMU, we feel that there there is now a good
case for this support to be upstreamed.

The support is currently gated by CONFIG_EXPRIMENTAL until we get more
testing through, and removes CONFIG_VECTOR and the 32bit compatibiltiy
as this has not been tested and needs work.

The KVM support does include an interface to allow access to the HSTATUS
to allow running KVM with different endian-ness to the host (which has
been through a very quick test). We'll push kvmtool pathches once this
has been reviewed.

We have a big-endian buildroot with ucblic on our project page, and will
be working to send updates to buildroot, uclibc, u-boot and qemu with
more work being done by MIPS which will include glibc, clang/llvm, etc.

Project page: https://gitlab.com/CodethinkLabs/riscv_bigendian
MIPS I8500: https://mips.com/products/hardware/i8500/
Kernel branch: https://gitlab.com/CodethinkLabs/linux-kernel/-/commits/bjdooks/dev_v617_rc2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
