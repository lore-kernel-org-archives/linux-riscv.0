Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D7EC98322
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+01LlJjmE0I/ORDRYnXq8wWUxzq3OiMhlkglI0oj6gM=; b=IsMJSznjunUYqj
	q2+eEztjeNKZZaozCb0A9iMR349KAAaScKxDbEGT93nWqIXWFyPE5ie3m4sEGeW3qNHhn9Fuv1c/8
	UraWTh1iYbRgrKC8pYjcEPqIEpKQxyro8D4RmZ3Zu6auqL/atl5Ft6zVfhwV0xT56I7uaIUGyyiqp
	cwNKGOI/TM5xRz6ueZH8mKYbqXveVbAzkCJAq23GPOOg6fsQO+o01AvD+Iu4cuj+3yl8aG5J/gfus
	FAbZp1SjbdQ1/GAAGx7Q/ePn6UhYOZ4+ckiIFEi/3owbZwY9czDT8xUVdxpCb+sbed98s5RpPkoLN
	f1ZWMoxw8JUNXfyLQ89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3Hp-0000000FQt6-1KQl;
	Sat, 17 Jan 2026 10:12:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3Hl-0000000FQsl-2tBb
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 10:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768644714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZQ0m4FXVJikOf4Wr7pOo6ZKu/+hmKwJmP+LyAlGz0A0zoUh5CpMp1BWBNEKtyC/ctfmghF01ut3YpQHhk9TyR0rUF+xNmpOLEowv0C1Gr0YiGBAy9pwiKeeHVBpQNteffi1rwIifY4lNWk1JROeug2zM1IlCD2YeUjZoD0TZW7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768644714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4jerQzMS1Ru7y2iLy77NguLWgZaeMtwSiHvpfO6DDW8=; 
	b=FAXMtP1nMwwip0IsvKb9eNNoww5hy07lxR0aWMXeGMUQllsrXVwlc6uYg+R2EnwqS16uu8Rbt3I3gUl8JEXx8CWu+n40P1pvMYeM+ZHP3YHuxIoGRLaacS9Y/G+QdB++Y+2kxEiUDS4yiAo3VN27s+CXa5gtRqlFzDLzVCJ90S4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768644714;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4jerQzMS1Ru7y2iLy77NguLWgZaeMtwSiHvpfO6DDW8=;
	b=ExwOTSWXmLCQrhh5dJQ7Wh57E3i1Sh976SjwENiaRWUtDdYTyTy72BMm7+jRjNmD
	5iJBlRQ02a98pezYeGisVl+Jn6RsoNKNkwRqvKdae1ExrDWUOUftOYf6/uM9PcuSJak
	Ey2YDYIcTabiCNDcfgxNllNJKHNCv4G47IlLqN3Y=
Received: by mx.zohomail.com with SMTPS id 1768644712178870.661647059417;
	Sat, 17 Jan 2026 02:11:52 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] riscv: canaan: enable reset controller for K230 SoC
Date: Sat, 17 Jan 2026 18:06:21 +0800
Message-Id: <20260117-k230-reset-dt-v1-0-c8cbaef1e1ac@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBvwD8OuEi0kpxqCCo0IxLsnL
 b/FewUyJaYMgyiQ6OHM59GgOgHzFo6VkGMzaKmdVKrHXRuJiTLdGG80zlnjbZQ+BGjNlWjh9/+
 NU60f9TORwl8AAAA=
X-Change-ID: 20260117-k230-reset-dt-3664394d09aa
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768644706; l=844;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=EBd7vuZH/NuJ1kZjzpbMFqVX/g4GbrEHtDkM4v2oZFY=;
 b=givw5Ua/ZPxYG9DvZcLqKtnns5Frih6MiRQiLyrcHS5WNH+z6crLWQIYCG9uFLEDk9h8u8irZ
 3sBAby42U6wCv9N06QiEiB6JiQtXSZvRZlPUPL68J5PEXaLZDLWJNdD
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_021202_117028_AD02FEFF 
X-CRM114-Status: UNSURE (   7.39  )
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

Enable the reset controller for the Canaan K230 SoC by setting the
driver to be selected by default and adding the reset controller node
to the device tree. The reset controller is essential for development of
other peripherals.

This is based on the k230-basic branch [1].

Link: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/h=k230-basic [1]
---
Junhui Liu (2):
      reset: canaan: k230: drop OF dependency and enable by default
      riscv: dts: canaan: add reset controller for K230

 arch/riscv/boot/dts/canaan/k230.dtsi | 12 ++++++++++++
 drivers/reset/Kconfig                |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 337616aad69b2fb38b3024b5e2531f7e1739570d
change-id: 20260117-k230-reset-dt-3664394d09aa

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
