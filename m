Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF563C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kt21F+VOPY0Mf6Iay5rsr8axG5fkDBFgMD7tFNpIaNE=; b=lgq/2KNMUuGHlI
	Gx3VZ27mbV5Ej2/uFSBhm4keJYnRPHXd6KOlyHXhZ/rKc9GvVBU7F9yp60r27/wng4OtIRj1TBnB/
	LYVABNIVzPninJk1mATkPgDYB+fiy/EzW7Vw5tkqjOfDYILrRf88QsGiqZWguDC+LXInJjRMhwyB8
	VDKOo1WJhe0h/FHNiO5Jx5ydhnDvdgQVZW84ZtRjZQ650o6YsbK/d8esKHWWd9OfdQpBONKQyBkNH
	ujqsKR+aCJK0UMzXXtnR0lj7v+tA5KlD60NH75GLX9HbpwGpho3A0FrJSm9kypDI/qy2Rv/CR+5rm
	9LQ+27pbDd551wrdgsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsq-0000BD-1X;
	Tue, 02 May 2023 03:40:56 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgso-0000AN-2E
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 03:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2LZi0uFoSVBSgxnjAaZxQ81ReVJ0WeW+B2FFhNfROww=; b=eEw5JD5+9JhLNkg2/hcw/upbeL
	/TmbISvCbRhfyttI9lXneRY6jmJDLfo7Y6ZFarPFp3Fi1jbf69Kqgy/xPmjOk8N14d82ahlO2JSg2
	xFUZHDK1lZu8DJ+iiAx/lYanEZGheeXHyqz0i4LlHSCH//b1Xx/tqyNMHhbqsDmO1y5sWjCTb2gvx
	GVuRn1MeWkApMFl5tZzitXcsfUHoQUX5sD4QAj9QvileowL5Flvzh05ty2dxKTJTc69hr78Zej3dY
	zHzvmypZgdk/QEYxyC2DZi2ZYyunhlHKWiKtt84aLXKwL6dTW+v+8Mia19FsREx/4J1fSmWLH+kz7
	q0IKj8fw==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcGW-00F2Lr-17
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:45:08 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-518d325b8a2so2632125a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981102; x=1685573102;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LZi0uFoSVBSgxnjAaZxQ81ReVJ0WeW+B2FFhNfROww=;
        b=ahejidMZTueaiJMvaEq7zIo8KZo9LgVrR2se3EgkY2xdLWi0ff4/W/mIv99jbch/zj
         EeSmY+8PkfMv2hP5iRkEcYcaktQOreBhcTpFE179BrMe42S5IFoertGSs/osFvwf/eTe
         PhQ3mnCF+ZwIzlFuczKeK+QsTTd2c3Fyjo5qMt196Qn8LF0kx5Xi2ccF0JjgGFt/UZqx
         7pqJLxR5bHSnkAf8934pj1cj07FDTnSTIZFzLZ3w91082zp1JG6ifY8ISta8wD0suIp4
         q8y1BQXEW3+/ZXzmPg6m3/5FudLE144YnISLQh7ZbxF/0tLMU5mJLhwUk9Qfutkwy7QT
         0jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981102; x=1685573102;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LZi0uFoSVBSgxnjAaZxQ81ReVJ0WeW+B2FFhNfROww=;
        b=Iri+5kdA5dl5GiFEps90PDCJIrHh+0s+QL2wZFx26ZAIOdMjmdKTjlrPNqrgNCyN/Z
         B5hqnMEMn1Wczn8Gdo74rdYabm0NcHgzM7PnLJE+YQFiiZJIBS2ikbF+U+aIye3Pj2F0
         tx3fHxOVtaNB3dXxbBb9lBF94dLrKuH86N12ibRSAj5wRNFQD78HGRtXvgxc8rlsc+sw
         Qg75irY9Qn/yLshUZoaZarDsapJ1jg3D6pXuE5R7+nEhlzoNyAAC24n0AYEOtat2Y1li
         3ogBgNPdmk4Rnkfp7h65ipMIntfv9c/4ZIZshUemxmUFe6bNcXvL7G20i+RXG+yux1TY
         0W/g==
X-Gm-Message-State: AC+VfDwrX9BYUz70ZjtHNAI9LQaJv0ryjF5eRMa2Qke+YgI+cGoqk3lZ
	cL4J5jXztXSyqw0xGlaLG882Ig==
X-Google-Smtp-Source: ACHHUZ5xmM0eXrwYAGux0Gd55M+QfxHl5MSIckzBt45AIO11o1GavlntEMZonuJdLzlh6wmdmSK7IQ==
X-Received: by 2002:a17:902:f546:b0:1a9:9a18:346a with SMTP id h6-20020a170902f54600b001a99a18346amr19548933plf.5.1682981101945;
        Mon, 01 May 2023 15:45:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902aa9700b001a634e79af0sm1639156plr.283.2023.05.01.15.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:45:01 -0700 (PDT)
In-Reply-To: <20230429-trilogy-jolly-12bf5c53d62d@spud>
References: <20230429-trilogy-jolly-12bf5c53d62d@spud>
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with
 ARCH_WANT_OPTIMIZE_VMEMMAP rename
Message-Id: <168298107622.32296.5069114246670068360.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>,
  Lukas Bulwhan <lukas.bulwhan@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>,
  Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234504_516101_79C27A87 
X-CRM114-Status: UNSURE (   6.74  )
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


On Sat, 29 Apr 2023 10:27:33 +0100, Conor Dooley wrote:
> Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
> renamed in the mm tree & that RISC-V would need a fixup as part of the
> merge. The warning was missed however, and RISC-V is selecting the
> orphaned Kconfig option.
> 
> 

Applied, thanks!

[1/1] RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
      https://git.kernel.org/palmer/c/26b0812f4cf8

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
