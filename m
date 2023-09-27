Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAC9E82CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EXghiXWYyNlXUelKFOJ/ZYWf3Bzz1MUkYtvK4fq9Bio=; b=Y6yzGPzAcxFpsw
	jxYH4W5HmH/Q/zBTq0ETlqwZglyYiPQoOru9bK1RvadrdwN9pFelc1NYx+rrgjaqWmRyfdHjfbeWw
	4P6TJTr7R8t78HtvuFqIUHqvT9S+Dlf/3VdBdNyvS53xKFLwwWk+XzXtHFFZV6TzAwSbWS6c7wDJq
	F70E1Hv4fqXZVSwOh1nIIDIdZSAfwxyA74pzG5HyQMHPr2cKc49t+xb4/12ZM2VXc2+eF2CTSMr1n
	4nPBBLxH2UBIQefflcLku9Eks9AXcgqWk6sIRxVN33J5GIuAfchGpJEGzwTNrWICXHfa2ou27wq+7
	+px6HtCSRVy/Lqfk8Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXnz-001SgI-2f;
	Wed, 27 Sep 2023 16:54:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXnv-001Seo-25
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85E37CE1877;
	Wed, 27 Sep 2023 16:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9649EC433C7;
	Wed, 27 Sep 2023 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695833664;
	bh=PbWliIL+YkhZx/7SImI4k4hkB5SastFowOtRO9Imz4k=;
	h=From:To:Cc:Subject:Date:From;
	b=T563OrhTCvY+vjXfbCikSv8n5+yLYxvGgPRibY122ZnVcMDfS0NfEwpkXZIuN2nJl
	 i1xO/bzNLvdXZAFzvRLj8VJCxNYxg596/v8jBCmPK49XwEPTqT8axX9q4sOoI7+5E5
	 kmjov4C/ihxcWw1ZUrTYjGUy2zbhnXBTwAroo00pXxzoen/Rn6QNHA5an/aCNCEyS0
	 DBvSAxEIuXjqwzF54vFm+nrhwod7Z9sp/1n5lLgFRRHnV0fJ76dhMuv2O4UJpk+eUp
	 eWR7+NsfInLgS3L8Z5zgLZ/MIzkZejSaXv7poJ8so6lad4vL5eFHjgkl5RCjkqytxl
	 mySyjpQeih4wQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] usb: dwc3: add driver for T-HEAD TH1520 SoC
Date: Thu, 28 Sep 2023 00:42:20 +0800
Message-Id: <20230927164222.3505-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_095427_881546_D9C3167A 
X-CRM114-Status: UNSURE (   9.01  )
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

Add the usb driver support for T-HEAD TH1520 SoC.

Since the clk part isn't mainlined, so SoC dts(i) changes are not
included in this series. However, it can be tested by using fixed-clock.

Jisheng Zhang (2):
  dt-bindings: usb: Add T-HEAD TH1520 USB controller
  usb: dwc3: add T-HEAD TH1520 usb driver

 .../bindings/usb/thead,th1520-usb.yaml        |  73 +++++++++++
 MAINTAINERS                                   |   1 +
 drivers/usb/dwc3/Kconfig                      |   9 ++
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-thead.c                 | 119 ++++++++++++++++++
 5 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-thead.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
