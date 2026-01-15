Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E4D44C41
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4fWm8EZPnwC+okNcpLboXed9vo9t0yD71nE0LJuuYU=; b=OG/zKyrYAgQNJ6
	JbVybzoZBgkxSs2+IUe1f7WU3Uth8XO2hpywBS6+uHLgltk0LxVf/RU5H5aVs+/ECNVJKwbWPJWsm
	hwG6Z/Lml8850zlCdmHZa+iZlE1OTnxH6+Ge+xGVn0L4ez06s2hd48fXKQV2hMqyf/JPsT9KtCENV
	9zlLClnsuiIU7hIfgo4Uykvuj/mUVEcSw0gMMs3NEngdKfzW+VzP7eTd1sTp16RcwdL0yG8aIi4RP
	KK1N5wXWjl8jZ8RqYrhN4rrQWlwE+5BR7CK7PYsrHnHDqUJQ3G2cLVBhL8NSn6Aq13qZon6kfMitI
	jSAElg5OW1WXr/0LMXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNAp-0000000COSn-4BTb;
	Thu, 15 Jan 2026 13:14:04 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNAn-0000000COS6-3INV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 13:14:03 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vgNAY-000WhK-0w;
	Thu, 15 Jan 2026 14:13:46 +0100
Received: from Mac.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 15 Jan
 2026 14:13:45 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <pjw@kernel.org>
CC: <ast@kernel.org>, <bjorn@kernel.org>, <bpf@vger.kernel.org>,
	<daniel.weber@cispa.de>, <daniel@iogearbox.net>, <ganboing@gmail.com>,
	<jo.vanbulck@kuleuven.be>, <linux-riscv@lists.infradead.org>,
	<luis.gerhorst@fau.de>, <lukas.gerlach@cispa.de>, <luke.r.nels@gmail.com>,
	<marton.bognar@kuleuven.be>, <michael.schwarz@cispa.de>,
	<palmer@dabbelt.com>, <tech-speculation-barriers@lists.riscv.org>,
	<xi.wang@gmail.com>
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
Date: Thu, 15 Jan 2026 14:13:39 +0100
Message-ID: <20260115131339.16372-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <65f1b958-e420-c517-9a60-86f9085de702@kernel.org>
References: <65f1b958-e420-c517-9a60-86f9085de702@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_051401_822931_80286667 
X-CRM114-Status: UNSURE (   5.16  )
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

Thanks for the discussion.

I agree with Paul that waiting for the TG to complete is not practical
given the timeline. There are vulnerable cores in silicon now.

On fence.i's effectiveness: Stefan and Ved are correct that it only
architecturally guarantees a retirement barrier. However, we tested
fence.i on C910/C920 and P550 and found it does prevent Spectre-PHT
attacks on these cores because they drain the pipeline.

On performance: on the cores we tested, fence.i flushes the instruction
cache, so the overhead is significant. The barrier should be configurable
per-microarchitecture. In-order cores like U74 and C906 are not vulnerable
and don't need it.

More broadly, getting selectable per-microarchitecture mitigations in
place for RISC-V now seems valuable. Implementations vary significantly
and will likely need different mitigation strategies going forward.

Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
