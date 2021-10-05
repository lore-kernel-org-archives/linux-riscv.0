Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC8FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 12:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A68461186
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 12:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A68461186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XeGWMG0EsBsCLOeVDMOzhW3xp6ZUJ2RLjPJ/WIKdjXc=; b=KQW1+8WPVROvBE
	3OH/wkH97IsZ9ExJ6AF4bQN+/Iu/QNEP5aJMBI+3mNUKDhpQ1c9R7PVA8+PItmea9BaI1JFrRGz4v
	7KHZc5gOYmWE0DiCaPTXaeYkZ4mlqj9jA6SeorLdt3UiUjwm3KzCcyKM8uRHiBW/LvVMoH7SL/bia
	xSalnHORQKptk4D/KWLzS79Q9T1uMTo1sadWbmOK1Ob5P2b4BGC+idwnsnZlP9y9l3oOwaNUBGAlG
	vXF9bMLKsXGa7xlexr5DTZaFUAN2Oxauzc/x4yxlUdvO76rFGIM87lrTRmGoCF0kcXXCKAdgR5muZ
	Kqvwp20g2x+cmwHzg/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXjKZ-00AJTs-5g; Tue, 05 Oct 2021 12:13:59 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXjKQ-00AJLj-Dp
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 12:13:52 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 195CDaMW012088
 for <linux-riscv@lists.infradead.org>; Tue, 5 Oct 2021 15:13:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1633436011; x=1636028011;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AebaI2Opn2KDPkehW8betq17Udp5gRls6N7tILPVKdE=;
 b=KMDZ/rH7xbXqfOwJ8A7rPVPIT9MNC9dNxDabBtR4M1cDWlKWoam//LqvePaiKJXR
 H+TPaiyHMTojAsZL5TWy7S9DNal5iUggaf/ARI2GCBxokPs8tyoseTpJTCYNtPSj
 kzDxzZPJOxVNpsTEPW8A4rLq+LzMDnLKW4zRLtH3Hu01Ftz/v6zKZMqJftZ8xyn6
 anhYehK7NTsoVnYoDrL1/QKE37D8tRQho+3wPRyiOSdMrMV0wM43eX10tTdwzIo2
 gF5bwSSF0o87RWootROYfpqu8yEYYJ2rflIuUAsFIuaEby22QBoQwBbYr/L4+/r6
 0NY5nSXF7NBBr/s8Z9HUxQ==;
X-AuditID: 8b5b014d-ba8f670000005d46-88-615c416b4968
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 A6.62.23878.B614C516; Tue,  5 Oct 2021 15:13:31 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 05 Oct 2021 15:13:30 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: ebiederm@xmission.com, kexec@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 alex@ghiti.fr, rppt@kernel.org, geert+renesas@glider.be, Stephano Cetola
 <scetola@linuxfoundation.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, palmer@dabbelt.com,
 anup.patel@wdc.com, atish.patra@wdc.com
Subject: RISC-V: patched kexec-tools on github for review/testing
Organization: FORTH
Message-ID: <00c521b5b872b06c9350145c7d39fe7c@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsXSHT1dWTfbMSbRoOWtisWzO19ZLZ58mMhm
 sWjFdxaL/9ta2C3mzp7EaLH79Fcmi8u75rBZbPvcwmbx8nIPs0X3ymqLI+u3M1nM/rCExYHH
 483Llywe905MY/WYeFbXY9OqTjaP/XPXsHtsXlLv8XmTnMfO2w+ZPNoPdDN5TDnUzhLAFcVl
 k5Kak1mWWqRvl8CVcbvhMXvBZOaK3ysSGxjvMHUxcnJICJhIPFt6Asjm4hASOMYosWvmM3aI
 hKnE7L2djCA2r4CgxMmZT1i6GDk4mAWsJdr3GICEmQXkJba/ncMMYrMIqEqsnvQYrJVNQFNi
 /qWDLCAzRQQ+M0l0XGgEmyMs4Cix8t9tMJtfQFji092LrBDzXSReP/rEBrFXReLD7wfsILtE
 gezNc5UmMPLNQnLFLIQrZiG5YgEj8ypGgcQyY73M5GK9tPyikgy99KJNjOAYYPTdwXh781u9
 Q4xMHIyHGCU4mJVEeK96RSYK8aYkVlalFuXHF5XmpBYfYpTmYFES5+XVmxAvJJCeWJKanZpa
 kFoEk2Xi4JRqYMoqv2tkW7Rki6SG4Ifk8oVe59arzCx+dLv9ljCLwqJflRwXl/bwTgvUmxs9
 e0XIpIP+Mo57Vy/36F/o/nJiejJLaJWm6b3dkWtTvl6XPBGsq7VEIX+W++P/Hq2WswN3xa/w
 F5sYW295oCZIajPHnb+vjYVsDme8jBKtYuLdnt76npHXckLfgnXSyQp51tHezodazv5QPLaB
 mTXxgJnz6XTevJmbTBpiZv4LEFaq0pNeFuqvGuB/8fFNqcC13Ov/Zhi8LJivmtakmla3r+vF
 feXZR1x3Ld2zpmU750k9LobUPuHv3hf2aV6LPSyasWxHffj9si+zbJ5k8bw5EdgbobzlfI+7
 gr711lWzT4sdUmIpzkg01GIuKk4EALq7jjfwAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_051350_900450_347BF985 
X-CRM114-Status: UNSURE (   3.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello all,

I've uploaded my kexec-tools patches for riscv on github for 
testing/review before sending them upstream.
https://github.com/riscv-collab/kexec-tools/tree/riscv

Both kexec and kdump were tested on latest rv64 qemu, using for-next 
branch with this patch applied:
https://patchwork.kernel.org/project/linux-riscv/patch/20211002122026.1451269-1-mick@ics.forth.gr/

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
