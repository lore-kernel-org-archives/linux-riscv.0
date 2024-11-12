Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D54AD41D45
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 02:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvgzNNbjTksA9UCmemuMcuy+BoBzV0YPtcdtSEIblZg=; b=PehN6zFTSJds8o
	tHWyTtM6bAB22yvpjAugs+XDwwYrXUD3ekWEeAn41ECK7Rh/RLMDikDUVIyj52o0hp5TBNEWWo70H
	MB+UG14dRTQJLTsud3lZuo2WFPlrLAcy1j0Fj8/Tj+HV/AEMni1RFsXBfIgK2b1bwbZZ3LrOV6Pwf
	clW1Zi6ry0q6ViZbBXnv1l2ZiYt5QdwoGUl5caXsuLfJZCJLFEXCR6fzaL0o8pt4oH6YCkDAb0ucX
	7CBnR2ucfztf/z4JWLjkR2Yw+DSa7kIHOxwK/7KiIjxAkW9VbHMpiKOMRhbP1VTVs52qMOTxbVyR+
	hzAK2iyQw1pR2JzXE9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgPd-00000001whN-01ya;
	Tue, 12 Nov 2024 02:13:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgPa-00000001wgK-1ih2
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 02:13:47 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so3720309a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 18:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731377625; x=1731982425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ckkN7J1G+webwUGs7dO6UMm1W6feFqcxletuWT23HE06aAdabL6SKUUUbrkEy995Ko
         6RWbQRctm3k2X+WGTSQN3vadV8JJvOX8dN6aIlpkIc6Zn7tzyl5aYi3F+XiPXFesq9aO
         Wsc1Srq6KIU8IyDSlZpjRctYMdAFilsT4WvHlEIUDzaHR8VBRIJywh8mS5Iq6TOEe6hh
         9hIH8RwGdALU92r8pEEpethfqaNCDxtFekcHNdu0gdDW7YcwUHpo/qJykMcuHuFx1Zwp
         XQjDx1jEfnUcfjoH7f75Yl1z+6xTW+yZmLqLn8qya9G+uZmUBA/SNzcs/rj9wKsQ9w9U
         wk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731377625; x=1731982425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Xvtb3DaJLulrVBWyE+FWXYi2ewrNAcyGbQPZQ/FQSjjOhNA2eyL1m1s2xFMkO8QRZZ
         bS076jkcglBj2UeeMx3nnZzBEDOaGZkyL/2RAiu+B34Y2yA2WsmiUnav92iV5iTcfrSF
         JsMHRLb5+dgxM2OnNRe4vHhvLm6tU9vN58pE4DNV6fEPhsz1fiEV4Xpt27+TaLySLkRG
         ZQkb8oT3q8vrSIIDCU6aFPQ4WkQMrGsE9Y2ZhH1D9//yqvV5Sj1+gSsyg2MOlVp95iul
         34YH8RTzqiK+QlktWpzIksdOvHHVggjIVn8Alamc0ujGE9fBT7GslnAakSqTRIusau2C
         X3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt+fU8rPFNme60bkSMvDP1lO4igiVOIA2J7n5B9NFMgSEFh0RFH64uTgl7KASk/+33XU4T/ES5MtCw0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Xd55xSg8i9uOdfd0Tbettyc82hg2x/l85TeoqC2fYuyGVkaJ
	G0SNrNXJNQI7ybNwYo2kZE5g4pt7AgcVd9NpMhkZTOiRYeC2u6Je
X-Google-Smtp-Source: AGHT+IH+5UXelKsDy3oJZlypf0Kktdqo9U9iQ7oteV++YKpkDWgiAzqsABr0X0CYYwoE+B2WGNVBmQ==
X-Received: by 2002:a17:90b:52cd:b0:2e2:e597:6cd3 with SMTP id 98e67ed59e1d1-2e9b173943emr20532167a91.17.1731377625050;
        Mon, 11 Nov 2024 18:13:45 -0800 (PST)
Received: from localhost.localdomain ([119.139.196.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fee67fsm9223414a91.49.2024.11.11.18.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:13:44 -0800 (PST)
From: h1k0n <ybzjyhk@gmail.com>
To: charlie@rivosinc.com
Cc: ajones@ventanamicro.com,
	andy.chiu@sifive.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	evan@rivosinc.com,
	guoren@kernel.org,
	jernej.skrabec@gmail.com,
	jrtc27@jrtc27.com,
	jszhang@kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	samuel@sholland.org,
	shuah@kernel.org,
	wens@csie.org
Subject: D1 vlenb
Date: Tue, 12 Nov 2024 10:12:26 +0800
Message-Id: <20241112021227.357-1-ybzjyhk@gmail.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_181346_454191_0C32F39D 
X-CRM114-Status: UNSURE (   3.48  )
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
