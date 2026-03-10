Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8ECFCC9CB
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTVt1MtUoifq+EFsJAJ8qHbeclgDTVbfPvQwoO4ZHzM=; b=ivvvYXTM7AIk6W
	akMoAIP0BRJWfeh8cUMnQ17tywbCH7RV6wae1tfd05HPCnpI2gweiisM+j7wHyPKOUQlzIZRQSBfW
	W2FcLSwqAju5T56lxKkPW/IwIuD62QZYntY+uc9S9rVJocKssxFGiuwK3hAg847u4FdOlh9aGrnnB
	TyinOFWEcSTC8XkWWcIxntyp/WuH3gcm0kQ9U0bdU95eVh6ySwQNs36SvrhJM8wiwknXRaFpSxkGG
	VthkYgN0pskYElLHhdGVJsK2YqJJchlb0fa5OqImx955lA6K6SUPOnB1AnaqCGNq65KYw0UmBmLlj
	9zoZ5UZoWs69DCYu1/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqM3-00000008lzd-3C0g;
	Tue, 10 Mar 2026 06:14:07 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqM0-00000008lz4-2HwC
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 06:14:06 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fVNqn1PC0z8Xs79;
	Tue, 10 Mar 2026 14:13:57 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 62A6DlVU099069;
	Tue, 10 Mar 2026 14:13:47 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Mar 2026 14:13:49 +0800 (CST)
X-Zmail-TransId: 2afb69afb69d6a2-ae243
X-Mailer: Zmail v1.0
Message-ID: <20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn>
Date: Tue, 10 Mar 2026 14:13:49 +0800 (CST)
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <sunilvl@ventanamicro.com>, <rafael.j.wysocki@intel.com>,
        <liujingqi@lanxincomputing.com>, <cyan.yang@sifive.com>,
        <nick.hu@sifive.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.xuemei1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvMl0gaXJxY2hpcC9yaXNjdi1hcGxpYzogRml4IFJJU0MtViBBUExJQyBpcnFjaGlwIHByb2JlIGlzc3Vlcw==?=
X-MAIL: mse-fl2.zte.com.cn 62A6DlVU099069
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Mar 2026 14:13:57 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69AFB6A5.000/4fVNqn1PC0z8Xs79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_231404_751530_1545B478 
X-CRM114-Status: UNSURE (   3.77  )
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

This series addresses two issues in the aplic_probe() function.

Jessica Liu (2):
  irqchip/riscv-aplic: Do not clear ACPI dependencies on probe failure
  irqchip/riscv-aplic: Register syscore operations only once

 drivers/irqchip/irq-riscv-aplic-main.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
