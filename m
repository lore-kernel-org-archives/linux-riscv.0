Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEBBF9D0F6
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 00:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxyi4MDM0dNESJQXdwMqNFdUGQgU7hR6DH5sXf7oMj4=; b=UAAPSWZe/JUKyM
	YBcK0jKM4ZXX8wA6knVoJWtC/AEIfcBx2qYsr2yZYkxC4ne0mxtfKhYNPNTo63BTLs0dgAgnJiWuK
	qmL9BQdQ8SVqLUsqH/T/WMldlNrnaIzpD94n8y+WVFD0kkRMdjsV4PicxH/t7Q12fCayIe7fM3ljM
	qEdJJetwO3VLUYjbe4+/VXMCA5pjfccl6FkiVMr2MsLpG3DQw+iT7lxlVghpkRl5jAnN4iJQThVRX
	MI1JD6xiqEIkrQMfUcU6jLLQPDgz0KRjtmJzQSz1GIsXnZHNVT8dqY1A0F5KnMBPz3H9z4Gyxbva+
	1V4o/P7AbM56KupUOD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoGB-00000000Nve-30V4;
	Wed, 15 Apr 2026 00:37:39 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoG9-00000000Ntv-36BF;
	Wed, 15 Apr 2026 00:37:37 +0000
Message-ID: <1e22f13c-01c3-4fd4-8e8e-1c5ef40c27ed@infradead.org>
Date: Tue, 14 Apr 2026 17:37:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] MAINTAINERS: add an entry for media maintainers
 profile
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
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



On 4/14/26 7:29 AM, Mauro Carvalho Chehab wrote:
> While media has a maintainers entry profile, its entry is
> missing at MAINTAINERS.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

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

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
