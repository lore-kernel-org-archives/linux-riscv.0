Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C383C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1OCma8otM1v7JTFYHXqRQ13vDPndDjzd8jhvpHjpNk=; b=jOFkM3JjD6B8pA
	VDKImuXaV4ROpdZwxDouk2f/q+zrQHIXedMSxzPNbW8HE3RVRqpWcLiOtHRMrPhoa4gJObvMTbchk
	V77QTP90NmhXif2TcnjyyQXVIqP094DfLRK0ms/HMh9qoAjWztTbLLyUfK6WeBWwP6V1b/M5rjAv4
	fI6xlfWDqbOFULWJLF9+EW7nw2fPXcVw4G5/evM+Ebwq+CFwxOpAuuQ7Jm6tbapJbUH0B2gTWKkZM
	u2fkYFsYBTsbbE8C2nL8IUG4rFAfmLWP4dbJuYmkRROSdeXm4fG8f8N0QfhWZ+XGwgy3bOqBL3H/u
	PSJeeAsnrmm53tKlH6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Nl-008CNA-O9; Fri, 19 Aug 2022 12:45:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Ni-008CKo-KB
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:45:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id l1so5458453lfk.8
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qvXDTKscAiZiFahTRl2j0TPPmgPhdbYrghX1xTrKTXQ=;
        b=l7EYvlqAhiqET1OnR4Ql6iK5YCrtGs8RJ0ZneYjgaZ96uy1PEkRsz/Np9udIODLCeN
         gL5O9vo+TgwBSOh0H6ojZesoClRiBFbv0j2z1KbyMehWsxcrNVMOAAP6MicRQgFDI5Tq
         eoVHKgc3zljp+pf8+DIC/aGof0t4UjRwhdM7atuKItQ8zYkXkIqRoRkeGpwSvvG6R1Kj
         lddvWOunO8OmDqyPGXJ/nNYfY2Zw4keKeqKVnpHdqBTZJy+ZMMLVjsErlsQyIyQ8taVm
         BYRxn45gMrdCETjo1Ho2di1968lL3vLehYjcJrJNf1navA180MG6qI1XCFLTaz8GZ9YE
         z2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qvXDTKscAiZiFahTRl2j0TPPmgPhdbYrghX1xTrKTXQ=;
        b=C1kwVSnMdSC+nf5bXKv/bRiNMPIw30dVlko6kNCsElMbqK6lXy5L3jNT0CHbmPNIvc
         QBsHdfvxZ+BVeXyeW5tfxcw43XYBw3kHk0YDAVDWexeH0K/wjhGGftfIcBKJFRPztMNH
         odV5xBFdZtqdMqz8MCtC/XyLIuRyAGKrVx3O/8YJQ4v9FQyVb/63njBpufNejR0+kXDy
         BUlWA+q7blS+BmVbeW2tS+cMNgSklt/kJBMgWp/HdnsoAq2Op9lOpFtIKGCZiPoiEe6c
         +dM+gy2VuVX/z7MJ7Z7aT33wGsP+4pYtumerWwkMr0yoWzeyixDxIhkGUSevAEDHTBlp
         61kw==
X-Gm-Message-State: ACgBeo1WNv+S9q9gw9WfwG21tr/5G+HDMdAlqSXDpuPlL3ZtZv6Ei4ru
	pE9png3d0H7zsxUvI1+KcXra7Q==
X-Google-Smtp-Source: AA6agR6GbhxNbQO5V3790V+4FnkLBnhcICw3x9f7BqhylD85fTqQJiQHMCQLtgRZOvqMdEuFGfEM/A==
X-Received: by 2002:a05:6512:159a:b0:492:8c61:1991 with SMTP id bp26-20020a056512159a00b004928c611991mr2231483lfb.245.1660913145156;
        Fri, 19 Aug 2022 05:45:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b0025e59a76742sm607551ljd.14.2022.08.19.05.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:45:44 -0700 (PDT)
Message-ID: <9a2bef1f-8e5c-b26b-5cee-ee6ecc6960f8@linaro.org>
Date: Fri, 19 Aug 2022 15:45:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] dt-bindings: clk: add PolarFire SoC fabric clock ids
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-4-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054546_713851_A0DB8FC5 
X-CRM114-Status: UNSURE (   9.63  )
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

On 19/08/2022 15:22, Conor Dooley wrote:
> Each Clock Conditioning Circuitry block contains 2 PLLs and 2 DLLs.
> The PLLs have 4 outputs each and the DLLs 2. Add 16 new IDs covering
> these clocks. For more information on the CCC hardware, see the
> "PolarFire SoC FPGA Clocking Resources" document at the link below.
> 
> Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 23 +++++++++++++++++++

This could be also a separate header file for CCC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
