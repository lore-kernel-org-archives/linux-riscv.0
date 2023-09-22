Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72016CD4F33
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NXuJ1oLEjUvc5j0BrgpM2UQtFCXTxUbqAUWKEBhMbms=; b=Mt6Ehajl11NRQ6
	wBOunfnJ4Kb6TBx3HB5PLXgvgWYJcesRvLREvpW8mhGNePIQhXUv4Q1Ul1j7HoL33tbwx4Mw/+49x
	+a/klwQy7/VPx6DJyUbwHIQMBMocgA9SJfkKJ7HUaLxm9kAZa7oleAoQBatvfRSvyITmPG+V7ea0F
	ynFOtw39B+BwgW0oqkCwFJ7TUcIEpZf278qr3iCG1ynlBCHhuAVpnK0l/K2Pf4sIVn6okywopr94L
	/HU/KMR+KOdSUy/iMepk0zTcCcZxUOa2tdHaZ49LCyCY5a7Vb0WOsV/wmHBVI859J4URXJtBfjBDl
	5c7mtxYlkRvwY7ZhO7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyN-008TCJ-0U;
	Fri, 22 Sep 2023 08:57:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyK-008TB7-0z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:57:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68c576d35feso1716162b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695373027; x=1695977827; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNYkvo5doWsAaRlq+DR+93b1S3c7JI3g+ysu5kfmq4k=;
        b=cDSgOtSr22w3x1I6F2uV46MEWoxvRq7JWLuPMpV2o+BysDby1ltYjFbpV4JHUQKDkl
         7Ea6YQx69bMOtVlBplGJv9S4JS1WgMycrOfZAkwycZtXWcF655qcMGTPRtWxgGOnFE1k
         WXNo7+fyBNQjt5HSAXxlWdfDWYGnC5kXcFHW9c9N2v/jEQ5awcbHOnzF8o2LpHvaT2EG
         hBuMVhs01BTd+kqnzux/A6fIq7vxgB8yk/IadD58F1MNg2lILpSAebp7nyQBRQ+fUs2W
         mehHnSNrgtKxAEUiuQPbK2+iy8oypz7r6M6LUO6XHpLX+AIdLizDsl2CJWnjUmlGbk+d
         oFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695373027; x=1695977827;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNYkvo5doWsAaRlq+DR+93b1S3c7JI3g+ysu5kfmq4k=;
        b=SN1jCD8mG2fE7TTqunPiQA5u/eJSAtub6v2JDLb645jo1a/WgU2asS00H1TIF7nV2+
         orYyJlIBcdQsvf4NjwUdMXGRDWY0Tomni1DIH/d8AmXhUjMM3G8H6vX7yMKiVxSCQwSv
         Ki5S5a7AR3/9kTV8cVsp+0vD2HGDcaT3v2Ez2Mm2EArjNhffb2rTWEG278CzbJ/eImvF
         ms1Rv/ppZIQzXXIE47pavIJV0v/ZeZb2SRzcHksmqkrrMTxlMMqyM8o+X2IR8KX0KcG5
         KWiIGcKfAGWRjsMgy8XXHgavsOpeBG1YgyiXPBYqdFpc0MYU0xPasrsHPRgp6/XTY3Ul
         3UXw==
X-Gm-Message-State: AOJu0YwW9syCme7j0M+kOejDK2Tss0AADM3TD7JZp4VbzsnQrbLn3JCs
	B7TNIcX/jVaWjnSBKneQFVfMDPaW0+VuMZfG4DiqSEx7++/sVYvnmQIV9MVpmgnfIMHpNfreFfr
	gUsMbfQggs6iJ+QG/TrZosu5t5TqIISYP79omjXW05frxyVqGA9z2VvpvJw+57STCRtwoRkiE7o
	IBueG8cWix3Yy6wx1qnQ==
X-Google-Smtp-Source: AGHT+IE7HrGp9EBXO9X71OEefHa5HDr/0A0yL4onoWPQ6w01sdTxpsQmgqro7Q9ZoKBbem4pALYJog==
X-Received: by 2002:a05:6a20:bb21:b0:15d:bd4d:2305 with SMTP id fc33-20020a056a20bb2100b0015dbd4d2305mr911039pzb.27.1695373027233;
        Fri, 22 Sep 2023 01:57:07 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a024f00b00256b67208b1sm4815024pje.56.2023.09.22.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 01:57:06 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/3] Add Svadu Extension Support
Date: Fri, 22 Sep 2023 08:56:46 +0000
Message-Id: <20230922085701.3164-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_015712_360338_6993D18D 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
patch set adds support to enable Svadu extension for both host and guest
OS.

---
v2:
- add Co-developed-by: in PATCH1
- use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
- update dt-binding

Yong-Xuan Wang (3):
  RISC-V: Detect and Enable Svadu Extension Support
  dt-bindings: riscv: Add Svadu Entry
  RISC-V: KVM: Add Svadu Extension Support for Guest/VM

 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 arch/riscv/include/asm/csr.h                            | 1 +
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/asm/pgtable.h                        | 6 ++++++
 arch/riscv/include/uapi/asm/kvm.h                       | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 arch/riscv/kvm/vcpu.c                                   | 3 +++
 arch/riscv/kvm/vcpu_onereg.c                            | 1 +
 8 files changed, 20 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
