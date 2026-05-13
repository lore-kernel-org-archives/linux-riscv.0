Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3BCD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDKQNYwLoo2Vlx61mnESPqTNgWzNz3t75L/gMG0ybZg=; b=rj5knEW21HolMs
	oWq6YvVIxwXpfPECbwZCSn0ZROOqN4bYMp/25gApY7MT2YkLdVvldu8AHl9vRezqL6xjl5WyOSnhW
	6dctqcGneu5Hq5C81DyocxnvMgcBvQCEqjSnBjmsro/GHcvipLW1PXLwO+DpY6x21M9z6yH4gmikh
	KiJwjrsVuwjW5Bxjt0mChRTCnY8lz8HOHAEzWAStM1zjTCY7/Afl6aOPnXJqtUcT4Nlp7zciiyNwK
	cJLAVcGxmedl+c+kz5pD+TA06CGJTxPdkDOfxUxesfTvYDlwGSkdV6HIW+iPIGxqgH+pWTNDAoTyq
	Oj+VXTx+e2rdrzN6tnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2es-00000001OnU-3BUR;
	Wed, 13 May 2026 06:01:26 +0000
Received: from mail-m12871.netease.com ([103.209.128.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2eo-00000001Omh-2L2P
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 06:01:24 +0000
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e3542995;
	Wed, 13 May 2026 14:01:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for OrangePi R2S
Date: Wed, 13 May 2026 14:00:30 +0800
Message-Id: <20260513060030.616473-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511070718-GKC3624147@kernel.org>
References: <20260511070718-GKC3624147@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9e1fecbaa003a2kunm76fdac8128a16
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRpKVk8ZHR1NTUJOTB0YTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_230122_803091_C2427B9F 
X-CRM114-Status: UNSURE (   6.05  )
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

Hi,

> please check my comment below, I think this patch has similar issue
>
> https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/

I don't think this is an issue. Otherwise, these commits need to be fixed:
https://github.com/torvalds/linux/commit/1df07a40453fd652132051419140950d47941fe9
https://github.com/torvalds/linux/commit/ae9d03f8aec76c1bff21083b67c211238d7c57b1

Let's confirm the current DT preferred:

- regulator-fixed

  nodename: Preferred name is 'regulator-[0-9]v[0-9]'

  gpio/gpios: Preferred 'gpios'
  https://github.com/torvalds/linux/commit/12df2c182ccb850988d2680a422211a812fb5cb2

There is no specification or preference stating that regulators without
software or GPIO control should be removed.

This has been discussed many times, and people are used to describing DT
according to the schematic:
https://lore.kernel.org/all/44ba02e34d7bf6a6657894802a87b690@manjaro.org/

Therefore, if you consider these regulators unacceptable, we should remove
them from other dts in spacemit, or allow such changes.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
