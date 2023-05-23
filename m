Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E92C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk/VgOeHtT7HDC3/I5jCZsZNKmhuvsz3KxbphtJozW0=; b=qWpxmwizykewKR
	9UQUbToxSTrKl34dn+7pf7iqufDSopxfbmeEAh3ry5vAm/bmSevFTx/iNRcINIIbJVngh7UsBvibM
	x6lev707yaUkZEIMpXKV0RO1SK9LNFg+rlFtsehjmOVbdKa1z+x/lLrDl6l9JZmF3liV9xDnCCrcZ
	E1OsF82b/P0skc8hwCyTjrHZKpemQUN1L6AqJViOqBgsRVS0kfcr16mhVkyKgJcbfauS8Q5P8Yul1
	COe1f8ODRFqrXs5indJtmwRQc/Oh8cuBtQFlfpPG3TbD/LsCfZ3996lKIcM5if0nPwt33xNdrQd/F
	uHBy5JtYs3N7lkaxV17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Fxa-008Tr4-2Y;
	Tue, 23 May 2023 00:33:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1FxY-008Tq4-09
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 00:33:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f607059b4eso9813145e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1684801981; x=1687393981;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrFGl63UuCEpD0/cTn8zK2OoUmxoYf1cLwIERUmWju0=;
        b=eTt828dUiWmLDNAB9dxn4tYuW5E06NyZpscH/7KYbHvT3H/7gyKD7v0rjwTuwrtiQW
         NUJxrc4sE+j9UsAJmC0FfdetMEqHf9lZai2ji0gZXVr7gxyVHvN872ikUfMSm+9ukLO2
         PVXZuLKuIJ3m9Q3JoqHNO6MzDAIh7w8ieL/1/NBdk4OzfdBxMPtioHoLJNar73hHho/H
         mcesOgI1rZFfIr6dwqHyxNtX5WIdbM3adoCndWrVSUiYwXYXQsDa4isiCAO7aWGt9+hk
         scm1zheIYZF3iEPPpA335kiav3/+saa/D73Ypsb3YErwfAKAFwdcGFqYnmdJS1sHbvka
         WzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684801981; x=1687393981;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrFGl63UuCEpD0/cTn8zK2OoUmxoYf1cLwIERUmWju0=;
        b=lZ4M6jBVIQlqnTWCs3jCB2IMTP0ozzBWxmL3sfRxmPqUkOE/Smt/RPl33Zi7ju/+L6
         bqyc7pWD6D8Z3IUVzz8BSwKiNPpd+ySJI5FenU/pozBsfJKejVG0LYfh5Aqav90ZSypc
         IKkMEtZxOFhyh2kx2/x00E7ZJ4krZc4XODwI3AVv+4PPv4Zz9QywXQupyGKOyCqhUK4d
         S/iREuZcP248KqhS0kjsPOziZWO4ufWQ47Kex+0Qxr6JnVYJxn6wk/asSpSS6pEvaLAJ
         6FuHEqBbQTJnucQYUN+6nvsFLqyHwCnJv7kXAnrTCjTxxCYbIYuVRaz6alvDCHLaQEIA
         dwhQ==
X-Gm-Message-State: AC+VfDwMz3d1ad0FwdmHb0zeEXYTe3VZlux8Cw9BNKU6Gib1xvOlDfQM
	md332FQ2cBfXxe09ktmnMHnjqA==
X-Google-Smtp-Source: ACHHUZ4CZCrzym57qPoHumfgDh1AfJecnm6yW7KJJLL5ovCAtDUwzXSiFcYUjymp+3V9VRRgsl4rIg==
X-Received: by 2002:a7b:ca54:0:b0:3f4:3562:f799 with SMTP id m20-20020a7bca54000000b003f43562f799mr8697189wml.28.1684801981473;
        Mon, 22 May 2023 17:33:01 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c22c800b003f4289b18a7sm9924645wmg.5.2023.05.22.17.33.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2023 17:33:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230522-concrete-unpeeled-7e4718e61b46@spud>
Date: Tue, 23 May 2023 01:32:49 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 soc@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Olof Johansson <olof@lixom.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
Message-Id: <3B8DFBEF-9EA1-4375-998D-944EA18D3E4E@jrtc27.com>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
 <20230522-concrete-unpeeled-7e4718e61b46@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_173304_124317_91F78616 
X-CRM114-Status: GOOD (  21.60  )
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

On 22 May 2023, at 22:34, Conor Dooley <conor@kernel.org> wrote:
> 
> On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
>> On 15/05/2023 21:20, Conor Dooley wrote:
> 
>>> +devicetree ABI stability
>>> +~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Perhaps one of the most important things to highlight is that dt-bindings
>>> +document the ABI between the devicetree and the kernel.  Once dt-bindings have
>>> +been merged (and appear in a release of the kernel) they are set in stone, and
>>> +any changes made must be compatible with existing devicetrees.  This means that,
>>> +when changing properties, a "new" kernel must still be able to handle an old
>>> +devicetree.  For many systems the devicetree is provided by firmware, and
>>> +upgrading to a newer kernel cannot cause regressions.  Ideally, the inverse is
>>> +also true, and a new devicetree will also be compatible with an old kernel,
>>> +although this is often not possible.
>> 
>> I would prefer to skip it and instead: enhance
>> Documentation/devicetree/bindings/ABI.rst and then reference it here.
>> 
>>> +
>>> +If changes are being made to a devicetree that are incompatible with old
>>> +kernels, the devicetree patch should not be applied until the driver is, or an
>>> +appropriate time later.  Most importantly, any incompatible changes should be
>>> +clearly pointed out in the patch description and pull request, along with the
>>> +expected impact on existing users.
> 
> I'm not really sure that I like this truncated section so much, but here
> it is... I kept the last paragraph intact as it does not talk about the
> ABI, but rather exceptions of submaintainers.
> 
> devicetree ABI stability
> ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Perhaps one of the most important things to highlight is that dt-bindings
> document the ABI between the devicetree and the kernel. Please see
> :ref:`devicetree-abi` for devicetree ABI rules.
> 
> If changes are being made to a devicetree that are incompatible with old
> kernels, the devicetree patch should not be applied until the driver is, or an
> appropriate time later.  Most importantly, any incompatible changes should be
> clearly pointed out in the patch description and pull request, along with the
> expected impact on existing users.

Do you have an opinion on acknowledging the existence of other OSes here?

Jess


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
