Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7962DCDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xw18OZkyUjC4pPbo37d/RcYQ9gx5EE39e1WQPn3tFA=; b=lN0C1C/PiOlaOK
	6deLKPGnA6ysQAm0LS9pEJ8t6a3a4WtOxiS92MNrqSHSM5/fcT/k03WWKIu3K35scGAM9u4YvMFd9
	1ltQIKQxq2xCawcJ5iKOmYcv6ndsLgDk+C811ih8LlK4ZBAXYA0jwZCPLg+TBYIvU27Tt8b8LD2gD
	vamqTv5zbhlqNvlxwE8mPCDbjl1Dd5/1y373U2jHEfLO0i/3SDWXVQlvFyRyYXqMdrzpDxrB9HsPq
	utk9Xh6Ct4Kx6X00OIp0W/vFJawNDun3NCWKr6/XvFnPjV4/A0xUHpNIpTfz2isRwEGRRwpaaLsB8
	W66ahIqjd8ryl33Ii5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4G0-0000000B9Xf-0GMr;
	Fri, 26 Jun 2026 10:58:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Fz-0000000B9XJ-0GG9
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 10:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB0F443FC0;
	Fri, 26 Jun 2026 10:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7351B1F000E9;
	Fri, 26 Jun 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782471478;
	bh=ZTRPyMyzXJJHzBuvJUIeax1xIMpUkC2R+b5TUXDfLVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=My/1BS+sODPPWkKG5n35GpohqpvIdqpVm5jWKuOA91DwPIV4FMBeiMnXbIOLzlSQX
	 G47l2zPc1OhCTSS+gMbjyDBTIqPNhR+h3fylG7wpAEzkqYXY1k3JGpwuA+cfUKGL8K
	 O8V74f1xsA5AlIQ4dL4Zj/JnGhrqZrAzg6PjJs7LSCaDKpIYpv4d0Rv9WMZCFZeeVv
	 ndbOcQwcAxzq8jMCpJrxBR9ciJB5fLX1K5wx8/gIzBlNn1nft373kMpl1AWTuSuSzx
	 bGHH6RvfFgYN/vXg7EBPy9oUGrL8QbN2JZaNW0QWj4N5GyvcYPa0WihXf86QgEnS2c
	 BZFMyOzA0vlPw==
Date: Fri, 26 Jun 2026 12:57:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
	Alex Ousherovitch <aousherovitch@rambus.com>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>, linux-api@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>, sipsupport@rambus.com, 
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)
Message-ID: <20260626-lush-eel-of-election-5fcbde@quoll>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
 <20260625173328.1140487-20-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625173328.1140487-20-skrishnamoorthy@rambus.com>
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

On Thu, Jun 25, 2026 at 10:33:27AM -0700, Saravanakrishnan Krishnamoorthy wrote:
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

Are these people really provided you with Reviewer's statement of
oversight? Do they understand what does it mean?

> ---
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90034eb7874e..ecb389795e3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6797,6 +6797,25 @@ F:       kernel/cred.c
>  F:     rust/kernel/cred.rs
>  F:     Documentation/security/credentials.rst
> 
> +CRI CRYPTOMANAGER HUB (CMH) HARDWARE CRYPTO ACCELERATOR
> +M:     Alex Ousherovitch <aousherovitch@rambus.com>
> +M:     Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> +R:     Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> +R:     Thi Nguyen <thin@rambus.com>
> +L:     linux-crypto@vger.kernel.org
> +L:     sipsupport@rambus.com (moderated for non-subscribers)

NAK, drop. You are not allowed to add here internal moderated mailing
lists. We are not going to participate in your corporate dances.

> +S:     Maintained
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

Drop, you do not have commit rights there.

> +F:     Documentation/ABI/testing/cmh-mgmt
> +F:     Documentation/ABI/testing/debugfs-driver-cmh
> +F:     Documentation/ABI/testing/sysfs-driver-cmh
> +F:     Documentation/crypto/device_drivers/cmh.rst
> +F:     Documentation/devicetree/bindings/crypto/cri,cmh.yaml
> +F:     Documentation/userspace-api/ioctl/cmh_mgmt.rst
> +F:     drivers/crypto/cmh/
> +F:     include/uapi/linux/cmh_mgmt_ioctl.h
> +F:     tools/testing/selftests/drivers/crypto/cmh/
> +
>  INTEL CRPS COMMON REDUNDANT PSU DRIVER
>  M:     Ninad Palsule <ninad@linux.ibm.com>
>  L:     linux-hwmon@vger.kernel.org
> --
> 2.43.7
> 
> 
> ** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Heh, I should have ignored your message...


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
