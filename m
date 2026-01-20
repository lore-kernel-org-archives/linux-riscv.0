Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BE5D2ECE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUvzVtooeMAP/8BiL+aS3car2R55sCtu7dmXDd3vcqY=; b=TrEfFuIAdjAJmE
	nR+/gd1Nv1ekTZsJibhy4q6qCYeC6+9YvzIFLRwO5FTpveQLF4uhOOSvV1h8GQBfLJWpdjVSciuF6
	ebL1jX7GMoa2mtnSne28CozImZD1PXCYDs0+87T30OzGn+Y85caX8sjfCd3GBwXj7b0CeOgaTj6LA
	nVuJH30Z2ygEe/0u2YnBhdNTVo0oGRqjNdQHRU3l0zdPAvNQ4VLvQFQVzc9RhqQcMUnccPzGjRYz1
	R49TxqAq1BkfHJBjNZBZUjEUu/nC1WfJRyVbL2+JgGXHgCHIUuASILukvGCLiMZBB/Fkk6G8VBHsA
	sCfgh7at9vRrhTN8MEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCte-000000040P3-16cT;
	Tue, 20 Jan 2026 14:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCtc-000000040O9-46Qq;
	Tue, 20 Jan 2026 14:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+MXfFWvwGdUb0gFufRKO4dHX0w8yFI8vWxWg1WFCytI=; b=UK5d28Y79a5NHuZZqfEvgLiHbf
	2ospYrOZQotiHrV7mjc1qGTRD8MMLfFDPuPEsbJrgOe8AjXZagNSOe9xZ5HlMpWZEvmbwVd/VccmO
	MrhzSyaofpl5AhMgBZvE4t1heUGuoOWrQrU3+Qj0x29WQaHzWT3D3aWubXKwwBUemQi0V312oXYHE
	kYOvZIUtZdE0XMZ4tocY296EqPGRu29ZGDBufiTywLg20Rpeycwl/2vbX7pOU1ojBiaWruGxbQUM9
	JwsIZ5HuzhogXz3g53+S7/+dSRsvpm9vwYVLWSc3AAxuxtt17MGa87VyFSl8XGneVhePtnmWgJNO7
	iMp3t0bA==;
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCtW-0000000EEIv-2hcJ;
	Tue, 20 Jan 2026 14:39:51 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowACnPRF+k29p+FrJBQ--.27076S2;
	Tue, 20 Jan 2026 22:38:55 +0800 (CST)
Date: Tue, 20 Jan 2026 22:38:54 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vkoul@kernel.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add USB support for Canaan K230
Message-ID: <aW+Tfl5ohCwVBr9T@duge-virtual-machine>
References: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aW5WyizgDyQJaKLQ@duge-virtual-machine>
 <2026012036-refuse-reply-a363@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026012036-refuse-reply-a363@gregkh>
X-CM-TRANSID: zQCowACnPRF+k29p+FrJBQ--.27076S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryDWFWUJF18ur15CFyrtFb_yoWxKwc_Wr
	n7CFs7Cwn8Jrn8C3Z7KF95Aa13t34vga4rJwn5J39aqr9xXF43JayFgr95twnrZws2qrZI
	9FWqqw1DZw12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUzOJ5UUUUU
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_143947_406627_EE9104E9 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, Jan 20, 2026 at 07:06:54AM +0100, Greg KH wrote:
> On Tue, Jan 20, 2026 at 12:07:38AM +0800, Jiayu Du wrote:
> > On Mon, Jan 19, 2026 at 05:38:31PM +0800, Jiayu Du wrote:
> > 
> > This is series is the RESEND of the series here[1]. I resend it
> > because I mistakenly sent the wrong USBPHY driver code.
> > 
> > Link: https://lore.kernel.org/all/20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> > ]
> > 
> 
> I have no idea which is which anymore, sorry.  Please send out a v4 so
> we know which to look at.
> 
> confused,
> 
> greg k-h

So sorry for that, I have sent the v4[1]. Please ignore the v3.

Link: https://lore.kernel.org/all/20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Sincerely,

Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
