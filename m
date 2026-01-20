Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B55CD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbMQFuHKA8csCgMZaVmUCkmXcTxKoKRfuVo4AhSuMRc=; b=b2sv2s8xCmMkXt
	CsR7VCVtmEoaZqDFSBiMR3nX/LFURwN/ifLJ7OUcpsgU7noNXl7RfS7ezTW51SrWwCqxLTuvLA3YZ
	WSih7+bVXnKFBtsuARiiZYvCvmuQWEwIN2FMFSfC3uB1GJ2WtYfsZ2ncrU22oYtznVUb+u1/0Kgmb
	BM8aUfJB9u/uhgFfsPC+Jzvm1eIBUIPtNQguROMmM9aIGAi40Ro1u7222QXK9AcEAFF6NDAytVbjD
	0fXNlne7Km2yCvwD0LYlYqqi6P5Rzt6k65PO+/8GtxSyJD2y+Ct4dpqVqlkrnMefzcY31fQPyUBlp
	NKpP5I4ydYYJqR4R0jCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6BC-00000003Lcr-0j6o;
	Tue, 20 Jan 2026 07:29:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6B9-00000003LcK-3Jbl
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894172; x=1800430172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFJg5Tsh5Y6kNkUdZJLetVy+n3IRkDCFbBgjrVHFpLI=;
  b=nB+OX6/u51wHtXFc/VNbVg4rZuFJcTstWJ5QCVlkvnxCUT4w0ycY5L+2
   WRC18faVFL0GTUaPRGhmW0eZ6XGmTAcTdjUR3wIlmEQM0JcUWx6sgutVy
   u4qH47lRAGZ2IigB6uzj0eVsJuaC9nkntevTZ9QmeK/kqcKey1XySDcpy
   8GBALZJycd7tRZJU8CanUa72em3wzn9N1YYnx8SVoRvMMW3UjyRiSa0aB
   Y5YtK0PvjkDdrCARqbf5kKxxWZ/3qe4Oj7iX6vevQuPT4WhXBSxYRP9/3
   KB2nxSpe4oFl3Qm6alOlareo/8HlzSwGQi4ucOnmpRJL/ZtGG7NHlYijl
   w==;
X-CSE-ConnectionGUID: 5O8tH8GAQRScqed8rwJSZg==
X-CSE-MsgGUID: uQ8fkHqjTkibmBC+ZG7OgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69296626"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69296626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:29:32 -0800
X-CSE-ConnectionGUID: UltLPqvTSwyYBl2JfJSQ5g==
X-CSE-MsgGUID: c7B9OWueQOqwxnDniRaxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210544968"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:29:26 -0800
Date: Tue, 20 Jan 2026 09:29:23 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 2/8] lib/string_kunit: add correctness test for strnlen
Message-ID: <aW8u0yaLT0Nr1kTW@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-3-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-3-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_232931_845615_35E8D587 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, Jan 20, 2026 at 02:58:46PM +0800, Feng Jiang wrote:
> Add a KUnit test for strnlen() to verify correctness across
> different string lengths and memory alignments.

Acked-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
