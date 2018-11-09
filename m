Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEF9C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 06:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50422086C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 06:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KALcx+x3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PFQ2AU1C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIR/5NCF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50422086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a3toDZPeLn2DtUoW6I8b7mkQ+mKpPdBjglieVh2bazs=; b=KALcx+x3KXYNyib3TDW0Wa63gI
	4YS9vgEJe0tTxantl9QqByVMOyLC+BnZelZyQ/1tZzX0kk4ag7aw+7zZvctBPID1k7gtt8U5Sh81H
	WA9aK/2h9wvYuFqFeSPhah+e/BhjViV6m8A34UVMpuRmzAUsCQEdjosrNsb4O4hkbTqmcokwIq2Ve
	H2zSfJS4dFKYxj8FwNsBr44YT1J9417LQb/7s3pPZOdjUcjbZTPvn5pelU/k/SQUjIiZuTcvkxEMI
	Q/CtETD8LrXuYs8EwuQUKsrgUd0DOxC8E7ovmjdBdtKv8CSHr9figJEOd+/HB/rTbeWJDtDRcPBhr
	8Oo9fcjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKzwM-0004jq-ML; Fri, 09 Nov 2018 06:06:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKzwL-0004je-0d
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 06:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:To:Subject:Message-ID:Date
 :From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=edKnIOVpTAW8cmFcOoS4kpKzGT1Q4Tuvv+ifbrrxjA4=; b=PFQ2AU1CQqC5YnZVP1FNh7Cqm
 REHI38Smayi3mavg/Rcf/HvAlysPyu9uiWcz4wbbUYX7gyCNuiyS61lFbuv6BFpvE/734tcEams9F
 SoHtSrEMvUS7yEDtBka1Q51ZDwz0fp4hkD0oOyF00+5frBjrxnDfLZTYaKGVso+wpM53GzkmI0GtN
 Iy2uLN/EA1fVx8NrarciC7w2C2vFQyOlWLBn86eSnCmcgTxq4Xy1k9b7ZQBuXrOmWWyJpUm/zhRcX
 suca6RDJ85lkcMbvs871a/cEtiLxlZy890pMfUj1uJLIa563gYDLR492COYSTBfRf94hSKaHoq8W5
 ogfHA9arQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKzwI-00025o-6A
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 06:06:43 +0000
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9999D20883
 for <linux-riscv@lists.infradead.org>; Fri,  9 Nov 2018 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541743588;
 bh=edKnIOVpTAW8cmFcOoS4kpKzGT1Q4Tuvv+ifbrrxjA4=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=ZIR/5NCFTXKcjRMOyXMbVL23J4wGuJlDtNd0ChA4+U0nrV+GRuAR0HBEDR4O6NLwR
 bVtYf3fqikwDMk+g4Fm95dWNvAGQ+69UuZPYiQv1Rxndv4uBQWwzLDD3Xtl1t4jL0R
 uRXfOl4Mf76397jP3gulinoSKI/kw6vL5x58QimU=
Received: by mail-wm1-f44.google.com with SMTP id r11-v6so879696wmb.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 22:06:28 -0800 (PST)
X-Gm-Message-State: AGRZ1gILh2I6jnhkgOP4PFs2XqzbYSd5eiw/tfSiKOSZi8aSJL8iHx9v
 QBozt1xVIm4l3QX96UNmhZOyhYt/rPSJDaywh5J18w==
X-Google-Smtp-Source: AJdET5eUxYpcAqRU2ognw4Rw01N9cbi69Hf4FS/5gLkwRHAP+iThd3XyY/m248E6gVdENwTVIuCsjN2Eut0RKORBUPo=
X-Received: by 2002:a1c:954b:: with SMTP id
 x72-v6mr3445069wmd.14.1541743585155; 
 Thu, 08 Nov 2018 22:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181109031303.GA20906@altlinux.org>
In-Reply-To: <20181109031303.GA20906@altlinux.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 8 Nov 2018 22:06:13 -0800
X-Gmail-Original-Message-ID: <CALCETrUMnBxZ=-EWf5TJY9kqMA9Sy=mtk7OyS0tHub1+DREM=w@mail.gmail.com>
Message-ID:
 <CALCETrUMnBxZ=-EWf5TJY9kqMA9Sy=mtk7OyS0tHub1+DREM=w@mail.gmail.com>
Subject: Re: [PATCH 00/13] Prepare for PTRACE_GET_SYSCALL_INFO
To: Andrew Lutomirski <luto@kernel.org>,
 Elvira Khabirova <lineprinter@altlinux.org>, aou@eecs.berkeley.edu, 
 jacquiot.aurelien@gmail.com, Chris Zankel <chris@zankel.net>, 
 Eric Paris <eparis@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 green.hu@gmail.com, lftan@altera.com, Mark Salter <msalter@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 palmer@sifive.com, Paul Moore <paul@paul-moore.com>,
 Richard Kuo <rkuo@codeaurora.org>, 
 deanbo422@gmail.com, Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-audit@redhat.com, 
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org, 
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org, 
 nios2-dev@lists.rocketboards.org, uclinux-h8-devel@lists.sourceforge.jp, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_060642_362012_46DE7245 
X-CRM114-Status: GOOD (  10.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109060613.nJk4UhG0b86rC1APjzGogkBGprHhw7JTwjDBX5SzRNk@z>

On Thu, Nov 8, 2018 at 7:13 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Nice!

I'm pretty sure you have vastly more changelog than code here :)

--Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
