Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D41EF30296
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9afyKbRDVWRTjMGxoSJwMyummlX+f4x16JdtkCVj0Y=; b=JMloOwc8ERQVdE
	Le6hKMc9Mr5bmmCmCr+RuDQzzsiVh3I/QDVSUN1lQCJZNgL84WFNHEbLEOIqmMXScmM40sgj+RVmQ
	EjLvjL9hdyFICMZXHwbGxIn4xS4b9DXQbRl7St4lqGij35enL2UTglOX4P4TA4PR6EYpUTiCp3cxF
	RVgMkw5EfFTNkcZmb7hGoZq8V1G3D0eyHAuCKmLWUFRVCJagIlU8b2vDdOGBHu89Ce+SYswg9VbpB
	+czRxtyWUTRFf9lkk/Qim770Xk/JX/7/glMYNvIWjzJ6UU8DTw2aVFTD3gRPXnz9gki3H/mz5RBAT
	+RoufHkTYpPsr7bzXzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuz-0000000372s-1fBv;
	Mon, 16 Mar 2026 01:38:53 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wub-000000036jt-1CNv
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=7q
	min5METo8aJACs1kXNOEZJ7YehZcVy08aOUHMVKxk=; b=MYFYk65dJYZKTfjnbF
	a6JCL+k31HkfOcQo3VyHT3BpxEqwsXn3XqgzAfo01JVimWWSf/jTn2wr1cK0xaAm
	2CaGnYqjBlwrWt6smf8N8MmvbuzY3C8SsNywo+GCe1MYPpX3b0qrjDChm9PByLBw
	dV8WL7eZ+S4EfvqmLYqCpAc3Q=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAHtSQNX7dpnx0BAA--.1023S2;
	Mon, 16 Mar 2026 09:38:21 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH 0/2] serial: 8250_dw: Add support for UltraRISC DP1000 uart
Date: Mon, 16 Mar 2026 09:36:17 +0800
Message-Id: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJFet2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3dKckqLEosziZF2QzsQcXTOTtDQzY/PUlDQjMyWgtoKi1LTMCrC
 R0bEQfnFpUlZqcgnIHKXaWgC/6HM1dAAAAA==
X-Change-ID: 20260309-ultrarisc-serial-64ff637edf26
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15-dev-5b4ea
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773625052; l=1061;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=FQxDz2lHT9RcNjgrMzvk9O4PEjrWBEjOfbPRKpVyINU=;
 b=sOZwYg/6RN0/W1fBpPI6eIXJ1eiHk8lyYX7vsO75X6CC8YUDQFdrbOl3w0SwoHQiyBa4vtequ
 sdHdhLt3nn0D8MWdAJW9mMdkMN8TXCEbHMRmyBXwSyok8LW5wPjeCSW
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAHtSQNX7dpnx0BAA--.1023S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF1DZryUCry8Gr1xXryrZwb_yoWDCrg_Aa
	s7C343Za1DZ3W8Ka9xtF4xCFW3Cw47Xr98Kry8tryDCryjyw45Xa4kKr9Iy397Jr4rJFsx
	Zryfuryvyr1SkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQADEWmxBggAFQADsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183829_768617_C48C5D32 
X-CRM114-Status: UNSURE (   8.33  )
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

This patch series adds support for the UltraRISC DP1000 UART controller.

The series includes two patches:
1. Update device tree bindings to document the DP1000 UART compatible string
   and required properties.
2. Add driver support in the 8250_dw driver by handling the DP1000-specific
   initialization and configuration.

The patches have been tested on Ultrarisc DP1000 development board with
Linux 7.0-rc2, verifying basic UART functionality and runtime suspend/resume.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (1):
      dt-bindings: serial: update bindings of ultrarisc dp1000 uart

Zhang Xincheng (1):
      riscv: ultrarisc: 8250_dw: support DP1000 uart

 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         |  2 ++
 drivers/tty/serial/8250/8250_dw.c                            | 12 ++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260309-ultrarisc-serial-64ff637edf26

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
