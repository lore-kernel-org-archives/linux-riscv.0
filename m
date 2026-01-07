Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AEBCD5823
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je4cfrWFdb1AD9CCL9nwIHCOjC6IBrhXTdFDqLmO4AA=; b=aZXenKlfm57RNB
	cSSFTGU4jUCIxqKABXZ6Q73iOFp3PZFDRvRSDlVTKBtZPiGKiO4qpY1WMtsEkCG516ieuhN+YWhAk
	ZchYcKdpFQR02jLeZdP4L5uIc0Bu3H3vrJRtch0/UzhX3knePCFEOka7fuMw1kYytBc15h/bNA3Wu
	J7j+rTArFskD00RyicipeQnAaD1b/2XBmHjZC+xtQnEfPuj8LCGIasxgrLgiZ69QEaYJe6xs8vkJf
	4R8nB4C0qY5mOFCDrJ/55gYOh2W7N1b2l/jb5/n5g7OFWauZUIJPjZGuTB50EIauuWtrSEjn3RvXj
	WK0r1am9uCQ511yscpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQFR-0000000Ebgf-1vTf;
	Wed, 07 Jan 2026 09:54:37 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQFP-0000000EbfG-0n2Y
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 09:54:36 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vdQF9-000S4B-0L;
	Wed, 07 Jan 2026 10:54:19 +0100
Received: from Mac.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Wed, 7 Jan
 2026 10:54:17 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <luis.gerhorst@fau.de>
CC: <ast@kernel.org>, <bjorn@kernel.org>, <bpf@vger.kernel.org>,
	<daniel.weber@cispa.de>, <daniel@iogearbox.net>, <jo.vanbulck@kuleuven.be>,
	<linux-riscv@lists.infradead.org>, <lukas.gerlach@cispa.de>,
	<luke.r.nels@gmail.com>, <marton.bognar@kuleuven.be>,
	<michael.schwarz@cispa.de>, <palmer@dabbelt.com>, <pjw@kernel.org>,
	<xi.wang@gmail.com>
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
Date: Wed, 7 Jan 2026 10:54:05 +0100
Message-ID: <20260107095406.4082-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87y0m996b2.fsf@fau.de>
References: <87y0m996b2.fsf@fau.de>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-gwd-01.um.gwdg.de (10.108.142.50) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015435_225919_794DAD01 
X-CRM114-Status: UNSURE (   6.23  )
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

Hi Luis,

thanks for the feedback and pointer to the powerpc implementation.

Regarding bpf_jit_bypass_spec_v1/v4(): currently this is per-architecture.
What we need is per-processor granularity, so we can disable mitigations
on in-order cores and keep them enabled on vulnerable out-of-order processors.

Regarding fence.i being an extension: all RISC-V processors supported by the
kernel that are vulnerable to these attacks support this instruction. Also,
if a dedicated speculation barrier becomes available in the future, it would
be easy to switch to that.

Thanks,
Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
