Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33DC624D3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:Cc:To:
	References:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DseHYr0lNlFQWgqp+/spv+hKNpsa2fh1bnrBYdADpcg=; b=vTPLZ2FbrV0g71XkA3eS1LjSqa
	2if39Y39R4Xl9raUJUX7Y2rLCHITf+wFX5scwZzutCa3Jp/aKCMl6R6jpiAj15KEx2S1iWISjvSaz
	zLprLBGiOm7U/DU5H+zwa8xvHFSTlo5NU+Ac7QzpohJnZ6f7j4zzNGrujfReab9als9FDyVAq6GK9
	gRDr07vUYhvulsTZhaydHljz/vXoJgskM2Qmw+AwCQENoFJJv0GzQUVlKIBiY2lBra1Rb8/ZQhEQW
	6oeSfBPxav6oB6wMnR8Ae1rx4IhCY6vfMku5sQI+vmqy6mTacduP4gWcpB4mFoBfBzIQ9qso3rADl
	yLBdWK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QSJ-0000000CVVJ-30nw;
	Tue, 01 Sep 2026 15:31:23 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QSH-0000000CVUi-1sBg
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 15:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788276673; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7BFZhNSOareWcX7VGdQfnFAQDysNGmECn54AT57ukPs=;
 b=bi09KIZ92RpLKu1jhCFCcRAAM9AqVmdmmzOs9rRTDvXqpXZrHVSDQ4oqV5a94Fn8i3zdI5
 XTTETSkvM7lIwVOgmZM2YaFh+kBRbrcV+zInCZDAE2rXOva2THMn8va6HeBuJnVuqZJl72
 cSeq7dWlbuchMOSBBjAXM+YFc+P693YZv5kUdLaGmEf3OIMjbkxooxSOaLohJ5pbtn9I6Q
 bI8cYu1qKt7i/a7UqG7Ssqnw9VbrCCAnRq6ib5atvR+TkxsM+pC9BgJckdp4NfKd6D09j3
 TsalbOBUafOZ8axeD5nbRd99jErlbSEz9TedTlrVRIWi/xKlxJDsu4zIXYqYDQ==
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH 0/2] riscv: Fix cpu hotplug warnings
Date: Tue,  1 Sep 2026 23:30:57 +0800
Message-Id: <20260901153057.3557226-1-qirui.001@bytedance.com>
References: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a96efbf+dca663+lists.infradead.org+qirui.001@bytedance.com>
To: <palmer@dabbelt.com>
Cc: "Rui Qi" <qirui.001@bytedance.com>, <pjw@kernel.org>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083121_556127_E21FF16C 
X-CRM114-Status: UNSURE (   2.94  )
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

Ping.

This series fixes a regression introduced by commit 2b2b207e1162
("riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool")
that causes spurious warnings when offlining CPUs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
