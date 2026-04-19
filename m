Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB13F99C98
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 00:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiWENTg8nqbwWo2tY8W5b68gQeXFfdrJABMdSpDJXQs=; b=qH+Cz282Pqg9Xp
	QAlGggF5QikCnrI1u9Ut7QLn2kEQDf7PUmaveScvgwryCy73mnknCBtSDt9JisCqExb/sdPW3+/Uy
	qOYN5vILsAWFzzPp6D2UeQYboB5VHbA3G3xvujr1uWvOvdajfyCComUeQ5qhyPTUOSHpgDOSbBxoC
	lJM/qLA/Ndos7SZ9WY9ApuM/wt2f9hA7aZMMETKGJUtC2BKTXtMZQ8Vqv6imNstS9TT44kq05m7gi
	Bxz6RflB6HXWeffZPdkLYr7kxcwPC3jWWw2+eWyaJ7RsUV0rmg0hdANNl3zCe7fdJMo2QbXIqqwT6
	lieqSpQjhAkB/cDg/T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFco-00000005LjW-1HoL;
	Sun, 19 Apr 2026 00:02:58 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFcm-00000005Lj5-0LDa;
	Sun, 19 Apr 2026 00:02:56 +0000
Message-ID: <63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
Date: Sat, 18 Apr 2026 17:02:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] MAINTAINERS: add an entry for media maintainers
 profile
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
 <361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
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



On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> The media subsystem has a maintainers entry profile, but its entry
> is missing at MAINTAINERS.
> 
> Add it.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0b106a4dd96..620219e48f98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16115,6 +16115,7 @@ S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media.git
> +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
>  F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/driver-api/media/

I now see 2 P: entries for MEDIA INPUT INFRASTRUCTURE
and 2 P: entries for X86 ARCHITECTURE.
(don't know how/why)

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
