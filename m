Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6072ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxkAG4YvVriMETmteNpcadA0+/NV3Y1M2+y7BxBwD+0=; b=TJfL7SeL5mX2pu
	lvpHuyiFI9fAPT2R98/nKAzusIrNmw5uDUi43i7KG046x3/wjNxiN9pGwvxypVDlzXsCcmHWVEJtm
	dt20dqojnLpi4Q/GUorVRUP/DmnsgMa8SQd0Sj+zXKK3A1i7k2nM2skjTY6r4ODj3Tlc9gKaNP1xj
	gUAHxZV73VsOOqoIIXaouWedC6IXl++6ycUxZBuw11KSPcnvZf3OqQTH4Ph2S6t9wW2Zh1XNptalr
	M2F1O22QsC6DTx0GqVd+amKqjiv+9FylxYJ2bRfz8BgouuyKKr1Q+6BtHqzpF9SrtTQMwg6jeyAPR
	l1sIG3BoyvmJwhURKLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU40u-003UBd-KV; Fri, 02 Sep 2022 10:35:04 +0000
Received: from forward503o.mail.yandex.net ([37.140.190.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU40r-003U5a-KB
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 10:35:03 +0000
Received: from vla3-178a3f795968.qloud-c.yandex.net (vla3-178a3f795968.qloud-c.yandex.net [IPv6:2a02:6b8:c15:2584:0:640:178a:3f79])
	by forward503o.mail.yandex.net (Yandex) with ESMTP id 539D05C5063;
	Fri,  2 Sep 2022 13:34:54 +0300 (MSK)
Received: by vla3-178a3f795968.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id R3jjqKDmTO-Yqhm5HCq;
	Fri, 02 Sep 2022 13:34:53 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail; t=1662114893;
	bh=qstGMBMTzvZwX/PqmECUTBaQ2hySlR22czcR+Yy1yD0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=P9JweG7SRxrxYisCNSs26Djtr6O9lGebA6gSa63eGkruaq5XTSTQEVY7iYX/BWA/4
	 8sqv0NTQok5gAfNwmgKjaMk07WVfYcdNoslFZrC7OKUEXhaSaB03PLuoriSmGajanl
	 WihwdAEgIQovEQCvm8/h4Yf4Lih6NH5vNoELKFbU=
Authentication-Results: vla3-178a3f795968.qloud-c.yandex.net; dkim=pass header.i=@syntacore.com
Message-ID: <f5850a14-24c1-1619-b7b8-36663c216e32@syntacore.com>
Date: Fri, 2 Sep 2022 13:34:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] riscv: Fix permissions for all mm's during mm init
Content-Language: ru-RU, en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor.Dooley@microchip.com, atishp@atishpatra.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org
References: <20220830091612.513137-1-vladimir.isaev@syntacore.com>
 <20220901084740.v34npx77vlfclyje@kamzik>
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <20220901084740.v34npx77vlfclyje@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_033501_880861_1489B86F 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Andrew,

01.09.2022 11:47, Andrew Jones wrote:
> On Tue, Aug 30, 2022 at 12:16:12PM +0300, Vladimir Isaev wrote:
>> It is possible to have more than one mm (init_mm) during memory
>> permission fixes. In my case it was caused by request_module
>> from drivers/net/phy/phy_device.c and leads to following Oops
>> during free_initmem() on RV32 platform:

>> +void fix_kernel_mem_early(char *startp, char *endp, pgprot_t set_mask,
>> +			  pgprot_t clear_mask)
>> +{
>> +	struct task_struct *t, *s;
>> +
>> +	unsigned long start = (unsigned long)startp;
>> +	unsigned long end = PAGE_ALIGN((unsigned long)endp);
>> +
>> +	__set_memory_mm(current->active_mm, start, end, set_mask, clear_mask);
>> +	__set_memory_mm(&init_mm, start, end, set_mask, clear_mask);
>> +
> 
> Presumably this is only run at a point where it's safe not to take
> tasklist_lock. A comment explaining that would be helpful to readers
> and help avoid this code getting copy+pasted into points it's not
> safe.
> 

Thanks for your review. I sent v3 with added comment and
WARN_ON(system_state != SYSTEM_FREEING_INITMEM), because looks like we can do
such mm-s change in this state only (both free_initmem() and mark_rodata_ro()
are called in this state).

Thank you,
Vladimir Isaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
