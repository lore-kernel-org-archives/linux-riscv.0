Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13206C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aZ2/jEQts8lob/wPCzMqX/RKa0EPgjKK2yFpsi3LQ8=; b=bxGp32dFq7aE3g
	GA9eFHLQHH23rhJx/yLgmUkNNd3eL1SVuEPYn354dfl/rr4SBlJ0AkaDWRR98ilbe+jSkhXEDJwvC
	+tjfQYis+KVio8ytHwKYcOuBb3iPzhuiZ3F/9R+bHAgSbPihCPVfdqgUcUbxz3jfyP9KnuzVxrXYe
	GSrkyFQp1vZWc8TwLjEQFo4VGthvI0InEAbgx684hnl3UYnr8+nSxD0Mwd9XUc+FanWSc5axqzd12
	y1vvsD71HkOrZbsufzl8/9j042PepouIBwvPwVAWmfK2Pof6r2aNT8vyxMtJWkOHv22VACYo5FVuT
	BSX0huKFdscc6blTepMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrcQy-000AeE-Cw; Mon, 29 Nov 2021 08:54:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrcQv-000AdD-I2
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 08:54:47 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 970AB3F1E5
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638176082;
 bh=+cIyWIIE7i87hR1qslQO4QHxm41aJn/0jtncJRQ6V2I=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=GZ4/9yuA+9jPjdcXr5XCzevPVFeFpS1oFRzUyh6iY1nqLzoS9GWgJu5lVjtKxZs7V
 4L7vW39LgTeE/Ved+pSnYtyFBJlVUwsy3DjX1hMvAL0E6yTtZCE4H4na2dOun6/8DL
 5tpAlQjKaO0vzZJuMYm0baG6s/svXcL0NekWUNOn41H+xw99+TkY43Pa/z1AJS0iCg
 gK33Ve463F1LCy4DO2Dpj9jsZkOgiDZVHWfM3tGwVyh5HLuINMiA9gYOYqreP3Jyql
 +i0AYWKwK60+fH6gj/a0sS/4MSDYvWFjkSkNVkcUXn1Wbs9YIEESz9NR2Nk/e6m8rY
 lVkf7/wj+vbtA==
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so8238426wmj.7
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 00:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+cIyWIIE7i87hR1qslQO4QHxm41aJn/0jtncJRQ6V2I=;
 b=UQhb6k23kbsw2QLodLn8GjVeDUyivo2fbREsLZW4aXVmSPHMkjwUCh/5gXAhLXtAfD
 DBCQNiRYodHsIT4UzV6rrAgUGDVjez6kkmIGAbMG8HyCD9UIj2IzT6Qmi9gKW4e6j2Qb
 jw/736X4PoCKMY9Vy+VrEEPo7a0u23GfGXa3yXLPdk9sJXIYZqN5KvKRSJHzqd1AaY4p
 psmMxMRp3D6jPAXIr+bmquPeKEoH+6q+gLPbtOyWmxSmfV6gMO5tAFeF9KjURbsZUFHb
 vQftgr+2iE1frN7fKjUWapHuKxHIsvdwkkM+Amb6ZH351Jr7pCW2fK05MjLDfaKR2ffc
 OsHA==
X-Gm-Message-State: AOAM533C9UhA+hZD1FuHWReZJBSZnOUxp6Zyp7pOAfYldFv2jctb50r0
 momWCH7vLqNnevNGHk65xmHeXogjuA2+/YYLZ8hDJAhxu8sk15TLQq/DBt9LWiDMLTnhNi4WPxT
 MdSBa5kPfAOugY/KMlMlT1B/HmliwOWknR2yb2GHd+906Rg==
X-Received: by 2002:adf:dbd1:: with SMTP id e17mr32019325wrj.480.1638176082363; 
 Mon, 29 Nov 2021 00:54:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5iHsTpnNO012VAWrcN7a2oQNs88jJzbfoGr42p3pu8vfwhrpau7QH1zWWIbpBuF3IZjaRnQ==
X-Received: by 2002:adf:dbd1:: with SMTP id e17mr32019289wrj.480.1638176082157; 
 Mon, 29 Nov 2021 00:54:42 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id m17sm12760100wrz.22.2021.11.29.00.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 00:54:41 -0800 (PST)
Message-ID: <97431cab-d67d-4bc7-e181-d64534791f03@canonical.com>
Date: Mon, 29 Nov 2021 09:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Content-Language: en-US
To: wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, guoren@linux.alibaba.com, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 Anup Patel <anup@brainfault.org>, Rob Herring <robh+dt@kernel.org>,
 anup.patel@wdc.com, atishp04@gmail.com, palmer@dabbelt.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, lazyparser@gmail.com,
 drew@beagleboard.org
References: <20211129014007.286478-1-wefu@redhat.com>
 <20211129014007.286478-2-wefu@redhat.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211129014007.286478-2-wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_005445_782504_25DF2110 
X-CRM114-Status: GOOD (  17.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/29/21 02:40, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> in the DT mmu node. Update dt-bindings related property here.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>   Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index aa5fb64d57eb..9ff9cbdd8a85 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,16 @@ properties:
>         - riscv,sv48
>         - riscv,none
>   
> +  mmu:

Shouldn't we keep the items be in alphabetic order, i.e. mmu before 
mmu-type?

> +    description:
> +      Describes the CPU's MMU Standard Extensions support.
> +      These values originate from the RISC-V Privileged
> +      Specification document, available from
> +      https://riscv.org/specifications/
> +    $ref: '/schemas/types.yaml#/definitions/string'
> +    enum:
> +      - riscv,svpmbt

The privileged specification has multiple MMU related extensions: 
Svnapot, Svpbmt, Svinval. Shall they all be modeled in this enum?

Best regards

Heinrich

> +
>     riscv,isa:
>       description:
>         Identifies the specific RISC-V instruction set architecture
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
