Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C39BC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Qtb5NfORfx+tOx2a+j/6H0/ozD24Zhv129hcTVUy30=; b=Fy5Hy3qvS+qudM
	HDIfTYTmD/3KdY3fHWrS0ZusoHg6TbFbwqjWjRgYfqVkkPP22rTw8L8M5TFQzaE0jel3LZzVKTObO
	X7pKnNZLqkAofjDo2fZB4Qkw8X/4uG78RdezmykG2ZUCHP/wtnyl9b6DsnPOlI76a7Nx4QySutrK8
	sBhLbT9uJLo4kS0j6JNR3Qq6CECXSiKiFJH4tNys3hlyBLDHNMv7SkTbq5q4S29aFfsg8Z+SnGfnQ
	nIn8ZN3j79z1yfrKQx9d21myI67FCOZrVYn7FaJ+fwHr8wqRXH12BvAGzg08HwY2lgxcLBynD7qol
	IzaqyaiHeAhO/MxQ6yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaId6-0000000FXF9-0Rmc;
	Fri, 11 Jul 2025 18:37:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIYp-0000000FWFK-0nm9
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 18:33:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-453643020bdso18565415e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258805; x=1752863605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ/08yx9KdEYvED/sNtpfI8PHIlJl7VHvIaa+wkBHBM=;
        b=1x0CLb1Ro1Pxbxr0/AXEuve1FIPmhk4CP6YlkOxMNQ+EG/EWNkMddsPWU67wpFkxgB
         Lgh1jlmLeJgkiSqgyJnqu1r8cb9TUx2SeWZcdnRGZKr5WyS8TCpNDsems83qoMvnpBaY
         O1chLvBRNUMQlxpAFN1SGi+UbFS+uht/IjsG8AHmgQP7Zl0UDhl0ygca4rt6iL/PvxC+
         NoO/mFCq7a6MEs0YTnNqhr5RRI/xbdWoorUb88XSVs0TyBImOZuBcjgl3Sp6pml1GjM/
         C+7nTJbs9WdNzN0dS2mRTznvEiR/theJX5FVb/QvVBeaXfRsDVjOcz+n4fhnauwFW4si
         4g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258805; x=1752863605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ/08yx9KdEYvED/sNtpfI8PHIlJl7VHvIaa+wkBHBM=;
        b=GbqmcrCfuOqp2Wv1H3UrT5ZuXrIOFpYQX00qOp4T+4tv713jWOgVOejUIRkCDZXswv
         ppRwnMyGUl2PN9wT/ciH7vwypGNC2qjP50juYTLrE46p4VQyL26x1BTcvmSw689T+49q
         i39s+IzQlKmi9K1FcG+jKYx/+Ds1gByub2mJbj3jKVqaJ8IzD9A7FGPQK9v/a8rioLpl
         qJbBnxyVQJwXdCTjHacXFoyQuOc5A7TDGRIwd/0S3awSuiJGbwT6VWG2RH9TywmtYrF0
         ArWVkuUGUgx8jBml+Oxmtp/wZXiVwU2Ls5l4XbqUhlgvYr+19nHU1KYtoC24HfoLYfnz
         7ibA==
X-Forwarded-Encrypted: i=1; AJvYcCWK7anb84Wwf/dUEBj3ngB0/V9dDOcwV4lruI8mSvgF19w+jBPJSdh1+RMlr1aZ4XZvR4hLYfUfx2CasQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA08VAzTtdIwKu3TY48kxeAFrnBFDmPJPBuD97pCS6wj1W3txE
	4c+eMux1MpTyQjbci07Hd5wDZaModUwU4NskC5aH7ODpe1KzGw/zsqsBt8oP2s5EDVY=
X-Gm-Gg: ASbGncst5D+Q79oxnjNzPVwzqxldD3dmxdKUE+YoV7AW+2TO+0fz5MOEVhA+nR0sXvt
	VufMEtmHYDAYlYfkfFExaA9UmaGTuxDTonJsMDxN/DTjPthrodWiE3Da7HKrgT3GXkSIdN1cagC
	jKvaSGuJ8+SxLI24Krqx3JhW86ofY61BYBj2URj9R+qqQkal8VxwNtBAn480jkVU2AB7Co80z+e
	N8s+RFjgQ0wb147MKKeJTwlUAJ3UgP0BSsuDNsutgp4ATXveOm2IjW0YDK0x7YHY+Xr2K8IbuLG
	ihi9S796ee8AXFDm9gkPYgmrpZ1DBCXHaUG7AljonFsSxXMoZKvef+jyJ6oBYwjs9ijs95ECv5D
	cPBhHu8S8qi3xefbj4gLxkSpbEhJsNxicZ+0G5bJTFRlCkdhOji5JWcqcDW57
X-Google-Smtp-Source: AGHT+IEvPbYDu3buwmTl0D0zspg4iHm2lPmeDh4bhM2691VW8eqw0kaZFk/7vW1I7JEp69ktUPgeng==
X-Received: by 2002:a05:600c:8b26:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-454fe0f93d6mr45409645e9.16.1752258805054;
        Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:24 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Fri, 11 Jul 2025 20:32:44 +0200
Message-ID: <20250711183245.256683-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113327_463209_F73FB8C0 
X-CRM114-Status: UNSURE (   7.68  )
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

Document the compatible string for the OrangePi RV2 board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
