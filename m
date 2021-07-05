Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F647C07E99
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E877361964
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E877361964
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=etorok.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PitkoNbLYMQuL4zYnBLlfEYusqrfJ1xzujAxU53ufBI=; b=J8b+YPKyQhRMG2
	hd+o9xRxytxFMfpwsWKqlD8aUAykoo3mURl1f5jIujAYG6NPW8KieSbyrjKLFtQIgTq8YUsLHCkGb
	gmlF9KVDZeEbSoaufJ3vo2u8/aa1Lt6uSO6S18m3w3F68fL8mLD/0IuWHSOEIquTNz9Wv+6myNU8x
	tvk8HM5at/lLcypLGxRXvrSu6kptADepwLGrPV0VQ5/v8fQOY8bed+kSNdKbUqm8uawusWwgvOFdX
	aeodJMG/PSW3iS98aoTldDsK6naxm7rFaPzzIQ3OpfhdWwxqedtRNak8aSNy2Vtt55ZWdxDDJiHpg
	r61Nm4Gt+IF8UGyUe+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Xyl-00A157-4U; Mon, 05 Jul 2021 23:26:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Xyh-00A13h-RB
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 23:26:17 +0000
Received: (Authenticated sender: edwin@etorok.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E177A200005;
 Mon,  5 Jul 2021 23:26:13 +0000 (UTC)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH 2/4] tools/perf: add riscv perf_regs.h to check_headers.sh
Date: Tue,  6 Jul 2021 00:25:22 +0100
Message-Id: <20210705232524.4024832-3-edwin@etorok.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705232524.4024832-1-edwin@etorok.net>
References: <20210705232524.4024832-1-edwin@etorok.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_162616_063156_397566F0 
X-CRM114-Status: UNSURE (   6.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T3RoZXIgYXJjaGl0ZWN0dXJlcycgcGVyZl9yZWdzLmggYXJlIGxpc3RlZCB0aGVyZS4KCkNjOiBB
bGV4YW5kZXIgU2hpc2hraW4gPGFsZXhhbmRlci5zaGlzaGtpbkBsaW51eC5pbnRlbC5jb20+CkNj
OiBKaXJpIE9sc2EgPGpvbHNhQHJlZGhhdC5jb20+CkNjOiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5n
QGtlcm5lbC5vcmc+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1v
ZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkd2luQGV0b3Jvay5uZXQ+Ci0tLQogdG9vbHMvcGVyZi9j
aGVjay1oZWFkZXJzLnNoIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS90b29scy9wZXJmL2NoZWNrLWhlYWRlcnMuc2ggYi90b29scy9wZXJmL2NoZWNr
LWhlYWRlcnMuc2gKaW5kZXggZGQ4ZmYyODdlOTMwLi5kNzU2ZjY2N2I3YzkgMTAwNzU1Ci0tLSBh
L3Rvb2xzL3BlcmYvY2hlY2staGVhZGVycy5zaAorKysgYi90b29scy9wZXJmL2NoZWNrLWhlYWRl
cnMuc2gKQEAgLTQwLDYgKzQwLDcgQEAgYXJjaC94ODYvdG9vbHMvZ2VuLWluc24tYXR0ci14ODYu
YXdrCiBhcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oCiBhcmNoL2FybTY0L2lu
Y2x1ZGUvdWFwaS9hc20vcGVyZl9yZWdzLmgKIGFyY2gvcG93ZXJwYy9pbmNsdWRlL3VhcGkvYXNt
L3BlcmZfcmVncy5oCithcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcGVyZl9yZWdzLmgKIGFy
Y2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oCiBhcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL3BlcmZfcmVncy5oCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCi0tIAoy
LjMxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
