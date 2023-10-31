Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD66C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDGHdfR1uE2PzzANmsSaWJQtgcdhloBPx6wRLPnnW0M=; b=d4a7jqEUpuZ/2m
	v7wl+aPXX5t2pWaj6j9GnSxyRza/04kxkSqyqrKVAviDIdq7cb9/haR0XhdJnzUy5y8yqd+c7pWck
	sIclKiYmFMjAtL8H8y6LfGj0deACN5rq17bSm3Q81ZlGsqhAV6nKJLwMivtouoFexX3Z4qN5fqqcC
	fv/faP83pQFegDM+3HwQONZ2XJQWO+v5Wb1C8XXGQnAUfdMw2OQowg+kcJG843jAode+JRHhmwkNU
	uaPz5rVoOT8cR4y4aKqSl+m1iq8delOTcWWjSjaJX0EW1qpxTI3Y9AoXJIAaDdN8xaNRlXLMcnPFg
	Me9Esqv8LoPuzVGgukgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrnV-005hh8-1h;
	Tue, 31 Oct 2023 16:40:57 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrir-005evH-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 16:36:10 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4SKbNw3bKHz1r1sM;
	Tue, 31 Oct 2023 17:36:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4SKbNv719Xz1qqlW;
	Tue, 31 Oct 2023 17:35:59 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id gPAjuvIpFzIo; Tue, 31 Oct 2023 17:35:58 +0100 (CET)
X-Auth-Info: 7WVihqLGSDRZy2DvJB4lOgCCHp8jng0ZYt5id1i0l8Oow3unYQFAovJz6kwHdGof
Received: from igel.home (aftr-62-216-205-72.dynamic.mnet-online.de [62.216.205.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 31 Oct 2023 17:35:58 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 943A12C12E3; Tue, 31 Oct 2023 17:35:57 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
  linux-riscv@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Eric Biederman <ebiederm@xmission.com>,
  Kees Cook <keescook@chromium.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Samuel Holland <samuel.holland@sifive.com>,
  Nelson Chu <nelson@rivosinc.com>,  Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v7 1/3] riscv: Avoid unaligned access when relocating
 modules
In-Reply-To: <CAJM55Z-v0EwrZp876DdLSzad2u55nJV_uBs_+MUJDqFW5MTPkA@mail.gmail.com>
	(Emil Renner Berthing's message of "Tue, 31 Oct 2023 06:11:47 -0700")
References: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com>
	<20231031-module_relocations-v7-1-6f4719b64bf7@rivosinc.com>
	<CAJM55Z-v0EwrZp876DdLSzad2u55nJV_uBs_+MUJDqFW5MTPkA@mail.gmail.com>
X-Yow: Could I have a drug overdose?
Date: Tue, 31 Oct 2023 17:35:57 +0100
Message-ID: <878r7iiwb6.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093609_332276_17C06338 
X-CRM114-Status: UNSURE (   9.04  )
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

On Okt 31 2023, Emil Renner Berthing wrote:

>> +static int riscv_insn_rmw(void *location, u32 keep, u32 set)
>> +{
>> +	u16 *parcel = location;
>> +	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
>> +
>> +	insn &= keep;
>> +	insn |= set;
>> +
>> +	parcel[0] = cpu_to_le32(insn);
>
> Why cpu_to_le32(insn)? Unless I've misunderstood something downcasting unsigned
> to unsigned values in C (eg. from u32 to u16) is defined to always discard the
> most signifcant bits, so cpu_to_le16(insn) should be fine.

cpu_to_le32(insn) can't be right here anyway, since it also swaps the
two u16 halves and would be the same as cpu_to_le16(insn >> 16) on big
endian.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
