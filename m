Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A6C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ad6Qtht/jODNnctCaQkY9LaUVm/MJiPf7qfcKvMYc+Q=; b=zNxa8EMZoEBMY7
	EbLQ3Yd6OLrW2866owUNWZtVkQC0ZuJ9HhOfce1FQb1bqQG59sSn89ZiNDnxdq19AmRrgH+RQQZsP
	wrvkjCvUJX5TMqzJWkCXxDQdOfEW2GWmByP1jABFLPviL9IZn93e1ER9IsUn7f6nmhXWCFFio1pnJ
	twYsfoxuROl9WnM4xRMWu7qiB/X6dwLPQAKAaamL28m9+XK9iuPrQDA0oQMoEToMiwjpbHOiaOC1N
	Eh5F7POULhBWVdrT6ZyipgUM1KdYRVdwHMkthvlz3cXIiFKNeAyPY2heLRnS1ZRVmVFhAklNUzpgZ
	ZQ5c+kVERfcR/HPSj/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsG-00Hb2p-22;
	Tue, 02 May 2023 03:40:20 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsE-00Hb2T-1V
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 03:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oJqeDd8wiAbKpJHextv55A19pRnHYgFw6ohNpRPhSFk=; b=mopPGI0naZ5+L2yA+hZSX7clow
	cZ9FGYwnGhcF7ECDceBFwv9KqtdWpNjR5I1e6JwNbU5obcZoS5JpxQuMP+0vkjyM37LXu5vyFEeK1
	oqeH4y/m/gWHFzRdpAqkzgebj6V5coCvvKIxr5LQs9nFxz+Nc4/xrD3Jn2qk17UZK82R6QEeuOeVQ
	4lrjDKZ8lqlR+krOEo62ThVcSsXtmS9G1YEtAgTZYckIP1svMIVPuHnxaP5ELOpfWPVfKM4UYBAmB
	q/dEaUWPPQN5YVynoNoXPNWyl+szdVfFaLPnAaUXd1YAPKpNhPmc+bLXNj0QgNQMZ4KzeLlNk1lJI
	g3oI0teg==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteSJ-00F4w9-1I
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 01:05:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b51fd2972so2250582b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 18:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682989520; x=1685581520;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJqeDd8wiAbKpJHextv55A19pRnHYgFw6ohNpRPhSFk=;
        b=yrFTfS1/qdtFx4eNZtlBCAJQOLv4cH4IXYhlYPnglfJ7owEi8CbB6OgTZqhXh6YqDi
         jPzJk3iRXmvMVdVgc4pnikWtCIDaWFVfcFM5pR8RlPH7k58sQZmmfFzEONqIlv9LTzlp
         WWxislPSCKQQQ3Ygsdx1tsUlMYmoYRjyQYOtcJQlukDmRF1TPWaw7CMSrskKogEh0mjg
         JtGT6AfdyOFQe9NH9cKvm1IW2ejT6U/eLLIC6hjUHPfqnAulCdsFP7DXtXEopnnVKpgs
         dxIm47RDRYF4zonB9ROwxfl90rTeSkJMZPfsimfTqiVeL7F/u/aJxodVFUqzuNyAHIuu
         1VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682989520; x=1685581520;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJqeDd8wiAbKpJHextv55A19pRnHYgFw6ohNpRPhSFk=;
        b=WrLYF0rHBxJY5xUzZHOgLgDZQoJQnQmnN1ZnyShL+Y0lKxE6R+xbX88CDmoEAE5lx1
         v92d/RvePKAeSpH0/Q+wQXKMouMW+81m5WYz75unqUBkqbX9NUc0FtVxn1NDMdO18pfH
         ciTfVgKOs7h/mHB2BVwMhDz+jcaHxf2afbHSWVscHDnkSok7ZY0m4CqEA9fFya+c5L+Z
         Ur1pGO2dW+R5vrGIJnMLnlmCD+3eKiJEAjLvPcT6v1J4j2LKz9fZ97vIn+Bx02+1WufD
         L+HuTqpy9dbHYgBKTJ2nLA15bDF+Jax5R3qHnaGKu76+ct9lNV8GThqO3VKISrfyq95o
         c4vQ==
X-Gm-Message-State: AC+VfDxPYXRaKMFvzaR4KqC4QWfvSeHmS5SqUO6opdXyjJsf0cmifEao
	onnpL0H5yXlFHJz5nv50B5CYig==
X-Google-Smtp-Source: ACHHUZ6V83vEeX49JhmQn63fCznHdd5VP9/FdXMzSBHxNKuugzdw+Go/l2RCeDhBXpT4dqrPAyKZDg==
X-Received: by 2002:a05:6a20:3c8b:b0:f2:8b2f:3f1d with SMTP id b11-20020a056a203c8b00b000f28b2f3f1dmr16974324pzj.22.1682989520341;
        Mon, 01 May 2023 18:05:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fb31-20020a056a002d9f00b005e5b11335b3sm20521025pfb.57.2023.05.01.18.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:05:19 -0700 (PDT)
In-Reply-To: <20230420-wound-gizzard-2b2b589d9bea@spud>
References: <20230420-wound-gizzard-2b2b589d9bea@spud>
Subject: Re: [PATCH v1] RISC-V: include cpufeature.h in cpufeature.c
Message-Id: <168298679771.11596.10416658702423364263.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 17:19:57 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_020527_361456_8D7E91A8 
X-CRM114-Status: UNSURE (   8.50  )
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


On Thu, 20 Apr 2023 19:30:16 +0100, Conor Dooley wrote:
> Automation complains:
> warning: symbol '__pcpu_scope_misaligned_access_speed' was not declared. Should it be static?
> 
> cpufeature.c doesn't actually include the header of the same name, as it
> had not previously used anything from it.
> The per-cpu variable is declared there, so include it to silence the
> complaints.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: include cpufeature.h in cpufeature.c
      https://git.kernel.org/palmer/c/c2d3c8441e3d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
