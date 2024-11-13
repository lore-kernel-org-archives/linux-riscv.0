Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58650D41C21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jF24SRVeJcacK0AitOnZOxrSogqB0JE6p2yjX10MGYA=; b=DBpZnC/caLLKS/
	fEITtVmH3uqk0tdzKwKevLTFd5M5W1ur2Zb5DJjw8Nv8qBDHqb3MNKYAKaQxkchrpH/SFyt/Vs6W5
	rRBTFKdUXlkqhnjmaeApkQCtRbwMqD0472O0Ip4R3shCNh6aZ3ObwCD6/aGT+izRPOWzQwLhIpCxG
	/C8XBzWy/4u7RykPWgttBvwzwPyyrJH+vtVG1kdLHPyS+Qq6KUg03k2DaU42s1H7TfUri6tYTwqZw
	1vlNZEY9tsn7TZiMSLDPQpE43I47JsOgzW1UKAMdPNiW4XHpYlm4jX4nn8AsiDLa9BTPBTA2fQoEA
	b+/kSNDdFeVW0eOY1tQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Z0-00000006E2M-1F0m;
	Wed, 13 Nov 2024 09:21:26 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Up-00000006DTt-2WfI
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 09:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZolY05JSEnFHF3RS09w73b3NX2k/aj5Y9L2r7AoNfDY=; b=vaezeauO0mtpnoYuYudhX1TyAV
	oC7s6uyhVqiSfOJNO1RNJh1gF+0hTPNafuIxvb7sI0Sf49H9bBya7XKCuepjz/ZGVtdg8Pm8fK2We
	d+J9Zd7XSnzMORhb0w/BCpEtQZsimCoHD5Tlc43oXQDENZxiX6+24ODMpYC/29z4e3xYmgFlhqrMW
	efIpm56F75RCY8PPhE1dyrjnGBHFlvxGuLOWFtLP/w14Vo2pirhRwcmV9g+ETMhKA/IvpzeOAgLie
	QGD63nF7SoppIeF4Uw9A+H7Lari1LACeTj7Dtq9FcOJEvuF7T/3z0bPfR+G8uUuBNva3M4cVoRu7U
	8MCtca4w==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tB9Ul-003uom-Nk; Wed, 13 Nov 2024 09:17:04 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tB9Ul-0000000D936-3goO;
	Wed, 13 Nov 2024 09:17:03 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	ajones@ventanamicro.com,
	alex@ghiti.fr
Subject: updates for instruction trapping and ptrace
Date: Wed, 13 Nov 2024 09:17:00 +0000
Message-Id: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011707_751208_9B5075A9 
X-CRM114-Status: UNSURE (   4.02  )
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

After looking at handling the RDCYCLE as RDTIME, the following
patches are probably still useful (even if the actual in-kernel
fixup of RDCYCLE isn't).



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
