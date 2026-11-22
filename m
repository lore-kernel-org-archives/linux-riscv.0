Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC10606A339
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HgBeBc+x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iG6eMg/M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=liEjQqld1E/I7iBLj/+CM4BNHezqqTJcDrp9eX0+O3o=; b=HgBeBc+xQf6iwiot+LtrYoLNlp
	3Rlios4chdEHAX2WmqNJrH7gomweM3q18QGJW9ZWzbdiXY5ZPOZyMZ+WeVvKCFemDtU6l4CNzWKjN
	pAXmbqifuS9EjlcToJZ0/zEb2Pf8VNmJu/ni1MSRs8l4khhsfJxt7NhJTx450RSMu6N1N1NWzVvwr
	9wD9fxdwSAD53m4BZqAKiuPc9wFBoIJG6EdPRTGJtpRRDfFBBAUjSjjZQHR8tHRr4saw32X0jniQ4
	kQU6Yw8U2riZTj5UfXzdiZKjqyZzW14TW/d8v9Bf3jZAJD+jGyTmWdA0vE49mRx4HxcyIbRyWH9tE
	B8eSZXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWV-00000001Rus-2YMg;
	Sun, 22 Nov 2026 17:38:43 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWS-00000001RuL-3NPH
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 17:38:42 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3863db981d4so3273233eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369119; x=1795973919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=iG6eMg/MHDQeDNCSLTzbjy9fRn2tWpkh3ObknKE20HW5vtoccuObTrw6WVp8M33C1/
         i5DWIlp1L6xI/vkJsMWAGWHKTFZ+3KzpBiHPRMcMiEHCodHaLI0M91VrSvOdBsxR/qDb
         oB6HSh0FrAwwy2eTVy1wpJvkWRDgFQ9fhj2oeno7px3CTsLQBqsBBm8RPqI8uR3jko7j
         uleyBitS4wGjiqc7OV55kZ6RKKUvfFpcrIXbwEmUmHGAUa2MdJuZ/N3j+sWzt8JaBcdu
         V72kfTE0grlmoy+azWENc1fY7ZX/EJ9kjyqHJRwfDEY5EnGB7CgAmxNo1orz21aUz2SE
         kg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369119; x=1795973919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=zFUa0KnFJJnk6Dz+mcTLml0EJoubl0zzaiWp2HY7e6mepQMX5eWEKq/2BxHgAZhZuR
         o/uCPLDie0R/nSRaTCiXiCfxkVqsCWZgaFzzlqJBb/Fd/yqI1c+GWfu5jpwDqT5I+anr
         pmHesXHZe4fMulsexv6NPZy4u8lrjSmOZjJ9kE5lMTRzeeNH0sx6cUjSu3Th8Z9ZCn0k
         ijnbDAq1EpWCLhYreIEaIthC/TdlY0Cep0s+NH57+Y5/Vub9X4O9WSON/+WOyrqVVjbu
         NCqwizF54yrJEjwAFHQQtaZrr68ycyqVMx9EhoN6dlmztots+DS1pt4O0MrXB+FO8xjM
         0jDw==
X-Forwarded-Encrypted: i=1; AL+hErHqVz0o3GpFNK3QVBzxpASWZPw6KsZ5aPhcWljIFeJ1WvZu6RuhmNsQFzZ9MLv0zY4t/1QfH5G1lMg+gQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8xIKAfF9VGCrOKRLZlrUfysDDb57yve8J0WNV0tNBalFcb85ok
	+OGjeriQlUQPAMu8konqCo3iINQO7UA6QfmoJ8QvMk6Xfo+s/tLwM8hP
X-Gm-Gg: AZFdTZdSKZVxWiuoX3RydrOJv0JHM4yj2intSGkVLloO9lgFEZGJg+Aeebd9IQXKAeC
	r1sVbaSXzGSNyrdCduABtj2wYrJdWblZwXl8AJHRAl3tkJY7uXYUxU3tT26J1aEBGZu6PUveEGG
	KCbsc/vqvxnsmGtz5rhQIdolfApAUOwI/NSQTX4VdkVeWLbJXljBQ/RVCVwvJGzks3mxaaG6Ws9
	GUqVWQ5l82kCLcvhQSF/Kx99QWKT4a9X3TOqysiF6+fKnUGU4mulYOSr9yWaYJKGQy9ty8CN/Oo
	RWIo7AezfXBpluK/O431uWOb9Ick2ZN+CpmapvtHX67ZnMOlkRLYHBF78bOEr8O/d7qZce9B0L5
	3OnaGmqPFrJ9WroIJ6gO/X8sDtsPXziAvMeHXyiqDT/FubXuL8f9UpYOiR7119htgzxJIILAUgV
	BT5JqSOTubMashQHxLCzsTsGTVzg21TI5/coNCOFdqIVY3YrFDjtXls24GgnHM8MUbaRInhvT3g
	EEOc+icq36LNR90kFhg6MVMpVVE7RhgfX4YgXzr+S/IglEJ79t1JwdfYX8Fx8pASM4vmF8ajohf
	8V1FmDtoj8Csdi9njfqDU7iKN+kZa+IRXZWREBCIJmSTnFtoJg==
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr12238447eec.39.1795369119433;
        Sun, 22 Nov 2026 09:38:39 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:38 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:07 +0800
Message-ID: <20261122173810.2409146-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_093840_842740_A1B3DBB1 
X-CRM114-Status: GOOD (  10.78  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit. Both banks returned the same data
across repeated reads and five unbind/rebind cycles. Reads from the other
banks returned zeros. With the separate K3 thermal series applied, all
seven temperature channels resumed reporting after each rebind.

Changes in v3:
- Use an exclusive, managed reset and assert it on detach or a subsequent
  probe failure.
- Use a 512-byte NVMEM space with bank 0 at 0x000 and bank 7 at 0x0e0;
  cover the other banks with keepouts.
- Update the binding and DT calibration cell offsets to 0x1c and 0xea.
- Clarify the shadow reload names and remove the incorrect reset comment.
- Drop Conor's Acked-by from the binding patch after changing the NVMEM
  address layout.

v2: https://lore.kernel.org/all/20261116075423.1519438-1-duge1256@gmail.com/

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 205 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
