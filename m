Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D40C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKvMmHKqlJQv9wFJFM+y5hIAhNQgVTii813ClgaJSbg=; b=c/h51G+F9SUP1+
	GRBF4LWQF4Eb0Km7Zythg59mCpMjQZztIrbdqslG4OsHXCN5P6U3OETEhIwXxnDiqk1zM8srHjrT5
	vztNuP6MTVv4EPR8BuFXt/Gp1sNc8VmqCGWMCpJx/UtsUErP9i83I7Lx3d0T12+dPVKvDdvxZisfY
	/S+0SlgYTGS/7W7y6Ue2HDlDmauZ/VDEZJSvZ9uEcz1h4G7+uhKNzD5F+1YBql1DSukKXHqclGjpN
	suwlD7Vm/pKYhXK4wft2XDfJOjxDMoHG5Va6eF3ukHzK77GbP/hKIExjswh3d00+0s7vAkoh0PFH5
	3Q7lZ/TpQ5A5YaBErnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm76X-0000000916S-1MmA;
	Tue, 21 Jul 2026 09:49:37 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm76U-0000000914k-2ZOB
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 09:49:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=To+PeiUG1xpdz90ubRrVLr6OYAbpZVaZf3etlt4FW6o=;
	b=nHkbTD2y4qxyLqzmCsPzQKVkVxQH8OooIcqvjSmfpd7sPykTdb2nkNPjavfMmP6oKqKOB5
	t5XdXzIdARhkRiVek8gW7rXFQ4RwYq/FkTbrrGsjQ29HNxSty84QhA25KfK8CYpNxYAKKN
	FUjrnEH8uP4yitH+skso+ks8vshMDrc=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:29 -0700
Subject: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
MIME-Version: 1.0
Message-Id: <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=7P27P6ju6I4cnl3ul9wP1C3dtnMbhkQQdst2PiSJx64=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDkW/LVOnezR3rU9KvbKyaqqC0b9PtUtOWe75IBnye
 79yQGVHRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESeKTL8r1zSvyLAcU53Ue1b
 CSFG7mgv5cMbvM0m9Ncb9lzfsPNqFMN/zxrbBedyxPlCH3NtfaHHNkd1gUVGnOPpwIPLJzSdVVN
 lAgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_024934_803273_86CFB425 
X-CRM114-Status: UNSURE (   8.33  )
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

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index 92b0094ff303..4a1ffebfdbef 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
