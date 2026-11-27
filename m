Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EEF606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XpyvNa80;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w3fpMJJC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BSmSKAobI9f1buODOzRJy/2ImjvuagVH9/8O5r9vL0U=; b=XpyvNa80xujEYkOvxVqyS3uXnJ
	tJvG1FmO2FBV81XX/kl5r+ZCeq0ggCRxL651nmtvyJJ3fIFJ7M5BZPAsYd14frhrSIH7KFBrkJBlf
	EoaU+b86uPS5/reHTVeU4ekICU+d9MLGmrhnSlrdFr+knHOpkGMExsIFVai4vfNhqMcilYMZrP4XQ
	L4yAYLR2lyBINcBDozhTJPGUI0kb/HYjitFg+ieFAfBM1jpDvkNjWnlxuJ3GAtMrRYCEHbZhm5S4L
	HC630i9YVZfYLUK2E1e/B6TGKtDQhDpmZHqNbzJgNtJdBw/UrEJANyg1zQArqNIkrg2nb68s/+FiV
	1vhFgSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpFx-0000000F0sB-2Abb;
	Fri, 27 Nov 2026 06:16:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpFv-0000000F0rD-1BNn
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f06ff94acfso34583465ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760182; x=1796364982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kQ4FNw3OCJ6/ormQUi4fQ9yOioSJH7BH/0oAtcrFok=;
        b=w3fpMJJC6SZlyfcwKxE2AJqRdxcaou5JG2T+D9G76uO3rwDq5sju8rQ+dtz/YPAcYw
         szmBAXV1FwV+g4CKPtcEHekJTRGLlT2zLG8bPo8s0qv6bc31mZXIVW/KwNKDOqclbDyP
         eALyIOXEvT79nxcquLt6ZteuaEroNkbyBJ62QvswCgJj/VN0gSiB5q2NUGXxUkcnHGbh
         ainyN/bVPMRmjuyuGPsqafULK8BzHjfL4wqiIN3ljX7X3D4YykBDW7WwR9hCfrGjYjh0
         ADrllhL6uiTTjSf7RuTVewktUF/mutP4lsjpcrQgiW5G+sFi2FGFlHx4NvnSO6lGOOtD
         umpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760182; x=1796364982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kQ4FNw3OCJ6/ormQUi4fQ9yOioSJH7BH/0oAtcrFok=;
        b=MSYxs2nHsIko9rpeAuM1K5e2WmcWhLONvrFwMOEeLejkVXQZE7bheTF/UMBP7kin8u
         ix7FUGj/ELVrM9qGpU8mCnV99xmfUGIhxZUc9YIF8qqQoYlQTIYM1pbgFEzqOoaSkDW4
         Ik2x3B8HrSv853JN525sCyP3z1KfOfLUuD9m022pM1QZZe+wFlKsfS+L6Vpl2CJSpKy1
         quMve3ZbL3gHcz4bigitMp+3BHMT64F/uklKOHm3BMG/nDDhV4bjt75T9AjwxV6mWgPO
         96dZgPet2Qa7MkUHWhdibfxKD1Tw/izzQivEj0ZvCRRB5x0YiRFZzwbs8h/oS7oQbehI
         uq3Q==
X-Forwarded-Encrypted: i=1; AL+hErEBIu82JErg6j0xbUiHWCHuJd5WlRXPZHtsk7d6XaJ0yZ+CR/Wn0VX08mzYJtIuG0MrqgVpm1k2HU8SoQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+1gxHBszgRpeH5nbcMwtEv2YzYYZqK52nBRJ5aNo6VU189gZNX
	DITB57Ox3QRYF2MJueTR+fbg+jLtqFOp0kOmRsRAuHlvYXbpG+tWoWrC
X-Gm-Gg: AZFdTZdvBLgvXZST4+5zemlOffdaptkGy2V5mNV51GwPCf1V0mgCFY0pXG69QSLVLwy
	izWQKcc+YDz0Sp7aNPJbZyJ1c477FXMegD8evxFl0wXHlCI+01W3cKox+2QwJrjapYOMyDcTuI6
	WeWMc+u5qXkb7UOrKi54nwkmEv/vlKV1ykd2gdNZsaCWxBZjELOdqEI9u7msFhRH2LsiU3iTfSn
	a8ezItU6DrTHtacLhaS1FgmSatpkSXZCpl2wYHY7ZmGRxy3E+Jwa8OBo3GiyXRIHu6NNU3AZ6ZC
	GT4c3gSX6MlOoxFaMGZn+EXc0xCaeQdymk8hmo4qar58HiObJB9Ptke+nLxwWLeCwhp0veDGrA+
	no3NztSnV26M4xSZS5iXW4Xy5LrfSocUlEtnwS4UHkIW7OHvn6lvcgQTvGsmTyFLFtV3YvSIeMz
	WSs8Y8Oustm53d+S/WkuHnRyC10yF0lIxKBY1bxchbgr0PssV8hQNwG3xfIWGQW0h7MC4g1ns3N
	kcjywqaS7Xhv5oLQf0oA/kTUjMfZCczdEffjcjDmCsjAoRVRtiZsUDy617Mv/G3Qeq3NfdBXz6d
	pwUV+1v2bruq9LI8f/DpvDBM1uOzxWtAd3K7+E2vHA68Zn2oqyOTWX71kWVsuTUh1D+KPAvAAbQ
	Zhc5CrcUiY3e8WIvyTwbwfuXpgCFHn2NITHu7fch3kT4AHAm5houRhv6IMFwIYJY=
X-Received: by 2002:a17:903:2b0f:b0:2f0:3278:706 with SMTP id d9443c01a7336-2f03f181867mr210364255ad.54.1795760182204;
        Thu, 26 Nov 2026 22:16:22 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:21 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Fri, 27 Nov 2026 16:44:21 +1030
Message-ID: <20261127061432.17306-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221623_325388_A4D1E129 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: Pick up Conor's ack
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
