Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBEC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9eVC1K9KFG7S4ykKXkpx97hpaNFz0B4cxfTC/r7xklo=; b=jk9Htm1GuUdQ19
	dOViXX643qDGCXO6ltynxpS0+FD/GViM6Yh9Jfp+WhWfpiToubaj/JfajN+ZQo91MUuQEQDr//CMQ
	puMWwmglk3IyYFHe29ZhvAp8sOzkqMWVt8qD5KoDNcNFwTTGkXukgs0j4KvEufylooSGbPC6cnTZ5
	JNOS9tO+KT8PY6UOvWnWAHPecNvvhkv/2kPguENS6YNF1U1uLZIZ9aIHDkf0SjeQAFVg2SRDf1pKT
	fhOTK7Ly/RAV6FkHuP34UF4P98KsdcqzxIWlxTSiHfUR9YZMIUWdXgVS9wopVa3saOJf3bBD5pFr3
	muFEqHTQvqiViLUiRLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbE-0000000CjPP-3Sts;
	Wed, 22 Jul 2026 20:31:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbB-0000000CjOl-2UNS
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 20:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
	b=i3tdhocPBuwshF8ZqEp359F+MNNjRlh3ZgL/ToP8VnVZIkhQSUC1I+WTa7jzdQnu9Fs0WL
	+RbswGXqb2467qfFNTz4VR8BJPxaAlrBSHa1wrviCaw/P68LVNpafdoKvrdX7iC/lkJEWT
	zSzJAxUyny7BD4T0rO+hyXHDg41mHWA=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-pvwzxufKOlW_a6AI7PyceA-1; Wed, 22 Jul 2026 16:31:19 -0400
X-MC-Unique: pvwzxufKOlW_a6AI7PyceA-1
X-Mimecast-MFC-AGG-ID: pvwzxufKOlW_a6AI7PyceA_1784752279
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6688d64bf2fso2748162d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 13:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752279; x=1785357079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
        b=hp9f79ERxrQGsx/cuI5uQAgRatL648RsgirMD5yyo69dlxK5VEWYuTpwFFIiJHyMgQ
         uMZ3JDC4PaqH5ZoQA3eBjIke7ouWio49UAH2iNUhJTqfQXfkHnLvPjTNSJ5ztq8g0wrC
         tsAH0tMe8WryZIQRbp89lgixh6eHWzFmduHhLmh0lh+3XPfSuS6ZSKm51uOki6yObu3N
         y7Kw0DW5lSefkrixrdJs430Hq3gopcdZ357sFt8UXSISp2+fPI1SdqlW2rRCWKiLCYLW
         iGzho8ZXhPEK06uwsAH7GwfsVfJtWZHEExbxPF8GSqB+LQn+jb92OmGwc+o9qBAnlStV
         vl7Q==
X-Forwarded-Encrypted: i=1; AHgh+RptBoQ9ABlqXQPCfRx0R3ILx/5AduRakzfJhLaEuR/vRlmk8SolCmSCsWRtqS6uSgfhWPXU+u4ZJX6P/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU2m9RRhweYmQGDztsBlZl/idGUZuYpQEHhB6fxs/IZZDL6f/U
	l1WLagr+1acn+A6GregygQdCoDxGewj6WF2XKlrkLZrHoVpAooGJYdpFRCwTefCw9lNl8qlzr8o
	dpJd0hCe0TIRVA1nSStVpSZfrAjW2CiqQ6apvCmnMpZSZ80XYDIVvKHfFsN9GIKQ/4rdIrg==
X-Gm-Gg: AR+sD10NVjqp+TNnNaOQEcZMlURN5Pn8ULN/HT5pgEaNzcMyaUudbS6niTNheniPuxs
	Ep7D5kcGKnYppOqAgWJyBgkAW0pmJaCuEo/xpBYkYdI5EtXpq6ZoqEUbMimr9ONuBAedsElLx7z
	1j4odZKopEgEyo9vznDtuXn0gq7VPYDO2JpBxh8ID2SsKwidnR0WFAENuo6m/MtC2BTZfsBs2kh
	5jMWH8zzyi2KjRiaQZ/MDEPHDBOSZeVyp09nJs90NoID+pnAWXgIYHgoHlmHdSY7JN4ceDSzFDC
	bVmSTOIC6XqJKwNViJwW+zL2eau4XC3+gvImAd69+shOwtKt2+UszQ==
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38849d50.21.1784752278617;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38841d50.21.1784752278064;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:17 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Date: Wed, 22 Jul 2026 16:28:46 -0400
Message-ID: <20260722202848.1817988-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TL0pmP-CKCKYfysjd_tNRImvCSKupyR0640Fbe4FDyE_1784752279
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133125_706031_E4FE6315 
X-CRM114-Status: UNSURE (   6.42  )
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

SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
module and one on the carrier board. Both use a Giantec
GT24C02B-2TFLI-TR.

Jennifer Berringer (2):
  riscv: dts: spacemit: k3-com260: add eeprom on i2c2
  riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   | 32 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 12 +++++++
 3 files changed, 59 insertions(+)


base-commit: 199380e4d8cd22e539a08d4949e9582b09390bd5
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
