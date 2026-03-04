Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DBEDEC12
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvTdkZtA5/dmF5qoc/ynP2fveLUarolpj9bP2ycJlrI=; b=DgMkLKE960YUjJ
	8zSd1yxNbtrW1NiW6nL2Vk9jdZzSbJyf7KbA0ebAFXqYxm5sk6fBu63tG89iheNtu6YDrJmxRYTIB
	aV1Yl+h2uRgyTAq/xnI7ifKkX4Vp6KcXjQNT+/yI80lc2exdD5usonTMI3aoAcINxXRXpFh0hf7c7
	BoJDsRVszoM/mmTqTeZ7tBI5uelJCTw057i5E9SL7c/AUG/zLavVsTMgLlWIMsMykxyspmG+sKNyh
	hvzxyZ3ICqcmbtkvBjMI+qZ189ALtFyyXGY3AwSJWt4ezIVD290KOpLdMtJ5t0mEamaR+WrV3bL+m
	k58ik8Fn1uD4Saj3V2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgWQ-0000000GaG6-1S8O;
	Wed, 04 Mar 2026 07:19:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgWN-0000000GaFo-33zM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 07:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C5743B56;
	Wed,  4 Mar 2026 07:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94209C19423;
	Wed,  4 Mar 2026 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772608790;
	bh=4KgE52dPbV2gpFs6aV7KA/62JEm9ltLn1ws2XcJrOx0=;
	h=From:Date:Subject:To:Cc:From;
	b=sj9/H7hvP2BZf6uYdbl2QPhcIeyhJSKZbtMDLBtw6OqZzR1mghPPLUUOAim9zL3Vk
	 C+zeUUwnz7NotcDmn4Q5s9QjrPtY8TVW0D+e6YUM4D0oGmvZLNlEqKojl5DLtehzom
	 jsKQ3nZ/SOwVyCd3BzSMSQY5fL/tAy1eLoJF255S8piB/F7NLR/mKzx7ZfmqjxQQ2w
	 F5ZyNwl8s4R5BN+gSqyHdfNoER/fSJ/pl2QNBelLcWND8oTfCP6P7FfSnoYXCV2oh/
	 f6uhravbUNyFqE5lmTTOV6Dxk3JKj/KoQH6ZzZbbPkT6HMG8bsaDW4oNkuq+SRG/MI
	 h3inKHxK9PWaw==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 04 Mar 2026 07:19:39 +0000
Subject: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAArdp2kC/x3MTQ5AMBBA4avIrE3SHyxcRSwmNZigpEUkjbtrL
 L/FewkiB+EIbZEg8C1Rdp+hywLcTH5ilCEbjDKNsqpCpfGicKJbd7egp40j1rWuGqutGYggl0f
 gUZ7/2vXv+wEJDhPGZQAAAA==
X-Change-ID: 20260304-01-uart-clock-names-551463132daa
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=dlan@kernel.org;
 h=from:subject:message-id; bh=4KgE52dPbV2gpFs6aV7KA/62JEm9ltLn1ws2XcJrOx0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp90OSzQi7nGsdg9K58aE5UjVtEEL8S327ubuC
 npFkrjCvC+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafdDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3vrg//U3TtCvsfKSLVsD4OichzNLJtLFG4hQOnMYqDvayoPwLcQQaJcW8SP
 X65d2XRLofzH22yepa65GW4ILkEoVe94PHW6Cvg3lfyyfQj42uxRn7P8YcLceRX8g5OrpFFX+Ii
 uL4Kbo38hj3TN2H5NNsIQCYLPAbAiwzg1C+oe/FpfPj/2Z1UC88CxnY+ilvae+fN2iQhR3R6lr9
 RgTyZwfa1Cn2s0fyg28kfSxrioYpl/lSukjdEMbXOeWEhDYs9qzi+DRpaIWQ2tX4KIlomDeDZds
 50iFQfiEVX85z9BF5cVZzz4AqFUXn7k4LcW/G+cnu5e7op07Uv1gsNe6rg5bfPjUmIwatz/OqNu
 IfLbdiGaD/Tt/4FXh4yK/8XTCi6a2bTeOGzAAbPDX58+zIZBfEE1CD2o40xkW+jb3n8H62c6U1b
 aZijE7swdRkBO65TcnHoSSTPhkJ7gxkb5ggtHC4NVeYNvceHSKwQqLluNnM7yftxFZewclqQmFV
 kTNtZXQQdwmPVFO49PtSBdEVzgAptapdSO5S8jfaORCd6IIMNUAsYc9aicqNMOsjxUeeEttcWPV
 LT5m2gv8uii6x3mHfk508MeJOlvRb1i8mZ6UpBi21j77grIiRtgZQ29Vfy1ck5mnFa+42drefzv
 vKeLOcKSuBcc9M/mD2WXHa9fbCa3Kg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_231951_810259_67E4C128 
X-CRM114-Status: UNSURE (   8.83  )
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

The UART of SpacemiT K3 SoC has same clock property as K1 generation which
request two clock sources, fix the binding otherwise will get DT check
warnings.

Fixes: b5024e804ee0 ("dt-bindings: serial: 8250: add SpacemiT K3 UART compatible")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 73851f19330d..e9e07c2356bc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -63,7 +63,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-uart
+            enum:
+              - spacemit,k1-uart
+              - spacemit,k3-uart
     then:
       properties:
         clock-names:
@@ -76,6 +78,7 @@ allOf:
           contains:
             enum:
               - spacemit,k1-uart
+              - spacemit,k3-uart
               - nxp,lpc1850-uart
     then:
       required:

---
base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
change-id: 20260304-01-uart-clock-names-551463132daa

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
