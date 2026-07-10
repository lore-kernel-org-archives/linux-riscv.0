Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84CFC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 01:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxsKRT9X8LzOBHGbf5hwF3QyuU1zIBZtR5i369MhmGE=; b=mPSWpd8PRvcuV8
	+OgJki67OCXM1Y4//ixuWvlRZmdbjcc/g/747mCdsc6RmT/key2iGe0ObfvEozWIUJ/EudTfeGet9
	9n6c5etVmunV4Rr9hXOR1HANIdx9vt5VUKBuMlxqjqA1ZF1Nd6u5AvdX2qt0UwZb6WxJIh+AYuT8n
	Zburwp+p+mVhqgNYKLFTE0dv9nLne7sKMk9ttWjmCVShnhyDYDF6IvcxPdo+toCQJWay+sJjth1o5
	Qp/2liklxDylMTcYiikJzKx3TmOJHhUxRiMCMnRul+M9D4BRJ8GPEHEGtKMka6rxSR0j7enFuNE1Q
	d3CsX0UtZBBVMpyRGN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzfh-00000003twp-3k99;
	Fri, 10 Jul 2026 01:04:53 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzfe-00000003twW-1ujf;
	Fri, 10 Jul 2026 01:04:50 +0000
Message-ID: <fd2e3b89-339a-4964-9b0c-e24ed7f7b31f@infradead.org>
Date: Thu, 9 Jul 2026 18:04:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alex Ousherovitch <aousherovitch@rambus.com>,
 Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Rob Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, linux-hwmon@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
 linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, Thi Nguyen <thin@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-20-skrishnamoorthy@rambus.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260709203037.1884436-20-skrishnamoorthy@rambus.com>
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



On 7/9/26 1:30 PM, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
> 
> Add MAINTAINERS entry for the CRI CryptoManager Hub (CMH) hardware
> crypto accelerator driver under drivers/crypto/cmh/.
> 
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> Reviewed-by: Thi Nguyen <thin@rambus.com>
> ---
>  MAINTAINERS | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1dbf2f07104..1c153a84f70f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6891,6 +6891,23 @@ F:	kernel/cred.c
>  F:	rust/kernel/cred.rs
>  F:	Documentation/security/credentials.rst
>  
> +CRI CRYPTOMANAGER HUB (CMH) HARDWARE CRYPTO ACCELERATOR
> +M:	Alex Ousherovitch <aousherovitch@rambus.com>
> +M:	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> +R:	Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> +R:	Thi Nguyen <thin@rambus.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/cmh-mgmt
> +F:	Documentation/ABI/testing/debugfs-driver-cmh
> +F:	Documentation/ABI/testing/sysfs-driver-cmh
> +F:	Documentation/crypto/device_drivers/cmh.rst
> +F:	Documentation/devicetree/bindings/crypto/cri,cmh.yaml
> +F:	Documentation/userspace-api/ioctl/cmh_mgmt.rst
> +F:	drivers/crypto/cmh/
> +F:	include/uapi/linux/cmh_mgmt_ioctl.h
> +F:	tools/testing/selftests/drivers/crypto/cmh/
> +

Hm, I thought for a moment there that this new CRI entry was out of
place (alphabetically). No, it's the next entry that is so far
out of place. :(

>  INTEL CRPS COMMON REDUNDANT PSU DRIVER
>  M:	Ninad Palsule <ninad@linux.ibm.com>
>  L:	linux-hwmon@vger.kernel.org

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
