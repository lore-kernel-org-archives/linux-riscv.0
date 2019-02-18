Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903DDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 22:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D07B218AD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 22:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mpho53jJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D07B218AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrkIZO2jQDxI+cyTLnyTRPD+RtGDnDZ5eJ7626wV3cc=; b=Mpho53jJ1PF9jY
	AvHLJ33mpuVw7NjAwjs6pepZ4guaIbwwnsOMhBSXBq5TncDXPUnQ8KiBf4+yB7a63n8AayW29Tg7T
	+Zf1YQT4jfIAbwPKStuwrwIVbWJ1o6jpcRGgL8c643m8CAXEIU0UuUhzJ3kAFJqv2UgqiQiE6f1Pe
	SmRzRZbIrinLE/bl8joRbrUhP8qtETzyVmQgZoHoV7ZMkxh+NztVQTx1Tmc0jOUFXbMGAtV/vfhMD
	dPO59UiVbyOfY8JHhfJEl70MGfEa0FxHc8I63LiD6kVnuIeBgotSCNUfm7Jg5jGq33v7pk/SbkFcz
	hSDGsooVvtB8h97DU8ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvrad-0005m2-Uq; Mon, 18 Feb 2019 22:40:43 +0000
Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvrab-0005lF-0F; Mon, 18 Feb 2019 22:40:42 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-MBX-03.mgc.mentorg.com)
 by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
 id 1gvraO-00041R-DK from joseph_myers@mentor.com ;
 Mon, 18 Feb 2019 14:40:28 -0800
Received: from digraph.polyomino.org.uk (137.202.0.90) by
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 18 Feb 2019 22:40:25 +0000
Received: from jsm28 (helo=localhost)
 by digraph.polyomino.org.uk with local-esmtp (Exim 4.90_1)
 (envelope-from <joseph@codesourcery.com>)
 id 1gvraK-0000is-Ij; Mon, 18 Feb 2019 22:40:24 +0000
Date: Mon, 18 Feb 2019 22:40:24 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] csky: Use latest system call ABI
In-Reply-To: <20190218210712.3503891-8-arnd@arndb.de>
Message-ID: <alpine.DEB.2.21.1902182239510.480@digraph.polyomino.org.uk>
References: <20190218210712.3503891-1-arnd@arndb.de>
 <20190218210712.3503891-8-arnd@arndb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_144041_073852_99A4EE49 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: linux-arch@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 yury.norov@gmail.com, y2038@lists.linaro.org, linux-api@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vineet Gupta <vgupta@synopsys.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 linux-hexagon@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Feb 2019, Arnd Bergmann wrote:

> We don't yet have an upstream glibc port for csky, so there is no user

We do.  It's in 2.29.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
