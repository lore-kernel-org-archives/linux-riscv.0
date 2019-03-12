Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47F2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A3B214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMfeyCa5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RGmsMOGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A3B214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gZejgpCb9yUJfkKmKih6x/jux7lv+j8BgTAoHGdGh0U=; b=LMf
	eyCa5YSo4t+iM+5VJEy6Szr8rShmzBkPUFUMvkIaj2x+OpKmVtAcwUfkfOY74iqwzPF8RSNqO7q7T
	P0563aPHi0dZ/AkA3yGR/FhRGjk/KIJIEA20ZYiaDjRCyELBBbNCychElvv9mbzlhS68NMZSJWpco
	CTPswxkSc9DMW9Frz9MC1XUoh9rGrGU8IXMi4CsMOgVqOMchAbzpDwxP91n/JxvynfM45TPgeZg5+
	oawSzdUwwBTlFzYE7DodimkhxzmvzTBBAtapfflzelVSSixBuuV92bk1zGpSzWU+O4rPP3gEWYjvl
	zKHi88mZ4cf7UZW5ci6uufxnSEAXJkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3db8-0008VD-6G; Tue, 12 Mar 2019 09:21:22 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3db5-0008Uk-R9
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 09:21:21 +0000
Received: by mail-pf1-x441.google.com with SMTP id s22so1379931pfh.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=VaBKOjGbr/7EzlR3EouVAvjCAnoJlqVZbWJCrJEq/Eo=;
 b=RGmsMOGpXtu3KKjBuVygx/qN6Mtnq9zCgob5otktVlullDhIV2+7zAEIl9Q5uGKuJE
 oTdJYicKuuERk1xlfkXReL8z4+8jTw+Hva/8KIYAZSimIKpwWHBAmBKoGzDKjxc7uCix
 hdXvf5JV7r6C+Eo8WiqTnyosd5pqRnfFTZh5IuW6cFXl+jeUrUq0hI1maI6FprdR5bqM
 FGWuo11QvY9jRrIAZ4zAeAoSSGuw9Y/ynrMnRbxe6jy7jk8CuwlJIO6KT49VYI31MBWx
 e0/XcWpWKO1T0Oe1TogoBiK385Jwno0VE1j98PYZlGP6C0TDHgNHuVkoxrbO3TDQ/hyf
 Mdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VaBKOjGbr/7EzlR3EouVAvjCAnoJlqVZbWJCrJEq/Eo=;
 b=aHvG4w19FMW7ZvXvHL51Oc60jCkDhV8mzVAqUONJg5AJHf9AtDJ88GEdug+IAcXQJC
 bPOuxseTHIomaWKMEeURdlxq2T9NzhNigKdveEtquEydLld9SzfzAghPsBdFKE1rFySc
 3rhSVazt3q5c+nL8UhrKtqkzw78mZaISLRYlsNIvhcvEwdOxnOKU0nIt7hZ1lUIG4j3c
 gpWntF+En2mnPYt3lE44NPWpT8iMBDTxZYXj7kUzOIiy50jE7a0xbjRaeatXiQrHQIzy
 jEz6OyWHPbWGGPf3B60krsU+XXNwz5fPOGP4oSFrWOczbKbjA6jiNyjd1bqcAr8FbeMX
 hNAw==
X-Gm-Message-State: APjAAAVHCDThJyEOlnzrACkaWELMD1nZ0ZW0WfNZUv2VH7S7HVzYd2gv
 C6lULkce0XIcNAxtWUiTcTbE9F0uz00=
X-Google-Smtp-Source: APXvYqyxFZxnbwXujiMx5dkiJk+ConaqG0mWp78cSpLgPSnzDZwLq3jNbjTAjP3Rt6XZbqE1rhTadA==
X-Received: by 2002:a63:cd03:: with SMTP id i3mr25521894pgg.172.1552382478779; 
 Tue, 12 Mar 2019 02:21:18 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id d86sm17569638pfm.18.2019.03.12.02.21.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Mar 2019 02:21:18 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 0/2] L2 Cache EDAC Support for HiFive Unleashed
Date: Tue, 12 Mar 2019 14:50:59 +0530
Message-Id: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_022119_935818_7F2A6E7D 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, bp@alien8.de, mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds a L2 Cache EDAC driver and DT documentation
for HiFive Unleashed board.

Yash Shah (2):
  edac: sifive: Add DT documentation for SiFive L2 cache Controller
  sifive: edac: Add EDAC driver for Sifive l2 Cache Controller

 .../devicetree/bindings/edac/sifive-edac-l2.txt    |  31 +++
 arch/riscv/Kconfig                                 |   1 +
 drivers/edac/Kconfig                               |   7 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac-l2.c                      | 292 +++++++++++++++++++++
 5 files changed, 332 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
 create mode 100644 drivers/edac/sifive_edac-l2.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
