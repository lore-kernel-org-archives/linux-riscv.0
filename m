Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5FCC07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 08:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C022081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 08:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeVbC3eJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C022081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlPicrLYFuzEWLQ8IFqLYh9okIGQl0FeXXy+KG5pBVE=; b=qeVbC3eJZX1u1t
	g6szHYYzfp/shT7gZv3i+ns96ibjC1ghZWXHA61JaZ7IspORy3errZLH9V3IKX5kNX20eMFKhnjED
	clJweQDx6y6M9HlaLC2PjJEwzmEimKLUllHemcIo3PoDMbPoB5DC4LXAR6BuyIfghqW1dadiw5EEZ
	ar/BiJif1KSgztx+R86L9MjWsK6FpoGPT/4X6QH/M8WNIKFMsX/zxW2CUUy/VIPctxSTWNc5ANvMu
	25qPJys+iRdo8e4TflhFMv7UJW6dbtXwh3vM0JUKjK3mIQqGrt5r0N+G5JCn7z+X4YKPBcaKS3Xah
	jgbBKb3d/4XvHsh3Bh0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWdVZ-0007Ua-V7; Tue, 11 Dec 2018 08:35:13 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWdVW-0006FH-9u
 for linux-riscv@lists.infradead.org; Tue, 11 Dec 2018 08:35:12 +0000
Received: (qmail 19064 invoked by uid 1019); 11 Dec 2018 08:34:57 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 11 Dec 2018 08:34:57 -0000
Date: Tue, 11 Dec 2018 08:34:57 +0000 (UTC)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: BUG: Bad page map
In-Reply-To: <mvmd0q9bhob.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.999.1812110833360.19013@utopia.booyaka.com>
References: <mvmd0q9bhob.fsf@suse.de>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_003510_420975_DE425455 
X-CRM114-Status: UNSURE (   4.58  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Andreas 

On Mon, 10 Dec 2018, Andreas Schwab wrote:

> This looks like a serious bug, especially without any swap defined.
> 
> swap_info_get: Bad swap file entry 4000000000ec9611
> BUG: Bad page map in process struct-ret-3.ex  pte:764b08c0 pmd:6e2fac01
> addr:00000000aa2a0c10 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffe4
> file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
> CPU: 2 PID: 13693 Comm: struct-ret-3.ex Not tainted 4.20.0-rc5-00011-g3b8e7421e0 #44

Can you give us some guidance on how to reproduce this?  Was this on 
hardware or software (QEMU)?  Could you post the kernel tree that you were 
using?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
