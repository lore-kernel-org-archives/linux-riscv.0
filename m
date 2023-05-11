Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4458C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi1c7Eoz6YUhHBYSGhVGgf/GZD8VHSDDokOMSiuZgRk=; b=s6yu8MaFrVzVKJ
	RsnbC/cpYNeBIzBQABrHlxT+cv2H6XnMB1ZvEoMyuLsKLmWvTvhfDpu1Epdssrijleagh7jyPukzh
	6eHrGmkwANHljD6cvwJpz6raLV9kTdahDryyUNdUJt2BjhJxLb+gj5gUqiv51yoK/0g5MdN3HLilr
	djBXCboSUbzmwxyySU2kRARguk58wlsrA5m3t6eXuJ3QLUylzby3NXxmUcBMR6vL3cJYSf57qAj9m
	l+oLVvUJR/tMfoRIApmu6bjBx1yp+TYcWorJZ9SNIsfilUylJVixUQDgvbfdjC5Onb9Fz/PX/hvd1
	fTYX/x0NtYKXn14DdF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAsB-009gUE-2u;
	Thu, 11 May 2023 18:18:39 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAs8-009gSA-1e
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 18:18:38 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QHKrx3P72z1s95F;
	Thu, 11 May 2023 20:18:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QHKrw5kCfz1qqlb;
	Thu, 11 May 2023 20:18:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id IerpHNoGBzfN; Thu, 11 May 2023 20:18:23 +0200 (CEST)
X-Auth-Info: i/Xv+IcJhW0kfDb3RFbFK0/YgUTT+UjCzPxmdmooeKeqEWINPY1r+0B4+hi7eI4b
Received: from igel.home (aftr-62-216-205-189.dynamic.mnet-online.de [62.216.205.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 11 May 2023 20:18:23 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 21B822C1D1B; Thu, 11 May 2023 20:18:23 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Christophe
 Leroy <christophe.leroy@csgroup.eu>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linuxppc-dev@lists.ozlabs.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr> (Alexandre
	Ghiti's message of "Tue, 9 May 2023 21:55:53 +0200")
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
	<20230215143626.453491-2-alexghiti@rivosinc.com>
	<87wn1h5nne.fsf@igel.home>
	<4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr>
X-Yow: BELA LUGOSI is my co-pilot..
Date: Thu, 11 May 2023 20:18:23 +0200
Message-ID: <87ttwi91g0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_111836_718341_7C25E2F8 
X-CRM114-Status: GOOD (  10.38  )
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

On Mai 09 2023, Alexandre Ghiti wrote:

> On 5/9/23 21:07, Andreas Schwab wrote:
>> That does not work with UEFI booting:
>>
>> Loading Linux 6.4.0-rc1-1.g668187d-default ...
>> Loading initial ramdisk ...
>> Unhandled exception: Instruction access fault
>> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
>> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
>> Unhandled exception: Load access fault
>> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
>> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>>
>> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
>> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
>> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>>
>
> I need more details please, as I have a UEFI bootflow and it works great
> (KASLR is based on a relocatable kernel and works fine in UEFI too).

It also crashes without UEFI.  Disabling CONFIG_RELOCATABLE fixes that.
This was tested on the HiFive Unmatched board.
The kernel image I tested is available from
<https://download.opensuse.org/repositories/Kernel:/HEAD/RISCV/>.  The
same kernel with CONFIG_RELOCATABLE disabled is available from
<https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/kernel/standard/>.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
