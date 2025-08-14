Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5DDCA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQJ/4tSA80LXnLt6vGiuPfXYHSfVtyfUXoxYD0QFvlw=; b=o/ssIGtueLH+XS
	gLEQUtfNcEYfp8aki/0ZkjQT74MJUmRNySXNk7P8TLUx+j0ezlstId5p5P4P11pWy+gpKAGeaLbnG
	XVript6XQsj2hqU9AZBKCRamKshVqfK9cxlGOS1b8fw3i5oaBGsxP8zn5m7mzZeUkQ75qtWOC1TAc
	G2vmjod8b6MNV2jegWOjqlJX1sX+U8Rlest2RRVboZC37O3rP8x1LZIu7ohs4XphNkUkdGFjrATCd
	9wmMZWAPt3UHybqxcP6cHcssNgtheAL8zKg5TT5J6nklJ+UGhp27UvEdDVWWRb8ZewiCBlaVb5IlZ
	I12eUbKbFHtwACzKV0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXms-0000000GxPq-3Is9;
	Thu, 14 Aug 2025 13:14:34 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umS4a-0000000G2KI-2UQW
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755155305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ebyI3cNTWBJBqMMSOfACpbLrfiE+Oi8tZqwtCGkduWU2k1GUWhqjp/xKEUk963Yc1pcNeNJLmdaG01G4lzR6Q5K9hMYGEY4lwJNEBXq2A5Vz05glIiEMUScV2zl5KvsC1ZDGHs0GUb6g4s6Kd1/JnWPQvnNzNvk9p/a0e7jEpJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755155305; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sF/tSvNuuGT3ifsi/fwvjO4PyluzGm3UUcRWCF/Stgg=; 
	b=hWxhDpX6kLJVUyrinxqdRI5ucfdPwzHFM39eJAN9ls0bhn+GTHpIh3Rf0Os0eP6oFowmFiZeYKSpYUqVs5fz58vjxF7TyvqzVDaQXe5VkQxWGGCN7If2JPQbSjblmKIJLtEWoaLvElzSPYad8KEl4FTW2sFXaRSihpCx3FjT7e4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755155305;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sF/tSvNuuGT3ifsi/fwvjO4PyluzGm3UUcRWCF/Stgg=;
	b=YuaaDFVLocstJ2E2Hi+eK5zQiGRSHMRDzUMktCL7pVu3Tt4kCEQ8+O37NyC+shRg
	QeplN6qL2d3+EiRSmPN0DgsFCyf+Z0HtBXBaiYjn8mZfv/MaVdf7a8O0txzfigAQmnv
	eT5BWiXkF7aTbwzKm7As6lwKhODfLIPVRLjOwHiorNDztvKUL9XACh+iF2pA6ZXzlKW
	4Jg3f4prsGhVgY8G2SyCNje1mDGxLLHrad3BPwK8M/Z6cyTecSBlOYeq+cQqoEFRJjB
	EMvj+dGytW1FFbgqborw8kO9eCHe/b6y8SoIt/ZiNO3VYKCbz6aG7w+djzie9xYUENj
	s4VytXJMCQ==
Received: by mx.zohomail.com with SMTPS id 1755155303099302.5556760104745;
	Thu, 14 Aug 2025 00:08:23 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/4] dt-bindings: mailbox: thead,th1520-mbox: retrofit for other mailboxes
Date: Thu, 14 Aug 2025 15:07:54 +0800
Message-ID: <20250814070757.2267325-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814070757.2267325-1-uwu@icenowy.me>
References: <20250814070757.2267325-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_000828_693177_0A093ECF 
X-CRM114-Status: GOOD (  15.70  )
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

The current binding of thead,th1520-mbox can only apply to the C910T
mailbox (which has an ID of 0).

Because of the weird mailbox register mapping practice for world
seperation on TH1520, the binding needs some reword, in addition to add
a property for mailbox ID, to describe other mailboxes.

Update the binding, in order to make it suitable to describe other
mailboxes. The example is also updated, with an addition of mbox_c910t
label to show that the example describes this specfiic mailbox, mailbox
ID added and the register window sizes updated to the values from the
manual (previously the remote-icu0 register windows is declared to be
overly small that it would never work).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 49 ++++++++++++++-----
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
index 0971fb97896ef..5a24d2e8a6a8c 100644
--- a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@ -12,6 +12,17 @@ description:
   through mailbox channels. It also allows one core to signal another processor
   using interrupts via the Interrupt Controller Unit (ICU).
 
+  The SoC is divided to two worlds, REE and TEE, although it's currently unknown
+  how to enable the seperation between worlds so the seperation does not exist
+  yet. However each mailbox is assigned to a certain world, and register windows
+  for mailboxes are assigned to different worlds too. In a certain world's
+  register windows for mailboxes, only mailboxes assigned to this world will
+  have the local ICU part mapped (in addition to the remote ICU part of the
+  other same-world mailbox), and mailboxes assigned to the other world have
+  only the coressponding remote ICU part mapped to this world. Two mailboxes
+  (C910T and E902) are assigned to the TEE world and two mailboxes (C906 and
+  C910R) are assigned to the REE world.
+
 maintainers:
   - Michal Wilczynski <m.wilczynski@samsung.com>
 
@@ -22,9 +33,9 @@ properties:
   clocks:
     items:
       - description: Clock for the local mailbox
-      - description: Clock for remote ICU 0
-      - description: Clock for remote ICU 1
-      - description: Clock for remote ICU 2
+      - description: Clock for the other mailbox in the same world
+      - description: Clock for the first mailbox in the other world
+      - description: Clock for the second mailbox in the other world
 
   clock-names:
     items:
@@ -35,10 +46,14 @@ properties:
 
   reg:
     items:
-      - description: Mailbox local base address
-      - description: Remote ICU 0 base address
-      - description: Remote ICU 1 base address
-      - description: Remote ICU 2 base address
+      - description: Base address of this specific mailbox
+      - description: Base address of the other mailbox in the same world
+      - description:
+          Base address of the register window in this world corresponding to the
+          first other-world mailbox.
+      - description:
+          Base address of the register window in this world corresponding to the
+          second other-world mailbox.
 
   reg-names:
     items:
@@ -50,10 +65,17 @@ properties:
   interrupts:
     maxItems: 1
 
+  thead,mbox-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The ID of this specific mailbox that this device tree node describes. For
+      compatibility with old device trees, if missing, the ID is default to 0,
+      the C910T mailbox.
+
   '#mbox-cells':
     const: 1
     description:
-      The one and only cell describes destination CPU ID.
+      The one and only cell describes destination mailbox ID.
 
 required:
   - compatible
@@ -72,12 +94,12 @@ examples:
     soc {
       #address-cells = <2>;
       #size-cells = <2>;
-      mailbox@ffffc38000 {
+      mbox_c910t: mailbox@ffffc38000 {
         compatible = "thead,th1520-mbox";
-        reg = <0xff 0xffc38000 0x0 0x4000>,
-              <0xff 0xffc44000 0x0 0x1000>,
-              <0xff 0xffc4c000 0x0 0x1000>,
-              <0xff 0xffc54000 0x0 0x1000>;
+        reg = <0xff 0xffc38000 0x0 0x6000>,
+              <0xff 0xffc44000 0x0 0x6000>,
+              <0xff 0xffc4c000 0x0 0x2000>,
+              <0xff 0xffc54000 0x0 0x2000>;
         reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
         clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
                  <&clk CLK_MBOX3>;
@@ -85,5 +107,6 @@ examples:
                       "clk-remote-icu2";
         interrupts = <28>;
         #mbox-cells = <1>;
+        thead,mbox-id = <0>;
       };
     };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
