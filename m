Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1AFECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88g9oJqtGr3TBkrPsC4C7SNrMxJhX5QB995QzglUZfU=; b=PcN4jeO2ktU8eM
	9MvsUprBn5Tdf6OK9orlBM4IbX6IU5lyNx0LMV+ZMQYXXO35TnLqrIEtDE21eZYn0goJpwRliag2C
	q+iWeLAZTQ3xU7z7TpPLDMb9yXgqqDMysiJvop4ZLQYmHPIWArXjlxA+U2mEyOf+AtqejktKlS6hv
	+bSUzTbWuJETB8GQtZIYtPAMCzJclPc/knVfqQ6Lf+fm1tuvUH3z878Sc6WPXV6tcnAlv78t3pXL9
	q725VQUvKo/ZIMiJDsztoOboHxFrWRbvJl1JAF82yfzUC2W2Iq9rIs6RVkymRzx4E/XBeJMkTQDIA
	eqvgvLyZj/lrOIsXKhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo521-00E7bj-0c; Thu, 27 Oct 2022 15:42:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo51y-00E7ah-Cn
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 15:42:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id o4so2934700wrq.6
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9QeUTAv3ImQmyqtbRt6AY3g0/N4mE8bJil9YqOk5oWY=;
        b=athIpLk6AkXZniULmMNXB4JJ9ffXy3Ifs3k8UEIFHE5cXFPbNPLTaRTH3ZSSHJgD3P
         SdxPcfk0Qv30uOAzNk8vT08vrHGoFF8w6A1HDxGodPNJYVZKUtwitm0FkeIRARETzNyl
         D88BWKQnCheq1EMjDDl/wjZ/FMf0Fyuy+q3sGruRfWDcU8nFR4yJrd/DlmIdbAHpFFeM
         mrDiUkUSgdlf7vlFU+oK9pT5MlhRSszTepY7XMjrzxAze10LJA6Ma/OmkrohZiiM7Tg7
         hPkmoeoDGlAcnrvckaJxJLxrD9DLv916HCwqhJ7tT6zswshhvuyId9J6aNdFjJ9eE4U0
         VdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QeUTAv3ImQmyqtbRt6AY3g0/N4mE8bJil9YqOk5oWY=;
        b=1cYS9TLkFyqUfo43XTGYSYBRQZ2l8KKnfi5HF1raOgfiRlHjl3Kr0R6Jtde6C6sTB3
         VMR6OcrDfotj16AagPFFPs+TT7VSyHNKZGHuGfgueF6SWCC7+Sy6Kas90BJLBdcKEg9A
         KStfkEDwX7srVS6jHapoY86JUqQF6zVhMtKmulmwvnrgzTuqUh2vtqL0PNLssyj6+e8l
         YihG2Kz7nZrNBiWT6JqwW3U3KeqySKa4CyUDSQRAtHAtqc1WiN/nvwdt7P//Uj0lRf8i
         GgFTWbT8AhocBAsWQtenD1HmlZ+h4sRWKOvD2G1ld1k03wmjzDUzcSVOawRXB6YX0BYJ
         vFGg==
X-Gm-Message-State: ACrzQf39b2mHQGJ3LtkCNmQfDTokXtOsbZ8fDoefakHvr40uD2jPHIwt
	+jz2PYm71v9uA/vFbNqwTyLB0omOeU4G/Q==
X-Google-Smtp-Source: AMsMyM7pH5FIq0wscGf/f1b49KHI+mlVxEfUAhzxiQHsWIw8BpilP9gM5ueZ2P6iLPVFoFM2TLKqUQ==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id bp29-20020a5d5a9d000000b002252783d6f1mr33513152wrb.385.1666885370641;
        Thu, 27 Oct 2022 08:42:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d4fd0000000b0022a3a887ceasm1419020wrw.49.2022.10.27.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 08:42:50 -0700 (PDT)
Date: Thu, 27 Oct 2022 17:42:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Message-ID: <20221027154249.azksbbscnwt4b2uu@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <5176908.GXAFRqVoOG@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5176908.GXAFRqVoOG@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_084254_459446_CA477F13 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 27, 2022 at 05:03:58PM +0200, Heiko St=FCbner wrote:
> Am Donnerstag, 27. Oktober 2022, 15:02:40 CEST schrieb Andrew Jones:
...
> > +		cbo_get_block_size(node, "riscv,cboz-block-size",
> =

> This is missing an entry in
> 	Documentation/devicetree/bindings/riscv/cpus.yaml
> for the added riscv,cboz-block-size property.

Thanks for pointing that out. I'll add in v2.

> =

> Otherwise
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
