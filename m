Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3248C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 16:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 777362087D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 16:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FdFyep9k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G8prSht3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jNh8hNK4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 777362087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QyVfyECw3aAK7EibnPE4MEEzjWcdMj4T3k/o0s5IAUs=; b=FdFyep9kYXcLKO
	zeIULW7WxHuh8vr/l3JL4NJEpq0eIIJ94k2zf8rUURoKbxPjpPSllcI4aVTvMM2gJbJdu8VccN0Bu
	y+MDag+fyQvOFf8ssrAJH1NUQwIvKfvmvk4ALmMhqIVxte0SpbyXU0qEY8mxzDtWYb0HzQVd9jAqR
	So9ZIi8AiTkCYIzBXEw77CrwPg7WKEzDPs5mHwNMnBCpyK6gEeXyKFBqalfEMfW2A9WjlQM3iGIvo
	HVCdK30bo4DgMvHfOyuTIt0dkazwLXFzduKfET3KMie7bpoSGycG2Ec69qhBt6SNvezLAcQmw8BFS
	uxC1JP+J3RxEli8OUOew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g86EK-0008SZ-40; Thu, 04 Oct 2018 16:12:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g86BQ-0005mR-OP
 for linux-riscv@bombadil.infradead.org; Thu, 04 Oct 2018 16:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:To:From:CC:Subject:Date:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kWKEk2GQeNeC03T6CWNduYdT1trS0Z7OPzf0PsUC8to=; b=G8prSht30u0OmmHIvwcGpP/sq
 9+25MuD0tZUWnMJQFwlRcvKuUjPyP5mUIyMsnr5YZPoO0w/AZtGyiaz8VVI8nmXAIEIXx9SaL95cL
 ot3x5aON4RqSdwtlDXtrJobqcG+QLcunp7bA6QxMQHjCUrnFb3YfoDD+U1KTYZyjvCIpxAmii4Ooo
 6A8/hQcbIS2wUDkF62NG+HaMDctaCZ+a8mcEmhD/j0jfJOlRmNr1eaDA60JFIjA/kSc1I9fewqmdl
 Sl13ka4ldF4HFlxI66hbzQ9dIEMl1nsPxmUtoAdqXugwUfTtKG4b+6k30xP/Y5i96KC3bvdTxPb5A
 5SQkvpx1Q==;
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g85jr-00068s-Ie
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 15:40:34 +0000
Received: by mail-pl1-x642.google.com with SMTP id 30-v6so5376682plb.10
 for <linux-riscv@lists.infradead.org>; Thu, 04 Oct 2018 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=kWKEk2GQeNeC03T6CWNduYdT1trS0Z7OPzf0PsUC8to=;
 b=jNh8hNK4tlMKjJ+e1loUBKe4+O6+mPGRFvycYAD5IyM6iu1MVjkdkxKAkF8yDpKInw
 QlQT/CipmUueH8Gz/lyNPImkhIeYhYjUEtonjWj/GPcUSlnDPCrWk80C/w+LDm65seRB
 YRS1ZLmNR5C6WkMi1LYJv9fOwaVVBIPft86ZFxatg4W+1uQyzcxxOZlJ3eKpjLLLRJWf
 6+2ZMSOHaMHPmTZw0+aHfqdsgDEG2D+g1O3lZqpLA2Ml3SU4Hm2FkQUonXu0fo7efLmT
 65aQW+Mc9FVMjv5vCZGSIIqzoaNAdPMgdTBlX/aV9XSpUtpdW8VBEUNJy6y6jGkxIxFF
 IKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=kWKEk2GQeNeC03T6CWNduYdT1trS0Z7OPzf0PsUC8to=;
 b=J1fJ8Z/S4hF+KC9dUqfy49h7dCXcuZkvAAmrMM9BZn+OuCvORyOa8XL2aKzERNEP8b
 7+UNsmQ5mUTCjv/4PmA+5KrHNmg3ujx0JnbfnxDINH485JOR6gGAjdcSfy0ngC946v8G
 5+uoFkYNE0zlGZIvazgWFTN4mRNt6oITuaT3gtrlbjF9xcSHSvL5DlCLIrhrkRIVZ2EF
 uV3juJQSOTb5i9Ftvmen4fPN+/l4fummzExN0XH3+LZpYFBM1YmFsFJjIjcVEoSBL3dV
 LCZHxL3RbRy83zYnlHC0/KMolmYKzkF2CDVWspMFFU4hcFKztbRsLYxPs1p0+QzUr1x6
 aKFA==
X-Gm-Message-State: ABuFfoiW0MfRMBETHphrwVtq+O3w9efFnVmjA0QLxCMBaljreivFHU54
 DzY9M0z5tAMoq9ymAEWsWO4FD5aCFUs=
X-Google-Smtp-Source: ACcGV619gqdQZb3S7xorCWlbocKJFDrmpgASNDD+9NdGaQd/uvU5gPVW2sT/1Lqy8C4lyKC7rSdRAw==
X-Received: by 2002:a17:902:b109:: with SMTP id
 q9-v6mr7217885plr.83.1538667619228; 
 Thu, 04 Oct 2018 08:40:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b29-v6sm9504228pfj.183.2018.10.04.08.40.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Oct 2018 08:40:18 -0700 (PDT)
Date: Thu, 04 Oct 2018 08:40:18 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Oct 2018 08:40:13 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Fix for 4.19-rc7
From: Palmer Dabbelt <palmer@sifive.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-cfdf26dd-f145-40fa-b698-efb9b65de276@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_164031_616453_B886C7C2 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004154018.FBcgwsn2S7pml-KdFGF6YRQefTGAQW5FbvK1VkUwtKI@z>

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
