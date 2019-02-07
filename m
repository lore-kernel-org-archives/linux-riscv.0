Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97DAC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 03:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F19C2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 03:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FqvT1psK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BYuBkEkf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F19C2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR0ZIGjsrbXKQmRCm2W50o0KO4jzABpf6vkVbsuI0Q8=; b=FqvT1psKVnMVqM
	Zx63pUuLqGZG+hyAK/PFbzGh7rH0jJtcdZdA4dxMNMJXkBJRKPDmr77z8kQ+HUCHwrd59a+FasSnM
	6qDVn4UX6cok4XlFSIP1xeh6I+tJ28uP2MlITLA5Y2MXNJw0htwZm0VCMIpBe8Cx86qvqix5Nw5yV
	CcF/a9z78xQtLrHdAVTojoE+Zvyl4oMyJVsoyrYaiCi7qeazd5onFFXKSjVpEHxHTEAajXDOoCEC3
	fEEu54pwZl9ZqCBUX+G0mgx2jLlxUx7gZtcGYXMHjj4pNOCtF+NSy73sL9ecHS9grgH+3ZGPTS5YC
	csH0/cPZn/oQ38pKWmtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grao4-0004zB-Aj; Thu, 07 Feb 2019 03:56:56 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grao1-0004ym-JL
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 03:56:55 +0000
Received: by mail-ed1-x542.google.com with SMTP id b17so3693604eds.2
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 19:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zKR49lpoFi/IV7fYStEPqukZrWpAG4MOYr5LOcEOfeQ=;
 b=BYuBkEkfwX/AqCKjbI0aoa1vROzHie14/NgdTRhTWR6OSNpdbYW0mpy/QU1dLVpVfP
 JPepD2N49nfRj35w5yfu5fhjBqexS9wEiLMcn9fGHP8NmgSXZkbH0ZNyN82vswwz85+W
 Ht6dw/swt6mHtVl7q6OEPdfKbErTqsr3TDVMQkkv7rNMS30vIX0p2upI9T5Zv6wy/dz1
 Q0Vs6QlLz6ZIg2HT5ZiSAjJHchWkmDQPgT6gxH0gQE+b1TUsN3tP3bpPKfCdPeZB/Xf2
 ogj0SZH8YkT/vT568E2k9ag4gjL//zCxHOraPkMIHJOHNAWXX4Mw1qGtmXLPokEwzAph
 ZbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zKR49lpoFi/IV7fYStEPqukZrWpAG4MOYr5LOcEOfeQ=;
 b=EInzDx4FaO3pOgEgXcUwVW4UA+Ol9XiIhO0/oSoU/VJOktLp6/e+m62jjX8iUUTLlS
 8SAFJZtvsjyWzT+4DPnGUuOAbFbIz5s43KkTtdmbSUtc3A51zoZfVtrJV2p4Z9D6Ak3C
 Gs6ZqSwu4qsC1dAi3sttYt6bLGsfCpTVmK+GlVu9asFeExX4XFnjDaUaZ6IUWd+Im7yy
 M2SQLL8xwdxN/NVGuSGBNQ8L2fA3E1MndYqAxnLfPlCEw4+AtJZK29lUHMF6DmfWDGjq
 Ua9RAmeKAx8ODuddvR22MlbLq+eQrm5LG46XlIv3aUNP/78NmdfkADm65RcoqB/2z0f6
 VfSg==
X-Gm-Message-State: AHQUAuaxnuiNjVoNKO3xheWJs2ZkcbA569LWVFIEdxtT6UyCxJpQJyIM
 XmRkl0Demfta8t3Or39n1uxG1w==
X-Google-Smtp-Source: AHgI3IaC2Ti1to3yQxDl0IBCHypTDFGfjfkxjTTNwWXCWoRjS/u/dWh3tEwcetsMCPljNDEmS73LnA==
X-Received: by 2002:a50:c299:: with SMTP id o25mr10966273edf.281.1549511811561; 
 Wed, 06 Feb 2019 19:56:51 -0800 (PST)
Received: from localhost (dc3829c8a.static.telenet.be. [195.130.156.138])
 by smtp.gmail.com with ESMTPSA id j4sm6459987edh.69.2019.02.06.19.56.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:56:50 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Wed, 6 Feb 2019 19:56:49 -0800 (PST)
To: ron minnich <rminnich@gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1902061914480.6518@viisi.sifive.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
 <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
 <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_195653_683649_C250940C 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 =?ISO-8859-15?Q?Lu=EDs_Marques?= <luismarques@lowrisc.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alexander Graf <agraf@suse.de>, "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 5 Feb 2019, ron minnich wrote:

> While I respect the tremendous amount of work the OpenSBI authors have
> done, I agree with Benjamin and Luis.

There are a few key points that seem to be getting lost in this 
discussion:

1. OpenSBI is a sample implementation of the SBI interface, and is not the 
SBI standard itself

2. It is optional to implement the SBI, and it's likely that only certain 
types of platforms will do so

3. OpenSBI, from my point of view, consists of two distinct components:
	a. libraries that can be used as reference implementations by 
	   other early boot firmware; and
	b. sample early boot firmware that replaces riscv-pk

As far as I can tell, as long as the platform specification standards are 
written correctly, there's no conflict between SBI-based platforms and 
SBI-less platforms.

> There is a further issue that occurred to me doing their excellent
> FOSDEM talk, which is that nowhere in this has any kind of verified
> boot scenario been discussed, and if you don't get that thinking in
> from the start it is very hard to wedge it in later.

Verified boot seems almost completely orthogonal to OpenSBI's library 
implementation (3a, above).  U-boot, or Grub, or Coreboot, could reuse the 
OpenSBI libraries, but not the OpenSBI early boot firmware.  Then those 
other bootloaders can implement whatever verified/trusted/secure boot 
approach that they wish.

As 3b mentions above, the OpenSBI repository also contains sample early 
boot firmware.  That part of OpenSBI would clearly need to be modified to 
support some sort of verified boot.  However, no one to my knowledge is 
proposing to make the OpenSBI sample early boot firmware a RISC-V 
standard.  That part of OpenSBL is just a sample first-stage bootloader 
implementation - the same way that U-boot SPL or Coreboot romstage are 
sample first-stage bootloader implementations.

...

I personally am excited to finally be able to use U-boot's rich 
commandline interface and device drivers without needing to have riscv-pk 
(aka BBL) involved.  Those who are not doing active RISC-V Linux 
development may not be aware that the use of riscv-pk made it very 
difficult to use upstream-focused Linux DT data.  Even though I might have 
slightly different preferences for the current boot flow, their work 
removes a major obstacle from RISC-V Linux upstream development, and is a 
big step forward.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
