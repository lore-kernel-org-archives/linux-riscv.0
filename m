Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC7C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oh16WZ8EUBHM4as5Lz1voepYassO6vkinJdFem3cQKQ=; b=QO061zSP50NlZxvI2W5NPq1rmn
	lbZxqCtCNPIZRf7aIxcLXgP0ewV87NX8Yjn0dBJiHdTIp4eN2vRwtvt4hKuZ0Bq1pnakwCU6IwPIA
	UMZa6wIEhR03W33RLSyKjUR/qWx4k92WKA5aHlPdT1FLz82KOht1AO9KD9Qdo00mp7pG83dOUCsyH
	HcMh1jjzSSLD3cLzAAvKMTsw/jiVj8s88Ky5JM4uhWx1tMObCYbUs5hq8hyyS9NFP84hILR2xZS4g
	KOQvkxTxxqueakZHomdiP9dBurbnNrd7Z6aIvfbioqjbuBcKq9Zt8xag5707bA20g9324Fve77VU6
	dT9q1uDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pCc-00AD8j-CA; Thu, 01 Dec 2022 19:26:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0p87-00A9SM-AF
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:21:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id b11so2781313pjp.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4Gc9gN2otXkm8m4oox2qCrf5ekLmPGu19VnxyN13J8=;
        b=SwT6lk9yHqGS7ky29RXrRN8zcJ5CXFPRqx/GX4tTizpwqqlWwm1V74YvwYVdVv2ykZ
         e1RJx86pTwR+dPAYl8rF0+Hi9uVJs6zyHl2bR2RlSx8Jrw24pfvo13f6veiXcHvj3QJc
         Xv81/cHQxq3f8dLf3YfRAMfHHLv6uTDpoqFWIH2PXJZAMFD0fL5vvCDwQD8tDx5ZeZMh
         reCbklqNrpf7aH2tbl0MBkXx/St4C84QhVSnIOvL+ASXbKgI+YFcA9Eo31KzU6QUuPZz
         Gk1eRPxzlVaDz/SwfWpqJjqoJm470tmvI8akRxjk3kc5sef9HhyMNNT4chR6vUpltDoG
         nDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Gc9gN2otXkm8m4oox2qCrf5ekLmPGu19VnxyN13J8=;
        b=6ZfIaikLKJF7Js4qfjlaVvnGK3s/5koXy7yiNijHtQKbum0jKwWhUuLPFmtLJKae1+
         KelVpz3AnbTx4TVxrh5398FBpnLuAc4tMuNyFAevSLsbmOoum814gYMctGyCgQz5yY4N
         Gw5GKz0E/5WNH+yTPk2NytxJTYUOhPpkMsg03ej8iLIorJUwdF3RcYrJnWZbF/BDnrsY
         55Ljkc6jaRdEI3Z7+Nsft7f2YLfmv7Cit9gRBN3RCkGv5kyhm9rx52v9gQzvFsLUvwPx
         Oh6h9ZX6sL8BCHu7RHp7oL9q1w9EgGh9SRewUzd+we16Z3k5mbaXpYP7hcHcBn3TnhmC
         RbVg==
X-Gm-Message-State: ANoB5pkX8E+r3KWss7SkT92kV01EzFHwzVy5d6TreuLdZdz9n0NJnifN
	vrWOIu/1/eQOc+AMg6TK+cSpjw==
X-Google-Smtp-Source: AA0mqf6YSgYKqisC65u2t1o8VgQbEtHbJDHD+4u2Q56HcmLYNyxLyceIQa1JS6cTUzwYSXW6klAy2w==
X-Received: by 2002:a17:902:f2c5:b0:189:1cc3:802a with SMTP id h5-20020a170902f2c500b001891cc3802amr50026912plc.56.1669922512296;
        Thu, 01 Dec 2022 11:21:52 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016d9b101413sm3980290pll.200.2022.12.01.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:21:51 -0800 (PST)
Date: Thu, 01 Dec 2022 11:21:51 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 11:21:37 PST (-0800)
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part of the uABI
In-Reply-To: <20221201135110.3855965-1-conor.dooley@microchip.com>
CC: corbet@lwn.net, Conor Dooley <conor.dooley@microchip.com>,
  linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_112155_612783_A65209F7 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu, 01 Dec 2022 05:51:10 PST (-0800), Conor Dooley wrote:
> Commit 5a5294fbe020 ("RISC-V: Re-enable counter access from userspace")
> fixed userspace access to CYCLE, TIME & INSTRET counters and left a nice
> comment in-place about why they must not be restricted. Since we now
> have a uABI doc in RISC-V land, add a section documenting it.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
> it to be applicable, just getting a patch into patchwork while I don't
> forget about this.
> ---
>  Documentation/riscv/uabi.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 8d2651e42fda..638ddce56700 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -3,6 +3,13 @@
>  RISC-V Linux User ABI
>  =====================
>
> +Counter access
> +--------------
> +
> +Access to the CYCLE, TIME and INSTRET counters, now controlled by the SBI PMU
> +extension, were part of the ISA when the uABI was frozen & so remain accessible
> +from userspace.
> +
>  ISA string ordering in /proc/cpuinfo
>  ------------------------------------
>
>
> base-commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
> prerequisite-patch-id: d17a9ffb6fcf99eb683728da98cd50e18cd28fe8
> prerequisite-patch-id: 0df4127e3f4a0c02a235fea00bcb69cd94fabb38
> prerequisite-patch-id: 171724b870ba212b714ebbded480269accd83733

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I think I merged the last one of these, but if the doc folks pick it up 
that's fine with me.  Otherwise I'll take it when it comes back around, 
so folks have time to take a look.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
