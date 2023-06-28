Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44447EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnB/7zt8CWu3mAyNhC0o2QVLNfOfjkEtAhyCTZhToQ0=; b=LlmwB0zd6CkzdH
	xvaqp+0yElOujvRLHxsq123RK3hnRIMHhKHpPH4Jnq3aqdqjNQhqKKKWhIXa7ntxb/QZ2NiWJrGHt
	PRxeIwhHz+gEPEKtkXpvBVxaYWV9eJsMU1DrBP2q0yUzwQ3UknAqF2bEMi3INsTL0NbhTGaLsnhFT
	jCULXmiL7Nkf1QJ8d86XJTtfIKUulUsGihErQQ0W5Ab4k3Fk2Bk6Qd+x6NLirFVzIlzFuGpyhC6Gi
	w0asqbuXb0lQmM15/25QXKRxzwT7vqHQkb+YJwNEYStG0P00klLopAZFhVPh+hY2XbWFSF5nlFGHh
	1qLHmC4EBDWhKzYU8o0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUIf-00Fdof-02;
	Wed, 28 Jun 2023 12:29:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUIc-00Fdo4-2C
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 12:29:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-313f1085ac2so3280651f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687955367; x=1690547367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+/73Hn30Z9/qFlAesgRRh1yqPTxLtGthW/sft72KEE=;
        b=biTFYwLWFXgAh7bC73xZA1eta3vNuT/uPCAiX3RUNlQIesyL3vayeQoPILYKyl40tz
         +9FZgJhBKE/rS1cQzR3+ZINCITlLUe/3+gMwcQyfDSrNtjPUAU5TmSNfChyxswx1K470
         LmJaEHQY1JzBTMjwd/JOnmDr0IpODglPqCmHxRan+XS8WufyMlY/940g43KyTUXrimPZ
         meLgvWj63vCyxwHMICaM21gOo4ERn2pM4ibk1vQ32sFTuhi1SLY4gzWs341IJ8hafhpv
         jDDeR5URGQNClyuLnr5utfsDLye0WuQX1y01qz98tz8t/V4g5FpiXvgiESfX+9YHwgpQ
         KDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687955367; x=1690547367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+/73Hn30Z9/qFlAesgRRh1yqPTxLtGthW/sft72KEE=;
        b=F81tR/np24lotOywCUM9T6dHOPGJo/4/QZnHIUva9x2jxAWkA1llaabBFe5bCCWbSx
         SmPxelC+EvYf7JoxbGyoUk6FHa89LxaqYuAXXX8GEA0U0bEtTZbJjGgdvA8zjcmBG/aQ
         gciNdpTprR5i5QKTlaPOH7F7qJ39KuDCYJ6WS56d52/kGKiCuh89FNMJjsXF/hqL7HRq
         DWjktbHY81wV5COzU034R/ZnGNbWiFA2kJkr6LbkLWS/vBMm5Oy2aHiq+dcIw0l1lV2M
         pAPJ2LBNj8ApEGvHSv24uXhRXc2eUb+YOozLh9pMDuc2M6KAxWwBryxxnqpb9fiiA8p9
         Q4yw==
X-Gm-Message-State: AC+VfDxKv9WHNYTLgX9yukqopq3Q+1DGCDRnwJVCn7csW1ZuAPry5OOD
	p8QHlGtieV7LAJsFi/cCQD3DKw==
X-Google-Smtp-Source: ACHHUZ7Py18273KjWJU/FbRcTvns9S7wOmxcd7KNdChxScd1mSJl7GXIZLWx+YoWuBYMA8dTprdbGQ==
X-Received: by 2002:a05:6000:1292:b0:313:f7da:2b7e with SMTP id f18-20020a056000129200b00313f7da2b7emr5491984wrx.20.1687955367689;
        Wed, 28 Jun 2023 05:29:27 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm13382663wri.73.2023.06.28.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 05:29:27 -0700 (PDT)
Date: Wed, 28 Jun 2023 14:29:25 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Hongren Zheng <i@zenithal.me>, linux-riscv@lists.infradead.org,
	kernel-janitors@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Jiatai He <jiatai2021@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	LKML <linux-kernel@vger.kernel.org>, linux@rivosinc.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko.stuebner@vrull.eu>,
	Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <ZJwnpTieyeWvEkJ5@vermeer>
References: <20230627143747.1599218-2-sameo@rivosinc.com>
 <97a7d701-3b48-252e-6d78-ef3d0e7f8f03@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97a7d701-3b48-252e-6d78-ef3d0e7f8f03@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_052930_721543_98B978AE 
X-CRM114-Status: GOOD (  11.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMDE6MjE6MDFQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4g4oCmCj4gPiBUaGlzIHBhdGNoIGFsc28gY2hhbmdlcyB0aGUgbG9naWNhbCBpZCBv
Zgo+IOKApgo+IAo+IERvZXMgc3VjaCBhIHdvcmRpbmcgcmVhbGx5IGZpdCB0byB0aGUga25vd24g
cmVxdWlyZW1lbnQg4oCcU29sdmUgb25seSBvbmUgcHJvYmxlbSBwZXIgcGF0Y2gu4oCdPwoKVGhh
dCBjb21tZW50IGlzIGluYWNjdXJhdGUgYW55d2F5cy4gSSByZW1vdmVkIGl0IGZyb20gdjIgb2Yg
dGhlIHBhdGNoCnNldC4KCkNoZWVycywKU2FtdWVsLgoKCj4gU2VlIGFsc286Cj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni40
I244MQo+IAo+IAo+IFBsZWFzZSBjaG9vc2UgYW4gaW1wZXJhdGl2ZSBjaGFuZ2Ugc3VnZ2VzdGlv
bi4KPiAKPiBSZWdhcmRzLAo+IE1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
