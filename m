Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB884C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C002184C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvsDLHtt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M+KNKpcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C002184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u4Q3hjrTrPNDpyfvgzEkfJqIyxsTbx1s5Or/LY3kn8o=; b=LvsDLHttecQnh+
	e3aTJXZeIsEnnv4ER4i29I3mpb92XfM5PMKXRM01wy5obIFMcBWO5s63hC7Z07MizpiyBcjH9SMwa
	JuLkO4kLkuPjXk0yQfuYjH1UT+YNf/aFna6MV8k0ZQUZ33Pu8BGuxgqhOhbAzPdkpP7Vxx4gl+h5Y
	CB8ofqLZoogTt4rFAu35WdM7/kYm59jq5RZSvLLm2xJbcSS5EjIm8zrQR9deV7SJlwUmWFlPYgUld
	LVpI0JRg7lhKJGtAbuxF2iGH6bImOaouMPNNq3IOgh8557AmMsNhUZpatvnybeA+ZI4D+h7P0wI2z
	3MUiX1cxhSQtRqxOPCmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmRLz-0003dl-A9; Wed, 23 Jan 2019 22:50:39 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmRLw-0003cw-Gc
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 22:50:37 +0000
Received: by mail-pl1-x642.google.com with SMTP id u6so1894989plm.8
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 14:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:from:to;
 bh=LbaAnXHtFFrxwcbam+YMvIAcAk4A5ix2yDnMB5WvcMs=;
 b=M+KNKpcScL/K4latf5LI9BiHmKOe+o12jf8eMuhQBm/pVrM4mgd2qSTB484/MiwdV7
 YtW0gV8mfIYrbGN7NRmsRB4mnHQ9ylGCfvyVU49cOeZQc527E4HIbLxhJcEIWtAkEJew
 mtsFIdAl7Rqo8f8W/tgHA5cnfwPRWbhYgBLBnw1f0BrhXlh2tdaT5b8fpIU3708rnVv6
 6UeAE0eiqn7fXf55tpsZasVoNqxjHDFt2Acunn1hXTDDuWZzx8EYZvo4rBBkk0Mxp1Sg
 4tN0UpkGMqCY2G7dQWszXRSYCvJHyTS8aMI588THfAGdhapbwMnvMhwqu2P0KJmpslb3
 JKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:from:to;
 bh=LbaAnXHtFFrxwcbam+YMvIAcAk4A5ix2yDnMB5WvcMs=;
 b=svuNSsy9MFRedi0XGCr2mM1z8EPH5J3f7opVknzkUSATd/0yad8DZS/CaF4xbRLxdW
 OAd7dDuVBm1ZWBpl5S9oq66+fW6724yQPOcSTW8/ehhwNpA7kuaDBZsadth/p2+gmknQ
 SegqLXvt3X03jKRnQQxiAVTomXp0GXMEluqfrq4e8rIMx+CeCr7WxW3NbPcxtJuzfdTg
 g0a9M1Xt+Ahs+2DoDD86ivuuAcBwjLrxIkeBQLbl+MOjFuoyUCjDRCSkyi4Q+7M2rLp7
 cRbRj+vUf2oGQK/v/pk8X1C6ihTRJQscMhizDYRJW6vy2AspvUNIPcAY/BMOzLU7exZ5
 vNxQ==
X-Gm-Message-State: AJcUukc8KnzGw5IiR74SFYq0KF0ZyOkSPYGnv/4WYrX7R2A+81qkNE2j
 lsPPn/ZSC8RJsEc9BRpdF1dxqKRHgxM=
X-Google-Smtp-Source: ALg8bN6i3KdqUMs4P4TllQytOgLYiiR43Ugh/GfgKQ5p38xADFBpDHL1WaEnRbhbJdG+bWM3Bg7abw==
X-Received: by 2002:a17:902:8a95:: with SMTP id
 p21mr4222211plo.183.1548283834880; 
 Wed, 23 Jan 2019 14:50:34 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c4sm40461512pfm.151.2019.01.23.14.50.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 14:50:34 -0800 (PST)
Subject: [PATCH 0/3] RISC-V: defconfig: Cleanups and Generic PCIe Support
Date: Wed, 23 Jan 2019 14:50:22 -0800
Message-Id: <20190123225025.32052-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_145036_583449_67767D7F 
X-CRM114-Status: UNSURE (   6.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This bounced around on the mailing list a handful of times.  If there's
no opposition then I'll go ahead and put this in my next PR.  I know the
split is a bit pedantic, but since everyone depends on defconfig I want
to be explicit about the changes.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
