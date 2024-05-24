Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46980C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 03:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K044WpU2CrIOsSIVT6b2yYMQwFoVPJEtmA8pHupuoyA=; b=IUHHVk4OwT0rwX
	gEK/gepTLOqg9TgrTaTqJobYQx1BQ9EAouc35i7fZ+FwKRMF7q28tBlqM9Q4UVZjynKH6tKnlDOsq
	U6KoBIMZQUeBFj7Bxf4zoQ0CX5XdjHFLMGXcavC29xQHyRacafjQ765u628k833kJ2QNz3tl2/DdH
	l0Iec4SnJS42rD7LbeXhu2ooFryIeTZLkNzToyrnBI30F8OKic3pQk40Gk7rTpCDaOvVsgSNIgUpE
	gYenGV9EF2OFKq9iqxuKFfCapEn5ZkgiVaHY3e27dK7GVDl5Ohffyr6Xj/RYufcJNRzdm/ROtToDo
	Xu6QwnplYkiHu2CeZsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALic-00000007w2l-2ooM;
	Fri, 24 May 2024 03:35:46 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALiY-00000007w1P-3cp5
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 03:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716521719; bh=53Bt51sNUYf9oOYR2CzwqoJVUCqj8xxRiJcxNZztIWA=;
	h=From:To:Cc:Subject:Date;
	b=KutrFRiR1X/ofcm+XqPcgrPU6EZsmVdZgvWzWwMhAURDpHNQY3VFYQJ/bbDx3uVA8
	 M7xmY/c42ahI+ZABBiKzYrhap8CJ/KLJwQCGQVS1j591E+26+YEMkrHqUp5l2Nieqw
	 IrzcLVXkEf05K8sXnhK1cQX44AKnUpinwHiuz47E=
Received: from cyy-pc.lan ([240e:379:2259:4c00:b652:79f2:d4c3:c8a8])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id 8CA030B5; Fri, 24 May 2024 11:35:10 +0800
X-QQ-mid: xmsmtpt1716521710tp2bocgn8
Message-ID: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
X-QQ-XMAILINFO: NPETcIssjKadSb3TOwqMbhYICRRXdt1F3cf1iEHrJeUzI+PTele0wDCTw2XHJH
	 zXOCoHIJJKmKD7ovYOdGALY2ZHUMk8Te1K7k3dshNmyxRvmWsgeR3SU/iOeIqKRfj0xcH/X/iwy+
	 Fz3jNl8VaTc1Vq70mxxx9cwX87fKpHP8bWzMSdcRCPGaqWDq95O/a4oytnPyqzIrv9WZqsYTAdVJ
	 QMP3JbyE5N1PT6ZWcOYaYFKBEuFztQQQ4Y6acWpkOhk4kB/JUzovKuBVSxqlGOzE2r4Gthw8I+vi
	 gvFCV//CODEHA6qPuPUG7URzaO9570CQaX5k6Uk8OKi2szJ4dRQHeJuOrKUFY53Imxvyapn6KCo8
	 pOihMEZYdbA6KyqpqRUyYnoSQqSPdie0H5u7Mv83ww1WA4YWqjuzYnooY0D6AyNXbFG6UMBEsB5G
	 llo+26MVDnw9r6hgXuWQpTTgy621+nWKJxoMlGBCyRatqfGTFEmiz42l37LT7Y/ISyFADXqHdkZQ
	 +b1RzVUkEDRPBAI3Bd6Sob223c/loF9SZfFFqlHGDxXkjmQwzeHZbI19V+9L0chfDPA6z50NVXhp
	 l5gzJ3E3TIMfJol+K2QT9ifr3luXK1oNpmkWFihgNdxMvFv0nVPOxdNXzdsabeINzAC+v6iFOrEm
	 hFCkOXq3rPvVIdCcezJDId/cfcZlhXpgZm/WqyJLJbt8c1mrNLfHpbCCa3AlRhsUi884IgUnb+bv
	 rZU35bdVfdzRFjnX2+kQezOLFAlAC6ghz6K9H65il8W/7ooLSn1ZlXW+SAqdbh4TncEpD0e9S7Fe
	 44ooOJK5LEsrKcA+cnnz+wmuWSalYqV4tRDvXHhALI2ydmpAOjvHLNpblEQuxZBpLLhq1Z5H+QE1
	 ZKda4sqtaNjjBB3isrHQJaIDh7sPqGv+VL1J/efyC9AkvLSZMa79h0zA9eqvD0AOXM0hEIwGxS8S
	 j3DtsD9UTy61cpAw2N5F+KftLPo5aA/54R+f3Nf+z0tQ7JJn8naWF9u+G89xO824+g3Eow0Awy9c
	 lH9xbcow==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Elliott Hughes <enh@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 0/3] docs: riscv: Some clarifies on hwprobe misaligned performance
Date: Fri, 24 May 2024 11:34:50 +0800
X-OQ-MSGID: <20240524033450.298658-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_203543_272413_BBC3E636 
X-CRM114-Status: UNSURE (   7.41  )
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

This patchset clarifies some unclear things about hwprobe's misaligned
performance. Including:

- hwprobe misaligned performance is only applied to scalar from patch [1]
- The defined keys of RISCV_HWPROBE_MISALIGNED_* are values not bitmasks

I cherry-picked [1] rather than write dependency because the original patch
was submitted with lines wrapped to 80 characters. We can't directly apply
that patch using `git am` .

Changes in v2:
- Add fixes to the code in arch/riscv/and include/asm/hwprobe.h

v1: https://lore.kernel.org/linux-riscv/tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com/

[1] https://lore.kernel.org/linux-riscv/CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com/

Yangyu Chen (2):
  docs: riscv: hwprobe: Clarify misaligned keys are values not bitmasks
  RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask

enh (1):
  docs: riscv: Clarify risc-v hwprobe RISCV_HWPROBE_MISALIGNED_* docs.

 Documentation/arch/riscv/hwprobe.rst | 31 ++++++++++++++++------------
 arch/riscv/include/asm/hwprobe.h     |  1 -
 2 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
