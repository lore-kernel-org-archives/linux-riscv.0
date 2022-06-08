Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A443ECCA47A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rYM09KVkJCnx44cVAcc1rluNIhnYFrwkbYsKZxEPqLA=; b=Y8NayzN8KxBg2g
	p7lDZJfGr+uIhi3oD1iUkOXI2YhTq1pqh+ELQGjOXyahP9sXNuZ1dA1rLAb7v11T/fq9hknBuibEP
	oetZR1TUcRpEDZkZSQ+CvTIvA3ivGCDszlzf0ENW8GiVysJhAaJ38CfpJqiB6dSCcxo4Bmz6XZ4xm
	nJCM4/63Wd958UmUud3E1pHZomkvYcu9L5yhVTGCrV47uGm1wV5eiB0unaDU46fKVIR/lGUX4R8On
	qZaGV2y3Hxw/YHtcZX1I5oe0+otTQSD/8Kln4xYDPUuc5St6CeI3x+LOoWfPKw6IiFdYiyHukIRYH
	djqgnl6ztqHct7K/UA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5HG-00FGdg-BC; Wed, 08 Jun 2022 23:39:54 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5HC-00FGcq-Ro
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 23:39:52 +0000
Received: by mail-qt1-x834.google.com with SMTP id t21so9046568qtw.11
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qQ2RizqshOjzvB3iH/wwzC+NVOLya1wNYtoVU7GxDvM=;
        b=UAUcZUkiV3VZQTR71Swi9iSLP2iNUgDgdZHzGDfJ1q/EFyU2zOn3EEmie/e/d8eyrk
         BCOb4HzXqzi46EUby2v8egnyivPyJ7IOpkpbUgurwodmXHMd2jq472sLIjoalYSwQxJO
         4YxfrIRcr9xYU16fuugZ8uiVRNZdTkZQ5gpERziLKwu4cAfIa2ye+Iq/EB/Upc+nwD/b
         Qr8CG2/CjIe6vW19WYbiVvTvibQB/Nc9ON1c0nmBWGmLiB5d0N8DNXHJeZLE4sJmxDqx
         uOIBbgt+OPOL5bndMn27FUTwT/Qh0ZyJHEztS4IoOPqfcby1uaM4OWWT+HBGl4wCGOtN
         ReaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qQ2RizqshOjzvB3iH/wwzC+NVOLya1wNYtoVU7GxDvM=;
        b=BYTEUelCB1Ih3zLZI0AotvKDWVtBUWoZiXFFKGjSj+EQroD4/pXM5/0VRHS7GvV1F9
         Nwk93DtmGGdbDLAkur9yBVNYafS0cW0u/hDEFj3i6QULIFTco4bINaUG6OOiyUoUfmwg
         5sNSXtxzX1ti1NrNVEPKYi8Qhx50+DbvqOqq+CWBez7mHDgtIAfcpeBadLKHo0TXHiVf
         slf34D5j5P4wuAPMP7ORMuHipUuJVqTXypX0BOG8gm13B5nvQdmgLjemEgsDo6oaYbyV
         rp01cDflPM7hiduQWi/dvlXO3UNJw3Ir/vmqYAK4T+6rO3WlIPnbWgFIwj7zF67GYPif
         6LbA==
X-Gm-Message-State: AOAM533mGkacE9V3T072gOL6X4SR1E+Z0M70o2yc9ESX+mbC1GJsBUbl
	2ZeJUgURNHDCUjpPdZk7DmK3qs4Z/v4+QVqWnHabJw==
X-Google-Smtp-Source: ABdhPJwtH2lhtilN1G9Xw/rEf0VpiHf/XCVrIWgDPfCF0plfDp6bJ/WTYHxyxCYLxZFEeB0dzqn7AnVcRfYOD7c28rY=
X-Received: by 2002:a05:622a:5ce:b0:304:c37f:e7c5 with SMTP id
 d14-20020a05622a05ce00b00304c37fe7c5mr29342704qtb.398.1654731589495; Wed, 08
 Jun 2022 16:39:49 -0700 (PDT)
MIME-Version: 1.0
From: Atul Khare <atulkhare@rivosinc.com>
Date: Wed, 8 Jun 2022 16:39:39 -0700
Message-ID: <CABMhjYp4ChJ3KfP=jQmA5nnv7YB=Kkanjb2KwDEVWSS+Sn5m1g@mail.gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: sifive: add gpio-line-names
To: Palmer Dabbelt <palmer@rivosinc.com>, Atul Khare <atulkhare@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_163950_934108_FCEDBF42 
X-CRM114-Status: UNSURE (   7.25  )
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

Fixes device tree schema validation messages like 'gpio-line-names'
does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
sifive,gpio.yaml'.

The bindings were missing the gpio-line-names element, which was
causing the dt-schema checker to trip-up.

Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
---
Changes since v1 [1]: Rebased on latest version
[1]: https://tinyurl.com/yvdvmsjd
---
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index 939e31c48081..787ce7300118 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -47,6 +47,9 @@ properties:
     default: 16

   gpio-controller: true
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32

 required:
   - compatible
--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
