Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20F3CF256C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS+8xbDSkM1zgRTsnC1WVrKA7x+HMO/NS7pldFx4qog=; b=MxHNkXSFkJYYx3
	fii437oB4/sjE9ah6FasQddKqUtX1Ul/3lUwbPxPJ0A2FKP17TiW/Lgsvurq+7c/X7UdWcbEHXKRf
	LHO26QIRfq5OTTXfVpBRq5vNc/edMZOAKuzQRs14y/0dAGRDdlQuD4I35/Hc+HjqQVC67lXoIi+cn
	YAz8wnZG8YLB1x02GTI5A9yYGnrOHUjKoGCl5NdjNJkDt8w0BA+mselnGFPGY982gPI76WeB+ZG1B
	0eiA03rwk09hTVKE0IcgF559Y4WaG9T3rTcsXSNFintiFXa+kji1VVrtD4UTbMTet9hHgQzwS3hd+
	UfLre3M8Hw31m6qLiPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYxK-00000001TXm-0bjG;
	Wed, 19 Nov 2025 03:34:06 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYxH-00000001TWm-3iyo
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 03:34:05 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-10 (Coremail) ; Wed, 19 Nov 2025 11:33:34 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Wed, 19 Nov 2025 11:33:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: "Paul Walmsley" <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, namcao@linutronix.de
Subject: Re: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when
 building with Clang
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
In-Reply-To: <20251119013808.GA1264583@ax162>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
 <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
 <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
 <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
 <20251119013808.GA1264583@ax162>
MIME-Version: 1.0
Message-ID: <38a6ea82.1e091.19a9a2cbe92.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowAAHseiPOh1p0P4CAA--.33415W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAULCWkdElSm5wABs5
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_193404_289949_C0BC90B7 
X-CRM114-Status: UNSURE (   5.35  )
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

Hi Nathan,

&gt; I spent some time today trying to minimize a small set of configurations
&gt; that triggers this issue on top of defconfig since that occasionally
&gt; reveals a path to head down for triage and I landed on:
&gt;   ...
Thank you for taking the time to minimize the configuration and
provide the detailed reproduction steps.

&gt; This appears to happen back to LLVM 15 so I am not sure it is a recent
&gt; recent regression on the toolchain side.
&gt; 
&gt; Without CONFIG_RELOCATABLE enabled, the test passes:
&gt; 
&gt;   [    1.049384] KTAP version 1
&gt;   [    1.049656] 1..1
&gt;   [    1.050246]     KTAP version 1
&gt;   [    1.050447]     # Subtest: kprobes_riscv
&gt;   [    1.050760]     # module: kprobes_riscv_kunit
&gt;   [    1.050867]     1..1
&gt;   [    1.061790]     ok 1 test_kprobe_riscv
&gt;   [    1.061929] ok 1 kprobes_riscv
&gt; 
&gt; Interestingly, if I enable CONFIG_RISCV_KPROBES_KUNIT as a module, I get
&gt; a failure when trying to load it in QEMU:
&gt; 
&gt;   ~ # modprobe kprobes_riscv_kunit
&gt;   [   42.214642] kprobes_riscv_kunit: The unexpected relocation type 'R_RISCV_ALIGN' from PC = 00000000abb84ce7
&gt;   [   42.222778] kprobes_riscv_kunit: The unexpected relocation type 'R_RISCV_ALIGN' from PC = 00000000abb84ce7
&gt;   modprobe: can't load module kprobes_riscv_kunit (kernel/arch/riscv/kernel/tests/kprobes/kprobes_riscv_kunit.ko): Invalid argument

This information is very useful for upstream triage and
confirms that the issue is configuration-dependent.

&gt; which is probably unrelated but I figured it was worth mentioning, as it
&gt; does not allow me to see if this has something to do with the flags
&gt; added to LDFLAGS_vmlinux.
&gt; 
&gt; Maybe this is useful for the upstream report and further triage.

I really appreciate your effort in providing this data;
it will definitely help with further analysis and reporting.

thanks,

- Jiakai
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
