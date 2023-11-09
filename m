Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7ACC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WtLw1JLjH48yOg3LEV2mWVxXBu6BugUNdj8F5Fkh5OM=; b=xzK+VDibZzggOa
	Z6gWXMYQvRBAYofmI3xaYxKtktgptS62yReSLYTecbf00nrb9uMi0aGfSFKhTw7OVO/vNzAPh3ZcU
	ZDB8yOWx02Fbtpwph7QM4BFm/AjiUUHLkH1V5SUUYlClqjPEQLnPqE42t+ljdRjZHn1NhxNncOSwD
	FWaQgWaZTkGEGnQUwfC/1o7jEWSwygTMaRbw2NKGdzUd3GTh1AyZkRzJfHlDIbELCVvgn3twgmB1V
	4LKzro0XMl+7xc41lncKQfdpZSNjkKRCDrVuIUJYlu/tlR7JlURue3pkd3t1cizpAstI+o/pBZhJR
	U3Bb95UtUe91+3yD+OpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1DKU-007L6B-11;
	Thu, 09 Nov 2023 22:16:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1DKQ-007L5S-3B
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 22:16:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6c34e87b571so1313469b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 14:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699568203; x=1700173003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HKduoMG8Yp5vWx4/ewVg9EZz5GecYW5CAOZ1rPgLq8=;
        b=A2YDhurYoo3nsLLVDPepmkp+nF/kpq9ydevgDdVG7NTkkhkCzoMfVajAfbJp12bBBt
         vDESN66aQvculvMTO0lX90hfz5ge4IdFP30FG31xPwHDGbLk3nNUic6CyG7ag1lBpa9o
         iqt34cpr50OG6bN8WooZmt933D9Oxa6glCA2x0+AXx1F2co2SR5u71tFmCFGtjNtD1lK
         hH0zcSyRA21Ym4NinD/HZe7SiKcK+LJr2cmcEiX5WWomMbdj8J4/1Z1um9LnwPg2+B7k
         b1UrmGMX3hUnR9Lq4sP3BvhGuvO6CLkZxUnhZU6VsfYh5Ej3GHwNO9PrhWVEctkPawoq
         P5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699568203; x=1700173003;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HKduoMG8Yp5vWx4/ewVg9EZz5GecYW5CAOZ1rPgLq8=;
        b=E15H8z9om4nAs8S9hioR3timoDiQ1njuCT3eRmPP/ULzMUa345/Wd3pElYI+SwFOIR
         4NZdL6Jyk0/zRC049oDum9fIBvY6dLfW3v2vS9mlqJUrrK01Fag9QVT0PI+fJZQHgO1G
         7QTd5I8AInxZ/xlVGJDLDWqNzucV+B7oTpAKOpVJKOBmaViBdvwSE4zSfdoEiMtE8xG7
         DSp6RlpdCLv77YehzyJwPn/I6tAbkzs1c/BIOk8vRaYiZ3Ox+tCwjQqd6uhVI4TNLjKa
         dypBdA96jPoXbnqOpvhf7JwdIezYLvLECHyfL7BKfxZJQPaWG1wVOEjmiPjZTkkfDk4G
         ld8A==
X-Gm-Message-State: AOJu0YyR0uhF0sdQs/ArNrCnwCVJ3rimSIILIKsbmJ5xB++kXaw4NYED
	1KTAcXAFN9BCvh+1DHEfIy+GvO6ZL/ubbB11fRY=
X-Google-Smtp-Source: AGHT+IF8mwIxK+9xpTYJSOq5Io4CWENcACz4DUMFPEYcamlSLMwbTcGeVjmciI0L8KsOVtQe6B5EZQ==
X-Received: by 2002:a05:6a21:a58e:b0:174:129d:3978 with SMTP id gd14-20020a056a21a58e00b00174129d3978mr8012528pzc.32.1699568202945;
        Thu, 09 Nov 2023 14:16:42 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902eacc00b001c61901ed37sm3978242pld.191.2023.11.09.14.16.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 14:16:42 -0800 (PST)
Date: Thu, 09 Nov 2023 14:16:42 -0800 (PST)
X-Google-Original-Date: Thu, 09 Nov 2023 14:16:39 PST (-0800)
Subject: RISC-V Linux Patchwork Sync on Nov 15th and 22nd
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-0507c0a6-e72c-4c0b-bb0d-7ad60afd30b5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_141647_286337_3ECCDB28 
X-CRM114-Status: UNSURE (   6.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I'm going to be traveling for the next two weeks (Plumbers and then
Thanksgiving), so I won't be at the patchwork syncs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
