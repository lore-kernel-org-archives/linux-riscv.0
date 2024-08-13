Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE98C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj7579p0ZJ5v8LGiV0RHyQmAUstGVaKG1vdKv3M1qSg=; b=WwUgjIoAi4tCJQ
	j5ku+CL+DnvWKMQ9+VfAY53jlY3Az6e1otexUIKiPwIS1tIfUzHrEeFeLciL2oUc1QvYVgCPb7yE2
	BqRgoiEyoyDlVKf5AGb7WWtInF0GqPQt9lOIu0Wy6IkudnSgmszLO+72PLFYnRJ3qWfzt9TTtMyzc
	1rxmf1V4bgjR/vSMILQ3fwEslkOkCVQ64bE6UwwG+rZDWCUTZJ8xMrw5sSjO43rVDaROVtAqYyBUR
	f3ynSdy7MOT+a2bo2qNMRpMo/fflz7ymElrr9Kn885WhAVCtGBKsaen9PidyovUbeQ04bkE2h8I6t
	qEPspekyvsZ9bMav2bHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqTg-00000003fOY-0AbT;
	Tue, 13 Aug 2024 12:18:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqR7-00000003eZF-35Br
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 12:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0BEB61544;
	Tue, 13 Aug 2024 12:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966D0C4AF0B;
	Tue, 13 Aug 2024 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723551336;
	bh=hbeRrVh/SiaMC4JFosNc7lEIzxH+ImnQOcMEmvgeTkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSR9/3rGXfW52UDhzO1W5hWS+KUisEfOSJxYQCWCfmFM05OJYrn1QlhUhHsAQHSxx
	 2zVaKHhOyr0dlrY+LIKNZPgjYMuGVovGtrSR1iYEGDsXwgIKMFcSsMnIf2tVYgo4T1
	 J8HgbGtWNfzAD6vc3RXO/oLApc6iQrZfdFeWUz6TjBW3Zzx9KZsMgtAwc+YhRSH6Y+
	 NuXxL0uWmUCfVI0PLJlOFKET14ttb4n8Utg+eBybpVVMezKsQ/A6BbMm1LVUEE4DC1
	 ryVtG3uxS7Ju6aQsISU73psZZifirUeNwoAP4sh0gVEzXvhYq4f0gtmND7QTsWWpeR
	 dbdOu0Kjv5p8A==
Date: Tue, 13 Aug 2024 17:45:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 2/3] soc/sophgo: add top sysctrl layout file for
 CV18XX/SG200X
Message-ID: <ZrtOZIwszhJ9s8J2@matsya>
References: <IA1PR20MB495324F3EF7517562CB4CACFBB842@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495384C4A2F64AE100350BE7BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495384C4A2F64AE100350BE7BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_051537_861291_D851C5EE 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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

On 11-08-24, 13:16, Inochi Amaoto wrote:
> The "top" system controller of CV18XX/SG200X exposes control
> register access for various devices. Add soc header file to
> describe it.

why define the full map and not just dma router offsets in a local dma
header?

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
