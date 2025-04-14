Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776F2C369BC
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH1cz8gpBFgFyb6Wcd7ZloceKLgBHD8IBXDEadptSMU=; b=Z1QqzY+29tIpIz
	IuqsM/+aEpMMarWb6KD8sxh6mbt+ZddISrYBBpXZPeIKokVHS4NvFSnKCDUTebGsyXyoZQ1lw52r8
	BHlbGdCgNDXj+jaCk8xzPFZHLvbhM//IhgMynDmsQM1sxugswF1z/6Fa8xucAI5PWwsNBi/po/h2B
	2a11ytFQOUAbFcCb8xPVtzxwjCRH+mm54dh5yZAIiOa6pNrREXfCUrx/6j74OkdPtYYXQbdyNVDuV
	DYP3nnhY7ymVV1Ry1hAb0m+z2yTLJh0R9E6/OdQkojHZa3hxsMq+QW7eUq4duqPBCdD2d/GwF5LpW
	bMfu/mIZab0g2sDI41WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PDD-00000003Euz-1TUi;
	Mon, 14 Apr 2025 19:11:19 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ovn-00000003Anh-2F0P
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 18:53:23 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250414185316euoutp02c7188871e103ec0790c4bcd61cb0f347~2RBzv72NC2800028000euoutp02P
	for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 18:53:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250414185316euoutp02c7188871e103ec0790c4bcd61cb0f347~2RBzv72NC2800028000euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744656796;
	bh=9Xrok5As/lWC4T0xEggLkNJNCkPrkQQkB+XZpVCdkNg=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ird3GKpxsaJWtYs6hjyFlQD9CnlHr6otjF9Ea+4uCvOEnXf1Lfn+ahMM6QjuOs/it
	 vvxSjvkswhXqFQ1Bl8CCN8tpBT4ioJjD04MkvpX8DiZarQnxCCQqKNaiQWOgi4ei66
	 1t7neqxMaolf9J4SqU/WufA9N+/8rEUB6beR9YUA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250414185315eucas1p105d47f8e5a3f792d8f2bc35ed2cd4b47~2RBy_w4yT3082430824eucas1p1V;
	Mon, 14 Apr 2025 18:53:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id A9.72.20397.B995DF76; Mon, 14
	Apr 2025 19:53:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948~2RByZGaGg3260832608eucas1p1r;
	Mon, 14 Apr 2025 18:53:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250414185315eusmtrp11413d5db60b821429d07d881fea9ae54~2RByYbZjx0705407054eusmtrp1f;
	Mon, 14 Apr 2025 18:53:15 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-37-67fd599bc614
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.64.19654.B995DF76; Mon, 14
	Apr 2025 19:53:15 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250414185314eusmtip293fbc8426478b1101594e33109ebef9e~2RBxS1QdY2643326433eusmtip2d;
	Mon, 14 Apr 2025 18:53:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 14 Apr 2025 20:52:56 +0200
Subject: [PATCH v2 2/4] dt-bindings: firmware: thead,th1520: Add resets for
 GPU clkgen
MIME-Version: 1.0
Message-Id: <20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com>
In-Reply-To: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,  Danilo Krummrich
	<dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,  Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,  m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH7/s8z56N0dazQe4rengt8aS7QKi7vqfGRRY+Z1epd16o12KH
	zw3ix7gNRIuuAYMYgRGI1pgNF7mFISeMAZM5jgOGQjvzx9CLLRKRSdnUAYWI1fZQ+d/r8/m8
	39/Pj/vycHE9GcPLzi9kVPnyXCnJJ2zDi+4XmvYuKza5mhPQyLgJQ9873Bj69dg9EhkH3Rzk
	u2zF0NX5AInOTF/iIr+jlEB39D4SXbEbSBSsHQTIFtSSqG3Qy0Xt80YMnbzfRaCWHjtAlbpT
	HOT1jRCoKqDB0Ym5Rhz91dfDRU2/O7nI+tsXHORqexdpnUeJV1fTjoVmgu7Ve7l0Te8YoDta
	dSQ94ekj6a8v7KJ//syF0Z0tn9DatmGM/nx5Ex04f42kj1hbAd05+hEd7IjdKdzH33qAyc0+
	yKgSUzL4WZ7lfqLgNHWoskzP0YB6QTWI4EHqJVgb7OZWAz5PTFkA1Fb4SDaYA9BQM84JqcRU
	EMDHusPVgBd2nJtBrMYMYGfTMsEGlRj8zt7MDRlIKhlOmo1hM0HFwYnTdiLEUVQ6rNWMhVlA
	ieCFr26FGafWwe67BpzNb4dXP3WAULMIioa9DbLQ+9HUEgdWlQ3joQCnTgA4YCsn2B2egUsN
	9vAUkGrkw8W5OzhbeB32/Tm1wlFw1mXlsrwWjjbUrJiVcLLrwYqmBPbWuFZ4C5xwPyRDU+BU
	PGy3J7LpVHi+7DqXvYQQXr8rYucXwnrbcZxNC2BVpZhVb4CNNbX/NXVbbBjLNJxyfkPWgWf1
	T1xC/8Ql9P/3bQZ4K5AwReo8BaN+MZ8pTlDL89RF+YqETGVeB/jn244+ds33AMvs/YQBgPHA
	AIA8XBot4G97qBALDsgPf8iolO+rinIZ9QBYwyOkEoHJWaEQUwp5IZPDMAWM6t8qxouI0WDm
	/g/Kt/Zf4WsTf3jn5pnkNxtei7S8fcqH7tHxvu64rt0V8aveku0UFpIw/RwZUyLbGOOum/LL
	bqSaG/NmSghqVc5Sik7T4pjMTjsiujQ7PW/VJGUEqrJKk89G9M2IA+liaU6xbu0bG9PSj7+S
	EuUdd49cXF16LO7RL+2p+08WbJ4uz5WZNUfLHsnRe66FQ4FI/9NnzT/dXDBtN325Aw7Fxiq3
	WG7vv2EURQvVokzZcztc9d96FzP9ptSL/jV7liS3RvbVefdsY5IMY0MG2axnHC9e34pXx6/b
	K/pRUr1BfM0ZOZSkzEzenPFU04PbBymiLnDZ87JnvXFO8ofQl/axlFBnyZOex1Vq+d9N/yjq
	JQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsVy+t/xe7qzI/+mG2y+w2Fx4voiJos1e88x
	Wbye9oHNYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxeDnrHpvF5V1z2Cw+9x5htNj2uYXN
	Yu2Ru+wW67/OZ7JY+HEri8WSHbsYLdo6l7Fa3L13gsWi430Ds8XcL1OZLf7v2cFuMfvdfnaL
	LW8mslocXxtu0bJ/CouDpMfebwtYPHbOusvu0bPzDKPHplWdbB53ru1h85h3MtDjfvdxJo/N
	S+o9WtYeY/Lo/2vg8X7fVTaPvi2rGD02n672+LxJLoAvSs+mKL+0JFUhI7+4xFYp2tDCSM/Q
	0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j2t8DLAWrBSrammaxNjBO4u1i5OCQEDCR
	2P3coouRi0NIYCmjxK3O6YxdjJxAcRmJa90vWSBsYYk/17rYQGwhgRYmiS9r/UFsNgEjiQfL
	57OC2CwCqhJ3Vu8CqxcWiJDobTgDZvMKCEqcnPmEBWQXs4CmxPpd+iBhZgF5ie1v5zBDlLhL
	XGnfywgx3l1i2oKvbCDlnAIeEjsnx4GcJiLQxCbxbftnNhCHWWAeo8SneROgbhOV+D15F8sE
	RsFZSNbNQlg3C8m6BYzMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQJTyLZjP7fsYFz56qPe
	IUYmDsZDjBIczEoivFzOv9KFeFMSK6tSi/Lji0pzUosPMZoCvTyRWUo0OR+YxPJK4g3NDEwN
	TcwsDUwtzYyVxHnZrpxPExJITyxJzU5NLUgtgulj4uCUamDybHzzXUSnNOba30esi7vbdmV0
	sfQG/jtueJ//VNr3nyuWTToeltnpdIPtSsXbT6Kq/aufu74SW1RyZd35vGObv7+9I6R9cvG5
	ZWmztDK+yMrELrtyR/eV/OFd1WdYVVNjviwreh608yln3ub49ASdN9wbd855YzjjhNV8HYai
	RLEFa49uEk5c9d/vudgn80ix9jl3OC7euWlk/KwmX+DZIy3mbVqsO995b7f3Vw/jetTHfJCl
	04hjevWrJREp5qmv90vp57OasCVeXKMqqS9+wObkvi0T2Hgjpmfwn6+zr4v+Hp0ZY8CZE6nJ
	1PRN75ZG6UFm0XVc+ZrJ6WcUzxfFLFCUixXQPHaO1S43dJ8SS3FGoqEWc1FxIgCk9c9rqgMA
	AA==
X-CMS-MailID: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
X-Msg-Generator: CA
X-RootMTR: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
	<CGME20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_115320_170754_1ABC2DEC 
X-CRM114-Status: GOOD (  11.93  )
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

Extend the TH1520 AON firmware bindings to describe the GPU clkgen reset
line, required for proper GPU clock and reset sequencing.

The T-HEAD TH1520 GPU requires coordinated management of two clocks
(core and sys) and two resets (GPU core reset and GPU clkgen
reset).  Only the clkgen reset is exposed at the AON level, to support
SoC-specific initialization handled through a generic PM domain. The GPU
core reset remains described in the GPU device node, as from the GPU
driver's perspective, there is only a single reset line [1].

This follows upstream maintainers' recommendations [2] to abstract
SoC specific details into the PM domain layer rather than exposing them
to drivers directly.

[1] - https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/
[2] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/firmware/thead,th1520-aon.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
index bbc183200400de7aadbb21fea21911f6f4227b09..6ea3029c222df9ba6ea7d423b92ba248cfb02cc0 100644
--- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -32,6 +32,13 @@ properties:
     items:
       - const: aon
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: gpu-clkgen
+
   "#power-domain-cells":
     const: 1
 
@@ -39,6 +46,8 @@ required:
   - compatible
   - mboxes
   - mbox-names
+  - resets
+  - reset-names
   - "#power-domain-cells"
 
 additionalProperties: false
@@ -49,5 +58,7 @@ examples:
         compatible = "thead,th1520-aon";
         mboxes = <&mbox_910t 1>;
         mbox-names = "aon";
+        resets = <&rst 0>;
+        reset-names = "gpu-clkgen";
         #power-domain-cells = <1>;
     };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
