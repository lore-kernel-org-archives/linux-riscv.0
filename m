Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D78C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJScmMlWhUaC44vjJGt669hnYB0CNstBDV5nN5hf//o=; b=cYaNEV4O6KWBge
	djcK6MkKCpaVlpPggIzWNZgqSSjQ9I1U5qG8J3b3d4WiH1Nvz01hSicdfyoWypFg7RShjs8FufMi0
	rw84m0Q/EUCTxmYc0KrMx3CO+XuaYuLc12Ka19Pv9d0V18f4+Rq+C0rBwFrvfYhHBAvOd5TmVtnKn
	kBp6BTCTWpssuWcGWtVJJot6ejR/8UbwNdznABNAZW0pwQn1Qj6K0iyXa8f017OPmep/dUnFzCa1e
	qw2p1CBryFBcaPrDXkMj7Jqfki0+WbSg56ui2jhOgpC3OqWLVv3gapKHiJBpfUjQQrRzfKka9T1hY
	LDVAVdVjsWwfBq5z2l7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfVy-0000000C052-13bv;
	Mon, 06 Jul 2026 09:21:22 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfVu-0000000C045-0aai
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 09:21:20 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABH5s6Fc0tqQzPxBA--.35180S2;
	Mon, 06 Jul 2026 17:21:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rahul Pathak <rahul@summations.net>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup@brainfault.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailbox: riscv-sbi-mpxy: validate RPMI event records
Date: Mon,  6 Jul 2026 17:21:08 +0800
Message-ID: <20260706092108.78340-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowABH5s6Fc0tqQzPxBA--.35180S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW3KFW3KF4fGF1DAFyfXrb_yoW8Gr15p3
	yUKayFkrWUt3ZrZwnxZrn8Aw1Uua93WryDKF4jy34Fya90grWUJFsrta4jq3WrtF18JF4I
	9wn0qr4UuryDta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbUPEDUUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_022118_538193_E3F3D770 
X-CRM114-Status: UNSURE (   8.98  )
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

mpxy_mbox_peek_rpmi_data() walks notification event records
embedded in the RPMI notification buffer.

Iterate only while a full event header remains, and stop if the declared
payload length extends past the notification buffer.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 7c9c006b7244..db380f26872d 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -480,11 +480,14 @@ static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
 	struct rpmi_mbox_message msg;
 	unsigned long pos = 0;
 
-	while (pos < events_data_len && (events_data_len - pos) <= sizeof(*event)) {
+	while (events_data_len - pos >= sizeof(*event)) {
 		event = (struct rpmi_notification_event *)(notif->events_data + pos);
 
 		msg.type = RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT;
 		msg.notif.event_datalen = le16_to_cpu(event->event_datalen);
+		if (msg.notif.event_datalen >
+		    events_data_len - pos - sizeof(*event))
+			break;
 		msg.notif.event_id = event->event_id;
 		msg.notif.event_data = event->event_data;
 		msg.error = 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
