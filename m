Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8DFC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UojFx4FhUsTVTwstnsD3hnUYezCeqIJHCaoauKzJdWw=; b=j3qgwDSfE3dD7r
	QZYl3hdovKp847YJVSPmqcmf89FRgynaTQ79/UwOFrSgz8DBzQY2VjXcSrRrkQAzID+jXywvk0cPz
	B8HCVkKX/xQPPYKhC3KuBkTT1H7Ewk9STW1KklaMM9gGmdfq9UOmDrK3gtfGX78J1pRi0VaboesLn
	9b1o38GwTrpvjBRF93R+0fKGNVxk4vH7mFnMIJUjnCGTHBa/Bf8CsaYhJlIycBGi/wgbtViz8QLGs
	xB9dGVK0Gp/909b1kgCCmcmDukz7HEY7i2BulAi3tZ05vCasQCLeTIxjdMyMrSjBrgWt1OtcqHEln
	JNdfJoiOEj2dAs8J0DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoak-0000000CMUh-00l6;
	Thu, 13 Mar 2025 19:51:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoZ4-0000000CMNA-1o6C;
	Thu, 13 Mar 2025 19:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74C59A47128;
	Thu, 13 Mar 2025 19:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B689C4CEDD;
	Thu, 13 Mar 2025 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741895397;
	bh=1YzttVdgq5+u/AxQqAkYwqXrSltdtIta8g7Z1gi1D7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sULZwX4M9PKSa6466D2DlJy9Ip5EDhLUq3A+vikUkMXgbPAbUADuC0zYvMNa/J5hI
	 ANX71yDtpuvLBG1JLsO1eBBmLyNJ3QhMfPHYihDswsplsww5D8g/hRk9MVDJFruNDh
	 TKchTZNrBsyZPqoP+v73Ve816VsA3QcgpeTN61AjnsDTeAc03sbCicEmw/AGgfPeH6
	 bUWc7s2FFp1AItmGx9XZtnXchwZwzoN0TH2HTD/5gykb/kYMsr9bJHQa51u7BALMOG
	 UGHTFeUtqsvBkYBzCZ9+TmpBU4yRgh9YDAyj2Q0K0iUWpJdP8RkF1bAMB2FI5GveKm
	 OMlowBU3ZUT9g==
Date: Thu, 13 Mar 2025 16:49:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9M24AJzui9lFbGo@x1>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9KFLGpenwOP32q3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_124958_526969_B3DFF967 
X-CRM114-Status: GOOD (  19.44  )
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

On Thu, Mar 13, 2025 at 12:11:40AM -0700, Namhyung Kim wrote:
> On Fri, Mar 07, 2025 at 04:31:58PM -0800, Ian Rogers wrote:
> > This work builds on the clean up of system call tables and removal of
> > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > 
> > The system call table in perf trace is used to map system call numbers
> > to names and vice versa. Prior to these changes, a single table
> > matching the perf binary's build was present. The table would be
> > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > perf, the names and numbers wouldn't match.
> > 
> > Change the build so that a single system call file is built and the
> > potentially multiple tables are identifiable from the ELF machine type
> > of the process being examined. To determine the ELF machine type, the
> > executable's maps are searched and the associated DSOs ELF headers are
> > read. When this fails and when live, /proc/pid/exe's ELF header is
> > read. Fallback to using the perf's binary type when unknown.
> 
> Now it works well for me!

Its working for me on x86_64 as well, I'm doing some more tests, the
container builds and will do 32-bit tracing on 64-bit ARM (rpi5 aarch64)
and then report results here, should be later today as the default
kernel for the rpi5 doesn't come with CONFIG_FTRACE_SYSCALLS=y and BTF,
so building one with it.

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
