Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFFFCF9C5B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Sep 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQ3HhefWiO/AZCIdziib5ZtEJud2XW2fXflxI6ltQ9k=; b=OcfN68N6GJaQAW
	z1V7qyZ23n9o78nVWBoOswZ5gJuS7vrctTg01olHsVzR8erNdjNNmLO9pau+Upy3tsg3hjSf7CJUE
	CcEDqgQdnYtNaJaWofPVD72iajAbkpkcM+xGKgrwvo1tg0fC1+DjBs61aWvp3aAewI/5uICy7rAt8
	IfqZaPpywiFp9c6UnmvPG/RjL/k47jKf5dFnjZB/G9TF0at0Iyd2c6P+n9Cm4uY/gj1s0ZvuK+FBk
	SPY+I3JWelH/GRPQj14pKQ33Un8OFAwoANWbnaprgDltAbgL2pOKOAdf55/tKtEFVvw5BzlZ/1VNm
	vCBugk+SjqfA9VkCNa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ss47v-0000000DxAH-1J8k;
	Sat, 21 Sep 2024 17:42:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ss47r-0000000Dx9Q-14Q2
	for linux-riscv@lists.infradead.org;
	Sat, 21 Sep 2024 17:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726940548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JgrYoAupbc8OvNFMx54RNgfQybMF51dGHAZ6mKbefj0=;
	b=aoRJQ13Lw7UYaEiWl7BOjSH7/B5aQQkGnywBLwIKg/kGAFycBePoL9K6tIJljmcbAs8Gzg
	Q5WCQNJMwL2inXffGvhdDiOXP9gL/7+c7IzpS4uDTxyVLjC2jZCwUs/t3rurk97pwMLjOZ
	XGtcZ5fp4GC75kAThfNFFAriS7Yaw38=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-BDXYS1LVNdq0vVZYcMdkrw-1; Sat, 21 Sep 2024 13:42:24 -0400
X-MC-Unique: BDXYS1LVNdq0vVZYcMdkrw-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-205425b7e27so31729465ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Sep 2024 10:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726940543; x=1727545343;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgrYoAupbc8OvNFMx54RNgfQybMF51dGHAZ6mKbefj0=;
        b=Yl/Z9rT3bQE722ppcRxAze39LkJ5IpgGm5CsbpHbHytGhhTKFrCoY3WE4stTzmnkSk
         bfT1YEwjBvHVamlpbkWIlAvpowOsOqgjMLr20Kqp99C4eSESg0ick9RvoKQpllf6xLSf
         y0LuVz9nzCHz6l2d9/70j/Qv7ByjVS850FwZSFWUC6b2oqwvSVZAN7QCQhiHiBgboiKf
         fwOA5ZoctmpUQ9qYfbuj3c+/4Vcaq7ZBrtF6qtnqGb1MizIBrabq3RkIsw0gdxT/Eqje
         QbY7mx6ehDRH90x4jHi3v1uGTfJwYVWZOyPeu7yAkOKSIZSKrdOZVAZDbYBgoZtfBWYb
         AXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR3hBPjdhKylfvgNCq+M+3RSmZlYLIY1SLEbKg6UC8vjX1b6mg+UiA4G7zoz99QLFV7AzqQjhHYh4v6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8SoxR0gyDXMrTmiefJjh6/+DCxQr5d1c1OLC0nZJgOP0VWLC
	b9MTOF7r5J4cvbPTvwcQ4bbybmpO45rpKAd5tPIw18JRSDXSkB8r7PlkFHZi9liD93F4dVN1+r5
	8qwJYdwxwzY72qiBTJl8Kb6XGNSD4EhtRXdFmOy4cuFvnRDyjay/VaodcIh9G/ac1PHTQgl+bDf
	sRGdR0csaaujeZWXpJnEw7cO9o1D0uaK1fnDeaztMqbC97JnWDinQ=
X-Received: by 2002:a17:902:e54b:b0:202:13ca:d73e with SMTP id d9443c01a7336-208d83b93fbmr96970185ad.28.1726940543362;
        Sat, 21 Sep 2024 10:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwKUefUGhW4P9+SPQMWxP6OdoTY4qumCwbgll/jbfjtlKNhI1zFL0C4CRiW+QJV0IQYuCYE57e7UXcnCMnUK8=
X-Received: by 2002:a17:902:e54b:b0:202:13ca:d73e with SMTP id
 d9443c01a7336-208d83b93fbmr96970035ad.28.1726940543063; Sat, 21 Sep 2024
 10:42:23 -0700 (PDT)
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Sat, 21 Sep 2024 13:42:11 -0400
Message-ID: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
Subject: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with FORTIFY_SOURCE enabled
To: linux-hardening@vger.kernel.org
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, kees@kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_104231_384715_3402B7E4 
X-CRM114-Status: UNSURE (   6.94  )
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

Starting with 6.11-rc1 I can no longer boot the Lichee Pi 4A with
FORTIFY_SOURCE enabled. This works on 6.10 up to at least 6.10.11.
However, with 6.11 I get no output at all from the kernel on the
serial console with FORTIFY_SOURCE enabled and the system never comes
online on network or otherwise as far as I can tell.

I did a bisect which led to:
2003e483a81cc235e29f77da3f6b256cb4b348e7
fortify: Do not special-case 0-sized destinations

If I revert this commit I can once again boot the Lichee Pi 4A with
FORTIFY_SOURCE enabled.

Thank you,
Jason Montleon


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
