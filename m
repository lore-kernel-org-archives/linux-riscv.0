Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA94C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NM+k1ZmnHFWDsQA0lTGPyNJ0XwwHMsTmQbWWjqAuuTI=; b=cdy5aLvjy7rvot
	yoJiVXF/gdZz7LaukiNVR9t+/4/WjRLat8xAhYBylC7+jPxu/0W7TykrWUcvTUCGgN0jvshTuvmLy
	0EYIyvgZ+DhkQXBiHNZmMGrhBKXO2wzuXgwERdCqWL7r0A1c6XeF7Cu/XN/Kk6dEN+AJwJ3AdMR16
	wTndANk86eVNjBkIURWeTCJzbBqEzv5ls2Q+80C3+emBqhTKSCo7W4JfsLbaVjBC6T2tBk7fnX7BS
	4dFUgbh5+Mu23c8nGv2elqzssS5s1yPKwo5XIfln/2b4Qg84EcWshjSf8r6xxaQ8Srueyy17DJkru
	QpxX5B4RKRr+glA8DOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5H8-00FGcQ-S4; Wed, 08 Jun 2022 23:39:46 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz5H5-00FGbk-LO
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 23:39:45 +0000
Received: by mail-qk1-x735.google.com with SMTP id 68so8230486qkk.9
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 16:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4bA3l8NMW5sqINO1r/1lERkOkDyuT51+2Y6gy5uYSqQ=;
        b=mXaDkRe8akpJUduhvftHXEgn4sTGP0eEV2OaV+blJVeqoLJU1FEsR+FaDtaokIeTFo
         2lK9ZQ4Btqss0RkOkxW3x432KfPG90WprbHJVWggfQXq/JRB2Eq9KakDyq54PxapLUsb
         hc6YdA++zF2yvpOYXxd4kGmXlP5tGj74azeYSpCXzSP0+1Vit7dY6IoOTH7fSQqlIj1s
         yee9YeuMp2V1s6EzXiZugIO5erzHwONKUBaKeFuAOfghBQjn4RHqP8EMP8KRQjpuqLhj
         j/JyfzkL+nHfEYgjqoadJF0gmOwtxWmOPdx8NHbKw5rZr5qqyAIjW29A8Wlv2ZY5Mo2g
         8Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4bA3l8NMW5sqINO1r/1lERkOkDyuT51+2Y6gy5uYSqQ=;
        b=uoJOctbK59UtX6BTTZmPuXt9xWLi91e2NaCRdPCg+LqihXQCSHNar3A5fiWg8N/fjT
         XGsqyycFBsOkC+WkFghhXSrBakIIBI8/9rVw4wWRLUoqulYPIlxZo+OV32X9auojPtAI
         efWhDayk1i9yYU+0HvWbsYRY3/uRu1H8l6jeo7+SxlmVqVOjB0fYkEQW12C8Ujg0IV8N
         6T4OLHY2rmkFgrSeAJpMqxeCWKPlic4Va/GBWWKOb2+B07WNg8tqXD88oYk1enYVOdZw
         +ez5Cd3AieW3ICWR1WQJd6Oc8ZhCF8jYB2e+3jZxT9Q4EHeCItuKUXdMS3ygoeBkfv9z
         4Jew==
X-Gm-Message-State: AOAM5326TKl6Xr+yz6dpZfsO5bSz3bnkN9vbeT+Wyp4QJVl3G1ex5Mzv
	aJovXmkT0VBPjIePp8QDTe8UMvzGec0ud1+m0tLmBg==
X-Google-Smtp-Source: ABdhPJwxVJsLtov+PvfiuEXEacNmD+Ogc8ArgM4bwUX+jOqXRNefAAAkqXzWVsoVgFJ+AB4KhEa/eKHzBy+/FzxL2p0=
X-Received: by 2002:a37:9b09:0:b0:6a6:b23e:8534 with SMTP id
 d9-20020a379b09000000b006a6b23e8534mr14825420qke.214.1654731582051; Wed, 08
 Jun 2022 16:39:42 -0700 (PDT)
MIME-Version: 1.0
From: Atul Khare <atulkhare@rivosinc.com>
Date: Wed, 8 Jun 2022 16:39:31 -0700
Message-ID: <CABMhjYq8WbHcA=8dRxHVy=-NhL3+GaRKsBb3X2bG2-6Azd2S1g@mail.gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: sifive: add cache-set value of 2048
To: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Atul Khare <atulkhare@rivosinc.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_163943_738331_5BA1698E 
X-CRM114-Status: UNSURE (   9.66  )
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

Fixes Running device tree schema validation error messages like
'... cache-sets:0:0: 1024 was expected'.

The existing bindings had a single enumerated value of 1024, which
trips up the dt-schema checks. The ISA permits any arbitrary power
of two for the cache-sets value, but we decided to add the single
additional value of 2048 because we couldn't spot an obvious way
to express the constraint in the schema.

Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
---
Changes since v1 [1]: Rebased on latest version
[1]: https://tinyurl.com/yvdvmsjd
---
---
 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index e2d330bd4608..309517b78e84 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -46,7 +46,9 @@ properties:
     const: 2

   cache-sets:
-    const: 1024
+    # Note: Technically this can be any power of 2, but we didn't see
an obvious way
+    # to express the constraint in Yaml
+    enum: [1024, 2048]

   cache-size:
     const: 2097152
--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
