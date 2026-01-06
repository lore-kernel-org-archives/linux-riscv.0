Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B15C47BC4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwlisvFjtha+Fmx7r0CLlqyOGykWrkD8Vqip6ITyBG0=; b=sHABDEdD8Wtk5m
	Fib+vLsyDRyoNgpMCuLNdpzDmt0KWyS2IAfvYf+zLmifNFiooPXKNJdlPiH0E3YM/hjAomNFU+Rik
	6naQgKdx/Kb5yE/wX6IgtL6JVnSsoC92PqK4iYmwY35zZwiDdwvBqdpjc+yjeQn4YKEiQO3eeYQyZ
	OWqhAP3l2czSz1dnUMHmh1Km8qRBzQJry5nwbgHwhn2+vkg5hZVMVUvMfi4T39nSjnUb/B3qiqPN/
	8HckPQu5AbyGPw4JgMcyM6RfbOJsAQyYBchLKLYVlKMhTb8M2bFI2a2EEBNIxeT9SEXT2+uGQoL2D
	4A4/sRQLt4CiF7QDcdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2gB-0000000CdJy-1UIH;
	Tue, 06 Jan 2026 08:44:42 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2g8-0000000CdJN-1lJ1
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 08:44:37 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vd2fp-000UCM-1H;
	Tue, 06 Jan 2026 09:44:17 +0100
Received: from Mac (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Tue, 6 Jan
 2026 09:44:16 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <pjw@kernel.org>
CC: <ast@kernel.org>, <bjorn@kernel.org>, <bpf@vger.kernel.org>,
	<daniel.weber@cispa.de>, <daniel@iogearbox.net>, <jo.vanbulck@kuleuven.be>,
	<linux-riscv@lists.infradead.org>, <luis.gerhorst@fau.de>,
	<lukas.gerlach@cispa.de>, <luke.r.nels@gmail.com>,
	<marton.bognar@kuleuven.be>, <michael.schwarz@cispa.de>,
	<palmer@dabbelt.com>, <xi.wang@gmail.com>
Subject: Re: [PATCH] riscv, bpf: add a speculation barrier for BPF_NOSPEC
Date: Tue, 6 Jan 2026 09:44:10 +0100
Message-ID: <20260106084410.94496-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <83981ed7-9d36-a47a-cf73-9010fceba5f1@kernel.org>
References: <83981ed7-9d36-a47a-cf73-9010fceba5f1@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_004436_475658_7F480F21 
X-CRM114-Status: UNSURE (   7.51  )
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

Hi Paul,

thanks for the feedback.

I have not benchmarked fence.i in the eBPF context specifically, but
from my other work on Spectre mitigations on RISC-V I can confirm that
fence.i flushes the instruction cache on all cores I have tested, both
in-order and out-of-order, so there is a performance impact.

I agree that making this conditional similar to ARM64's proton-pack.c
is the right approach. Getting this infrastructure in place is a good
idea regardless, as the RISC-V hardware landscape is very diverse, and
we will likely need conditional mitigation support for other Spectre
defenses as well.

Thanks,
Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
