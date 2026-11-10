Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED6606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=be/++HbZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u/OQ76xZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ug8UsbEQaEPh0RFvXUn5KD+QlgOUMe3yCmFbfBg3YzU=; b=be/++HbZj6lmqXdKsnfDr3Mxm5
	CRb8EeEAsTfN7S7qk9eYyAcNEI7pCpwavIaZFbgsDjq+qt8PytwgYkGxQ0w7GnOQfv/nxjPMsL7rL
	UY0ohk0YR5P5RV7afRI2BkLDMIq/Ew//IdGkUOuZIXQCBQKhwjgV0mZdwFt62MGoy9eKPzpIy1PXK
	sJPUHZ0fkQ3qHpv1/HhoFEFfrE2N7K9yJWCLHjzWFHPnxroN5W8Qy7srj55BLyAsq+wf1akcFip7T
	HJyI/cv1QHrZa6mBBOTsxIfBvwF3Synks5gBc5DV0yzXwCsPIHi/lkLN5VLax2PWrNf5VClE52vRk
	HSLiH2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwf-00000002joz-1B2l;
	Tue, 10 Nov 2026 07:07:05 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwc-00000002jnc-39Ci
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:07:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso685053a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294422; x=1794899222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=u/OQ76xZAIcg6WFPB283Y4Rko4IY0v6K9vtlnLWzhW0ytDn6TLOsISlj448grbIq8j
         /Dv9G0GASR/n72pOas2axtR6CUDSbYAqIf9I3ATXdbn2rVROPZVBscT7UXFNbeWoG8cq
         D7J+ms75FAQDIU9cao9uM/TK/zZOhFr0sA68CYrd/SImgRWufYN4e7c7fXgCcurnSpaC
         ZZZ/wqQvXyMPMRVGZlNTbPx2aoicqydbhlPH9giGI23LVJtayARmEFyJ9HbQlDSaMOQM
         IlwVW0SJyWzrG0A+2XNUb00CArCyML9h+D3RMod1c6k+gJLe/ByXk6M3TCw2MvEeMdf2
         PCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294422; x=1794899222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=emWZWIEYCbYvyiRIi97NcBjs1lWKGceKaPAqqT1AfhpHsjywZ7LIENrPCY7Ja8Vdg1
         MM/hasAIxsS/+xEcKWwjCmyMIITGCH7wSg5a2o13X1xfA8mAt6j1FfXYMULMrv9ikz/S
         3+2trAj8pAa4fXUXp8XeeOENIsBJzYqNntzwBcTw4VBMg/g3Kl2oBe9j2U598+RHxzcn
         H9zM8JlE95G4R2AiKXpU3YfCx+ycu/UOSRoJmXjMRWjLY5hPXV7xKL6L3aHfgsL9ell+
         fZ7XT1cfrRLumz9uz8w1Vohk3MdC6ld8MlyiLx4Cg+8/bIhn+0SGQ7Amg9euGcBakjLX
         VbJg==
X-Forwarded-Encrypted: i=1; AL+hErEmkIRSJ0SVN1BG+k99F2zBy8H4fjsN2CPAoHauKHjhP91SVovXBmN1F0f1EmyguX8EVU4/BO6Qtoz31w==@lists.infradead.org
X-Gm-Message-State: APuU4Z93U/xz7S/a1UiQjb4M0X+orDPHmuF6B9WQb5GSF8VLO9w3Ct/1
	Qic4X43AwEVSmlFftbGYdyyeT5fIcl5BsVD3cS3iZpIF6sJGnKZYOfOW
X-Gm-Gg: AYBFou13JwFX6kS0zLUah1UBqZE78lyVeILD8b3piTizWmbtTmH93BGR32DtO9qRdUi
	DTJBg/b2LZFFQPl/evoEySqHiBb1JtnWrseHJ4JNxrv5IDn4x7L6ZoBjFkvrzHkPeQlmtMUYUEH
	DNzT5qP+efUtPnNeHqgQ68QkC63cqB32B0xEJKyByI+KlmzHwyNk4xb+r+PDTuiOQ1LAEWj4hJm
	v6ACYhYf2Wc6Y0Mk0NsLI2KrqcFf2xXvyT67vxMd/RacLmB8Ogx6+A64wQl4JIPehRLGpTN2WLv
	sXUTkmnZTR1InwqlyJTZv0IR4jA57BHAUtd1ot7wYQNzzsoI0ystO6RtAPVgYEh16ocPNFsUhHf
	GQyos6Sa3T273WvlT0MvKQMyYsOQ4quiFX/XqA87qtO3IoBTrAy97qGv/KECok4s5N+5M34+SOs
	msXCDZwMSKL5B1JxyH7wEBQq/k61dSECeOqGMhH+FMYbOYwD3y1NZ9+unkp1v8xX7lyKNj//HgT
	2FGzrSfr95b0JX+gbBSx6RDkch0kb0Y4rtZP4gappmv/OJbxTNx0MNcIw+txxA797OmGKqHxEAb
	UHz2Y1monF1x05h9XG0QzBBG5kvMwa/M4pVq575eM/TazLNg
X-Received: by 2002:a17:90b:5805:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b166c89a3dmr2067491a91.13.1794294421656;
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167715fd4sm2625930a91.11.2026.11.09.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on Huashan PI
Date: Tue, 10 Nov 2026 15:06:25 +0800
Message-ID: <20261110070627.217946-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230702_786789_E5894AB0 
X-CRM114-Status: GOOD (  10.57  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As current the DWC2 support role switch on CV18XX SoCs. Enable it
on Huashan PI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index aedf79f47407..bf3d58c355c3 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,6 +88,8 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
 	status = "okay";
 };
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
