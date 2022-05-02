Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8D6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtipYUq5KQifSeZgpwne8FFHdNFQNW7qxm/K+FkQrVw=; b=noryF5Xbd/s1js
	mg0gchuiA73v01lsCFeB0Kss9mFpx36N6xtf4M0SVd5z8z6nFBT3NK4yZuWJ/DhHfKgIVAIrGtkda
	QW7puaY28LmWGfr3Gj6t8HCKgJx2IN53nRniIozOypMpKNCRZMgllZxbrSfxSvLvdXeRRZmdoJIfW
	E5UPSAx3ExGrha22Gg5v22YCKhpzsYneQchVck5KBYs12L64oDEJE9MLlh/xzf0Yed2HtiD48lFfu
	wejLSa1wSHHRsl2pzUcGbOfAWQuyqRK0YjgLwC+6cuI8YzR7WaRkGtOdxEraZOVAz26dyn5WP4G2S
	raxDzxXJKodHPzDCFxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVd2-001CDv-Tg; Mon, 02 May 2022 12:58:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVd0-001C8J-2d
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 12:58:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1313665wme.4
 for <linux-riscv@lists.infradead.org>; Mon, 02 May 2022 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/oxxwZu+bujgmZ0WqvFB4CIjaE6g3QCDr/7SdNoyaHk=;
 b=VvfStjBWybuvJaTN7Q8kOcgNpUxyufiIHFyNjfyXIGTH0wmMPUtG6wA2D/WD1T3wS7
 PnNLVyDdFX93ywHIFEOYEFqAVmySXl2SicG5lP8zzRnzcEFPbE+sGbqrBZVGiDRIvVZo
 WXX5RWlY8YXWUM7+CKw4UQtgzaN6V6SbDqAD2sMTNGNnbJ3s1UzEtEhR9yp7EVTM+Qaa
 THsM71bj6I6HzVC68+K/ZRa1WpD9AmEcMnhETCtv3m5/ZJVTkww/vIQMrGvdWhuzB75s
 bnplIlemCILH8LHmD5hDyro52c2bUJotB5VzXFIK/2OJ2hPCfn/Pr+wjHz3fC/daceMG
 yleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/oxxwZu+bujgmZ0WqvFB4CIjaE6g3QCDr/7SdNoyaHk=;
 b=Qw7CUOL3rwSrIx/ImhxBhXlrnIc9tccWFHGaoXXdBvjjIdL60bMSIrzfoYYSmOvaBR
 pCfM9QBGaRqsP+78kBEcHrjv3vnGJGVcE1TX5ryoqK6HUJEVjdKw7c0SHmVNBOEWDVIq
 5reN176DuZcvjhkoEiGDhVb0TJni9vkkO+qUpz/IbdLiR7i3jjv8JR1sL/2PqfF7Ut4S
 5z/WJuVAL9txNB8eGdsh5T71fH9h7MVCYcd0wO+COIfRbka6KMtUx80c15EbypWOYc4y
 NiTVf1mgNg9OwLsu90xv/j3H5hl2dbz+l0jnDqRNkWMPOi8hklYUngjdE8CVRHqlWRgf
 vy6A==
X-Gm-Message-State: AOAM532OvuCbKIZqwMxAtlZU0R1sqifaSkn9JDcY+yvcJrTqxBq7z0VF
 wFT2AQBBWeWknb6G1guP13Q9K4guUhm/iPcNAGnjNw==
X-Google-Smtp-Source: ABdhPJxnolsj9BVAydioN0xjjlxrG0HC8ksApATCHpDRdJuKFrryI9K0ei6M60/rOuukgzpIp0AWFp/U7X+73SpDaFQ=
X-Received: by 2002:a7b:c190:0:b0:394:116d:5e0b with SMTP id
 y16-20020a7bc190000000b00394116d5e0bmr14726680wmi.108.1651496266692; Mon, 02
 May 2022 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220502125015.1345312-1-niklas.cassel@wdc.com>
 <20220502125015.1345312-2-niklas.cassel@wdc.com>
In-Reply-To: <20220502125015.1345312-2-niklas.cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 May 2022 18:27:34 +0530
Message-ID: <CAAhSdy3wKn1FoKyq+O_n_iWXSLxq_EZXrxTD99fb+ABFfKc0NA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add mmu-type riscv,sv57
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_055814_147083_18AF33A1 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, May 2, 2022 at 6:20 PM Niklas Cassel <niklas.cassel@wdc.com> wrote:
>
> sv57 is defined in the RISC-V Privileged Specification document.
>
> Additionally, commit 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
> changed the default MMU mode to sv57, if supported by current hardware.
>
> Add riscv,sv57 to the list of valid mmu-type values.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Acked-by: Rob Herring <robh@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..3100fa233ca4 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -61,6 +61,7 @@ properties:
>        - riscv,sv32
>        - riscv,sv39
>        - riscv,sv48
> +      - riscv,sv57
>        - riscv,none
>
>    riscv,isa:
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
