Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyJ7FvYreC0rYx08HFTndBcXy4cMHJziRnKtniQL92g=; b=MitKdNfhsJ48Bn
	lYFnptnzkNXf2tk8APYUAVkImuKiaruTDU+xWdJiDJ4IY54w83hVndkI59YeVJ2zEM6h/DaCWq8ik
	qxyolq00gjBnRtsowrhI70JB6oawOSBNOt5ohPKIXRsExDfZ9souMuhZ+w3hUOyb9YaN+GlllgRIq
	pRf4exhruWZIB3+TB+lbce6KpbYvJz6lSaiLMEaw1/YBmDSMRFc/r5Xaik8uFACYlc4eZj0QOUlF+
	ZPFee+GOCn/iOGea3m9F2iR35q0QyLbZxvupkTbF/ba0HM5Wn8q4ciNjKi/9kUekPBwtXMYfZBhv9
	S+Qgv8jC5t48kc+zQong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXu2-00EJLU-0m; Mon, 14 Feb 2022 09:44:14 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXbG-00EDz3-P4
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 09:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644830679;
 bh=bPwqzMydBgKUCCPAcnpWEevOwrjSEKacihSgwMc0jc4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=iostq3mEM/MOJNzagGc2y1i3Y05rII7z/NhlaQiyUbyXunuVAbarmNO/rWdo9xJIG
 Vdh5Ow8y1U5FZNOdkaBid272QPDu/tzE6mcnrrSE++hoHwixxHA08Uytf0DAqdq/np
 WOpyi2gw7rg+RBCA7ZXGPairX8MzSBabv/qkfsF0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.55] ([88.152.144.107]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdif-1nY7vO2GKj-00Edn1; Mon, 14
 Feb 2022 10:24:39 +0100
Message-ID: <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
Date: Mon, 14 Feb 2022 10:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org, Sunil V L <sunilvl@ventanamicro.com>
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <877d9xx14f.fsf@igel.home>
X-Provags-ID: V03:K1:Au/e3vMlDZkTXGdYorj9+mhhI0kX2Yew6mxWnv2QGwXtTeAfS/B
 GC0CYZsekBZfnzXD4vQVL/bx8xJHpAaGKrFLun/Ih7miykJsovZHN4EABrb6DE/aB82u+CT
 k5c1fbeV8pG17cyAa13L6Z8lVVvBfrq/uV8UwY2JaLXw2tPkV05PLZhFL6PL5/XCgt2mzv1
 QptnAnKEGT+5Wc5+r0pyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2xdUZkLP5D8=:FOcUVX4+xapxGqnhuR0t5M
 6FjdiVIZ4HOFCmWD7niXzb2QMPmbL5iWiX/XLvvHmuAKoQ21tsqVKJGLichsdaKOjHNjAkrTF
 An37zog0g1a5ZsXqmQpszkOgIpbdUMjsB8RhA3H6PfjxjJqiCuSCHpRuEQHn2lRUZJzWk6qAI
 iLZurQ/PEpqBL5lDwmr14XOmLjXK0xrMeu+Q1IVT8gABOdZNx9S8UT/soc7K3YquXvHbJNFjg
 E8dNS24EEiPvPFGakMihSYE2V48uAKYYApxh+hqTze3kr/LY1nHHBeE4O1+dctXhF+eOp+/nn
 Socw+JcuHf0c7mPCjtc/FKpekkTFRkbbo7L2CCl1UhBX03c4GkdDYmSuUY/f5pWZV4C2QJcQe
 y18FpIOAgTdacaWI7tGuq37kffw8eqwFFSLjHrJOlhUb1Nmdku/DIkVnwmgwQB/x5Y5MEjAjR
 wog4U8Ypt9h50VOKDJTa2tV1pGlqTHZoenPX5khDmG+XG8lb0H633AO9VZ5sUZnH4R9Xh0rS2
 zVO71lzwAJ4WH3zVMN9ksZQzZh0JQkDsppnlPT3GjqQiJXclup+9FigJZatTWZVWKTZ1v1HN6
 C6X355YcfqlYN4hx3qURb85suzcQtMNMOPrqGoZgml4d+PuWg4RpjTCRz5HoIfGXQjqrLC/uG
 /U8OglNbddKjyBuQT4mgX4Gvuaie99pGrxBa68PSHmIMEoo6vfwCHv7Wq2MBflYGAYqF4X9c8
 lgmgbaLfCcW+8hg0SufRgXgG+4N5vZMT2/smamEJRbdaW5qsrvXTaDyEbizDtj6tUiQecgGX6
 WxeiesARhS9k8k0rPt//zIR/Ods6qL111AzecSoNzuu0JpMOy2cfsYinb/ElE0ehIDiV3Bq86
 0VlREP/0vmEG7FlVYi1/xTiD6qoGsRUY/8xP7GMPzocmQI9gyxiwz1dwqOyPMFZLOi8H14moq
 YRsoYoRwlnvad55b5zoADbj694to8+24iVs/JWY7lommLPg6fogVgoGk7v3Fs631qyW9kboe0
 2UHKqP4mtqsKepGO/XjMBlOoKewGj+fYySTjde+bMKWZfGAuPIZ5ljSpiKmVCDfa20uokMbQQ
 JNVEpb4tJlugaM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_012451_154616_C1619832 
X-CRM114-Status: GOOD (  11.16  )
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

On 2/14/22 10:12, Andreas Schwab wrote:
> On Jan 28 2022, Sunil V L wrote:
>
>> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
>> index 380e4e251399..9c460843442f 100644
>> --- a/drivers/firmware/efi/libstub/riscv-stub.c
>> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
>> @@ -25,7 +25,7 @@ typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>>
>>   static u32 hartid;
>>
>> -static u32 get_boot_hartid_from_fdt(void)
>> +static int get_boot_hartid_from_fdt(void)
>
> I think the function should be renamed, now that it no longer returns
> the hart ID, but initializes a static variable as a side effect.  Thus
> it no longer "gets", but "sets".
>

set_boot_hartid() implies that the caller can change the boot hart ID.
As this is not a case this name obviously would be a misnomer.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
