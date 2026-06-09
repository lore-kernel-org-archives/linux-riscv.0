Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E156CD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JYLOy/Jq83706GFr6SaqaUrKHxkC/94HAGbHz8LN6i8=; b=e1eCNgp5BIkvK+
	W4zKeGh5LNT08Z1KIFjB7f+2YgabVFf4AYSULuUsB8LWtsBG82oQtT5g91i08WL9sDsfjLBmhNWNq
	aiTEYiA0W2K7iBQwJIGXxF1gT52IS5L5gJdmpHdRhvvEPKukdXQ7t2ZS0Vppvc784+xHfQx8EzuUu
	0u5k5W4gs8QfW9y135NYh01j0CjvJIgPe+MTY2LL73CYFSDA7U5QkZi992bG7vl8qVLPHCHovfBqF
	SCmneQI0B1BabEqgDOEifDilpA/Z8cv/x3DKm7N74lg3Ce+0k+uLp/0n8q50+viT1A9n5e5BIGQF9
	cprMkrVwYsIMpV1MfiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Q3-00000006JNu-0sGL;
	Tue, 09 Jun 2026 19:47:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Pz-00000006JNb-3dJi
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 19:47:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c857fba35cfso2926180a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034443; x=1781639243; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=SdoyqBIkknSmkJkWdQbqCQQyyg9fevy74CO8kR73qa997FRBX8uVNB3e61leh5AbGN
         fygx9Ilw+u5pWyZMNqEv0C6oN78LsXHVu99Avv2YxMTDhPncLa4gCoSp867EsDDym0yV
         mIVd27le/dZr8K031T7bqeoyR9CcMW+d8xeq7Ge9R8wTP9MecWaSAU+EoFINLzBbeFQp
         sTQUiSk16mXDI6gjva4E64+351wVRB1ict/Ow4iu0NUp0AuA6zvn9t6CsesZGt4fkVzX
         aiW3nxHqoJSmwq9VvEA2rWqUGdhWvj/AfqdQVzFMhRsIpD2DdnZCxRb3rK2iMh0rSqtl
         LTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034443; x=1781639243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=nH33TIYXmgheZp/OdqpUARQo1j32574EMnzPM+n3EG8MqnAbH1hGS9/vzfxetVm42O
         x+Y4uDF1dQF2dPy3vaOs+RPtmdxsw9+4bfMnyAayJmelo/wX/zQlQrnqmS83Q9olvqA+
         1qMoPlDDM1R+6LD85m7vA3t3pBtf54VBspZCSkpR0gMyWlnKE81QT8Wx5Pg6qXwcLUxc
         0hq9+VcLW4mx38B6FWEVkjT8imkhyBYA1Qx/riiwxqEyVlKvDnH9pzdXeuJ409Qiqoo1
         +X5m1KSse94yh0yx6IlzMlsA/3sMHXobE30BvgiD8WtkwFz4TqOUP8PvqX+aY4hMlRIY
         ZGKg==
X-Forwarded-Encrypted: i=1; AFNElJ9h29NlpUE5rhE0OUnr0oNwmMzM2Hg0JyxwxoYyJTf+ZNgXH8DzQSB6HvCr4f04Dfx5PLIs+IKIBeLo+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Q1K6dhJiTu0jwQuy5wil1qRowXmQRIaHPFee3hTA7wW35710
	Sd5RrEX9gO+CZICOLcChI23bolzSqQktzAsMG6BDrtWaqABgmedfGUB1
X-Gm-Gg: Acq92OEfTjDlyq2goyBETf2anM9GIvXJdYS+T6PiWEC0kCRH2fxixFiE2CSBAM2PgD1
	Zz8UVxo1j7B3x8FV3UTlXAf1obABzMnl3jMhHe1q0Wo7+Hyu/DRHSO/bMeEeYKbvK86MRMW7qWf
	/Zk1k65JwUT0FufDfRvmxRVdE4Ukf2yGFHBB0Je9WS7PCSd4CSKWg9958ioq7tDOyqDU4UNdqNR
	Joubzvjgfv1CRwFnwbMu3JnImD/q4fD+px8lO4fRtJDeI+68R12LKN3M23U4EZVSPRFyjRwHUsb
	cjtj0/0Dc3A9x2ZmqAR+EpgAGsESSetONoQRBtfaMTP+NoAd58/C2wI47kPlJuODFS+T+V6mrhL
	Ee7EviQxtz68kU8LpklCB//3eV37hZ9KfJlWK+VYWoKCk7WR+x/oVL5GTRgk4dyIBWeqx6n/mvd
	bGOXJEqk2I
X-Received: by 2002:a05:6a21:3949:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3b4cccfde39mr26226941637.5.1781034442949;
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: Add SpacemiT K1 PDMA request-number
 header and use it in DT
Date: Tue, 09 Jun 2026 15:46:37 -0400
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1tKGoC/4WNQQ6CMBBFr2K6dsy0SlFX3sOwKO0Ao5Zii0RDu
 LuAB3D5kvffH0WiyJTEeTOKSAMnDu0MarsRtjFtTcBuZqFQadSYQ3mAu4TOeQORnuCNjSHB0al
 cO5RKu0rM2y5Sxe+1ey1+nF7ljWy/xBaj4dSH+FmPB7l4/z4GCQhZqcz+lGWIub3U3vBjZ4MXx
 TRNX5UPZW/MAAAA
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=+Pdfi70LkinVFTovJkzCSbIOzEBbKyNKWMr5FgCeZf0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3J0ap2uYnpxhcd+dxnzdfc6yC21LvXott9jc57uh8
 GCWkHhiRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk30VGhrkzE6YfOzR7l5tW
 xJPnr3+V1+iWFc9dtzx9/et51/skT4oy/GT8+HZOVUWLybYvGa+5Tme+6Et9eufM0tpDvUn7xM1
 dG7kB
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_124723_938375_57CD2C83 
X-CRM114-Status: UNSURE (   9.48  )
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

Currently, K1 device trees specify PDMA peripheral requests as raw numbers.
Add a dt-bindings header naming those request lines and convert the current
user (the K1 SPI3 node) to the new K1_PDMA_* macros.

Patch 1 adds include/dt-bindings/dma/spacemit,k1-pdma.h with the
  K1_PDMA_* request-number macros.
Patch 2 updates the current pdma user (currently spi3) in k1.dtsi to
  use these request number macros.

This patchset is based on dt-for-next of spacemit linux tree. The
request number defined in Patch 1 comes from SpacemiT K1 User Manual
[1], Chapter 9.4.3 DMA Connectivity & Assignments.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com

BR,
Guodong Xu

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Guodong Xu (2):
      dt-bindings: dmaengine: Add SpacemiT K1 PDMA request numbers
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

 arch/riscv/boot/dts/spacemit/k1.dtsi       |  3 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h | 56 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
