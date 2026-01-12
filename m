Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05892D25030
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 01:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxW88wbJLLxGl78WHrW01nyEPL6cnVPAPCMmt1I9FJU=; b=HK2972xyqqbyRg
	CkeiNiQZjyXdWMBlVl4/QvKVnN08aGcriuK03oWfEN56L98QvDRRQ+0bW4lYvLj641SYOitH6gu87
	JzIWVGqGvBvlSDtClhZS+u+ybAwCQ7dewqXeheTg8y7XhGLIODLGJnCgFyOi28WMaDzkd2ELSiXvo
	ieSe2xnxAqROABe4Ps9FviuASgMO6HHg0ahNirnw8PPdH0FtvktWbFCc8jJtFMlQ6tPNzdguH3TG6
	87X2Ao0VS0HPHFYhTBQrN74W5/TD5kturNMwLBCKautCByKbJfDFjiT/dJPydLkOnKBShvWev+AwL
	Iphi647ZcjP08xVlwiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf77J-00000004e5i-2qqH;
	Mon, 12 Jan 2026 01:53:13 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf77G-00000004e42-1RTO
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 01:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768182728;
	bh=2V0YGG8KS5edIV8RrxQAVz+N/+s7k9aPRaIemnpjyes=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZoBjGaIJlwVYNZVS5E72MHODV60jF+C5fUweMJs0SuXpoagXD/mw3UZJB2rYC5RhU
	 DJcsd9R6N02Khe0cv9fnsn44flyvJhK0ib/4/a+5tVt7FNteVRMZY4BtVlG5tx/k2s
	 9LMraGQ/1aTgQb5TNqYpFfSkSAW8bCm2AQ/oR90c=
X-QQ-mid: zesmtpgz6t1768182720t29d70f31
X-QQ-Originating-IP: NgU/OvI8KlXz8Hx7N7o9ZcfY708cpKw5XNTQ/HHR3QU=
Received: from = ( [183.48.247.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 09:51:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5413789781877142214
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Mon, 12 Jan 2026 09:51:58 +0800
Message-Id: <DFM8GN2AWH1A.1FWVNVF5FLDSH@linux.spacemit.com>
Cc: "Lee Jones" <lee@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Alex
 Elder" <elder@riscstar.com>, "Andi Shyti" <andi.shyti@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-i2c@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
 <20260109224147267169ba@mail.local>
In-Reply-To: <20260109224147267169ba@mail.local>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MYi332yUMvzJVTjIZZ6KBo1XNwwLoJ/FzOEarEZg0sPadd7m+1+9d5AD
	XoRNSaUzYFK9+eWt0hrrucOUdiHcJ/4YKl/pqQ0EOLUXeibCaeFBRPZS9hJ2EfDVusspiiL
	g7y4wPXRiGoO1WbTfcfys8FPD3BnRzbOQhbto8cnnI5CbAYl0RjS9yGEgu1aMvdrs6cm98/
	oui71iMGtgn+0BUVRWBKDzhWHuMth8J7XgwK6DP5Kc20NM2aDvYrJQ/yVXO3vz769pMBQ2J
	4bPExZps/uvl2++xNLEELA85FQrDeSRLLVcLBYzbh4D1yvS87vV+ssUPZPKnyxjoUsX9H46
	vrpGGw40zYRuiykFxg0WGAmWLUgF+mFSUcsjwlWhu7i25TKEFmMQYiHcR94gjwVBMQBr7WT
	czCLMywxNtoXRGtSAonIRN8iYM50ZjDj5FKgidsRHuO57BPrdOHJJzTdkOCevcQ7gvg/Wl2
	Jk/lpV5iSeRdlL06iB383CXW7bMyf6aUx8pY3p5hmkYIBNG4kC9Swa2w/ADRADQRFVS5oj/
	PDe7PtQwUOoB/h1ay8lKbiPES0co9uprfF2Z4aya6STCyrppUc7zmJHtv47zsPDpJHeHGop
	H9i3sJk020k9Do26RYpeCszXwWd8gDIg0zxeQAdi+3HMQkrzdf0502FhPSewT55Ba0ss1HR
	rQ+ri+/w2qdPP/mIX9efj8HwyIek5zpPpfcjrH3vZF+JzKtnNC2lf8ZPBSLVcB7Fm3YuoSA
	7LDHHNODz7zJugC0bYxJQSBZzc+SZgJpWAeu0LHfbNUiYsosnRQEyXWv0rcL9XVPuKPxpg0
	OKVOFQQXrZB8jzp14su2nuASHVSV6v83I3KkU7P+C3Tyd6z++6wcFXpTpwFlKb/Y3hr/FzI
	YtbuGAmJwK4Jalyip0jMpbyuC5IJ0uaOCsj6Nnir/GcNm/wq1MplO7r3xhOmukx0n/USv4+
	LSbeq4lFv8I4wolzpT6iHrb+dmddnS7iM4y3MbXgYzaDDEYiHm6yJS7LwXvq8/bL3abIqu4
	UPJqdGIbCBiLWoxmBHqM1W5ba6Dc7viOKXz3LussXdV+c2CG58avjRxJmHYWEdZk63RapnU
	kPuZab0l0eR5Ok0TW5ZrWg=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_175310_957879_DC70844F 
X-CRM114-Status: UNSURE (   5.78  )
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

On Sat Jan 10, 2026 at 6:41 AM CST, Alexandre Belloni wrote:
> On 08/01/2026 16:38:54+0800, Troy Mitchell wrote:
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
>>  config REGULATOR_SPACEMIT_P1
>>  	tristate "SpacemiT P1 regulators"
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>> -	depends on I2C
>> -	select MFD_SPACEMIT_P1
>> -	default ARCH_SPACEMIT
>> +	depends on MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>
> default MFD_SPACEMIT_P1 is certainly enough here.
Yes, Thanks!
I'll use it in the next version.

                    - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
