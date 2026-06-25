Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4929CDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4I10wSQDTPBEXuNzpP81Iu2Nyj83gLgEc5NoAiyPwU=; b=o0gJhv78IjSIW8
	nSb5o++4sff0cj+dd5p/rdjoHScrqzGj+o8dVvr/692hadk3dsK1Iw6Zjmbt5TYZ24smKSyIyRih0
	utwnyY7RuWxeKhQYPIkb4bsgEOTLwSOaj7qvFdsyH0c/NMyGp6HHSgI9nk22DjhSLd9ZHQRBHOFb8
	HCiEMiJY2XFXSY0Zy/vaWR95Er6lbda6feCuOc5dlFa5iz3C84sq5JQPH8xWtqq5mLxlTXSWtAIT3
	z3VbJGvYlbFoedcgfWDGoWJo/0bPZ0E41gUy7k191QlWmHENkiejicctlIGB3aIDglZ9BiMSN3Dx6
	op7u2A+ZG00wbxiAleEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoSY-00000009exX-19Ex;
	Thu, 25 Jun 2026 18:05:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoSW-00000009exN-1OLz
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 18:05:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70BC4600AE;
	Thu, 25 Jun 2026 18:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517B11F000E9;
	Thu, 25 Jun 2026 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410751;
	bh=GPj509ZMrtTNp459KDd1Tt1hl7NhkDgoFuECeU/F1ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y0Dulsv+tq6dpOQYJPHD9uJzO92mLf7cUS1Y7MmHCGqrbzdASqZgDnkOi574uebM3
	 XRAiX4p8OnoRELCT3ZgT88aEJyHyeNtQ39O+JZJosNmw1YKYYr0coSKuR5qlkFgjjv
	 Nj5xn9GYkKUOTjrqTfgPZoOFhZoqMp2VaG52/9Lj5dMqKy5yTejWIIDHymKkROHO4f
	 mTLjEYe/qJURoam9/rbWSgdhkPIOizYT20Ol0bsuOi7d3mEuvrxzdEpVRZCRFl17zL
	 /7mfG+3C93DaNWt3rt5cwwMXKvSCbLHogRpIqCc+kUpTW8H9uXSV4YAIbFK1hqKxEV
	 en578ajw1UoYw==
Date: Thu, 25 Jun 2026 11:05:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alex Ousherovitch <aousherovitch@rambus.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>, sipsupport@rambus.com,
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH 00/19] crypto: cmh - add CRI CryptoManager Hub driver
Message-ID: <20260625180544.GB2514@quark>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
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

On Thu, Jun 25, 2026 at 10:33:08AM -0700, Saravanakrishnan Krishnamoorthy wrote:
> ** This message and any attachments are for the sole use of the
> intended recipient(s). It may contain information that is confidential
> and privileged. If you are not the intended recipient of this message,
> you are prohibited from printing, copying, forwarding or saving it.
> Please delete the message and attachments and notify the sender
> immediately. **

Okay, I deleted it.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
