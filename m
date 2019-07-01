Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F72C06508
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 01:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AE62146E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 01:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qx0AnFZ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="RV7ivx/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97AE62146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PLgJgJEbmZxN3dWGDtZDATRhmtX8k62DkRuuoXfqdoU=; b=Qx0
	AnFZ8XHlsC02SIvU9JKRMyMbQFOS6JKpjmMvnIsu8Z8mkOSurFnCy6ezYMt88vD/1lDkZU+y5iczG
	UrCgTYuWAnBp+08eK3jKnT/nF5TDhlEcTaJ7VM6vyb3ZqE6MWbuMH6Scgb9vPt25jvDcPT4ihbpNl
	bhmI5ATcsMYtKgHJTAJY+IrGGlP/xZA1ysa3U5LISjpIGJk3S3dxZDFNQc9PFTGKl+K4xvM03FMHw
	eOL466M6KY4plaQUQCdWKHKk5zghLCMyrvO6IJxwwhEPS5wtLV9+YchAdSSuK37KAzkjMtEou0vVa
	wJnpslEw5bOVx7Cuov6TLOFMF2mC8Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhkhV-0006Ce-OZ; Mon, 01 Jul 2019 01:01:45 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhkgT-0005cQ-H0; Mon, 01 Jul 2019 01:00:43 +0000
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x610x4fr000634;
 Mon, 1 Jul 2019 09:59:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x610x4fr000634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561942746;
 bh=k6lypsY8EtklIWOXM9lo9DSpQkaOGO3EP2tLY2qrygs=;
 h=From:To:Cc:Subject:Date:From;
 b=RV7ivx/luT13tyKFQqp2bzeMpPuELrJCg9fzB9Izj3h9p/ZMwQ1dZT6LLW+TGOiia
 y7GXNUCQeMJvbLyYJp4c6896ESTp4uj92EuSL6k9rlafDuvM+I5/D/zuLKRV7aX5Mr
 hKleV/abWphBI55RVHfAyHVvem0AZalk/lBgfViVIVL2e3dI9lRxL0wq3+JfFGanC5
 mv6ZNUnGJUBGxfJbiLw9xV/uRqek9ZvLivUrGDZ0JN/YI/Bxjikn/ddnD2lc99zBwI
 nic+be8jWSUlygiFUgs6kWl8faUFT40BXRNmZSzifX/qacxH8tCcUgk4os320VPQke
 eIRoc/XiFB7og==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 0/7] Compile-test UAPI and kernel headers
Date: Mon,  1 Jul 2019 09:58:38 +0900
Message-Id: <20190701005845.12475-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190630_180041_815117_6FBC1E05 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Joel Fernandes <joel@joelfernandes.org>, linux-riscv@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>,
 xdp-newbies@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yhs@fb.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Colin Cross <ccross@android.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


1/7: add CONFIG_CC_CAN_LINK to use it in 2/7

2/7: Compile-test exported headers

3/7: Do not generate intermediate wrappers.
     This will avoid header search path issue.

4/7: maybe useful for 7/7 and in some other places.
     Add header-test-pattern-y syntax.

5/7: Minor cleanup of gen_kheaders.sh

6/7: Exclude all files without ".h" extension
     from the kheaders_data.tar.xz
     This will be needed by 7/7 because we need to
     exclude "*.h.s" from the archive

7/7: Compile-test kernel-space headers in include/.


Masahiro Yamada (7):
  init/Kconfig: add CONFIG_CC_CAN_LINK
  kbuild: compile-test exported headers to ensure they are
    self-contained
  kbuild: do not create wrappers for header-test-y
  kbuild: support header-test-pattern-y
  kheaders: remove meaningless -R option of 'ls'
  kheaders: include only headers into kheaders_data.tar.xz
  kbuild: compile-test kernel headers to ensure they are self-contained

 .gitignore                         |    1 -
 Documentation/dontdiff             |    1 -
 Documentation/kbuild/makefiles.txt |   13 +-
 Makefile                           |    4 +-
 include/Kbuild                     | 1253 ++++++++++++++++++++++++++++
 init/Kconfig                       |   24 +
 kernel/gen_kheaders.sh             |   51 +-
 net/bpfilter/Kconfig               |    2 +-
 scripts/Makefile.build             |   10 +-
 scripts/Makefile.lib               |   13 +-
 usr/.gitignore                     |    1 -
 usr/Makefile                       |    2 +
 usr/include/.gitignore             |    3 +
 usr/include/Makefile               |  131 +++
 14 files changed, 1462 insertions(+), 47 deletions(-)
 create mode 100644 include/Kbuild
 create mode 100644 usr/include/.gitignore
 create mode 100644 usr/include/Makefile

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
