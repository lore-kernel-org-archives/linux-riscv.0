Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199EEC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+SCDcIUHFAbBGSuVOvBnVx4YIOXkWGdH7XxUtdqIjk=; b=oBy8K/mpisQeMe
	IoDYOW6Rlc4/zhpL7HmN5Z62obhBBeuZbEnCgCpqAsHho+ySv2MVCjg1s4iRQDvfOjHQJprdHyyOF
	u0qaXGYy8E6WmWTMydXt6qWJHD8AuHF99f3qDQqDh+qD1cYUDvO65JDeUXiAiROIFHNfiPjeAj4mX
	4goOIlfBFIdP71kVpOKcIGk6lXO6jEikBwVigzl7U5RYKdcPPxGP1WFxcXuHOgZFtm4dJGKtnSTgH
	1C5tbzAtWjsWHQd5fQ0WKUB7JWKAvsTero/k+VyBqxLyH+K0tnO5XaVG2UHazJXHb/H/G9zCXeoM3
	CvnAJV04sENyu4Dpmr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJctS-000cx1-2N;
	Wed, 12 Jul 2023 16:40:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJctP-000cwE-2z
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:40:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6505461820;
	Wed, 12 Jul 2023 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBC7C433C8;
	Wed, 12 Jul 2023 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689180042;
	bh=NaEjASo8miCEM8dHYi4Pq2EhZ+qM+1epK9npg8XNShk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExW4awx5okU1EW9jtlQ3leXf82VONqpLmSsvBk+iZSR1F1BTppK7GkUSvRw6/W0Ai
	 nqh8a8Dy1FHrj7MZRMDWrxy/c1dnDnyTBbkueTx79VxJEa1GNCjGdLWfW0sjxzoFW/
	 /p7fvQ+BicoQ8kCYbrwW1fIGCv+QwYx68EstAVgaObPTc44g5znCjyuUQ9EJU52ivt
	 NIQoghGtxx9FXZxzNaLf7MlrXecRHHvWqsChP8NaVk6Ry/pwS3ZW0Wd5lL9XBCLYO9
	 0G0pqyk282k+jOQpFTc81bNlRp9pATloBQGknqazOq0pf1uSP/mt+4oCp/rQq1eYF6
	 bYUw/s2+603yA==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Bovensiepen <daniel.bovensiepen@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for starfive devices
Date: Wed, 12 Jul 2023 17:40:27 +0100
Message-Id: <20230712-legume-establish-d389b8e40984@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627080620.329873-1-felix.moessbauer@siemens.com>
References: <20230627080620.329873-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gzdlf/v0s7NPqIfXdlJejLX56LsDjYc1MrowUq7PFns=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrrlfYHZfen/Cv43/Yg3eTG75v4o6Z6TxZTzNasezOh FqtbfsyO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRM9oMf+UtZ773qVj9frq5 TNHb5T/P5kxexm1140pN8Y7IbROKlSoZ/id3dmpsN/DrWaP2hJVx7ZcNvlZRaZVrqmTnWpy8n3h Lih8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_094044_005606_A9C0710E 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 27 Jun 2023 16:06:20 +0800, Felix Moessbauer wrote:
> Add the '-@' DTC option for the starfive devices. This option
> populates the '__symbols__' node that contains all the necessary symbols
> for supporting device-tree overlays (for instance from the firmware or
> the bootloader) on these devices.
> 
> The starfive devices allow various modules to be connected and this
> enables users to create out-of-tree device-tree overlays for these modules.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: Enable device-tree overlay support for starfive devices
      https://git.kernel.org/conor/c/ef6012f301f7

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
