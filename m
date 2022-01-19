Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B17C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 10:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNSTgV/fgjqb+b9XRIhtseSXGUXl6nYfPc7ectJL2+s=; b=VsdQD4tuc9WJS0
	TR9tCO1/gRJWkQeqVqvhpmZF9gwjXKHIBVN/G3FM3oDPh4lk3WoTQDzw21HRe7FfpR2+2pWzJjKUR
	wxwL1pqiMrH+DAptqBtMRzXwA34M+0zjG569dayeWB5LmjiQDle4wD6Asz27L72PX6iouftKCwUTc
	YgmQQpaofKiSldez5VNSj0NAXXiB9oF8wqZmyxjYZj/uE9Is7fXP5OD6av4Wu1pYC9M58i2f7xMDn
	pOMq3GQJ5u4Sgi7xWYKvvvMXlZn0O+olLEhSlwFrZvpR1t5dDkJ/hSK/TiQ+1BNqhDyPayw+l0L03
	mgiNNcpzZoN+kwYSskgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8fQ-0052ut-97; Wed, 19 Jan 2022 10:58:16 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8fN-0052rl-QT
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 10:58:15 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jf2g14qkYz1qy4C;
 Wed, 19 Jan 2022 11:58:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jf2g13zWDz1qqkD;
 Wed, 19 Jan 2022 11:58:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ePKFid0XyVGn; Wed, 19 Jan 2022 11:58:04 +0100 (CET)
X-Auth-Info: AdjUvmT+OC81O3UubJny8e2iCqI6sZo2X0NIh+ATrNdwGl8yDZySOQSZeJosN02s
Received: from igel.home (ppp-46-244-165-91.dynamic.mnet-online.de
 [46.244.165.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Jan 2022 11:58:04 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 24EE62C36ED; Wed, 19 Jan 2022 11:58:04 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Changbin Du <changbin.du@gmail.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com>
X-Yow: My DIGITAL WATCH has an automatic SNOOZE FEATURE!!
Date: Wed, 19 Jan 2022 11:58:04 +0100
In-Reply-To: <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com> (Jessica
 Clarke's message of "Mon, 17 Jan 2022 17:33:40 +0000")
Message-ID: <87v8yg6lhf.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_025814_053333_DE70DF38 
X-CRM114-Status: UNSURE (   9.97  )
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

On Jan 17 2022, Jessica Clarke wrote:

> Yes, this is a bug, that is always wrong. LLVM gets this right.

Is that an ABI requirement?  In case of a leaf function, gcc saves the
caller's frame pointer in the first slot, not the second (it doesn't
save the return address).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
