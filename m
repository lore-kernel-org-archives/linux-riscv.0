Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A19C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tK+SsbJwhtyF7eQhT20rKdhRewlh/mkmHDt3z/G+N7E=; b=QbAFDg5bz1al14
	W9dIuo50zIYG4opxDJeK9Qz3yxBDwcTwl6b2JHkVDY99CK/abfMfg7YqiocFseRnQ9b7q7oTwUYgt
	Q3ThmIuTo05dlMMNYpRlYB6eSZh5/uFcUSAN3yLvQnPJhs4I5BRqau2VUtLPhZ5ZCBTwmuGAZqVGm
	8HeODVD4LDJxBI/8b0dyBbBFPMODdY3bqtIFK5/LJQ3gzitCUDO7Y5r/JuwI81CdlkhrpKSNvIy8Z
	TMYO4cMBN+RJjbbRKDZ17pE73R4zT3lw40wrCARlP1rg4zb2jyGvqhEvJdqlqH2jOliRr6rJsgQTa
	YN6PWUmtqEyVn7FJqKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbTkr-00GOxa-6o; Mon, 04 Apr 2022 20:56:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbTko-00GOwe-90
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 20:56:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id dr20so22418539ejc.6
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bVlKvULZm2JgZ5AGytzLrLB0CSLrK0ggDRTo65+yxyA=;
 b=ku1Mni2YP6skEb4UzKwM1qgc933zwKLIlMM21YZAd7k4Ios0mzpOc/rIaiQVjhFQSY
 G+txssoqd3A6QKy5AZVACJTlGPSO1le+tQYos/vc/E2PB8bCCueGVPQ5Scvt5bZZ0s2f
 I52BoNzvPo67Aqv6eXqqyFzU1vQDqrs2VWVcVapC6o/pGzwkb1H3txizNNHwVD4d6ScG
 2eIDS0ScxBnD2FZzrF1d1lKbTPDJ8/l3KKd8gewI19+L9UviMfXxa0WaQTj9+PHYcB7I
 7cJb+/UH9X0jvg07Ut3LmEkLNSOS7IFE/S9dHP7d26coaZhJq40PwzaU1UKeGEFNTonV
 YiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bVlKvULZm2JgZ5AGytzLrLB0CSLrK0ggDRTo65+yxyA=;
 b=d4T8n9wmOvxdyCPFK98Wu3uK1EFUX0br59QFgFpwohqm64UuXJcFfXaWs+S1e0j4hu
 69ZU/9swxdL67Bi7Y7YvHaVMa9ND62Catxaz1Tqxc0ohInBnG3BkiGDb03xovmvc8Ckw
 RDzSxwVggPJLVcSeXb8HiD9v9Q6XT5MVOUmNRmDLeCDLFDVwk1vS2GktdhAKRbjHMqFY
 3dy9pxh4ZwFZsJwKom/kDxGimm7w+suY6PEp6ltnyv0brqQDujGXNUt0RbmEdXRejSkM
 teyOrv0H3C2roOxN4GjKXodHzGGjqZVmepgX+oFUXufOCioyT+ItalBGpVpTAAjHQ5/G
 ZMIA==
X-Gm-Message-State: AOAM531Hv5CfZtz4O0TLd3yMBC0PDKoMiu3mcO0+ytxrikLzuXML9E00
 Wb/Zkb1kq9yVThulUYHYiqUd+MyfLKWmLF0+Q+o=
X-Google-Smtp-Source: ABdhPJxR6ykDRFXeBPhlCfq09GQEDxUi37N3Qk4mgFJMv7QLL7sMtSVvzSM8nSllVj9W6nUE0impfg7PMyukPyB4+IQ=
X-Received: by 2002:a17:906:f75a:b0:6e6:e3f1:c946 with SMTP id
 jp26-20020a170906f75a00b006e6e3f1c946mr67964ejb.676.1649105807881; Mon, 04
 Apr 2022 13:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
 <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
 <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
In-Reply-To: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 4 Apr 2022 13:56:36 -0700
Message-ID: <CAMo8BfJ5oqq3DXGf31uy8ab01EXqfzsO8hA2Tia=F1fBGiznKw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_135650_377873_E99F2323 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, Apr 4, 2022 at 12:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
> Let me know if I need to enable additional options to get a compiler
> that works for all xtensa targets. Usually the --enable-targets=all
> is meant to be sufficient.

This is not possible with the current design of the xtensa toolchain port.
There's an effort to make switching between the core configurations easy
(without the whole toolchain rebuild:
 https://github.com/jcmvbkbc/xtensa-dynconfig
 https://github.com/jcmvbkbc/gcc-xtensa/tree/xtensa-dynconfig
 https://github.com/jcmvbkbc/binutils-gdb-xtensa/tree/xtensa-plugin-env ),
but it still involves building plugins for the parts of the toolchain
for each new xtensa core.

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
