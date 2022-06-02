Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6214C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P6hAdE28H5v32wbbD6ojKOiQnfG13bi8bkZl/mjHuHY=; b=FxKCfkhtYJtqewW+kUsJfAyC9k
	k69aRworFxO05v+UGdk/jnB06sSjNBmdEiRSCir3AwwNViY5U22pUQSaZD9PWmzqx70LrxIIBX69J
	rM3Y84Ce0iUn+XRN6Hq05+tAgofBaqT9Tl0vluCKeHQ7CWzAyrGIpm0yu6xHH9LwNNOjUY4qMw1sQ
	gfjUjH5huLhJ4V+dct9ljaxmPsd9jDMAsJaUR61JWpFnD250/adnX7zQMWRh3VierpL8HYVM4Cdpf
	fysAc/fLh+74/IBuG+6Stjl7/6AQbJMewnLpFzJRELAfwKcwSbxYWNwu2HofR7Ksclx6tttfA2J+2
	/i3r4SBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpn-001Zlw-7W; Thu, 02 Jun 2022 05:57:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpk-001ZjF-NU
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:57:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id y189so3857628pfy.10
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 22:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=VFWeG644WShe6PAr0++BRYn8vwLeuQyjnw1rk2Dl1AE=;
        b=hfczKw6u5Btpk32HLuwq4DKU+M8kfeFqX2j1vX6AHZuFsGTQrJsSE3UQXD3fD29WfL
         zBCATyY9a9SY9g9FfcojlOgJ8stUsONu8AVgKIzmOHPYOvUEuQaiqM4Ae98E1rV8ny8P
         P5Xf3WWpF0HrHEYDfcZz6OhypzAg9gfb696QsA7jdXmcJHOcc84GM8rTZTT2+/mzKtFv
         oNVgfNo+xaf1EBMuu0rabG+N3k+OijR5bbzJYRHY5DpZluS/lTVGCyyGYgkHnVxLABod
         Y0ynwuZ60piT+R1oD+sVtz8qimgMLwCusYHA0ffT3TFHWiZCmsjU94Zq8DpXeUy5YoW2
         DNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=VFWeG644WShe6PAr0++BRYn8vwLeuQyjnw1rk2Dl1AE=;
        b=EoNmfSjg2Hz9JMVRj8hPVjtQo0238Ns0Ey+/59KB6mwxHADL32GlCYqgM8PdzQIaGV
         qt+0KyUanQi1rEZeyTRNdjnftFv3KJJHvjY+4JLUo8cWr+6OnqPHZ6mmQB103QsdgloJ
         0SwiHElwlmHzolC4HSfUA/uMPjenFN7IyE3zQvlRQn06vIb43qYBqTs+nMDOROFahllO
         iEgKwSpmu43zyQAWfcRgwF7gJrj+3DbmJmiO02vKWu1N1t/8VG2U50ze/EB+YAMKadPt
         ly6VcujH/GyTGze/5rxw7W3GqxRv/O8blIe1jWXZtqkmUVHwoS+zwT/ZBrybPTF3EM9M
         DCpA==
X-Gm-Message-State: AOAM5304QzNJuMdgDT/Ns8OIqva+Umi6FIC/oWNTn19pcCvQA3rEh9kY
	2npZaawkabhuulOqBCjBUJ72Yg==
X-Google-Smtp-Source: ABdhPJz/kyWYFoe1u7JVPf4ygsdjVGUNEco+49t39KDhgK0h2ZMyf+r/hpu+i4F1V0IeR/2iqD34Ug==
X-Received: by 2002:a63:28c:0:b0:3c1:6f72:7288 with SMTP id 134-20020a63028c000000b003c16f727288mr2775117pgc.564.1654149441686;
        Wed, 01 Jun 2022 22:57:21 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id gq20-20020a17090b105400b001e26da0d28csm2343380pjb.32.2022.06.01.22.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 22:57:21 -0700 (PDT)
Date: Wed, 01 Jun 2022 22:57:21 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 21:50:23 PDT (-0700)
Subject: Re: [PATCH] riscv: Wire up memfd_secret in UAPI header
In-Reply-To: <20220505084611.tut66faep5r37r6c@distanz.ch>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rppt@kernel.org,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch, tklauser@distanz.ch
Message-ID: <mhng-671a8d6b-c318-431b-b209-c6bde465a420@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_225724_799569_25959C3A 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, 05 May 2022 01:46:11 PDT (-0700), tklauser@distanz.ch wrote:
> On 2022-05-05 at 10:18:15 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
>> Move the __ARCH_WANT_MEMFD_SECRET define added in commit 7bb7f2ac24a0
>> ("arch, mm: wire up memfd_secret system call where relevant") to
>> <uapi/asm/unistd.h> so __NR_memfd_secret is defined when including
>> <unistd.h> in userspace.
>>
>> This allows the memds_secret selftest to pass on riscv.
>                   ^- this should say memfd_secret
>
> I can fix it up in a v2 if needed.

No big deal, I don't mind squashing stuff like that.  This is on 
for-next (no fixes, I'm still on 5.19).  I added

Fixes: 7bb7f2ac24a0 ("arch, mm: wire up memfd_secret system call where relevant")
Cc: stable@vger.kernel.org

but LMK if you think that's wrong for some reason.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
