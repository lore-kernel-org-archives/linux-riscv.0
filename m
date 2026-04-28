Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C1CFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dpb8LAcx2Fu3D7P84oX6pTQNcAaklrvMDAcvtpVsvFI=; b=fhv9dmXEkGlboC
	w/QdCyLmCxuXBndmoar8A9Lv16mCN4nQhwG7RdyfsbqY7osoKhQxdvV3oJRRZKF8bIn4V0BW7BU7Q
	sA72TsU7SX9ut3uNv7bbKVxCRlRQukiqTI7aypPqTaZln7JUg2DJ6wCPEtYyjCYVb8FMV5c8kuxZk
	i1f4ffd3ywRs3mmIJqztZ0grNRF1xjHWw6YJlaRLdSlggUJU7vbSKcvyTbTY10nXCAIdBJy37qnrD
	VbLKOuoqtju8djQF2sn9Kc9zcSTdBBrOBKtgupJg5KEetgaVvX3MQE4UoK/b9ZxqNGYXnlQpwoBKU
	P5Wk1drUbbfTtYvRT0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg9i-00000001EN5-2wYM;
	Tue, 28 Apr 2026 10:59:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg9h-00000001EMs-49mH
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Apr 2026 10:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tj3/gj8LE3DL9G1h9bpHxtv/ocVSxSDVXTVYDwuz9Sg=; b=Qg8hMeo5ePfIeOTWqovxDbT8UO
	hGkpikmgdRCRcynL+OH7N9ZXxQ0/2oGHv2tHvvaMtHpCqHz+3jQD0c/J9uBsehZvgIa06ZopW1ki2
	k3lDJsYOYnYNBpPa9afEJLAWFgAMfejbcz8r0IKg9zb8aShJD5G9fZtfhPrUxvF4Mg9jPo+mqRGXU
	qej+W9TT6vxYYjqj1VPHfnZEMxrM5QSDvoYArx47W0fiGp3URT5gs8/MF4KfIHSUF/bNRzPZ1vEgE
	mGYqf1ySs8RlggQSkhnYRWFBxfghY3dnihD85ic5QyrusuYN46jpPLY6wkY/BAcqNtN9+/NHrTHG4
	zETz/2QQ==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg9d-00000002mtP-0omS
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777373942; x=1808909942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MGoeypASKD4rtePXz/VKClp1Ph4phRySb1UqKEwoHIs=;
  b=TKWpOVoj+1Jy45fIFLtbOhkectWmXicCOMJIRu4/HJxb/eSydnDyXNOd
   1YRDr5Yx1MLY93lwxS3m49UF0NYB0HzvHxzRU+Bq0MZralPXXllf7/Kgw
   iySCc2pwc4/6Y2QK7CWxiYTNg8kOVJzzr19g3o+gwhz/yb7qGykb5ksCC
   H3pdomoJJ/ASY8hs1S47u/8m7hye7R0x73jF3fTCtl2cGgc1rt7WIGCbR
   ZHW2szVotTHOB3/tZNbmTRzfzEfhWB/+HxqVlW3DUEJskU/A8Klows38g
   nXKZMRNQZmMFIxST+Sq4sT3qYOqEqtmz6WnBsAlFsDAGMSFTGeKUGTn0a
   g==;
X-CSE-ConnectionGUID: IWX8YflkQl2NFDmmW6XgTQ==
X-CSE-MsgGUID: PgPRxtRxRpa8lYw05IpxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="81883652"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="81883652"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:58:59 -0700
X-CSE-ConnectionGUID: +MQNRSAzTpyEIDA78i1obA==
X-CSE-MsgGUID: JyjeK03hQvy4AyL355vWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="232914395"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:58:55 -0700
Date: Tue, 28 Apr 2026 13:58:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <afCS7GEG7gtyC7RH@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
 <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
 <177736726936.2886867.7725295920724488690.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177736726936.2886867.7725295920724488690.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_115901_724847_D5CEB27B 
X-CRM114-Status: GOOD (  10.11  )
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

On Tue, Apr 28, 2026 at 05:07:49PM +0800, Jia Wang wrote:
> On 2026-04-28 11:41 +0300, Ilpo J=E4rvinen wrote:
> > On Tue, 28 Apr 2026, Andy Shevchenko wrote:
> > > On Tue, Apr 28, 2026 at 01:26:27PM +0800, Jia Wang wrote:

...

> > #define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)			\
> > ({								\
> > 	typeof (size) __size =3D size;				\
> > 								\
> > 	static_assert(IS_ALIGNED((__size), 16));		\
> > 	static_assert(__size <=3D DW_UART_CPR_FIFO_MODE_MAX);	\
> > 								\
> > 	FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE, __size / 16);	\
> > })
> =

> Thanks. I tried that approach, but the statement-expression form does
> not work in this case because the helper is used in static initializers.
> So I'll keep it as a plain expression macro for now, and just rework it
> into a cleaner multi-line form.

Still you can move FIELD_PREP_CONST() into it.

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
