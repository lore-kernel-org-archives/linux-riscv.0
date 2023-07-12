Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AABEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ScOnBWzcLpLig9vvJT4NF8wtKBmZHA+0cTHohl2Yq1U=; b=eweVHSHdBcpek7NqmQHSryZ6Qy
	qwPQWW5CMINRHc6DxL6CVnVmckEi+5uY7BolBoHll+50bsgHb25lo9iuPhXzES7sFqgJ+XorKWKf9
	YJcIbWBIt6XPKS18VQj4OTen++jyBZ2xFc1LQCAVAgHWqlQ2JyTblvlneHbIPbiE4e7wQIBDkpgYv
	oW0cgu7eitlpg/9f3l+UhOWEpAF7cNC0wRek77eso7o3MVj1A+kVHq5feXrVncrQPLFF3mSvZtxdh
	CRCYVn3eYLXmXLZ1ICis8CxBqjMD0wwtsmMvwO8q7RYF7ZsUpQ+ZLGrgBonCf5Yah5kHHQAaa061E
	1CFfvkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdZf-000kYa-2Q;
	Wed, 12 Jul 2023 17:24:23 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdZd-000kXC-1W
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:24:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso4366280b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689182658; x=1691774658;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj9r+zcbDtwWZpScqUWWZY37UBAV3EvkHsIWxXTh2EU=;
        b=05afwzcK01Ldqg48Wwl99KxL0uggHZTlAxOuDmXIXpXDPm5ZD5cnP2BAIHu0X4TY6K
         oUreX0ChkmOpRfIzzsSI8F8YtY7lwXmRIkLEcEpEgx71L9ZXiXQwPD/f5ucxjfs/avdy
         1SdPg78Lci8bpctcxwvfufhUbqIP0M+a58e+WxhdsE6yfBoLgh5YDK+jRxLkXCBJcL/C
         w2gq/fA5BzAt9BuX8PaT6zmupftBsl/RUnejt1hLNwd0LipYLTgd6Q5QXBaj+CcZcYm+
         q+2tZVH8oNpNdNaH87k8GEwS2BfZpRYm+H89cC2paekP0Ogp0u8FhvyqY/AVNuqeFscD
         I3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689182658; x=1691774658;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj9r+zcbDtwWZpScqUWWZY37UBAV3EvkHsIWxXTh2EU=;
        b=UgOz1szjzWhgyEU7WH7GpsB0G1C2GD4E8dodLX7HpoIG60q4XnhQy1h5ELug88ISDe
         O/vWnPZ/dMmMlrN7zGUusQ+nMlRTalUcbRhDMXg6/k2hzOxcAwIkvjkM84ylkMjMMALe
         E36+zZD0BRPBmOngQkiF4oI0xikIBJuwpgtbTgi2c4KHX5DUYCLROS4v/QTFqP9Pz/L5
         Q2r1N1Gx97LG5tkQ/0YeJvonfTZ4SkRL/p78s0Y8wcvIVtOJuipVM1zJQg91zkpZs8Od
         4CQdme0qyf3idyoKv4ffg3Q2FzECyC96XLFVBlf/VBTpsDFNAqOkj15FMuDuVy6gZlui
         BtcQ==
X-Gm-Message-State: ABy/qLZTa8zfLs53nU0kSQtIR/pAF+oqOn+y82MB3Jcbg28z0OHO8V5e
	ahnJ5RYfFIGanVRGJpHa1V+ovg==
X-Google-Smtp-Source: APBJJlGfntxMXTtDkx7Bn4N4jOt5DvKbonVj2bFELzDfkpVOdHpzwuoFw9cGAmCbAueVcO2TJG653A==
X-Received: by 2002:a05:6a00:22cd:b0:674:1dde:4c59 with SMTP id f13-20020a056a0022cd00b006741dde4c59mr17988747pfj.28.1689182658485;
        Wed, 12 Jul 2023 10:24:18 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id i8-20020aa79088000000b0065da94fe917sm3847989pfa.36.2023.07.12.10.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:24:18 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:24:18 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 10:23:32 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
In-Reply-To: <20230712-tilt-dinginess-c4fc0dee5d63@spud>
CC: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-53264d24-793d-4526-8574-49017c2c3bc1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_102421_509415_F6B71C78 
X-CRM114-Status: GOOD (  11.22  )
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

On Wed, 12 Jul 2023 10:22:09 PDT (-0700), Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 10:17:49AM -0700, Palmer Dabbelt wrote:
>
>> Do you want to re-spin the patch?  I can dig it out of the email if you
>> want, but looks like you've got the diff already...
>> 
>> No rush on my end, just LMK -- it'll be too late for this week either way.
>
> I wrote it at work, I'll be digging it out of my email too ;)
> I'll send it now before I get lost in my DT review queue.

Thanks, I'll forget about it for now ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
