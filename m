Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC49C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=atLZiaJvKm76EdsEauUx9uJK/tEuOxd3fdtWVZqB7PI=; b=wIs97SKxI7+t9ZzWUjARy+6U6g
	Uo+YXkX3dMlMTQ1u8aPSRizWYhvKp8GJ2kkYT63Avlf51RrZQtqhcHnzMDg2rOVyiVkVbAea+Zju6
	uxpsGlg2TPD8oz/G9TdW2F9Juxc9CFiqrQnW6uSI380/4FRfFxT9BpW8rKKful0uFwIV6/wKMD6ty
	zla1TATEmIhJjOvtIIzcVlOe0OUWU4FrbVPi28yTY/XGcilaoAlE+mDLgDfTjIHMcsoZgO3Lc20Gl
	P1Q3WPFmVcvjDwdSJTEtY6bKXWwgAONKTzZTktFrdeMm2jQdJKePFIYcBwtOddzQLTRoJZSeHgs3k
	mRN6NqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGSD-00EZWt-08; Mon, 06 Mar 2023 19:25:01 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGLc-00EWs2-G1
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:18:18 +0000
Received: by mail-pj1-f53.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso9689274pjs.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678130287;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlfUVnMpAeqg74Kjt8UEOETBGNFFbOVFaXPZinB2uzA=;
        b=t5crri0WcTaC4dbDeFT8B1Wf41RotuxLDoQ4au4TS14bhzVMaHsw9aHDiNZ/QgfigO
         pIri5VdgzvPiiJjI1Fi6ly7z7LM/WBF4IOflr++3YI+qk3fjdDueo9IiFarU45YM93jy
         InVglw2HcfH0SVosPwcOZVudDiaF8aEsAty9SKv60VRlOJ6dbXxRUnEfnuwuksQRL+oH
         MjCDHAW0mtGh5caILOuIvpWpotLpNMICgWII/CmspOGryPGZRcLIX7VDlhmcKqnho09M
         v3nqHeyXn7TJizhYBWel17Os2plRYUMcAagxx2fq7Xno7HV5B6AU7E+r1P+9n6NyddI7
         /lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130287;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlfUVnMpAeqg74Kjt8UEOETBGNFFbOVFaXPZinB2uzA=;
        b=RCAgiamN8XWaoQ9Xmef+FrZUmf8PDTU/6131s0txW4hpHfbrF3Sngd36QmzsBMYl9M
         Olxcn0KCpcC87nf7+kOJzjwGDRNOoRSgIS2Q942ccwF8XgVvuOAH8OrZLky42ujqfXY9
         lGYl3o1LULf+TdcfoQ9jVRFF2qhIRzbu7WSBzOfKmnD6/hiTE04ZQUZzQCTEQIirgub2
         E/FpcBmg8SJA6qZqPZAy1xgelAoQQVeIfL9oMpK0PEvuUUwNgPynFnmYXlCF6ys6HlKG
         LcmzEy9BS7IASF75bg2Nqugm8sz5JW6vVemQEGBCBPr6v9TX5wW3AGgH/1u4aWMVx5MG
         TLMw==
X-Gm-Message-State: AO0yUKXmMD/kdNaxU+KWNAipEUVxT4PXfNwqjCi9CUww7eLoYsC5ybue
	RPPLxn1A1bjAJmTDgUT1MkIiTg==
X-Google-Smtp-Source: AK7set+iNoJZ2cxy5qRgIoHSJ0YdyIfw0jMkr21udOVpB5izRmx1RUdTQKZ9Owwbph8LjbeyohY5Ag==
X-Received: by 2002:a05:6a20:5483:b0:cc:50de:a2be with SMTP id i3-20020a056a20548300b000cc50dea2bemr13625900pzk.14.1678130287404;
        Mon, 06 Mar 2023 11:18:07 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm6782709pfo.179.2023.03.06.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:18:06 -0800 (PST)
Date: Mon, 06 Mar 2023 11:18:06 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 11:17:18 PST (-0800)
Subject: Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: miguel.ojeda.sandonis@gmail.com
Message-ID: <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_111812_635037_E7B78BE0 
X-CRM114-Status: GOOD (  15.78  )
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

On Sat, 25 Feb 2023 00:37:29 PST (-0800), miguel.ojeda.sandonis@gmail.com wrote:
> On Sat, Feb 25, 2023 at 12:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> Works for me.
>>
>> I've got a few other things in the pipeline for this merge window so
>> this probably won't make it, but I'll dig in after that.  We've got a
>> bunch of Rust-types floating around Rivos as well, so with any luck
>> someone else will have some time to poke around.  Having a full cycle in
>> linux-next is probably the right way to go for this sort of thing
>> anyway, as it's likely to shake out some long-tail issues.
>
> Thanks a lot! That would be great.
>
> At least from our side, no rush. In fact, we are letting users (or
> arch maintainers) to request/submit the architectures themselves as
> they need/want them.

It's time for the next release.  IIUC there were some authorship issues 
here, did you guys want to re-spin this with those sorted out?  I can 
give it a shot if you want, but I'm probably as likely to screw it up as 
anyone else...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
