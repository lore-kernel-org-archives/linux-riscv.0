Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfnX9UdhDMlMN7qGRA2LT/bDCQJ6rL0uqktCHAivRYI=; b=KekN8AcOHAG1AO
	+vwBrWh61RNgv/XDO+NFDhqgk9FL4lnZ/mszmC4GsTQwI4AgGzveDfm+jb/e6a2kFHy2tALMLAo1y
	/Ty92ccxDHcCgYduTDRJS3KO90UcnoXkn+c/VPjisyLeCn8vcOUsAMbeoKb4D/14YRey7EdVnK8/j
	vWmh2JG7Pnlnijt5utWE9IlyxHstV7K+j5SupvWxMg4dUfJlqWbz+YtWZQFp4YWXMicfW7G8aH/AI
	evqZM/3AK+ZNttNKNMA07VLRxW2ZH4sURcFLhfyXwMg5jlV+HYwZC9GhRjkbQlHtFCdQ6jX3ShAAL
	W7s7D6/4WIzlJsC1ylKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEv6-00Aqhe-Dp; Fri, 17 Dec 2021 15:13:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEsj-00ApGE-Km
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:10:51 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 56AC43F1C0
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639753848;
 bh=LuufmSFwO+Uko0vN+wcG6SqqtDV+Z68NapfaG/AboZQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=aZ3o/p5UrZxHBJem2hX7kS5Z5f4zvrKb4Xa561WPwj8XKOUm2xZ0nS7eh6fncnKQc
 L9fHo8mUmWUnJOWgKcwmwjY2YqRfXkzB4p6L4wnQIctadWs7pmaBBD46T58lyMRzDK
 Ax1B2Ku6Wygf0os/yNf4STW5xIrzTzbCVUlTCE80Q3PlQMvDsFVw7FHBQ5sw6gUtcW
 8i4jkLrfPT3/HGe/tphkkBOZq8A3HevktvNA0Z7yB7mbs5qgeOi3o63fAyd5omdSA5
 9WQL3MOtwrfRmcouXtNIqlLBUEapzm5ORgs4o8l2ahct5fVvikMOIg8Hw3clRcaT3Q
 FqYwnUPeTTp1Q==
Received: by mail-lj1-f199.google.com with SMTP id
 h18-20020a05651c159200b0021cf7c089d0so780984ljq.21
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 07:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LuufmSFwO+Uko0vN+wcG6SqqtDV+Z68NapfaG/AboZQ=;
 b=imJQT92RoEs6Swfw8VKUB8LzGvTelar0tO6u9rIqH/bRLbbWh6s52X5KMVo7NfCAe7
 hrPeA9hJqUPR/5sWYbnyT4q51ZIVshBJAAcPRaDahAXrDMGJtaAwmfjZOS9+Ox5CbgP3
 843t/cJCNdP2QpqAyq4NBbC12KGZm/oEJUuzghtgWfVXZJ1rtO/PfkdIyKzvogsfl1WS
 T0sHubj7qmdhJWXM2kJihykOt+Xs+aA95k2Ctb+EpWOdvezHcvh7v+vgpjKY3fobvKEo
 hDa5PiyKGQxZ/t4abvZwWIHE1JrOg3QEHmmPCkCb8XNoaZu5siH7uThhxRpTc+E05Ex4
 0ZWg==
X-Gm-Message-State: AOAM5302Ab/IUqlHVj5IT/y2Qdj02vVwJhtDy2Sckzpitr42Nn7umIcy
 XyLvUIt1J47TpesqtpZwLUHvuAfhjlJ9DeqbkCb9HErwtQUjqHjoF2J+tiRZt4crn2WUk+aY7Jh
 /wa1A8HE+Lkkcu4/WAfLvbsNO6WpL6yNFFnoAukntRxUs9A==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr3073324ljm.168.1639753846497; 
 Fri, 17 Dec 2021 07:10:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygjTECmvBQT9ksaNKKPpzj9j1t+XuT+kSUjjKHB4hi17gD4qo0YEtddUAvOESRhbhyAif77A==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr3073227ljm.168.1639753844837; 
 Fri, 17 Dec 2021 07:10:44 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 h8sm617167lfu.250.2021.12.17.07.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:10:44 -0800 (PST)
Message-ID: <b026869a-7f93-7683-a8a2-5abd0e0d71db@canonical.com>
Date: Fri, 17 Dec 2021 16:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 03/11] riscv: dts: microchip: mpfs: Drop empty chosen
 node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <cover.1639744905.git.geert@linux-m68k.org>
 <53c36082ffa612ebe7ec53ebcc0dc29f11a083a6.1639744905.git.geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <53c36082ffa612ebe7ec53ebcc0dc29f11a083a6.1639744905.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_071049_867651_D9DDD72E 
X-CRM114-Status: GOOD (  12.30  )
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

On 17/12/2021 13:49, Geert Uytterhoeven wrote:
> It does not make sense to have an (empty) chosen node in an SoC-specific
> .dtsi, as chosen is meant for system-specific configuration.
> It is already provided in microchip-mpfs-icicle-kit.dts anyway.
> 
> Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v3:
>   - Add Tested-by,
> 
> v2:
>   - Add Reviewed-by.
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
