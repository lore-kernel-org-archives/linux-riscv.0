Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F956D13569
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V241uIA7WXpL9LFfO/d0gMvsd5FgSdZl3WB0GcEdXt0=; b=XEqiiRJvLxV9Wr
	kWdAV4p77kHiC0R95mawaB53prPpOWkvzgbVbVvXCLLPxbqzFwYQIDnytbftxrmAcOZ2JhYaqihv+
	MJrNbbTwUvSdqaP0ogUy3ffooFGo8WIMhv0+JOa0jSKL/tf5mg/2QUGmywZY0a/rJqulswOjOJBE5
	79WhAnk1y+V9plTfhXMvQLW+MAElo5ypOId2NzPp0q8dHt8ZDAkSLk+gxofsgWkdvcVdk6NFoBxLQ
	5L4nMwwt0Atgu584c4R7K3n5Q+wirlBtrZQvGW9gMR7EFXAL5NlPaknJA+BZOHk65SRth4vuCd3gP
	uGxnrAykjsfYFDuizO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54XV-00000008R1E-2j07;
	Sun, 27 Oct 2024 14:46:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54XT-00000008R0B-0f0s
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:46:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20e6981ca77so37368945ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040402; x=1730645202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOnSm2C/X5gMpHd1icM+bHrj8Z4viAW8O/wWabP58r0=;
        b=Ame7JEo59W0jd1tIlVEZCBpTEt51jRaCx72UnCiSDjO5nr2myaYv1/EHH8wPvg23na
         b2SRj9o394p65EsG+3d7g13X2oCjZvbuTYPVUiNuoUnbYVJJXdPp+fW89f0WM9Q4Hkuu
         5ExDL+zWSAc/+zRTYR846280U0RmPw24gcfN10M9x7nAy8T1eDVv7XckcOSAMJvuBrI3
         HpqN5jViCb8tfkLfS8w/mntl8heozqdTcVcvMQThIChGSVcNJXaPQhB8/NqDVFjuQyLp
         k+L9E7Ngz1QjnF+NF/ssYRdrpBchh2KF8oqbMc/9Uc3ImQh/4uO5DrBBcwrAKXs8uZYE
         badA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040402; x=1730645202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOnSm2C/X5gMpHd1icM+bHrj8Z4viAW8O/wWabP58r0=;
        b=dhPvgBaEdsmc6u24MptS8JGUv1cGxXu9DSnKu19y+TD9Ezkva0WX1VwmlxxB5ZNBp+
         ZA0ljSuJUfgeYWE7Z/78U4vz2P8irP9jGf1U1W2ihEPp2WvxB6DVGk//nL+4tobqKH5U
         snUjxL1XuTGQ0jcQ7SRLYoZjDNCsMGiTzRS2qSTvYn1/R25+YqgB4UODc0vxq1iy5+e1
         MO5K8aEn6LoSEiZniTglC98P3erQZ50tmN/IuhRNYGMuwIwoO10Sa6BXQTsytZBLkJmT
         b/3frGXodN7rZ7xnhNr2KBhkA33/NX10Uy1wrgBkS+Dc5ce2YGyfzPw9JXP6NejSTY6n
         g9hA==
X-Forwarded-Encrypted: i=1; AJvYcCWw/uK94sAzFbOksM5afiU3Yjryhl/Q5R/ZJa4D2b5R+JrwiYushzsRxZ74hgXz8n/aBIbGKW0ARPfqBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+taV63sx1mWyXk1Z1LeopG+VxEvT5OXgdx8y+OtpTjjIZEryc
	0npS/HQXKAf+c/4aaV2+6SzdmcRIdqG5FB/k/6dOllopozr9pk+PzQV9JIu54OI=
X-Google-Smtp-Source: AGHT+IEMhckcSpTykUxTRgkirS7h3AG2OCqYwI+Il0+GmdsMBAeGzkYyuVJZ8rvBXKCI+SEK5+2V9A==
X-Received: by 2002:a05:6a21:3a42:b0:1d9:1334:27ca with SMTP id adf61e73a8af0-1d9a840afbdmr7641465637.22.1730040401932;
        Sun, 27 Oct 2024 07:46:41 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:46:41 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v6 3/5] dt-bindings: vendor: add deepcomputing
Date: Sun, 27 Oct 2024 22:44:46 +0800
Message-Id: <20241027144448.1813611-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027144448.1813611-1-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074643_220261_BC6F4D82 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
[elder@riscstar.com: revised the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v6: No change
v5: Removed extra "From:" line in the commit message
v4: Updated description
v3: Add Krzysztof's ack
v2: Add deepcomputing into Vendor Prefix Registery

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de7fe..f8bb3df65797 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -356,6 +356,8 @@ patternProperties:
     description: DataImage, Inc.
   "^davicom,.*":
     description: DAVICOM Semiconductor, Inc.
+  "^deepcomputing,.*":
+    description: DeepComputing (HK) Limited
   "^dell,.*":
     description: Dell Inc.
   "^delta,.*":
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
