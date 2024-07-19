Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EA3C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Cc:To:
	From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iycUb2EjaqVUE0nWsglBAxR376y+4q78cRowbJUMk2g=; b=DCZP7IkPfO4eqg
	VMAEvmdNANnlIGqw+O0qLvRxCWR8MXvmQm6YsJktpO2Ix+7N6iDkO80lWsEh95qJVRXPdHAG02xRc
	8sOsej2mznOwnCudgpmd2yynIsYtCtwYBeV6167CdZSvO6dhDDNC5ChoAnybdB2KNBhN4fKhJjBVA
	EYUNMdqrnR11UgNYLf5Yh/TF7Mj4mAVHPrTBTjqjC6enU3QJxtuaYvCgllOM0VSD8ILInlZmUiVOc
	HwjU3OxtUy9kYpu2WlvdGJptGO0iFNteJG9ZYdsvT8+UspNnDgaWW86N4BVCwqyK3H5MaBf17ryZH
	1h1s2NVxzFQm/is8tNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjKl-000000029gV-47uL;
	Fri, 19 Jul 2024 08:51:23 +0000
Received: from forward101d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjKh-000000029eS-1uJn
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:51:22 +0000
Received: from mail-nwsmtp-smtp-production-main-39.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4e22:0:640:3724:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id E30B0609A9;
	Fri, 19 Jul 2024 11:51:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 2pFgMY1On8c0-UCuAlS9V;
	Fri, 19 Jul 2024 11:51:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1721379068; bh=SLTEoIanWY5XtN1aVQbk85fIW9AXREmPvziMz0cN42g=;
	h=Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=ApOmpFlyHodXNs2nKBGExgy7/kJQW9Wd3Rc5Roy9paoG/0gRvV9XAMaOn2voIEjcW
	 Z1rYnyrSNXqtUYsTqbHoQyI0eYyVrnrHlOgpyn62SKe2W/p4lFvbDt8j9VS4oDGeFE
	 U9fpBiDEdnDcB2xuI1vzTBjqMSvpweEXfxfSgku4=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.klg.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <12bd744ea481c8a3505e6f4869d409d24d3db795.camel@maquefel.me>
Subject: Re: [PATCH] perf arch events: Fix duplicate RISC-V SBI firmware
 event name
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: eric.lin@sifive.com
Cc: acme@kernel.org, adrian.hunter@intel.com, 
 alexander.shishkin@linux.intel.com, aou@eecs.berkeley.edu,
 dminus@andestech.com,  inochiama@outlook.com, irogers@google.com,
 jisheng.teoh@starfivetech.com,  jolsa@kernel.org,
 kan.liang@linux.intel.com, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 locus84@andestech.com, mark.rutland@arm.com, mingo@redhat.com,
 n.shubin@yadro.com,  namhyung@kernel.org, palmer@dabbelt.com,
 peterlin@andestech.com,  peterz@infradead.org, samuel.holland@sifive.com
Date: Fri, 19 Jul 2024 11:51:06 +0300
In-Reply-To: <20240718152254.16007-1-eric.lin@sifive.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_015120_333417_1834FB88 
X-CRM114-Status: UNSURE (   2.99  )
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

Hi Eric,

Nice catch!

Shouldn't it fix every patch that copied affected 'firmware.json' by
the way ?

Something like:

Fixes: 8f0dcb4e7364 ("perf arch events: riscv sbi firmware std event
files")
Fixes: c4f769d4093d ("perf vendor events riscv: add Sifive U74 JSON
file")
Fixes: acbf6de674ef ("perf vendor events riscv: Add StarFive Dubhe-80
JSON file")
Fixes: 7340c6df49df ("perf vendor events riscv: add T-HEAD C9xx JSON
file")
Fixes: f5102e31c209 ("riscv: andes: Support specifying symbolic
firmware and hardware raw event")

Reviewed-by: Nikita Shubin <n.shubin@yadro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
