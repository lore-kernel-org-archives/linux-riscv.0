Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60133EDEC1E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YWDCIqQgFHl80qtCo24LV5K9y+wBVjAqu2/2CWc8Ms=; b=vIDLM9hM3B6EUx
	qBt0DLV+I/p3EqZ4IKQeija34OJeJhNCCoES3jfXSvj+WUa1Wf1oefiHCcw5wAmUqj2YDAXx8KBlP
	zZTSMGd1W3A58kysHCyNJzv/DOjD592o5SzXNMqCxnrpatd/Vstpv1XwOoUfwI7HrDK0wBOkxHPCq
	rq4tF8hJUCwFJUTaqbwku2wCJetUJxdI3048JHib8t3tky1B4T2po0JLdUmnob/d1Q55D/oDMC9cv
	qtWlG2gnHeB1Q6/WeFnpiwvLoX48FnjT/Ga2ePtOMOJ2FJMQak3SLgKV8AjAjBkgadnqlRH4/KmRq
	uGSnQP7HkI1kPnNLt2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnN-0000000GcN4-0qH4;
	Wed, 04 Mar 2026 07:37:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnK-0000000GcME-3PzQ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 07:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C0B344407;
	Wed,  4 Mar 2026 07:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC1FC2BCAF;
	Wed,  4 Mar 2026 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609842;
	bh=azbr6K57fTqAAumzaPXw5TukZtFjPtItwS5yh3shQsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X1dDJcjj6uuRg3UYUVo486JNbOEhGjz9ohQeZxawZoMXa1fvw0iRwlj828Fw801tz
	 8QCFsoZ0OGQLY2vhWKa+zaTK1pv/pzAS+fYAgGkB9Efdeaj+C+Elwdl+89nSjzZ0Wj
	 Rck6m+A7vGGpKcrmV/TPNkikgjQLKa5Tc17LdMeSRVvrOsrKKGdh9NpdDriVSwPcfW
	 1RpBWhzWGsBdguB+m58L1ONCS/4sa2LAWYcgce6b95jf0FyXg/3GXApbZA0hikh61h
	 /IxeCJ1LQcOpyC7Zh6VdHs4aaW3apLfHQExEYUigl/uDFaqTz+3QDmv/H3/51ETK3b
	 qw+sYkD/+6xoQ==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 04 Mar 2026 07:36:43 +0000
Subject: [PATCH 2/4] riscv: dts: spacemit: k3: add pinctrl support
MIME-Version: 1.0
Message-Id: <20260304-01-dts-uart-full-v1-2-50a0aa53a245@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
In-Reply-To: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=dlan@kernel.org;
 h=from:subject:message-id; bh=azbr6K57fTqAAumzaPXw5TukZtFjPtItwS5yh3shQsI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+Ed0j7KxYg5TRh3MeN8b6VSOKQTUJkEfgM+b
 PotX3Co5jiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhHRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1blg/9F7olxaBFWs+VLjqqZXYjbxlga5Jb3wivuArss8iw20X3VsbWGokfi
 iRs8gXQs7627RQZIj6mpT8v1YVsd0EzpVWY4lsgMNoZKSBgGyPLrv/oso4Qrki+m0d8RvoXBGJ5
 YUmLWrvEDgJekEZfkii482jL3Zl1ZYQzvq65I5h44Phy75hp6Y56XndWWhHd0jHH4SYynP2ntOv
 QDCd4JQf3DVrfpZdNQ99UjQO5ITlfxgaA0sA9liTYJ0yGF0nUyodSF/8fFPSEIFf3Z7DhNx3QnK
 cqK2YDq/U4l8c5uRiuYdY/X75/CEIult2qkAwPHbX1aZaoDbpUjQVVPtiYKk5+iHSrL+DBe7Ajo
 ++ZYax7RtdCoY0v6BYliGQxfs8TLHsGLYY7cfOpj5Qsb2BbDeDT3zPQ48bccPppBZKvTqOHWWB6
 M8CjWe1KoMZXrIEEYiFzifS81o2Qlxlz7YdrChv1S/OfQFS6tBmdUw8xen9vYqUK1ZS3sx2Nn1c
 3CtDMJI6ZI3fQprDn8XwJhK1Nr//zVlXK+3QnBN4eHQUVKINjbq9XRqGRHc665iWxUK7BdIaAmi
 Sh4E3DLREF6Q6pIyiR8SQyxu0tKcXG1FgkC+jxLOuGgRoZM/8bByNwV5dYRVEX2NVfBieihoLTJ
 MyXQGsNonITWTQMBQZbUPgairTkzh8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_233722_891888_597FF40D 
X-CRM114-Status: UNSURE (   7.47  )
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

Populate pinctrl node in Device Tree for SpacemiT K3 SoC, So devices
can request pinctrl resource properly.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e3d7f3102fd5..6449ab056293 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -536,6 +536,14 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@d401e000 {
+			compatible = "spacemit,k3-pinctrl";
+			reg = <0x0 0xd401e000 0x0 0x1000>;
+			clocks = <&syscon_apbc CLK_APBC_AIB>,
+				 <&syscon_apbc CLK_APBC_AIB_BUS>;
+			clock-names = "func", "bus";
+		};
+
 		uart10: serial@d401f000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd401f000 0x0 0x100>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
