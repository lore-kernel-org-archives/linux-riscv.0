Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483D6C43219
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B406112D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12B406112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=er0Dc/geMCJNj0bisgapGP2JVfU7yYde4l9PGYYmn1Q=; b=22khKJiuJpSDZt
	F+3Cgo93WCD7aTtOfiDh5xMLtvgKHKHYfHdF5z4Tl2YVVdsHAFw9GLejZHYtAzASNZ1+FaPH4ezMO
	YvRCEjsimg8QjH73MfrXJWsdRFIQSEpU2OjsvTv3zkNgmVKrp6jg+U+F4nwMcbZwBZ+c4OIbRoNqy
	/qZSxh+czrbjrvJuEnHNd6Dd1POTbIPIm87D+VWmo2DoVjacDgvM7aAUzBHD4pXrzX3oHNkPqUDfF
	JzrNfuTZ+W4DKgYGBoN410G0Y2imEaYkAYsAMHcXZ7wXdEyKjfvgFnMvK2thv1rBEYbi48/pcylEo
	evPbnUCf2b19ENOHMuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mck6r-000UKO-Af; Tue, 19 Oct 2021 08:04:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mck6n-000UGI-2X; Tue, 19 Oct 2021 08:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E94EB61452;
 Tue, 19 Oct 2021 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634630668;
 bh=Uvci5l/z6Xl7igGPEJw1tvb5zXG8EEBvSjZvZQvPw7o=;
 h=From:To:Cc:Subject:Date:From;
 b=rpKkaVAryy3dOHI5Z0AVHWDGL+qYu3wofMEsdn+Pc8CjxVWvhXVazy7gZrKiPAaDD
 xNVXTC8q0dsZKNR3ih1oPwNBgr4zydsOmvnv3poIDksXNNKT3SfE6lRbc6lup8jshp
 UFeWO8R7fla6iyuPrQH95m37/OifKGJ7dEFFb9jjachmzIGkjNuxHpa2sx0ZtXdKS1
 AGVBuul1FLqAXwuvTgrPKfeB7WXkylEdnmiuXkM/w4yevSt2//z+WrduhEbO7W0aHm
 qsWGPEPZWnGjrqUdazSHMDIBy5fUq5IJo3r1SYMCGrtFiTcQmrOZ5eRKUX3tYFWXRU
 876wQqSSyZ5qw==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mck6j-001oIo-02; Tue, 19 Oct 2021 09:04:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, "J. Bruce Fields" <bfields@fieldses.org>,
 Alex Shi <alexs@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Anton Vorontsov <anton@enomsg.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Chen-Yu Tsai <wens@csie.org>, Colin Cross <ccross@android.com>,
 Jeff Layton <jlayton@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, Martin KaFai Lau <kafai@fb.com>,
 Rob Herring <robh+dt@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Song Liu <songliubraving@fb.com>, Tony Luck <tony.luck@intel.com>,
 Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 devicetree@vger.kernel.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 netdev@vger.kernel.org, sparmaintainer@unisys.com
Subject: [PATCH v3 00/23] Fix some issues at documentation
Date: Tue, 19 Oct 2021 09:03:59 +0100
Message-Id: <cover.1634630485.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_010429_170680_C6494D44 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Jon,

This series is against today's next (next-20211019) and addresses missing
links to Documentation/*.

The best would be to have the patches applied directly to the trees that
contain the patches that moved/renamed files, and then apply the
remaining ones either later during the merge window or just afterwards,
whatever works best for you.

Regards,
Mauro

Mauro Carvalho Chehab (23):
  visorbus: fix a copyright symbol that was bad encoded
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update gemini.yaml reference
  MAINTAINERS: update brcm,unimac-mdio.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  Documentation: update vcpu-requests.rst reference
  bpftool: update bpftool-cgroup.rst reference
  docs: translations: zn_CN: irq-affinity.rst: add a missing extension
  docs: translations: zh_CN: memory-hotplug.rst: fix a typo
  docs: fs: locks.rst: update comment about mandatory file locking
  fs: remove a comment pointing to the removed mandatory-locking file
  Documentation/process: fix a cross reference
  dt-bindings: mfd: update x-powers,axp152.yaml reference
  regulator: dt-bindings: update samsung,s2mpa01.yaml reference
  regulator: dt-bindings: update samsung,s5m8767.yaml reference
  dt-bindings: reserved-memory: ramoops: update ramoops.yaml references

 Documentation/admin-guide/ramoops.rst         |  2 +-
 Documentation/admin-guide/sysctl/kernel.rst   |  2 +-
 Documentation/bpf/index.rst                   |  2 +-
 .../devicetree/bindings/gpio/gpio-axp209.txt  |  2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml   |  2 +-
 .../bindings/regulator/samsung,s5m8767.yaml   |  2 +-
 Documentation/filesystems/locks.rst           | 17 +++++-----------
 Documentation/process/submitting-patches.rst  |  4 ++--
 .../zh_CN/core-api/irq/irq-affinity.rst       |  2 +-
 .../zh_CN/core-api/memory-hotplug.rst         |  2 +-
 MAINTAINERS                                   | 20 +++++++++----------
 arch/riscv/kvm/vcpu.c                         |  2 +-
 drivers/visorbus/visorbus_main.c              |  2 +-
 fs/locks.c                                    |  1 -
 .../selftests/bpf/test_bpftool_synctypes.py   |  2 +-
 15 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.31.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
