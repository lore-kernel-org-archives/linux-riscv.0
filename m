Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F4CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S58dfaj9JsxX2fIKemgGHqeK16FfUcLmDXXG2dgxb18=; b=RZPnxH8Y76sJxn
	2FyWRBoiZkzip9MACPEPRoG/9nssEgCuqeR1qqbWkxONqDFACSIMLXNkNrFLRKA10XsGlms1OiMjh
	qXKa8vFb+Ev88condjycrhtZnYpgMvScpGpH8yT0pFQ6iKKZPGE6+ELSxdVeFdIUmOlMpBIuyhfY9
	EBfGdHAyvP8S4y1WDddbNB061PbOupvXPTkM6ITvSTZ9+wkn1soouLKa1La8Vs1gS+oY0gRA6Qel3
	9tBVol8N//bkm7ZWlHa+7q3g/MJZafAdal6DUMDe5vsN/zWmI2Hz4KSJjAu/QnUr1fMEP9ojOrJZ6
	Pp0y33l2OefhfXOBvpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWPO-00FnZ4-UX; Fri, 25 Nov 2022 10:58:15 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWJP-00Fhz2-JI
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:52:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id vp12so8166249ejc.8
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 02:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fud1H9vvbIEqPXGteAFL1sMqIMKt+68zGcESyvCiI/M=;
        b=iBGeECdnnmjRGSrtK0BG888XfLpJQoy37P8qu0dK7MXCjPnIEVTd7KlEaOOSvkLRGN
         kFAaGPSHQug6sGbcYfqe0RJlwQMt3+XcQHCTdvcTKLA/krmvCR5CQYNH2jEiUzMDttZH
         JRDa1FaNIFANQI2mKG8lQbj6WNNJgHQyX8vvNJ9StxqDlcia5LinZ0ax51Vw5mTH+cD5
         N5S3sCT/lLtmN5pNfg+N4OXVHuwphgqY8skM/fI+mwfro4xc+5mcul91Ux8bL8AuKsz3
         YngXDKZPjbxqF9hn917Cj7hZjz4lsUFQ61yXo21qKcPZamBy+dPRtpGATkbDoqDXjXRB
         miwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fud1H9vvbIEqPXGteAFL1sMqIMKt+68zGcESyvCiI/M=;
        b=qROKjExqcuP0D988UYzQ+lUrIB1Rg7e1dUgzak2yoavmIDe4j5GO8jMysJC4T1zIgx
         mUt07sjqMmYRq70ftn9Wgp9vOzpW3fJfysgvkBNy5geCgxKpllNbaDBrb5T9kP1kzv75
         aZb7ScYpmljX3Bvm05lEqd2Wm/UkMMdPEBsuVUpc0Z8zUjD20/73/QYPphGu2ZH+4sNC
         1WnujhswBhtFQz5VSCraRxA/z4k8gTkG0Ond5+9rs5kh8NsP5jz6O069RUxdlwiBljwB
         v1Dq5V0eBJ12NsU2jet4/xcZKdi7kDI+3H/KVrOrEcsJ66T2781450TA/Nih0SO44yKl
         PLNw==
X-Gm-Message-State: ANoB5pn423DoYuhCReDux1jPVkD8/BA7URtghEVUuZaj4xP/PpIS+2ze
	oezmEcIwWmhKl1codE1akpQO6dPqf1VuAp7S/P8=
X-Google-Smtp-Source: AA0mqf4jnZPyve2IIDg4v48Q9ACVWtHs2u+FvXIyh1nLI+gqZesKRIEyJ8mKN5TZUc79ySLQawRJMPh6FXYTrmAjLvg=
X-Received: by 2002:a17:906:ccd0:b0:7ad:db82:d073 with SMTP id
 ot16-20020a170906ccd000b007addb82d073mr19858052ejb.480.1669373519614; Fri, 25
 Nov 2022 02:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWbunjdFo5YfQ2t4DSDm-LX8WhvLkzAogGrOg7HY4_uPw@mail.gmail.com>
In-Reply-To: <CAMuHMdWbunjdFo5YfQ2t4DSDm-LX8WhvLkzAogGrOg7HY4_uPw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 10:51:33 +0000
Message-ID: <CA+V-a8to-Wr2x8qbxnktTzXrWjTGvtCqwXT27A8EmHTTG7Lbkg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_025203_690304_58AA7363 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Geert,

On Fri, Nov 25, 2022 at 9:04 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Nov 24, 2022 at 6:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > Due to the above approach custom SBI calls have been implemented. The
> > above implementation is in preparation for adding support for Renesas
> > RZ/Five SoC which uses the AX45MP core. As with the above approach the
> > kernel image might not be generic so that it can be used on other
>
> might be generic?
>
Oops I missed updating this part of the cover letter. Indeed it should
be generic now.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
