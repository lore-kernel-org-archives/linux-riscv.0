Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE5DCFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 20:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxmdV7+ec7w+cQlsycbsAS4LSVlIGIWHdrEbbHAKXQQ=; b=gGT2Wge2+gfv2N
	RNjfB4ZzPb7cKT6y+u1hFsQcFtLw5QmEndmR3CDgkLRYeqa2WPLn1S7KhdO8qYtx8aKArVHAVzwTl
	fZrQy0ByXbgjj7ULW6n/7xT3uzUWmdD0p0ohDfNgeXVH/Aai5jUgU2L/WMZKjhHIiSzyw9kjFdwcB
	U6XhGSXHrhBFf2mTSksqcmwMxk4hgVH5keFIrG0WjljhOwBGjwym9++2dVDz5cCGgsje4WHOsN00b
	6dtIQbW9/cLEaflTxbbTJrivytp83tn/N9Y2A6E9QZqN/MyM5CJLyOqdusMp7LHRoddwWsntDmc1R
	r79lPv73jOc3euRxp8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOj4x-0000000HDO1-0mv7;
	Thu, 27 Nov 2025 20:59:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOj4v-0000000HDNg-09a7
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 20:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B990143F9E;
	Thu, 27 Nov 2025 20:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AA7C116D0;
	Thu, 27 Nov 2025 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764277138;
	bh=8qXLl43reLBtbzmBTNWDE4MJUHwA1dop+9l0UdnkVco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TiT4YQsyCoy8TZK8P1AxQqBRVTpAC53msertu5McSZHEDZ+3VVMob5QbHkcereSMU
	 6z+Mufs6hvu9uXPi3bm6N4n2vfE/J4xr2vDzL1WfIF9NvgnbYPhxQpGa7mhSsdKVLG
	 wXz8c7zmgLC1yMP9i6eEkGYHPRKpMpTC//WFqvwaMANny7hZKYPIO+XWIEmD0ebTIX
	 6oVKqFEK6OnJ9fH/PRC3WymYtvoYC2+VH7oY9D8HD5NNC0arGENMdy3g782MTRqxxJ
	 vtdDfIsxccJsUtXaFy/olLDKq2Ffd7BwrMaojntz325AzhCfMh1BXCKCsh5EeMkxyI
	 0mbg0bhdKQWjw==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Eric Lin <eric.lin@sifive.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
 Longbin Li <looong.bin@gmail.com>
In-Reply-To: <20251014014830.613399-1-inochiama@gmail.com>
References: <20251014014830.613399-1-inochiama@gmail.com>
Subject: Re: [PATCH v2] perf vendor events riscv: add T-HEAD C920V2 JSON
 support
Message-Id: <176427713670.3725736.11717672882692868206.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 12:58:56 -0800
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_125901_100056_05411AB2 
X-CRM114-Status: UNSURE (   6.22  )
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

On Tue, 14 Oct 2025 09:48:29 +0800, Inochi Amaoto wrote:
> T-HEAD C920 has a V2 iteration, which supports Sscompmf. The V2
> iteration supports the same perf events as V1.
> 
> Reuse T-HEAD c900-legacy JSON file for T-HEAD C920V2.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
