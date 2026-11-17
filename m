Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB5606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QL7MrXKk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QSnHtf9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kIT+swH5oEYRL+689W/0QSzlxxAOMiu+yXJarQB/l94=; b=QL7MrXKkbxJ7Vc7tKHymb0Pl8P
	qLqhjLT5qcmzx6/txh24zR0MHd5S0dMLWhVnXUo9KYBDg8AV4Zr6kernI7vYdmmxxEMW3ZynwDQ/c
	py/TKE1fwBO3ThWgSUUer9LZlPFArxVK+ep0mOeutY8kb+1pn7OhKwVyRPz93n8r9GUPddwIYjbiR
	wt0bU0XkSAMbcZyCJvPmdOR1qv7ocqRt4w6xg28UzlejJi5PMfMbbS9GfW76iI7IksYp3a4JYRQOx
	u9EtPubl2gxCdifx21pInwvlVBpF8/aIwoQ+TjnILlxMKYZn52VMlT6wvDdm4uftPSHiP42Rl3NtI
	ZFLgRaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIkp-00000005lse-2ImN;
	Tue, 17 Nov 2026 12:57:43 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIkm-00000005lrt-3Drm
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:57:42 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-33fb4680717so11661228eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920260; x=1795525060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=QSnHtf9nXPZ/kOeK55tcDzLFxu1ddYpUeN5td/DkdmOb8Mg1Q0mMgaY0BPJxMfBgRT
         wMFx5ERkH/IYHdn1YmEWAg+oT+iAR7UmgCTC+JKHV4uTWpLfCfU1JWS/aDXFBqBnS09b
         YCJCgtCK2usZkeXXTzx3Op7jk7gcIsYs/CKaC9E6Fzff/TgqxbxUF0trfZFUEeZ9xVUK
         OFDbzsGvG0xzbZOysJW3eJU/suiaPtgt4Mvco2KTYcjwsPrafifYZkJwaQtuZpBv7G84
         EOCWSfhHeNTbs2SrV84BL6GUw1Tke/te0f8p7WQSUivT0u9D4ErUouIC5ky11qerIba3
         lMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920260; x=1795525060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=plIH7W90VaGAqEEy5GX7ZTu5KDUzoR0vOgFCbaJ8GoXNcivobeXOI8nJIWaW41/Xfe
         PK2migOKBe0HJL1YAIBdGcc1jpTEOxAjvRF2eO9yelq1QpW8C+kDtkg79P7rBn+t9RDo
         keV/AnZCu2lYwI7N3SlOqHoSMHl50oKhCofcdJXT9nz6TRIN43pPqfQWB8X9jyE5sS4u
         tW+zsmbnBcNQSAYc3l6bXWuUp4aT0aEiTK1j88FTeY+OyK8BX1bXQZMcyPtY/ucLLHiv
         svx6JAaimm2PUifKkri0SK1+tqsAPkyiykbs4AaUBgoQCWasnC04lERsMA0nBotrGVqV
         o8Hg==
X-Forwarded-Encrypted: i=1; AL+hErHuTT9/XRnD/u9OjS/H7d1nE6WLVT3mTEIoW/A+v7CKH1/Ehp4aCkxETfU1reyMtyp+K7zRWPQ2dudgcA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8dQLPN+fjYMyqBPP+lYklSWeucXFW363ymP+Y+zlPtrMOFw3CO
	BfJX/4DpxTGfnh5OAr42dafTxUtKIe1s6bFAPiScuXggLamY6Uv3WVyYrJo6kPsM6Ik=
X-Gm-Gg: AZFdTZdAeBKJkjUEiQS4qFyEVIpXxlc4cEFSXkSCNRhJU4WqETGbo0lAOaAMF/rtI/5
	JMKHTz+FwORk3dQqEDm3CzkwRpeI6vfwKKu9nviJXm+yP351kDtjwJGrye/mf8VkxPgbhYsQSDw
	GPAJgsNX8Ea+A/0ciu3G+wL6EKoGL+DKfLjXpxXvS1deW5JxUCBGqIm5zM8Br5E5n/4Mic+nHm6
	H+TMrSVa014yT2Y0H9unlRB9diZyAToVZJ1dU2Ub3D5VhTD+WMWpR3DxHnib9somVw8YakoIfdA
	4PpPLNwvldyhVeLi1zaF19/dx4DpKbq0EXCP56t/a65jb/7TcqDnse6eaOdri4yZRSwHXKXPyYX
	quYuo/K55sNimqrYCvjnsSsCOYUY/MWUO1lMZVkPqPLXoXvIlZ7VvodYX0jlxSD6fpnyYiKN1u9
	Fftbj/saom3hLOZt5hJgQIuOygklCA2yb9iEe2Mixe9a1q+qs2fm+ajA+96vJaTPrTUd4BiGB5O
	YW8ucd916FnGF/zkP/qLJNJ3Y/Fx//lmPxYp1QJRAcFquOOqZW1o1ReT+rHzkVFdXBhhMHLh8XZ
	ihjUMHhveiN/we//8OfMkOrJN/I7rRSKF6DwwZBS2EPTMNA/QD3riFBCmCIcBU/cfQhO
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr15512381eec.13.1794920259546;
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:13 -0300
Subject: [PATCH 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 CV1800B
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045740_814462_2498509F 
X-CRM114-Status: UNSURE (   9.76  )
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

The Sophgo CV1800B SoC has four PWM controller instances that are
derived from the controllers found on the SG2042 and SG2044 SoCs.

Add the "sophgo,cv1800b-pwm" compatible string and update the binding
title to cover all supported SoCs.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index e0e91aa237ec..11544b47c1b3 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo SG2042 PWM controller
+title: Sophgo SG2042/SG2044/CV1800B PWM controller
 
 maintainers:
   - Chen Wang <unicorn_wang@outlook.com>
@@ -18,6 +18,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - sophgo,cv1800b-pwm
       - sophgo,sg2042-pwm
       - sophgo,sg2044-pwm
 

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
