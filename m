Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7BCC48BD9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 16:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE93208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 16:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQQfKN5G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="LHdsJdpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE93208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3i/llx3RzQpwBO6cfvexcRWX757S5hWuqrJ9VTk+ofQ=; b=mQQ
	fKN5GEOposhOUT2WMmM5wn+lcFgr0TOFu87SPgyBEyjDKznxokFWRCiLSkSHl0ZBwRMwmGZJ1wv9s
	zhYkNWzhy8/4gVhj0waB4c3aR3UIXbz2ryfTkeNenbrfdHWTXcTpqMyd3WVzTpUgxJLg66AqUlNDa
	3l/viSUwNQQ8geCoKhBqQA/e2YmupQP5CDxtnKlTfS5LV3mFdZ+v2kwkuAcn00fI0hqKQgjEA4bMi
	NHUIIhMQ1FCKbczrHqNBcVRinnLPRXCfdIFCrXcX73OJTfLfowhY8GqyNPEMk70IhDhIIl5Ljonwc
	W9zCWpBFhXA3gsfkNmSQFoMlj4wfy/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgXSb-0003os-B3; Thu, 27 Jun 2019 16:41:21 +0000
Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgXRl-0003Dp-9G; Thu, 27 Jun 2019 16:40:31 +0000
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id x5RGdDPu001384;
 Fri, 28 Jun 2019 01:39:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5RGdDPu001384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561653555;
 bh=gmui0wDo25dBFORH/YJIka6km4EHEw6EORwEfx2o9yQ=;
 h=From:To:Cc:Subject:Date:From;
 b=LHdsJdpohHEYXa83KNz44gcdbSGWwuH8/i52iXtlPRu1GaI0q1AIx+uhiZPjHD+z5
 DuAejfYBz1ERCd2/UEO+AX31hXfRB+q54megCy3CibiEP6HvQxVWjnWOs45HCaF/1v
 svegg5xjoWH1Nyji+k19J2kFhp8cBCa3WLF4tFizjrni8vK+F5L1uhpXRV3iLegiR5
 10g+kzx64nxuVStvUP5W0JRs+1HhG7fKuerU2btKzoJvU2KSNdGHewmxZAQ7sXFeN6
 9Ka0JHlHITKQRFO42QeQ+Z1F0cFcDwb6auRWANJTCWTkPeJI9xac1Jcl7bd/3v1Z3B
 JmLIbr58SXI/Q==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/4] Compile-test UAPI and kernel headers
Date: Fri, 28 Jun 2019 01:38:58 +0900
Message-Id: <20190627163903.28398-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_094029_785397_56C5CB6D 
X-CRM114-Status: UNSURE (   7.20  )
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
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Kees Cook <keescook@chromium.org>, xdp-newbies@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 Yonghong Song <yhs@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
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

1/4: Compile-test exported headers (reworked in v2)

2/4: fix a flaw I noticed when I was working on this series.
     Avoid generating intermediate wrappers.

3/4: maybe useful for 4/4 and in some other places.
     Add header-test-pattern-y syntax.

4/4: Compile-test kernel-space headers in include/.
     v2: compile as many headers as possible.
     v3: exclude more headers causing build errors


Masahiro Yamada (4):
  kbuild: compile-test UAPI headers to ensure they are self-contained
  kbuild: do not create wrappers for header-test-y
  kbuild: support header-test-pattern-y
  kbuild: compile-test kernel headers to ensure they are self-contained

 .gitignore                         |    1 -
 Documentation/dontdiff             |    1 -
 Documentation/kbuild/makefiles.txt |   13 +-
 Makefile                           |    4 +-
 include/Kbuild                     | 1250 ++++++++++++++++++++++++++++
 init/Kconfig                       |   22 +
 scripts/Makefile.build             |   10 +-
 scripts/Makefile.lib               |   13 +-
 scripts/cc-system-headers.sh       |    8 +
 usr/.gitignore                     |    1 -
 usr/Makefile                       |    2 +
 usr/include/.gitignore             |    3 +
 usr/include/Makefile               |  134 +++
 13 files changed, 1449 insertions(+), 13 deletions(-)
 create mode 100644 include/Kbuild
 create mode 100755 scripts/cc-system-headers.sh
 create mode 100644 usr/include/.gitignore
 create mode 100644 usr/include/Makefile

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
