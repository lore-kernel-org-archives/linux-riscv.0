Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55581606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWOfqqQX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGLkh50R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mh71UNe5DHrlA4AnW0/iTAJTWl4hzvh+R3wnAKmarm0=; b=UWOfqqQXffqalRtaPUcWBR8Upl
	NeflKAj5lpO43/6SEWTIOhlQ75y5L//ud3f2p2l9RfGxOaTugAuWT8/oVugF88A+gu43XjbEuxJNT
	7dQfhTA/3Pqdfgv9SHGJRDo9/8f0tbnZ1BGO7LbE54gmGduuOLZZryFn1qExAdT783/eNKXsJrEXC
	qD9m/aWHtbubbCzfEeYgJcTvrFzAoKnAf/rgG+zYyhmkToM4i/0QwipAz4mzDoALElNGb2ufpTbHY
	jWgZzvBHM/XkcnUzgQ5v8NZISVcZ91HA+3Iz5nX09WJmaqVL4lrx+JIdRfCTO1+xQPtbPsOfllu2F
	ag9eJgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTS2-00000003QKy-2rrc;
	Mon, 23 Nov 2026 12:47:18 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTS0-00000003QKH-2BFc
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 12:47:17 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-862b090e41eso1772032a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438035; x=1796042835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=tGLkh50R8v9rwn4ZmaT6oQlFz3xM2HQ0Zk+/b7vse7U+lxW91Rdej4clibfYS+7j4R
         c4qh1KiR7Je24HIaY2p79zF0h3pMrEenXbJuJysFrwuEmEnDOB8pQwilRrBqEwR/MyV1
         FxhuuG0Vuoc7SpSEfGptHIjrdSzgHnbTtES9O9MbpfjQHjbsPObbMIr6WmJms0JMOhq9
         czo4AQ/YicpNTyiPZdvEitxLJpbGGTfy/vE5E24PZ6ZoiPz0H7A7BpRNNecv2wrpgyAt
         qHad34y131Eeh7yuJkW0YiBjDV9K1Ary4TCZ2cM0AsjW+1D2Agt24Vct4m5+y2NbinAD
         Rt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438035; x=1796042835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=iQOVN7o5UAQFGF4kfOfBK8kcdV3ytprHRszPXLoSfbdmId3H8XS/5mqNUXhUTYWSs2
         gaqtAi8IX2L+SDCaSQxPzt8FpnQjmVc5p8CG58N0ywSyMLVU1jRKiutMasJGVswTWR1u
         MpHQ7khHd2k//ihrvLjWMFcfbzqWPwKUF/ol+NsbT7Cv+1mCDfDGEPT7iFY2/0d34ofX
         TlJxj6FO3U3gp3GaRU7l12qC8qjg4KvxHZXsGF/62nenarWO9eIOKdjq8dMHSvD9NyIG
         jz1Ole+XvebgPTSUrw+QYkRPf1Indh3zF0FfgDAv93WbVQFurTIWMEgx8yYWi9Zlg68W
         ZMfA==
X-Forwarded-Encrypted: i=1; AL+hErF9mpuRrsG34uQ7pQYa4MgPb1EhAA7ebvzQbZOpsTp2TOsm/H1//3cGHOq2oeTqxsxG1W5y//0Q5yR6aQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+95RIsIYWcPIa3rYg8+uWsLvWR+bFDMYoHfbaOsomnyqMr06dK
	IO2IjE+nHKEyz+NRQhyEon4nRH2jka1WK3yn7IhLHb5uaSGpeO7Eyj0bjdePJsXx
X-Gm-Gg: AZFdTZeGCJ7TLoUgTwYnwGc+hwqdcnyi1QXvDDyLjnf5/zu0t1/2OdUKiJ3qnzbCNVG
	YaVXGp4UXUcIMYf2PWgx47m2ouQ5v9jIqbkGkPx7ARXmFuaEYH5wYUyLS3HvVobD9CZ1w5Kz5Ir
	8B4HyzrckJB8wqiYP/yQGQPxqSTZFTMqX7W6/LZval5B/xsL8ZwNazslqlaUFU2tCmx/VsBJqqs
	cCzAemWjyLpgJSXuBhrJabi7ypNd9ZnHUN6LrT6DLLcvobU5R4MOBgPu8CM6dtKgXUl9am2l8eD
	+GXYazEyg3p7IBz9Zz2i/9O4s4eEksk8qcqQd7/+C5qKcGKSTeN6k/6/IAC1p+tTV8HKTXlTEm5
	RE6+QhxBoOK79ZYuq6PvpmZbmXUdbXvC1rYZOhrk04DII2YXQNQRcXU3MvCMUkvAp5ZZ8y3QWdt
	inU87hvpvFlW/NiPItTJpTq8opd7ANLaAq5LFN/Nnw3Pj0/9lV/bO1eE1AQdQmB4VAzFG3o1Ju6
	ep76qFScajiBhhLaVuSD92JUbZIYy08eA62CywWEEFNd4gFmuQ9jd6RH6TNP2JrDQ1n6uW5rhyN
	xbsKdXg6Yj4ZMyVOBUdRpnVho/l7
X-Received: by 2002:a05:6808:2224:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-57a0bd98885mr12866171b6e.44.1795438035324;
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250ef2sm9385288b6e.3.2026.11.23.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Date: Mon, 23 Nov 2026 20:47:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, me@ziyao.cc, aurelien@aurel32.net, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <nke33b3mdeut4fmp2noqf3xknpfvujesco44va3yamecdb722y@u66rmnx6t6gk>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044716_558186_5DD0A70C 
X-CRM114-Status: GOOD (  12.39  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 09:24:52AM +0000, Troy Mitchell wrote:
> On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> 
> v2 said why only banks 0 and 7 are exposed, here and in a comment
> above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
> key and the SSK, so please keep that explanation.
> 
> [...]
> >
> > +static const struct nvmem_keepout k3_efuse_keepouts[] = {
> 
> The comment belongs here.

Thanks, I'll restore the explanation in both the commit message and the
comment above k3_efuse_keepouts in v4. I'll wait for feedback from the
other reviewers before sending it.

Regards,
Jiayu Du



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
