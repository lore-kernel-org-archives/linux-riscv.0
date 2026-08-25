Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB06C5DF9C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/eU4Itkq/7iEh6Rd/ZEnwwPuFd0uAjGpDOrsZUtl0E=; b=uzetrCJ1USBIGw
	v9s+Ww56neKPe8esVwP/yuC0aawStycCpmyW2R/ODWSOsAysoHbF0E6pOdyFEON1tZmRRjXzB2IAN
	GQf3fNdORlwcDU4gLi2xngYQqyR9lXAcU2Y17zd6rTIwRt6YgygAsUTfqPRhHOYEVMcbjgeJbwq80
	Rv2GOaVxBhxS8tDG+oIm5cGdLIFf1xyPHRyUBHEWkzerX75fZa2mg6J/JGlngM9tBBhYYb6h56rfn
	94YVhJ5dOPO4H3enmR8yRMu2AgaLrBILmSZH2UqV8nIDMR6tL1Sdai8+im/Em03/euOkM/v3RJJ8y
	UtEAImU51N4KoJBZQ2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjcQ-00000000BEW-0kor;
	Tue, 25 Aug 2026 05:22:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjcN-00000000BD4-0eG9
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 05:22:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so8004641a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 22:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635357; x=1788240157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X62f8JLureuRidSfKDfwTN0I14MXvczhJm1qCqBPeg8=;
        b=O0ppeF2+LrCzqbQDd9eaHWPpRQvbZlKWe/5Pg2DTAXBSCZsho2kuEYDbn31TIlU+zQ
         M/eBHrj6FD6s0a1JEpCZoWD4q3pBBWpp+r4FGcqKr8ua+4HAp5hrj9sm01qOhHb/0hy9
         izbbxlWRwbJVuljiLtVuF/zQMbNsaICzOrtPHvkWm+kz9xNR+WQyzJhBks9Vc8yzcv8z
         p2fKUV3QaFBdYMbtfmq8EwAbsu1OKubpGDhbGbEgOYIcNblqBFuqOcnbx9Txu5PfWH17
         iUxmfPq8C1I098UxBeW2TsMlv6LKG84SB2DXoMyW6ItuVEb0YXl+f8uoqSSd3MFLI6sU
         zoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635357; x=1788240157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X62f8JLureuRidSfKDfwTN0I14MXvczhJm1qCqBPeg8=;
        b=X8xYR0WKBtvg2xTl7pbamE9o+9I3fqJ16X1jZ4VeVoNg6SGRIDUm6KGtiPAr0y+p8l
         /KSqmpB+bj5KODb/KaX3zClbbqlJvamK/dUpKGpU+8KWOEjXBHso9Lc4EMAgi7m1nycL
         LZv2Jkw/ep2AKccolwT4tiSYjzJZJ+9sfdWEoew0GY71f0iGAqE4/pDKE84L+DXz/gyo
         pE/GNkU6EPeYd2D34LPzPlvAN5MLHOO/3CYAKV5Zwf+Fn5RM6gOA0wcGWfsDfka0+lYA
         auex4su+JVnubgPqKwg0bgWTl21/kUQZZi2q01nFYPzyijBLk0UIwfgnrgTOH7No8o34
         oeyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTgnSxKrYQbT/AnzWleeMsrF6stHHVyEoB0BqSRRyJ+k+zmWWj/5lJJhT0y/FZIGGXp/O787Lie9/PxQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kAW5A4k5jgHyOoaaUDIH+pVtgGkN73xd60yqpBSVl5MP5rAvYS
	gc/d3YlsS44ieS2m43F2F+PegRitNmrBrU9i9wjZnpN9K9X5qLfz6twc
X-Gm-Gg: AR+sD106PLZwLDiAndDUC1JkLLROCAJFKsczI7aGz9S2fC5jRgLh/KBFaA1nHtyxVeU
	/Ibbc4x1/+5pvDwWh8wOpeI1s0WeseS2zWX2qazm/hdhBxKYAFJ9AWaEpvyzP4h3PfYzCSFBD7h
	w0bf/Vj0jyBKhw0Wws/Q33YCqZm8951f+aflYJ89QR7l5Vmn1HhGlCTO1bio/CI1h3V4jqkAGyP
	i2QdAxlrcchioo4hJhM5yZQe1b+6ExVTLfykmsBq4vaLKIsO5W4bnfXaiwxn1JjZa9U255dmVuh
	4wsf8JY50wv/wvaCLvXQ4m9QdRPweBDfmn5niUh1JOSsCaDlogHsz2HUrtB1wqpL+7lU0C/ppRg
	VLnh70y8APdypWWeQbKeNc7Z5j8AdrwS1nLhnbQaQbkONXKyKlUR/adtqhX6yKbmQ5jh0vfKv4n
	aIEtnPoRwghneRaqkfArmelnIv2SU6rwD3zSCO7yHOoPr/d06PzurqjKh3HhR+PSGGExbPAaNC9
	qS9d2gCMKedZ77HiByyg4omVU+WFCoKuK2dZiv3efUbvByz5AhZWQTMKwEOxJfVNg5i
X-Received: by 2002:a17:907:9603:b0:c07:43ed:1b3e with SMTP id a640c23a62f3a-c2469f9a365mr3519262466b.0.1787635356936;
        Mon, 24 Aug 2026 22:22:36 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1644654866b.60.2026.08.24.22.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:22:36 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Tue, 25 Aug 2026 07:22:33 +0200
Message-ID: <20260825052233.66850-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_222240_169988_DDBEC104 
X-CRM114-Status: UNSURE (   8.64  )
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

Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
build:

 - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
   the USB 3.0 ports on boards like the Milk-V Jupiter never probes.

 - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
   here, so a K1 board comes up with no temperature readings at all,
   even though k1.dtsi describes five thermal zones.

Enable both.

Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5..03d9ac2f7 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -209,6 +209,8 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_DWC3_GENERIC_PLAT=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
@@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K1_TSENSOR=y
 CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
