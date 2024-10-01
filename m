Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF5CE7D0F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8P+4yDJMobRAnDFY7exdMO/PB5uvsOK1n76oxt6Pvg=; b=fRS/5EH/V2ZTW5
	JV25yeUSxi9MCVUHJjFuzo+RCLv/bci3nSu1DWbaLO4ADjK2lzvCRc7Pw883SL3JXl7q3CYWO4EKJ
	MT7Fi3ApzweWOJjGj4GF6ttZ9ZYt7aXStKX3bt7vHcgk4QZtFqQLGHvqGEkBhACEyt/yGkwju2JIW
	e7NMZgfZTRpqu/oL0KaXd1L/+nZPTqGdgd6UVGbOyoJ1JrUgxkzh7gfuH8LkePd16dlHFeiF8zA4W
	7145ynyWpKvGggsPbgSXezLZkJs3LvhduH7rp9BPWnls3+4KWDWvKX0ZQ1OBseuWrimAJAhqB+m4J
	Wx2tIRjbgE3+Va2nWFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaL9-00000002NVN-04TN;
	Tue, 01 Oct 2024 10:42:47 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaL2-00000002NRw-26VA
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 10:42:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C31DE0008;
	Tue,  1 Oct 2024 10:42:36 +0000 (UTC)
Message-ID: <2f8913ab-b9e7-4fa8-ac9c-67d05b9e8beb@ghiti.fr>
Date: Tue, 1 Oct 2024 12:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crypto: starfive: kernel oops when unloading jh7110_crypto module
 and loading it again
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 William Qiu <william.qiu@starfivetech.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 E Shattow <lucent@gmail.com>
References: <ZspDyIZiG8kvXaoS@aurel32.net>
 <NT0PR01MB11822312703A78C4F17C302B8A8B2@NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <NT0PR01MB11822312703A78C4F17C302B8A8B2@NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_034240_723500_9534C82F 
X-CRM114-Status: UNSURE (   9.84  )
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

Hi Jia Jie,

On 26/08/2024 04:04, JiaJie Ho wrote:
>> I have been testing the jh7110_crypto module on a VisionFive 1.2a board,
>> running a 6.11-rc4 kernel. To benchmark the crypto with and without
>> acceleration, I have unloaded the module, and later on I loaded it again.
>> Unloading it works fine, but when loading it again, I get the following kernel
>> oops:
>>
> Hi, I'll investigate it. Thanks for reporting this.


Did you have time to look into this?

Thanks,

Alex


>
> Best regards,
> Jia Jie
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
