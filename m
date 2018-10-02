Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56D6C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3914D20652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkc0P8+1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HwajNG20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3914D20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QyVfyECw3aAK7EibnPE4MEEzjWcdMj4T3k/o0s5IAUs=; b=pkc0P8+1AToidT
	2FDblS0LbNX0OXyS1SKhcBsYh2QluVl+4ZXYXMZsP0Od3jsakWSmKEE6uXsXteiUw8VWtEatfgMqE
	jVPZscTwxsNaSCJbZ7COD5usEp8bgXoGyLt0Lo1Tv/Fff65PF8lLI1DqXoFJit7vR27R0wIvKqjUF
	1PaIkfsWufzUbrnP+DLh5qNzLdEGY4Qgn0b950i9hiIfy0eoWn+GmJIOMA9/E4KlygUFmkyczs53C
	zedgLfdqKRMpkUq6Ofuh/YNppg/mNP3zG80rSnVJFEdZsGrUKUlccjOCcjtWfoZ06iiL/95nExHJu
	QCE45NbQKVZvxqQO4N1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7QlE-0003zX-83; Tue, 02 Oct 2018 19:55:12 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Ql9-0003So-D7
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:55:09 +0000
Received: by mail-pl1-x644.google.com with SMTP id c8-v6so2252006plo.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=kWKEk2GQeNeC03T6CWNduYdT1trS0Z7OPzf0PsUC8to=;
 b=HwajNG20Nd2A7v4NYmYBNHEM9trF92nBuB0nKYYR5tITx93GeLU5eZn1LCGhPO6xxq
 DWl4Nrirvov4ui8BiXcvf+8XZIxfaYJkhiE5/z/mDKJE2jWdTk2W0BsX9m5kg3rYOUZV
 T7sMCxhpTuBotRzMUnI7qSS40IZ7xjCoSA52GGqzb2JzsTVGmBjHj0U5ImLS3zWQv+68
 +Vogi10AWulC+QFXtWEK49w9aaZLWsimtDcOEjiZR9Wt8ZXedQo+7CNu9xyynC6/J0nI
 WN5sMj0eSt7rTiuP2RX5oYnXDAigp6+IeQo9fQ6bp4TbLGPGl9UbKwIrQX89fxewpC0k
 PJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=kWKEk2GQeNeC03T6CWNduYdT1trS0Z7OPzf0PsUC8to=;
 b=kwLlDpnbNpvtllvCT7Pq3KqQ80Smavqfhinf1XYUM6NIYtwaRRAe7lrgw0JFFBL7X/
 F+IzjCqRcJZmlPTBSxFPu2uNxYMSjjST7CjOktCnzxcON1bWF2pJJ39cTYLUBKK7nlpy
 ys3gEZ2PfVq0fxXxbtsASw6UJWLelIhaoqx+b79LvJcmjf1+MBKBGRLVp0WePSf0VbYX
 1R2yb4zSmaQZ98Q0lERwMJ1oBQepWYu3A/2y8QT29GpA/h0sgspi620OWI96HZA8Wm+u
 Cdz06QkhQNbEMBdG/MiQ+m2NvY4Vgs+2GshdVErcC8GkiZH7SklRhqRYXfNSUWzfubDg
 pgpw==
X-Gm-Message-State: ABuFfoj0Y6qkSi5GEnNVSjzYU9vqxbt2UBoMUButSjUpUc91hiv+jEsa
 NDxDhZgBbuVzLH0prjcwJCJIOJgh9LQ=
X-Google-Smtp-Source: ACcGV620YJ89hp29fdGcIkjK/hBRvVYUWEoIa/bUjcsbVPHPkURfqjj52qJT0sYxBz0HKSJ9dH9CeQ==
X-Received: by 2002:a17:902:a5cc:: with SMTP id
 t12-v6mr18528346plq.229.1538510093433; 
 Tue, 02 Oct 2018 12:54:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e7-v6sm29668250pfk.3.2018.10.02.12.54.52
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 12:54:52 -0700 (PDT)
Date: Tue, 02 Oct 2018 12:54:52 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 12:54:48 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Fix for 4.19-rc7
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-02593196-13c6-4467-aeeb-bfb9aafbb326@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_125507_492658_D5D1A2DC 
X-CRM114-Status: GOOD (  10.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002195452.h8dG8lbiKhJ9NgpVIajOdD8YKTdzTeOxV6t5SCwi5UU@z>

The following changes since commit 17b57b1883c1285f3d0dc2266e8f79286a7bef38:

  Linux 4.19-rc6 (2018-09-30 07:15:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc7

for you to fetch changes up to ef1f2258748b675422ca0107e5bfb9ceeac675de:

  RISCV: Fix end PFN for low memory (2018-10-02 12:50:01 -0700)

----------------------------------------------------------------
A Single RISC-V Fix for 4.19-rc7

This tag contains a single patch that managed to get lost in the
shuffle, which explains why it's so late.  This single line has been
floating around in various patch sets for months, and fixes our DMA32
region.

----------------------------------------------------------------
Atish Patra (1):
      RISCV: Fix end PFN for low memory

 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
