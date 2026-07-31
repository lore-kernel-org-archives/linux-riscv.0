Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A7C55173
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZOEZPqEnzhcfHmecpWb2GXoprmywkrQ+d9h3syY0Tw=; b=B57cOwoYwpYAyY
	yvSbHuIsjw+X1BiQ4qLnCexyidmn0Noil9utWburkexLOIFQAGs1l6heookZlPTUwRXorWq8xf/k2
	kDPAXri2uLxnh6NRbnNr6EML9w1XNKxYcNKCceAnSY9KhlSOnemaGvTDhjNyyhE9clAPK1XtGnycd
	eMve4pz2tkMiy4f8PKyYHg0vlG9IDb0CQ6RGtEC8q0/1axX0eCI23RY6pr3t42frjsmKqo4LDPuZW
	jaKD+nBSdCLnkzLIZ9wJURcsZelylkY1c5gv7B+krPZ9SzT5ER6oykcLNz0iLgURbi4e2QsBhQrDe
	e4ZSgD4uHKQ16XTpZeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptdt-0000000DX9e-0g6M;
	Fri, 31 Jul 2026 20:15:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptdr-0000000DX9V-429f
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 20:15:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C202600C3;
	Fri, 31 Jul 2026 20:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246E71F00AC4;
	Fri, 31 Jul 2026 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528938;
	bh=smrkd6WlPJv3JC73FVVo5YhOrRs2gOUzXj3M5ZOEgRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XIcoKZaojCQn4oYN/6zTVYmRPSNCzbOLVpzRyBwgwI/99K8zS7znMnfzCqUKw7+M0
	 T1s3SJ7hHXQ/VX37y/O9+BlLsDbvSwO40LkwAtTHmPm1g+9AEFMB2MB/g5oyzL5awL
	 YDnYHEwx/JajP+UBhSW203X3nCP15Uz1CRG73wSX1P52/Tl/k6dBl6o2SGLSI7YqMR
	 IcG+XebgPbOb9jcGjOpTb+OW/1HE0EhAn1L6YERgoET7WD4TVio+iEMlBOXPoUl/ve
	 Fv6ZBkllGlPIciYVR0udlv/BoBK7mWi81Ll5gofBnTM1vf4AhOpmjzwc0OqhbHU00R
	 wd4zXcgupBIXw==
Date: Fri, 31 Jul 2026 15:15:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xing Loong <xing.xl.loong@gmail.com>
Cc: Jens Wiklander <jenswi@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add mbedtee
Message-ID: <178552893708.1585375.2477394564041706505.robh@kernel.org>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-2-xing.xl.loong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720073558.799755-2-xing.xl.loong@gmail.com>
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


On Mon, 20 Jul 2026 15:35:55 +0800, Xing Loong wrote:
> Register the "mbedtee" vendor prefix for the MbedTEE Trusted
> Execution Environment project (https://github.com/mbedtee).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
