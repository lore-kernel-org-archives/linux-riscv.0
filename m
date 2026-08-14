Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5725BC5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDxubXiv7iEsw9BQqGxecCuaosVjepYhmc8z0BOPkq8=; b=xmx8UOVllKZMMK
	hkG6HPq4WuECcI6NtpPvlVHLSKSmNvn3hrdEeqa75+NrxHY673aLcrkkx6/LktT+ZWyvnnFGkftXu
	JiRwQObEn9KFGZF/J7htpzDNtuLG+jd3wSayKWLNqAgFJVQCkfFHxYU6N4HqH2InV0uDvOCM9RKxU
	wnmhlOQn+PYeRVF/YWPYRMwGRpWPzOxpVKVz6+cKxzVnNSl//chpCndj+ZToO1P//EK9UloQ2jakL
	6J7GiOmT4cdOtvvor0yYbTAHS/GT1wS73+Jx0ZiztjDobiGiPQqtXiCEp8XHsCo6TA71x5OudS4dR
	lIGEt/hXKuRKAw4ZFHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wums0-00000002ExW-1T8K;
	Fri, 14 Aug 2026 08:02:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumrx-00000002Ex3-0o2W
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 08:02:27 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnffGIy35qW7eeBQ--.48856S2;
	Fri, 14 Aug 2026 16:02:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rahul Pathak <rahul@summations.net>,
	Anup Patel <anup@brainfault.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] mailbox: riscv-sbi-mpxy: validate RPMI notification lengths
Date: Fri, 14 Aug 2026 16:02:15 +0800
Message-ID: <20260814080215.21753-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACnffGIy35qW7eeBQ--.48856S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyktr43Kw4fJrWfCr13CFg_yoW5GF4rpF
	W7Ka4FyrWUtrnrZ3sxX3WkZayUW3s3JF9rKa4qy34FvFsxWr1UJFWDta4jq3WFyFW7Jryx
	twsYqFs8Z34DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6r
	yUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_010225_601701_E8719346 
X-CRM114-Status: GOOD (  11.57  )
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

The SBI return value controls how many bytes are copied from shared
memory into the RPMI notification buffer. It is not validated against
the negotiated shared-memory size before that copy. The event walker
also uses a reversed loop condition and can inspect a short event record.

Validate the complete notification length before copying it, iterate only
while a full event header remains, and stop when a declared event payload
extends beyond the copied notification data.

Fixes: bf3022a4eb11 ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260706092108.78340-1-pengpeng@iscas.ac.cn/
- validate the SBI-reported total before copying shared memory
- fix the inverted full-event-header loop condition
- validate each event payload extent before dispatch

The shared-memory and event extents were reviewed statically; malformed
RPMI firmware data was not injected.

 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 7c9c006b7244..714f7fb97a2f 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -314,8 +314,13 @@ static int mpxy_get_notifications(u32 channel_id,
 			 channel_id, 0, 0, 0, 0, 0);
 	if (sret.error)
 		goto err_put_cpu;
+	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
+	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
+		put_cpu();
+		return -EOVERFLOW;
+	}
 
-	memcpy(notif_data, mpxy->shmem, sret.value + 16);
+	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
 err_put_cpu:
@@ -480,11 +485,14 @@ static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
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
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
