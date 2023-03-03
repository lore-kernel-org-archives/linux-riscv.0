Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244D1C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzPwHv0WIV6GwwG6fwySppH5JyHooOG1rUADcwWV1ag=; b=rJ2jJjELHuCyaw
	Fjx03UUc+WYvll35XpJIoR0m+i6eYAI/XbE920xXmJ6772voSrxj95W9DLDxHTdLRPBYPMsCKHO2f
	W+JRckk3jiSvWS83PLfAyNzxEHiVot1y3PmT+SCVwfTxLOmyNefMQPlfJOHst5pq7q0t2CQs4emmV
	ZJXKeaiKrg71wIQwr/mJmTwjD5NGMhPq3KXfAdYe3xVRMecJrVghaaSZx5aDbb4MMHWr19r3GYrPD
	ZiNMmfFc59NFuz3V7cTLkJcQ5SyUdGdj8doRMQIP0XPgD2JTY60ogyyHV3VTYSp+y1CAkdXOcnkmi
	ooNceBFnbx3vu7yxiiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3y5-006ECY-Lc; Fri, 03 Mar 2023 11:52:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3xv-006EAC-NA; Fri, 03 Mar 2023 11:52:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 030FBB81699;
	Fri,  3 Mar 2023 11:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E366AC433D2;
	Fri,  3 Mar 2023 11:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677844364;
	bh=dOfthFgjanTbWKs03Eh1I2lHx5A5iFcuCYKISeVUrPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j66UwYq470IS2IBw4Jw7a0QE+/mR27aaEyRAxVyWUHH4UrOpxPyi3yRWzzUStaKLB
	 wqEiqh5QgyzMzLHIi/iT1TLMyXmoJVIHMranT1VvEhb25H1++rJ73CDqCvf+l8Fidi
	 TxtbbW3H+P3SpeMEuC9URemmq+5XuYXg0vi0QIDYBHuieSwakhi36xTczfSEjo+Z01
	 HZ/YdFbk5tKHv6fc7dFKICaq5uEuUWCrtGJdWNuYnto17Lpf3iIcvm9yErTZfs1MC3
	 L3eyIb+am6CKihsSBjTz5k/Zd7RTc2XOwcCAH007nlJTiLH2zat862DR/8hhnjcqB+
	 bJi2/IqAshASw==
Date: Fri, 3 Mar 2023 11:52:36 +0000
From: Lee Jones <lee@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 06/12] dt-bindings: mfd: syscon: Add StarFive JH7100
 sysmain compatible
Message-ID: <20230303115236.GH2420672@google.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_035247_937654_A57D2128 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxMSBGZWIgMjAyMywgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgoKPiBGcm9tOiBF
bWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+IAo+IERvY3VtZW50IFN0YXJG
aXZlIEpINzEwMCBTb0MgY29tcGF0aWJsZSBmb3Igc3lzbWFpbiByZWdpc3RlcnMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJv
cmEuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5
c2Nvbi55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGll
ZCwgdGhhbmtzCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
