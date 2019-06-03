Return-Path: <SRS0=uF1/=UC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9425DC04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 04:30:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CDE27B6A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 04:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euzfT7Be";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hSrYsDPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67CDE27B6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wCaLtbMlDLstE4iGdbv/oX+GPAhy1fu9N42dZyaR78=; b=euzfT7BeyARHn+
	PzzuSDWL2AdC9Q/wLk5N2aRSpcX8sEJqErx2FWT54bgC2tWOFe/GOIe0QhXq8M12MAo0QkiA7rZzQ
	gi6VKpY7bIngZ49++RajHLNcxanM4aiJG6+C+KPQKThWGSUJ03dZ2LjB1MnYikMYn6P682K0CMgFH
	DQuEbyRT6aNs2exXbANUw1AFIJ2N9QrT7J28vc5QX7EUspnUtUZUuk+sLLpOuL0P/Q5fXRbBwc0wG
	BMK9aNufK7IYm0+CkHj3+x0Ciji23IJBDKjdM6aWKxBAJVORDIZmyV2NkwQvE4VH4GVzGCuHKYbR3
	uINE8A8m64NC+zRUfPSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXeca-0001dW-AG; Mon, 03 Jun 2019 04:30:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXecW-0001d8-U5
 for linux-riscv@lists.infradead.org; Mon, 03 Jun 2019 04:30:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x534Ui9C000624;
 Sun, 2 Jun 2019 23:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559536244;
 bh=XCE8FuOjQTKbDWChgZDrjUr4wBNlOAOjCpOOOpmJ1kI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hSrYsDPxcBPlzQUWOH70qJoZY+D/Ts/UCjeQZs0pY2Kn3Wky8QWE1mbbJbe3sYYhY
 WM1/dCnPAWOoXR5rFVeETyx3U4C/DxQQb4y5NsR+8RhNdGPUGwt4mdhpm/Wsip3zVl
 wlWyTT9U2xd0YWIsJEZaIMlVRgwlJgT80fYxTlFg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x534UitW072751
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 2 Jun 2019 23:30:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 2 Jun
 2019 23:30:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 2 Jun 2019 23:30:44 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x534UbmT115561;
 Sun, 2 Jun 2019 23:30:40 -0500
Subject: Re: [PATCH] PCI: endpoint: Add DMA to Linux PCI EP Framework
To: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>
References: <1558650258-15050-1-git-send-email-alan.mikhak@sifive.com>
 <305100E33629484CBB767107E4246BBB0A6FAFFD@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxsQ9NXrN7W_8HVrXQBb9HiBd+d1dNfv+cXmoBpXQnLwA@mail.gmail.com>
 <305100E33629484CBB767107E4246BBB0A6FC308@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxL-WYz1BY7yXJ6eKULgVtKeo67XhgHZjvtm5Ka5foKiA@mail.gmail.com>
 <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
 <20190531050727.GO15118@vkoul-mobl>
 <d2d8a904-d796-f9f2-8f4a-61e857355a4f@ti.com>
 <20190531063247.GP15118@vkoul-mobl>
 <CAK8P3a2jePe7Qfjciq4fdfngAudzCb-cai4fr3_BG_evnbjhvw@mail.gmail.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <b5d5aa64-710b-3fcc-4197-2a2114266385@ti.com>
Date: Mon, 3 Jun 2019 09:59:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2jePe7Qfjciq4fdfngAudzCb-cai4fr3_BG_evnbjhvw@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_213053_052249_C1E9BCCC 
X-CRM114-Status: GOOD (  19.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alan Mikhak <alan.mikhak@sifive.com>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 31/05/19 1:19 PM, Arnd Bergmann wrote:
> On Fri, May 31, 2019 at 8:32 AM Vinod Koul <vkoul@kernel.org> wrote:
>> On 31-05-19, 10:50, Kishon Vijay Abraham I wrote:
>>> On 31/05/19 10:37 AM, Vinod Koul wrote:
>>>> On 30-05-19, 11:16, Kishon Vijay Abraham I wrote:
>>>>>
>>>>> right, my initial thought process was to use only dmaengine APIs in
>>>>> pci-epf-test so that the system DMA or DMA within the PCIe controller can be
>>>>> used transparently. But can we register DMA within the PCIe controller to the
>>>>> DMA subsystem? AFAIK only system DMA should register with the DMA subsystem.
>>>>> (ADMA in SDHCI doesn't use dmaengine). Vinod Koul can confirm.
>>>>
>>>> So would this DMA be dedicated for PCI and all PCI devices on the bus?
>>>
>>> Yes, this DMA will be used only by PCI ($patch is w.r.t PCIe device mode. So
>>> all endpoint functions both physical and virtual functions will use the DMA in
>>> the controller).
>>>> If so I do not see a reason why this cannot be using dmaengine. The use
>>>
>>> Thanks for clarifying. I was under the impression any DMA within a peripheral
>>> controller shouldn't use DMAengine.
>>
>> That is indeed a correct assumption. The dmaengine helps in cases where
>> we have a dma controller with multiple users, for a single user case it
>> might be overhead to setup dma driver and then use it thru framework.
>>
>> Someone needs to see the benefit and cost of using the framework and
>> decide.
> 
> I think the main question is about how generalized we want this to be.
> There are lots of difference PCIe endpoint implementations, and in
> case of some licensable IP cores like the designware PCIe there are
> many variants, as each SoC will do the implementation in a slightly
> different way.
> 
> If we can have a single endpoint driver than can either have an
> integrated DMA engine or use an external one, then abstracting that
> DMA engine helps make the driver work more readily either way.
> 
> Similarly, there may be PCIe endpoint implementations that have
> a dedicated DMA engine in them that is not usable for anything else,
> but that is closely related to an IP core we already have a dmaengine
> driver for. In this case, we can avoid duplication.

right. Either way it makes more sense to register DMA embedded within the PCIe
endpoint controller instead of creating epc_ops for DMA transfers.

Thanks
Kishon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
