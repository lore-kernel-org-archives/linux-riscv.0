Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8185AC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbjAhr9ywW0womtVAs+XvqHgMLbV3B7Qmi9QVmqDyXs=; b=0kx1/ZJwLb7fZg
	Bkh/mIn6lHJuuQyVNmN40b11YjmdzCl3oeir8SeRj5mYdJdKccjuioxPV2lDUBdhBTrDzu18nWxlf
	u5WsH4ajFsEs0C60t6dQr5c6jj7rOTrk2QoNQ0RA0U8BOipQovewPDQIMC/0Sxj2N5xl8lAMI/qy4
	DVBBPyFYGCbwssQi3S1eXGhndSsfV2zeW5G4LcKTLxdLcVL6XRRAkIbFbyzMpO78VHF5PIlCbz38k
	S5G5wKY/du0nlvDCvmkLq6eoqJxwbv3tohlwwjiQh53iCXtoIr+UKAaGzADeYJxhSFa5NxUGRqMhb
	ko/w80vt9lAw3H+dg2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Rk2-00AKkK-1a;
	Tue, 23 May 2023 13:07:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Rk0-00AKia-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 13:07:53 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id EB96F6000A;
	Tue, 23 May 2023 13:07:40 +0000 (UTC)
Message-ID: <c59f9f1f-278c-ac5e-88cd-85b8485f59e3@ghiti.fr>
Date: Tue, 23 May 2023 15:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>
References: <20230515141235.0777c631@canb.auug.org.au>
 <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
 <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
 <ee3bc2ce-5ebe-927e-5b6d-0b9490ef3875@ghiti.fr>
 <9f32e509-95b1-6a5a-aba2-664af4af37a8@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <9f32e509-95b1-6a5a-aba2-664af4af37a8@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_060752_300828_95BD9022 
X-CRM114-Status: GOOD (  10.68  )
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


On 23/05/2023 04:28, Randy Dunlap wrote:
> Hi,
>
> On 5/19/23 03:42, Alexandre Ghiti wrote:
>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]
>>>
>>> I'll check this one too which seems to be related to kernel/pi introduction.
>>
>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have limited size, hence the overlap, so no fix for this one. Is there a way to exclude this config from randconfig?
> Does this mean exclude XIP_KERNEL or something else from randconfigs?


I meant excluding XIP_KERNEL from randconfigs: it has very strict 
constraints regarding what can/can't be enabled then it needs human 
intervention to make sure the error above does not happen. So I would 
not bother testing this in randconfigs if possible.


>
> thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
