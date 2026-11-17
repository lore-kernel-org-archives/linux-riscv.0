Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF8606A898
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ryATTWib
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z8koNXj+2qTJSYKvYCx3ozPu/PdYOuCjkGgS06mWSXY=; b=ryATTWibBdGTezHdgry71n51g0
	stdC3FUK5TCryXQzodHNyvq7OMu4bC1eW4UbJMqjLquNW6oojpyGgGLjpfxuEWi/6YzeuqUoMsvvQ
	/h8HzZ7ecpbQOwxCXymk9YOjT+rI35dt4zZTRWXrZU1/zmCV1bnzfV+kdbxmjtQN8+XMO+Wld64FR
	UgfnPdO+JTTysTuOE9IwcV7h/TtEMLvpGoRF//PWij1HFD9zxEWL6q1JfgqwRkjPDpwm/SzVVNfwr
	meedmLV3N0IQ7p+V0p3fOER8Sk0CgsDGM5uBMt3ZJy/caSEJtm5Iy4hQPsjfhwJ8ojTRvtQEC7+G8
	+6SdMYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9ku-00000004SZR-0Iil;
	Tue, 17 Nov 2026 03:21:12 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9kq-00000004SZ4-3lOX
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 03:21:10 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AH3KEFm021723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 11:20:14 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 11:20:14 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 11:20:14 +0800
Date: Tue, 17 Nov 2026 11:20:10 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <avvH6t8NHrya+hz6@atcsi01.andestech.com>
References: <20261116003937.1776888-1-minachou@andestech.com>
 <20261116-dreamless-matador-3163d4abbf0b@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116-dreamless-matador-3163d4abbf0b@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AH3KEFm021723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_192109_330305_97F2135F 
X-CRM114-Status: GOOD (  11.07  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:26:33PM +0000, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Mon, 16 Nov 2026 18:26:33 +0000
> From: Conor Dooley <conor@kernel.org>
> To: Mina Hui-Min Chou <minachou@andestech.com>
> Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
>  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
>  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
>  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>  linux-kernel@vger.kernel.org, randolph@andestech.com,
>  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
>  compatible
> 
> On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> > Add the compatible string for the Andes A27L2 CPU core, which is used
> > in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
> > separately by Allwinner.
> 
> I'm going to apply this, on the basis that it will be used elsewhere.
> Ordinarily, it should come with the allwinner series.
> 

Hi Conor,

Got it, thanks for applying it~

Thanks,
Mina



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
