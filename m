Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86794C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 16:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532C220815
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 16:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GifbXsft";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f4P0CvMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532C220815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuBfZ1GIHbj0hjrizx+Q7H33qckTKJK+IwtUgIBKZT0=; b=GifbXsftfk+NW+
	ErTei8o4tUWTNC27l4dHf5EV3i55Te+TajO4yQeTu+Tyz1G1eD7RxUTwDv5krWCLpUgXrE4cfqGUa
	h8hj4ukZgqoqNKwng3xHPYP+sUWg8tszd8FwWFHfsUVbnkAeftIaMquUsp5EkKS7ogYcrC8dYmtPV
	B0XyJhylZRgoFyEmp3hjYXzOEYiETQ7KXGVnB5lnZdB3PvC/tLsEAbVqi8qULzlbIHnMcMsSLuEWR
	7faxnGHPsvYrANIulwn18XbB0BewwRZZ5QSQ4aDGoiwppcCYoIrIlvHsHvfIOXV+QPA1HnJEfOEZV
	s1nwWtX++RBhAe1YNGVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTUK9-00041w-B8; Wed, 22 May 2019 16:42:41 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTUK5-00040M-94
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 16:42:39 +0000
Received: by mail-io1-xd36.google.com with SMTP id p2so2415572iol.2
 for <linux-riscv@lists.infradead.org>; Wed, 22 May 2019 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=B/3Ppt3k79FNO2L/s3r4K1hzS09ALDDdjX6rER4lCro=;
 b=f4P0CvMHpuLDlbjjfUMOTq9Qi/+Qw0WM7wY8rz8dIRcipKJwr4oAstobMqGym6SyUt
 EoFoW3BNRiqr8pU2NT5HMGAqeKgalej1LduhOalQmYgIln7ZNxF2lYPNQ4TN1hAG3MRr
 tDWBguwD5+5qoCO4O6RhTKLvwTqLyE6alnuVX5UJCuP3VSGnG0eqewP2Z+XBGdgFhci7
 49CcxjIW7REI5a1Jx3ERdpj0YXoY4N2hkCJjhR88w2zUVrbYbNVFHdS6lSkglot+n4CC
 K8ZtJuzFneHLqOJg7nxifSjUFMMQF/VDBQX0Ibf80kgGIHgvYzLSChRxC7I1CW+mQJXM
 fy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=B/3Ppt3k79FNO2L/s3r4K1hzS09ALDDdjX6rER4lCro=;
 b=rQIrxXxXoPDTXVomyxr2Rp3U8ZC7OVRa2FHHjXVZvcRZ45pDFKT4OGep4GTzkejVT/
 aGCTSrU0uTPrmBithoXkH+4LvMnA1NOHHsoTBJWHZSefI/jbln8s6TPTkIXVYshmHJjc
 e0wZrLogSNhSkN0BtfpmIOKuqjdZJWvtM3B1El2R+WPDopzUEtME8Z/VD5taT8XI5SUi
 mEAthH3FDBj4kfrJOzuWbHnzqq545INJvlWuBXmYl3vAhIkWR0Tg4AIrpSb2fW0Df2Ek
 DNRzlkXAV7++8TIQzb7Ydq4vLnz3hf1QcSw7BSqBlQdcwpbCoa8UkhLE0D11vAEh7EsU
 oe9Q==
X-Gm-Message-State: APjAAAWx83nUD24x3iNv64SoOXZMctVJqBu62b249TB/F+qtPXjgG8L1
 vIquG/4FDyznA1373gq0PnIW9lCQfHU=
X-Google-Smtp-Source: APXvYqxiUSmNfc6a+lUQ9SpLf2nKodmdzjDr0DA+wl9S5b9OntsSpoLSg6auVmAgi7C+4nPH2cu+Uw==
X-Received: by 2002:a6b:c411:: with SMTP id y17mr18170495ioa.265.1558543356100; 
 Wed, 22 May 2019 09:42:36 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 k5sm7617211iob.32.2019.05.22.09.42.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 09:42:35 -0700 (PDT)
Date: Wed, 22 May 2019 09:42:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: 5.2-rc1 boot on Unleashed
In-Reply-To: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1905220942040.20842@viisi.sifive.com>
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_094237_385032_BB28990B 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 20 May 2019, Atish Patra wrote:

> @Paul, @Palmer: Can SiFive share the updated FSBL binary so that everybody can
> use the upstream clock drivers without having to rebuild FSBL by hand?

Am checking on this now and hope to have some conclusion on it this week.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
