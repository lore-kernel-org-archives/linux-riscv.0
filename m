Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4EC63706
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3X/FAYanF4r+dIRGwQzoWJ87tIEqc9yhZDnuYSKqrg=; b=iDnM1baH/S6pUk
	BdXdSShF78H4Mhhz0u28MtrS+aJCt02uNeYpo12g4T+zTwOfunGer4p4pzfCv8QsL9ACentBF3DSo
	C/uI88sELt0NFKCbTqwaQlnRXI1x3qADjJ5ejzlv/O4SSo+t44F13X0jktypJuRimv2B70am2h/Am
	+LDcSBcG2qtScRNwZzIz/WtEbpXLk9ZMXu1h3RoEtY81qBCeWsSwYhBv4T5JyRv2lDN2Q/j6HClfX
	oN5BNwkfwHpefNTSkL5ARRbWw7P7pTb0osks6bJSW3UqoX+yrtfYZdWLbsETcY/nVrvWZd2lvRYIW
	IuGyGRMI9RoBwtbDniXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsT-008KxT-Kh; Wed, 07 Dec 2022 02:09:41 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsN-008KlN-Jv
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:09:38 +0000
Received: by mail-pg1-x536.google.com with SMTP id f9so14995006pgf.7
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 18:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef1R0DZLGLgvPQftDCogRjFOt3was1MePP5Kuqj6YFo=;
        b=JEyPdSQt52MKPDXEy3+QuNJS+afCNAxSSc9nqgfvjiPWW1tPskCxCQ3tfEoPsJ8Tr6
         mWmJtQfEQmDusNyQlvatFwDEoQcxVxOa7fvSMrOLNGRcIVCxbtba2L7jAcQ2DTOYla4Y
         cR692cX2gZZoF6caDbfk5onlBUy9YqcTn3IY/ttkiy28elSDagdqS1pkjfX1Y8xr2Zi9
         wBsKVLTKr9yYqGkwVep0aMg7JRXd17S4i3to+7sIJpS1jTCD1Pkt+4YzgUcAhAx36AMv
         yKG+aaHt8pi7WGNiw6QjyS9URAb+6D0Z/0VggComz4719XgZNxIFL7KCWB0Mkjf6+9m2
         5M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef1R0DZLGLgvPQftDCogRjFOt3was1MePP5Kuqj6YFo=;
        b=cR+Ev+JOGUHLZakfVH0/rnWkJYy+wVG28lvAAp1Dm7zfC0tJZfvk4xx+RhCpbJRs+0
         zS7NDbJk+dCANk6/HEl8zmMg/VIX37XJz8NQecOk24oq/ESSEZxsdpjlFPgB1p+5rSRD
         BI690oyb/LOdzqKKaplCUraG72L2tLJVEsKuw4cmEF7jTO11DWwGkJBC9yqSvpWL2i+R
         0Pia1ezRJlKeeVOtP346DBDDHNQtJc3nOMX8TyDfszKfoGwzfxvQZj9UD/DA6SeAqVCr
         KcvegsUj/m8Wh204an6bjyDPwmo8TtegqmKEbNisISaD+SRGrDdDbMPdX+ro8Hjc3Wlr
         ZkLQ==
X-Gm-Message-State: ANoB5pmY3HiPmPF54FNrHgvY2sIWMYnd4QM00z1CcPkmn/ohvMYpOcS/
	N3VEhSLwBbycqGD3WRwMkk3mm0ETtwvEqtHs
X-Google-Smtp-Source: AA0mqf4Yahk1ZW7tdJ0z5FcBtUqO/6crrbhY7XqyCnNEW/ZE/Pmkyvn/omIThCzyk0HhkkFY/wcFKw==
X-Received: by 2002:a05:6a00:3204:b0:574:31bb:a576 with SMTP id bm4-20020a056a00320400b0057431bba576mr67880693pfb.46.1670378974386;
        Tue, 06 Dec 2022 18:09:34 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id g5-20020a63e605000000b004785c24ffb4sm10410144pgh.26.2022.12.06.18.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:09:34 -0800 (PST)
Subject: [PATCH v3 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
Date: Tue,  6 Dec 2022 18:08:13 -0800
Message-Id: <20221207020815.16214-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180935_710883_7B332CC4 
X-CRM114-Status: GOOD (  12.89  )
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

The patch acceptance policy forbids accepting support for non-standard
behavior.  This policy was written in order to both steer implementers
towards the standards and to avoid coupling the upstream kernel too
tightly to vendor-specific features.  Those were good goals, but in
practice the policy just isn't working: every RISC-V system we have
needs vendor-specific behavior in the kernel and we end up taking that
support which violates the policy.  That's confusing for contributors,
which is the main reason we have a written policy in the first place.

So let's just start taking code for vendor-defined behavior.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Link: https://lore.kernel.org/all/alpine.DEB.2.21.999.2211181027590.4480@utopia.booyaka.com/
[Palmer: merge in Paul's suggestions]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 5da6f9b273d6..16b90a31d267 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -29,7 +29,11 @@ their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
-RISC-V extensions, we'll only accept patches for extensions that
-have been officially frozen or ratified by the RISC-V Foundation.
-(Implementors, may, of course, maintain their own Linux kernel trees
-containing code for any custom extensions that they wish.)
+RISC-V extensions, we'll only consider patches for extensions that either:
+
+- Have been officially frozen or ratified by the RISC-V Foundation, or
+- Have been implemented in hardware that is either widely available, per
+  standard Linux practice.
+
+(Implementors, may, of course, maintain their own Linux kernel trees containing
+code for any custom extensions that they wish.)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
