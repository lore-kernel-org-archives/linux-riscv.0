Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7154CA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH9PQ9Ixd98i/U59vb2fn1qhstvUOQZVb3guBqaHDK4=; b=NQkbYVBx6+swbD
	Kto5B9EXhg5rg/3X8b4ifXrhi1aDEOQZKnV0sajahGXO0xw+cVF/ANkFxV71P4l1luwVKhiGpshGJ
	DC0Qqjztf8ctfL6AhohKVKyzqQOwKcX52T5LkxEpFfxamRidrWwTzI51OwY5U+G99Jy7ejiN8uhHO
	PhIiHVpiH2lpja0g1RCgDUN2QRjKIRWbyqyfm+q6P/Mz9ErGlbAP5dLJqIJAa6n8HknYz1TWtyPt+
	CWK8SX44GZAIB7hJjbq7ilskCbk5jf/0J1XbWzKQHKZV5XjiK81EQ42ksY3vN5J80a62RUaoKMHOf
	nMSt8e4kFnxYnlIXtCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvpM-00000006Pow-3r6n;
	Wed, 30 Sep 2026 15:02:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvpK-00000006PoN-2nX7
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 15:02:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxste3063874;
	Wed, 30 Sep 2026 15:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VlIzBFHkV9X
	fMdpGq0qSSmtYUwJmICqHwZx+W07EONU=; b=U5P+RoK1vbmKJV88aaqBN6Kfm7V
	gmLALB9XJdDmH9BmBkobMIB0wbHyHt9Rfn3/7zTZScd9oioH1NHe77NtFy69L3Fj
	3GKdeCL07Vmws3Q8kFeuEPr8nG2OnfG14spMvBuN5aMfadE9qLpSt3lMcpkb0ctQ
	NTIYpzCv0i8LidEVyo8mShdlkKdVe33sJxQlPbhH10MxEnPbUgjIVwwXKhMzR9Ca
	HF/lDG7C8lkF3OFhQM78PLbZr9Mh7NG8OIljTsaCeR5LJwWvebe2Tdxps/zC4XaL
	WeWyJDFYx8ny07ZjjyZQQkw2bOB7Yz07Y3e/FmunluUIWGspbl32hAXzHCQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjk5v1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:23 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UF2KWT1902866;
	Wed, 30 Sep 2026 15:02:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68UF2JjA1902837
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:19 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 50BED248F0; Wed, 30 Sep 2026 20:32:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 4/4] mailbox: riscv-sbi-mpxy: Move to send_data_sync() for sending messages
Date: Wed, 30 Sep 2026 20:32:13 +0530
Message-ID: <20260930150213.799245-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXxyd8dkcq4Ui/
 rsa8PrzBI7ZJ21y7bFiM+PeMZ3LgwEx8f6oQ54BaumlKNI6wPzCKEFZEVrygqN6MEtUjYdcLa/C
 XSDzLH61EF0tchODzmjgQ9aabSK66hA=
X-Proofpoint-GUID: zxMsC_09b6bL1eqm5WCFkuizxQFM1mz2
X-Proofpoint-ORIG-GUID: Nrw9qYZp0ICAm-IYXr0RnGWUO5Gy8GZT
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd2480 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=0GpNuyj-o5aRwIpX3sEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX+i3adNRbCCpI
 8DsC1UN3bz9VgIbbJ4G7mNkjByPGltsmItY+9IeFeTQwzlxjnVw0MUAtZyKGBqYzoBNby7lw2St
 +D1GAo0VrE4OQbLUjTvK5Vzl5t4+PNu5cwZvpqUuV4KQuRfVlv1kE9bh1zwhls/5oJvzHa04TsP
 EL7bV5KegGEEq7aAZLWXP8pSWQurDAxSrFwVe0p8otOz5F0jpOdJtoGCdoqaujC1+6g+FP5c6CN
 VDbJ4ZuZMTzhRP7GSaulfs+x1XhNhwZf6MX2PGxWIe6gT8aRyeBGZxS4IYezdZNPWDIIs0imZ/t
 4mkjm8WV0fX2Upiyn5lHCI2l4Ex8xBQFIYeLkKSV4Lg1SQK1fqes41WDhqK06XZ74cTt4CR+xRC
 IhVE/H2EbF5S3whfsQu4XMtQoU48yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609300059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_080234_720209_E72035BC 
X-CRM114-Status: GOOD (  23.59  )
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

Currently, the SBI MPXY mailbox driver retrofits synchronous message
exchanges over existing send_data() callback and client driver explicitly
calls mbox_client_txdone().

As a side effect of this retrofitting, all messages sent via SBI MPXY
mailbox channel are serialized using per-channel spinlock which in-turn
prevents multiple CPUs simultaneously sending messages. On the contrary,
the SBI MPXY specification defines per-CPU MPXY shared memory so multiple
CPUs are allowed to send messages in-parallel.

To address the above, update the SBI MPXY mailbox driver to use the
send_data_sync() callback instead of send_data() callback. This removes
the redundant per-channel spinlock from the message sending path thereby
enabling parallel message sending from multiple CPUs. Also, the "error"
field in struct rpmi_mbox_message is now redundant because it was being
used to save the error dropped by msg_submit() function hence remove it.

Co-developed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/clk/clk-rpmi.c                     |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c    |  2 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 59 +++++++++++-----------
 include/linux/mailbox/riscv-rpmi-message.h | 18 +------
 4 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
index 921296aafa68..e365cb8a8dac 100644
--- a/drivers/clk/clk-rpmi.c
+++ b/drivers/clk/clk-rpmi.c
@@ -527,7 +527,7 @@ static int rpmi_clk_probe(struct platform_device *pdev)
 	context->client.dev		= context->dev;
 	context->client.rx_callback	= NULL;
 	context->client.tx_block	= false;
-	context->client.knows_txdone	= true;
+	context->client.tx_sync		= true;
 	context->client.tx_tout		= 0;
 
 	context->chan = mbox_request_channel(&context->client, 0);
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 612f3972f7af..ca638900aa74 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -224,7 +224,7 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	priv->client.dev		= priv->dev;
 	priv->client.rx_callback	= NULL;
 	priv->client.tx_block		= false;
-	priv->client.knows_txdone	= true;
+	priv->client.tx_sync		= true;
 	priv->client.tx_tout		= 0;
 
 	/* Request mailbox channel */
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index cba95b8406ee..18d5ed0b1561 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -112,10 +112,10 @@ struct mpxy_mbox {
 
 /* ====== MPXY RPMI processing ====== */
 
-static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
-				     struct rpmi_mbox_message *msg)
+static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
+				    struct rpmi_mbox_message *msg)
 {
-	msg->error = 0;
+	int error = 0;
 	switch (msg->type) {
 	case RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE:
 		switch (msg->attr.id) {
@@ -138,52 +138,54 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 			msg->attr.value = mchan->rpmi_attrs.impl_version;
 			break;
 		default:
-			msg->error = -EOPNOTSUPP;
+			error = -EOPNOTSUPP;
 			break;
 		}
 		break;
 	case RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE:
 		/* None of the RPMI linux mailbox attributes are writeable */
-		msg->error = -EOPNOTSUPP;
+		error = -EOPNOTSUPP;
 		break;
 	case RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE:
 		if ((!msg->data.request && msg->data.request_len) ||
 		    (msg->data.request && msg->data.request_len > mchan->max_xfer_len) ||
 		    (!msg->data.response && msg->data.max_response_len)) {
-			msg->error = -EINVAL;
+			error = -EINVAL;
 			break;
 		}
 		if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITH_RESP)) {
-			msg->error = -EIO;
+			error = -EIO;
 			break;
 		}
-		msg->error = sbi_mpxy_send_message_with_resp(mchan->channel_id,
-							     msg->data.service_id,
-							     msg->data.request,
-							     msg->data.request_len,
-							     msg->data.response,
-							     msg->data.max_response_len,
-							     &msg->data.out_response_len);
+		error = sbi_mpxy_send_message_with_resp(mchan->channel_id,
+							msg->data.service_id,
+							msg->data.request,
+							msg->data.request_len,
+							msg->data.response,
+							msg->data.max_response_len,
+							&msg->data.out_response_len);
 		break;
 	case RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE:
 		if ((!msg->data.request && msg->data.request_len) ||
 		    (msg->data.request && msg->data.request_len > mchan->max_xfer_len)) {
-			msg->error = -EINVAL;
+			error = -EINVAL;
 			break;
 		}
 		if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP)) {
-			msg->error = -EIO;
+			error = -EIO;
 			break;
 		}
-		msg->error = sbi_mpxy_send_message_without_resp(mchan->channel_id,
-								msg->data.service_id,
-								msg->data.request,
-								msg->data.request_len);
+		error = sbi_mpxy_send_message_without_resp(mchan->channel_id,
+							   msg->data.service_id,
+							   msg->data.request,
+							   msg->data.request_len);
 		break;
 	default:
-		msg->error = -EOPNOTSUPP;
+		error = -EOPNOTSUPP;
 		break;
 	}
+
+	return error;
 }
 
 static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
@@ -205,7 +207,6 @@ static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
 			break;
 		msg.notif.event_id = event->event_id;
 		msg.notif.event_data = event->event_data;
-		msg.error = 0;
 
 		mbox_chan_received_data(chan, &msg);
 		pos += sizeof(*event) + msg.notif.event_datalen;
@@ -222,16 +223,16 @@ static int mpxy_mbox_read_rpmi_attrs(struct mpxy_mbox_channel *mchan)
 
 /* ====== MPXY mailbox callbacks ====== */
 
-static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
 
-	if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
-		mpxy_mbox_send_rpmi_data(mchan, data);
-		return 0;
+	switch (mchan->attrs.msg_proto_id) {
+	case SBI_MPXY_MSGPROTO_RPMI_ID:
+		return mpxy_mbox_send_rpmi_data(mchan, data);
+	default:
+		return -EOPNOTSUPP;
 	}
-
-	return -EOPNOTSUPP;
 }
 
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
@@ -423,7 +424,7 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
-	.send_data = mpxy_mbox_send_data,
+	.send_data_sync = mpxy_mbox_send_data_sync,
 	.peek_data = mpxy_mbox_peek_data,
 	.startup = mpxy_mbox_startup,
 	.shutdown = mpxy_mbox_shutdown,
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index e135c6564d0c..0278f1cee51f 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -164,7 +164,6 @@ struct rpmi_mbox_message {
 			u8 *event_data;
 		} notif;
 	};
-	int error;
 };
 
 /* RPMI Linux mailbox message helper routines */
@@ -174,7 +173,6 @@ static inline void rpmi_mbox_init_get_attribute(struct rpmi_mbox_message *msg,
 	msg->type = RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE;
 	msg->attr.id = id;
 	msg->attr.value = 0;
-	msg->error = 0;
 }
 
 static inline void rpmi_mbox_init_set_attribute(struct rpmi_mbox_message *msg,
@@ -184,7 +182,6 @@ static inline void rpmi_mbox_init_set_attribute(struct rpmi_mbox_message *msg,
 	msg->type = RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE;
 	msg->attr.id = id;
 	msg->attr.value = value;
-	msg->error = 0;
 }
 
 static inline void rpmi_mbox_init_send_with_response(struct rpmi_mbox_message *msg,
@@ -201,7 +198,6 @@ static inline void rpmi_mbox_init_send_with_response(struct rpmi_mbox_message *m
 	msg->data.response = response;
 	msg->data.max_response_len = max_response_len;
 	msg->data.out_response_len = 0;
-	msg->error = 0;
 }
 
 static inline void rpmi_mbox_init_send_without_response(struct rpmi_mbox_message *msg,
@@ -216,7 +212,6 @@ static inline void rpmi_mbox_init_send_without_response(struct rpmi_mbox_message
 	msg->data.response = NULL;
 	msg->data.max_response_len = 0;
 	msg->data.out_response_len = 0;
-	msg->error = 0;
 }
 
 static inline void *rpmi_mbox_get_msg_response(struct rpmi_mbox_message *msg)
@@ -227,17 +222,8 @@ static inline void *rpmi_mbox_get_msg_response(struct rpmi_mbox_message *msg)
 static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 					 struct rpmi_mbox_message *msg)
 {
-	int ret;
-
-	/* Send message for the underlying mailbox channel */
-	ret = mbox_send_message(chan, msg);
-	if (ret < 0)
-		return ret;
-
-	/* Explicitly signal txdone for mailbox channel */
-	ret = msg->error;
-	mbox_client_txdone(chan, ret);
-	return ret;
+	/* Send message for the underlying mailbox channel synchronously */
+	return mbox_send_message_sync(chan, msg);
 }
 
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
