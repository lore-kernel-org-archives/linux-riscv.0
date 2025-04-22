Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77151C369D9
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRrjESURa6Il/4Kx9Pq5/l7hvveJmVJ5QPNtQklvWhk=; b=G5MLWoJU00VuiY
	oL5W1CBMxHZzqd1MsSLCPAZUPHdDdV2rZUatuRhbZPHh8elvn04fCjbzEZ+jjaFfSDFCRPuzBFMLV
	LGlN45LcGGIWyn5407UP+Dxkiusi8MVhDH6aDyWq5NhkBHG+MrMDApzqfho8bPpkjE+AIPgD+8+v3
	Bt9+++PINmfHOYEuKJlcQYZfYWlCCaPEGWy+i5lPrxilhcBekkmQX2oVLYcH5WKV5k9AykuvaunD8
	XnCKcZCC1qs69VVRdxM6or/tQsGF7O9CWNqsT95CIwdD6M/2q0L8IBr1Ud4VKqQAmicoZLE8RoSuR
	CkRKu2SMJJFU6f9cL/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FHq-00000007ecg-19y2;
	Tue, 22 Apr 2025 15:11:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7C-00000007OKC-1MhC
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 13:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A610D5C546B;
	Tue, 22 Apr 2025 13:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD3DC4CEE9;
	Tue, 22 Apr 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745330205;
	bh=xJlyGlnTsnJ9Pp7pikKgN/l45mZmZ7KWpkphwcDOGAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOY6AT4FzIEvYYR7UyvgUUKmT4OuKcvmUXY4a5Jflwq0C6Fz0QjXK9fwBMa9SX54/
	 elyvEwDp4LzXbwZ2/7NfaaTOqeSsTcyOgaEwMUksHz4Mwyq2YRUuNFkuGL1muHICuV
	 gatW/CcEUndSrrSuZUc6fak3b5uSPGcQoB7mkSmbiVkrBrIkJM4EMlssZZlcAPJQtX
	 K2TaZr/h+HItpsX1YYAj8jfaBqPJsnclgXiW3C5ZJZ1Wbi6EqRfRpAYbujNzGWORfZ
	 DePaJd8KWWDRVZhJJi2wHU5EjG/c9EOQPmL03mS8iSCI26A+sMYuKwqkT1zqtwgmo9
	 48qGzMM6r57dg==
Date: Tue, 22 Apr 2025 08:56:43 -0500
From: Rob Herring <robh@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <20250422135643.GA1132004-robh@kernel.org>
References: <20250418022948.22853-1-looong.bin@gmail.com>
 <20250418022948.22853-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250418022948.22853-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065646_417339_BC556692 
X-CRM114-Status: GOOD (  10.54  )
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

On Fri, Apr 18, 2025 at 10:29:44AM +0800, Longbin Li wrote:
> Add compatible string for PWM controller on SG2044.

That is clear from reading the diff. What would be useful is details on 
how the h/w is different from SG2042 (and hence not compatible with it).

> 
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
