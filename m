Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD5BD609AD
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXexI+fJL2eyTS4yqynUQKka5Goq4xmrILa98a2NzHI=; b=kpFcxjZpISkqJn
	WvvqK6HoJPISVNJjhSmK+aaE4ILOiNiP1baB+qlq1us7KjbRxZZees3Fpaf39pjFEQEaWXjynhVYU
	LwXqhoGjaSkZFuspeaxZRhzmkWV1aEVYnM8rjceadbjTrV6P/bWNWaDBJKhHhul9PDxnyTUZSS09N
	qrFQ5o7POaazkojCu1x6U1H2nqn19AUWFV8S/9hs4HtQVmGh2X9xopg0iazXqkAGk4+idlmfuEK3A
	H/zH/e6+ZzE/gKNNIowGTGgDfNrdGKjq7LmKD+ZB37cv1Iu8mh0pjGCslnjeBymBgReKNe4KW9MHI
	bYCb840UJyzmlMYVgJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWvM-00000005RFR-30lw;
	Tue, 16 Dec 2025 15:25:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWvK-00000005REz-2wPL
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 15:25:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so51335925e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898712; x=1766503512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GMNrMLkfDebdMnrSKqK61b1HC+YKle22T3SSCNCdsM=;
        b=LA7CFWqt82SitiiW/+8t23MeQg01tDs94RHAywXdYxuhQ+bGXT8NNxx9jJxFEBPwmI
         pmohNE2dDgUtKcglBGXzOxotk0gHRmit2S4yU1sXJ13EtlUvZ3AJLihRnvBp1TSMsKOE
         W6tliEMzluJSMsGqkbrZZHClJJxQxh8NjkjngmzXOYf3ZCHOaxguZyaRn2ZEUbturwsb
         056vr+hIkkLMGZHXXDn2ZJ9sA/1NP8Y7SJ8gTl+xW7KwtOovxYwt1tWSjDPgHB0hZVa9
         sRzPSKGU980L0FttGHOVu45Dwzia43L8fXJcxN3NaE68XxmP7aZyYxUW9y5ZJc4/6HTl
         drcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898712; x=1766503512;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GMNrMLkfDebdMnrSKqK61b1HC+YKle22T3SSCNCdsM=;
        b=xCUuatJMnhSxib0l1Ynkh11bkdn6/ueKTYrR22GJGb/2DkIwxSYyqkh2vHQ/pm4i0F
         3Y6PT/ziZa0NJTngskJzZMHZRhN4F8fdtUK5dOS/aqQgBTvqtUqVNgHGwa1QMl9KrfXi
         HedeIZeCFhOVOePmb6WHRUk+bhUulaNgzZYz/CJc+Nl48jbQTntJjZMJDD8d06ioNoob
         8bGSlE2h3nxOWuqLiTkNK3+2wpaF6SuzNyMoF4QNNa/0aerPyfMXMNvHK/78jUCI7Gdc
         yGCjyOglZtkM2nXT9WMVgFM2g+aehQkVIwXtIDa5VrbRj24iiaA7MjdBvTPU4v4BkYaI
         /z/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgjH1YJzeHl9Dva84Vu48eXex8RuY9n1akTq6WZ8lyerzwav9SH+5RitllH/w2uZetOXv5y0jwzwEspA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcKH7eVFTxUjXerBd/V+klSRaitjK/TwcyAGYQpnyKz1giyw8
	5mm/ogJ0j9miGL0QL8erde41qm0T/zu/ztdLO6vEAGveVANj3BEDaogx
X-Gm-Gg: AY/fxX4X0BA++0Gi3McgeBVyYJ9iAfMuVflQEmLTFjw40PsTCddoHvNlOZeIvwY7c4V
	lXg5r79nP4oDKqSsjHaPnhXdRieMMgbIPE4+YlMTVWcHh4Uh9UnkfBmVf5IN/284jaHfxpCOY3h
	KJT2WkNKXQAIRqAeuak2KXZJZ7xTPrZThXZhuKh2jcxaNdPpZue0+G8CNgWZFKV/sfgbbsSih/Q
	EDs8DaL5ieEhiH6DoRuoFg/JO/P63/vCpKNw9fTR7UbrvnUNLnXgKjTOlKmaf20tS2ia2momkXc
	B1xcY9mrS+0R0QCVgMNnaxFfSp94Bwhbs3tDz5MoL9RT81z848HVXK36MvCVmt11oonPBy6lW4L
	azrgPut0FY+nUWP5DTZT8Ub+HeaRzsYduT3JJmGKR0MrqE1VDbJ/k25wlkYLuxlMuKauHUkp5Yb
	JCQC2jTRqkLNtxXIqqk4IUlM4scIBnaLNXC+27TvDftHklt4TrtcP2
X-Google-Smtp-Source: AGHT+IFV+c61z+DgSxhQNpcRqsr6GKrDffylNeUc9FZ154kyk76iN8prufaBiE8rBuUIXMcUo/WuYg==
X-Received: by 2002:a05:600c:3b05:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47a8f8ab546mr158959185e9.6.1765898711717;
        Tue, 16 Dec 2025 07:25:11 -0800 (PST)
Received: from anton.local (bba-92-98-207-67.alshamil.net.ae. [92.98.207.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b1347sm270035235e9.8.2025.12.16.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:25:11 -0800 (PST)
Date: Tue, 16 Dec 2025 19:25:06 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUF4w9sO5lmU9T6v@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <aUE9hDtflXpcgGnX@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUE9hDtflXpcgGnX@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_072514_758474_40C2DB8D 
X-CRM114-Status: UNSURE (   8.02  )
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

On Tue, Dec 16, 2025 at 07:09:16PM +0400, Inochi Amaoto wrote:

> Hi Anton,
> 
> Since you have tested this patch before, could you give a Tested-by?
> 
Done. V2 works fine with Milk Duo 256M with 2 channels RX and TX working
simultaneously.


Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
