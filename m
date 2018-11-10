Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D13C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 09:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FE020883
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 09:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMAbEkee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FE020883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOWi9MT2w9O02tYJzCfLWlO8gDIGGF0s1hHmGMsinPM=; b=YMAbEkeeBZuZ7s
	H/RqTz278SZWCs7TcmNIhCqGlT59fARQrF8029vHNGExB3Oqo94KL759urMCMez6dCCLJCvU3xrvR
	VglPTW2KG4c9oKmtCSdbFwyz9QAXBs+86GeY//K6GGs1Y4k0ZmE7rkI+GXt8aADv7wi9/8ieef0Lr
	H9r4c7QnDsfzfTA0AlH5fRU+twmWDPDhyVZHdlO8c9OCFc4DTYH6SFvan1H/3jCGmqoqfovLhuENX
	VmLfTwBkcAV1IVpGPvlp2qvn9kVS+Ht8UpArseukTK9yDP68U0BGuumbDT3SNOdxMO0vcnxj2l55f
	xyINcgzjpfFmSGzOTyhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLPYd-0007BN-7n; Sat, 10 Nov 2018 09:27:59 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLPYZ-0007Ar-1w
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 09:27:56 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 42sWrq2fPcz1rFDL;
 Sat, 10 Nov 2018 10:27:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 42sWrq1DDxz1qqkp;
 Sat, 10 Nov 2018 10:27:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EyLIgyuXSaAx; Sat, 10 Nov 2018 10:27:38 +0100 (CET)
X-Auth-Info: fKt/te7k6DgIZCBURoNTRPzVKbtVtwZ1zl+kGJttNrarnqVy6MPWfiakUGS8krlZ
Received: from linux.local (ppp-188-174-147-181.dynamic.mnet-online.de
 [188.174.147.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 10 Nov 2018 10:27:38 +0100 (CET)
Received: by linux.local (Postfix, from userid 501)
 id 58B1E1E586D; Sat, 10 Nov 2018 10:27:36 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
 <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
 <20181109222839.GB2054@altlinux.org>
X-Yow: That's a decision that can only be made between you & SY SPERLING!!
Date: Sat, 10 Nov 2018 10:27:36 +0100
In-Reply-To: <20181109222839.GB2054@altlinux.org> (Dmitry V. Levin's message
 of "Sat, 10 Nov 2018 01:28:39 +0300")
Message-ID: <m28t21jn93.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_012755_244459_82D29EEF 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: aou@eecs.berkeley.edu, Paul Moore <paul@paul-moore.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, Elvira Khabirova <lineprinter@altlinux.org>,
 Andy Lutomirski <luto@kernel.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110092736.c1XklPN5-fNW_cuTXBS7uuv3LOWQo4r5S0ZoK__NO0A@z>

On Nov 10 2018, "Dmitry V. Levin" <ldv@altlinux.org> wrote:

> P.S. It would be great if you replied to me as well.

You are explicitly forbidding that.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
