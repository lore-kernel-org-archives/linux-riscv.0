Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7B1C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 18:48:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F94820760
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 18:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1KxVn9Hv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F94820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ss+7NmrBxPXpekrvtY0pdZo+15eZmW2vmRl67Aq7gE8=; b=1KxVn9HvlKo8IxIQbPTtTN7YXc
	rNUlraYhsZ9uricf17ZMCA2W/cOhvv1Yo5as9QYhWEe6FN6esS/tM0U/smTBy/VVOmw1AVTNT8XFO
	24rP0DY8SOGfokBbFXr/enIX3+cE6k2+7NPi/qy5MUBXQoTAfkUKKcahnZpVzP599qBFQ7mI8yDvJ
	BcVxVtC4LV0+Ah0CWI/rq2neDXJN5HVYSTqeI8Bv/jdccnZPXyG5Hbrt58CwtHRBlSJMuNa2T3PHj
	w9hUTns3x07T/WrsOZWfCTIWaZsHw7jtnoGEpupqyONeqjSUEiuQSo1kjYLCBWEZaA3NzJpWiBoUn
	nFycfnNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqhmV-0001Tj-T9; Wed, 01 Jul 2020 18:48:27 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqhmT-0001RD-UX
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 18:48:26 +0000
IronPort-SDR: tZMA8DT7/q1Rk0vy5Bp2o67EG6kIBpehwuIL5pWI/kRJKkBqqCC/D0LDDH/IinkgbOrgo4Ab+n
 qD0MMnSzvMSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="126774298"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="126774298"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:48:23 -0700
IronPort-SDR: aSOCtV9x7MtfgKy7FttALCYlGfxY+1d1G77RWRwld9EfTil8Yrcw78qevyCTXLpqDqAXgeckqj
 Ms7uQDMvClWQ==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455207787"
Received: from sawhitac-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.111.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:48:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] riscv: asm/gdb_xml.h: use __maybe_used to make W=1 warnings
 go away
Date: Wed,  1 Jul 2020 13:47:49 -0500
Message-Id: <20200701184751.84008-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_144826_157052_0B1CD60D 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>, broonie@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

0day/kbuild reports warnings with the ASoC codecs compiled with W=1.

In file included from arch/riscv/include/asm/kgdb.h:109,
                 from include/linux/kgdb.h:20,
                 from include/linux/fb.h:5,
                 from include/drm/drm_crtc.h:31,
                 from sound/soc/codecs/hdmi-codec.c:19:

arch/riscv/include/asm/gdb_xml.h:23:19: warning:
'riscv_gdb_stub_cpuxml' defined but not used [-Wunused-const-variable=]
   23 | static const char riscv_gdb_stub_cpuxml[2048] =
      |                   ^~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:16:19: warning:
'riscv_gdb_stub_target_desc' defined but not used [-Wunused-const-variable=]
   16 | static const char riscv_gdb_stub_target_desc[256] =
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:13:19: warning:
'gdb_xfer_read_cpuxml' defined but not used [-Wunused-const-variable=]
   13 | static const char gdb_xfer_read_cpuxml[39] =
      |                   ^~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:10:19: warning:
'gdb_xfer_read_target' defined but not used [-Wunused-const-variable=]
   10 | static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
      |                   ^~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:7:19: warning:
'riscv_gdb_stub_feature' defined but not used [-Wunused-const-variable=]
    7 | static const char riscv_gdb_stub_feature[64] =
      |                   ^~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

I don't know if this is the right way of solving this issue but this
error is now consistently thrown in kbuild compile-test reports w/
W=1.

 arch/riscv/include/asm/gdb_xml.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
index 041b45f5b997..c28fc1a1d230 100644
--- a/arch/riscv/include/asm/gdb_xml.h
+++ b/arch/riscv/include/asm/gdb_xml.h
@@ -4,23 +4,23 @@
 #define __ASM_GDB_XML_H_
 
 #define kgdb_arch_gdb_stub_feature riscv_gdb_stub_feature
-static const char riscv_gdb_stub_feature[64] =
+static __maybe_unused const char riscv_gdb_stub_feature[64] =
 			"PacketSize=800;qXfer:features:read+;";
 
-static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
+static __maybe_unused const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
 
 #ifdef CONFIG_64BIT
-static const char gdb_xfer_read_cpuxml[39] =
+static __maybe_unused const char gdb_xfer_read_cpuxml[39] =
 			"qXfer:features:read:riscv-64bit-cpu.xml";
 
-static const char riscv_gdb_stub_target_desc[256] =
+static __maybe_unused const char riscv_gdb_stub_target_desc[256] =
 "l<?xml version=\"1.0\"?>"
 "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
 "<target>"
 "<xi:include href=\"riscv-64bit-cpu.xml\"/>"
 "</target>";
 
-static const char riscv_gdb_stub_cpuxml[2048] =
+static __maybe_unused const char riscv_gdb_stub_cpuxml[2048] =
 "l<?xml version=\"1.0\"?>"
 "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
 "<feature name=\"org.gnu.gdb.riscv.cpu\">"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
