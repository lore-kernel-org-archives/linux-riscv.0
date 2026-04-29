Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B9BFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqY5PojdXSHLyIS0p5qqlOf4cEQVGXucFs64rLJ3coU=; b=nMO/PbAxC0lF5V
	hH0+uqn32eXNE8b8PdGAHCToEVkFM3NNxJD1NKJYQv6RRpVp47RWZDCHoddWk3Enn5CrAduG3LWX+
	XRW0cET1i4yceettLD3BbFPfLXdWu6MDz7p/C44xpPRDZXGNyyuUtaXyAaUiBpqv4FWJwpKx9TTT/
	tjAy1QnNaOtSVFQfhACLK4lPyj6HIxnA/KhdG4PFyT8TZioi+CC6e1yHpyX2+ge7CtnDw2pKQ3bVy
	RFT0rN7NkUHBekjWuywuqmghulWSKa/arsIxBASsbJDftNLTGr8wz9mm5Pcv+7uVi0n7eEqpsOxw+
	Ll8dM1vEa8nUrTqpqCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Mj-00000003TJH-0GCO;
	Wed, 29 Apr 2026 10:42:01 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Mh-00000003TIy-0Zbt
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 10:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459319; x=1808995319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=trmwBBkDWpO0fSOMjuM/vf1YShwF5t0TrTPuiUZYNA0=;
  b=U6cLAl90641CJoBONJhdnIv+XqOFEnzfdFlc7Ci5eY3DweRDrdb2BLEC
   I9TicppPtCUb1oF9aLLJx8BgEqAa/KY6RqTIHzrzQ1EFZ1zm9vcUScIiR
   Lq8mSIbRQqYHw7BdXHMqXRj+urH1a08EPIyTA+Rss61/aIMgV/nuWgEfs
   la3jQdrv/WAOXYud0tyNRRanMs3HmJPQshecPLDpRhI+SDe649+Si8ebr
   o0JlG/7wg9bgZ7TAx8ijUx3+ixiW/xExDC1b6U65nzlqna8tphHI+tmmy
   M+VhUsqXW4wtE2hHaeHWUSQIDF/5N3kWw1eMVkYi32owGds3SqaBkhOBk
   A==;
X-CSE-ConnectionGUID: atHE1lD8Td2Ttub23lGt2w==
X-CSE-MsgGUID: FKi0YtTDQX6aPQGDjmNCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95804155"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="95804155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:41:59 -0700
X-CSE-ConnectionGUID: krg+Q5ibSZ+1BXRewDGTRA==
X-CSE-MsgGUID: Yi3C6kuIQjan3QijMyh2Yw==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:41:55 -0700
Date: Wed, 29 Apr 2026 13:41:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
Message-ID: <afHgcBOV-CveGNTG@ashevche-desk.local>
References: <20260429-ultrarisc-serial-v6-0-b2c852e0c4c3@ultrarisc.com>
 <20260429-ultrarisc-serial-v6-1-b2c852e0c4c3@ultrarisc.com>
 <36efd2f5-d050-c613-77bf-dc651a94a586@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36efd2f5-d050-c613-77bf-dc651a94a586@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_034159_245049_CB54C79F 
X-CRM114-Status: UNSURE (   5.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 29, 2026 at 01:38:44PM +0300, Ilpo J=E4rvinen wrote:
> On Wed, 29 Apr 2026, Jia Wang wrote:

> Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

There is v7 already...

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
