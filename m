Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED0EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 16:21:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC9520720
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 16:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiOFsInq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC9520720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nrmHdomxGCTSNBjpCgoMfcz+K05QdApdwNFfCv9Emrw=; b=aiOFsInqct1tbNW1K+kxzGrpH
	cs0yvGS6IiEq5NSWaklv67GocTNfemhaWXqtMN0LkDI7z8OtZHwh/yB2YKwIRUriBTrwlubHz7VQS
	KrcHxAefLBAsskMlgOnedGYhT/6K2etljunoMKNTxFjw13jCGy9tD8PqagS6lIFl2HirUs6nTnWF2
	vR7oX0u678kUQdQCZWQ8oakMpqJak2BXG2dU7VoRH9a7jgD5he6lwcEEr+dk4X3fhoR/YYc9qwFZH
	8E/IAi/2GNtyw8p06KVm8iDTydJN6Yil3vr1avFCz9bKMozWVTiZ+oSH7s4n57SEIWTJrUGO1+fZ+
	Eky9U568w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1xo-0000cj-7x; Thu, 02 Jul 2020 16:21:28 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0jc-0005rW-OO
 for linux-riscv@lists.infradead.org; Thu, 02 Jul 2020 15:02:50 +0000
IronPort-SDR: Lw5grCmPtbzjAINkirGPXrNhkODMMtCJNZN3bR0gMiX6E1GAtFOY6TJXUbnYye2doLEMxzc11A
 c7ayh/R97ZHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="211966671"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="211966671"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:41 -0700
IronPort-SDR: W/iS25Y2HU7wr+H0UDFRVD3TdGcuFXMVpdLnjPeZ9a4kObj1kYA7x++obbTVf6rR1WgJA/yPNp
 LlVVPdTUSaZw==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="304275473"
Received: from nchava-mobl1.amr.corp.intel.com (HELO [10.252.135.144])
 ([10.252.135.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:40 -0700
Subject: Re: [PATCH] riscv: asm/gdb_xml.h: use __maybe_used to make W=1
 warnings go away
To: Vincent Chen <vincent.chen@sifive.com>
References: <20200701184751.84008-1-pierre-louis.bossart@linux.intel.com>
 <CABvJ_xhm9a0nzBJ2YKvwm5vKZt3Xp0H9z6QakD0EYK7vRR-_AA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f148580a-f97d-3416-ca03-c3a425189568@linux.intel.com>
Date: Thu, 2 Jul 2020 09:20:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABvJ_xhm9a0nzBJ2YKvwm5vKZt3Xp0H9z6QakD0EYK7vRR-_AA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_110244_983434_B534907E 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 kernel test robot <lkp@intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 7/1/20 9:04 PM, Vincent Chen wrote:
> On Thu, Jul 2, 2020 at 2:48 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> 0day/kbuild reports warnings with the ASoC codecs compiled with W=1.
>>
>> In file included from arch/riscv/include/asm/kgdb.h:109,
>>                   from include/linux/kgdb.h:20,
>>                   from include/linux/fb.h:5,
>>                   from include/drm/drm_crtc.h:31,
>>                   from sound/soc/codecs/hdmi-codec.c:19:
>>
>> arch/riscv/include/asm/gdb_xml.h:23:19: warning:
>> 'riscv_gdb_stub_cpuxml' defined but not used [-Wunused-const-variable=]
>>     23 | static const char riscv_gdb_stub_cpuxml[2048] =
>>        |                   ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/gdb_xml.h:16:19: warning:
>> 'riscv_gdb_stub_target_desc' defined but not used [-Wunused-const-variable=]
>>     16 | static const char riscv_gdb_stub_target_desc[256] =
>>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/gdb_xml.h:13:19: warning:
>> 'gdb_xfer_read_cpuxml' defined but not used [-Wunused-const-variable=]
>>     13 | static const char gdb_xfer_read_cpuxml[39] =
>>        |                   ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/gdb_xml.h:10:19: warning:
>> 'gdb_xfer_read_target' defined but not used [-Wunused-const-variable=]
>>     10 | static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
>>        |                   ^~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/gdb_xml.h:7:19: warning:
>> 'riscv_gdb_stub_feature' defined but not used [-Wunused-const-variable=]
>>      7 | static const char riscv_gdb_stub_feature[64] =
>>        |                   ^~~~~~~~~~~~~~~~~~~~~~
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>
>> I don't know if this is the right way of solving this issue but this
>> error is now consistently thrown in kbuild compile-test reports w/
>> W=1.
>>
> 
> Dear Pierre-Louis Bossart:
> Thanks for your modifications. I have fixed the warnings in my latest
> KGDB patchset and sent it out, but the merged KGDB patchset is not my
> latest version.
> I have sent a patch set to complement the missing ports, and I think
> these warnings would disappear after this patch has been accepted and
> merged.
> 
> Here is the patch to fix this warning:
> http://lists.infradead.org/pipermail/linux-riscv/2020-June/000660.html

Thank you Vincent, let's drop my hacky patch then.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
