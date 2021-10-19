Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2295C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 16:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 929CF61057
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 16:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 929CF61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2Z75G+5YqCysGddBUEXtCSCZBcoU3XqSIs6Se80nF8=; b=Dc4PAVxXt0FSZH
	81R0EbmdTtVSk/e0jhXfqXyFZlLoUfQsW9BZtoNMAbUNpTSs6Vc16GEXa1bgRw6h5PWoCdNu0zRYd
	rmaKib+7Fp4oIpxD2urP1PKTSEz+L4gVOMDgoiJzdA0yCmbOec9MMsNPcw5yQc4Ym9usSbEC7PYpN
	58XXEg47+fIS2/FABXMMCfSA+Q2JeoNS1uE/O24f8GhSXOpw3HzeYaT+58fQd0UzU30YVXzgcYreQ
	uxcKPP7uevGah7d3Epq6a//A5bmYA6A9F0HhcSdfiVX7mr91RxhMMWGsC6gOgqLVP+LoV8RNqcP2O
	BmnDrct0k5gdNA3tqHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcsMv-0023B7-OG; Tue, 19 Oct 2021 16:53:41 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcsMs-00237w-W4; Tue, 19 Oct 2021 16:53:40 +0000
Received: by mail-oi1-f173.google.com with SMTP id u69so5923564oie.3;
 Tue, 19 Oct 2021 09:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fnwMHmBtcUTzeN7AT8ukQSoNU1knCjzi3Fwq9Ac0g90=;
 b=vSw9iYla1VY++aehXqRlFaJo+UQwCrOwQkA3GkG8MCCFiV71clepo8Rhtrwzie4egS
 oO9AKfwJG8e/1YCS9rrkbjTeNgfuDvKhA/Q30Tj1K4qXqa1i4GMGpiQz7FkMs34keYwH
 WxlVhZO1fjw5ZSXHMPJDTKi/rLdZlvHoxOUwTqHyV0F/TQSzox2yBQfRbQyz/P1zV0JX
 ceLWAd93lrNsQE3OLkpbewJj6ULyOdJUF9B/scPmmixv1oNUFmZbqq/Zk3KjeO8M20FY
 PCVUQIrQ40tKuIrMwrSKGoEhnSj+4xXrv7+nK9gE4G8A+RITQNMX4bYv6f9xngMgJV2j
 HN0Q==
X-Gm-Message-State: AOAM531jDRpFeyUr76At97oBg1Qmkj6Af2KqDjOEzLdQQSUzbFfMVA1v
 zFEc+NcSEChQSFbrQC1vDQ==
X-Google-Smtp-Source: ABdhPJxG3M4MMDejwrse4k8mTAjT5I/40KR+eLLfq1+ZBF3yaKS308ugfGwsvK1xSATT6JQLbB2GBw==
X-Received: by 2002:a05:6808:1185:: with SMTP id
 j5mr5157383oil.16.1634662416108; 
 Tue, 19 Oct 2021 09:53:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l26sm3843004oti.45.2021.10.19.09.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:53:35 -0700 (PDT)
Received: (nullmailer pid 427792 invoked by uid 1000);
 Tue, 19 Oct 2021 16:53:33 -0000
Date: Tue, 19 Oct 2021 11:53:33 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>, 
 Rob Herring <robh+dt@kernel.org>, bpf@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, 
 Martin KaFai Lau <kafai@fb.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 kvm-riscv@lists.infradead.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, KP Singh <kpsingh@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, 
 Anup Patel <anup.patel@wdc.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Shuah Khan <shuah@kernel.org>, Colin Cross <ccross@android.com>,
 Alex Shi <alexs@kernel.org>, 
 Yonghong Song <yhs@fb.com>, Kees Cook <keescook@chromium.org>, 
 "J. Bruce Fields" <bfields@fieldses.org>, kvm@vger.kernel.org, 
 Alexander Viro <viro@zeniv.linux.org.uk>, sparmaintainer@unisys.com, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, 
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 00/23] Fix some issues at documentation
Message-ID: <YW74Dez4/3cIbe1Q@robh.at.kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_095339_045101_A742CBB5 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, 19 Oct 2021 09:03:59 +0100, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> This series is against today's next (next-20211019) and addresses missing
> links to Documentation/*.
> 
> The best would be to have the patches applied directly to the trees that
> contain the patches that moved/renamed files, and then apply the
> remaining ones either later during the merge window or just afterwards,
> whatever works best for you.
> 
> Regards,
> Mauro
> 
> Mauro Carvalho Chehab (23):
>   visorbus: fix a copyright symbol that was bad encoded
>   libbpf: update index.rst reference
>   docs: accounting: update delay-accounting.rst reference
>   MAINTAINERS: update arm,vic.yaml reference
>   MAINTAINERS: update aspeed,i2c.yaml reference
>   MAINTAINERS: update faraday,ftrtc010.yaml reference
>   MAINTAINERS: update ti,sci.yaml reference
>   MAINTAINERS: update intel,ixp46x-rng.yaml reference
>   MAINTAINERS: update nxp,imx8-jpeg.yaml reference
>   MAINTAINERS: update gemini.yaml reference
>   MAINTAINERS: update brcm,unimac-mdio.yaml reference
>   MAINTAINERS: update mtd-physmap.yaml reference

Applied patches 3-12.

>   Documentation: update vcpu-requests.rst reference
>   bpftool: update bpftool-cgroup.rst reference
>   docs: translations: zn_CN: irq-affinity.rst: add a missing extension
>   docs: translations: zh_CN: memory-hotplug.rst: fix a typo
>   docs: fs: locks.rst: update comment about mandatory file locking
>   fs: remove a comment pointing to the removed mandatory-locking file
>   Documentation/process: fix a cross reference
>   dt-bindings: mfd: update x-powers,axp152.yaml reference
>   regulator: dt-bindings: update samsung,s2mpa01.yaml reference
>   regulator: dt-bindings: update samsung,s5m8767.yaml reference
>   dt-bindings: reserved-memory: ramoops: update ramoops.yaml references

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
