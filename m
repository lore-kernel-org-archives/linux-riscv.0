Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18784FF60D5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:Date:Subject:Cc:
	Message-Id:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b70y5y3NlM7KxI5JwYbQMdgYan0w/0Y3bwZeFz2jNAg=; b=nfk2WjyXeZ9/u9
	PpgB2XLnciqVDYjFzbjv6hsnW1sDW6AEtXA5/II2ZmN6lSS27yvfyYp0mTxOfaNdPowkacCghMqBZ
	McLvYKsEiGRDsGyF76QkVd9vfhAcB/b79068aWF++gssPGb2Clk6X/XP/07iuLRvPe+9+e3O1Bza2
	ya5rrMV6fSvvEweqObJCb2Jd1G5s4aRwgLSyYG8S6uKvW3HTYSmXNpDITjtdhVP8hNwCCodb5rFO4
	C2eumXfQELUcocEJ3nwvk8A0imOQQkeoi00yXpW6xgQf2SwLNH+KeKoZYVbmj1bExitRt3afdPPaY
	s+vbIySW40NfwHVfoUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TGF-0000000CRQd-2uat;
	Tue, 31 Mar 2026 07:11:39 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TGD-0000000CRPZ-017b
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 07:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941091;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8LvtcAgNW72TvNFdsfpCUs8GSOu6QxdCwl9yWGk2NyA=;
 b=I3z1X0oUMn66Yx9eaa3f5SMj3rgzRZMAn+/6fUKBfoVxzdIRhp2umo+iz9lBCx8CUP7y+R
 KDq/xQqeZGXSrkOD0w7kJwRTi9dhb3C35CVDRhhFPZPw1y0XIBB56gcaQR7qm9bqgLgOV/
 CMSy6mKEHRwW1/FfrMUpR7R9WfhM4rGf0tJc3Wbd9Bbza0MTHC5MXfgbQpw/jz3monHSGf
 aOkLszv6yBTQNw7kSlErKHFVYSyoKGBngpnmbrhE9tJINopUiRLyKaxYsi+iNb/cQyLG8j
 YYfbBPPezxwgIh1AS7ec+TfLrPzSfmT9BwldalnDXkqZUJi/jvXKscL6jFoGfw==
To: "Conor Dooley" <conor+dt@kernel.org>
Message-Id: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 15:11:28 +0800
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb73a1+4b8bb2+lists.infradead.org+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Subject: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
Date: Tue, 31 Mar 2026 15:11:10 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001137_100566_3835CC13 
X-CRM114-Status: UNSURE (   5.19  )
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

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is based on riscv-dt-for-next.

v2:
- Patch 1:
   Use formal format user name.
- Patch 2:
   Use formal format user name.
   Add Reviewed-by from Troy Mitchell.

Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/

Sandie Cao (2):
  dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
  riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts


base-commit: 4a1739c30fc66a59450c1f78923f94607e786882
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
