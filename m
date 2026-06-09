Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C54CD8CB2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qHsJv35aKFyczESgcTBM6k4tx/5baInsj4sdtqIfOc=; b=tSfEzF02EQEM2i
	nvE5Hw7iCIwMtNgcY+nF7Vq3zpaPTaZZuonrf92J39x56vMZ+UBAMfrExi6aq3MYGbVi+zEvBmby4
	baFQaYHK0uO7QZkB5u43UK1b6oT8YRsBWw4ZkhWm3eLLEZrxSaSpXumb081814J0Me19Y3dHx9kYm
	VB1UG3W/tRmSc87BMoYIwMssSvzH6v7rMQzsqq8LNn/NZr0hbC01jOTWR1FyTDyLDwNMZd4+scPQy
	cLqL5ZwVRSYUDpOVXSrxIwLSaF2isjCOdEh9uW9RVqP7u8qva8fdC/iiRtKTWvZdNEzc2o0gf+NxA
	qD8FDneGegSHw31MhNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX18C-00000006Bsg-2wsf;
	Tue, 09 Jun 2026 18:24:56 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX188-00000006BsB-2RQl
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:24:54 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 250BB7A017C;
	Tue,  9 Jun 2026 14:24:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 09 Jun 2026 14:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1781029488; x=
	1781115888; bh=cYprcqby07aD8H622Y4drSTVA2JemKQFeIJ8S7r/+Z4=; b=E
	ixPZ2KMTPtrBWcgx5w8G/hiz0XIr//c07Li4camk8/JBNA8dZE+t2qd94lmLOOY3
	epq/J5GTF1JeMuEDpw0d2s3jaWS8lT9B0+sVk1xxkEkqSuTWQcg3mrPMCivgEK2Y
	HC5W6rwGuTB1wR6jlUvQtcVst03yyd0QVi0joP20c6dgsIX9J/XHCk1upAW1ejK0
	UVrMbVC6MdsjxjFMHEZAyh5Vlj+FSmKLr8ITiBSrpyjzBIHM24vmTxpCWaKadv2n
	JDYaLLgAFTZlrzHnmyICJqpmPehpIxdWOvOpeAf00HZoCwPrO8gVJBXpHlKhNT0z
	WMiJh7FXnvhxhgfkQfznQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781029488; x=1781115888; bh=cYprcqby07aD8H622Y4drSTVA2JemKQFeIJ
	8S7r/+Z4=; b=daGzXBDpWuelL4RVm/tpHueKcaTVhfyc2xVBiHfdlClsf4O4jCa
	7jM1YWuTiL0moRy5VYrX7cuSgtlF0M+CsxbiCs8guZLbRKJUWyJO1Bj8+MNkPzm3
	cif0IlUDUIjWqQKP5aK6pKxDpPbkjir70OHb8M1MSoiPWj7hyZNRENNaFeu6LPFe
	fkIZxNunBTqJaxMDN2e2C1iKz8ISMfu9oRt7Pb7LYiRy3PrCRotQfBqiiYYcXaSF
	wbMb0KMNKgxtVmDgV5SjPomUVeDKYiLoaj5nheJLWKnNPgl2Eu357268bav4IGOk
	AcpDbZmoWiJKj3WMFtZ6TNRBCHn/uKzGNfQ==
X-ME-Sender: <xms:cFooahUZmfI8ZWfVuMTS4j2cbJJH5QEOCKQOnREJzOAISa9mDcuvLQ>
    <xme:cFooaqjlEDHDbNiVxanXyRX5msD9EHPz5KfTJ9Y5MeMKy3MCMzqcCWycBguxfmdk7
    LU72yOtoBwgqefiF835GvnETcnRYP8AKtxfzwFeDdBYyZaBdCGr>
X-ME-Received: <xmr:cFooao8AoM-3iVuTHpMTIwnsIJ_hxhSPJEIMxw48qJpk9jrCzCIM9qiMkd0>
X-ME-Proxy-Cause: dmFkZTFS/rLKkzzrwQjGc4OyFeT9ka5Vx98G66TcKfRWgrNpaGXQ+37ZpynXpSDv5HcYc6
    ujBcVXTGtHId4F423cwtbfu3KBYGGmBJ8NYo7m5u91coeLroixEFq2X4iDT00GE2ivhlsD
    Ym78+iuTKYMVeA+ZFdx+Lq8S17J2qSvoBjWEnrQtAh5HF40wIt75FeXR0G48w9paeC+ykx
    8ElnZOHZFOOwQTSnWulMh6C3eLnrOyH/M5q21lcIotJRtMvSZVDoKAqGjVvLO1I9XOzzIO
    UOgY4q1OJb9f2L19lBVX4+QeWYZqsRYPHhocSLQquySetI+lvQVTJDKIJcEGGqaGXhBzdj
    Jpk7IWVA+R6DogxT7DlfJQ9bkEeVGzCyXdfUzlv3L4xN8fD8NLEKu0+kyo8mXxMhudCPdR
    SG4QFnLiHs7Je0wAzTCEDFe/7teVGcSM/jE3gVdJeA0VtVZ5lakf5ZX1kDRzvZLDEM6u61
    7Mk43JzPvoV8JPHgEAV6MA1GZEtdO4f4f92zmZPU5ri9KBbVS+gwtje9+mx9ZA5wMyGGmz
    A+iNzlFue07yXZqFiedJLVRdJcopFzGL5O/b+5qVWT1s68ieRXR1PG27f2rqJ3PkR4EHfW
    W7jBYCHGAoHImc27LGZKUFe93tW3shlELaeQiD8e/VO33hpgpPTQpWh4C9Vg
X-ME-Proxy: <xmx:cFooakb45aQJSvtjdLYg8LqKRvggHLeb_o2ufTavYkx31xuojNiCUA>
    <xmx:cFooan30RLAxx14o9tJ0tRP-4iX8Ezip_ho084LOQoW0CH0CltVVNQ>
    <xmx:cFooavbWLa4u47oQrdn-owk_yz8jBXqr6Exug0Pt2MQQBdjdTRB4xA>
    <xmx:cFooavJZ4z2XEBcSvk5VxU8eTFmr2-zKZG3LCVNJBs6pUuuViO7Y3Q>
    <xmx:cFooasGkl9V7dLPmVaTlqz1nbQKaIXvsEwgTVcFIGWri2yxt5UphMX0L>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 14:24:48 -0400 (EDT)
Date: Tue, 9 Jun 2026 20:24:46 +0200
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aihYftGNcpUd4UUR@mcmanus>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiemGajqcQeY9avz@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_112453_189471_3D6BDEBB 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, Jun 09, 2026 at 01:37:56 pm Inochi Amaoto wrote:
> You should set tx-internal-delay-ps of the phy instead of
> the controller. This is a phy in "rgmii-id" mode.
Thanks for the review. I don't think that works on this board, but
please let me know if I'm missing something.

The PHY is a Realtek RTL8211F. Its driver only toggles the chip's fixed
~2ns delay on/off from phy-mode, and per the datasheet that's a hardware
limit, not a driver one -- the RTL8211F has no tunable delay, so a ps
value on the PHY node has nothing to act on.

The only configurable delay element on K3 is the SoC RGMII delay line,
and dwmac-spacemit programs it from tx-/rx-internal-delay-ps read off
the controller node (spacemit_dwmac_probe()), so that is where the
property has to live to take effect. This is the MAC "fine tuning ...
values expected here are small" case described in
Documentation/devicetree/bindings/net/ethernet-controller.yaml: the
RTL8211F supplies the fixed ~2ns via rgmii-id and the MAC adds a 400ps
trim on top. Ideally the PHY would own the delay, but as Andrew Lunn
noted reviewing dwmac-meson8b, that requires the PHY to implement a
configurable delay, which not all do.

The already-merged k1-bananapi-f3 does the same thing: eth1 combines
phy-mode = "rgmii-id" with tx-internal-delay-ps = <250> on the
controller node (via the K1 EMAC rather than dwmac, but the same DT
pattern).

Would you be OK keeping it on the controller given the above? For v2 I
can add an explicit rx-internal-delay-ps = <0> to match the other
SpacemiT boards (k1-bananapi-f3 included) and spell this reasoning out
in the commit message.

Thanks,
Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
