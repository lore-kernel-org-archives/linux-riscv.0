Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5B2CCFA04
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eodVXIB51E5HyrMCyxN0irPsK1LigNDmyFyKqnxshdQ=; b=1kxPS0B+Ipz3sJIkkkasHwafsm
	rkphvYGCrHE2F61G+wcBf74+BcCTa01LLSwB1HwNYF6vHeJGU8vx41KwxJcj7CedTeg/yHyiLjHqE
	kInwswcvw3W+bUXnb/w6WACryjQCU8mAIFiGpTXrrO5Qdi6cXb7C83KC+xcBBpYeRsIkYR9j0OIaQ
	hfg6/+BmPpMapi72F0DVHxARCuLncT1JZvnZgakYjDN08couqUVNP3BgoGenMXN7dUGb3LxLXhocf
	iWW8v9qZwqtndmSyOk+MdqwVh/8fNOkjiQ08uw+qnAo0rF7qz8+OxAc7nSgKVMmevy347nfOcompR
	v9ut7eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6a-0000000492J-1DkY;
	Thu, 30 Oct 2025 12:50:16 +0000
Received: from serval.cherry.relay.mailchannels.net ([23.83.223.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6W-0000000491d-2awz
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:14 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 776BB8C0811;
	Thu, 30 Oct 2025 12:50:09 +0000 (UTC)
Received: from fr-int-smtpout16.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.124.162.95])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3ABDF8C1FCC;
	Thu, 30 Oct 2025 12:50:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761828608; a=rsa-sha256;
	cv=none;
	b=y34sBHE5oOtQ3vZrXxjfFAHwsCRLhVkzy0mansGrQx//f4+8uDiMx1jVfxvYWTjEUeiR8t
	NeZ6Jp/x0y1KPbYO1XhokxoSXPZFlMVi/C4SLruCbYIea6chTN2BouI+sduTdQHVmX/Bl9
	PyQWl7UCePnECSB1j06LbbVh9lX38+n0S7j70QWbmxjLIwMigbJQy0RHpxdd8eVEahZgnL
	p4082B8YAB2veE9TuDB0GeqYersYrDlJByyV4rdY4Q898czaubIVfUEeSeja850zwoiYPU
	+/5keTbEflANU2oXFsvdi702u8huTW6CK0r2F4sup4q87eictEV1U7eauBgpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761828608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Gz3xQ+hmZGgEDLHwvY3zzhydvK+yGJ/MdRVQe4JZJGo=;
	b=5OQuRYFcBL/vQljZA0nyxz9w0K+bjoOsOb7oVzqN/WzAZBGPZ/vHy/+xeRW/ukmDYj1EBj
	Yx8Evj72sa9FgHjnbSeDUdE/HP1ItPKQ/odhH9l1NJtgrTAsfg4Bh8SUrFzKh+1PLkvwq4
	LAN5+TYucEN9dIQfLVDQb6TVTXKVWAzvZ0s21aEmvsOFB4M/UqFW/U+ZiBaLYaVZkiTf9F
	1TW3T1FfOp3x5zolu6d+Jl4L7TLW6YVC102b6L5EIx5ULXPznjmcEqbwbCOrwJBNxsD0sz
	XF62yg5V4qKceDZTm0NKnhcFrCs1C5gdai7B79N3qu84xYjjOmtjOlXiG3pTeg==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-j8sw9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Obese-Gusty: 4d5da9715151f960_1761828608645_2022255201
X-MC-Loop-Signature: 1761828608645:2649050027
X-MC-Ingress-Time: 1761828608645
Received: from fr-int-smtpout16.hostinger.io (fr-int-smtpout16.hostinger.io
 [148.222.54.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.162.95 (trex/7.1.3);
	Thu, 30 Oct 2025 12:50:08 +0000
Received: from [IPV6:2001:861:4450:d360:c0a5:3392:2a75:70e6] (unknown [IPv6:2001:861:4450:d360:c0a5:3392:2a75:70e6])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cy3qF4xcDz1xnw;
	Thu, 30 Oct 2025 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761828603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz3xQ+hmZGgEDLHwvY3zzhydvK+yGJ/MdRVQe4JZJGo=;
	b=D0eda/wHwY9vazv1OtQ95Hg7X3tM7MUtG5e8JpkWV/f+mqXUQ3oJ6YjPHLtwjh/0Wpg2eI
	AfzptSgVexOZFna7mwcN1r/Pr/zlacsL1v5QGUWdht0b2l08CT5MmatJi7IL8qtcj1w7o7
	2o3FfIwDqVlxJvh4Wa276E/zCFUNPn5veyDYUG/UfVKBdtUeXLTPHWPq9sQ7ENbX/vdLpQ
	NIUMPj68ZA+ParyFxJs3Cq2v4sHs5pYu3LdLDMi9exAGFHePYQtIqwDtoDjlgbAiLm4jHj
	cEIfzXtyRFjYRC+ZES2Ehs3RPOxxmGHvHr6nKniRRwhXnr3vNmHh1sh8GGZNOA==
Message-ID: <b81536ee-5acf-4308-aa22-c374c4a3b8f7@rootcommit.com>
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
To: Inochi Amaoto <inochiama@gmail.com>, Joshua Milas <josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
 <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
Date: Thu, 30 Oct 2025 12:50:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=69035efb a=oMt8lXEVxmMAvUTv2ASLGA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=qwwWCKxYK2TD6zjFQdwA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfNwpELjTKPpT2hRmqJcNaPWk81N8hSnY8Avz0V4rzyS53iFZkWJTT7Pe/VnUWgiWXf75c7PedFqG4YtNsCCFz9FBxE6WAyWJcIUFAaSgGtJrYxd06Il3 eXkCsPWR4B+muheKfLDvKNJDEh9xd4Z/9z40a/s+ngnQfXEfWxfqppYd1DcI3xZ57V8fmz85KeksQ1Tknsc3+skkLMasLVwVmUkpExW1KkgSlQyTbzCHeK54 v05gKnX6moG1Z7D5KBMgaETDP5KEfeT+GUl3Lt5rmsHaIrZn2OfrKx4OCPWhQlFOK8dBxPGiNXYLqy9I7U+RaDaZ7L53K/nMYkI+StWqZbhPL10GnuvjfObH ERsRgRRVu03Hasaxe2tIHRL89dCqoRPCwBPpGJapaEJlEdC/0yn2N4XFcgl4x1hloXyOWio7eCVcKaHfj0XngffvzJ3Df7RRQrxNwhGKBbX4d5oZFSwzNPxh zAAjD7MenjfzXT8FGyygcQimLTCga7XBFAb6lJKR6TQ2n2Er4AGjQLdyGZY5r30V/hEiH85iHCMH6MYcH+yh0Y5RsxpOg+B78eRskJ8B2ycUcS5Fp0sm5XOk F4xplmp3CwZ39+vEvaPRm4vZ5s+UKfccoiTtEowgz+29BCplw5kKBP7zcZx9EFTeB2sHYAr4WtnUww/u7ZEb+N4iKusQUFOMQVOe+srsBrzdCh6Bbo64TROF 4t+srDpziUQoaVBkVkPG9yGtLd7SZGp8yafhi2j5H/YznwyC/2uW2Ye0uBqIQtbbF0HiiXVx5dcnTlrXbMyMRm0wFGUVTWWog/fOlKZDUAvhjHUjryGE0ZL7 ye+kobiDGJVqj1c5owdFAAtE8yFGE1JvF/BLK9LhoM7az6nIeVNLxb1X/jJHxkAmTLaAUKAvAYjLUBClrR+VvCeyO0GP6be5l6L7yBfg15eo3h6tXo34H/tD n4NZ6Q==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055013_207252_257BCEA4 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi Inochi,

Thanks a lot for the guidance!

On 10/29/25 01:53, Inochi Amaoto wrote:
> In fact, I see the maintainers do not agree adding every possible
> configuration to the DTS, (especially without "omit-if-unused" flag).
> And in many case, it is impossible to add all possibility. As a
> result, I prefer to use DTS overlay if there is something custom,
> and keep the mainline DTS minimum.

I guess you meant "/omit-if-no-ref/". Good to know!

> In fact the priority is the thing that is hard to decide. This is why
> I suggesting keeping compatible with the vendor kernel, as many people
> starts with vendor kernel and it is a good thing to refer.
This makes sense. Thanks again.
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
