Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21C6076B92
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rnUgo7W3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kuGQ+OYV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fqrv1dX+5yOJU/4s9jWG4QF67cSMKcN1+n7PipeLYic=; b=rnUgo7W3UFd3vaVu98rSVbaOo8
	6D2cU5Y9/cnkNCXntpmwp/EH3VC68aeq1hc0T/Py6Q2oqSU/G+Hg0ae+2i6YfPSGzbCBe3111PfSv
	IzCpcg3kVhTKoS/fLgt5Gq+NS+2IAov1zgrtXHQJcYd2Tg+u6MDs6iuNtN9q7oTlsrfwPgs2c3UlE
	4e2bejk2jnhRBOCaNFYO/mhg/nEu6pHVpMxCe5XCJikY5s5g/vMlOZvlHYasyzOEcruToMYefhGtI
	TzKTPx7sAOslJqmvsGq3G500XGHSnhv62BVuEljPdvCsToeWC6IYwbRqA6+hIYg/mU/r8y5aMQjuA
	0yHaY31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1d-00000001Zxo-2fJf;
	Tue, 03 Nov 2026 08:37:49 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1U-00000001ZrS-1lq6
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695045;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kuGQ+OYVYZYKS/yecfpVmiR8QUZOJs3BniCprObj3Tbq3v/66xMTpS2GNZDnpw9/R
	 0+l53KHroxswqBp5praQbmbWxUmYDQlM3+4anV541sBPhy5QlRBx2rPMCpU5WjcISh
	 /RfuxhlS2CbH2SMy8QTk8DcZyNiqE0caA2qC6VRE=
X-QQ-mid: zesmtpgz7t1793695044t51b83d38
X-QQ-Originating-IP: MqKM/sJkuvDY17zuAK1CItbTzJpswIk3WyxUZSB12UA=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2555415276138771105
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:50 +0000
Subject: [PATCH 5/5] MAINTAINERS: Add entry for SpacemiT timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-spacemit-soc-timer-v1-5-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yr3pDuqGN7hk550Kajk6Iynx+UOXk10yC3xFuL/9
 rTBf4dSRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwES87zP89+oymXkx5N66JA1e
 Q567JXZHe67Y7/m/gC1i1RqH6yosgowM/8x8b/6Z8t5P7Hqccf3q289CLrGeNPvdaWuW1ui8Oje
 BCwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbGAPuuY7aUIQbOFRQnfzKgpf0YNY30SZZn732AElhYAcRo2NN2Z0OET
	vptVEaN4QWcANE0zRqpzIo1BkkIkUufbEpf9juamQpT3/SH+8CpbwujbXlgw5+6CyDhnbx7
	RrDT9M8mFR/KccP5cE3EaKE7zD0cMWj/fhTY6Febe74ZO6Iejz8H3e3oAinSTp7Re30VbEl
	oj/Sp6j/ZqP99uW4zMvl7tiGyEswwXKrnmOKYvfCtzz3jGhuDbSYXPtgqbLlFphG2WH6j8j
	43+b7V0ZHqa0rZ6410fkVRDn6QDhbO46RYk06+2TCePFjouo0DvxF6JJtoOfPL7zxdfBKAT
	nbs8T8ZQOnOotyPshIRG51lgxL8gTuiE6su7pWWx+iyVuux7PDVDIaDV7OI2ge4T8KAXaru
	MkhqxlQpWKNwnGgKUcF7VqBxCEKx2Fmoi5H+avKLKUysm/EErNpY2MqaxtjXb5adZYxvIai
	KxQ/rOh389XX3S9O30gFaXIg18AQJcE/jG1FyWepmNkpAi+qrrh7iEmqOFW2efs/Vnsl4RE
	+G3Cqane2FFENc2gsWFC0f4CnGtddS1riJTASBVXfg1EqNJmrUyFWp6VM6qMn1zakXU9hAk
	axgd97i+wtIbRubOynb6zigeUNa394shd3OZTYnVVv7on0UMGuTtguSpc+gxjQNYXdRr847
	gS2gKx7BtuONbeaCaWNsNV2igt/C3Muy7X8SY/T3sOC5CdWmypIC/9meQYALC0DRl/3qeDD
	bFQtfXE04SvNbp8fR4ZkSauV8CRrli7fIzGKD4ZgiDu+D3PacblSUENk6p3JiOMSByocImu
	9oMg6yOurMYWEDIjl4FNFZ7389CL9B5rpjs7yqmi64KMJPY0TBdXsbA0YsIxLvmmkqFAS2V
	LEmd8GQ/gluGBSNB1giOHgj4CXpkJGniR11LLIXTNtWqJzH8uGF1OOmMKXCgMTNlQMQM0XD
	6MlzmoohgQ+5EAwQoNZxiN0mMMysx7gzaDgOvaibVI2zBWHqhwLK2g6TO1CRc3XTzSzivxO
	EJByhIDTkCyj9RTvJCIgIRIMS9pQQR4dkCw9Ej/gpAeCECHqj3iOecl0GacEQLcZjl81WZT
	1jlMxjB/ByXHlQcW/mC1Q6cIlHa9SXE934nSYdyiUXEy62WSMKDsFqafEk+1YsW6OADOmrO
	Ztz6eMD/nl4p0ErS9l5Ylt8nsA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003741_872952_9639AA54 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
