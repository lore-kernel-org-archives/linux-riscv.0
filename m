Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED5EC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m431xtJM1+4BvpRGyuf371qEGQRgPJQCKyWNGajpTSA=; b=ZJ6NoGujnSsPMN
	vS1xe7VOsvsRysqRXTVnv9nQEP5Ei9yXshvaqiowYSncaoLl/UPS4ka6OH7TNKoJkxLaD2jVnfA4d
	iHdNR6Ior419Ezn+k2QjN8b+a/7FB7xKBjxHhRSokiGoihrB13176XOnl+pCFhtQmlJilB2b8dAvg
	nuA5fM1JtcmYBTYCpOchpw6wO4swn/u/4/9wmX9yPbRxIkUkFGQEJxco3XCASqu5CRB777miX+nkd
	KEfuzuyTxvyGuX5bseBtRegq5eqRUZeW85Rz0CIa7mUHJtm6HhUBp2mI4i5ZE1ubRJmBiNBchzhui
	X0wf5CSyM6aS9amYKWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTRO-0049cI-2W;
	Tue, 09 May 2023 19:56:06 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTRL-0049bH-1N
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 19:56:05 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 70DFB60005;
	Tue,  9 May 2023 19:55:53 +0000 (UTC)
Message-ID: <4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr>
Date: Tue, 9 May 2023 21:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <87wn1h5nne.fsf@igel.home>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87wn1h5nne.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_125603_637152_D0DE1187 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/9/23 21:07, Andreas Schwab wrote:
> That does not work with UEFI booting:
>
> Loading Linux 6.4.0-rc1-1.g668187d-default ...
> Loading initial ramdisk ...
> Unhandled exception: Instruction access fault
> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
> Unhandled exception: Load access fault
> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>
> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>

I need more details please, as I have a UEFI bootflow and it works great 
(KASLR is based on a relocatable kernel and works fine in UEFI too).

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
