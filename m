Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DC5C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8346A604DC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8346A604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGIWpxPxn4uy+9/yPAqkd3Jkrk+J9s+gtDo9Mxi8XvI=; b=hAguOsEzXkiywZ
	6hT5ojvW9dK3zh/I/7XvB2AeoexwU2u8zNLTvVdJHfz643O9G/K0xiQMySmR2DX6Mxp+6mubCe9Dd
	PS2fhbEyLQvUe2LdB9qZoiq5Ccna6suE3MyBUSuOsFoNiA8e/gk4aQ4VeH8bRoXL4XWFUuJDq8WZ0
	Nf6qoLPSKxyoS0Zue2q6mGmOKJwZyAzo0GiDbzNnDROxpf5cAJI7BFQWuKqeGX1ofgeR+97SmfPH1
	ExEkUoJ6slWpgNK8b8LxhdmGcgZWodgjRfnHCWyt+q+js8AIn1OYyIt6QOBJ+tvNHbzpRtAvdncxP
	GxoicCovpZ+Kyyui4c0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOC-002FRT-2H; Tue, 02 Nov 2021 16:11:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwO8-002FOe-Qg
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:11:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id z20so78244719edc.13
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=CMMVSV/17ZP/t0ZBRMEqWcOl9jcn9EdPRril8YLsjXXQ2q8NvoJjHJ57oTlhFh45V3
 +ZOLem70FEuu1QiZh/Z1w1z2E6gYgboUv6mQltr6qS6vJ++TyWSIHKL6/MfV5WL4U+Ds
 y/ANstadh3d4G8+mjG3SM/OaZJwZU26njMFC5d7xyCEJgGJvjmF+DQf+xjDYHQwLHwBc
 BMMdUPomJAblZRysCg+B4xOsLGYcpi56j0TOj4IRnzCn5zmC7CPGu9M2x81mN8aXjkd3
 9tNPV+vYKt2iRfzLaI78XilKWkYJJmvhRSlsHetuS1MAgy2XfVKpo2ID/KF80yZIMGVj
 /ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
 b=1v84iH1TbgijxW2dHOeUjobQz+M6B6X31giXGMKeb6INNakzZ9A1RLEUTcEe7RuSfm
 uYRTsucmFuJv8GJKJNAAnnc3aRWZOpLfIK9mIcjpnsm6q1FFiu6GOyg6mVRWLHaBRs6j
 wB4pcmTaTU36BJgsq5Bea12OqneNOnRjAiN2xHHUqgcNI6I4Ayv8O1SKSePZRxPM8XKp
 G9laQzcfXL6XqytL0U7YDNAZYbg3ihLqf/HbL8syiAHED3cWHvaGMp95ILwsT3ACy9lj
 Qsfk1K3SLsRat9yXzSKsip3CZdabBuhFcBbH8ncFwkzfn2tbBq08oa4jvXRNwchmRwbm
 ijcQ==
X-Gm-Message-State: AOAM532dJPOMKqlxKwPh7j0IIG6+Qd3GOz/3HBIM+FkytC8GRJrJDnGB
 NqnTVUzxET+kn9+omJgPwj5MyFhhYhMA4A==
X-Google-Smtp-Source: ABdhPJyoAG8vEmS8dlIAtihH24GOCuPEV/1mht6fav6+Hnp4TnUGEtAeeO/iUfhnB8QhPY8fzmFSsg==
X-Received: by 2002:a17:906:1683:: with SMTP id
 s3mr33340791ejd.331.1635869509118; 
 Tue, 02 Nov 2021 09:11:49 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:48 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date: Tue,  2 Nov 2021 17:11:11 +0100
Message-Id: <20211102161125.1144023-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091152_892342_CBCF9DB0 
X-CRM114-Status: UNSURE (   9.85  )
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

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..8d5f4687add9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-clint
+          - starfive,jh7100-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
