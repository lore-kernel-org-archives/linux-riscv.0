Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C5C3600C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRFh8nNAMC+W4sm5Ftei49WiGB12bNCRObA12qlOfl4=; b=aYbY+aF6Ho7fan
	RV90M8De9eeA+xKfR4+6bTCRywyEfVWJ2NbfX2po1mHg4pvGMWCWKR2rMoOTiFngZerCtCd2vUq10
	hUvycYd75FCaoZ6f0NC/zxUEUoU64QwJ4oAwPU25sYjX5hLTexo8cq3ZhM97LokfNbPXVaDV7dgsW
	84jTA7+1qBZ2omB8fU4FoZbVXBEaNMaXa35Vsfxr5593zTq6WRjz7hLPORr5mB2cTfc2qOuezco7B
	WQ4nn7+L0aBUkHWrJFiPoLjfVDeXnOo4WOeI12u8Ly/aT2cF9tPF1brwS4sKMQUyLFrGhTfQXeeVB
	jjGBoET3/qQ5REEl+Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax3-0000000G5GJ-3RA7;
	Mon, 07 Apr 2025 01:07:02 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax0-0000000G5FT-404z
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:00 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4775ce8a4b0so72292631cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988018; x=1744592818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=DbuLfbkrKOjPS++J5gYaes0X3HSnzzcEZZ0PIhAvzxmQVHDXrCex9dEU0HvF3Sabse
         g0ZeEnAairlFH+JLSSGXhKUbz5IBIe6dTGxmHYw36VSZzcittnER190ShzS+qotr1n/U
         yUhU998s+SMFBUzI7K8dQX3gyKj9CtpB6Q4BCZ2ybT/vmO6TWmQZibZzpDsiEY8doEZj
         w65WAF3UWl1do8CnJUM7a5xHVRJewEERVZMIu7Igcl72c1CZIg4OjRSsa/cnOAQe3SFz
         /LnDOROKmCs9+XDTAldCCzY/oieNAIvJGVWWd4/V3yBIrkvDAx7ailh/n98A3uK03kCV
         HswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988018; x=1744592818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=bdv0z3884WKiBKwab/Fi62gfOCIP+upMO9C/NAVi47zZuyeo3Gd7Dlz1At3kPOejNp
         NxYWFL7NXrET2XB1d2HJTUVbDqnBeDhN81MESAac/8grKfTVTOa/hfjTqNQqDoVi/uiS
         ztO41Vvnwn0UW6vKN/aTwsHwq4ia+4K5syPExVWjuUxSkMvI79oRyRdjY4+C7NbedoL4
         TE0XHjlQeOTsiAJL48B9I7/c9qVhmmGSZTXqlFNiFzhcgF7yutghqj5dvnaRdHHwkDeQ
         c8GzR7u61PFD/Q3zRSQXmGWUEHUVP5IAJgP62ZVZD51lctoLw/6A6uu/16SvuxxDdejU
         F+fA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+rYdKtBdPEA/mIhlflwBXJSjPp1SByxG65kjxqpB/Slo80eUOnLb0GIszxn7nFAnFpDYOsvQJq1wjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTYwzEYCpT9IGxEEcEvH9mrc9nv89AYKguiDUtpzTVJRe5l/yt
	djhBt+mFT7o4dEPgdwBvfaO83sTWatPD9zS/0zR2/0RsHkUvyqar
X-Gm-Gg: ASbGnctzIQr7UHkxmPXV/snj4GlhMCwGcd61DQAqWpD9rJw7XtLdAn2OYBNLBoM05j4
	Da0I0k2Snus0/gFHHkwaVYXYpcILfdifvOG65x1iJSmMZsRoILYvHfbhxcWnSS4uSDcPGQc6xW2
	qtisOpkEdrCUc930uZW7z6LI58a5SxL+6vrDjcM9kDfJHzu7KOXjVeAwpQBoj/+xSpv7ZFB06xk
	xEY0UvqYVdUXzx4XkJLjabcGljU3QAVoa31q2XbE5xFvsQsRYyTk6XUYNNJrkJZsqHfH+LnvEsq
	+dV1ykbfuSApl0nyrSLI
X-Google-Smtp-Source: AGHT+IGThLD0f1Wc+dVeoU1jl4PtajVlgXRPCMJv4ypnlzRq3f4lx9CHT6fpIIMYrngbXMnRUpODkA==
X-Received: by 2002:a05:622a:48f:b0:476:add4:d2c0 with SMTP id d75a77b69052e-479249a7edcmr176008051cf.35.1743988017797;
        Sun, 06 Apr 2025 18:06:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1266aesm53295311cf.64.2025.04.06.18.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon,  7 Apr 2025 09:06:06 +0800
Message-ID: <20250407010616.749833-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180659_019211_AD05EEDE 
X-CRM114-Status: UNSURE (   8.60  )
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
 
   reg:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
