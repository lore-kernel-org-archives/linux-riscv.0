Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B68D49762
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Dec 2024 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Txe8wBETRYv72BaZDWqNi4/ObwMrnETYRmGov5eo6Ss=; b=OXz10aKS1SRl94
	RdZxka6GsU9e5aMm5xvpt/jpoRJOMvECzuEuQo7i3s1ibOcBwVsua3pVBa0tX+qqa9AHHimfLz7Qs
	j2VoN/9c5vy4QemILlyxX8FpNcvi0+l5wrWKO1hnGYdiLAzmvo4lXdPcppH4RpWDCzJs1zx5NI6eB
	2/jTbmDda2yzQLu5Njq5jP8dQJJkUT9P31czAJiPdKqofp44Nodyrqx9P8KHfQk+3/BdSzBhfvvBF
	TlDPqBn2/4SJDqEOvAPAT/ewgeFeIPEZWDcNaPhBntBZef67apoNW+/h8KJvmmt8QOhh+UuVU0vLE
	9K61Gb9HDMGneCoiukNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBU-00000003INv-2q7z;
	Sun, 01 Dec 2024 10:28:12 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBR-00000003IMO-1KCS
	for linux-riscv@lists.infradead.org;
	Sun, 01 Dec 2024 10:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wYQINZke+VP8RwGvJdzwfUgHV7NYMjiCDg4c36I9s+E=; b=Dj1q3KVxgd3V54ZsThaVaMW+yW
	1T8k3U14+yap1d7JEAeMcVD/b4bLR6kIyVwzKk6B31rw1PeoZIWnXAw2lYHh1Wnsc8WYnsism2HM4
	qGIFgb7ThbX9RXSKojUxVIpyLg9UCe1KddlhwmFKhQP+OezlGCqhV9JOKsoAzepdcrfxR3ROscgJy
	/X5mGK8Zl65MUbFhdVlpPo8NlBvmYdnSuGyDyeEoVYW3uUC2USfiiR+X/pk2Y5021LDk5vv/aTe+j
	u5cG0h1N6eqaIsRG4dFKNWQhwX9nCjg//yf3zrG5rgbidfwJ+thvCAyi+CHlzH9aS2Z3duD7SxJoy
	3tF7JOMA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tHhBJ-00DpKl-6a; Sun, 01 Dec 2024 10:28:03 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tHhBJ-00000000vYk-2PjY;
	Sun, 01 Dec 2024 10:28:01 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com,
	palmer@dabbelt.com
Subject: Updates for asm/ptrace/insn code
Date: Sun,  1 Dec 2024 10:27:56 +0000
Message-Id: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_022809_350070_AFA87B31 
X-CRM114-Status: UNSURE (   7.76  )
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

This is a re-send of the series that was setting up for the RDCYCLE
emulation in kernel space. I think these are still useful so am
re-sending this series with comments and fixups.

Even if we don't emulate RDCYCLE, we may still want to check for it
in the trap handler and possibly allow for it to be emulated later
if people feel that would be good (or at least some sort of warning
printed)

Thanks for the reviews. Hopefully this isn't too late for inclusion.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
