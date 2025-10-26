Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F293CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sER3hRAFRLI5zSMH4kTt9jWS1Q8K3ce+kC9ZRx9u6U=; b=SIZw8RQITv2pxsF79aMrlL9XoA
	2DzpLTHWvr70YK4zm3QnCQK049RREqlhXBgnR1iDUuKgcj+ne0C+GNlp9ia04ZIs2uwvRYESsMKnn
	TXQDRdPPVNKHaLYmIT15QPh5MVnh/oTg4yKQD9BX2iUMxAKwrKi9Qv6rbA6Yn+GLb8lWl0CKx0Jod
	cGgpvCIgge8ZOWNM2HNHoKxNfC2U2M80xpfEF6bEcSx3f3gctm8rmORUFxZnB04b9aQh0D+p4qN5h
	YfiTuHnu0tfMXnDlzgYGCeiNiGJ2vsvCcCkPCXk0skTQVy1fL90FOM0GeAuUmvkHXsKqHm3/oHS5M
	9PDGrAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Xu-0000000Cpkw-1UQU;
	Sun, 26 Oct 2025 22:49:06 +0000
Received: from black.elm.relay.mailchannels.net ([23.83.212.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9Xr-0000000CpkX-0uiW
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 22:49:04 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E05ED36160F;
	Sun, 26 Oct 2025 22:48:57 +0000 (UTC)
Received: from fr-int-smtpout16.hostinger.io (100-119-151-11.trex-nlb.outbound.svc.cluster.local [100.119.151.11])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5647D36142C;
	Sun, 26 Oct 2025 22:48:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761518937; a=rsa-sha256;
	cv=none;
	b=AyKXTiJdD/Z/lO8dC4edljNQ+VNou7Bjk5ebwAQQLWVvX3/SGwqgB0NIyTrsW8Do8tFXyz
	Tzy5yx18uX6OdKCt4AqhG5Q4H1nb9JF1MjLhkOa96yhtZ/hMJgJ9j/mhcPhJ4Uv+oW0HKA
	ABkSYr+1NmxDnwT/N150itKH0zz58WIpHXirKq4MSW6PJE52OtqQZExhbQ2alWnJ3gJMbH
	KO1nKhbmqIPSADHUGNsscFHeHte9KNJsx8jhtC3L9akB5iKDfM4Ufq5JAH04/ZZHe77dL0
	fwKxWgXoIodyYi2eYRO+t5EhlbivFG2oMjb1w4LMPIwIPExtivtGFUcTkE43Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761518937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=uFsO6MOvX/5QN9XiCW8717+gVZ3oyi7YrYXpJc6qfWo=;
	b=GMKoZHeOXm/XU3rl55b/WDHS3fTAm7uSZHGn3Rpl/niDzyYT4tym2yvM6uYGu+sLn7WDzc
	chjpbRqB3rJ3adDRftlN5vIrXlb4QQ0NvuCj0QMeVkKWpFFpXb8mv8mAJxNJFPRIpBGcSh
	1eLzQ+Qyyf+veJdiw3+4iVHmyvawnANCDXugYf3c0UEqlb4xE6BaXyQAXmHV7og43iuDaV
	LZmjnjVtQVMA+TfZoZA23Cs1K+8slVjI1DAN5Qg3yrOWNyq7suVphH0gzihcyQKzWtupo2
	jzVFBpKsFAN6PR1KvdpBg8fMlGHYZrtreq6jkbVRXi2Ue/+vZbqDuPO58wTatQ==
ARC-Authentication-Results: i=1;
	rspamd-674f557ffc-8hdz9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Glossy-Bored: 6f0a4d1c3bd11df6_1761518937746_4155451395
X-MC-Loop-Signature: 1761518937746:3498211039
X-MC-Ingress-Time: 1761518937746
Received: from fr-int-smtpout16.hostinger.io (fr-int-smtpout16.hostinger.io
 [148.222.54.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.151.11 (trex/7.1.3);
	Sun, 26 Oct 2025 22:48:57 +0000
Received: from [IPV6:2001:861:4450:d360:bf0e:83cc:ac75:8cdc] (unknown [IPv6:2001:861:4450:d360:bf0e:83cc:ac75:8cdc])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cvsJ264nCz1xnw;
	Sun, 26 Oct 2025 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761518932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFsO6MOvX/5QN9XiCW8717+gVZ3oyi7YrYXpJc6qfWo=;
	b=jenUQCRo/Am12+0noROadVkvTh0uDbTiGgY5PW4GBhmXmSaweUQKOWiqC8gaa4JoV2Hrxp
	4VbTgPWu61Tk1DvjY+2IpygBCE2UP01UTkG3AQulIqUUjqE4LBrC/G8aJB+wqPJ8AEsoKs
	qGOq/3qi62DOGVdrZcDFlfXTW/nB4EbiEDJtpaSCjUoXfItt8ZXxSX4lSjagPgdn7O0wzv
	SC/oDFSwVohEEX9imI6yRPg38l24DubnNoKg6C40g7Qtl3bmVYmssFTEcv3Ir9/eEETvBT
	evLH3aD9wSdZqyUKp7ZQSM8eywYe/8y5lnMgeHDy+mBvdvPVyuCUu0wGpA0krg==
Message-ID: <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aP6UJFPP-ReYPzmq@sleek>
Date: Sun, 26 Oct 2025 22:48:50 +0000 (UTC)
X-CM-Envelope: MS4xfCvqkUVMbgTTDbHBA0d4cZBu8FEN3OWccx7Z3P1XKUivUx4Y68YFJpjG2DHVo3P5lB3Ny+/8w0V3ajRhGWzoYRUuaCkXdvFvHcWTnCnbhFz/PrdrWC+x COM5aFHJVvKFr/TS8TzixCnKhPhzdj9F1cfiwoyCXMPAS7pXgasqCyvGi//OA5t4SeP7b2FDSbjXfXy1AVcC2dv6FZnC70B6jl2TXyls2IVUEAz66hPQhnNX W5HaqF3f6vdnVH0zTYj7Rw3WokajdiUoQcaes/olNhpXTR3Ld6XT88k0RRYbZ3G+sbO+g/wQYIHbUV26cukqWAaAZJ39l7/NFaKC+Ax/8H35WFixldDWhNmH Gkxj9HAOcLxINWk6EQIwQk7YXHH/3GAhirc1dTXOrRLXY21Qibf0mRZb2+xOOR9gplI1hoPpropN94wkvlE2eyNylLcA8xtjPptBAHoWDzyiJE/R0FzA7lcW u94QFzgavtxqJW144Djci+uYdLHMp4kObiBWY1v9sSgFQezyQkdQJB5sJ6XMjBXyxMbP3REFSeOhjR9qszHNlvfU2Un6AhM7ePi1Q79UQ27lMP/3wvv4Yd/n +P+f/QkuVcGpT0T23r7ISE8NKEBSuxST3WHxTuVy1SqP0zX8RelYByh9/a5grzuJ1rZ8zqcgZslAWZ0Cl/l+wZ55doQVqWtDLOr/ThG1mzAxHgbyl+YMCQcP s3N2FHaIdEcL7qj8T370YNQQSlY4jap/8379yoznKiZS5VKvbBmL/IbdD5hdSucMQlHxQGn07kmNMkSCXOxJbn2AtwVwu+O/cIutf3kP58xOMdpzcPrv1Yzt VTI0v9w8oSv+E+QDDiQmQpLzs+SV2IO9maYa13KvUW4p1EyLKcvsWRhzMnPXMJlnSXezO3/QWaBpF/HHB/f3IMuH8ewAQ2PWBoxQSlffglVzhZLZcO0tz6Ki mZTfsQ==
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=68fea554 a=zy7iCUYNTH43UiyTonfErQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=YzZgpwwcAAAA:8 a=d70CFdQeAAAA:8 a=SDwY5gupPOl0iZWIF84A:9 a=QEXdDO2ut3YA:10 a=diELbSsDbaqdzccPbx55:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_154903_615426_B4CA544E 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Joshua

Thanks a lot for working on support for Milk-V Duo S. I'll be happy to 
test your V3 :)

On 10/26/25 22:35, Joshua Milas wrote:
> Inochi,
>
> Thanks for pointing me twards duo-pinmux. I was able to use it to get
> the default config which is uart0, spi3, and i2c4. I can change the
> dts to match, but...
>
>> I suggest enabling devices that are accessed by default
> Would we rather enable anything that can be accessed by the pinmux?

If I understand correctly, you can't do that because there will be 
conflicts.
 From the Duo S pinout diagram 
(https://milkv.io/duo-s/duos-pinout.webp), on headers 41 and 39, you 
have to choose between MIPI, I2C2, PWM12/13 or SD1. If at least 2 of 
these are selected at the same time, there will be a conflict, and I 
assume that the pinctrl controller driver will flag it.

Then it sounds complicated to define a default combination for the whole 
board, because it's like a default use model. Who gets to choose? What 
Inochi suggests is to follow the vendor kernel choice, which would 
correspond to the way the vendor intended the board to be used. However 
the community could choose another default way to use the board, so the 
choice may be up to the first contributor to the mainline kernel for 
this board, possibly revised through later discussions.

I guess there are cases when the choice is easy:

- When only one configuration is available for a set of pins
- When there are important devices on I2C or SPI buses on the board. 
Then, you want to find a way to prioritize such buses. Fortunately, I 
guess the board design also guides you to the right choice.

I was facing the the same question today on another board, and that's 
why I'm happy it's raised here. As thousands of DTS files have been 
written before, I'd love to hear from people with experience on this 
topic. Are guidelines written anywhere for board DTS creators?

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
