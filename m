Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD19C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1A3206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:48:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SgUPt0fc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="SUvjF5QT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1A3206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Thc483KRGLmdxAjxmnxNs/gYhzdXpcvGLXd4jBM04I=; b=SgUPt0fcDrzsFm
	Oa5ERkLpxEtqlTdze/Jh/gQhbvtYe33BY2hjltbCLyNquj7tsDbfgUgzIFSBB0DZErSvWtTVjNy1f
	kKE8sUocasEpFmZPi+CR6nS2HGfdkdEAXM0xcBN9Rz8uUrPgMd9NGx3jAPJ0CWGvHKdi+EKqAx/vi
	bWjWUO2YFBLFbyOh8bky3hLIG8CPpzXAUpbD+5cO5/CypHcyE5lX0g6OPCMrBg0VlYgeKRwWWZQrG
	iHPlgMYhcrjATnBNW3VLIU8EBaFrJcw8eWxkMqXwoo/j2orbn6YZTOydcsJcBluYrQWsSIP9Q+nZZ
	Kj5sxrIMxLZX8C3rSTKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggps8-0007Ry-6c; Tue, 08 Jan 2019 11:48:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggps5-0007RK-8x
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:48:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id y185so8275048wmd.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fihLDeBdBCv7UmpGapUichtBalNpltWbM/T1LuHnn1E=;
 b=SUvjF5QTE/q99kJO/QO9AadOOOqQJy0OsaAQvr0dXzDYTrM/rDxyxXc/D1pzpLDiss
 RPiTeQKe8HNfCPbasdq3muPc+uJJz1i4HSbJY/EtIUMyh9sWPpwXPp6vuI4pJMbnZQKt
 A1sN75oTC4HgufmnLk0LedxaFnjIMebh1PUmq8LIx6Dem5qMeVsj8ZaNx2v22fu6Kk92
 8WIym4S1nSQ6OoyCWRgK8HhdWKPt+McV+PkLz6ONEZZCzpQH44lYSDZxFErXa245h4yv
 zAODo284aAsJwLhVDdZpezsZulyiAw/U7Dhm2ecWp8dQz5K8v400aoYdvMXXMT3B2BRr
 Gv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fihLDeBdBCv7UmpGapUichtBalNpltWbM/T1LuHnn1E=;
 b=Z/FNTHg1tchokwTiCo7BsxBiYjcNkV2SxzIEQyGBk9UB0AzzZNP398MRvAk5moNezn
 KSHP9I97GyarAjZhw6lqgXefbdSR5Rw9BuaHIb5wwBfEYgZqwaVir3te6derOl7Mpo5s
 Xox3D3wBFpuLcEIxHJkcU4VX934roodGgpF+1kV6CAboHjQt560DJuVP2X/ldPHzVgQl
 0ggEOJ18P5gSpTqteIGrYnpDkctwcrCXANsjaolWHYWW9uz+ZPK+73ChvyYPk983DbjF
 WnINApbbB7zIv8gIgLsNI2wW83GbkwRJUp97FswQHTa5FJ4fEEA6U00K2TgYT7BWiLxI
 ycQg==
X-Gm-Message-State: AJcUukcaxcJ8daSHJbrHQiggGnUqbZ2bVYc5mdAj8jP228iaBXr9sSc2
 ZfEM8cN0WSmEEp69SxQSpqYWhCV/TGjFTIdYiDg9bw==
X-Google-Smtp-Source: ALg8bN5cD2iJ0kVxGqwVi1PVwrKMkhUsaq8p5Clty6fiADVv2zC8MmX6NanYBcrH0TBkbAmccauLUMvnOgOJ/U1koFA=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr1543468wme.16.1546948114765; 
 Tue, 08 Jan 2019 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-4-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-4-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:18:23 +0530
Message-ID: <CAAhSdy38LyH35ABqexHoG-fy=FXp9B79cruSHBuD+jzY_EFVgw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] RISC-V: Remove NR_CPUs check during hartid search
 from DT
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_034837_363474_6A711FE7 
X-CRM114-Status: GOOD (  13.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> In non-smp configuration, hartid can be higher that NR_CPUS.
> riscv_of_processor_hartid should not be compared to hartid to
> NR_CPUS in that case. Moreover, this function checks all the
> DT properties of a hart node. NR_CPUS comparison seems out of
> place.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpu.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index f8fa2c63..19edaeae 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -34,10 +34,6 @@ int riscv_of_processor_hartid(struct device_node *node)
>                 pr_warn("Found CPU without hart ID\n");
>                 return -(ENODEV);
>         }
> -       if (hart >= NR_CPUS) {
> -               pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
> -               return -(ENODEV);
> -       }
>
>         if (of_property_read_string(node, "status", &status)) {
>                 pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
