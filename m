Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DDAC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 04:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb4GnPOLZk4FAuJh1s9mZEBzQbbpNeUTEFGY73+Lmlw=; b=wc9CGwi0nLGCf4
	RT4GGo6lV/jPmNWflOTzKa11hS4AWGtjITUsNlr9vPuTG/jUsB/PBvr/xzldYHlhtCIXT4tzIcFy1
	ikQoMWBdSYaDVhtsieIrvk5QCEnMvC3ZhBKQ02UneiJqjAiC8Uki2oL6UlKzcKx1O+lypGqfYyaJE
	29CveFQdcIA2W3L63CegE3jc0WdgCuENWdxJQBgTChDdm+janDEQpCv3YBuhYc2mazMd5aZDIgsIq
	i/Dwch1EvjoUFHBjpN7yxGXr3si/caeurk5G/Mj9P0wxYrJm1PuUUT4N2RC6JVjzule6ZfkLn6mjS
	KimiIxYRsFvh7o4RYnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pthoY-0006l0-20;
	Tue, 02 May 2023 04:40:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pthoX-0006kc-1E
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 04:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KMZkDj7VgOqodDQTf+RGZGFN4SlNg+bxklecIZiMapk=; b=GNo5RZPKCx5X+wucaKInsQNSNs
	YgQtoxHy6fsxYgwuS/D3jNEtf7OBklKW05W/kfUvvpkP3Dhjv91WJZ6UbgmFM1YbG+EBsu5jdTvtC
	SvYOa82UJtIMf3EOlGTlAfU8M3LtsUHKvXnniIyCLWXJQo3E3Q7bPppr1gRsmCMqJzvRiNEuO+evg
	Hz7m4uTnMvP0SHFyyfS9KSyCVRyW259TFi0BykDTTz1lPBvLh8OM8P5FXUME9LPi+qeXtXN31HX5Z
	vhXGqmo/r0TRvd5F+sb3dQ/XbTYKQ9wGlmYVZTvMPEMaq5EnsZPkcqEUgWCq+h9xSf303klEWisPm
	N009wq8Q==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcGT-00F2KL-2N
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:45:04 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso2310147b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981097; x=1685573097;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMZkDj7VgOqodDQTf+RGZGFN4SlNg+bxklecIZiMapk=;
        b=YVQSVHFU6drEqf6yR/m6JMlUICqGPz8mmUwFAW7FbfEsT+pckdZjnIMW+++g0P2j8R
         n5Yj9CkUumkqJTaLJ5tiHVoc8iI9hdW5eYb8Ku0ptL81OrvNGX0bbPSvCoB7PADM9mrB
         gPKhJYMq/6SHQj2OzLEa9XdWtDBFL+46S9VvC77QbLCrFHjh+VZkmE0SXcV09eKXiDRJ
         LyaeeiqGcZ40LIDdsv+taJZGzTshwahmdUcuJRWh5e07qzMu4FCbfaTqaN2n6fDkhHYd
         tQqEV4+HkkcJtnsZyGoIvbzxztoPOtI8LTX7JYgjexux+X8jgo/GI9v3Csqgs8GlT2NQ
         NORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981097; x=1685573097;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMZkDj7VgOqodDQTf+RGZGFN4SlNg+bxklecIZiMapk=;
        b=OOJOr8jxODO5m1ZvQCWCp/W0soW5wQH1MccH5qDT2RL7s6qebWQgehyIUAixaGWghf
         HFjTuxbi5dZeGWPT52LKHvm3QHDdZxaQEzFOn0iFWh8GGxi05NrRqUA6tGPgxkrZjA9x
         J4hvTu0vktSSQ2ldVsFLR5f9kkXdQQOpi3H9kCQp76+OJIEJ0R9vlhBVbTm7EWzboH1o
         9I7VFmVMxP/dh8ZLVJmZ+tkP1cZ+kneZ+b9fi1B5yT2jbdKtn7YJ/oCrTG1NgcLdUU0J
         BV7YYtuDec69+kBJ3jyaNo3TkqcX/RB04LRnj21fHPOyO8Sn+y+bfalbRxtkjlD9brf2
         fe9w==
X-Gm-Message-State: AC+VfDzVqkmRXFDRYo5LPIsqhAh3TPKtFJzbGji903/lNvbgNPIXrG0+
	s0rQAXxigGu4s4hEnwSOy3IANCF+dv/TQVog+Qc=
X-Google-Smtp-Source: ACHHUZ4jrHnaq1MA5auC9NOYzdlhP/SacF2pM/8Y8Ooc2TkJgP5bZP9Y0KpXdSnHIjCvNRn2dfaARw==
X-Received: by 2002:a05:6a00:1706:b0:63b:7bc7:8049 with SMTP id h6-20020a056a00170600b0063b7bc78049mr23109268pfc.2.1682981097274;
        Mon, 01 May 2023 15:44:57 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20206232pfh.117.2023.05.01.15.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:44:56 -0700 (PDT)
In-Reply-To: <20230330064321.1008373-1-jeeheng.sia@starfivetech.com>
References: <20230330064321.1008373-1-jeeheng.sia@starfivetech.com>
Subject: Re: [PATCH v8 0/4] RISC-V Hibernation Support
Message-Id: <168298107607.32296.5646151276592938501.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Sia Jee Heng <jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234502_270051_52C43E41 
X-CRM114-Status: GOOD (  11.30  )
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


On Thu, 30 Mar 2023 14:43:17 +0800, Sia Jee Heng wrote:
> This series adds RISC-V Hibernation/suspend to disk support.
> Low level Arch functions were created to support hibernation.
> swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> cpu state onto the stack, then calling swsusp_save() to save the memory
> image.
> 
> Arch specific hibernation header is implemented and is utilized by the
> arch_hibernation_header_restore() and arch_hibernation_header_save()
> functions. The arch specific hibernation header consists of satp, hartid,
> and the cpu_resume address. The kernel built version is also need to be
> saved into the hibernation image header to making sure only the same
> kernel is restore when resume.
> 
> [...]

Applied, thanks!

[1/4] RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public function
      https://git.kernel.org/palmer/c/0def12f32129
[2/4] RISC-V: Factor out common code of __cpu_resume_enter()
      https://git.kernel.org/palmer/c/fcb89863d1b7
[3/4] RISC-V: mm: Enable huge page support to kernel_page_present() function
      https://git.kernel.org/palmer/c/a15c90b67a66
[4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
      https://git.kernel.org/palmer/c/c0317210012e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
