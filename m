Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3E8CDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83Fjs9Y15/rDafngp+YgcmHuq/W5tEEhFiJZ3vMzbCE=; b=a4GJ7nM8It9MTt
	hyvctpVRzpu6nhFLhArkENYUBoum7sRUUzXb6FlkDkGLpGpFJxTHAbiV1TJDkvWtM/4MBajIm1M7K
	46cOcetGOdtBmBpopO9GdfbUPgPFLC+gK1w5XyI4a0EUZKQIOors+fpf5BNqUZZOjbOvcX69v/MmB
	BSGCsn+BokmL6bpAUtunCBF4UMN8ROcb5seKF1X7sC19kWvPc1mTHFPskImiy3hGdnJUtpzHgAbZF
	uT4MzTbralgfR3HbBKqHpmPmUtR0LPcOKu4ziAM4GnITcEebaavu8e/fpCtmpVw8XyKONtf7ORWUv
	zJIBNJC80ceA3O9HufXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcopA-00000009gXI-3O2Y;
	Thu, 25 Jun 2026 18:29:16 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcop8-00000009gWu-0HVB;
	Thu, 25 Jun 2026 18:29:14 +0000
Message-ID: <60a7850d-1527-4517-aae8-cd5cbebcb9b5@infradead.org>
Date: Thu, 25 Jun 2026 11:29:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] Documentation: ioctl: add CMH ioctl documentation
 and register 'J'
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alex Ousherovitch <aousherovitch@rambus.com>,
 Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Rob Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
 linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, sipsupport@rambus.com,
 Thi Nguyen <thin@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
 <20260625173328.1140487-18-skrishnamoorthy@rambus.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260625173328.1140487-18-skrishnamoorthy@rambus.com>
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



On 6/25/26 10:33 AM, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
> 
> Add Documentation/userspace-api/ioctl/cmh_mgmt.rst documenting the
> ioctl commands on the /dev/cmh_mgmt misc device for the CRI
> CryptoManager Hub (CMH) hardware crypto accelerator driver.  Covers
> key management, KIC key derivation, PKE (RSA, ECDSA, ECDH, EdDSA),
> PQC (ML-KEM, ML-DSA, SLH-DSA), SM2, EAC, and DRBG.
> 
> Register ioctl magic number 'J' (0x4A) in ioctl-number.rst.  The
> driver uses ioctls 0x01-0x40.
> 
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> Reviewed-by: Thi Nguyen <thin@rambus.com>
> ---
>  .../userspace-api/ioctl/cmh_mgmt.rst          | 941 ++++++++++++++++++
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  2 files changed, 942 insertions(+)
>  create mode 100644 Documentation/userspace-api/ioctl/cmh_mgmt.rst
> 

One docs build warning:

Documentation/userspace-api/ioctl/cmh_mgmt.rst: WARNING: document isn't included in any toctree [toc.not_included]


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
