Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE486606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g78z33ev;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=Xg/3Scjl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lfMlCeEOux6WJAOgukyvEnhlcMXjgYNOjYjim/c4Tn8=; b=g78z33evoXdOAbxAxEpbaoiPQE
	/nejHvkYajmEiFnRN2eDbUfeCpbsiSpr4iUWH2Em/gnxD1VggPnk4qmzC0lrgFayYMKE25zGs46AP
	1f7kg22VTuGew5ZrGjCdv5bb+ijmDhKCWfHhfShKPXymptr3nk6CQh1xFcLh+5LFxgTGJFn5LTLV2
	PBWganybYy4HBlRPeiyZEuu7Rxy8pPWGcBN+glMVSejuUVNbVf+nzbFnQW3wYtU3wK1YhgSFEhJmM
	zp5XuqZ8O24exqDHcei+sYrdjKQr/0YOa4LkoCQVWyC/wqmUlaiv0MnM6/FbgCnLi/MhTwGDcLXY/
	9pnWF0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1o-0000000GsEM-0m85;
	Fri, 27 Nov 2026 15:38:24 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1g-0000000Gs9x-2qQS;
	Fri, 27 Nov 2026 15:38:18 +0000
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 6FD05A041A;
	Fri, 27 Nov 2026 15:38:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id BB51F20030;
	Fri, 27 Nov 2026 15:37:57 +0000 (UTC)
Date: Fri, 27 Nov 2026 10:37:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Ian Rogers <irogers@google.com>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 jpoimboe@kernel.org, peterz@infradead.org, mingo@redhat.com,
 tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 acme@kernel.org, namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, bpf@vger.kernel.org, nathan@kernel.org,
 llvm@lists.linux.dev, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org, ardb@kernel.org,
 linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org,
 kvmarm@lists.linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 indu.bhagat@oracle.com, jremus@linux.ibm.com, wnliu@google.com,
 dylanbhatch@google.com
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for
 user and kernel space
Message-ID: <20261127103756.4ce1989b@gandalf.local.home>
In-Reply-To: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
References: <20261125061523.1540234-1-irogers@google.com>
	<DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
	<20261125132225.00254c37@gandalf.local.home>
	<CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BB51F20030
X-Stat-Signature: wrsqnz8uj45at8ncwo3okdibrged3eg3
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/dy2vpicCHk2iAQD+WW3qcRkxd14MkZ4s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=gxUrschx7iu+16DWxWUw1U2XUCMCjzUqsWH6d1cDnhw=; b=Xg/3ScjlKHzBVPraoOdvRylx/Tn9nPAYZ/C1gW38+Nx2ATB28UjFuCVf5e98y+tLOcG6TFzHy67F9QBjmX8aC9pHdqg0pHBMtg5eILTMjducJZa4IENErBHjNLmW5OFDQEgQHLPC5xBqYrd/UrOdze/mJmaiqA2w5Z3MTGbMPS4=
X-HE-Tag: 1795793877-61331
X-HE-Meta: U2FsdGVkX1/j7/71rCLaiFjDADFZc74Yp0prnXfCQBF4enA4f8rdECVF0ISe3Ly50emRXOf2HdrZLBLkoiuEGR+oJRbQMf1/i+XDUMlfnGYQLe0qCt97O5CoaW4hoC/F91l99iY/PiDqO+8+vTXQ/AqPP2NBByNBDH6ZeqAMh2ENM4PHzXqgryIcX89x6oAGO21F8xOdO8sPkf0hilILgoDsi/WPMta7T9oIZop3OuyFMZuh3Xa03sko/cmK1iz7ICGKr8JAtH6AwvAW+3SZ/GaNkx1chFRpRs88093QP1TiqPh96gshIMWlNhgBxJ8YToqfmwL7/M92MqAiLAblOPtD1GS54wKUZbI+XxSG0KneN+QExrohcDopEQ3txjhSmzlE8y/PHhCMFRNW5B4exSNDaEa0lMV25DdZfKhiKZWSY0+oQ1O26svscCbJSE0O+34Xusfmkes=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073816_941408_4920D871 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 20:52:56 -0800
Ian Rogers <irogers@google.com> wrote:

> There has been recent work on both MIPS and Alpha for perf events, so
> supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
> Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
> (according to https://endoflife.date/raspberry-pi ). It is
> out-of-scope here, but extending the kernel and verification
> infrastructure shouldn't be hard.

If it's not too much of a burden then sure. I've stopped supporting new
features in ftrace for x86 32bit a long time ago ;-)

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
