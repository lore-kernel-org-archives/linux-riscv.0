Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EE5C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KVZVYoIixO1ZFj6fRWlYpcDv3EjD6t5tyGNOk59YUQ=; b=QV1pYEuAqtPie1
	A3R0nWTvMTA5Z6nEV7f7DAh86Dzrj14D+BVXjBukfx9k9OK+Yqfl3kk1H7Zz29H4COY8O87BS3cCx
	hDPBgl2fEKwrSbtZusUztsYxMCYZrF1CyI48G4ZkqnUlBCXD/bPDJnkSHCpRSgKH7EO57pPbKY7IO
	LS2uCV5yjcCAHQRTzwd5Ec3mZYEIbH/euV3pOHmmfKadjP0R8R28AYyRmLf8OMOhI5YqXTxSVfL5I
	oiT4WpdcERjbKcsczAEYYom/aUkUDAKyfDlpLyxe1pxLcslbVNVgBBXZnVai8Als5w9XMbMTwp0Yt
	vcSZRgEbMlcYVkpLB64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRXp-00000005hAb-0tns;
	Wed, 29 May 2024 22:13:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRXm-00000005h9m-3CWZ
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:13:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-6bfd4b88606so102585a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717020793; x=1717625593; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0IlII5UPz7okOGVtp4oFhfmfzPg6aAU73p7l7C1qc+k=;
        b=3ELQ76mZck9RjCdz1pwTuOggZWuuzhEH1nduk+3DlPFq0KNQzSQXkg9kTpNU0eav50
         EHknAzMcCvFYwnKOQuRT+rn8u/Qp8Wwkf6tRjMCWdnK4pLYXLeu/tTr80T56RGTYFd86
         ZYVXBnUsASi3rKwS/Fx8pqNOCWXfCKIGPNFoohin6O6udQ+6Ynid2CKpwvA3gb+FbxWc
         J/I3tchOo5q7YQ66HK8nZkwqjP79ACtBkJjFHvbPICra74VWtsOEIZ1DkM5ZS0loDOsa
         9qK1TPEUXgz69Kdxl8+31595C0sv5nYzn/lyiCkzxeMXWPLmtwLFKayDOjTSO6F7mq+k
         MHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020793; x=1717625593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IlII5UPz7okOGVtp4oFhfmfzPg6aAU73p7l7C1qc+k=;
        b=hk8kH6PHApRkTS+ALciCAGo+tbtuFwxYXqO1id8lD5jToIppkzU7MvtRwzLg85xEUR
         qUhKEDmOnrF9ojZwh3Gp+2sY4S0xgLgZAH0rOMZv4HJvfeDzi5fdjFE1Xxq6/DfJ1Avc
         cfRtULyJmtUklq9JwRYgUw//setrtbWIOWS+QSAsNxjcyo8NGEt53rGO+55TRdEFeOPZ
         WZ2TszBLhlcXMz7LteyNEIj4W/8MyNA7/XCuf2hnVebxHMF8uNglB9ryqpFQ4VkPL6KE
         HyUN6kQJqah0qmq45MpvqUPwSY27KUCQtRtqZujD3awctr3bcMbKRldyDCF+RG9Pfe4l
         IWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGDk4x5ennMG64SF88/9XgvWaIeipQuwXPZLCJu1acVAun/3FQh/13ko6pOyZEBSzlPSe2zZDFaBR6mYsyYtdrW6vlC9PlECVsls68cgnl
X-Gm-Message-State: AOJu0YyFT00WZukMrlO9jpRfWJ3IALWeCsSRYGBFtECxuqo+TdgzCEcH
	7ioSauto+veiqyiFojoRAha8FrmxvWMOmYj3RVCJxQuuDxT1CNXMmTLoOEJDJZQ=
X-Google-Smtp-Source: AGHT+IGZO+QhLAfwlgYNEFfJDCtn8LQjOZE5KcgbzkziiPV98AS34GxnJcpziGZFsgu3JA+ZTJhYwA==
X-Received: by 2002:a17:90a:ad6:b0:2bf:dcba:a3c1 with SMTP id 98e67ed59e1d1-2c1abc3e316mr512737a91.34.1717020793113;
        Wed, 29 May 2024 15:13:13 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a7772cebsm287763a91.17.2024.05.29.15.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:13:12 -0700 (PDT)
Date: Wed, 29 May 2024 15:13:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb
 ISA extension description
Message-ID: <ZleodmaYG7qsvNmu@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_151314_835272_4BE396AD 
X-CRM114-Status: GOOD (  21.43  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 17, 2024 at 04:52:46PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
> Zc* standard extensions for code size reduction. Additional validation
> rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
> depends on Zca and D and finally, Zcf can not be present on rv64.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index b9100addeb90..39084c58d4e4 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -220,6 +220,38 @@ properties:
>              instructions as ratified at commit 6d33919 ("Merge pull requ=
est #158
>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmani=
p.
>  =

> +        - const: zca
> +          description: |
> +            The Zca extension part of Zc* standard extensions for code s=
ize
> +            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't e=
xist on
> +            RV64 as it contains no instructions") of riscv-code-size-red=
uction,
> +            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initi=
al seed
> +            of zc.adoc to src tree.").
> +
> +        - const: zcb
> +          description: |
> +            The Zcb extension part of Zc* standard extensions for code s=
ize
> +            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't e=
xist on
> +            RV64 as it contains no instructions") of riscv-code-size-red=
uction,
> +            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initi=
al seed
> +            of zc.adoc to src tree.").
> +
> +        - const: zcd
> +          description: |
> +            The Zcd extension part of Zc* standard extensions for code s=
ize
> +            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't e=
xist on
> +            RV64 as it contains no instructions") of riscv-code-size-red=
uction,
> +            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initi=
al seed
> +            of zc.adoc to src tree.").
> +
> +        - const: zcf
> +          description: |
> +            The Zcf extension part of Zc* standard extensions for code s=
ize
> +            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't e=
xist on
> +            RV64 as it contains no instructions") of riscv-code-size-red=
uction,
> +            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initi=
al seed
> +            of zc.adoc to src tree.").
> +
>          - const: zfa
>            description:
>              The standard Zfa extension for additional floating point
> @@ -499,5 +531,51 @@ properties:
>              The T-HEAD specific 0.7.1 vector implementation as written in
>              https://github.com/T-head-Semi/thead-extension-spec/blob/953=
58cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
>  =

> +    allOf:
> +      # Zcb depends on Zca
> +      - if:
> +          contains:
> +            const: zcb
> +        then:
> +          contains:
> +            const: zca
> +      # Zcd depends on Zca and D
> +      - if:
> +          contains:
> +            const: zcd
> +        then:
> +          allOf:
> +            - contains:
> +                const: zca
> +            - contains:
> +                const: d
> +      # Zcf depends on Zca and F
> +      - if:
> +          contains:
> +            const: zcf
> +        then:
> +          allOf:
> +            - contains:
> +                const: zca
> +            - contains:
> +                const: f
> +
> +allOf:
> +  # Zcf extension does not exist on rv64
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zcf
> +        riscv,isa-base:
> +          contains:
> +            const: rv64i
> +    then:
> +      properties:
> +        riscv,isa-extensions:
> +          not:
> +            contains:
> +              const: zcf
> +
>  additionalProperties: true
>  ...
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
