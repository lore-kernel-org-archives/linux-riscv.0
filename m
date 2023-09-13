Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71781EDEC73
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jKyVj51X1LS+HGYSsTl74N7/Hqb7Jw3OpThqf1WbVY=; b=uvWFEWgc05E+wX
	82Swqcapnl62t4F1e/5f0TWxqgetClnOwPqZTNXuVqgK5uLtJ9WZy7cro+JXvvKBLdCP/EYLYGP/K
	qk21jzDBGvWpIQDL51JGbXpFF5jGPX8uuKtFMLEWszDCviXvKq+ruV2705mopHpzNtxRGIMFAjr6c
	DP6ZljKGgkvx8yrA0L5/r0Ry3+hqJMZTJIKzGKiUQMqaakAy73p/EnSwjZMrg61J8sCEMN0m2K10g
	BZMmWyUcxRgt+lXA68W+LvT+rbMxv2fSDfNUDw5lnOHq3mkB4cmym6UBqYvUBDzQo44rI9wRHkSKK
	eL6hohpO2eRI1m+KTqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRmg-006Dqj-1z;
	Wed, 13 Sep 2023 15:28:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRmc-006Dpn-00
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 15:28:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 758B2CE2160;
	Wed, 13 Sep 2023 15:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE31C433C8;
	Wed, 13 Sep 2023 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694618876;
	bh=2y+HoufOHHUVUfMzbkjqlYospySETxzf4s/h/0ToUik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwhYSI/NopuKBkart4AAsJuHdwYJgbyn/73+4F5K8xdZle0iVLbgMRjqlMFlyqrhC
	 h9Hrs8dGe2NFfPkiEvg08LeRLvjU6ea2l6Cu4KBjlIT+FpUPSwhcuKB11KVFxuqILl
	 OOczz6ZeIWsx33bUT74kJVbk6TowG3CFVaAw3oeVm2f+9gWQnh3NVISAKJAFnjSu4Y
	 D3pNU6PYDiqB8Arc87uaE5sznBFgjdvJE8svk/MU6UUTozDDdaqyGBWlh4mPZQmQMC
	 BjUY0rXv6GcRQ7APLBvUArlBQ+Qs25AFdXnNWegiWC68ofqVAidFyh1MpOX8+6Wfve
	 B2T/5GzAM4c6g==
Date: Wed, 13 Sep 2023 23:15:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZQHSLdPufI6CXApg@xhacker>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912-trailing-pampered-52738ec6f009@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_082802_237659_E4FEC234 
X-CRM114-Status: GOOD (  17.19  )
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

On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > dma coherent, so set dma-noncoherent to reflect this fact.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> > 
> > Since v1:
> >  - rebase on v6.6-rc1
> >  - collect Tested-by tag
> 
> Does this mean you're expecting me to take this?

Hi Conor,

I think I will take this and send PR to soc people. The reason
I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
mailist due to typo;

Thank you so much
> 
> > 
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index ce708183b6f6..ff364709a6df 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -139,6 +139,7 @@ soc {
> >  		interrupt-parent = <&plic>;
> >  		#address-cells = <2>;
> >  		#size-cells = <2>;
> > +		dma-noncoherent;
> >  		ranges;
> >  
> >  		plic: interrupt-controller@ffd8000000 {
> > -- 
> > 2.40.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
