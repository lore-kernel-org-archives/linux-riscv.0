Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46558C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 09:18:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C2920829
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 09:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C2920829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fmRRPn/7PCSNyD9+KAB/uFmAO8ipgQnKSpNgL9fP1Ck=; b=r1iCc3OWQFoVHEo8S/smegHsi
	xEvS/e1aJzbPiSrISTkyZaV5uNM88Hc4AWyOtundPVV5FcfVcNrlI3uPmGo5adOPPsmwq1TkDnPVb
	2v12ZJthBBOGV5pW71HYrTS9whNsZEJ8bw3eZH44Cy/Vwrg1WNfcacnfuuuAKIPo8VcGTV3n67l+w
	YLREwmUofw3X9tn3NVOEL4RLe3zLIOt/bZ22JJqIkegP4CG2cAr+cb+JAfg6XnD4gPX0ZiJXGm7ir
	tkGayqGS0WS1BI+2oOSOYWPw33TqNNQCusyrIszNl9YBsDMB/W5md5RVUIhylY2IOETRt5jAjwOeV
	Piuku8w2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1QfS-0004tk-AH; Mon, 18 Jan 2021 09:17:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1QfP-0004sr-4D; Mon, 18 Jan 2021 09:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0B2hFv3lHdM9TBPzjM9IKfLfYu/9AxcqqtQjLF2crQ=; b=QkLUcq4X8dxRqsXPDc7Y9lJck
 3QIAiv0C0MkGBIJb3dDg7ZBcYhOV05UNg+TlQkkzDjScHmScwwlaUHiokzk0lOBaV43/+2xoGhWGf
 D+64OyCT9ahStm/k0XRMJT/jIp5xP/mJbxx2PHKz3w9zKF54QPGLWcKfLTcR5IPqzmKF0ZDhJ5R0m
 aYBlgL7QXtqZhxzgplPp8W6aXDTvcv/M8F+ULI07V2NO+63QSEZPCNQ4msrShdPKnsINYQhJxQawz
 +1pv2oTUHJVXv5G3VWvfK8lO12b6DWEwuTsxTmkCRFcII96Bq39l9AAm3MMZJ860iDK+YbDfMTdxZ
 BA2BqYang==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49488)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l1QfH-0006CK-Qh; Mon, 18 Jan 2021 09:17:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l1QfF-0003t7-Eh; Mon, 18 Jan 2021 09:17:33 +0000
Date: Mon, 18 Jan 2021 09:17:33 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
Message-ID: <20210118091733.GD1551@shell.armlinux.org.uk>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
 <48c006a8-a352-488c-4981-768faffbe343@huawei.com>
 <20210117100903.GB1551@shell.armlinux.org.uk>
 <cc47f8cf-8778-43ab-77de-9dd220de7c26@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc47f8cf-8778-43ab-77de-9dd220de7c26@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_041743_276938_99283D1C 
X-CRM114-Status: GOOD (  16.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 09:01:40AM +0800, Kefeng Wang wrote:
> =

> On 2021/1/17 18:09, Russell King - ARM Linux admin wrote:
> > On Sun, Jan 17, 2021 at 12:57:55PM +0800, Kefeng Wang wrote:
> > > Correct Russell's mail address (from linux@armlinux.org.uk to
> > > rmk+kernel@armlinux.org.uk, should update the MAINTAINERS)
> > No. MAINTAINERS is correct.
> =

> I got following message,=A0 so I check mail of your recent patches, and s=
end a
> new one.
> =

> Please ignore it, there may be some other problems.
> =

> "*Delivery has failed to these recipients or groups:*
> =

> linux@armlinux.org.uk <mailto:linux@armlinux.org.uk>
> A communication failure occurred during the delivery of this message. Ple=
ase
> to resend the message later. If the problem continues, contact your
> helpdesk."

That is a most unhelpful bounce message - I suppose it's designed for
non-technical people to ensure that the problem can't be resolved.

From what I can see from my end, every attempt involving your email
address last week (wangkefeng.wang@huawei.com) has been successful, so
I suspect the problem is not at my end.

In any case, all @armlinux.org.uk addresses hit the same server, so
if there's a "communication failure" for the domain, it would affect
all local-parts equally.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
