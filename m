Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC9EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr+9ktzRG1Qvsyr7zq0MqtfMS+elA06uwIZeK3cVymQ=; b=Stl7zDPKIPKK+W
	b7pI76nLnyf0oeBw+Zbpb44dCOzVGyWVGb3yurW51krHQ6opyJyF3j4iUFkBjfvmqweK4O+8NjptW
	jAt5tmhWrigmnZ/CENwCnxHxoxViEK8jNe3wmRdbAUR2+/SFUE+7hdkqBX4YvSS3reM4kAlmhXuFQ
	LWCc2zfH1j/JFDjkAM5qP7gz4f55XmmUyGTg+442mG0Swh6CYZBnCDBUXO3/M5EO0gcXax/VOVl1c
	9JL+/J/UJpToGReg/QwwN6XlIgWEXz3q4JUZaipZMVNycuvlJYEwEKW4swj6Rkot4ybRNIi7THGFY
	oB2tnmXU3pq0k6AT2aZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4sU-00Cg6y-0S;
	Tue, 27 Jun 2023 09:20:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4sR-00Cg6D-2O
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 09:20:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso2322553b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687857646; x=1690449646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XVsJFmdbd/zeX9qSRdmE3bRDD3BvbBKjmT7lzeJYFI=;
        b=OAh7TtzaVO+UlOOQJyJ9xrabLVgSegIz2fL6LaDa4WwjgyzbEb1kcP1FP6O5xnmvI/
         ze5AUKEwvYBZ5EInEFO1Xs8Bz91VCP1CDKxLgvIqq/0vmvSGb3d8ZpsYcfgW95R6NTa0
         Y1LEns9zGjIAP+sQ6yWFwwgsg9wA6DJXmUdw0qipm7cx4OmZ7D+9JBVs737Tu4+kDe3A
         RLiOXGmpaz4da0ZZO0Rd0vSn4R9sf9UP/KHJJjASR7lYQsJjLNwZXohdN1ZRFjTEfQKE
         FSFbda42OutWyZ8vqY04cw93WsQzMewkqFE/RbfWc7KXa2UrdRpTfx/8a3Gw5J61MbSK
         rz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857646; x=1690449646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XVsJFmdbd/zeX9qSRdmE3bRDD3BvbBKjmT7lzeJYFI=;
        b=P8JDXmTesjD6cHPzsWQ8CpqZ05dUb8ULCFaOML/w7vqW3YQrZ8w4V1RHDsl5knOAie
         Iql0MJrK5uF3+r9bouhEWoJqgX1s5m0z7YHeMSw7S0I4LKUSKbyGrmRScfRlBiIk4a/M
         KC0ZHoMqulzJoVj/9WgLX7RQmdktao0EdytVW2bASNvYV76K7vcUDqabFSYeTBYlgdoK
         hIPe5cggItvaY7VMg25/81fFEHG50TbXcCzUZYVM2G8+SFsPg6p1SZidbtTv1fbIpuuG
         WknfEiJR9CFfmlOdwNIwR0PdwyCYWUzCs9fF1FXMBTICbl1AN8CI9fYXnsEOnpVjnz5E
         0KNw==
X-Gm-Message-State: AC+VfDxwE/7mMQIlcjlp8NxfexRM0BM4jXVAoLV9w7bTYoIBKvLig8up
	7jmvfwBQM/brPZhXP/bHdOx+aw==
X-Google-Smtp-Source: ACHHUZ5vPLufFchNUQw5j9frBzLGgGYE+5r/0tShLekGK+7fzkOQrIPjVM+qxgeIgQnyAqFK34hU9A==
X-Received: by 2002:a05:6a21:6811:b0:ff:8d85:9f24 with SMTP id wr17-20020a056a21681100b000ff8d859f24mr23766079pzb.50.1687857646470;
        Tue, 27 Jun 2023 02:20:46 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b00678afd4824asm2694935pfo.175.2023.06.27.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:20:46 -0700 (PDT)
Date: Tue, 27 Jun 2023 14:50:38 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <ZJqp5nRx22J9ty6J@sunil-laptop>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
 <20230626-dragonish-romp-9acf4846ae01@spud>
 <20230626-4fb963235f3ab08383a6d9ab@orel>
 <20230626-ragweed-whenever-5b22e180dcd1@spud>
 <ZJqXj7UdegnRP4mI@sunil-laptop>
 <20230627-gosling-crouch-635c07ae05b3@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230627-gosling-crouch-635c07ae05b3@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_022047_778534_0C724ACF 
X-CRM114-Status: GOOD (  26.05  )
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

On Tue, Jun 27, 2023 at 09:51:05AM +0100, Conor Dooley wrote:
> On Tue, Jun 27, 2023 at 01:32:23PM +0530, Sunil V L wrote:
> > On Mon, Jun 26, 2023 at 05:16:09PM +0100, Conor Dooley wrote:
> > > On Mon, Jun 26, 2023 at 06:05:40PM +0200, Andrew Jones wrote:
> > > > On Mon, Jun 26, 2023 at 04:51:29PM +0100, Conor Dooley wrote:
> > > > > On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> > > > > > On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> 
> > > > > One of the few things I know does parsing of /proc/cpuinfo is:
> > > > > https://github.com/google/cpu_features/blob/main/src/impl_riscv_linux.c
> > > > > and that doesn't seem to care about the mmu, but does rely on
> > > > > vendor/uarch ordering.
> > > > > 
> > > > > Makes me wonder, does ACPI break things by leaving out uarch/vendor
> > > > > fields, if there is something that expects them to exist? We should
> > > > > not intentionally break stuff in /proc/cpuinfo, but can't say I feel any
> > > > > sympathy for naively parsing it.
> > > > 
> > > > Yes, it would be nice for ACPI to be consistent. I'm not sure what can be
> > > > done about that.
> > > 
> > > Print "unknown", until there's a way of passing the info?
> > > Speaking of being an eejit, adding new fields to the file would probably
> > > break some really naive parsers & quite frankly that sort of thing can
> > > keep the pieces IMO. Ditto if adding more extensions breaks someone that
> > > expects _zicbom_zicboz that breaks when _zicbop is slid into the middle.
> 
> > Instead of unknown, could you print "risc-v" or "riscv"?
> 
> I don't really see how that is better. "riscv" is not the uarch or
> vendor. If we don't know, we should either say we don't know or omit the
> field IMO.
> 
Okay. Makes sense. In that case, I prefer to skip.
uarch is anyway printed using other ways. Even in DT, this is not
printed for generic cpus having compatible string riscv. So, consumers
should expect it not being printed.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
