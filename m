Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD6AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 23:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFBF20838
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 23:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xj2Cf00e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ClpM8L2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFBF20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IQgA/No9nkLJLojywXzAX+g5J5DdtDMfGzp1rGyoIhw=; b=Xj2Cf00eWfSePkT7Da4fvBIz+
	YQQZtO+W1nOJDpoqrHCXiQH8t36R8ENRAMgbaolerbuENGBJJAvv4i9Cz3BpV5i+huB1SMwhnB9c6
	Le0wJMImXJ36+upTVtQhgciZiIFZYJSc+ktRBMEIIxQlklgI9c2TEvM2wuK1AB+4/1MfsoOV3Yrkf
	Ehhmtt0j6HNmiW3gqASy7DrV6pHmwguciuPE1qT1r7odKyO5yvNNyJJg0Or18QmxlcpUOLl1SM4jG
	IzFDS3b4GJ+mvUCheGL9JrVnZ+ofmhg8e11Qma5t4Fir8r0o1svw8HHYuYff4N64mqHshksmEcccD
	Lyf2z7Q3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guQVU-0005ub-Tx; Thu, 14 Feb 2019 23:33:28 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guQVR-0005tx-Of
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 23:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550187206; x=1581723206;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JyIuzoahJhXItXaoaLO0BZt6YCodUNR0jk/suO+uHRY=;
 b=ClpM8L2Q/KnBvGHyqoL8Qg7IkxyIvBlPtni1y77zZ4iYFbHERNAeLsvS
 cKvI0kH0K1OoMhinsTb6zGv88Yuy6n4TPS6p2fsat0e3i0IsGUnSgtGCx
 I2Gu7dT2YmjF7RwjGxqeAVjCqaw5U+YNUU76tjUcxijVdAeQIgltlRnKS
 epAJNk+EVjusdVQtxVW3dFRGiSv1guHqKuM0NkR6mS2eI+2MT8Li45aNE
 VQ/bS607R5shLsj1lExXI3lPNoJLCnedte4WZNwYHwCbyPemxm93PU0H1
 KbUgBMhGwx2lOk90Pba3ccMaBTWin75g2HkRiK2o0BHDWGI/pubqpB8JH w==;
X-IronPort-AV: E=Sophos;i="5.58,370,1544457600"; d="scan'208";a="103069251"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2019 07:33:25 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 14 Feb 2019 15:13:56 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.47])
 ([10.111.66.47])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Feb 2019 15:33:23 -0800
Subject: Re: [v5 PATCH 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
To: Christopher Lameter <cl@linux.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
 <1550089092-28783-6-git-send-email-atish.patra@wdc.com>
 <01000168ed298ba3-fea3ca2b-436b-4ce6-a0df-cebe727bf55c-000000@email.amazonses.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <e86e8239-bea8-b11f-f09b-63110ec16d88@wdc.com>
Date: Thu, 14 Feb 2019 15:33:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <01000168ed298ba3-fea3ca2b-436b-4ce6-a0df-cebe727bf55c-000000@email.amazonses.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_153325_861965_1AD5909C 
X-CRM114-Status: GOOD (  14.89  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/14/19 9:59 AM, Christopher Lameter wrote:
> On Wed, 13 Feb 2019, Atish Patra wrote:
> 
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -66,6 +66,11 @@ void __init setup_smp(void)
>>   			found_boot_cpu = 1;
>>   			continue;
>>   		}
>> +		if (cpuid >= NR_CPUS) {
> 
> Use nr_cpu_ids instead? Its initialized to NR_CPUS but can be restricted
> if we can determine on boot how many processor we truly have.
> 
nr_cpu_ids can be modified by nr_cpus in boot command line. If nr_cpus 
is set to a value less than number of cpus described in the DT, kernel 
may not boot depending on the boot hartid. This happens because we break 
out of the while loop and BUG_ON(!found_boot_cpu).

As the required fix will be different from the current fix, I would like 
to do this in a follow up patch if that's ok.

Btw, thanks for bringing this up.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
