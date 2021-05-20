Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC0FC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 20:22:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2646B61057
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 20:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2646B61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXoqyUb4wTQnarSSY7rf82i+nCAViGMdOHO4yROndIw=; b=Dk/sbjBP7aMEeBGMOnS7vIn3O+
	KRtzTUr38O+xjiuvzxhAtrRAe/uXh9IsYJiXFI2VvvGVjLDnlTez+LsWJeCdWKUwzz2QSV8I9mS6J
	JZuls8aJuQpN7KcJNcu90YvLQ6Yz3D3/t2AGeapaXSw37JzHVLIyNiurSuCjD7mLtbpIoeb2rV4Ey
	UkwQOuzwGWNXMcbV/u/FFZm1TzVV88tqmpU5NluWVKtExidgn3OHjgHlZVwq6sVo9evpoYZUt2tpz
	7XmKKu6BFO/HZPqsbXWZDeyMyExROa0xsgfWulTsPLG08vf/IV1OjgcxcRimOCSKOS+NL8ta3BPMB
	JyPAdoMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljpAw-002dFN-WC; Thu, 20 May 2021 20:21:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljpAt-002dEj-Li
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 20:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gj6HxIbz15inQkT3Nj+fjyjwArJruqAZA723Ulizlqw=; b=FJNgmycuELBTqKfaxFocb8Lvoh
 Tr503EfxguvTorGTuDmLZJH4XfTCXyyhvs4Wy/3WBSyP/ooyzFYcyfX/JXtDxATW0PEwH1rVFvuBU
 U5gPi42pixu3IPqtCYME2wjQqRLeLK5HJMW2vbLHiBaYODu1ll0F9/IQacZ/7peqzgJuYFBzXOcIP
 IoCaJHyJyU0MaXIbIa+y6hYUn6NTyQoTN4qJzZB++AC6p9s5JewG89k/oTgh56WkVNvHje3U6uaAH
 m3vDxJOh64Aexlm0/rGlsWO5yufAd9UYu4hvYGrQsXVlFFRIcnfGBtnbhv++yGvr+sCThN4gGb+0A
 8y2Qakwg==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljpAq-00Ge7p-5Y
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 20:21:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id z12so25799553ejw.0
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=gj6HxIbz15inQkT3Nj+fjyjwArJruqAZA723Ulizlqw=;
 b=cQgXNYSAohE4c8rIm8/VBR6j/zfMfuEf/h/FWAxhg/gl/jqEi+50X2c8DN+2UNTJZE
 uDDlZNlTU4yLq9ncmddAippZoCrrOA4JWVKZs7h0Gp8jvt6viT41p7dTiDlI4pnSHJ3V
 MeGWVNU5hpaoM+5GrYF+OZ+ZxW7h+H+fCJWtAgfH7X/nxDF1tlync/v4p3WnYWdOAg9O
 D1/evxW2s9kuELppxD2KjXkrTFJzYSUdSKQs8y6nP3r1L4PuAPkZ7m/vHfd9PCqBFgro
 z3D1dcwcIEnKokf+FTJ9JEkFHbrJqadPUtMGAasWC0nLDP16HpnGLfS8/fzktLPKGL/o
 ICBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=gj6HxIbz15inQkT3Nj+fjyjwArJruqAZA723Ulizlqw=;
 b=Rcxn6d4rbS9G7qY4mZAB8Z0LA4e38zMXYJ54YxNiUGKUu5/anCxMheo7GRATC/G2QI
 eekhewlOToiociAr3hRoklkk3w46UcbOfy2l5HmT/l94iVWAoD0rGAfUu2AWW9pFoBV1
 4UjM0xur/QVJFJee0Vo3Y+6WKfgb/5XZXLyvA81XMqBTVFfSDo2/PAVa6o8daKjb1APZ
 33+c9HJ52OnnN8ZCLsaBGzVLSR0AQ3JWz0g3711FsVJ2dtcG69XJs5kvQT3zoSTA7Yob
 NSFwkalH6fljC2h5SiJdTYRQQ9s7kSYhKRGde+y7o5Y7EF+bwaOWD4GfuGhn22lXSIVN
 5m8g==
X-Gm-Message-State: AOAM533q6eOe41qU1Yl2hazvW9GwE491G/NHtrzmhsXfd1aNg1YWkEDT
 F6dTIkuLC8lPb6S5XebwU5g=
X-Google-Smtp-Source: ABdhPJwoEXiLY0CmtQlqxtzxp5h8vnCy2Q12h8grAgCuCty6keJH1wflPoKN4KuBNPZdlzE+Z5SN4w==
X-Received: by 2002:a17:906:2854:: with SMTP id
 s20mr6336510ejc.335.1621542098666; 
 Thu, 20 May 2021 13:21:38 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 qo14sm2012776ejb.47.2021.05.20.13.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 13:21:37 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ljpAm-0008J6-MG; Thu, 20 May 2021 22:21:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected
 function names into the documentation headers
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-11-lee.jones@linaro.org>
Date: Thu, 20 May 2021 22:21:36 +0200
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org> (Lee Jones's
 message of "Thu, 20 May 2021 20:00:59 +0100")
Message-ID: <878s4988bz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_132140_244164_8AB27BA5 
X-CRM114-Status: UNSURE (   8.25  )
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

>>>>> "Lee" == Lee Jones <lee.jones@linaro.org> writes:

 > Fixes the following W=1 kernel build warning(s):
 >  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It handles an IRQ(). Prototype was for ocores_process_polling() instead

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Andrew Lunn <andrew@lunn.ch>
 > Cc: Palmer Dabbelt <palmer@dabbelt.com>
 > Cc: Paul Walmsley <paul.walmsley@sifive.com>
 > Cc: Andreas Larsson <andreas@gaisler.com>
 > Cc: linux-i2c@vger.kernel.org
 > Cc: linux-riscv@lists.infradead.org
 > Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
