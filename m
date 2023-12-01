Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC8AC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vHP9mXyHbnMp5agJ7FtnQIqaGzhN8Fh1bLMBdTqfyG8=; b=cTK
	f2FYRjzEn4CLGbqYQRxczUklriY2KjpRyYRkv/n5l1ybFkOSosF/BFdTXPeWkqBQTbIgAI8JtbWgU
	XoHwQgz/ONqyfEgCoJjHYDsVQxFPKBfzqox7xJq25PtsNsJAjA8E33T/O8b3rQy4sFKw+vtkkDKqO
	1YENmvpI+PotckemNQA/ywIfCdz7/n5Pd/VrbkqE9OJXYYawC7fc4/Z1r3FI9J3bcG6appKGnDfVZ
	zupFmRyJLI83myXSQEWGM0CyJWS9Z769BvobpsHTQi8lw0VFKmirPtb9igOWK10KXK+RAMNgA+dGa
	v8BgpM9XKMW12YXTfAia131fgz3Qc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r98WF-00ESRT-3C;
	Fri, 01 Dec 2023 18:45:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r98WD-00ESR3-1T
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 18:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7A6A61B18
	for <linux-riscv@lists.infradead.org>; Fri,  1 Dec 2023 18:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C84C433CB
	for <linux-riscv@lists.infradead.org>; Fri,  1 Dec 2023 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701456340;
	bh=xsaxZc0KDMl85GF4GH4Yoo9cd+8f9Y9i3cFqKb8mFrs=;
	h=From:Date:Subject:To:From;
	b=bIHd+PIqaCH3KnUpbCBl/xHTAwBfq3OB/8Wc2UWOxQV8/2xeJC82EkJCqh7CYKH8t
	 0Ybt0MpspXxSmiuCr9e4/4s0X29us2ApQCYm/6pAMjvk7SB9YRp44m3yY0pdvuQLkC
	 vf2uzSTHbXQFd2C/uWcd/Ai3HfmD6Do2cLqb0jnPXokNuG7xqEGgzrKQPnRQEkto7N
	 D/c8zI9hCLWeTRb28aj7GSHQzUEO2nJWU67EVxKZzixRqvYqSFRo88h6Pt/CzS+SoI
	 4EHXQ04WtNPmH2GKrKcrHyRWl6ieQGeIyy31PK8w3Nd8SxTMCXA9wQZWv/0VdmjWNP
	 84UiccT5y1i+Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9d2ca9a96so24380241fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 10:45:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzzBnhWLXLHFohlAXZz+kKDSeE/uTvHrq2JB5kmH3yN5NBCqw5Z
	4kxeyySQYqHOI9apAMYCR9Ho/9OMdygBDj7sBS0=
X-Google-Smtp-Source: AGHT+IHHFfIYdRRF3S+2hYnc2dtPmvnqPIpc7Viu8sxWAf3ai/PBrkpJwU71/1qcoEyLerTrOY63GOqIszZqwTdZN6E=
X-Received: by 2002:a2e:8185:0:b0:2c9:bc36:89c4 with SMTP id
 e5-20020a2e8185000000b002c9bc3689c4mr1232506ljg.0.1701456338890; Fri, 01 Dec
 2023 10:45:38 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Dec 2023 03:45:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATt_56mO2Le4v4EnPnAfd3gC8S_Sm5-GCsfa=qXy=8Lrg@mail.gmail.com>
Message-ID: <CAK7LNATt_56mO2Le4v4EnPnAfd3gC8S_Sm5-GCsfa=qXy=8Lrg@mail.gmail.com>
Subject: Question about BUILTIN_DTB support in RISCV
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_104541_533943_0F6103C2 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Hi.

I have a question about CONFIG_BUILTIN_DTB for riscv.

Please see this commit history.


[1]
2d2682512f0faf4d09a696184bf3c0bb6838baca
added built-in DTB support, attempting
to include multiple DTB into vmlinux
by using SOC_BUILTIN_DTB_DECLARE() macro.


[2]
d5805af9fe9ffe4a9d975e9bc39496f57a161076
pointed out that choosing the correct DTB
is impossible. It fell back to the single
built-in DTB support, like other architectures.

[3]
0ddd7eaffa644baa78e247bbd220ab7195b1eed6
added BUILTIN_DTB support for sifive and microchip,
while apparently multiple DTBs are embedded into vmlinux.



So, how does it work?


With
CONFIG_ARCH_MICROCHIP_POLARFIRE=y
CONFIG_ARCH_SIFIVE=y
CONFIG_BUILTIN_DTB=y

7 DTB files are embedded in vmlinux.


masahiro@zoe:~/ref/linux(master)$ riscv64-linux-gnu-nm -n vmlinux |
grep -A15 dtb_start
ffffffff82112620 D __dtb_start
ffffffff82115a2c D __dtb_mpfs_icicle_kit_end
ffffffff82115a40 D __dtb_mpfs_m100pfsevp_begin
ffffffff82118b3b D __dtb_mpfs_m100pfsevp_end
ffffffff82118b40 D __dtb_mpfs_polarberry_begin
ffffffff8211b9c2 D __dtb_mpfs_polarberry_end
ffffffff8211b9e0 D __dtb_mpfs_sev_kit_begin
ffffffff8211e7bb D __dtb_mpfs_sev_kit_end
ffffffff8211e7c0 D __dtb_mpfs_tysom_m_begin
ffffffff8212162e D __dtb_mpfs_tysom_m_end
ffffffff82121640 D __dtb_hifive_unleashed_a00_begin
ffffffff821236af D __dtb_hifive_unleashed_a00_end
ffffffff821236c0 D __dtb_hifive_unmatched_a00_begin
ffffffff8212621b D __dtb_hifive_unmatched_a00_end
ffffffff82126220 D __dtb_end


In my understanding, the first one
(mpfs-icicle-kit.dtb) is always used.

You cannot use the other 6 DTBs.
Am I missing something?



arch/riscv64/boot/dts/canaan/Makefile
is correct because only one DTB is embedded
if CONFIG_ARCH_CANAAN_K210_DTB_SOURCE contains
a single word.



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
