Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E8CC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bEA0wDGb95W7mnCBfweENhYaBdwPhP3kkAUUsIukvNU=; b=oBmLsQOHF0pzJf
	R+Uyw2lBGibcniBcpfmGVARmgRr9vLOpolvIVa9kp/4SyDAMB3y3//jB4Ihj5QpNT+e7J4pJBAZ/A
	cm5u+V7uQU0VK7idAaWCbbXgMaQQrArnNgRZqFL7pbkwTXkRg9kz9C1Pn0NnvWo2Ff1cz+yjT0LL6
	OYI3R1kXrgyAG9/21Ak/hGZP1+EPrsoC4f4f39zr99IzgYbtvnoPbi0Az8V4bga9V6zSwD19K9oE9
	JUlg5DIgAJPgy6hBlIEcRYyW+REudPVCtqlr4CzF0r8p1s4rAYj94YjTLl6ukFykwSfOwWpobD6hI
	Vz88wjoT08ySJGol6N0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomET-002Q8D-0M;
	Tue, 18 Apr 2023 14:22:57 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomEP-002Q5P-2m
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 14:22:55 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pomEF-003hrL-CT; Tue, 18 Apr 2023 15:22:43 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pomEF-0066nR-0M;
	Tue, 18 Apr 2023 15:22:43 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com
Subject: Add zicboz support for riscv kvmtool
Date: Tue, 18 Apr 2023 15:22:39 +0100
Message-Id: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_072253_896187_544658FC 
X-CRM114-Status: UNSURE (   5.58  )
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

This is two simple patches, the first to sync the defines to ensure
that the struct kvm_riscv_config is sync with upstream and the second
to allow zicboz support into the guest.

[PATCH kvmtool 1/2] riscv: add mvendorid/marchid/mimpid to sync
[PATCH kvmtool 2/2] riscv: add zicboz support


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
