Return-Path: <SRS0=wiyu=Z3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C783DC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 23:15:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9605824658
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 23:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VuJH4VuE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fF7LHLt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9605824658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=StZhfAUYQQoX4hSeN7hmhB8YxNwfE6easEwqsPBfh9o=; b=VuJH4VuE8LpHiuvVAjcKdJtTu
	HSm5ldHCcxTgw5kDNdnzg98lOj80PggGd4qfsmdbbV5vNUWdiptnnTs8f3ZgwvAt2AvvoKl7Hfkfn
	COJ655DvoGOZ8lr8UONXGab2r8AaR5mXCEMm7XCs97hMrkija2RvfbeKPLbfA2Y8fSi8J/+Sj3qVV
	5V1Fi6/eNaJhMenY9WsqYJ9LLQ28Xlzyr709HQQuPKuN1BTRPFE4J25Pf6CNY1M90VRTYVt+8kkso
	Nq6NzUtzLHDQVsUgxG3mfQL1EyTRqdD3Gx4MK72oOC482gG54FEgv1rAL/7imOWdye1aJxRyVwusO
	Mf3stt/1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id0Kv-0004XF-7y; Thu, 05 Dec 2019 23:15:05 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id0Ks-0004Cr-Cz
 for linux-riscv@lists.infradead.org; Thu, 05 Dec 2019 23:15:03 +0000
Received: by mail-il1-x141.google.com with SMTP id f6so4544110ilh.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2019 15:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=StZhfAUYQQoX4hSeN7hmhB8YxNwfE6easEwqsPBfh9o=;
 b=fF7LHLt5NfogWQmdGHQc1p/sFHLwFSySpSt8RlN6ociIGyw6Qrui71XT6rSxFOrlGj
 u+mz5XhPYWipDeJMktJSJ0399DtB7JygbnK98hSZLw+ewDoPIY9NxJkW2jeDgXgr2MyQ
 4h7bYy9AfTg0wuk+auK6Tt78//6AIpCBjas1/3E0OAhT+VBhf8qR5axwBS5KTJ1+RCdU
 y1GedK2ClGrCdjAe9BammfNeqk0dpewSESqeiE0hGh8e8qRi2ErrIvoIkTZf4SBglCEO
 VJFMgbqp4a3Bc6QZggD+Lx1UhbBnOfNoI8DivihSsgAc8GapXu/n2byIJUlCJvtPC8Bs
 ftiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=StZhfAUYQQoX4hSeN7hmhB8YxNwfE6easEwqsPBfh9o=;
 b=C11viGHmbf4Igsym82PTITk6zm0tjJmrzkYpLOgQgMITo86Bs+zX9IDPBRq8uLlyeF
 XCZTcQuFlU+a+YByrfR2G56jfWA0X69hVsnIq71E2YVXg89SWVmrwjf74+IWmzL3piZ8
 BUuX3jxrcZBKHSRleGbN2LZp9ItxickteS12NIgi9C8RAinStcZ2i2oBTB39V+vxB8yN
 PSc4zaRLy8vLLRFRsDljnU2NHo8K8h0Kf077iTL+3ptScplv44p38bqEubiw3I616eGO
 TAAd4ACP4BNuffzOqZgQYh6ctPLs0IKw70n2wmCopgNeChZboRSvQ1mgw3IfInSTiy4c
 DMaQ==
X-Gm-Message-State: APjAAAXeS3t80U7kaOVpN8nEGPZTArhXcCCaZr/6Mj0pYdpZ+C77s7eQ
 88LPySZ9OuVC7JY86x1ypAnoyA==
X-Google-Smtp-Source: APXvYqydf7mBx0+Uo1plA0d7tO+7ImshuSiBG4WEJNBPDdtWKuLvED1KnHVqzaPR8FxH2svgWvllyA==
X-Received: by 2002:a92:8458:: with SMTP id l85mr11587638ild.296.1575587699432; 
 Thu, 05 Dec 2019 15:14:59 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id l26sm1721358ioj.73.2019.12.05.15.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 15:14:58 -0800 (PST)
Date: Thu, 5 Dec 2019 15:14:55 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Add debug defconfigs
In-Reply-To: <CAAhSdy2ySO_TGL9EYsHnk2p=tceRGaVfogyhthqJEJf-AoOCYw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1912051512590.239155@viisi.sifive.com>
References: <20191205005601.1559-1-anup.patel@wdc.com>
 <alpine.DEB.2.21.9999.1912041859070.215427@viisi.sifive.com>
 <CAAhSdy1RQw3MVcVT5y1EHr72LDNADKRL5nO2E8OrzBi+tpuvtA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1912050900030.218941@viisi.sifive.com>
 <CAAhSdy2ySO_TGL9EYsHnk2p=tceRGaVfogyhthqJEJf-AoOCYw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_151502_457136_ED7F4030 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 5 Dec 2019, Anup Patel wrote:

> On Thu, Dec 5, 2019 at 10:31 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > What leads you to conclude that this was done for SiFive internal use?
> 
> Why else you need it ?

Suppose you were to assume that I had reasons for doing it that aren't 
related to SiFive.  What might they be?


- Paul

