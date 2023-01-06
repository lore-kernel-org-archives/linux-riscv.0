Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B868C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9bcc283iIQJ/F+WLh9sbrecYN9IlGx8yQYphbSDE50Q=; b=cstQQ0oBGy5BIJ4/NH/OSOrLTI
	P971XZSztzO/lWUmnqDzlDfO94FVbJtDnPMwh76FfxcvSWmK19zBHRnkg70xz/vb0CvshngmxMoFd
	B79tgRr3V+gCFVfSF3FtuxXMoBKTcrZRXF5f9ZhxIvmuWjoDL8ZcRP8Kre5/ACDk4d0U6oaphq4tf
	THUO3YYG0ba9kaEGfLmUDKnxj7M+ivSHQSoZjliV4ASwG2RgGEn+blxpwE8lRns8pJ6H4rMY54nLc
	Rx2zP6ANsENPiXUWUw0ENn63zvOSALbv/qqkg++9gzZDqDQ/MuTDvtoTDH7v+7bojod9bf+rRYz3L
	W9x87ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrRa-00EMS7-Qb; Fri, 06 Jan 2023 18:27:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrRY-00EMQs-75
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:27:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so6118308pjb.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmLntltvaFSn7Veu63eW90yAOw0MaICZcm5KPVBm5q0=;
        b=Nr4kJ40YcqDfsKaUZ0YQwjQt+oUhlKaj7wrZU+FbgBRK+rHM2gR59ezPl+jDTnrd7N
         d14inXDd/GtOfntsdQGOFiETBXi0NtPbEN6PhQTZ/SmB6/akAjPMNB1kOEsZ3LKCYSeL
         3utYn4aCVg/eFs1xvGv0ei2SmqWSiJT2FgeAHtk7pyatwvO8Uzsc6/bmZdmfsz3ShXs6
         EkU/W8NTtoIkcC8FUxKEa1/PLoiWbDgO4oyYF1HDbrls2e0y5e4yMwqNUrvyYhkb5Kxl
         yLGqRZoNFHHjvCNDfgZdA+9IfG7/8u7Rw0Ecy6jIeMkOo7aYK24Yyi6xB7MMgXsIl4RU
         A2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmLntltvaFSn7Veu63eW90yAOw0MaICZcm5KPVBm5q0=;
        b=QgA/RPeF5Md0rHokvCPL4BsF2hzmAbHZCS6jITwHLFrIM7bwH3Z42Fd5TjNC08AfSk
         vt45WSfeWvVIxxM9kS5/OhIYf0XsGoOTa2YW4Srl5Lit1ksGzr9NQPW0isRU0yzpXqDI
         LRYtxKzmNTLtf7nqmoHBq4fhQCu5D12F8V6zMrDQsIKKxpkk4Pl2ilGCpziuNHsAADL5
         Wu6+n5koOvWRNxodHic/UrLJiTS5T6rUS0/GdDE+S/K+5P2RyL7gIQM/1E9UTcDFl1uO
         lMwVCdMJto2ZFYtRRPt9ijzkdW928eyKuu6MBN5Kver7q6zZIIRjU6Ege3mZqqgpc6lg
         Y2/w==
X-Gm-Message-State: AFqh2kp3rX6wyh2uI9WBUMvjEx4ft2Kz/21PrPEyQifT/BCIDRd9V3wF
	tfnhUEkVANzvx8zfmdH51BXgsLPssdH/ljVo
X-Google-Smtp-Source: AMrXdXs27suwfr9jMMc5hET4poLfufr4skSeto59CNAGRWkccUXezkYj6qZh3nG8wWM9skVoBh9qvg==
X-Received: by 2002:a17:903:251:b0:192:9369:b2fe with SMTP id j17-20020a170903025100b001929369b2femr35212915plh.38.1673029668806;
        Fri, 06 Jan 2023 10:27:48 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902d48100b00189c9f7fac1sm1291845plg.62.2023.01.06.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:27:48 -0800 (PST)
Date: Fri, 06 Jan 2023 10:27:48 -0800 (PST)
X-Google-Original-Date: Fri, 06 Jan 2023 10:27:46 PST (-0800)
Subject: Re: [PATCH v3 0/2] riscv,isa fixups
In-Reply-To: <20221205174459.60195-1-conor@kernel.org>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  jrtc27@jrtc27.com, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  heiko@sntech.de, ajones@ventanamicro.com, guoren@kernel.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-e3f1a8a9-2d89-4331-bb8a-b798af0cb277@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_102752_520852_CD327CB1 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, 05 Dec 2022 09:44:58 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> I noticed ~today~ while looking at the isa manual that I had not
> accounted for another couple of edge cases with my regex. As before, I
> think attempting to validate the canonical order for multiletter stuff
> makes no sense - but we should totally try to avoid false-positives for
> combinations that are known to be valid.
>
> All I've changed for v2 was collecting tags & adding in the missing
> commit reference that Heiko pointed out.
>
> v3 fixes an issue Jess spotted - it's *any* multi-letter extension that
> can come immediately after the single-letter ones, not just ones
> starting with Z.
>
> @Palmer, either you can take this once the DT folks have ACKed it if you
> like, or I will take onto some v6.2-rcN fixes branch. I don't think that
> there is any urgency :)

Sorry I missed these.  

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

We can just do a shared tag if you have stuff that depends on them?  
That'll let me keep fixes clean, as I'm running the DT stuff too now.  
Though maybe it doesn't matter so much because I'm not really taking any 
DT stuff.

> Thanks,
> Conor.
>
> CC: Jessica Clarke <jrtc27@jrtc27.com>
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Heiko Stuebner <heiko@sntech.de>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Guo Ren <guoren@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>
> Conor Dooley (2):
>   dt-bindings: riscv: fix underscore requirement for multi-letter
>     extensions
>   dt-bindings: riscv: fix single letter canonical order
>
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
