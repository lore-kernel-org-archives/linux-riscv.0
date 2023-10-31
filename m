Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC447C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQnmjJYqYEKqvFRVRPzpVtq03NIkUI0rEl/1VOFA3w8=; b=EVaOZ2TXPTqxmM
	7mz29v0GZbVOun9kaJhr7JJHdB7WC8P8yBlPAk0gTIPUoMB4tRWwLbDIoxk9DokghrjEPUucdXyOI
	A7YZ6H3ZHOq2UgOaCu2GSclb64auaT2r+DsZrfeRrWTKKHjdWKnFpbXtKOtitejxYx4IDGC3Vy1FC
	QXPoYEECwwlttzPAH+xYSuhalb8oEjl9lHF4Kj1tkzptQOKiQXm17dTN5iipQ9YognPpc8oofFNHg
	rPo6uvQMSuuX98lgrTA1Dbb7WI2IuuoIfyVhWN1p4KXNjwbIrhNwAm7He6EfDJxYMeJkjMz9FE0h1
	2sGgZNrt9aOBbMvJoZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxn7B-005B77-0o;
	Tue, 31 Oct 2023 11:40:57 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxn78-005B6b-1u
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 11:40:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A841421AAA
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698752447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ysw3/e7CJBXfebQ/F7zgJot5ILcJ5+z1Puzfiu2pQeU=;
	b=er0YEFZyvn2+gVXD3cwa11VfkzuV0Q6NwX4d9Se80ofI3t3nQm8i0c3/OnsM/ZoNpVZ07x
	8OtXqEaCBKD39mgMY+FFoifI58vh4SqYxZhjncfjq4WJckb40JHR72CpU8jbR3xAgyMry7
	GpFgOBIzSTzujTyeJKonCpKqt9tZ78s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698752447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ysw3/e7CJBXfebQ/F7zgJot5ILcJ5+z1Puzfiu2pQeU=;
	b=6HWR6Pdb+tLjx+SmlYkAlveFgq12fpfCMlyeMGenzjTwAJguyydz3qKd7HGRMFrRDAbMaq
	xbnfEVhJJgNEG+Bw==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 62F082CC4D
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 11:40:47 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 98E0B4A039D; Tue, 31 Oct 2023 12:40:47 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: select ARCH_PROC_KCORE_TEXT
X-Yow: I hope I bought the right relish...  zzzzzzzzz...
Date: Tue, 31 Oct 2023 12:40:47 +0100
Message-ID: <mvmh6m758ao.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_044054_799271_B093DDD2 
X-CRM114-Status: UNSURE (   7.84  )
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

This adds a separate segment for kernel text in /proc/kcore, which has a
different address than the direct linear map.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c48fecc6719..596975741401 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -899,6 +899,9 @@ config PORTABLE
 	select MMU
 	select OF
 
+config ARCH_PROC_KCORE_TEXT
+	def_bool y
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
-- 
2.42.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
