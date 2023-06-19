Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB86EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/MBy84406MzPIxdKf23OXpraOcei9ZJSyCS41RNwoMY=; b=NcroAoorMJFbQ/2Sstdv4wqNjm
	+nARWModVIJXqQQhCSvLwS50wUBQgd3HTgeGHODmmdggyRh0SyRNM6X0GsMrDFFgSDtVpgZFDyF7T
	sgeS4wI2c7ou8HH2sWoxDRMpj+wBa3T6z7BZ5QjjbZYNbfS0mbH21w4L6UOV2yAgBNRMiejikGIXp
	XgA6sLDbV+csvAEzTCd2CDqGHgBRYjKb8xpFPFnohlvcN6X1MAJCty0pb4kzugPVgKTGcHDfdC3nW
	w+nrNmPKIerG1c7Oav0Hzgkc6EcX2Pa7YVdFxSHnJhMYhjx9FBaEqNYOY7BhYVr+PCMz6YQS4WBaC
	1S8JDliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBN1B-009ZVN-2n;
	Mon, 19 Jun 2023 22:06:37 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBN17-009ZUg-24
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 22:06:35 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-463992996d2so1278913e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687212391; x=1689804391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epHaUjkubRomEjpu/oKPC+kOjwKS/BUbVDRooU3Z4so=;
        b=Clc4AYB6+dKRBg/IDg+ygozDHkBJRNn61FpjM6RVMm18cdgtaWY0cX5rcr9WOoyL5f
         m7u70nYbAuk2kaAZCxpqaLxARlP2YJoS64wUCYS+vmIGiqgwXTBcSll6d9X/2eD/SOng
         bnvSuhu3b16BWuqmdkF7tHs0c3d9r0mv4QvUGsldx7qxTme7ArCAoNuiCIBOokrzdVRE
         epGhqtrFxDpd0gMY9anaTfl+z9wKFgnv3qJSw5Snx0PtIhSGlt/z5JfEPVnEFHlTZ2gR
         oME2kHMtBN2/kFhbqPIZph5uY1swSYpVqA1TrM1J6JuowBy2eLA6cv0zprikuBxbJBIP
         JgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687212391; x=1689804391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epHaUjkubRomEjpu/oKPC+kOjwKS/BUbVDRooU3Z4so=;
        b=JY+t4J03kUprahxJiFUqahJBUn1yANXgV3T4JruZuF4fzJjkSgpFYAssH1ZnsPOQHq
         OHznXUfMwu/c13UFvATfTicLy+5PTHChp8Cd1j6o/exJlBuvJWMB7I9J32PockuH+6K8
         gA+xtsvm13bW+ykzRDwlbl2gF9g1OqbseeXW1oA/o+TG7hanzdc0xBiuMQkJpMFXqW75
         HWp5D/yDiLJMrvS+BdhQImRLKvPOlAcs07pNOaIUS5CuoE1Fn9V3lEY/7OnpC2jpgV+k
         wam9DPaGpbWHdy+kUE2D+i2hmU/uCdqpdzAKYIggCd4aioa7NqZyO1QumnkKZpSusvt6
         neSA==
X-Gm-Message-State: AC+VfDx3MwZPZkOAl7ZBymSQdVczABKDRbB3lNMN0TGjxkKodHbi8Svm
	vD62Vfbco2XRozf+6b0gE/S3NA==
X-Google-Smtp-Source: ACHHUZ7DIN/jiAGa9oBPkCoLh+LmqcRVR1Lpn9QSUwCOEnPyWLgfT+5eGZP6x9+3N0protXz72Kx0w==
X-Received: by 2002:a1f:3d11:0:b0:465:fa30:d633 with SMTP id k17-20020a1f3d11000000b00465fa30d633mr2844926vka.0.1687212391496;
        Mon, 19 Jun 2023 15:06:31 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g7-20020a635207000000b00528db73ed70sm165781pgb.3.2023.06.19.15.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 15:06:30 -0700 (PDT)
Date: Mon, 19 Jun 2023 15:06:30 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 15:06:25 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org, llvm@lists.linux.dev
Message-ID: <mhng-57559277-afaa-4a85-a3ad-b9be6dba737f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_150633_910898_FD86B58C 
X-CRM114-Status: GOOD (  25.68  )
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

On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
>>
>> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
>>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
>>> > When trying to run linux with various opensource riscv core on
>>> > resource limited FPGA platforms, for example, those FPGAs with less
>>> > than 16MB SDRAM, I want to save mem as much as possible. One of the
>>> > major technologies is kernel size optimizations, I found that riscv
>>> > does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
>>> > passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
>>> > --gc-sections flag to the linker.
>>> >
>>> > This not only benefits my case on FPGA but also benefits defconfigs.
>>> > Here are some notable improvements from enabling this with defconfigs:
>>> >
>>> > nommu_k210_defconfig:
>>> >    text    data     bss     dec     hex
>>> > 1112009  410288   59837 1582134  182436     before
>>> >  962838  376656   51285 1390779  1538bb     after
>>> >
>>> > rv32_defconfig:
>>> >    text    data     bss     dec     hex
>>> > 8804455 2816544  290577 11911576 b5c198     before
>>> > 8692295 2779872  288977 11761144 b375f8     after
>>> >
>>> > defconfig:
>>> >    text    data     bss     dec     hex
>>> > 9438267 3391332  485333 13314932 cb2b74     before
>>> > 9285914 3350052  483349 13119315 c82f53     after
>>> >
>>> > patch1 and patch2 are clean ups.
>>> > patch3 fixes a typo.
>>> > patch4 finally enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.
>>> >
>>> > NOTE: Zhangjin Wu firstly sent out a patch to enable dead code
>>> > elimination for riscv several months ago, I didn't notice it until
>>> > yesterday. Although it missed some preparations and some sections's
>>> > keeping, he is the first person to enable this feature for riscv. To
>>> > ease merging, this series take his patch into my entire series and
>>> > makes patch4 authored by him after getting his ack to reflect
>>> > the above fact.
>>> >
>>> > Since v1:
>>> >   - collect Reviewed-by, Tested-by tag
>>> >   - Make patch4 authored by Zhangjin Wu, add my co-developed-by tag
>>> >
>>> > Jisheng Zhang (3):
>>> >   riscv: move options to keep entries sorted
>>> >   riscv: vmlinux-xip.lds.S: remove .alternative section
>>> >   vmlinux.lds.h: use correct .init.data.* section name
>>> >
>>> > Zhangjin Wu (1):
>>> >   riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>>> >
>>> >  arch/riscv/Kconfig                  |  13 +-
>>> >  arch/riscv/kernel/vmlinux-xip.lds.S |   6 -
>>> >  arch/riscv/kernel/vmlinux.lds.S     |   6 +-
>>> >  include/asm-generic/vmlinux.lds.h   |   2 +-
>>> >  4 files changed, 11 insertions(+), 16 deletions(-)
>>>
>>> Do you have a base commit for this?  It's not applying to 6.4-rc1 and the
>>> patchwork bot couldn't find one either.
>>
>> Hi Palmer,
>>
>> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
>> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
>> series is based on 6.4-rc2.
>
> Thanks.

Sorry to be so slow here, but I think this is causing LLD to hang on 
allmodconfig.  I'm still getting to the bottom of it, there's a few 
other things I have in flight still.

>
>>
>> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
