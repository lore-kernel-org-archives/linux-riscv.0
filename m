Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BC3C3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6OhGHsfQQpFT32UDmRgB1Ei+CKc+YQcnE0jyVFO2cY=; b=C0UY575LXTEIeC
	4S4F+vBiLp6izrDsE4VEK0Lxmjb9hwCVR093pqpXGfPZJCYw49NooCTZYLrrqm/D3iPEj/sZnNYwp
	nexmMEx7nJrNr5nflK3Q/buo7SHnNwoS/uu7YjtjYya6J9qzHYQqGvitFEeSkTj7RUeGl6MhTAZQN
	DzXGNFC6h0dgQfo0VkxhqnCDpAEJOYJtNGtoQu2QzrfMx9T91levgn15PJAX6VsDoqStErt5DVDn0
	mGYBTM39gaj17OYkG/JaD4LWM5+KZ+qXOA3rTQNo1TTta2PbgupJe5/wnsx32tPgsDx6hJLuIg5DX
	EdfTZXDvPjbkqnuvo8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSyds-00000004Rqb-1pxf;
	Sun, 14 Jul 2024 12:47:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSydY-00000004Rn0-1cxp;
	Sun, 14 Jul 2024 12:47:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52e99060b0dso3650703e87.1;
        Sun, 14 Jul 2024 05:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720961250; x=1721566050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYeW1aUqkkqQu0pvxg2P+XASuy3RpuxEzFGY7FDRapU=;
        b=TtMifeIXAKKBBvskQifamLY/dyc1CG/hURMv2gw+2bCzeKdzdR2076zdNtPLMUOCq8
         yzAe0199NdsKV5ht7t7QlnE/sy9FsJMFJLJ4HSl1hGpmrnlg4TsbRzp6VuWydWes2/Sx
         FuY1MskK9lFe/3uc/JeVX5OWFt4TDdibIoKUbO+Y7xww4Nm64cA9tnWjlYBlVemE4pmV
         2ZoLEyIEhAs5ewyoCNB3+zVE+//pM7xN3vcBoueIWBsiK9+YLuzn94VQrT5E5u/xY+kA
         QkloUBvDsCnhUgoRoBrnu5v66ZJvjIHkB0GCJvHe8CKRgslMJxcZFNECwpOW9bHVplzX
         HGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720961250; x=1721566050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYeW1aUqkkqQu0pvxg2P+XASuy3RpuxEzFGY7FDRapU=;
        b=cK6G1T9eriPa5XFJhF8n1S2Lbk+oFLJ5dQMDb0ngIY2fFq5riblz3YKBe1iKYqLG/n
         jRZWpkeT/vcAXZfdDQl3AYD8Id+gTC+g35gYKZ3iAGPTAQjT7W891wNtmEGAxPw+sCGa
         7/sXzyPtaOOb2t+cEFtYp54xQARJOxpzpxG2ihvaFZ7m7gsqLnFIpMIgw46h9RIluvpx
         tnYb/ZJYi/PIzAY8p3ScHiOnWcsXZixxCCHXENsPxmM+I+hn+BzfcYMgTYp0gVVWFSuK
         CPVhqTQ40Sae3meDDxgJKTdNi3oTLhZs2FsdpEbQA5ORrWgSL+sqY5rgIFW4kN1vTTcc
         Kdvw==
X-Forwarded-Encrypted: i=1; AJvYcCWuiV0Au70+QOB3R4JjWf0bfRJ1ZdrZ8Q64xicikFWThsHY7wkPl8RAqa8wnga/wEsBUtGxrHl0vCS+K3S8h3WOrkstZzuxFehtRHE8aVoTqfMBfcAg1pFSkzKf3U8RsaQQfsRqgLPxnPactp61EBKK8GsTJ6U=
X-Gm-Message-State: AOJu0Yy4SxyxgMStgx1u6eEJHGv2A/0wxdPwSvw4+kSiwszbVfLWBlWE
	hRUpRVeCmHn/yGPpKDmh/hFq4cs0j1wpWaVWB8nFy8vW6qADD052
X-Google-Smtp-Source: AGHT+IExx4Gr8Umbg0gbYQ03/bv/pYqJqX/EK/+AOIRZKuLKmJm7iyM5zUZI7yWzpxPPD+pjOE17rw==
X-Received: by 2002:a05:6512:3b82:b0:52c:e084:bb1e with SMTP id 2adb3069b0e04-52eb999126bmr11827758e87.13.1720961248544;
        Sun, 14 Jul 2024 05:47:28 -0700 (PDT)
Received: from mobilestation (pppoe77-82-205-78.kamchatka.ru. [77.82.205.78])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24f3b90sm451958e87.113.2024.07.14.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:47:28 -0700 (PDT)
Date: Sun, 14 Jul 2024 15:46:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Drew Fustini <drew@pdp7.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC net-next 1/4] dt-bindings: net: snps,dwmac: allow
 dwmac-3.70a to set pbl properties
Message-ID: <ywwl3eaamj3d7dhwkhcoglxwxqmpwd5dewkq6ldmrfqdfgnlu3@rawh4yhkuh6h>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_054732_451635_FD5F254C 
X-CRM114-Status: GOOD (  13.23  )
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

On Sat, Jul 13, 2024 at 03:35:10PM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> snps dwmac 3.70a also supports setting pbl related properties, such as
> "snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

No longer needed due to the recent commit:
https://git.kernel.org/netdev/net-next/c/d01e0e98de31

-Serge(y)

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20230827091710.1483-2-jszhang@kernel.org
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 21cc27e75f50..0ad3bf5dafa7 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -584,6 +584,7 @@ allOf:
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> +              - snps,dwmac-3.70a
>                - snps,dwmac-4.10a
>                - snps,dwmac-4.20a
>                - snps,dwmac-5.20
> 
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
