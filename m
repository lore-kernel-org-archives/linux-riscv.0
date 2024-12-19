Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8293FE77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFrns8qkvCojRefvTnvySZKz1d2+zwFTGjIz0rrb080=; b=dJWz9W6V707lGR
	CZm4Gst1/xE/uRshjp4z/9OP84lDAlTcYGBdcdKrmAxMr/AvOGLwIWw6pq+1kVOx6qhHzTwbgMPZN
	0oS4qFltFXuFXaud1ZDysxBLIqAkz4iYrK9dKePesMo3DxpZ0XxQ//O7UEZC772bRdqAxDn7nw3eP
	AZ7SLEy1tim0Gl6pfoS8CKQ84VSmmIFeVZ51bd/Y5lXddbBts159tInyWD5rfHaq4Y1ZVwqp2sMOh
	H3g+4kw4FO0g+Csz0Zouis+jgi1wnKaiB1IqKbPe+fzmrKR6vtYuReXibOtpbxWVSLgPxDhsT/EM3
	UwmYQaiTMjSCVHJS0GrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG38-00000001shF-3QW5;
	Thu, 19 Dec 2024 12:54:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG36-00000001sgU-0K00
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 12:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFD71A424EB;
	Thu, 19 Dec 2024 12:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF04C4CECE;
	Thu, 19 Dec 2024 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734612879;
	bh=QbcwzbIEpjte2iFXKxqrk0jjbLfrGXBlg4IkPxK3tNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1pAL3L/dM0IEAwgIV2DmfJfoYYdUbv5+rQ7jg7KbDVhyc3OGnNrxE15+tXDsMCPx
	 I7fqXbJYJ4p5VAg4Hhzd8/NcKR3WSn+RwKYviMWteZa43zY7ocevAIjQjCJy2T2ZXn
	 uSqvTn8ydP//D8rbvKu+wkqeNOd4DUXLoFLu0Vv0P71/qQjycaYLq/I972KJs3U7JQ
	 Slvsn4/6yUFCTalulCmDRp0dZXWKZ4K42izWBrJDkQwdtV78j20StyicukNQPxvKq0
	 oMNGLDnzAafTfyKhZgcIv9S1FTgqVtSzgY53yQtv1HUrmki3fxeC6F7nmk6YBX1/Lt
	 7jDzijTmJwOLQ==
Date: Thu, 19 Dec 2024 06:54:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, krzk+dt@kernel.org, jassisinghbrar@gmail.com,
	conor+dt@kernel.org, paul.walmsley@sifive.com
Subject: Re: [PATCH v6 3/4] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox controller
Message-ID: <173461287564.4047591.10300398593829922970.robh@kernel.org>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
 <20241217113134.3508333-4-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217113134.3508333-4-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_045440_182066_BDB3B0A5 
X-CRM114-Status: UNSURE (   8.29  )
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


On Tue, 17 Dec 2024 11:31:33 +0000, Valentina Fernandez wrote:
> Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> mailbox controller.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
