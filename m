Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ED9EFCBBB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//KX1H+qoJZszhz61XxSEAQJxICRqwubAVIQDB6ADNg=; b=P2IQPQZE4dVHKk
	jQDBKEkMNm1UPTpXMGHcSLAcB1xfYa9M1cNj1NLtquiltkPWykJiKXGUOErNXaPcqr1Fs00lYL4B+
	nCtoWp0gC7J8bZc+UMZh3JWyBO1ypYAUW548EQym7V2c9QJqWfLQ/r2qiGQ+JfdnBQLrHWXGALHzb
	yd7pAY4acdkr0+cq46KxB0oQ6SzJeb6MTEITG7i8UoSstbi7DUeVfl/+POolW8a2ucaLdc+YcjEz2
	TBwJlyrnlWJbpmnzbu+iKAC9wFL5pKp26IFF5asFjPEZ1BXTr8EAIA/i71aKbptGLa8MAcIHyVoqJ
	cQpBl8JCm12h5b48smKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WG-00000003Q1k-3wnG;
	Mon, 16 Mar 2026 06:33:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WE-00000003Q0W-09G8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8101243D20;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51113C19421;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642815;
	bh=djv1u2JNf9x0lGNw7u4dJc88RxbiQVxfUiQI1JdoKw8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tica4iijwoTOjs2tI71jPmJjKpXxaUKV6Hacz9qjEYLvcUZ6NNgyczqsR7zfRAJzK
	 0RBI1Ey4uzmKI2H+0wnhj0VG8COgCVIDZU/G/80XDIAUiRmhUD9ZFeEb6TJOcvm/9w
	 1mdHkb6NLkQz2x2vHtEEVDRdvSEKnJwfB5RTXvpNdIDa4JRivjBZVI1S5rICBJkh6i
	 zOrxGtPIueVqJ+IxeYaF4deDYRjWKVG5niJJGK5LnxtrLarEIg/lFA5TnuZ5vEGzDh
	 dBTdnG7nAKEG4DnWtwxcnZTaYQdo4N/L7lQztXF1dFG8WmpZiTeLqibVg3sUqtWs1u
	 xoAu7CmGLrR1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4114EEFCBB3;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v2 0/2] serial: 8250_dw: Add support for UltraRISC DP1000
 uart
Date: Mon, 16 Mar 2026 14:33:21 +0800
Message-Id: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADGkt2kC/2WNwQ6CMBAFf4Xs2ZrSYg2e/A/DoZatrEEgbWk0h
 H+3RePF4yTz5i3g0RF6OBULOIzkaRwSiF0BptPDDRm1iUFwobjkNZv74LQjb1he6p6pylolj9h
 aoSDNJoeWnlvy0nzYz9c7mpA72ejIh9G9ts9YZu+bL9V/PpaMM1OlF4m1lPpw/il7Mz6gWdf1D
 ZrpnmvGAAAA
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
 Jia Wang <wangjia@ultrarisc.com>, Yao Zi <me@ziyao.cc>, 
 Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773642814; l=1529;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=djv1u2JNf9x0lGNw7u4dJc88RxbiQVxfUiQI1JdoKw8=;
 b=gfIW1chPaStqWtJUPKcrjAUVN4EHB+jkMVfWtWMQwkmMqfWBb+AQRgDtE21J180xBTs2tmFwu
 gUitd1zpKnYDozapFw5ml8C+MNA4RZuaJIBgJrvMzhej6L/3rdKgSFB
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260309 with
 auth_id=682
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233338_151573_CDEB1294 
X-CRM114-Status: GOOD (  10.76  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is version 2 of the patch series.  
Previous version was sent via local SMTP, some recipients received it.  
This series is now sent via official web endpoint.

This patch series adds support for the UltraRISC DP1000 UART controller.

The series includes two patches:
1. Update device tree bindings to document the DP1000 UART compatible string
   and required properties.
2. Add driver support in the 8250_dw driver by handling the DP1000-specific
   initialization and configuration.

The patches have been tested on Ultrarisc DP1000 development board with
Linux v7.0-rc2, verifying basic UART functionality and runtime suspend/resume.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v2:
- Rebased on Linux v7.0-rc4 (previously on v7.0-rc2).
- Reordered patch series: DT binding patch comes before driver changes.
- Updated commit message for DT binding patch.
- Link to v1: https://patch.msgid.link/20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com

---
Jia Wang (1):
      dt-bindings: serial: update bindings of ultrarisc dp1000 uart

Zhang Xincheng (1):
      riscv: ultrarisc: 8250_dw: support DP1000 uart

 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         |  2 ++
 drivers/tty/serial/8250/8250_dw.c                            | 12 ++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260309-ultrarisc-serial-64ff637edf26

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
