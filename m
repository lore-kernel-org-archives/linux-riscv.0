Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27A8CD98CF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+jyoRrIeORlKXcgJc6/lQjmR6Tt9J69cSCBhrzGAzs=; b=fYjHpjlKIhg9mY
	Aoe3nedFDZdtfJNEvdMTis+EvhrVtumv8/ZL48T0dwHZqQD44NITMByslc+A1CbyrIZ/hdmYJmBs+
	oQ3KRvvPAY3GG80WD68ASHLp7Iw/UoAfnKp3eIIqLUvthXxXRyxM57Gx9r8msmhurJ5GfcrcGMyoC
	OmsRvGRa4lqCzbgCBgkPuEZ4m5boFHE/GOQutU+lByoym+YbhoSkhHviEIodkSPpZlT3gHJkL5Ptd
	kFibYONI2ybBzCBdSTFy9TrtblccYA/AlA+WhUUx3qs4DGWiKM2c/rvmPz4yuz91e5EOhZKkGSDn5
	jXxeiRIaIH4daBDO4BiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQ1f-0000000FW13-2qIN;
	Tue, 16 Jun 2026 09:24:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQ1c-0000000FW00-3KAk
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 09:24:06 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781601827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=klUedJpf6maPoF56W1BBX0R6kzss8gV6pnLtqqah3No=;
	b=yrZrUOE2znH7b2eJWLFrtDi5N/MNVBOmnPnWOWx+kyjhp5QiXWrBRddX6DgxRS+Dctmg1o
	fO6WIseiBJj3e66T9j1t/Vu5of2GozZN6QLbh9DAapjG7alSurjpKXtikCcUJafMtlLqvv
	JQidIlc/Tlv5ItDJKxxZKWdZxNNtwxyM0avWPdyTC3x9hG1n7qv/DtBJyjDctTCyqFaKLu
	eZKe8Dl/kvfaDKuyns34gk0lUhXjEd/jeKDOayPT3x0wBdXjvvs1p/qtCfjQ40zqYFOEik
	APySUnJfn7ml+6LtsgzG6iwYvlESm3eUA4WBl/XIOrfkMlamKXdlj0VB71SrLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781601827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=klUedJpf6maPoF56W1BBX0R6kzss8gV6pnLtqqah3No=;
	b=pulydRLMMVTemme4v4exPLgQz61MaMXtbFg82aw4rcz/+1jr08yu9qUV4Ei5qScyWJAd2T
	x8ol+CJOXbv13GDQ==
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew
 Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com,
 ganboing@gmail.com
Subject: Re: [PATCH] riscv: drop __init from
 vec_check_unaligned_access_speed_all_cpus
In-Reply-To: <CAEev2e8AH8W_M4=9N8vLJyvRqwGG=p8O-jVa7tdM3LjCRj=6aw@mail.gmail.com>
References: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
 <87ecibwiz6.fsf@yellow.woof>
 <CAEev2e8AH8W_M4=9N8vLJyvRqwGG=p8O-jVa7tdM3LjCRj=6aw@mail.gmail.com>
Date: Tue, 16 Jun 2026 11:23:46 +0200
Message-ID: <87fr2mvnx9.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_022404_981184_BE6B2E88 
X-CRM114-Status: UNSURE (   5.24  )
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

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> writes:
> I think the difference seems too small here to draw any conclusions.

So the difference is in the noises. That's good to know, thanks for
testing.

> This is only a 4 core CPU.

The probe is done in parallel, so the number of CPUs won't make any
noticeable difference.

I will send patches in this direction instead.

Thanks,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
