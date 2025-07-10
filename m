Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D97C83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vr2jMy5etE9DbVbBVSBbR29fVDA+zrhXqCk4NEorygY=; b=evVqidAJIT25Kh
	ItXHI0hyYyfApqJy5uDBnHJVFhGs0zam6JBsw2oZRIrR9OXSQ70ECKPqMSmQVo+vU9DjSH/o0oH5a
	DjZtPsWEQOtL8Syqz+dniJMKL7ZNyNxwMSJSdyVxtQTGyusH+7ibqc6R/jvupi4e2p+9aNm9MyBe8
	JNSR2MJ0eVgXWEoIm84lsusdEqHEYCUgluFjy4aL0DTzWSN77WxwyVm1rI3MaJR47wuioWSA7kYoA
	+3WgOs1GRWM2EvjxBlMoxAiE/pmpgeoGb1p3NSwVcS5v+4wbxCOwA4EM5ZFtI8G5n+z2dqXEi3oH5
	skJnmC3ldBaZablul3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrbB-0000000BzkW-24Jf;
	Thu, 10 Jul 2025 13:46:05 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqLl-0000000BlFO-3AuT
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:26:07 +0000
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id ZgZwu77k1bmnlZqLYu7F6s; Thu, 10 Jul 2025 12:25:52 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id ZqLWuydCIlLZyZqLXugBiq; Thu, 10 Jul 2025 12:25:51 +0000
X-Authority-Analysis: v=2.4 cv=bNXdI++Z c=1 sm=1 tr=0 ts=686fb14f
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7vwVE5O1G3EA:10 a=h0uksLzaAAAA:8
 a=HaFmDPmJAAAA:8 a=GF-RUcCtsk5XG7IKrCkA:9 a=QEXdDO2ut3YA:10
 a=MSi_79tMYmZZG2gvAgS0:22 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/EmhaQofK3G5RuwmtT2ZTkTGiMdxnAebPcNinPkshuc=; b=dsZfvv9DsCZ0cLphiEKGotRIgO
	knyc3vtz0X6m8X8wA2lV5seag92PCqibQstlF8kYw5RjtY3PvYaFiTRSmDJrkCONQbxTW+nhL5G8l
	qnPDIxqn6/34uUF0VAnbuGeQ6huII/XZPlrSTPTP5Mxl4EXMD5817ABLODnW5Jh3t1ekapevxDKwJ
	dlVhyaiRHNLK9PzHwTxYOl8va0MUhJ3QLzJ5mBZPNmY790Wn1rkwtrzeQyDPlrr8Wf5KY/5dRkMRJ
	BzDUrC0JEAEQbmnKoS9YTBEfokAuz5ARRCDAaPQYPESUWob9a7ce7lIP+TwBHgYHDj7XOUzfL5mS2
	dMWMeN3A==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:39722 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uZqLV-00000001iV4-2pER;
	Thu, 10 Jul 2025 06:25:49 -0600
Message-ID: <5cc4fdb6-9a4c-4937-9878-7fcd3d3f0a05@w6rz.net>
Date: Thu, 10 Jul 2025 05:25:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1uZqLV-00000001iV4-2pER
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:39722
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMK65pPFJsvAIImXy4H5Ek1w1Co9jTha/aC1RBmO33wZOWfBNnviAxsnp/HKndC0jHULf/Fb2lhgZLcjzmHy9nD/dpSUiCXOwLGUqyQz8TEHk1iMk4lD
 bsgH4SWVDirBs8Plhmw/dhCz/G8yrFNwwW06T1y2ci31LuaWvExF/kJyjOc0Arbmq61HbBGTCkiF/AWwoz7HMAZnj3k9cTzfc8w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052605_929615_6AD9514A 
X-CRM114-Status: UNSURE (   8.91  )
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

On 7/10/25 01:34, Alexandre Ghiti wrote:
> Even though those relocations should not be present in the final
> vmlinux, there are a lot of them. And since those relocations are
> considered "bad", they flood the compilation output which may hide some
> legitimate bad relocations.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/tools/relocs_check.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
> index baeb2e7b2290558d696afbc5429d6a3c69ae49e1..742993e6a8cba72c657dd2f8f5dabc4c415e84bd 100755
> --- a/arch/riscv/tools/relocs_check.sh
> +++ b/arch/riscv/tools/relocs_check.sh
> @@ -14,7 +14,9 @@ bad_relocs=$(
>   ${srctree}/scripts/relocs_check.sh "$@" |
>   	# These relocations are okay
>   	#	R_RISCV_RELATIVE
> -	grep -F -w -v 'R_RISCV_RELATIVE'
> +	#	R_RISCV_NONE
> +	grep -F -w -v 'R_RISCV_RELATIVE
> +R_RISCV_NONE'
>   )
>   
>   if [ -z "$bad_relocs" ]; then
>
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250710-dev-alex-riscv_none_bad_relocs_v1-ba6048681836
>
> Best regards,

Works good.

Tested-by: Ron Economos <re@w6rz.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
