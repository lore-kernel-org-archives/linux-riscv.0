Return-Path: <SRS0=Xxsn=ZN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E91C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 18:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA542068E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 18:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KGrc2nmS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Lym4Ssd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA542068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:In-Reply-To:Subject:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Neim6u+RV+D96epjlP2JhH5KpMqD1VJpq4T/7FiMojw=; b=KGrc2nmSJR8UvtbfYk8kFUZJ6
	l4Aqv84wZMqcDqld8gwv8AKtAt+CWWJUZsAa9fo60DBbwUTda6RRcmwqUb7LwoqrU5cygDU1+beFr
	FJ/JHyAXHS27hpBQZRaRoP2BXYpbq1meM2DgnMpKwsUjjrZ5CHdkqr51T8WJyraGGJBFazjlQFWQg
	nvJqJBMVd+YW+H3EQ60EfTxVAFmR/ufi0pR8LEdUYoQ0Z7JlbhtwZjmKmC8Aj25xwMuuV2u7Zpgmz
	WScEeb5JyWKU5nnu33EEARMktJFjyceh6qt42K+EVEjOqcvZ+Mg7KuAgSZqOR6Z+7RmnorKc1ISKf
	kVgYSi4ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXr2q-0007Cj-0w; Thu, 21 Nov 2019 18:19:08 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXr2k-0007BD-JW
 for linux-riscv@lists.infradead.org; Thu, 21 Nov 2019 18:19:06 +0000
Received: by mail-pj1-x1043.google.com with SMTP id s8so1852303pji.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Nov 2019 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=I6uJcXLoypW9tYMx28q19tiRpGF7WhpsZPZ8dyE27uE=;
 b=Lym4Ssd3e35Z/TKS4vPvCd7JusYX2kQ1Q1v9q/bpwdhs7fEIl23xxj/vA4CQCPEKoc
 1IKrPF83aLgBckBNv0OIQXuCNVtP1G1tPteLRA4qnLkTlSCmsksagYR0WkRtAkVXXvWi
 r/quP8FHUjN7z0thADVY3U5p+EWyxMcu8Vt0D2yccq8qJ7F8Xjrake4Ovgx9domVLTHr
 HIvKbRTmqA6BiekgV+i2T5b6PQgYoFBsEh8MwOflDw505mgb7noIAklKBW/zr9GfB4i5
 Jx2hrX1Ov084EZu6Es/fz2FNEO9032HTQ+iyP+2VXkqEvy7Byxbx+7hw00vDTixc+VfM
 rfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=I6uJcXLoypW9tYMx28q19tiRpGF7WhpsZPZ8dyE27uE=;
 b=Hm4WI+cue0xWfnf14QCQXepjftIyfes0qjpYPF/t0EPF46fxr59mGo8G/EtjqfLiw1
 +dJi9EU1RfR8yWnHBDewYTWwT98WI1YO1kBh0Qm4Km+D2i0cg/BnQigbe4GYZWsk0nH5
 tb0scK+bSE5Pg8luCz7zI304d11fwMICpeGDWP9B4VweyqIka8oqpG/xWu8e/Ep18EOv
 yAP3AogiSqp2rv+0O7znp80J2ig4s5uw04Ti74wJUEflXBZgAOGVNZKEk5dcdkqojnw2
 wBOS7nw5kOv8f7GjblnxcYveYO9Mf2rQMcT/HImzS1bXSbw/nCGP4AJpqUcMU7lQm4FQ
 LdVg==
X-Gm-Message-State: APjAAAVH8XiMMUn6V9xj4aSuBhsXMbJqgKnLsM+AEgdwK0KBWA+eb6tn
 BaJiozto+sI4A4sm1OZqWMvGmw==
X-Google-Smtp-Source: APXvYqyM2GIMZHdRW2Vej8w2Qnki3iSJmX/UWdsxangnx58vkA5fuE9uxmqpw4Dve+DsdhaRBKYIww==
X-Received: by 2002:a17:90a:f0c8:: with SMTP id
 fa8mr13073809pjb.90.1574360337738; 
 Thu, 21 Nov 2019 10:18:57 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id k6sm4307272pfi.119.2019.11.21.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:18:57 -0800 (PST)
Date: Thu, 21 Nov 2019 10:18:57 -0800 (PST)
X-Google-Original-Date: Thu, 21 Nov 2019 10:00:12 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Fix Kconfig indentation
In-Reply-To: <20191120133703.11956-1-krzk@kernel.org>
To: krzk@kernel.org
Message-ID: <mhng-475ef954-a41d-40e1-b8d5-6fb091deab60@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_101902_642366_1CDE87B6 
X-CRM114-Status: GOOD (  12.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Nov 2019 05:37:03 PST (-0800), krzk@kernel.org wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/riscv/Kconfig.socs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 536c0ef4aee8..85199004c6ef 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -8,6 +8,6 @@ config SOC_SIFIVE
>         select CLK_SIFIVE_FU540_PRCI
>         select SIFIVE_PLIC
>         help
> -         This enables support for SiFive SoC platform hardware.
> +	 This enables support for SiFive SoC platform hardware.
>
>  endmenu

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
