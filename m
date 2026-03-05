Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BF1F3D302
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kwj1bAQrP6kLEqZS3C/4uFDl32mMeNNufnjzdvMRRJo=; b=qbY7mjFZqm97hl
	alUVX4nYYljW66WiT/t9UFWyIlZxdCXu3li1kAzClj+jHve+zXdC+wZzp6FfFyEatPpdZZDYOD2VM
	L3V3/7NgGwzXSpJOMwOQLYFfIoaO/2NqKGDzti4w571dd4/WvaGBWjELDOpN85nbhAVhIDFmUB2D9
	ES/4/WWb0apWLtwpxT/r63sPpT9M8JjTM1imCuJ+cO30u97FHl+SrSg6W28QF7CExuJ2/oLbT5LrK
	/Z6K6TygVXPk0dmXOWm8+YFtefbLf7SnEQxNanJSumy8NsbQ3KULsrHARyFqbnmpIBpm/Mr+0ThVb
	bUba6un7YAq6EnFOs3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAkE-000000027sw-2IvA;
	Thu, 05 Mar 2026 15:36:10 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAkB-000000027rr-2x7G;
	Thu, 05 Mar 2026 15:36:08 +0000
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 9322C14014F;
	Thu,  5 Mar 2026 15:36:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id E35031C;
	Thu,  5 Mar 2026 15:35:55 +0000 (UTC)
Message-ID: <21e84301a7c37f9d5ce6f0ddcaed7846174d2a4d.camel@perches.com>
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Thu, 05 Mar 2026 07:35:54 -0800
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
	 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
	 <20260305085148.7cwo3yflp7vcfldf@skbuf>
	 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
	 <20260305114352.2f7btqixg4tu5bzl@skbuf>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: hdghxtayq5bkfzsomxmnfbydyyebzipf
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: E35031C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19f3I+nQL7Hl0m6eSD18a/IIsXK9f3qkJo=
X-HE-Tag: 1772724955-671908
X-HE-Meta: U2FsdGVkX1/X7uxRzGLN+IX8WCZcO8p7ZTfkKmYNWBtz0ybputMaHEYE9yjxoGJ588aNvqlmxPrL8260emaV8dmXUI0e+INEtvEJY25I/Ej/PwqlxILke5yF3tqaj6xtvov8nI2F5oYM0uwbLv+6+skyh/sdJqBRUfJJKxLUzixxjwVPNZYZfPXpcC3lGcz5BMW1nsCCc9lzUvpFfMAODgtiRdX4Al8waTK8ABKVHmTqbt8uPB5EPbopscO3f/XucT2DdozpyI3LxZQRIQw7tIxAWEpzWgj98RYMI3rQa9CVBr40+v4Qte7+qYx1OCa5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_073607_798133_0753C9FB 
X-CRM114-Status: UNSURE (   3.81  )
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

On Thu, 2026-03-05 at 13:43 +0200, Vladimir Oltean wrote:

> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b

You have (?:...)?phy(?:...)?\b

I rather doubt you want anything that ends in phy

That matches words like cryptography and way too many dts/yaml files

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
