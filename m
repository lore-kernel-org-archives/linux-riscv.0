Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57001C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXljCwwlqL2uUeMY8BmdS0Q8Uc+0d8six4UFX4L1JSM=; b=QuLRbSJceqR3aN
	LI3zfQnI9x3ACFihhzVHwrPqHA7aBlu6IPYS2tWfT2IrygTk3Qbv0Q6CZLtIkk9uBNiMX4tCUjciK
	x+uQYyhXXcdzYTma7KZBN/a2Lvg98f9aTFn6gUdy0yekpzgSLZwMxg7uZ/AGRq3uiTd03cUgoDllA
	9oDeNWi/zu5kcveoUbomj3S4b7zjbe99rL0hXuSAmMGTJJ9wVLPfy0Yw3tYYHCRyXmZdngdBru6jp
	MCwi37nfCre9jjizQHCrtT6mkBUQyFA6mUiWjIbbST50EwPBXWbWQdCR3A8vpY3W4aznHjXy3eHxE
	JSzQmRKLUbw3zoUROtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxml-00000006irb-2x1Y;
	Tue, 10 Jun 2025 12:08:59 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwKz-00000006VSx-2D5t
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:36:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso1010826a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749551773; x=1750156573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P16mMRPwZg6BkSYcAg/mHucFrxMI9G/HeNSiCItVHBI=;
        b=UymtXOzUKMSvLela8N9UuH15yi4iz5V1EWftkq9EL3B9I11av5O3JvEn+48JD7mJgw
         4/esY0/jbTjpv6QmhAo4FmE14lRrVNOuobKOO7lUXdXTfQyZYC/tryYdN9qN2FeeQvW2
         jodhzRfKtsdhcyvJYV8oT+PS68hQbcoP4i/UyN0Bv5w6lLL8ygxO2jx7dXwrAS8AEOFz
         Jvqu5JrI6sTtuh0kLmJyOP3+YfChMiasha0W2Ggl1kCsRtPZqy26bw9YnFSPB2dkNw3i
         Ym/Wc0EXTnOQHypFF5UwfccZxwOPLCH12gGV6bPX2NDSafqfa6TNa1A6QpNBo7C0afjl
         aJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551773; x=1750156573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P16mMRPwZg6BkSYcAg/mHucFrxMI9G/HeNSiCItVHBI=;
        b=LOMA0d/VtcJomxb7LK+DcU54St1ATNnxCx8quHJnHliuvZctLIXTNSTmvGZXsoJMfT
         IHzwLrTXD9aQqKe2usY0Z/1+pRXllQ2y3R3nNGF6xvcg1Rj4jnnGmv+DNX2jehWIAsk7
         HtaavN1s6xX6ItPojjp+Nae2DYdUoybPGrKrxYBIwSynwOGM74COsXFA4ZCA9MB2L1NM
         gL6D/j3ALdfY7hY0+M8AjozOosBXd+LeVy07kuMAIc7N2eazkXBtMnT5vUX0jXJtBnGq
         4SybwVXGv2txOpK5lD6b4F9qmCBHNM/+oHgog6lTlbZZnA9jXV/qTdnQ6Lr4DwQUelu2
         eB2A==
X-Forwarded-Encrypted: i=1; AJvYcCV8fJl46hxKzXp1xh1KHDjVL9h96s7kqfzuMG7Pn81/j5Xjts5AcNCMSLqwOchl1hmEk45Y3ZgGkbb5pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXNDVR9ebaAgYHDUg9G9rTzJoavjrUq8lVmJ3zuJ9zNAkhZW9e
	UAmNmTnN9iEP0NpqgtGN5pC051H20Zcgskhcd74GWFw6lkDesuKFJ4YYouzHlstjNJWgjV05UNb
	Jo2XZ
X-Gm-Gg: ASbGnct0L+hyDBQaI4CTAarC+jNqz78JI87dkZKAw6tHFBmKsb2j396UtElIqUkabKl
	eWKtZvM3lYU4S2rIY7Kjap7yfb3QOrpzpcYHQNofQ8zSOiS3O7GoHhLjk4puaJ2eNpazYcKi77u
	z+VyXklzo46zPmyO9gmpX/fFQfW3pvyjZICrkq1HQr8tru9R+hibIHZdgrJVIzh0T8WPsIkf0F1
	W6GHznM0jjkn9nxKgXxzg+A1y1WhaU5nmFpP2pRR8M3JLdA+lUNiF4xl4PvB+/NTLOFryZbuCSR
	25rZwrxiHnhNm9/EDsNZRWMgwrI6EdwAQ6tXs4vEydEmGN9rB6snoW555PLKCB/9+Oc3vmTkB7/
	e7r/A/xOiVDS6S//TmuZ77yn5rz/Z15VRXARaGAsv1nY3uy+C5PwBiw==
X-Google-Smtp-Source: AGHT+IHQBDbGSV3ziL9fhwaFCVcek7lTAlyMftA+s02/E8rDMfx3mRrXDRmriOXt6w3JQBLzCaxKEw==
X-Received: by 2002:a17:90b:4b92:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-3139e015d08mr4242075a91.14.1749551772838;
        Tue, 10 Jun 2025 03:36:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ff7e14sm7800595a91.45.2025.06.10.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:36:12 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/2] Add tps53685 support
Date: Tue, 10 Jun 2025 18:25:53 +0800
Message-Id: <20250610102556.236300-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_033613_566234_213F47C6 
X-CRM114-Status: GOOD (  15.93  )
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

The TPS53685 is a fully AMD SVI3 compliant step down controller with
trans-inductor voltage regulator(TLVR) topology support, dual channels,
built-in non-volatile memory (NVM), PMBus interface, and full compatible
with TI NexFET smart power stages.

Add support for TPS53685 device to dt-bindings and pmbus driver.

---
v8 -> v9:
- dt-bindings: Correct the order of Acked-by tag
- hwmon: Fix the alignment to match open parenthesis
- Wrap commit message body at 75 columns
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/

v7 -> v8:
- dt-bindings: Include missing Acked-by tag
- dt-bindings: Patch kept in sync with series version
- hwmon: Fixed device_id parameter type and test make.cross of i386
- Link to dt-bindings v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/
- Link to hwmon v7: https://lore.kernel.org/all/20250515081449.1433772-3-chiang.brian@inventec.com/

v6 -> v7:
- dt-bindings: Fix the order of patches
- hwmon: Modify the type of device_id from u16 to char *
- Run make.cross with ARCH nios2, powerpc, and riscv
- Link to dt-bindings v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/
- Link to hwmon v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 -> v6:
- dt-bindings: Correct the subject and commit message
- hwmon: information about tps53685 into tps53679.rst
- hwmon: Add additional flags when identifing the chip as tps53685
- hwmon: Adjust length once returned device id is terminated by null character
- Link to dt-bindings v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/
- Link to hwmon v5: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 -> v5: 
- add support for tps53685 in dt-bindings
- add the buffer length as argument for %*ph
- Add Changelog
- Link to v4: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 -> v4: 
- Add length comparison into the comparison of "id",or it may be true when
  the substring of "id" matches device id. 
- Restore `return 0;` in `tps53679_identify_chip()`
- Link to v3: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 -> v3:
- Remove the length comparsion in the comparison of "id".
- Link to v2: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements
- Add "tps53685" into enum chips with numeric order
- Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81" 
- Add marco "TPS53685_DEVICE_ID" with content "TIShP"
- Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
- Modify the comparison of "id". It will be true if the string "id" matches
  device ID and compare with type char*
- Add the length comparsion into the comparison of "id".
- Modify "len" as return code in `tps53679_identify_chip()`
- Output device error log with %*ph, instead of 0x%x\n" 
- Use existing tps53679_identify_multiphase() with argument 
  "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one 
  tps53685_identify_multiphase()
- Link to v1: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

Chiang Brian (2):
  dt-bindings: trivial: Add tps53685 support
  hwmon: (pmbus/tps53679) Add support for TPS53685

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/tps53679.rst              |  8 ++++
 drivers/hwmon/pmbus/tps53679.c                | 37 ++++++++++++++++---
 3 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
