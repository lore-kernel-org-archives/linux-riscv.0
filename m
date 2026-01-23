Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9525D6CFAA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOuD6KZsHYklUDzi9sdSfsh3Zw0BiTZR2GpdESlJfB8=; b=z5fx81eVm8sgV8
	xXyz5jgcTbhB/iJ3FGYdzPwiH+RAOgN8V9bVkO/QiKs7qWepN09jPxNtUXEZS6k0daFYmfxAa6Sv+
	h9wbMpFG/LZpD/V9a7CpAlp+UR1osq5XaU6EzpI8nm2tXd/pUM+HXCJL+eZTlMF3VM7yjT0JPwo0M
	t7NPqEBcwXIetCM0ln5LftojmdQdCBrCyYPTMtlqyJHWKzibGivgdk9egAK98gSmJz5OG5DN7lpS7
	QgeeDspAIUZWlt8NJyjy8ODUEJWohZem6CSqTMXRBRepeqIgjqqiSFiVVPSG2K/acwwFpydD2uNF1
	7eVGzJp6drQ9BmwewM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6dR-000000081Ac-0o6f;
	Fri, 23 Jan 2026 02:10:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6dO-0000000819g-0JEm
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 02:10:52 +0000
Received: from [10.213.20.56] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowADnkW2g2HJpLjjaBQ--.18034S2;
	Fri, 23 Jan 2026 10:10:42 +0800 (CST)
Message-ID: <c77a150a-4ad6-4765-9852-ce5e3408c29e@iscas.ac.cn>
Date: Fri, 23 Jan 2026 10:10:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] net: spacemit: display phy driver information
To: Andrew Lunn <andrew@lunn.ch>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dlan@kernel.org,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org, pabeni@redhat.com,
 spacemit@lists.linux.dev
References: <b4e0b1d2-cd6d-40f3-89fc-c1bd41c82480@lunn.ch>
 <20260122150601.586846-1-amadeus@jmu.edu.cn>
 <4493e09c-e4fb-424d-a44a-1e4d4510e4e2@lunn.ch>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <4493e09c-e4fb-424d-a44a-1e4d4510e4e2@lunn.ch>
X-CM-TRANSID: qwCowADnkW2g2HJpLjjaBQ--.18034S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFW5Kr4rGrWrCw17Cw1rZwb_yoWDtFX_tF
	9Igwnxua1UXF4kJw1ayr43Zr9rt397Xr1rtay8JFWktr93JrZxWr4DZ34Sva48Wr42k3ZI
	kFnIvryrCry3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_181050_506227_78CBB735 
X-CRM114-Status: GOOD (  10.01  )
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

On 1/22/26 23:18, Andrew Lunn wrote:
> On Thu, Jan 22, 2026 at 11:06:01PM +0800, Chukun Pan wrote:
>> Hi,
>>
>>>> Print the PHY driver used and interrupt status after connection.
>>> The standard way to do this is call phy_attached_info(). Is it missing
>>> some information you need?
>> I initially used phy_attached_info(), but it was too long and printed
>> phydev_name() "cac80000.ethernet:01" twice:
>>
>> YT8531 Gigabit Ethernet cac80000.ethernet:01: attached PHY driver (mii_bus:phy_addr=cac80000.ethernet:01, irq=POLL)
> This is what everybody expects, so you should use it.
>
> You have some control over the names, it is the name you assign when
> creating the struct device. Maybe you can shorten them.

Right... it's just copied from the name of the platform device itself,
which is AFAICT a common approach.

Honestly I think the name doesn't need shortening. The K1 has two of
these MACs, so it needs the identifying information. And at least to me
the platform device name "cac80000.ethernet" is pretty recognizable.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
