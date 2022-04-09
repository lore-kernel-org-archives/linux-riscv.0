Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79710C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 00:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KAJhcYw23//+UA/CYPnNhOiA5hrZC1xsF0o+pb4CWI=; b=QEJ2JXcLxGmMCC
	OIkPWnGbEcozYR6TZmhK44juuBP3xG67owRfFrremgR747mLgRqEBA1RAbo5+UNO6+I0eo+QLamRY
	bajEdIvRwGKSxqpf79SCZ8XqrWsxj7K1beOixoFyngDkOcnKv1AQMelha7wAIi3HsAaCDoXLBELo/
	ny4hBPFGl6dPx26GFf2U6khkCBFBROCW2ljFpx3XSaXp+G31/BfAChfONgt3aYAReO9OuCyzFeT95
	AwL6APX2yCphwA9OQOGpJGyriS+uaKqtnlG1iNRKpX+aLOcrTmO9iSZBxUP7Zym5bTR4dasbnOW3h
	LlpmU5yS0p+Z8XNTHHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncypv-001ZPL-PG; Sat, 09 Apr 2022 00:20:19 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncyps-001ZNh-7t
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 00:20:18 +0000
Received: by mail-oi1-x22e.google.com with SMTP id q129so10458829oif.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 17:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kku2i+uKWNnFd73jChiOeIEKCfjIgc7cEViNkZfQ8l0=;
 b=MvmX4LKI4DyQDgAaqj6D5BFwEshu/LnG+BxDPDDz7Qeqpx5yulnQb0cgGdCjkR9q36
 VpaPcgCUj3yaOiquaSfgEX4IdXJwB8lNNAtJixiKalOPG8IS2v7x1kbXjIxsFVr+IpDH
 2Mk4wxROIpeQzkoWtnHQzZd/qwCsaaE2lOuS+0lsC0gpWLI8Tv/e6/QWMrf74Q0KZ1jC
 3QlmXnTkrUpepdAe0RQZHwbtqfSsFVN6YNfuTxXtvuiHZ61SuiyOHGYBcG4eoXYJXOCQ
 sATmsP+kQl2mRatJE+nSXCnEagEoc6G6ci0p1uOhU3T5aOwSiYys6MaO7qWhJNngpGSk
 PtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kku2i+uKWNnFd73jChiOeIEKCfjIgc7cEViNkZfQ8l0=;
 b=pr2m/eySIUQOLMX2YnA8nxhsyS6OsMeoU6qZXnCpFEFq0TDhZl1BVVrrAuav99EBLJ
 ns1b+fWhDlwX2BxVejMRz0rGVnioQmm48v6M1IXNr7aTSfJVHcuXlbeNeL15q5NB6gNi
 KMCoHMm4CVWZz77RElhipojM+JaWqvvt932/udJwgPdh/njX1POJv+wIKvzadRwYR3K7
 vxmxdF0/Iqp0vq0n6kWE1Ig7hmErxz750AVxqbBDPqOh2mm0gufiPjd2tTaPvVexU3m7
 FgQ3mvHRk7mAYUMlijWkHelVBgpAq14W90GezOCzBjBkMBOaT00AfMxkBTVkI6g8JBdQ
 fcaA==
X-Gm-Message-State: AOAM532CUcHVwO9N/7ov+2Jd5pd6nVWys/YjqRrrJni0Ggs8alo1L9p7
 I3xf1K9s7RiDwXLtTe3jDHrhZQ==
X-Google-Smtp-Source: ABdhPJzZe++rWaqfq9aV2dHyOIwxVl53YuTt+2x8aiaE6fJ5qXUhiElHKi0cEmeQsIJ8z1Fpr0L9uA==
X-Received: by 2002:a05:6808:616:b0:2ef:3773:44d5 with SMTP id
 y22-20020a056808061600b002ef377344d5mr989393oih.156.1649463613856; 
 Fri, 08 Apr 2022 17:20:13 -0700 (PDT)
Received: from [192.168.86.187] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a0568301df900b005cf87029ee8sm9164623otj.67.2022.04.08.17.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:20:12 -0700 (PDT)
Message-ID: <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
Date: Fri, 8 Apr 2022 19:24:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Greg Ungerer <gerg@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_172016_486300_C2606405 
X-CRM114-Status: GOOD (  21.93  )
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

On 4/5/22 08:07, Greg Ungerer wrote:
> Hi Daniel,
> 
> On 5/4/22 13:23, Daniel Palmer wrote:
>> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> But we could consider the Dragonball support for removal. I keep it compiling,
>>> but I don't use it and can't test that it actually works. Not sure that it
>>> has been used for a very long time now. And I didn't even realize but its
>>> serial driver (68328serial.c) was removed in 2015. No one seems too have
>>> noticed and complained.
>> 
>> I noticed this and I am working on fixing it up for a new Dragonball
>> homebrew machine.
>> I'm trying to add a 68000 machine to QEMU to make the development
>> easier because I'm currently waiting an hour or more for a kernel to
>> load over serial.
>> It might be a few months.

I've been booting Linux on qemu-system-m68k -M q800 for a couple years now? (The
CROSS=m68k target of mkroot in toybox?)

# cat /proc/cpuinfo
CPU:		68040
MMU:		68040
FPU:		68040
Clocking:	1261.9MHz
BogoMips:	841.31
Calibration:	4206592 loops

It certainly THINKS it's got m68000...

$ qemu-system-m68k -cpu ?
cfv4e
m5206
m5208
m68000
m68010
m68020
m68030
m68040
m68060
any

(I'd love to get an m68k nommu system working but never sat down and worked out
a kernel .config qemu agreed to run, plus compiler and libc. Musl added m68k
support but I dunno if that includes coldfire?)

>> It looked like 68328serial.c was removed because someone tried to
>> clean it up and it was decided that no one was using it and it was
>> best to delete it.
>> My plan was to at some point send a series to fix up the issues with
>> the Dragonball support, revert removing the serial driver and adding
>> the patch that cleaned it up.
> 
> Nice. I will leave all the 68000/68328 code alone for now then.

The q800 config uses CONFIG_SERIAL_PMACZILOG. Seems to work fine?

> Regards
> Greg

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
