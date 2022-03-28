Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF546C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+tNJrIpnwRNXnNhQIAkeeFL3bwwPaSoWhu+bBzaQu4c=; b=ybeRosWM3o7BUK
	/MEPm3StgGM7Q32amoEepOjCFzd6EdzSMH8dpmoGWFPdhgjDotmgTQ3R993JJ9nKgRyy0DvFdS+dS
	hwp6rxYWfFIUPdvOodreAhA4zLlCl2aJLJI4J1ukwDDJXcPO+Nu/lt0r9T3E9/5txjAElgv/tQs0k
	iZ+VpPqmnplTboA/5AH+Ll2hFLqVuq5cZftxgkjWoAWyS7qVC/4AmsKNwCJsOi6ZO9OlthDYE22BA
	8OFPtgTC6bazxKlQ/EyeIPWzkzYX4UgwGUbXymV9JeTn/ux6Wn3OEvjJsdRK4Qub5cev20pJM3BoB
	s7d/aKwbIvITVHsifmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYjKf-007Xiy-Qa; Mon, 28 Mar 2022 06:58:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYjKd-007Xgp-Bz
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 06:58:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so14555345pjq.2
 for <linux-riscv@lists.infradead.org>; Sun, 27 Mar 2022 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z84sT/Zq3PkHwN8z9QLwYtyn/IyTsWTTqFs/kr4HUcU=;
 b=TGjEEHzziiLQd2h1xv21w53k0zIqBndy47GB6meb5mPLiRRf3hjWWLrxsfmJusHoBv
 hLWanaf2Uy0W3rjd1kQTd+ARRtt4tlsg72YaQCWjtV2/B5gFU1XsLbCkezIWfl1F8Ejw
 lm2P3ER/C5PH+jku0gbn8JYO01aYEm8p5/nBDo25CJb4XWOU1HbGXRBdgOZpNkWs0iu2
 OYJQFfJ2Tv84EEPZ49rK9DNnE1gcugTH2137Nha33dCbAsGVl/oK2Ov3A0Irqilu2FtL
 wvT2czm+GEMTVzEQ/8BsYQ5d1gyK40HuyeSt1dKWAXlh/rMimAl/AlptSBBKus2TO6W1
 UsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z84sT/Zq3PkHwN8z9QLwYtyn/IyTsWTTqFs/kr4HUcU=;
 b=TMZJ8ZkF/HeTDiR155wcGwOGqNafAWTwiaivG2Hv3xvQ88czi/kcl5VrEC5DWF0qJc
 Iok4ufiVqsenl51Esecp1PYQZhHcLjNynyzYgv36y0tqOr0JK6U0O+kBTf1imXDbZaE5
 7cH2pbEDcrcUgzIqY+OUJkpgFwBqnosybbB5t9lZAlrPl+2/ZSNvHK8FPMcseOLY+WG2
 sB5mYOmuVEtc9VmJ0fWcHV4k5arYXPzb8uIPsCgtBm+KCZAdCZhybwiR2nseDIMO6jET
 HxDGyqUKxojJRNk9bZtoMefcI0TCAC2CecPhBoM5YTPV+myErKgu0od5R4NB9VQ9GQZU
 zRVA==
X-Gm-Message-State: AOAM533fFU2akATe4MXXBlZxQW7laSebnOJmEgpHGgk65yVuDKNqR393
 2CXt8947EcmzEdiPuYCvHLIRdjUWDWzt4g==
X-Google-Smtp-Source: ABdhPJwCp/RwA2s55DDz3nKQ000RIxSAY2PAmr0M/t0xRHr77xHB0qqt0ub03qdNylCL40LqQ2OkOw==
X-Received: by 2002:a17:902:c944:b0:154:38b8:aa46 with SMTP id
 i4-20020a170902c94400b0015438b8aa46mr24879937pla.144.1648450702537; 
 Sun, 27 Mar 2022 23:58:22 -0700 (PDT)
Received: from ubuntu.mate (subs09a-223-255-225-67.three.co.id.
 [223.255.225.67]) by smtp.gmail.com with ESMTPSA id
 s35-20020a056a001c6300b004fb20b5d6c1sm8575149pfw.40.2022.03.27.23.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 23:58:21 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] Documentation: kvm: Add missing line break in api.rst
Date: Mon, 28 Mar 2022 13:58:09 +0700
Message-Id: <20220328065809.26187-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_235827_416916_FC5CE8F8 
X-CRM114-Status: UNSURE (   8.83  )
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

Add missing line break separator between literal block and description
of KVM_EXIT_RISCV_SBI.

This fixes:
</path/to/linux>/Documentation/virt/kvm/api.rst:6118: WARNING: Literal block ends without a blank line; unexpected unindent.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/kvm/api.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 9f3172376ec3a6..a529f94b61edcd 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6115,6 +6115,7 @@ Valid values for 'type' are:
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+
 If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
 done a SBI call which is not handled by KVM RISC-V kernel module. The details
 of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
