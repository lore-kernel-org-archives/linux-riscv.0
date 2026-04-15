Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413CBF9D0FB
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZjPtw9xWkePOESY0Ol9TbxZe3B+SQFdIK/zVpxyOLI=; b=Gyvfschr5aX7v1
	NERbHklOxs1chYQtHTLdkUA3Z8CBPC55s78dZ9nqhq6Y0zANu9L9YGTGVJ41Hiu5aw02I8J31s+Tu
	YOKr/RFJg3kfAhfEB42sN7vySHDar/zB67dTP25nCTLmSc3yE2wz/dgUT21NIMATa3ZD84dqnTqAg
	hv9tBHGe/2xR2XMVHdYP2U2pkZygkm0nMM5QoZiWqlGOLdSQk9qRBbaaTGHjqk/cSys9XLybfCQNT
	QojacD0LwFDTyx+2mIr2tfqcr6n1nFp1OtNE9HmDcw9F84U3Og5We+FOtuhisqD5HC+GNpv4pK3RJ
	3bi9elkqmCt6WyT8Svrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoG7-00000000Nu5-1oIG;
	Wed, 15 Apr 2026 00:37:35 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoG6-00000000Ntv-1oq7;
	Wed, 15 Apr 2026 00:37:34 +0000
Message-ID: <81cf7a52-cfaf-4e2f-9711-a8593ee2843d@infradead.org>
Date: Tue, 14 Apr 2026 17:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
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
> While the maintainer's profile for tip is there, it is not
> at X86 maintainer's entry.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 620219e48f98..a85fcae5f56e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28560,6 +28560,7 @@ M:	Ingo Molnar <mingo@redhat.com>
>  M:	Borislav Petkov <bp@alien8.de>
>  M:	Dave Hansen <dave.hansen@linux.intel.com>
>  M:	x86@kernel.org
> +P:	Documentation/process/maintainer-tip.rst
>  R:	"H. Peter Anvin" <hpa@zytor.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
