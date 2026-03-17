Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B5F33804
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 06:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBifCYtK8v3acRYWqDCbRGcitXVbbbIerQoQU8m7+Zs=; b=gZERQkNxmamSFu
	ShFgS7scLMgLGSx/yMbnN8z4xDg7pYAR7u9wX90eRCMN2yFn7q39Pkrig7UYpT5CGbHv2b9jxOCWO
	LgOAHzT64Jn6jBNG9+m6XhAMwouSQR6/keE+VyX2JI+GnWgNpyIi1ytc+/105UYKY+n+BEQrRMCC5
	azi9CJCjZ/NAeIdmxJ9AGNYo8ellPFkjwtsoETaAO8c9urtU9zzfGUqjOtk8JiuqEpzXvagRxGn4C
	LHY9pWmWzZlCL0Y4udaxAS/0Y6igsanAyKagjF5XoZt6zdrJNWfxarP0VJIl/WTbmgyOq1D78cDUA
	yK6qr6N3zuW46uONpl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OIc-00000005WsR-38BF;
	Tue, 17 Mar 2026 06:53:06 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OIY-00000005Ws3-2FNg;
	Tue, 17 Mar 2026 06:53:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773730375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O6F4vfO27BhBgsN3Ujy+LtSzFdCuHLO/IeOMoxw9yMu53IRZLX1XxN67TSpJV92anSu5AWt2LdJzbkoJwXCSzDgTlO2YPDtlRq8AGBIrZfrm39oYgsTIKl3P/a0IYLXn4hNm75s26AJCddxfpVC0BSDvGTKx/gCe8BKLR7zwrfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773730375; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r6x359z7LUVYIlGpCkt6UIl3c41zccuqshUShGS4DHY=; 
	b=e7R1IAjUPyDZ2Ye0k3mmjAM5TWsjKFUhVYfeniN/NkcYvbRBZB5SzupB2pQYUUk3KNr8Zps+7EAB1RsJNNXziC1jprgB9sJij8xpSCpsoAcCJHDc0ElX3duMK1/FkM2zrjKGrvymwgNzj/yIE70h1ju10AF4iLUcRe1rbs9kKjY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773730375;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=r6x359z7LUVYIlGpCkt6UIl3c41zccuqshUShGS4DHY=;
	b=mzTpzJAzBRKZxiOK12kTEebg9Tk2UIrEvu6fEsRwoC7w3gM32G3kCOjiW2ZekerT
	jMq+pfu7laCjLfzycupCNZ1lv2HdmvSx9TcArqsnSFYsQzC9WBr57G7w5aGoytVYCaB
	oxK1IJiUOaSOeou/NJulhapgAgMhWLbjwFJ3noKs=
Received: by mx.zohomail.com with SMTPS id 1773730373624551.8839282460517;
	Mon, 16 Mar 2026 23:52:53 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 17 Mar 2026 14:52:44 +0800
Message-Id: <DH4UXSB5ZT12.2ZL6R3FWUR6GN@pigmoral.tech>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <gaohan@iscas.ac.cn>, <me@ziyao.cc>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: canaan: Add mmc nodes for K230
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Jiayu Du" <jiayu.riscv@isrc.iscas.ac.cn>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260315054426.18383-4-jiayu.riscv@isrc.iscas.ac.cn>
 <DH49Q7OQSIYM.1RD7H0L809JQV@pigmoral.tech>
 <abgp0PT4GHRwmaLy@duge-virtual-machine>
In-Reply-To: <abgp0PT4GHRwmaLy@duge-virtual-machine>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_235302_955892_D19A6F0C 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue Mar 17, 2026 at 12:03 AM CST, Jiayu Du wrote:
> On Mon, Mar 16, 2026 at 10:15:27PM +0800, Junhui Liu wrote:
>> Hi Jiayu,
>> Thanks for the new version. Just a friendly reminder.
>> 
>> On Sun Mar 15, 2026 at 1:44 PM CST, Jiayu Du wrote:
>> > Add MMC nodes to K230, including eMMC and SDIO. Enable HS200 eMMC
>> > on the SoM and SDIO high-speed on the board.
>> >
>> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
>> > ---
>> >  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 56 +++++++++++++++++++
>> >  .../dts/canaan/k230-canmv-module-dshanpi.dtsi |  7 +++
>> >  arch/riscv/boot/dts/canaan/k230.dtsi          | 28 ++++++++++
>> >  3 files changed, 91 insertions(+)
>> 
>> [...]
>> 
>> > +
>> > +&sdio {
>> > +	bus-width = <4>;
>> > +	max-frequency = <50000000>;
>> > +	pinctrl-names = "default";
>> > +	pinctrl-0 = <&mmc1_pins>;
>> > +	vmmc-supply = <&vdd_3v3>;
>> > +	vqmmc-supply = <&vdd_3v3>;
>> > +	cap-sd-highspeed;
>> > +	no-1-8-v;
>> > +	status = "okay";
>> >  };
>> >  
>> 
>> It seems the broken-cd property we discussed in the previous version is
>> not added, and also my Tested-by tag (for the whole series). Was this
>> intentional or just an oversight?
>> 
>
> Sorry for that, It was a oversight. I will fix both.
>
> And I will only add your Tested-by tags to patch [2/3] and [3/3].
> Is this correct?

That's fine, Thanks.

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
