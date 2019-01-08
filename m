Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1FEC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9787206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KOq8gJKw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="RJVNzMAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9787206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnzUelz7H2PqFb6S5Mww7or1p83tcgdSox6NZs4p08Q=; b=KOq8gJKwEaNxsu
	agReNOV64LrbdxafMTh9Z+Gs/1RZWu9kVbk+oLB36O5MLfgUIALt1J2eZhWlMyLpLJEt6Upq/nTSj
	yJQ1Gnge8H71DOc3rk2Mu14b+8tBfiakr5Ibi6OFmGUSU0Qe3JVrQlGJDAbDvekPHQrKPMlRBJwpu
	WW0E5K2Qvn75Bvl/O3kY25dKsOL2lpKSO6FovZltqerOI11OZWtC3K85iiGDCD9xZYKeWL8/Qo55T
	VT5tsuVI9ckBurX2s9/6AG2g6s2ln9aWv4eYMM+56K4ysZk5DGXBt9jHfPGwmjPWc/oqYW0lnnuzV
	AcJ1x7LpMAdAA8U6d0JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggpsi-0007WA-SV; Tue, 08 Jan 2019 11:49:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggpsf-0007Vg-I9
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:49:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id f81so4057275wmd.4
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+V0n8Xtcjz4tHs8ZXrRMUNU6iatKnY0VEqk+wmS3fU=;
 b=RJVNzMAIesjPC3AE2E+TOmmX5R6vuJzXu/efycylgwXhE1CxBo434WiRvT0LIlPnqH
 Xbs7Rz8UXSpXOq4XvCfjiajPfiN0SpQDl9EuxEW++yFRJ08jY79tWwbNpMH+RyDp9nsW
 l1Zk3ZRzGq2KusdLTTZpDyOuFnw32FfI3ut5Fy/PGBeqyHAtH706e+dS9kvvBRp5+Hex
 mgXXSpXi6nUEfY5HRxgqTsZfXzX7S13J3jG7VQqV8Twpsxsdb/5i9of1VVAu+gYA7iSC
 71Y6m0RinP6SMCR19Ywy2bMXErQukqsPEvmYvaeRu2iZ6unrQHF18h62pBdqFTwRr3yo
 rvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+V0n8Xtcjz4tHs8ZXrRMUNU6iatKnY0VEqk+wmS3fU=;
 b=kYadP6jA8gm2jUWHR2u9Tvz8pyEg+v82oLyD1+gR1myD9e0F1xK9h38Ye8BZw+o/ey
 3j0gDVpVzeunHPzXIb3jedQgAUyW70JXhsg/jL4Xcgm1iqHq4r7F3IiYhPff2tH6XQvO
 2O+r31rCHS0n0BjehZclqpvhsqJi9qNNhIE8oGqOWeRYysFbAi/DTOj/22Zv+S6hW4JM
 nYsjIjigdngrg/YNPt/4B10OeMvWgv0AYktELyYYpcDISXVP9YimFH1j27AKb1oSimgs
 bO8fVgmcQ7HaodCdbvCUUFG9vlCo6F0pr5WYXapICG8iIKi8iKwdkxwjUbXiU2+84u0/
 HKLA==
X-Gm-Message-State: AJcUukdV2M9cdRGTXehqbpZ9ST/uW/QPnYkzoEJ1PoP/L/TPBT5M6XiR
 xZvWlampd+qR0NWGuowcljAYVQmkRQgxPFsUMi/xUg==
X-Google-Smtp-Source: ALg8bN5Ji4/z3cNLskNRfsCfIPWBHYz878MlwhN7JxfA8KyX57565/Xs6NV9LUpnH6eNYuN4MMatcqZUvKknxJE19mw=
X-Received: by 2002:a1c:f509:: with SMTP id t9mr1641639wmh.76.1546948151708;
 Tue, 08 Jan 2019 03:49:11 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-5-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-5-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:19:00 +0530
Message-ID: <CAAhSdy05324s1RtBM73v5irR9-c5gU0T6W=UA4chVCgEwvR-yA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Allow hartid-to-cpuid function to fail.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_034913_598908_14642702 
X-CRM114-Status: GOOD (  15.24  )
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
> It is perfectly okay to call riscv_hartid_to_cpuid for a
> hartid that is not mapped with an CPU id. It can happen
> if the calling functions retrieves the hartid from DT.
> However, that hartid was never brought online by the firmware
> or kernel for any reasons.
>
> No need to BUG() in the above case. A negative error return
> is sufficient and the calling function should check for the
> return value always.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/smp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index e407bd4f..ce9a2e73 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -58,7 +58,6 @@ int riscv_hartid_to_cpuid(int hartid)
>                         return i;
>
>         pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
> -       BUG();
>         return i;
>  }
>
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
