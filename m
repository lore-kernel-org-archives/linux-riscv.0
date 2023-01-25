Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B03C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HxBF6/1uOKGUSxOUzVg3lM4gxW/iF44DfqeffAUClM=; b=BcRYU7lXykoGgv
	8wEz4sQqAtESRLTBagnYzaeVUV60Fn98G0sl6PSuMaN94nDnVyc7ToKjFw+wTw30n2ovvvGJSNgpv
	ZXnnlUtrD1ABfIIhqvWSKnOTsR+6wbe74+2sdXr3a7/aDG6ncD1Ou/k9KiycE4QdWMt8pe4muiX1i
	b7emWw1f8r84bMzjRcVBbRKgQ2iZDS+mZB0UjvPV916wWw0Klrz11cAFefPDlqhQCGn/i1kWmn18n
	N+gw9uY3gfPLdgBxb+LnuvqVleogcp6Ok40bzq5/X4Yc5iAIN5+JXLj+TuZWQxKHpvaFj1h8kTffM
	KPCpSH8ma0m88NESRNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkEq-008IX7-JQ; Wed, 25 Jan 2023 18:11:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkEj-008IVm-HT
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 18:11:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id c6so18667088pls.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQD0shi11rZTj5LNtv6GYSFD9d2uw2BA5/okkdV1qGc=;
        b=IC+bFBcFvn2PSd7vnbhTc6y+Ojmi8ByU5GrzrtzXea91y9WNsgbZnCgwGTZLH9F6Qm
         rI3GIA9XnXPmDV8tktseWWQ7prZFJKKor3tDTVbQ94JVgssUmgcK9sXRi4FxmlTvPiWh
         WSKMlPbjrGUxIqQs6zFHH30mS+zaNyBjd/rLHkChryFiF6HNUo0XVuAAGnvW5mY+Ew0a
         TvpKv2ZIYGNQPqAW1QeD4x8vokQiJN7nBiB/Nw39WfHKVzH7fDOpIbVRWJHXDZdEOsSV
         f76xbzkPgl3U3r9G5c1H5yD4zK8gDqNZY2tkvEc9zWSRqJpnm+/AfcuXHwo10il1282Z
         1p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQD0shi11rZTj5LNtv6GYSFD9d2uw2BA5/okkdV1qGc=;
        b=5Tnr0yGFrBBY2JsePFjVgVCFF+WLyCojo12vE5lOLabvKZVRFRXhZWDAGrbUxC9hCV
         4fSJfGJUMELJBi9vKbWRTpC3xsIVy6YpBOrogug/CviHboy0jsGFGd4Slvcs12f5nI2g
         jMSNU/UUttJApc2tD00M35PT4IBK+av/X/BryXrQKTcKSWeR+Y+O2Bj2U4Et8BtdjZMz
         OO6GB9b9Ae9urFAdw9t46lNx+uQnSMji47PgvU4e62G1HkA8LAY6vU7PS6PxPeFMaAih
         yAwJ0tb8vnVhfN1OFkWKJnWXiNd6l/aUNUJ12TnBA4MbI+iWeFFMsUOWlDfm1lravAmx
         vbIQ==
X-Gm-Message-State: AFqh2koZlDma0ExjwGoiPrNqUIYcsh9fV1Enl2IWqzj4kiCti8b3uMKT
	wRKrdR5krmUys5tHr6ZZpbDdvw==
X-Google-Smtp-Source: AMrXdXu7+jQL329BQiKXN9pflTqeYS1ZPGEtU3VDiQ90DOui+Z/FxU2rxULGW4luUM1uoFHBYTlJMg==
X-Received: by 2002:a17:903:210d:b0:193:3a92:f4bd with SMTP id o13-20020a170903210d00b001933a92f4bdmr29203740ple.47.1674670262165;
        Wed, 25 Jan 2023 10:11:02 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b00188fadb71ecsm3961963pll.16.2023.01.25.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 10:11:01 -0800 (PST)
In-Reply-To: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
References: <20230105033705.3946130-1-leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v2] riscv: Move call to init_cpu_topology() to later initialization stage
Message-Id: <167467025508.9605.6900641961195110953.b4-ty@rivosinc.com>
Date: Wed, 25 Jan 2023 10:10:55 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Andrew Jones <ajones@ventanamicro.com>, Ley Foon Tan <lftan.linux@gmail.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Ley Foon Tan <leyfoon.tan@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_101105_826409_038B3744 
X-CRM114-Status: UNSURE (   8.58  )
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

On Thu, 5 Jan 2023 11:37:05 +0800, Ley Foon Tan wrote:
> If "capacity-dmips-mhz" is present in a CPU DT node,
> topology_parse_cpu_capacity() will fail to allocate memory.
> ARM64, with which this code path is shared, does not call
> topology_parse_cpu_capacity() until later in boot where memory allocation
> is available.
> 
> Move init_cpu_topology(), which calls topology_parse_cpu_capacity(), to a
> later initialization stage, to match ARM64.
> 
> [...]

Applied, thanks!

[1/1] riscv: Move call to init_cpu_topology() to later initialization stage
      https://git.kernel.org/palmer/c/c1d610586946

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
