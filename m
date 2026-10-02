Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BFCCA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLSofB/UoeC82QOWo5VzzLVkJfBxo48BMQvPVWjw3gU=; b=DboA/VBPLY4H54
	X3G3IR5s7UNuTsjIg54hmGIm4bBmYphYKtTCSjm0T3sByvPmSxTOkeePwLO5SzCoaP6JcesK60Jxx
	9AOdaoytVm/0qFHY5NIKYzGYnhM8YyVEoPWa5fsoskNp/hOKS7p/p+hlPSjeAeeuIT6FtXusy+d7m
	UnXbzxkRSsivGQOrNYGAMzROebHDdQHeHR2aYit5mhUQuRh4xxghKgvsrNDxYKlqWfmv+LcWSePWG
	LfkI9/SO+djRzIzB2Z8JDcFnFUj1xjRwFwndIDOGBOKP1gvvgGD0ixD0CAmXBCK8CDvkGbnp2lTGP
	zSO8jahpV1XkobY08F6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMQ-0000000CIwU-1WG8;
	Fri, 02 Oct 2026 18:51:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMN-0000000CIv8-2XCn
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
	b=i1tlYHHqOg6DzfQzDRI44MIPzxcDl/GPCYu4hOKXI0SjG15mCsJO/R1sbumyZKcmEMyAD1
	rl/rrxETyAjH9VVcnU/mln5FoYFScbuuw3OSuEqrvYDK092YSLkM1wULSZbCmmdGW8lXrl
	MlqoJIBSc4wcQhQBSTzFCnvuMbTQA2Y=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-X9Lpx-6fPPidp2gf5vd-EQ-1; Fri, 02 Oct 2026 14:51:51 -0400
X-MC-Unique: X9Lpx-6fPPidp2gf5vd-EQ-1
X-Mimecast-MFC-AGG-ID: X9Lpx-6fPPidp2gf5vd-EQ_1790967110
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91786869e8cso3229196d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967110; x=1791571910;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
        b=Xxpyb3skyavcee2zt/RSqLuxayYlJm30wAvOOEgjRoWYunhs/BW5ew0oTz+S1EqzOr
         7gne68q+S2NAimOxpe6TKlpullUJHeYnSw/figUPd2KBg4d3u4+vY4wikARDCtjbIFlC
         PXSGcLBaoouI9V7cEB+qv/VGJw/NU3h/9lOYsifQY2Tzll3+MxBBWKsUHXZm2wfpE7Cz
         BjjNO3h/UZnbjnz5JuuNC+Bs+RsSr13nwsofB6XIaliFbsa79DUnj8jJeO+88X3+nORd
         XcIY6ywY0PYd+gnirM/SvzLg/+N5nE1osIr5du3HjRXivC0wykBC+U0JJXWjNnOvbz+g
         HK9g==
X-Forwarded-Encrypted: i=1; AKwUvBzX8ZROn5fViT1S0b+KeEV2hGzd4xECt233GclaUWDy3nZxlETVOHAUje5Ofl0Ex9YfaOzrTgUv3baIWQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kRXhSlZRFgwsEqe8Ik7WDOThqTlkAcKCpRST0SXEF1Ga8u9pnn
	RRex1HTGam8KyOH39B9AMJMFaHHnCC1J64GkWH7SVLuwPT6s9cfX/j7AXfedJg6L3tuD7+IFuAl
	pKQdDn8qepUzr254tc1M/flCpNOK7HXE4QJFW/J8HvTwG7CzvCQZFb54kEj1KStR+NG8fFg==
X-Gm-Gg: AYBFou09VSRHfvBgFJ0Y9RvuPZT3y1oaeYyfRwXHTIvFbAqR8DokDOClfeuBch3LlYq
	9dZWSLq610m0g4Odp8+PlCYekKYTU5pcHEmc7+3wbfAqJV8cP0mufPU/EWIdCPFg0SicDySlGlN
	OWvzhslqHscEpZ6wtBug4C1lDLLhC4pDym+FyZsrY55ax4Y0Han8XcPRixGq7ermORo+OroX2QM
	Es3kfUxtXSFreY7Xy/eOC6h70EKjogqlix96hJQHE0OeAZrqSSg34pcMhEx4zqKEQvOrgVBn+mg
	vXy+WJ09G/dFX3tYErWTqRrmNI6guiVScLjPHG3tlT3eSG2JYz2FyEiFOgKLmWcU0WKZxL0dOzS
	xQQ04rE1bQkFEBA==
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670124185a.37.1790967110543;
        Fri, 02 Oct 2026 11:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670117885a.37.1790967109968;
        Fri, 02 Oct 2026 11:51:49 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:48 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 06/23] clk: starfive: Add JHB100 System-0 clock
 generator driver
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-7-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-7-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707364.821688.18177370718453496156.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SvlLnlt6KHX1Jrj2D3pJtCaILFR/9gRc9iadqwmEB5E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7X6vESXVZZr6Wxj3c4lz4Xy5qcm7nt4+OjFy0fUf
 A+ZPjGe2lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEEhsZ/ue2hf3l4ON+PnHv
 SvOQsrfpJYHf/Bvm7VBe9Kfo56vsPbqMDKs+HVC7yjLx7g35VuZFnkG3JLSO37uqbflrXT1jv6R
 dLzcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9K-7Nfpo-fgQZmS1nDG7-_IzjPrN9D6liVfqYqyp23E_1790967110
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115155_725240_FD2CC786 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Changhuang,

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..a0e5b4df96aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26097,6 +26097,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>  F:	drivers/phy/starfive/phy-jh7110-dphy-rx.c
>  
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:     Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:     drivers/clk/starfive/clk-starfive-jhb1*
> +F:     include/dt-bindings/clock/starfive,jhb1*.h

The spacing after the : doesn't line up with the other sections. It
looks like this is using spaces instead of a tab.

Brian

-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
