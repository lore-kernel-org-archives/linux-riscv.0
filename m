Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE08CD37A7
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1jpzylnP3iJ9EKIDUnkBpmBgrdMG04CM6oQsVwJJEI=; b=2dzsnDgMYB+LZ6
	BzR3uqM1N4rOSkaaw7+TzUXBa2syO3N/l7kRrZ4rbfUsw8bndMFnWdNO5IjCTWdxGb6vf1Edr8GMZ
	jvDS0H/4mQX8ca1tcI5mN4DJJnjlg7glV+aTK4w0EVqklez/1lIkV79AcjRdNNFKbWVSmeJZmR8xB
	Iegihx2kWGEZtrDhoJTHzll3HqpcFQK9fnt+dmoJOzb9Wns7n/lvLQ5FIWLl1AvNChq+M1Rc7OrRt
	ngbxrymc7tZplxFeD+islTviiOsh/2aOo464XZr8b6dG9klgJHnffBGHGNepaBcDDPelX0YH7Cz/l
	eEKgRyn6WCa3kqzs5aXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdB-00000006Nh3-2zMk;
	Fri, 08 May 2026 11:44:33 +0000
Received: from mail-dl1-f67.google.com ([74.125.82.67])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJd9-00000006Ng4-04k9
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 11:44:32 +0000
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-130c653cce4so5315274c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240669; x=1778845469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Gm3u44MZ1t+I4yxSOsrnRUe2YNmAHLINx2yuXfD5eg=;
        b=j+V1wcrmO3qYNtCABHFp5skgtkakYDNDcGoUGsvbu1r6oPk7/MQ0MuZQrv1SmT/lh1
         bSZ4wtBIQJ9IXj4GYuc4ccFBEaXOUHCsqO+w2JBwlzB5kyECBDQdgq1lpqAhgxzOYJZc
         FxH75GQ6bWY7Jaafp3ADvYwnxX/kwY56yINyawjIG17gpHKh9a4TCHLYte9sF2PqivVP
         bq+RTA21qRbEiOItMxBva/5s1UVytD7t0jDfNbS3JCQEBokJgXFmhW31HzY2BrKZe7hP
         f3ulYWZ00NjgcTBjwq5H+u00cC9uA7GG6K6qCwgXREEplqtR/B3x0Gi7If30VnXzp9Kf
         i+Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9SedLCSA8YWmPEVVuNIc/KdW8Z4KazC4lCxEwr5Ac2Azk2KxKYKiTktwAAOCB9sqv0LH0Suz3yvdR2+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzygDf9cBBo5IW1q6/IhE+iuHFDx8ZTsJirxxcPy7GLSKy9ysOI
	kTBESop4/wVJg7e0YKNF2RXIDRbMxlE2fWK2DaHIrypEFMmIM16T3flrWa8ZrBlvH3Ir9g==
X-Gm-Gg: AeBDieuW8vJD5lI5g5d/5ZTpw5Ld/A1a130LwiplAVXb51gCmqwcgnxCn8GG36p470a
	wbxVQCvaQVimRWf7C7Uzo4SFLRvehS8fjF7F1joLfOrYupUZuUengu9mWXGATM2zOV3O8v+vtxE
	1ZChL8zhMB3dm5MBzMmRLbOuvshmz1JTi4bzQwQZ9Hq7kRMtTXehGEFgi7WsueeVSj1hBgC/Y4f
	IXCjSSQZfAVVbmz1o8ltp5dlyyU97fTyZhTsCg8f8O6Uxie86OouUtKHvtIOV7V6LL8j8O2nKh3
	d7FzPJatwNvDgcblUjRjm8tmbgzvPougi29inm+ylY2o/+nxkZBjJNd+lGAEhDQQvwXohg9CsjP
	/nkOsi07fq4Stn+8u+cmLH8NRqvgaWbvT53NmqQP1KXilSHlouAeehsOpuff6OsilER2E900NbT
	Ax8rgvCic3eA==
X-Received: by 2002:a05:7022:eac1:b0:130:9b78:b190 with SMTP id a92af1059eb24-1319cd26b97mr6301441c88.23.1778240669031;
        Fri, 08 May 2026 04:44:29 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:28 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Subject: [PATCH v2 0/2] riscv: dts: thead: Enable Lichee Pi 4A WiFi
Date: Fri, 08 May 2026 19:44:12 +0800
Message-Id: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIzM/WkC/yXMyw6CMBBG4Vchs3aSOiASX8W4KGUKvyFIWrkkh
 HenyvJbnLNR1ACN9Mg2Cjoj4jMkyCUj19mhVUaTTGKkNDdTcQ/XqfIILiwv8GAp67uILRp/zSl
 1Y1CP9f98vk7HqX6r+/5GtO8H5FddCHUAAAA=
X-Change-ID: 20260508-lichee-pi-4a-wifi-26b722a4df13
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=i@leak.moe;
 h=from:subject:message-id; bh=SCLLrkorLj0vGFc6opEZEGHA6wkQeLMcKA6Xr1wZ480=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyUNduj7iKs8ES/4/be5jrj9w3/pwU927i+u
 xAnG+o29qKJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MlAAKCRDSEJKs904I
 kMFrB/9DZzTYD1AsCKexVB4ihA8uFVf3G40IGxYeQ+nnTPtZ6Q8Jf9pL0RFQedabovoxE3PaTTr
 zpziu3utgAOOISnpEAJnxC9xtwa+vtazFq3BixNqQHFHhOmoDgOG8izrPgvGcdxXOqWfED6zYb6
 Z7c1WCBhZwFMC6AbSypUayyGd1JWBFNREOcOKdbbJkwx4jPlaKYvUjhIPrjB0QdlZf9xocuUATj
 AjiPTfMGz2ZqkzWOYaXnDwhctuXSXJxawPC0SRjqVShybvQn5S+LFMnu1N3hScQHHc16h8y/MQL
 Pph7GKoo3nStT6Gia5THUNOHeNUUAj1K3ydp/ALKwl9U/7NC
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044431_132712_C0DCE926 
X-CRM114-Status: UNSURE (   8.15  )
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

Enable the RTL8723DS WiFi module on the Sipeed Lichee Pi 4A.

The module is connected to the TH1520 SDIO1 controller, while its reset
line is controlled through a PCA9557 GPIO expander on I2C1. Add the I2C1
controller to the TH1520 SoC description first, then enable the board
specific I2C1, GPIO expander, MMC power sequencing, and SDIO1 wiring.

Thanks to Drew for the detailed review and for pointing out the missing
commit message, recipient list, revision notes, and patch split. This v2
series follows that feedback.

Changes in v2:
- Split the TH1520 I2C1 controller addition into a separate patch.
- Add commit messages describing why the changes are needed.
- Add revision number to the patch subjects.
- Add MAINTAINERS-derived To/Cc recipients from get_maintainer.pl.

Signed-off-by: MoeLeak <i@leak.moe>
---
MoeLeak (2):
      riscv: dts: thead: Add TH1520 I2C1 controller
      riscv: dts: thead: Enable WiFi on Lichee Pi 4A

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi             | 11 ++++++
 2 files changed, 58 insertions(+)
---
base-commit: 897d54018cc9aa97fd1529ca08a53b429d05a566
change-id: 20260508-lichee-pi-4a-wifi-26b722a4df13

Best regards,
--  
MoeLeak <i@leak.moe>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
