Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1CBC021A7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LAq1Uo1d8DYwBozm4vCDRwwem8/oPqNjJbkphMFVWb8=; b=Ihc2dzyNgHHTeM
	XRx8b2cyGusHSJqwrgcXxPmHv62odiLxaqpHaPKCv++e29ITAcKGnaU6SzPwe2LDS1Y76GMlZCdlL
	npNRkKRrJNIJl9PNzTt/ISdFTdJ4Z9e4kWoRoOL5jqPlt6WA5QrqE5sHw2hrZ6lgp6isWB02qNTJE
	pFJWPFWNwmem4j3WGEU0Jx1N1SZ23vBYIcFvrYwDZYitiutCXpKETlUPGoCG5RaiNhW7I4gSVXc0c
	YrKo1svUT6C6Lr9EiIH91M9gd2jreFtUKM/zw80EPe0vzCaEopKvasqtif1LDF2XQFyVmWF8edrfd
	H4a1SNltKc+9mZpcsnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXx1-00000006CX1-3udI;
	Tue, 17 Sep 2024 13:09:03 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXwy-00000006CWK-1ElT
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D37IZN8ap2amwdULgIsEsUyBon2l9vm3v8DgB94cC+A=; b=CWAYe6IVlNrLTcmm2WBNutrTuN
	e2f0bz0flZ5vshOBuDWNDNv8M9NybakYk8/v/Ui5G2fwNvelGPf+pO/t3rWVRDvxEkUMffPbj2gg9
	lOwnaxIJYAOOHcGX0C45JZSquRrWf/37+S9hNBqYJedJCVWAR+LKkBnEnliyDW9Oym+DCdBnnnqCw
	GJGmRCg+IRz0umuHitoBB8bmbF//ZSyqtfh5w50znvfm+Ixh8B0eRaqP+ayrz5K+N1i9QA/aIkl5x
	6XyhpfUtLgiKVbM5gKH4DX+XU3SIIU0B3pAB22DWK6YCMQnwmyCvDMHbRC5bpwLH5rLtowh3MW6dV
	FQdJ+9mQ==;
Received: from [83.68.141.146] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqXws-00FSG1-QD
	for <linux-riscv@lists.infradead.org> ; Tue, 17 Sep 2024 14:08:54 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1sqXws-000000004rM-0MAN
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 14:08:54 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Subject: RFC: extern illegal instruction trap and trap RDCYCLE
Date: Tue, 17 Sep 2024 14:08:50 +0100
Message-Id: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060900_643678_6A5AF6F1 
X-CRM114-Status: UNSURE (   4.73  )
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

This is a RFC series to change how the illegal instruction trap
is handled and then how to trap RDCYCLE and emulate it with RDTIME
instead.

I did this when we found multiple libraries using RDCYCLE and
upgrading multiple runners to newer kernels caused many problems



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
