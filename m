Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4F606A335
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EeFqDNfh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=cVKyWueX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MDCewKD4jazi6IT53LAaZ8xVqM35t+1hx8Z2BGBsyvs=; b=EeFqDNfhTIEXJISCZORreLIkpE
	//HlNOSOOZtmkiKipQEwbTfdbxBz89y73GON16vYXsiHtyFUtkceS3VejLM9rPka/vMrr5heGZW0S
	psmiOyUHevPvznarJ9VxxJz63F080+VJI7KuyIeUfYJd0QsN6F/rU9CVFrrvVs4MDRVPNXA6pdBhk
	NGqVDWy1/H5AXADnAHqcY5bnku65OKdAFUGJSHhp6qVnGSwVOFJ0IrVOpLIGQyZ6g0jc9mlD6+gID
	O6YOre1AxJ6DclmUkO1AyGaBJ1LF9RO2raxTMfikUvBIyJo/oM8+31CHsq+QSjthhfjo36FMy3ydG
	sXTONzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHM-0000000D9kf-23Dd;
	Fri, 13 Nov 2026 14:29:24 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHI-0000000D9hh-45eK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 14:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580104;
	bh=KVOhFnVSIjiwAUMAbkEs0GHK6ofJp+pdmSiQPnM4C78=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=cVKyWueXT1PBTH59X4U6l8736qPTUbZeb3HQsFx+08lgW5ywUdobYSriB8VLLf9Qb
	 VAiflgjRJaKVAtBDYcWtl9mASleO77QcU2GtN1qjwEa+3XBAJt6EOBeLju8tc1OBcP
	 ArDw30ZH3v6EfEC5pk3FYvjzFk750lxUQ6uD4iXo=
X-QQ-mid: esmtpsz19t1794580102t15960a9d
X-QQ-Originating-IP: OtwkmhLQeijisZqg4dvnATw60VR6lZzoDHJEgwUjh0E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15320170590210169424
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] spacemit: k3: Add support for BS01DCMA RV2768
Date: Fri, 13 Nov 2026 14:28:16 +0000
Message-Id: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf8V0bUk71hJd+R+GRRkGGZVHOkAwh
 H8XcOvyJOeeOyuhyCTqephVpJGF22YFOB4UVqF5kOZiZQUGvLXG6ddJ52JsgXXQzqclgUfnAdW
 66CKVPO21e/ZjGfInYb8lNqNi6dv42e9Gu3n/y6PVRqcXZ+AMLiUXbm9uhimRLiDV3CfY1ipbl
 uULBOlUk8EAAAA=
X-Change-ID: 20261104-k3-bs01dcma-467fe26c462c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Ap6mS1rojI6psEsTajnDhc0jWrETz/FHGoNHQBeYgdc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5Zp0rs2bteVLyskUj78Ml5XnJ57SfVWhzHhm7V4l6
 /WFP/mudZSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzEbSbDHx4Xq4eHXtq/sFe/
 FDjd7XXMFVuHXTkfdkVruTy1PLXBw42R4fGJE7tiUv4p37/5P92Zle+spvKj+RGeGn1RExs4bNI
 seAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzTGjtyErg4OxsCDnB4l3dgzv/8ka51ldXrFWci5ch/kPjXX+V+AT86A
	yWDegdXjl8me0D9xdycUm7f6ZlxLqF2R5mYNnOO2S/zzIfIBWnOnFCtn25UXGTkhKC3Awjy
	CG0wgSLohNkFiCJP+IG2IDQZ+xQcy6VyH6d9ENJxFWY13Kha8vgvtiRXbFrCxq93xBrLuRV
	CeEUPGjsRN3iJkeh4X0Ssl7QYQfBEKNGV2pF/NiZRw1m+uhZ61RALwTiKrFpu8UkR+835Zo
	dGtzEfq1+xdKzBhsT1vQp94IgxBsynkboCb0MWIj6VMhs6sj2FN9/mMIhp14nV6hD/GDBYE
	CpAycWGqJ8qEaZLiAK9jQuZE8OXZKpfKEapNc4pke0g1/BGlX4xFe0f7Whm/zFVrRiLmSCt
	s+S0zjHF7lvp2RtPAMcx7SoBX4rUYB/DKhkjf6sL27wvFnRxxdjQG/ygWvDo8w1fhoy24Na
	K5LgBsF6PJW5ag8r40GLDFuIONt/PjsWmxITTwk6GAwp6XGUnCJEIqlPHzckoMBQhuDZXQ6
	NfIDlFpExciv+HwrNDXInM3H9gY5E9The8+kG/AcWumlSxhwJJvQVPAW980m74jFS3tPlBR
	37xoI1ApTQtKnzFfDnBFW0PivaPlMdLGi7YJfkoT2n4zzZT/uW2EWQXYLl1M1sOLGYpb/oH
	TimW9ZyzDc2LH+9tXTXLwHC4XZU5SbUKFpwbE4EKRTwJ9oHtNrGVHv6iWOnMaib9x0maZPN
	BCThDwv1zheJfzhJVxfKgHDhPi+7QtK99RKxs85cXCwnsqB+9ZU0/X6JVZ5IC2Y7p8NAuJI
	mVtCAkmfBAFQgcsYBG8Z9GkmJUR+L6xyTQhiSW2Yn8fRHlBKSpYLyF1Jilgz1uKUxzNmWEE
	5QgyYYgaDhwgY8eo8nrn16g80rAYzQSDo/XlXS+zQuefiBmMi0DSaBuWbKoo9kFV/46VS1v
	DH4I3/rJdAAwz6Ryvy2hbV4trml8f5HR/FDXGgNoDBqYSlsSZRvU0n7my0uMCaCpt90Djgp
	nZqyiZssJu7YnVkrxR5HX+Cp/52soKPnvm1FhUI/hccsquVF5DDv/Rn8n0Xt5m/GJueyXIX
	wu38Sh8XwSxwjRGs9c+dv8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062921_877523_B0E53AA1 
X-CRM114-Status: GOOD (  10.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds initial support for the SpacemiT K3 BS01DCMA
module in the SpacemiT Cluster Server RV2768. BS01DCMA carries two
independent K3 nodes; each has a K3 SoC, 16 GiB of LPDDR5 memory, a P1
PMIC, an EEPROM and QSPI NOR flash. The RV2768 carrier only connects
the modules to PCIe network cards.

Enable support for the serial console, EEPROM, PMIC and QSPI NOR flash.

---
Changes in v2:
- Split into a k3-bs01dcma.dtsi for the module and a
  k3-bs01dcma-rv2768.dts for the RV2768 carrier (Emil)
- Add the spacemit,k3-bs01dcma-rv2768 compatible, with
  spacemit,k3-bs01dcma as the module fallback
- Describe BS01DCMA as a module instead of a board
- End the uboot partition at 0x700000 and add a read-only var
  partition for the EDK2 variable store (Sarah)
- Add vcc-supply for the NOR flash (ALDO2, PMIC_VCC1V8_QSPI)
- Link to v1: https://patch.msgid.link/20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <docular.xu@gmail.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 BS01DCMA RV2768
      riscv: dts: spacemit: Add K3 BS01DCMA RV2768 support

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts |  19 ++
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi      | 264 +++++++++++++++++++++
 4 files changed, 289 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-k3-bs01dcma-467fe26c462c

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
