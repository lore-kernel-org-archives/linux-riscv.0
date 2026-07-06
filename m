Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549AC44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2DMYBG3s/UpySK8uHEUhvo0cMQEroPz+x6yWlNTIQE=; b=KHeqXqNPHiXhwi
	Vm5ndvNoCMfIw2g/e9WsfheZeFKXPJkmzK4/p2GVmZ4hmtogHj/YHafCPPZ/+ia7FHSuvh2CfqDAl
	AwXXtYeM9ZVqPqzJBIjGIHe26ndTqxaPJUkR4aF+ZadSTAYRQC8j1Ne7YwpDGvilAQFQe1PnpHgf3
	qbqJxMWRV3WO+IxjHujq0hbqeK++6nknhCbhYYELxKrUH6rAcyHcDolRq27BlPTth28yidG26FJjE
	1q9KtEtnyt1SqfMDaIs/IRtDWsDy/II3fTKeTmE8ZQn8RBE1bp+2JXGvq+k2w0cYM/7/zKhsly5iY
	rq3UmDVfzcJhtBUvVdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj52-0000000CXMf-1ADV;
	Mon, 06 Jul 2026 13:09:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj50-0000000CXLn-0MWi
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783343385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
	b=IGjrezxJZb6tuVeDxoA5xudkI6hhZxPAb3o1xaknL19tS0irr6r3Hcc2xlETxtsvWDInxu
	ejhoJjDG2iKavJguGEREnsrM8kGYJX2DIb6yysLovtRso3xQbk7GFgJji2KqN6WYbPPU8n
	tASSyM5oklRcNCDnhPJDj5K0trK6aLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-SZwUsRIiMLGsk5ITWTs9rA-1; Mon, 06 Jul 2026 09:09:43 -0400
X-MC-Unique: SZwUsRIiMLGsk5ITWTs9rA-1
X-Mimecast-MFC-AGG-ID: SZwUsRIiMLGsk5ITWTs9rA_1783343382
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493ce4b7777so20716425e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 06:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343381; x=1783948181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
        b=MuLbV3+swt3vbkJ8NcMVdRjguk8ceJZMBRDXYp4E6y6oRobyoc48mh3J+ULz6gosZX
         WVXZG+uV12znKAd1fxhdhb38fi2ihC12piAKZbnZhJcj9hqNPhyOakTjxGf/VrxVxTEW
         9UOECe2SBhn/L/8u9uFizGkqWnquK26cUvn2P2EyTI10mixhZCCK3na6ujjIFeOm6R+E
         dmAx1ukhJyNHg/tgs56okJEYsAOYVZLyupVa+Pq0IKEBx9oYmqMHm+NNZpxIi72oRDgi
         xeilFMbHieVWNCzvgm06ZTcDaUTgca7TaA91PZzmv8UlkwlsdlPOm50IcLoMxCl/EocP
         Riew==
X-Forwarded-Encrypted: i=1; AHgh+Rr6IJQMlasy4ob16sYObaDR5QqAwz2bmbDdAHka3T1nOFMJA0hExdpNQb8Si4i2SQWgTNFmlQIPDaRd2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YysE+zH6zm/dNs4Dv6YXqgW7bhXMjRxwLxydpRlVZVPbpGBVTqj
	W2dKt0z0undJPd6j56/19SZTRojp9c6Pu10Z8xG1+gE97HnI71muuNZ4A+0pU3sI+sTeccsOlWM
	4mHJ3sW9G9fb0suHgh2Cu0afuBODsquRL9FZ4XY0hnlTJnnckGzB3MTG5xqhdB0f1GWcdPg==
X-Gm-Gg: AfdE7cnmCEAxKd/tm9Q/KKXnI1O9PkHvuwOFjnA0rB44e8RKoD2c4xX2ctL83ehsNN9
	o7/GwGiU+n52rTRQjHBddWxdCjOPdnZ58i1nmiNUj/HB6zGcwlbTKsvfTdR1vSlulnWRWdMgzPw
	CwHFxCw/TEbHSKZ+pIj+Ijsd2kuEQzC223jAgvokjyGE59P4/h8CzNJh/NNhJX+wSS8yd9SaC2C
	ZlbeXqsUqrwDItJPeDneYM3QfIwb8M4aieKV/emBLvGxq/oTKKu4Qpb+PTzZqoOciXn7B6bphgG
	T8KmrdjnCuMyotfuyRmptVAhEpiw8k3YZCe3Lw3ZF/PxusrdpESN9zQMWuIF/8jpXcsMC7rfVG3
	Xh+ceWAq6rsX96WP4rhMNN5A8M0Wl5GGGmoODI/ArmWOxS4NYkEK3dT9/Kx0813xpEE7nW094ws
	2D/twfnqRv2+8+
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850645e9.7.1783343381361;
        Mon, 06 Jul 2026 06:09:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850375e9.7.1783343380895;
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25839803f8f.37.2026.07.06.06.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
Date: Mon, 6 Jul 2026 15:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260630063445.1226-1-lizhi2@eswincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z5Fdq07dj-3K5RTXw8TODE9o_Fb5IBS4Z90BVebVoBs_1783343382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060946_241854_08D7D1F7 
X-CRM114-Status: GOOD (  10.20  )
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

On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> This patch is included only to provide the DTS context for reviewing the
> binding and driver changes in this series.
> 
> The upstream DTS series will be submitted separately after the binding
> and driver changes are finalized.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

@Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
PW, but I think it needs explicit acks from relevant SMEs. Could you
please have a look?

Thanks!

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
