Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEE7C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sPVFvhUjBVZF0spuf1DvTz6oJu56C85dYzPZ8vqWhg=; b=QY2jPmMgu4pvm2
	B3KdWFNI/wdkBtvs8mKs4cfXkeKRRg6ZhKc7eHxdMTNM6jZULtPYTyeRNQyv6Z5UvNOBSBkRe/ycU
	57BLTnAkbzQKLoYp+a8dXDlax2gKvH8RY5hUCB+LJpV2+gatLNHVhELdnTKZXM8pYzSsEshEjoXJk
	az2cvMsZb50lad2anpsZPe+YK9jWGrjX2IOLFkrrs3RPAReP8Vd6DLQtEZo8/Zx2TFaqrbu9kq2J5
	66fU3fa8/xWwj8SA7Mwk/gt+buWfG348CWjOkf6GSEnRu/gy3+bc/sv9lHtU90DiXCHIypReYHePa
	agsx1F604J1f/naRmHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RO5-001Kpa-3A;
	Fri, 26 May 2023 06:57:21 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RO2-001Kmf-1w
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 06:57:20 +0000
Date: Fri, 26 May 2023 08:57:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685084228; bh=svHIYYsnUTreXuvX8V5j3gYUDNQ2Qs7ua4MdAIMR+mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUxyoogygvgs87cTjQvR6A7rvVBHtM0GxBqXbkuy2fa+dKd8zPRrhAGUbyeMzZGe/
	 So2e2OkGQJexcrinFdfjO4ngF0eba/peYRfnksaujydQhYl3ON+JYjfKe0wiLOwxqG
	 iUneCQgPT/JO7dRY+dhnAuPl2uZtI7JKgr6j1E7E=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 05/13] selftests/nolibc: riscv: customize makefile for
 rv32
Message-ID: <4a3b1cdf-91d5-4668-925e-21f8f5c64a92@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <7adb27a7c56dd06d782710a5f684ea6263900f98.1684949268.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7adb27a7c56dd06d782710a5f684ea6263900f98.1684949268.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_235718_814517_0D28122B 
X-CRM114-Status: UNSURE (   6.14  )
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

On 2023-05-25 01:50:57+0800, Zhangjin Wu wrote:
> both riscv64 and riscv32 have the same ARCH value, it is riscv, the
> default defconfig enables 64bit, to support riscv32, let's allow pass
> "ARCH=riscv32" or "ARCH=riscv CONFIG_32BIT=1" to customize riscv32
> setting.

What's the advantage of doing CONFIG_32BIT? For i386/x86_64, arm/arm64
it's not necessary either.
(Let's ignore the "x86" case)

If for riscv the "normal" version is riscv64 then adding a new "riscv32" that
works the same as the other architectures seems nicer and easier.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
