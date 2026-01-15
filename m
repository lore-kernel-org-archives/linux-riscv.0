Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1300DD4663B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8MtpYb//19HOQ3ByyNbEgio8cstILEW6q1VHo79zi8=; b=ZqVz3NrE/biiiC
	f2k5/+6KGY8iPgsfak0lYLz7BvD/mix0oq480IjqYRAYrKLIF/LG1oiBdfmm5xAxcoSHLmr+EvMHz
	Gjd84/Y7zy+Y1h91F/SP/HQVqQJUISZiDFdpqbZEYvlrIfIPgIC2NPct9PdJjMlSrloCghOarOQ7W
	R32BeBuQFHHmu1VCU86jSYqSfVP49PVCrgBFh7TrvEdeDwBgpobEfLUYEot012wL26p2C3MwiEGhU
	x/8sAqWAc2b5sacSBZ1Ruy7Y6oPPZV1rTKVctxJRA54nZ5H8aB6t/Wr9r8a/nFrTOms2bIfNTGTRy
	f9qOm2Nbj4csPiJrJjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzI-0000000DKHT-2QIF;
	Thu, 15 Jan 2026 23:42:48 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzF-0000000DKGl-3c7w
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:47 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79275e61c2cso15933037b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520564; x=1769125364; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6vy68HrZiN7lT0nxeuJXtxrb4j0PV95v5MAtlSQSF0=;
        b=C61nLbCyMYUjJ7uuwL7Q2W+3X9Bti4he/+9oWfk+VVgSOddS12vdqjBryWCt0ujWCa
         IqgHr8sedAVnab8IM3HnytkVnKanTsOExgDX32wzy1ayNw5wNkEt2u4C7StPsYeMuCF0
         hf7F9GYvEGR0SNVifsRVq6CcAEpXN7nI7Em9hMCaci3PoJRCGM0ukSGnf0sZOuKpUhb+
         HO9HH0X9mUPuJr2tfUnD9paTT/ZA5LPhIFklWz/ZN/mOnx5HjkYOYwNZD+zse9qdd7SI
         OzbwvDSddGYfZH4uS8q3fh/aNFn8ipuERvyQP79JvFEiXDhXpNRQT2t+ZyrQlqWtCkzG
         aLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520564; x=1769125364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6vy68HrZiN7lT0nxeuJXtxrb4j0PV95v5MAtlSQSF0=;
        b=fndTBwLjnLzekGNRUp35tIdx6r+RvLuHTwONZBG53rzDt3Z+bCIX6seM1qElVCrMpx
         piJehznA484w3kzm4i5CijYK5IwESZDVgxGWKLpXvo0QHy4RZ/637IdPPzPL5e6xb+3n
         q3GHONl68PpEO3LZJEsMRYpF6kR1HvZk6y+9IJYK7xJYGADZ2L8KJvZHP8kfEkiiQj/z
         W9nfi1ogMRzGAQKIFHUN7samDVNpM8nn05SgSYLpbNFzaMwrGwKsmLIqJjDxQDlNEjQV
         ocBhnI5dO1i1sbWGev+SImDj5z2EUeJ+SCRTUt0XP9IpPEy8zDnXpNpFc1BTjoPhtiMX
         f8Bg==
X-Gm-Message-State: AOJu0YyxUCBspPF2sq36J4H9d6+6UH7eytjcmrZ+HnHO9VvBqnZyugj4
	jRHRh5fHwGWwGjyAg9gIGFMO+UqeA2+XHRCWbEUxq7j7iqVTmfFOqyy14SNvUuxagwE=
X-Gm-Gg: AY/fxX5OtjqDKI+d6+bsXPV4VSwNGOjXCRaLMkc0G5YJscETQHqM7mKi9W5FxFSEE1Z
	74ADJmj+rgLyBgDyuMSH1ZOE0LDXSdNJMZAFV56vQbXpk3bN73LGOXwf2xSeqKqeoynNXhhqWk5
	TMhcuRvoYbMeoihD37NPfcfn9JIZ0za3/t9NPGrsm9SjXym/2akNFNJ0nnA3eL9VRGrlTl/7LsJ
	9qokwK+vY9DCX4jYXXiIgQpR9TaVr3bWrcMLc0JBs3EyGduQIIUtD/81Wzd3/SrB0snd04YsvjF
	Zf6PKhIT3wWyCY0WCv1W9+8fQfGwqGuSgr2tJhsHNjseTATyfr/VSFEoDMBAA93DORBORl4bOIu
	Ub2G6X/Tl80xz14lBwqVUqHYs6cZZyMjsOqrq0zF4PMHNaRRcupdH06AFDHPHpAzLuhHcodMuXb
	yWxrIhIHaeiyFt1lENTIDxVit/rLKm6FhDDbdNI4qiFNrIy870zE2YQfFTnskfx5VquEJeDYTi3
	3Ymdb+RJg==
X-Received: by 2002:a05:690c:498f:b0:784:8338:ff78 with SMTP id 00721157ae682-793c67115eamr8895767b3.29.1768520564077;
        Thu, 15 Jan 2026 15:42:44 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:43 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH 0/8] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Thu, 15 Jan 2026 17:41:59 -0600
Message-Id: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEd7aWkC/x3MQQqAIBBA0avErBNGF5FdJVqYTTUkFk5EIN49a
 fkW/2cQSkwCQ5Mh0cPCZ6zQbQN+d3EjxUs1GDQdam2Uu4OLN4vy4fSHqBUtem1x7rsFanUlWvn
 9j+NUygfoh+4lYQAAAA==
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154245_950985_09522856 
X-CRM114-Status: UNSURE (   8.52  )
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

This series adds support for a Syscon block in the upcoming Tenstorrent
Atlantis SoC that covers clocks and resets. This block is instantiated
multiple times in the SoC. The current series covers the "RCPU" syscon
block that controls clocks and resets for most low speed IO interfaces
found in the chip.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Anirudh Srinivasan (8):
      dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
      soc: tenstorrent: Add header with Atlantis syscon register offsets
      clk: tenstorrent: Add Atlantis clock controller driver
      dt-bindings: soc: tenstorrent: Add atlantis resets
      soc: tenstorrent: Add rcpu syscon reset register definitions
      soc: tenstorrent: Add auxiliary device definitions for Atlantis
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add reset controller to Atlantis clock controller probe

 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  63 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-ccu.c             | 991 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 164 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 101 +++
 include/soc/tenstorrent/atlantis-syscon.h          |  53 ++
 12 files changed, 1408 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
