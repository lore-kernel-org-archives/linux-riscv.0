Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D59C531D0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 02:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfMfo8ZIJpSjHsTQTwzjmoddoMG/ob2mgN1UEdEo1Jc=; b=sdkZi0EyTLEFkZ
	F1WGhgL/PWgFB/1jaQ2haxeMpmvxVEnV1/47UVIhzvxm1+AxEsInjCF8n6W+JLaaw/Z+mewLJuKYr
	3iYTieMTZxBI7itozlpQFi+TxsqcwjbQFkn2wFNtUQWWlGYo2T+HISXxgG+/lbQsiOFthAiELsWWC
	ez3HNPzsuT6ioDh0hRgkXKIP0JSdUuNb6RRqjnzrb/lgRr1/T3BF7CJ29qawKkd2NNr+w3fJSWBzF
	/z70WXkcwioTKS66aHomR5DPM8QGH4KifDdiYjzQBuRyrOoFaFg0eLW1RryN8rirarTL8tDIg0XDH
	KnJU1hCj9i9QBwtI0g/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5ae-0000000FO8Y-3npc;
	Fri, 24 Jul 2026 02:24:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5ae-0000000FO8J-0sFk
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 02:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Date:
	Message-ID:References:In-Reply-To:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NxucgfmUZTTQksm+oT0kkIAMiRNz/Lw+gJQy4Q1nerQ=; b=UeJZdmlET/JJA+qN2RSCiP5/98
	HnYxqMf1n+5KXWogj8yfoOXc/iy5ZHBXQax6RauUpvCLMcv4zqooamKSf5rd8AhT38/SRo8C2MmSp
	Yas2gR/YH+ZqqHXMd3NpSsOdZsvM56NO0IGbC3DLii7yVWq9f9zi3/wFb8pYLPVCsjYoiiKToPqKI
	yAqwcD5zNsQCvfkKsguKzsf7g8iUakw6ZonQ/WUu8NSc4gPyoepAYAvCBOfWYmAAxUAiI71zToSLL
	uosziPJ/ZpHPNamb1QQr16/g5yBXzyzuxBod+Vihxvm/0iXQWjzQqLJaTUE8OGH9+lOxiL7gOl2aa
	k3NHToog==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5aa-00000002RgC-0kk3
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 02:24:43 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66O2NhNeA920495, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784859823; bh=NxucgfmUZTTQksm+oT0kkIAMiRNz/Lw+gJQy4Q1nerQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=ZjyF9+GG3k2dFJttsAYKW2+RcQKhh0TaSCg/z7srQHpWLaia3zLsaHeYPlHO9TJVp
	 Gq2p6AikuHRGA6G/uBELsEcAh88XBWbNy28OoVXDYC47psBYN+Nq8DkR7w/6InF5yA
	 ogC+ZVcV7Dd5cw7NCHAOWW2jZWbTT3l2me8brdLzVCrZLe4ix0ttLIxt/bN3JcNqIB
	 bZ4xG6aBiIs853U/QE0W2J6TfJgP8M2LZ9Wf14Xl27olkNT8ZshgkCcAL/98eMXob3
	 CdIRDLC57mYNotlcLVjdS/Ui7Zrrbq1eGtYBi/d9GfiuHajNRwuEpVGuqSihBrnVzj
	 +6qNFBuPZYIxQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66O2NhNeA920495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jul 2026 10:23:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 24 Jul 2026 10:23:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 24 Jul 2026 10:23:41 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Jul 2026 10:23:36 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, Ping-Ke Shih
	<pkshih@realtek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy?= =?utf-8?q?=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
	<linux-wireless@vger.kernel.org>, Anirudh Srinivasan
	<asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to linux/pci_ids.h
In-Reply-To: <20260716-rtw89-spacemit-k3-v2-1-392b577ebf75@oss.tenstorrent.com>
References: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com> <20260716-rtw89-spacemit-k3-v2-1-392b577ebf75@oss.tenstorrent.com>
Message-ID: <9659279d-224e-4029-bdc0-d7bfa627c016@RTKEXHMBS06.realtek.com.tw>
Date: Fri, 24 Jul 2026 10:23:36 +0800
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032440_529164_6E4BCE64 
X-CRM114-Status: UNSURE (   7.56  )
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

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:

> Move the vendor and device ID for the existing Spacemit K1 PCIe Root
> Complex to include/linux/pci_ids.h. Also add K3's Root Complex device ID
> to this header. This is done so that these values can be referenced in
> the rtw89 driver to enable 36-bit DMA ability in it for WiFi to function
> on the K3 Pico ITX board.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

2 patch(es) applied to rtw-next branch of rtw.git, thanks.

888b1934642b PCI: Move Spacemit vendor and device IDs to linux/pci_ids.h
27a5046cc56e wifi: rtw89: pci: enable 36-bit DMA on spacemit K3

---
https://github.com/pkshih/rtw.git


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
