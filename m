Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE99C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaenWJuoLPoKATTWtEJBvwjfopooAgFCJhUMDZpkeGU=; b=F6L4CLaCiKWMXe
	FQ2NB6XuFIVJMgaXTS01gssiuyUKy2yMrKEmruUa1OOZnNVv7Psx5WKSvNithw3mxUoW3+XjfED2x
	idyQP6Z1r3TowMuU2XBAQsG4qaTS3NQYfAToh6sGR0vsrezQVTRQazpyfsLXLoQiEAk+8xaRX7+g/
	xZPJPm77zY7xvnQlaXekF321Nc9nRzVFjh/fwlHRq4/3I85sXtXC7CrH67ycl1Vvrr8GEOjplKv/D
	/hNpeRTeCIOpYTxEEf5pQdtddzLRiV72m8PFsPxPwh0e2MYDGdANwoCOhBCWqKBC8GIRYMjfsihEy
	XMHui9Dg+kAs3LLsAjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wtj-0000000HQUw-0yK3;
	Fri, 03 May 2024 17:40:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wtf-0000000HQQo-1UTE
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 17:40:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ee12766586so2583704b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714758027; x=1715362827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/82xQUaKpHFd5ja9o3RWf5MPJG6Dng7hHHVkQIw1XvM=;
        b=F+HcDr+MYM4YYiPB1e3tyknU8DYZRpHYtoffgl3ReDe7f81xbLAijPplNWgbbqw9tn
         2P+2RO0fVCsBAlloJ/dL1DfFkdWG7b+f/0+uKH94Mmf6zcyB9W3Z97JYoELSEC/B6+N/
         pFHKXFkAiRwFDGEjVZVHx98JLLnpeSVMFvnhgcfDnKGGbRXmPnA2J+o2hl+oZtZBLBdf
         j2CVy17qkzOtepLg8FZP/+xtS2ExQXSaODgpQJ7uwGTCSiYy0US3z8+NSGVJZVI4TE63
         ui3IY+NUqYSo/IoIDXRLcd20N5RPEvmWJtliJ3omIHFfxOO/k1q6Xh/Y2im4J0W1fAMh
         PznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758027; x=1715362827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/82xQUaKpHFd5ja9o3RWf5MPJG6Dng7hHHVkQIw1XvM=;
        b=DX868GgTsSsWAaQ+VHCUboV/wt3O6W3QPpm2t/wto59uKRDaqYHQ1+n/bW26p0sPH0
         J+GHXZ0vlECJOhsOgF0hnyjkd/skRpXGsPGAqAs6Mti3xtJyFeN1J1pbhlV6B5BDoR5z
         KweA7UUuSRNCYrEzYs+aAyMfnb3D9qyd5sJoVWZeWLoInCwUwqqb+VjXtx5rFu+Gydmq
         pD7GQxOd0dJS69I5l0Unh4JBhFETbCGzhygKhIgHWJFP3q1i3/64kD0h/M/dj8wPRbq4
         VdRRJkPGSGx8SQ4VoidBtvkPFynOh2VSTBo44r4XtHOTUlmC6rC4q8BdJSpCSjIGsWM2
         0KeA==
X-Forwarded-Encrypted: i=1; AJvYcCVG1OlbPZdUHWcslEXHXl7SIVaf2aIi55Uyka9BvLORddUhHv3VL4/2bwumRO/usbjO6T+mT1pajXGw23XlSBxAr2d3m0LtSGSyzHRTzbec
X-Gm-Message-State: AOJu0YwRuJ5af3teBx7GUQBWkoMqLmPz1JI/Z435D4kr5keBYLNG6T0l
	yU+zWy53CbgtPygN1e7sGNE99GAGyWGnyAt+mZxIVgkpbJdg4ExYoCjBJ78UFOo=
X-Google-Smtp-Source: AGHT+IFdJAuZ+3YLpENTV6h8pL82+IWNvGqri0KuLJzvvm8LygTuWoEoOCSYyZZSLsJ7Yq+5DGYxOA==
X-Received: by 2002:a05:6a00:27a1:b0:6ea:c7bd:90e3 with SMTP id bd33-20020a056a0027a100b006eac7bd90e3mr4451974pfb.14.1714758026783;
        Fri, 03 May 2024 10:40:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:f8a2:eea3:33:d368])
        by smtp.gmail.com with ESMTPSA id m8-20020a634c48000000b0061ea00c2aefsm954888pgl.55.2024.05.03.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 10:40:25 -0700 (PDT)
Date: Fri, 3 May 2024 10:40:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 03/17] riscv: vector: Use vlenb from DT
Message-ID: <ZjUhh4tts6+0yfB/@ghost>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-3-d1b5c013a966@rivosinc.com>
 <20240503-zippy-skeletal-e5f63c9f17c1@spud>
 <ZjUbpKKobaLXhqPz@ghost>
 <20240503-reviver-unify-b07f33cb6053@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503-reviver-unify-b07f33cb6053@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_104035_519535_816B0187 
X-CRM114-Status: GOOD (  12.42  )
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

On Fri, May 03, 2024 at 06:26:58PM +0100, Conor Dooley wrote:
> On Fri, May 03, 2024 at 10:15:16AM -0700, Charlie Jenkins wrote:
> > The DT is improperly
> > formatted since it has heterogeneous vlenb entries and has V enabled,
> > but since the user disabled V in the kernel skipping the warning is
> > reasonable.
> 
> I wouldn't go as far as "improperly formatted", as if the harts really
> do have differing vector lengths, it's correctly formatted. It's just
> not something we support in Linux.

Fair enough, not supported is a better term here.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
