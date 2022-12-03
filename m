Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 10:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwzPyZeptJJrqKOGKTBHcVQ6ix3TCVeA/fqVZe3DHew=; b=aCQ7ZQvdebwVr8
	4WFm48a+5sxtNcyqrq4S2LPHkYeD4UjExH6qrebSiAZ0EwuR94LDK8sN40n/z1fr+G9+1G66TZohZ
	nTNfyiMGLcyCyN1Cpx7go0/isWREjJf0yJCgGcmSEidnSIZy8EczViwJ6fayLYF2jSawPAeV9omPw
	Hrjf/xhV/3e+8WqoDGb4WBh4Pz8RXgv3YqzRXsyt+01hVegwACkauvW8KRac4ft4a1v+7RDM3SURl
	CZLvgXMOzK3KdatiBe2ic65Qm2QkSpiXXdHjcXabRP8rzKWjfdMECZ5YOgj074wy1qSYk5ptjeWBy
	JRjnazArVv3BXxuy1pDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1PvE-0035ED-BP; Sat, 03 Dec 2022 10:39:04 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Pv9-0035Av-L1
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 10:39:01 +0000
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CC32B723;
	Sat,  3 Dec 2022 10:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CC32B723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1670063935; bh=AcvliI0lkNH/1gvzi1wuMUNaRNRaEKyutJ7x8ZgHioo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CHCA02xMNduX7UNI7ipKcoRy8ZCNWX2Db2OFXlJYv4tgtTeJeXByBswOeU1PEWu1/
	 KkGWdqySGqwF+0OGkLS+Oy5Ept6k1UJTHkIq+AUQcj+rnsGSq0HVHiNKweDwUHUOp9
	 XOn/rlfrHkfD2moHIkXbvLpOJVIg79/dY60f3XhyKDh64H1bG1P0EODCMnJ0QHWcWq
	 EFJAVY3zjG+IzkFRVKdR+gQxRzx/F6nxhlpBkF2Mdgb3JOPRzMzk09DVaoZlySONlw
	 AfA7jaUoLSmQaMOQZ1UD3f7ABR93ySW/3+osU1G+CFY948I4zGWUIHLpCtTB2moRmF
	 EfsDMEAMKmINA==
From: Jonathan Corbet <corbet@lwn.net>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part
 of the uABI
In-Reply-To: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
References: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
Date: Sat, 03 Dec 2022 03:38:49 -0700
Message-ID: <87359wpy9y.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_023859_705994_14F8B816 
X-CRM114-Status: GOOD (  14.35  )
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

Palmer Dabbelt <palmer@dabbelt.com> writes:

> On Thu, 01 Dec 2022 05:51:10 PST (-0800), Conor Dooley wrote:
>> Commit 5a5294fbe020 ("RISC-V: Re-enable counter access from userspace")
>> fixed userspace access to CYCLE, TIME & INSTRET counters and left a nice
>> comment in-place about why they must not be restricted. Since we now
>> have a uABI doc in RISC-V land, add a section documenting it.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
>> it to be applicable, just getting a patch into patchwork while I don't
>> forget about this.
>> ---
>>  Documentation/riscv/uabi.rst | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
>> index 8d2651e42fda..638ddce56700 100644
>> --- a/Documentation/riscv/uabi.rst
>> +++ b/Documentation/riscv/uabi.rst
>> @@ -3,6 +3,13 @@
>>  RISC-V Linux User ABI
>>  =====================
>>
>> +Counter access
>> +--------------
>> +
>> +Access to the CYCLE, TIME and INSTRET counters, now controlled by the SBI PMU
>> +extension, were part of the ISA when the uABI was frozen & so remain accessible
>> +from userspace.
>> +
>>  ISA string ordering in /proc/cpuinfo
>>  ------------------------------------
>>
>>
>> base-commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
>> prerequisite-patch-id: d17a9ffb6fcf99eb683728da98cd50e18cd28fe8
>> prerequisite-patch-id: 0df4127e3f4a0c02a235fea00bcb69cd94fabb38
>> prerequisite-patch-id: 171724b870ba212b714ebbded480269accd83733
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> I think I merged the last one of these, but if the doc folks pick it up 
> that's fine with me.  Otherwise I'll take it when it comes back around, 
> so folks have time to take a look.

"Doc folks" applied it, thanks. :)

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
