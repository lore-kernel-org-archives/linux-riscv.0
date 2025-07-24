Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D33BC83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFhxJWtOxfHYrjnlyq7zDfF3+7cuXLoKyL1bRNobt3U=; b=L0Fno1pircL/l4
	a9j3AUf/Ms6Wj+KuUXuqmi1i7ALR1Y/N9vcxSWDHHMnllUeWrWCl1+IpDGXp3REm8Ur/BVKO0l0Ma
	v83CGzGLBIkH7h4raM+ZJV/lF0WMI14UALUYCqeUTAbFuxLbAeEN8Wa1vampjbodykJDoeZXBlw+d
	WRX+ow9ncjoicOSCMMxBGHTteWUQpIqs8pDTjV+ioZhGh1JN6XPEVgwdoH/drVv3bZ2MC9jguH6Oc
	JaUQQ7IEqSVeDBkpESiAZAcFhYWuwlsQnlzEkW9qCV+ox2iW955qlHKZFmiPVHAj5Iyn+gm+aDMtj
	Wx1vwriijTM8Q3ugH/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezVX-000000086Ca-3bFW;
	Thu, 24 Jul 2025 17:13:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexnD-00000007pqL-3Uxx
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3D9BA564E7;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47FCEC4CEF1;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370614;
	bh=Zi6IDDpoS9Ju4hosKorQswwX55xC7wpT4z9/JYXU1E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AX2TNCo/jocHN41yMdZ2XQpEKXtcdWlaKfHt3yIoTMe6ezJI/+yUi58bvVmHakFrn
	 0katFrZdEvLf85Fj1p3L16P6Q/Oj9pHsVGfeKAq5PJoV6hlKdL9VBwvrHs/sVSHmxf
	 EhD4k6bkPiz1MWLqD0P7gxXRUooqbxKNMnuj8v+eYhh5PCuAwldugR4mM2dFVsCXj3
	 JkIbfjzfqGLvPPHb3spruBzKEpvmu83uwqBZFQKzzwBQFAZ3ZzEdCpsNiP3MxqcB8O
	 vKQjZRQdRbrhT/bdN5WkyHgXlPJq5hrOwWRh/2Xjy9jdlMaeYONjnTLNRdLe9L6ZKK
	 1j6x50ZmieYLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D92C83F1A;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Thu, 24 Jul 2025 17:23:25 +0200
Subject: [PATCH v5 1/7] dt-bindings: riscv: Add xmipsexectl ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250724-p8700-pause-v5-1-a6cbbe1c3412@htecgroup.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370612; l=1355;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=YgG7inSQQ5V7j0uCLEwS/5ucVThfyy6CA6ktsQ9XHnU=;
 b=ptCHQ1B2h5iN8micPgjKEGy82G2w1BNtSjEs+wuE3VlzFKIEvR3Y3DbQuOOLl9ErWfKz1DQSY
 HJL14K0HuXkCCySBJYtAauAKjFzt6A5oln0zXi1phgvbD4cOfZV2tay
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082336_048986_8C114C80 
X-CRM114-Status: UNSURE (   6.39  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4KClRo
ZSB4bWlwc2V4ZWN0bCBleHRlbnNpb24gaXMgZGVzY3JpYmVkIGluIHRoZSBNSVBTIFJWNjQgUDg3
MDAvUDg3MDAtRgpNdWx0aXByb2Nlc3NpbmcgU3lzdGVtIFByb2dyYW1tZXLigJlzIEd1aWRlIGxp
bmtlZCBhdCBbMV0uCgpMaW5rOiBodHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8y
MDI1LzA2L1A4NzAwX1Byb2dyYW1tZXJzX1JlZmVyZW5jZV9NYW51YWxfUmV2MS44NF81LTMxLTIw
MjUucGRmCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0Bo
dGVjZ3JvdXAuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbAppbmRleCBlZGU2YTU4Y2NmNTM0N2Q5Mjc4NWRjMDg1YTAxMTA1MmMxYWFk
ZTE0Li5kZTQxYTZmMDc0ZDNhZjJjZWFmNTI5M2RmZTc1ZDE2ZjQzZDQxNmQ2IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKQEAgLTY2Miw2ICs2NjIsMTIgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIFJlZ2lz
dGVycyBpbiB0aGUgQVg0NU1QIGRhdGFzaGVldC4KICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFu
ZGVzdGVjaC5jb20vd3AtY29udGVudC91cGxvYWRzL0FYNDVNUC0xQy1SZXYuLTUuMC4wLURhdGFz
aGVldC5wZGYKIAorICAgICAgICAjIE1JUFMKKyAgICAgICAgLSBjb25zdDogeG1pcHNleGVjdGwK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBNSVBTIGV4dGVuc2lvbiBm
b3IgZXhlY3V0aW9uIGNvbnRyb2wgYXMgZG9jdW1lbnRlZCBpbgorICAgICAgICAgICAgaHR0cHM6
Ly9taXBzLmNvbS93cC1jb250ZW50L3VwbG9hZHMvMjAyNS8wNi9QODcwMF9Qcm9ncmFtbWVyc19S
ZWZlcmVuY2VfTWFudWFsX1JldjEuODRfNS0zMS0yMDI1LnBkZgorCiAgICAgICAgICMgU2lGaXZl
CiAgICAgICAgIC0gY29uc3Q6IHhzZnZxbWFjY2RvZAogICAgICAgICAgIGRlc2NyaXB0aW9uOgoK
LS0gCjIuMzQuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
