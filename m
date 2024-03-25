Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F235C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1iVNgVnqK6snQYQ+sB6b2TlyoDe0J4o4FErDGKWQsA=; b=XMPkww/6+VTeMN
	ly6qUqbheqt6aV8VCjv3nDEuTJwoAObsYEQdswKAIc+hZ3XpwlWfKikkBFX6WU8+woM20Ndjp+VTx
	/GITval2tPHtkD8VfgW3/szP9mbxF18+0MbidtOai+u4VJOklqKMSIrhAHvVqKLKDZE2TuheP3fUf
	zzZLevwDTozDoGA7tKSdUuBl1oM9QFRGJ1/NZcUo5HyCL+zVS6Z2/lur/G+Vwc64sGtE+Gbt7KIx9
	5MyaAf8icFiVWgOj5VKucqJyawBCsv+dGsAE+z7KwFP9EPzd9oylIpJXKnJPDdw8Y04nT1Pte6UDR
	9dwXBvH3cfg2z/vOYOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roenA-0000000FvTr-2XFb;
	Mon, 25 Mar 2024 07:30:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roen6-0000000FvR7-26f8
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 07:30:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6555D20002;
	Mon, 25 Mar 2024 07:30:37 +0000 (UTC)
Message-ID: <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
Date: Mon, 25 Mar 2024 08:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Samuel Holland <samuel.holland@sifive.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Yangyu Chen <cyy@cyyself.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_003044_719547_20A53B0B 
X-CRM114-Status: GOOD (  17.61  )
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

Hi David,

On 24/03/2024 20:42, David Laight wrote:
> ...
>> The use of alternatives allows to return right away if the buffer is
>> beyond the usable user address space, and it's not just "slightly
>> faster" for some cases (a very large buffer with only a few bytes being
>> beyond the limit or someone could fault-in all the user pages and fail
>> very late...etc). access_ok() is here to guarantee that such situations
>> don't happen, so actually it makes more sense to use an alternative to
>> avoid that.
> Is it really worth doing ANY optimisations for the -EFAULT path?
> They really don't happen.
>
> The only fault path that matters is the one that has to page in
> data from somewhere.


Which is completely avoided with a strict definition of access_ok(). I 
see access_ok() as an already existing optimization of fault paths by 
avoiding them entirely when they are bound to happen.

Thanks,

Alex


>
> Provided there is a gap between the highest valid user address and the
> lowest valid kernel address (may not be true on some 32bit systems)
> and copy_to/from_user() do 'increasing address' copies then the
> access_ok() check they do can almost certainly ignore the length.
>
> This may be true for pretty much all access_ok() tests?
> It would certainly simplify the test.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
