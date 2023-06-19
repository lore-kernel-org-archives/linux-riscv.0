Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6C9C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sO9IyqdIOiNzPv5oDMXNDz0lHYwxLvo2JvYRYp+9Mo=; b=2U54wBSoE4xF3b
	M0Pm9tQkVmbS3WwSf7YUq+N0biPmuucWgdAef9gMUEgSkHzdrx2T+V749CX4cxzY2z8QPOxSX/fz0
	QFjK9Hk8e+rsk9K1JSUK6+IqaOFxzBXhhv8TBBZJRihuqauuQTvmOgXCkRkDKuvehA5ouHrUK17ps
	EpjCR2HHllhhB/SMLarzjl4qTM3LfLE9I/4sz3tasBr9hLSlC8huEB2rpEMc54Y3KZfySRuiEZ7rD
	xgtr4Dj1BvHQb+9qTb55Lt+ZBDCjbvSfZ+9oMVtJ7DlP1F29G4x7pjf4PH0AW3ePjoZGfYu8i43Sj
	e1yIBLL0tHxacIOmFDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgU-009oo9-1i;
	Tue, 20 Jun 2023 00:57:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgO-009ok9-32
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b6824141b4so517805ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222640; x=1689814640;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIRXSKBh0/OSI5A0JE5eFjZNhWDyQODzPnGpuQ5MeOM=;
        b=udHldBHwsqVU04yYFmJnOy5Sr8WpUaHHxyvibnEfIoGkwrth2nCx1quS6nvsSzLYWi
         pu7E3W7NInaNyPGWItwEi9kbUQKQ5i1j+mNIpqIjtjiD9tI7cJrDxEbA8ZZvmDVKqhaO
         /lgzfBsOJJE3Ue4MqYR1IHZTzya5f8bFXxg7OqwMB3hSBRox6yWz3mAEtuqkasl78A0m
         j62O4jEkNvH1+L1mgFYKgFrTYBKas0oZcEl/bDa5xGKz9tWMffhzvSBOPH0Ke688c8yw
         o6N1WTFYo/USpj6idbURkIQC8T4EKG8mvZU5sBmlnzbN8Lr+ottoRJCakQwGQlYgXps+
         XKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222640; x=1689814640;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIRXSKBh0/OSI5A0JE5eFjZNhWDyQODzPnGpuQ5MeOM=;
        b=TjKZO4ONRb7n+64ZrRHPC7aoUWk3jJvpwz8GRYAFkETUc33hyIjc6zsl+KZKqO2eGt
         OBXEWi4vP0F1S71Anrwkoirg4+B54CeZGcXV7NFUcHgpzTINcMG1gyYAZPeUBaliPBeT
         2fUQS+WTMVgyUybHd06vxWN1C2bjy2gA4m1/VBcXIoklpQcjF7ZbwypwGVEEduYBEB8i
         Yq+eRJq/1UQH/X8xyrqKzYPw7RQqoRICkK+EfAKXTQ/nR4qk3eOtD2ONAqXcA9HGDADE
         QKioAUbB0rY9Cv2TpPduMqYQrcIJkdx/9BuhxT5OMkNa6ELxyIRj+89AlFp2hKhquLML
         EHEg==
X-Gm-Message-State: AC+VfDwSi0u2+YC/2emARdzQKf7qtlHClluwpXiwVUpSSq+3/O0Z3H9Y
	cn30knUUT5QtVdRtIVTCYypvew==
X-Google-Smtp-Source: ACHHUZ5MLLpLABeiC3rkvzktEprx59u8JOufah3AUPT50sKnH0qy2CQ1ISgkzmByz2SP3EPYDgPNJA==
X-Received: by 2002:a17:903:1245:b0:1b0:56cf:b89d with SMTP id u5-20020a170903124500b001b056cfb89dmr22649807plh.12.1687222639855;
        Mon, 19 Jun 2023 17:57:19 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id h13-20020a17090a3d0d00b00246cc751c6bsm6533411pjc.46.2023.06.19.17.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:19 -0700 (PDT)
In-Reply-To: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
References: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
Message-Id: <168721242548.30028.8176504545830229322.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175720_978807_E2086A83 
X-CRM114-Status: UNSURE (   6.56  )
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


On Fri, 09 Jun 2023 16:07:06 +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: riscv: cpus: drop unneeded quotes
      https://git.kernel.org/palmer/c/f20233852ae2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
