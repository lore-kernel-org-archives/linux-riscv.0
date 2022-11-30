Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE4DC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NkMVN7fcSups4untnNd4Qe0kBuDeWTvFNQ6fMui+k3E=; b=t32HF0flFccjpW
	yBm6IDowRALWltTwj4aqbwNI7giax31JI41RL938Cyn/KsYgN2IK8PZq62RprgxNa0q8EKFhECFkK
	v6NvBmJDpbJUH7+sHv+30i8xET+CcdW8STnyDq2Lg9OKWip+YA2lI5iZFh65vna4akzHFXFr8GFUw
	1n87A9AIH82iC5GND0LCa9ptZJnoGEj3ulSNyplx7Talc2jfFofSi16fNCRK2noPZ9WJdVI0270Fl
	agRp/vXSfLkozWE+yKafnh1mkLrXN6pv/rCURKEbz8ofI1PAio2HKu81aTfl+JudpeeDY2UdILp+y
	iExSYhffS26CUpmH62+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RTg-001OG9-Vu; Wed, 30 Nov 2022 18:06:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RS6-001MvM-PA
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:05:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 200CFB81C88;
	Wed, 30 Nov 2022 18:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DABC433C1;
	Wed, 30 Nov 2022 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669831493;
	bh=gbEP0d3/Dzbwbi8UXaAA6LqakazFzwGDxZhVIwGTAwA=;
	h=From:To:Cc:Subject:Date:From;
	b=gdRcWit9svEV1OMGEO104lxJKfZsPqZUsRQnWrIU5xchUhe2lTQeqHINsRIKgD6eq
	 anYmi1nDmX2AD8kxTWdfF/KNz9mGe4KMUlHYg4fEYo7xmhbU0yKhdJTMm9i8azTy2A
	 P9KB9PuW45tFhours+KC7ZoVqz1AP2Ou7C/bpMStDXCc2AQ/YBalUn6isD5Ixi09mq
	 Uv+rc+R2tp1ZG5HgpJj8tHnd3qtKk8ks4CzAXilJbXVyQm1PHzswrhD26Vs82awLz5
	 G3y4C4rx0dAt6NeSFq1x5rQEEI/jq1L0ESfAMYNmTomqmK7JJ4FimzCJdApsMbh/rw
	 QEqYPdHcKdPog==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv,isa fixups
Date: Wed, 30 Nov 2022 18:04:21 +0000
Message-Id: <20221130180422.1642652-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_100459_000177_53926A48 
X-CRM114-Status: GOOD (  12.29  )
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

From: Conor Dooley <conor.dooley@microchip.com>

I noticed ~today~ while looking at the isa manual that I had not
accounted for another couple of edge cases with my regex. As before, I
think attempting to validate the canonical order for multiletter stuff
makes no sense - but we should totally try to avoid false-positives for
combinations that are known to be valid.

All I've changed here for v2 is collecting tags & adding in the missing
commit reference that Heiko pointed out.

@Palmer, either you can take this once the DT folks have ACKed it if you
like, or I will take onto some v6.2-rcN fixes branch. I don't think that
there is any urgency :)

Thanks,
Conor.

CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Guo Ren <guoren@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  dt-bindings: riscv: fix underscore requirement for addtional standard
    extensions
  dt-bindings: riscv: fix single letter canonical order

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
