Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF99E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/n1qKV0tvxC9MuUBwonTmkiRIrA3IPEuE6qHCO/sRo=; b=wOs4RGUuJIWjOF
	i9UYO5P2eMnYpvLFKVyMlnog1G/QkEI5gAt8pPDouW5gkUx2bB5KsRfjYNg7CiUP/fWmFlX1R3GHW
	6Sso+a+yKw3cxYEFfvZkrHHU4D5O8rcIdTzbqN7Y4QuFCsCP5v9/xzRRFsqwsSN3JdbTIBSH4KGpO
	Zw2g2siq3GWRg//sj4XNBv46q036Gi9b0mThjp6IpEHYi4QmRAU0m2yEk2k5MkbvkpuMkbz1SwU63
	fMPll/bp1KtFyH/J8MR+jVGru8nVWfa7iP2lCBJU34LUQF6hJiw4GBWVUZJGLXs8NLkXQwTaxes8a
	Z2J1K26ln/C1pd98a32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTku7-0000000DUcX-0OqX;
	Fri, 03 Jan 2025 16:52:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTku4-0000000DUbl-0KFN
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 16:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CACBC5C64A7;
	Fri,  3 Jan 2025 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC42C4CECE;
	Fri,  3 Jan 2025 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735923122;
	bh=58khvkNUqxd3P2obZLHz4AGI382Z9+SOg3N/vpAAXRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8tBQsBkQUvmKhCM4rkYUmD1LZs/ZLSj7FPA+XimaQZxnVte6RolTuR22n2H7C3ls
	 W00WAwD2OdGN4h+XwJQlSlakVNIerPcqMlEe1P1Rmp/YgTke9U0M+GM//j10Ok51Xd
	 7Co8ZQHwQkWKx7C3a66zNP1NxXjeSDJoUdzaH6RKDs9iGmFhfrLqOjGd4aK6vpzO81
	 0L3gXIeVfEfRFtrV+PnuRBjkWQL+85qow8ulTuYI3EnWVQvSr8OTSfip9saalpc9Fw
	 MPkSVtppD8zh25QkUbxKoHKhR1y0FQ8yVH+NWZ6YwPFO9rldvgfFKrNTqIQyMxL8zI
	 1WPF+E6U6gKrg==
Date: Fri, 3 Jan 2025 13:51:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z3gVrzFd_2cacOFD@x1>
References: <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
 <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
 <Z2NNcy1jCLqb62h2@ghost>
 <CAP-5=fUBcu=Kd7StJvwdM_ArnSdOjmAcgR7NzDd+Ep8LrNMhyw@mail.gmail.com>
 <Z2N8WLTmh0ojIzhF@ghost>
 <Z3dBGM5L41v0RlZf@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z3dBGM5L41v0RlZf@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_085204_151928_E5D530EC 
X-CRM114-Status: GOOD (  16.41  )
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

On Thu, Jan 02, 2025 at 05:44:56PM -0800, Charlie Jenkins wrote:
> On Wed, Dec 18, 2024 at 05:52:24PM -0800, Charlie Jenkins wrote:
> > On Wed, Dec 18, 2024 at 05:20:15PM -0800, Ian Rogers wrote:
> > Yeah I agree. This test case did end up being interesting though as it
> > unconvered this change in behavior of objdump on riscv, but that's
> > tangential to the purpose of this test case. We need this patch on riscv
> > to stop this test from failing, but it is also reasonable to approach
> > this differently and not use objdump at all.
 
> What's the next step here? Would you prefer to get rid of this test
> entirely? I sent out a v3 that uses uname [1].
 
> Link
> https://lore.kernel.org/lkml/20241219-perf_fix_riscv_obj_reading-v3-1-a7d644dcfa50@rivosinc.com/
> [1]

I'm ok with this latest version and added it to perf-tools-next,
changing the patch subject line to:

  perf tests code-reading: Handle change in objdump output from binutils >= 2.41 on riscv

Ok?

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
