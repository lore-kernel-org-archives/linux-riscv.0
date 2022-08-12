Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4C9C25B06
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 00:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JcajvOXaTDvjmetCaEqW6Cb/vw8BWxIauqOEBflAC/k=; b=laNFcVJuq98OIA
	1NMAxnjyEQNPd/JaMIwfCgrL0gcBpdM0Vjtm9A8MzpV9JEvzPAaVWIsuPRg4qpe68cCtIzPhm5ZKd
	lDZtBGzxULIxxrx2JsoBU2DQ0U2VrI1m1/H0PTy0akV2CpD+wt/+7Fik2ljbGr8kgvYZEcHg0cnXq
	anj/c9OFmjZjKG02435qlDiGHobLShLyBTEmWQhhloHXBIH6GIu/mDjbsPB7A6NpTvyyxA7biAMR3
	LgX7QlOzVCjyQhsnE4iDYfmDPOxFStWrDcE2z2X6M1S6bqOQwYibgLd3eLI3td0fMyTGGJMRypj4r
	+HgXtsp0irl8t1VG5Y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMITj-0079Em-UO; Fri, 12 Aug 2022 00:24:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMITh-0079As-RY
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 00:24:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 95859CE2447;
	Fri, 12 Aug 2022 00:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A572C433C1;
	Fri, 12 Aug 2022 00:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660263868;
	bh=jSbBZ0Um3c6l5fVvZPYJM7WFVQuWDzh3Hm8gumiscxQ=;
	h=Date:From:To:Cc:Subject:From;
	b=uBXZllIRbJGF1y7H/1xVyTdaDaeS8TU9muHOfVqcTS+NQNDXP8NkILGWPOpuwmKzl
	 /nT/cpaetvCbpbztlHdtYlfi8RneNemkUXB8R34wrekq29y4Bv1FRIxhcTuI9J5jG5
	 b1xAMrJqLMBRcsjiAxXZPApqTsp6auwNwCy6QLgbx+PzGs5TQ8Dw0Ab/zAUKge9nnf
	 RpHwUJCGRgyezZCTjkDOpAUoBNbkOsnd8Sxfjp2f8g7wpbE/tZwXJZbclpuA8JmfLV
	 aEmjeJX8dyLOrQATcSsUgG8bG88H6aYzUzpCpTGmi+FUdCum625Md0Umnkcf92eJjc
	 8CDasrstQfNBw==
Date: Thu, 11 Aug 2022 17:24:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	Anup Patel <anup@brainfault.org>, stable@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Apply f2928e224d85e7cc139009ab17cefdfec2df5d11 to 5.15 and 5.10?
Message-ID: <YvWduqRcPYhYZWMT@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_172442_113527_3E783F57 
X-CRM114-Status: GOOD (  10.06  )
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

Hi all,

Would it be reasonable to apply commit f2928e224d85 ("riscv: set default
pm_power_off to NULL") to 5.10 and 5.15? I see the following issue when
testing OpenSUSE's RISC-V configuration in QEMU and it is resolved with
that change.

Requesting system poweroff
[    4.497128][  T177] reboot: Power down
[   32.045207][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [init:177]
[   32.045785][    C0] Modules linked in:
[   32.046166][    C0] CPU: 0 PID: 177 Comm: init Not tainted 5.15.60-default #1 5b276f06901b1c37142db73337a1816290810c90
[   32.046814][    C0] Hardware name: riscv-virtio,qemu (DT)
[   32.047256][    C0] epc : default_power_off+0x1a/0x20
[   32.047667][    C0]  ra : machine_power_off+0x22/0x2a
[   32.047979][    C0] epc : ffffffff80004a4a ra : ffffffff80004abe sp : ffffffd000bc3d50
[   32.048405][    C0]  gp : ffffffff81bec160 tp : ffffffe002080000 t0 : ffffffff80490964
[   32.048827][    C0]  t1 : 0720072007200720 t2 : 50203a746f6f6265 s0 : ffffffd000bc3d60
[   32.049245][    C0]  s1 : 000000004321fedc a0 : 0000000000000004 a1 : ffffffff81b073c8
[   32.049676][    C0]  a2 : 0000000000000010 a3 : 00000000000000ab a4 : e0b1d187e51c7400
[   32.050115][    C0]  a5 : ffffffff80004a30 a6 : c0000000ffffdfff a7 : ffffffff804ea464
[   32.050555][    C0]  s2 : 0000000000000000 s3 : ffffffff81a20390 s4 : fffffffffee1dead
[   32.051009][    C0]  s5 : ffffffff81bee0c8 s6 : 0000003feff55a70 s7 : 0000002acc09bf08
[   32.051427][    C0]  s8 : 0000000000000001 s9 : 0000000000000000 s10: 0000002b0a4db6e0
[   32.051849][    C0]  s11: 0000000000000000 t3 : ffffffe001e2bf00 t4 : ffffffe001e2bf00
[   32.052274][    C0]  t5 : ffffffe001e2b000 t6 : ffffffd000bc3ac8
[   32.052604][    C0] status: 0000000000000120 badaddr: 0000000000000000 cause: 8000000000000005
qemu-system-riscv64: terminating on signal 15 from pid 2356237 (timeout)

I am not sure if there is any regression potential with that change,
hence this email. That change applies cleanly to both trees and I don't
see any additional problems from it.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
